@interface DTXPCServiceController
+ (id)sharedInstance;
- (DTXPCServiceController)init;
- (int)_configureInstance:(id)a3 identifier:(id)a4 servicePid:(int)a5 environment:(id)a6 arguments:(id)a7 options:(id)a8;
- (void)_matchRemove:(id)a3;
- (void)_registryModify:(BOOL)a3 identifier:(id)a4 parent:(int)a5 client:(id)a6 block:(id)a7;
- (void)registerClient:(id)a3 forXPCService:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8;
- (void)releaseAssertionsMadeByClient:(id)a3;
- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8;
- (void)unregisterClient:(id)a3 withIdentifier:(id)a4 parent:(int)a5;
@end

@implementation DTXPCServiceController

+ (id)sharedInstance
{
  if (qword_100019690 != -1) {
    dispatch_once(&qword_100019690, &stru_100014E48);
  }
  v2 = (void *)qword_100019698;
  return v2;
}

- (DTXPCServiceController)init
{
  v10.receiver = self;
  v10.super_class = (Class)DTXPCServiceController;
  v2 = [(DTXPCServiceController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    registrationDictsByPid = v2->_registrationDictsByPid;
    v2->_registrationDictsByPid = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("XPCServiceController guard", 0);
    guard = v2->_guard;
    v2->_guard = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("XPCServiceController exec monitor", 0);
    execMonitorQueue = v2->_execMonitorQueue;
    v2->_execMonitorQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)releaseAssertionsMadeByClient:(id)a3
{
  id v3 = a3;
  if (sub_100008668() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2112;
    id v9 = v3;
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%@ releasing active assertions taken on behalf of client %@", (uint8_t *)&v6, 0x16u);
  }
  if (v3)
  {
    dispatch_queue_t v5 = +[DTAssertionManager sharedInstance];
    [v5 removeClaimsHeldByClient:v3];
  }
}

- (void)registerClient:(id)a3 forXPCService:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  id v111 = a3;
  id v112 = a4;
  id v108 = a5;
  id v109 = a6;
  id v14 = a7;
  v15 = (void (**)(id, id, void, uint64_t, uint64_t, id))a8;
  if (v15)
  {
    v102 = self;
    v106 = v15;
    id v16 = v112;
    unsigned int v101 = sub_100008668();
    v17 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_KillExistingKey[0]];
    unsigned __int8 v97 = [v17 isEqualToNumber:&__kCFBooleanFalse];

    v18 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_RequestingPidKey[0]];
    uint64_t v107 = (uint64_t)[v18 intValue];

    v19 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_OnceOnlyKey[0]];
    unsigned int v100 = [v19 BOOLValue];

    v20 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_EnableExtensionKey[0]];
    unsigned int v103 = [v20 isEqualToNumber:&__kCFBooleanTrue];

    v21 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]];
    unsigned __int8 v96 = [v21 isEqualToNumber:&__kCFBooleanTrue];

    uint64_t v105 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_AppExtensionHoldContainerBundleIDKey[0]];
    uint64_t v110 = [v14 objectForKeyedSubscript:DTProcessControlServiceOption_AppExtensionHoldContainerURLKey];
    if (!v103)
    {
      v104 = 0;
      goto LABEL_46;
    }
    if (!(v105 | v110))
    {
      v104 = 0;
      uint64_t v110 = 0;
      goto LABEL_46;
    }
    v98 = +[PKManager defaultManager];
    if (v105)
    {
      id v160 = 0;
      v22 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v105 allowPlaceholder:0 error:&v160];
      id v23 = v160;
      uint64_t v24 = [v22 URL];

      uint64_t v110 = v24;
      if (v23) {
        goto LABEL_19;
      }
    }
    else
    {
      id v23 = 0;
    }
    if (v110)
    {
      id v94 = v23;
      if (v101 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v110;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Hold Start %@:%@", buf, 0x16u);
      }
      id v159 = 0;
      v104 = [v98 holdPlugInsInApplication:v110 withError:&v159];
      id v95 = v159;
      unsigned int v25 = v101;
      if (!v95) {
        unsigned int v25 = 0;
      }
      if (v25 == 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v95;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Hold Error: %@", buf, 0xCu);
        }
      }
      else
      {
        v93 = +[NSBundle bundleWithURL:v110];
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        v26 = [v93 builtInPlugInsURL];
        v27 = [v26 relativePath];
        v28 = [v93 URLsForResourcesWithExtension:@"appex" subdirectory:v27];

        id v29 = [v28 countByEnumeratingWithState:&v155 objects:v190 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v156;
LABEL_26:
          uint64_t v31 = 0;
          while (1)
          {
            if (*(void *)v156 != v30) {
              objc_enumerationMutation(v28);
            }
            v32 = *(void **)(*((void *)&v155 + 1) + 8 * v31);
            v33 = +[NSBundle bundleWithURL:v32];
            v34 = [v33 bundleIdentifier];
            unsigned __int8 v35 = [v34 isEqualToString:v16];

            if (v35) {
              break;
            }
            if (v29 == (id)++v31)
            {
              id v29 = [v28 countByEnumeratingWithState:&v155 objects:v190 count:16];
              if (v29) {
                goto LABEL_26;
              }
              goto LABEL_32;
            }
          }
          id v36 = v32;

          if (!v36) {
            goto LABEL_42;
          }
          if (v101 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v16;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Terminate %@:%@", buf, 0x16u);
          }
          id v154 = 0;
          [v98 terminatePlugInAtURL:v36 withError:&v154];
          id v37 = v154;
          if (v37 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v95;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DTXPCServiceController: ExtensionAssertion Terminate Error: %@", buf, 0xCu);
          }
        }
        else
        {
LABEL_32:
          id v36 = v28;
        }

LABEL_42:
      }
      id v23 = v94;
      goto LABEL_45;
    }
LABEL_19:
    id v95 = 0;
    if (v23)
    {
      v104 = 0;
      if (v101)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v16;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v23;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: Error retrieving LSApplicationRecord for %@, %@", buf, 0x16u);
        }
        id v95 = 0;
        v104 = 0;
      }
    }
    else
    {
      v104 = 0;
    }
LABEL_45:

LABEL_46:
    unsigned __int8 v38 = [v16 containsString:@"LaunchDaemons"];
    unsigned __int8 v39 = [v16 containsString:@"LaunchAgents"];
    v40 = [v16 pathExtension];
    unsigned int v41 = [v40 isEqualToString:@"plist"];

    if (!v41)
    {
      id v46 = 0;
      id v99 = 0;
      goto LABEL_55;
    }
    if ((DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
    {
      NSErrorUserInfoKey v176 = NSLocalizedDescriptionKey;
      v54 = +[NSString stringWithFormat:@"Daemon profiling is not supported on customer installations."];
      *(void *)buf = v54;
      v55 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v176 count:1];
      id v45 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v55];

LABEL_108:
      if (v45)
      {
        v106[2](v106, v16, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v45);
        goto LABEL_110;
      }
      uint64_t v107 = 0xFFFFFFFFLL;
      id v45 = +[NSDictionary dictionaryWithContentsOfFile:v16];
      id v46 = [v45 objectForKeyedSubscript:@"Label"];

      v87 = [v45 objectForKeyedSubscript:@"Program"];
      v88 = v87;
      if (v87)
      {
        id v99 = v87;
      }
      else
      {
        v89 = [v45 objectForKeyedSubscript:@"ProgramArguments"];
        id v99 = [v89 firstObject];
      }
      if (!v46)
      {
        NSErrorUserInfoKey v188 = NSLocalizedDescriptionKey;
        v90 = +[NSString stringWithFormat:@"Failed to load plist for launchd job with path: %@", 0];
        v189 = v90;
        v91 = +[NSDictionary dictionaryWithObjects:&v189 forKeys:&v188 count:1];
        v92 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v91];
        v106[2](v106, 0, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v92);

        id v16 = v99;
        goto LABEL_110;
      }

      id v16 = v46;
LABEL_55:
      if ([v16 hasPrefix:@"com.apple."]
        && (DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
      {
        NSErrorUserInfoKey v186 = NSLocalizedDescriptionKey;
        v73 = +[NSString stringWithFormat:@"XPC service is restricted: %@", v16];
        v187 = v73;
        v74 = +[NSDictionary dictionaryWithObjects:&v187 forKeys:&v186 count:1];
        v75 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v74];
        v106[2](v106, v16, 0, v107, 0xFFFFFFFFLL, v75);

        id v45 = v46;
LABEL_110:

        v15 = v106;
        goto LABEL_111;
      }
      if (v107 == -1) {
        int v47 = 3;
      }
      else {
        int v47 = 1;
      }
      if (sub_100008668() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v47;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v16;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v107 & ~((int)v107 >> 31);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: calling xpc_service_create: serviceType=%d, identifier=%@, pid %d", buf, 0x18u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v183 = sub_100009D94;
      v184 = sub_100009DA4;
      id v185 = 0;
      NSErrorUserInfoKey v176 = 0;
      v177 = &v176;
      uint64_t v178 = 0x3032000000;
      v179 = sub_100009D94;
      v180 = sub_100009DA4;
      id v181 = 0;
      NSErrorUserInfoKey v172 = 0;
      v173 = &v172;
      uint64_t v174 = 0x2020000000;
      char v175 = 0;
      guard = v102->_guard;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009DAC;
      block[3] = &unk_100014E98;
      block[4] = v102;
      id v16 = v16;
      id v141 = v16;
      int v148 = v107;
      id v49 = v111;
      id v142 = v49;
      v145 = &v172;
      char v150 = 1;
      unsigned __int8 v151 = v38;
      unsigned __int8 v152 = v39;
      v50 = v106;
      id v144 = v50;
      id v45 = v46;
      id v143 = v45;
      v146 = buf;
      int v149 = v47;
      v147 = &v176;
      char v153 = v100;
      dispatch_sync(guard, block);
      if (*((unsigned char *)v173 + 24))
      {
        NSErrorUserInfoKey v170 = NSLocalizedDescriptionKey;
        id v51 = +[NSString stringWithFormat:@"XPC service name %@ already under observation for pid: %d", v16, v107];
        id v171 = v51;
        v52 = +[NSDictionary dictionaryWithObjects:&v171 forKeys:&v170 count:1];
        v53 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v52];
        v50[2](v50, v16, 0, v107, 0xFFFFFFFFLL, v53);

LABEL_104:
        _Block_object_dispose(&v172, 8);
        _Block_object_dispose(&v176, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_110;
      }
      if (!*(void *)(*(void *)&buf[8] + 40) && !v177[5])
      {
        NSErrorUserInfoKey v168 = NSLocalizedDescriptionKey;
        id v51 = +[NSString stringWithFormat:@"Unable to create xpc registration object."];
        id v169 = v51;
        v52 = +[NSDictionary dictionaryWithObjects:&v169 forKeys:&v168 count:1];
        v84 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v52];
        v50[2](v50, v16, 0, v107, 0xFFFFFFFFLL, v84);

        goto LABEL_104;
      }
      id v51 = objc_retainBlock(v50);
      if (v100)
      {
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472;
        v135[2] = sub_10000A304;
        v135[3] = &unk_100014EE8;
        v138 = v50;
        v135[4] = v102;
        id v136 = v49;
        id v137 = v16;
        int v139 = v107;
        v56 = objc_retainBlock(v135);

        id v51 = v56;
      }
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        NSErrorUserInfoKey v162 = NSLocalizedDescriptionKey;
        id v76 = v16;
        v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unable to register for xpc-based launch: %s (parent: %d)", [v76 UTF8String], v107);
        v163 = v52;
        v77 = +[NSDictionary dictionaryWithObjects:&v163 forKeys:&v162 count:1];
        v78 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v77];
        (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v51 + 2))(v51, v76, 0, v107, 0xFFFFFFFFLL, v78);

        goto LABEL_104;
      }
      char v57 = v97;
      if ((int)v107 > 0) {
        char v57 = 1;
      }
      if ((v57 & 1) == 0)
      {
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v131 = sub_10000A3E8;
        v132 = &unk_100014F10;
        id v133 = v99;
        id v134 = v16;
        v58 = v130;
        size_t v161 = 0;
        *(_DWORD *)&v191[8] = 0;
        *(void *)v191 = 0xE00000001;
        sysctl((int *)v191, 3u, 0, &v161, 0, 0);
        v161 += 50;
        v59 = (char *)malloc_type_calloc(1uLL, v161, 0xF47FF19uLL);
        if (!sysctl((int *)v191, 3u, v59, &v161, 0, 0) && (int)(v161 / 0x288) >= 1)
        {
          uint64_t v60 = (v161 / 0x288);
          v61 = v59 + 243;
          do
          {
            ((void (*)(void *, void, char *, void, void))v131)(v58, *(unsigned int *)(v61 - 203), v61, *(unsigned int *)(v61 + 153), *(unsigned int *)(v61 + 161));
            v61 += 648;
            --v60;
          }
          while (v60);
        }
        free(v59);
      }
      v118[1] = _NSConcreteStackBlock;
      v118[2] = (id)3221225472;
      v118[3] = sub_10000A55C;
      v118[4] = &unk_100014F88;
      char v127 = v101;
      id v63 = v16;
      id v119 = v63;
      id v120 = v14;
      unsigned __int8 v128 = v96;
      id v64 = v49;
      id v121 = v64;
      v122 = v102;
      id v123 = v108;
      id v124 = v109;
      id v51 = v51;
      id v125 = v51;
      int v126 = v107;
      char v129 = v97 ^ 1;
      xpc_service_set_attach_handler();
      if (v104)
      {
        if (v101 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v191 = 138412290;
          *(void *)&v191[4] = v63;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Release Start %@", v191, 0xCu);
        }
        v65 = +[PKManager defaultManager];
        v118[0] = 0;
        [v65 releaseHold:v104 withError:v118];
        id v66 = v118[0];

        unsigned int v67 = v101;
        if (!v66) {
          unsigned int v67 = 0;
        }
        if (v67 == 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v191 = 138412290;
          *(void *)&v191[4] = v66;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Release Error: %@", v191, 0xCu);
        }
      }
      if (v45)
      {
        if (!xpc_service_kickstart_with_flags())
        {
LABEL_102:

          v52 = v119;
          goto LABEL_104;
        }
        if (v101)
        {
          id v68 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            uint64_t v69 = xpc_strerror();
            *(_DWORD *)v191 = 136315138;
            *(void *)&v191[4] = v69;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "xpc_service_kickstart_with_flags error: %s", v191, 0xCu);
          }
        }
        NSErrorUserInfoKey v166 = NSLocalizedDescriptionKey;
        v70 = +[NSString stringWithFormat:@"Unable to launch: %@ (parent: %d) Error: %s", v63, v107, xpc_strerror()];
        v167 = v70;
        v71 = +[NSDictionary dictionaryWithObjects:&v167 forKeys:&v166 count:1];
        v72 = +[NSError errorWithDomain:@"DTXPCServiceController" code:3 userInfo:v71];
        (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v51 + 2))(v51, v63, 0, v107, 0xFFFFFFFFLL, v72);
      }
      else
      {
        if (![v63 length] || !v103) {
          goto LABEL_102;
        }
        v79 = +[PKHost defaultHost];
        uint64_t v164 = PKIdentifierAttribute;
        id v165 = v63;
        v80 = +[NSDictionary dictionaryWithObjects:&v165 forKeys:&v164 count:1];
        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_10000AF08;
        v115[3] = &unk_100014FB0;
        id v81 = v63;
        id v116 = v81;
        char v117 = v103;
        v82 = [v79 continuouslyDiscoverPlugInsForAttributes:v80 flags:512 found:v115];

        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472;
        v113[2] = sub_10000B0D4;
        v113[3] = &unk_100014FD8;
        id v83 = v82;
        id v114 = v83;
        [(DTXPCServiceController *)v102 _registryModify:1 identifier:v81 parent:v107 client:v64 block:v113];

        v70 = v116;
      }

      goto LABEL_102;
    }
    *(void *)buf = 1024;
    id v42 = [objc_alloc((Class)NSMutableData) initWithLength:1024];
    if (sysctlbyname("kern.bootargs", [v42 mutableBytes], (size_t *)buf, 0, 0))
    {
      perror("sysctlbyname(\"kern.bootargs\",...)");
      v44 = 0;
    }
    else
    {
      [v42 setLength:*(void *)buf];
      id v43 = [objc_alloc((Class)NSString) initWithData:v42 encoding:4];
      v44 = v43;
      if (v43
        && ([v43 rangeOfString:@"amfi_unrestrict_task_for_pid=1"] != (id)0x7FFFFFFFFFFFFFFFLL
         || [v44 rangeOfString:@"amfi=3"] != (id)0x7FFFFFFFFFFFFFFFLL
         || [v44 rangeOfString:@"amfi_get_out_of_my_way=1"] != (id)0x7FFFFFFFFFFFFFFFLL))
      {
        id v45 = 0;
LABEL_107:

        goto LABEL_108;
      }
    }
    NSErrorUserInfoKey v172 = NSLocalizedDescriptionKey;
    +[NSString stringWithFormat:@"amfi_unrestrict_task_for_pid=1 is required in your boot-args to profile daemons or agents."];
    v85 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSErrorUserInfoKey v176 = v85;
    v86 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v172 count:1];
    id v45 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v86];

    goto LABEL_107;
  }
LABEL_111:
}

- (int)_configureInstance:(id)a3 identifier:(id)a4 servicePid:(int)a5 environment:(id)a6 arguments:(id)a7 options:(id)a8
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a8;
  unsigned int v13 = sub_100008668();
  id v14 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_LeaveSuspendedKey[0]];
  unsigned __int8 v15 = [v14 isEqualToNumber:&__kCFBooleanFalse];

  BOOL ShouldCaptureOutputWithOptions = DTProcessShouldCaptureOutputWithOptions(v12);
  v17 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]];

  unsigned int v18 = [v17 isEqualToNumber:&__kCFBooleanTrue];
  if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "xpc_service_instance_is_configurable(): true", buf, 2u);
  }
  if ([v11 count])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000B42C;
    v22[3] = &unk_100015000;
    id v23 = xpc_dictionary_create(0, 0, 0);
    id v19 = v23;
    [v11 enumerateKeysAndObjectsUsingBlock:v22];
    xpc_service_instance_set_environment();
  }
  if (ShouldCaptureOutputWithOptions && !pipe((int *)buf))
  {
    xpc_service_instance_dup2();
    xpc_service_instance_dup2();
    int v20 = *(_DWORD *)buf;
    close(v25);
    fcntl(v20, 2, 1);
    if (v15) {
      goto LABEL_9;
    }
  }
  else
  {
    int v20 = -1;
    if (v15)
    {
LABEL_9:
      if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "xpc launch: started *not* suspended", buf, 2u);
      }
      goto LABEL_17;
    }
  }
  if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "xpc launch: starting suspended", buf, 2u);
  }
  xpc_service_instance_set_start_suspended();
LABEL_17:
  if (v18) {
    xpc_service_instance_set_jetsam_properties();
  }

  return v20;
}

- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  sub_100008668();
  id v17 = v12;
  [v17 UTF8String];
  unsigned int v18 = (void *)xpc_service_create_from_specifier();
  if (v18)
  {
    id v22 = v17;
    id v23 = v14;
    id v24 = v15;
    id v27 = v16;
    id v25 = v13;
    id v26 = v18;
    xpc_service_set_attach_handler();
    xpc_service_kickstart_with_flags();
  }
  else
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    id v19 = +[NSString stringWithFormat:@"Unable to find service with specifier '%@'.", v17];
    id v29 = v19;
    int v20 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v21 = +[NSError errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v20];
    (*((void (**)(id, id, void, void, uint64_t, void *))v16 + 2))(v16, v17, 0, 0, 0xFFFFFFFFLL, v21);
  }
}

- (void)_registryModify:(BOOL)a3 identifier:(id)a4 parent:(int)a5 client:(id)a6 block:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000BA48;
  v20[3] = &unk_100015078;
  v20[4] = self;
  id v15 = v13;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  int v24 = a5;
  id v17 = v14;
  id v23 = v17;
  unsigned int v18 = objc_retainBlock(v20);
  id v19 = v18;
  if (v10) {
    dispatch_sync((dispatch_queue_t)self->_guard, v18);
  }
  else {
    ((void (*)(void *))v18[2])(v18);
  }
}

- (void)_matchRemove:(id)a3
{
  id v4 = a3;
  registrationDictsByPid = self->_registrationDictsByPid;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BD28;
  v7[3] = &unk_1000150C8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)registrationDictsByPid enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)unregisterClient:(id)a3 withIdentifier:(id)a4 parent:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  guard = self->_guard;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C0C8;
  v13[3] = &unk_1000150F0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(guard, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_execMonitorQueue, 0);
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong((id *)&self->_registrationDictsByPid, 0);
}

@end