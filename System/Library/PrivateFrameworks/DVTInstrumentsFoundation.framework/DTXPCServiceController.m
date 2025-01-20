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
  if (qword_268708050 != -1) {
    dispatch_once(&qword_268708050, &unk_26E5157C8);
  }
  v2 = (void *)qword_268708058;
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
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (sub_2308E91CC() && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2112;
    id v9 = v3;
    id v4 = v7;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "%@ releasing active assertions taken on behalf of client %@", (uint8_t *)&v6, 0x16u);
  }
  if (v3)
  {
    dispatch_queue_t v5 = +[DTAssertionManager sharedInstance];
    [v5 removeClaimsHeldByClient:v3];
  }
}

- (void)registerClient:(id)a3 forXPCService:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  uint64_t v222 = *MEMORY[0x263EF8340];
  id v135 = a3;
  id v136 = a4;
  id v132 = a5;
  id v133 = a6;
  id v137 = a7;
  v14 = (void (**)(id, id, void, uint64_t, uint64_t, id))a8;
  if (v14)
  {
    v126 = self;
    v131 = v14;
    id v15 = v136;
    int v125 = sub_2308E91CC();
    v16 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_KillExistingKey[0]];
    char v121 = [v16 isEqualToNumber:MEMORY[0x263EFFA80]];

    v17 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_RequestingPidKey[0]];
    uint64_t v130 = [v17 intValue];

    v18 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_OnceOnlyKey[0]];
    int v124 = [v18 BOOLValue];

    v19 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_EnableExtensionKey[0]];
    int v127 = [v19 isEqualToNumber:MEMORY[0x263EFFA88]];

    v20 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]];
    char v120 = [v20 isEqualToNumber:MEMORY[0x263EFFA88]];

    uint64_t v129 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_AppExtensionHoldContainerBundleIDKey[0]];
    uint64_t v134 = [v137 objectForKeyedSubscript:DTProcessControlServiceOption_AppExtensionHoldContainerURLKey];
    if (!v127)
    {
      v128 = 0;
      goto LABEL_47;
    }
    if (!(v129 | v134))
    {
      v128 = 0;
      uint64_t v134 = 0;
      goto LABEL_47;
    }
    id v122 = [MEMORY[0x263F5E718] defaultManager];
    if (v129)
    {
      id v188 = 0;
      v21 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v129 allowPlaceholder:0 error:&v188];
      id v22 = v188;
      uint64_t v23 = [v21 URL];

      uint64_t v134 = v23;
      if (v22) {
        goto LABEL_20;
      }
    }
    else
    {
      id v22 = 0;
    }
    if (v134)
    {
      id v118 = v22;
      if (v125 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v134;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Hold Start %@:%@", buf, 0x16u);
      }
      id v187 = 0;
      v128 = [v122 holdPlugInsInApplication:v134 withError:&v187];
      id v119 = v187;
      if (v119) {
        int v24 = v125;
      }
      else {
        int v24 = 0;
      }
      if (v24 == 1)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v119;
          _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Hold Error: %@", buf, 0xCu);
        }
      }
      else
      {
        v116 = [MEMORY[0x263F086E0] bundleWithURL:v134];
        long long v185 = 0u;
        long long v186 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        v25 = [v116 builtInPlugInsURL];
        v26 = [v25 relativePath];
        v27 = [v116 URLsForResourcesWithExtension:@"appex" subdirectory:v26];

        uint64_t v28 = [v27 countByEnumeratingWithState:&v183 objects:v220 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v184;
LABEL_27:
          uint64_t v30 = 0;
          while (1)
          {
            if (*(void *)v184 != v29) {
              objc_enumerationMutation(v27);
            }
            v31 = *(void **)(*((void *)&v183 + 1) + 8 * v30);
            v32 = [MEMORY[0x263F086E0] bundleWithURL:v31];
            v33 = [v32 bundleIdentifier];
            char v34 = [v33 isEqualToString:v15];

            if (v34) {
              break;
            }
            if (v28 == ++v30)
            {
              uint64_t v28 = [v27 countByEnumeratingWithState:&v183 objects:v220 count:16];
              if (v28) {
                goto LABEL_27;
              }
              goto LABEL_33;
            }
          }
          id v35 = v31;

          if (!v35) {
            goto LABEL_43;
          }
          if (v125 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Terminate %@:%@", buf, 0x16u);
          }
          id v182 = 0;
          [v122 terminatePlugInAtURL:v35 withError:&v182];
          id v36 = v182;
          if (v36 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v119;
            _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "DTXPCServiceController: ExtensionAssertion Terminate Error: %@", buf, 0xCu);
          }
        }
        else
        {
LABEL_33:
          id v35 = v27;
        }

LABEL_43:
      }
      id v22 = v118;
      goto LABEL_46;
    }
LABEL_20:
    id v119 = 0;
    if (v22)
    {
      v128 = 0;
      if (v125)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v22;
          _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: Error retrieving LSApplicationRecord for %@, %@", buf, 0x16u);
        }
        id v119 = 0;
        v128 = 0;
      }
    }
    else
    {
      v128 = 0;
    }
LABEL_46:

LABEL_47:
    char v37 = [v15 containsString:@"LaunchDaemons"];
    char v38 = [v15 containsString:@"LaunchAgents"];
    v39 = [v15 pathExtension];
    int v40 = [v39 isEqualToString:@"plist"];

    if (!v40)
    {
      id v45 = 0;
      id v46 = 0;
      v47 = v15;
      goto LABEL_56;
    }
    if ((DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
    {
      v58 = (void *)MEMORY[0x263F087E8];
      v206 = (void *)*MEMORY[0x263F08320];
      v59 = [NSString stringWithFormat:@"Daemon profiling is not supported on customer installations."];
      *(void *)buf = v59;
      v60 = [NSDictionary dictionaryWithObjects:buf forKeys:&v206 count:1];
      id v44 = [v58 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v60];

LABEL_113:
      if (v44)
      {
        v131[2](v131, v15, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v44);
        goto LABEL_115;
      }
      uint64_t v130 = 0xFFFFFFFFLL;
      id v44 = [NSDictionary dictionaryWithContentsOfFile:v15];
      id v45 = [v44 objectForKeyedSubscript:@"Label"];

      v109 = [v44 objectForKeyedSubscript:@"Program"];
      v110 = v109;
      if (v109)
      {
        id v46 = v109;
      }
      else
      {
        v111 = [v44 objectForKeyedSubscript:@"ProgramArguments"];
        id v46 = [v111 firstObject];
      }
      if (!v45)
      {
        v112 = (void *)MEMORY[0x263F087E8];
        uint64_t v218 = *MEMORY[0x263F08320];
        v113 = [NSString stringWithFormat:@"Failed to load plist for launchd job with path: %@", 0];
        v219 = v113;
        v114 = [NSDictionary dictionaryWithObjects:&v219 forKeys:&v218 count:1];
        v115 = [v112 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v114];
        v131[2](v131, 0, 0, 0xFFFFFFFFLL, 0xFFFFFFFFLL, v115);

        id v15 = v46;
        goto LABEL_115;
      }

      v47 = v45;
LABEL_56:
      if ([v47 hasPrefix:@"com.apple."]
        && (DVTIUIsAppleInternalOSEnvironment() & 1) == 0)
      {
        v82 = (void *)MEMORY[0x263F087E8];
        uint64_t v216 = *MEMORY[0x263F08320];
        v83 = [NSString stringWithFormat:@"XPC service is restricted: %@", v47];
        v217 = v83;
        v84 = [NSDictionary dictionaryWithObjects:&v217 forKeys:&v216 count:1];
        v85 = [v82 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v84];
        v131[2](v131, v47, 0, v130, 0xFFFFFFFFLL, v85);

        id v44 = v45;
        id v15 = v47;
LABEL_115:

        v14 = v131;
        goto LABEL_116;
      }
      if (v130 == -1) {
        int v48 = 3;
      }
      else {
        int v48 = 1;
      }
      v117 = v15;
      if (sub_2308E91CC() && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v48;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v47;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v130 & ~((int)v130 >> 31);
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: calling xpc_service_create: serviceType=%d, identifier=%@, pid %d", buf, 0x18u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v213 = sub_2308EAA78;
      v214 = sub_2308EAA88;
      id v215 = 0;
      v206 = 0;
      v207 = &v206;
      uint64_t v208 = 0x3032000000;
      v209 = sub_2308EAA78;
      v210 = sub_2308EAA88;
      id v211 = 0;
      uint64_t v202 = 0;
      v203 = &v202;
      uint64_t v204 = 0x2020000000;
      char v205 = 0;
      guard = v126->_guard;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2308EAA90;
      block[3] = &unk_264B8F918;
      block[4] = v126;
      id v50 = v47;
      id v169 = v50;
      int v176 = v130;
      id v51 = v135;
      id v170 = v51;
      v173 = &v202;
      char v178 = 1;
      char v179 = v37;
      char v180 = v38;
      v52 = v131;
      id v172 = v52;
      id v44 = v45;
      id v171 = v44;
      v174 = buf;
      int v177 = v48;
      v175 = &v206;
      char v181 = v124;
      dispatch_sync(guard, block);
      id v123 = v50;
      if (*((unsigned char *)v203 + 24))
      {
        v53 = (void *)MEMORY[0x263F087E8];
        uint64_t v200 = *MEMORY[0x263F08320];
        [NSString stringWithFormat:@"XPC service name %@ already under observation for pid: %d", v50, v130];
        v54 = v46;
        id v55 = (id)objc_claimAutoreleasedReturnValue();
        id v201 = v55;
        v56 = [NSDictionary dictionaryWithObjects:&v201 forKeys:&v200 count:1];
        v57 = [v53 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v56];
        v52[2](v52, v123, 0, v130, 0xFFFFFFFFLL, v57);

LABEL_109:
        _Block_object_dispose(&v202, 8);
        _Block_object_dispose(&v206, 8);

        _Block_object_dispose(buf, 8);
        id v15 = v123;
        goto LABEL_115;
      }
      v54 = v46;
      if (!*(void *)(*(void *)&buf[8] + 40) && !v207[5])
      {
        v99 = (void *)MEMORY[0x263F087E8];
        uint64_t v198 = *MEMORY[0x263F08320];
        id v55 = [NSString stringWithFormat:@"Unable to create xpc registration object."];
        id v199 = v55;
        v56 = [NSDictionary dictionaryWithObjects:&v199 forKeys:&v198 count:1];
        v100 = [v99 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v56];
        v52[2](v52, v123, 0, v130, 0xFFFFFFFFLL, v100);

        goto LABEL_109;
      }
      id v55 = _Block_copy(v52);
      if (v124)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_2308EAFE8;
        aBlock[3] = &unk_264B8F968;
        v166 = v52;
        aBlock[4] = v126;
        id v164 = v51;
        id v165 = v123;
        int v167 = v130;
        v61 = _Block_copy(aBlock);

        id v55 = v61;
      }
      uint64_t v62 = v130;
      v63 = v123;
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        v86 = v207[5];
        if (v86)
        {
          uint64_t v87 = [v117 UTF8String];
          v138[0] = MEMORY[0x263EF8330];
          v138[1] = 3221225472;
          v138[2] = sub_2308EBE28;
          v138[3] = &unk_264B8FA80;
          id v55 = v55;
          id v139 = v55;
          int v140 = v130;
          if (authorized_xpc_attach(v86, 0, v87, (uint64_t)v132, (uint64_t)v133, (uint64_t)v137, v138))
          {
            v88 = (void *)MEMORY[0x263F087E8];
            uint64_t v192 = *MEMORY[0x263F08320];
            v89 = NSString;
            id v90 = v123;
            v91 = [v89 stringWithFormat:@"Unable to use privileged helper to register for xpc-based launch: %s (parent: %d)", [v90 UTF8String], v130];
            v193 = v91;
            v92 = [NSDictionary dictionaryWithObjects:&v193 forKeys:&v192 count:1];
            v93 = [v88 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v92];
            (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v55 + 2))(v55, v90, 0, v130, 0xFFFFFFFFLL, v93);
          }
          v56 = v139;
        }
        else
        {
          v101 = (void *)MEMORY[0x263F087E8];
          uint64_t v190 = *MEMORY[0x263F08320];
          v102 = NSString;
          id v103 = v123;
          v56 = [v102 stringWithFormat:@"Unable to register for xpc-based launch: %s (parent: %d)", objc_msgSend(v103, "UTF8String"), v130];
          v191 = v56;
          v104 = [NSDictionary dictionaryWithObjects:&v191 forKeys:&v190 count:1];
          v105 = [v101 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v104];
          (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v55 + 2))(v55, v103, 0, v130, 0xFFFFFFFFLL, v105);
        }
        goto LABEL_109;
      }
      char v64 = v121;
      if ((int)v130 > 0) {
        char v64 = 1;
      }
      if ((v64 & 1) == 0)
      {
        v158[0] = MEMORY[0x263EF8330];
        v158[1] = 3221225472;
        v159 = sub_2308EB0CC;
        v160 = &unk_264B8F990;
        id v161 = v46;
        id v162 = v123;
        v65 = v158;
        size_t v189 = 0;
        *(_DWORD *)&v221[8] = 0;
        *(void *)v221 = 0xE00000001;
        sysctl((int *)v221, 3u, 0, &v189, 0, 0);
        v189 += 50;
        v66 = (char *)malloc_type_calloc(1uLL, v189, 0xF47FF19uLL);
        if (!sysctl((int *)v221, 3u, v66, &v189, 0, 0) && (int)(v189 / 0x288) >= 1)
        {
          uint64_t v67 = (v189 / 0x288);
          v68 = v66 + 243;
          do
          {
            v69 = (void *)MEMORY[0x230FC2180]();
            ((void (*)(void *, void, char *, void, void))v159)(v65, *(unsigned int *)(v68 - 203), v68, *(unsigned int *)(v68 + 153), *(unsigned int *)(v68 + 161));
            v68 += 648;
            --v67;
          }
          while (v67);
        }
        free(v66);

        uint64_t v62 = v130;
        v63 = v123;
      }
      v146[1] = (id)MEMORY[0x263EF8330];
      v146[2] = (id)3221225472;
      v146[3] = sub_2308EB240;
      v146[4] = &unk_264B8FA08;
      char v155 = v125;
      id v70 = v63;
      id v147 = v70;
      id v148 = v137;
      char v156 = v120;
      id v71 = v51;
      id v149 = v71;
      v150 = v126;
      id v151 = v132;
      id v152 = v133;
      id v55 = v55;
      id v153 = v55;
      int v154 = v62;
      char v157 = v121 ^ 1;
      xpc_service_set_attach_handler();
      if (v128)
      {
        if (v125 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v221 = 138412290;
          *(void *)&v221[4] = v70;
          _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Release Start %@", v221, 0xCu);
        }
        v72 = [MEMORY[0x263F5E718] defaultManager];
        v146[0] = 0;
        [v72 releaseHold:v128 withError:v146];
        id v73 = v146[0];

        int v74 = v125;
        if (!v73) {
          int v74 = 0;
        }
        if (v74 == 1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v221 = 138412290;
          *(void *)&v221[4] = v73;
          _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "DTXPCServiceController: ExtensionAssertion Release Error: %@", v221, 0xCu);
        }

        uint64_t v62 = v130;
      }
      if (v44)
      {
        if (!xpc_service_kickstart_with_flags())
        {
LABEL_106:

          v56 = v147;
          goto LABEL_109;
        }
        if (v125)
        {
          v75 = MEMORY[0x263EF8438];
          id v76 = MEMORY[0x263EF8438];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            uint64_t v77 = xpc_strerror();
            *(_DWORD *)v221 = 136315138;
            *(void *)&v221[4] = v77;
            _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "xpc_service_kickstart_with_flags error: %s", v221, 0xCu);
          }

          uint64_t v62 = v130;
        }
        v78 = (void *)MEMORY[0x263F087E8];
        uint64_t v196 = *MEMORY[0x263F08320];
        v79 = [NSString stringWithFormat:@"Unable to launch: %@ (parent: %d) Error: %s", v70, v62, xpc_strerror()];
        v197 = v79;
        v80 = [NSDictionary dictionaryWithObjects:&v197 forKeys:&v196 count:1];
        v81 = [v78 errorWithDomain:@"DTXPCServiceController" code:3 userInfo:v80];
        (*((void (**)(id, id, void, uint64_t, uint64_t, void *))v55 + 2))(v55, v70, 0, v62, 0xFFFFFFFFLL, v81);
      }
      else
      {
        if (![v70 length] || !v127) {
          goto LABEL_106;
        }
        v94 = [MEMORY[0x263F5E710] defaultHost];
        uint64_t v194 = *MEMORY[0x263F5E728];
        id v195 = v70;
        v95 = [NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];
        v143[0] = MEMORY[0x263EF8330];
        v143[1] = 3221225472;
        v143[2] = sub_2308EBBEC;
        v143[3] = &unk_264B8FA30;
        id v96 = v70;
        id v144 = v96;
        char v145 = v127;
        v97 = [v94 continuouslyDiscoverPlugInsForAttributes:v95 flags:512 found:v143];

        v141[0] = MEMORY[0x263EF8330];
        v141[1] = 3221225472;
        v141[2] = sub_2308EBDB8;
        v141[3] = &unk_264B8FA58;
        id v98 = v97;
        id v142 = v98;
        [(DTXPCServiceController *)v126 _registryModify:1 identifier:v96 parent:v130 client:v71 block:v141];

        v79 = v144;
      }

      goto LABEL_106;
    }
    *(void *)buf = 1024;
    id v41 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:1024];
    if (sysctlbyname("kern.bootargs", (void *)[v41 mutableBytes], (size_t *)buf, 0, 0))
    {
      perror("sysctlbyname(\"kern.bootargs\",...)");
      v43 = 0;
    }
    else
    {
      [v41 setLength:*(void *)buf];
      v42 = (void *)[[NSString alloc] initWithData:v41 encoding:4];
      v43 = v42;
      if (v42
        && ([v42 rangeOfString:@"amfi_unrestrict_task_for_pid=1"] != 0x7FFFFFFFFFFFFFFFLL
         || [v43 rangeOfString:@"amfi=3"] != 0x7FFFFFFFFFFFFFFFLL
         || [v43 rangeOfString:@"amfi_get_out_of_my_way=1"] != 0x7FFFFFFFFFFFFFFFLL))
      {
        id v44 = 0;
LABEL_112:

        goto LABEL_113;
      }
    }
    v106 = (void *)MEMORY[0x263F087E8];
    uint64_t v202 = *MEMORY[0x263F08320];
    v107 = [NSString stringWithFormat:@"amfi_unrestrict_task_for_pid=1 is required in your boot-args to profile daemons or agents."];
    v206 = v107;
    v108 = [NSDictionary dictionaryWithObjects:&v206 forKeys:&v202 count:1];
    id v44 = [v106 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v108];

    goto LABEL_112;
  }
LABEL_116:
}

- (int)_configureInstance:(id)a3 identifier:(id)a4 servicePid:(int)a5 environment:(id)a6 arguments:(id)a7 options:(id)a8
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a8;
  int v13 = sub_2308E91CC();
  v14 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_LeaveSuspendedKey[0]];
  char v15 = [v14 isEqualToNumber:MEMORY[0x263EFFA80]];

  BOOL ShouldCaptureOutputWithOptions = DTProcessShouldCaptureOutputWithOptions(v12);
  v17 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_DisableMemoryLimitsKey[0]];

  int v18 = [v17 isEqualToNumber:MEMORY[0x263EFFA88]];
  if (v13 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "xpc_service_instance_is_configurable(): true", buf, 2u);
  }
  if ([v11 count])
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = sub_2308EC19C;
    v23[3] = &unk_264B8FAA8;
    id v24 = v19;
    id v20 = v19;
    [v11 enumerateKeysAndObjectsUsingBlock:v23];
    xpc_service_instance_set_environment();
  }
  if (ShouldCaptureOutputWithOptions && !pipe((int *)buf))
  {
    xpc_service_instance_dup2();
    xpc_service_instance_dup2();
    int v21 = *(_DWORD *)buf;
    close(v26);
    fcntl(v21, 2, 1);
    if (v15) {
      goto LABEL_9;
    }
  }
  else
  {
    int v21 = -1;
    if (v15)
    {
LABEL_9:
      if (v13 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "xpc launch: started *not* suspended", buf, 2u);
      }
      goto LABEL_17;
    }
  }
  if (v13 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "xpc launch: starting suspended", buf, 2u);
  }
  xpc_service_instance_set_start_suspended();
LABEL_17:
  if (v18) {
    xpc_service_instance_set_jetsam_properties();
  }

  return v21;
}

- (void)requestDebugLaunchOfDaemonWithSpecifier:(id)a3 programPath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 handler:(id)a8
{
  v30[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  sub_2308E91CC();
  id v17 = v12;
  [v17 UTF8String];
  int v18 = (void *)xpc_service_create_from_specifier();
  if (v18)
  {
    id v23 = v17;
    id v24 = v14;
    id v25 = v15;
    id v28 = v16;
    id v26 = v13;
    id v27 = v18;
    xpc_service_set_attach_handler();
    xpc_service_kickstart_with_flags();
  }
  else
  {
    xpc_object_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    id v20 = [NSString stringWithFormat:@"Unable to find service with specifier '%@'.", v17];
    v30[0] = v20;
    int v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    id v22 = [v19 errorWithDomain:@"DTXPCServiceController" code:1 userInfo:v21];
    (*((void (**)(id, id, void, void, uint64_t, void *))v16 + 2))(v16, v17, 0, 0, 0xFFFFFFFFLL, v22);
  }
}

- (void)_registryModify:(BOOL)a3 identifier:(id)a4 parent:(int)a5 client:(id)a6 block:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2308EC7B8;
  aBlock[3] = &unk_264B8FB20;
  aBlock[4] = self;
  id v15 = v13;
  id v21 = v15;
  id v16 = v12;
  id v22 = v16;
  int v24 = a5;
  id v17 = v14;
  id v23 = v17;
  int v18 = (void (**)(void))_Block_copy(aBlock);
  xpc_object_t v19 = v18;
  if (v10) {
    dispatch_sync((dispatch_queue_t)self->_guard, v18);
  }
  else {
    v18[2](v18);
  }
}

- (void)_matchRemove:(id)a3
{
  id v4 = a3;
  registrationDictsByPid = self->_registrationDictsByPid;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2308ECA98;
  v7[3] = &unk_264B8FB70;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)registrationDictsByPid enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)unregisterClient:(id)a3 withIdentifier:(id)a4 parent:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  guard = self->_guard;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2308ECE38;
  v13[3] = &unk_264B8EDC0;
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