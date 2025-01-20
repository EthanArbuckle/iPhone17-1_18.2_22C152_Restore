@interface DTSpringBoardProcessControlService
+ (void)registerCapabilities:(id)a3;
- (BOOL)_HIDEvent:(unsigned int)a3 hold:(BOOL)a4;
- (BOOL)_dismissTodayView;
- (BOOL)_triggerSiri;
- (BOOL)sendProcessControlEvent:(id)a3 toPid:(id)a4 error:(id *)a5;
- (BOOL)showNotificiationCenterWidget:(id)a3 withError:(id *)a4;
- (BOOL)showSBWidget:(id)a3 withError:(id *)a4;
- (BOOL)simulateNotificationForBundleID:(id)a3 payload:(id)a4 withError:(id *)a5;
- (id)_launchSuspendedProcessWithBundleIdentifier:(id)a3 orDevicePath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 error:(id *)a8;
- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7;
- (id)processIdentifierForBundleIdentifier:(id)a3;
- (void)sendProcessControlEvent:(id)a3 toPid:(id)a4;
@end

@implementation DTSpringBoardProcessControlService

+ (void)registerCapabilities:(id)a3
{
  v4 = DTDefaultProcessControlServiceIdentifier;
  id v5 = a3;
  [v5 publishCapability:v4 withVersion:107 forClass:a1];
  [v5 publishCapability:@"com.apple.instruments.server.services.processcontrol.feature.deviceio" withVersion:103 forClass:a1];
  [v5 publishCapability:@"com.apple.instruments.server.services.processcontrolbydictionary" withVersion:4 forClass:a1];
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_opt_new();
  id v21 = 0;
  v18 = [(DTSpringBoardProcessControlService *)self _launchSuspendedProcessWithBundleIdentifier:v15 orDevicePath:v16 environment:v14 arguments:v13 options:v12 error:&v21];

  id v19 = v21;
  [v17 invokeCompletionWithReturnValue:v18 error:v19];

  return v17;
}

- (id)_launchSuspendedProcessWithBundleIdentifier:(id)a3 orDevicePath:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7 error:(id *)a8
{
  v194[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  CFStringRef v13 = (const __CFString *)a4;
  id v14 = a5;
  id v15 = (uint64_t (*)(uint64_t, uint64_t))a6;
  id v154 = a7;
  id v159 = v12;
  uint64_t v16 = [v12 length];
  v17 = &_os_log_internal;
  id v18 = &_os_log_internal;
  BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (!v19) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    v185 = v15;
    LOWORD(v186) = 2114;
    *(void *)((char *)&v186 + 2) = v154;
    v20 = &_os_log_internal;
    id v21 = "Received request to launch process with bundle ID '%{public}@:'\n"
          "\tEnvironment variables: %{public}@\n"
          "\tArguments: %{public}@\n"
          "\tOptions: %{public}@";
  }
  else
  {
    if (!v19) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    v185 = v15;
    LOWORD(v186) = 2114;
    *(void *)((char *)&v186 + 2) = v154;
    v20 = &_os_log_internal;
    id v21 = "Received request to launch process at path '%{public}@:'\n"
          "\tEnvironment variables: %{public}@\n"
          "\tArguments: %{public}@\n"
          "\tOptions: %{public}@";
  }
  _os_log_impl(&dword_23087D000, v20, OS_LOG_TYPE_INFO, v21, buf, 0x2Au);
LABEL_7:
  filePath = (__CFString *)v13;

  if (v15) {
    v22 = v15;
  }
  else {
    v22 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263EFFA68];
  }
  if (v14) {
    id v23 = v14;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA78];
  }
  v148 = v22;
  v149 = v23;
  v24 = [v154 objectForKeyedSubscript:DTProcessControlServiceOption_LeaveSuspendedKey[0]];
  int v145 = [v24 isEqualToNumber:MEMORY[0x263EFFA80]];

  v25 = [v154 objectForKeyedSubscript:DTProcessControlServiceOption_KillExistingKey[0]];
  char v158 = [v25 isEqualToNumber:MEMORY[0x263EFFA80]];

  v26 = [v154 objectForKeyedSubscript:DTProcessControlServiceOption_ActivateSuspendedKey[0]];
  uint64_t v27 = MEMORY[0x263EFFA88];
  int v28 = [v26 isEqualToNumber:MEMORY[0x263EFFA88]];

  v156 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  v29 = [MEMORY[0x263F08AB0] processInfo];
  v30 = [v29 environment];
  v153 = (void *)[v30 mutableCopy];

  [v153 addEntriesFromDictionary:v149];
  char v173 = 0;
  if (v159) {
    goto LABEL_14;
  }
  v55 = [MEMORY[0x263F08850] defaultManager];
  if (([v55 fileExistsAtPath:v13 isDirectory:&v173] & 1) == 0)
  {

    goto LABEL_35;
  }
  BOOL v56 = v173 == 0;

  if (v56) {
    goto LABEL_35;
  }
  CFURLRef v57 = CFURLCreateWithFileSystemPath(0, v13, kCFURLPOSIXPathStyle, 1u);
  v58 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v57);
  v59 = v58;
  if (!v58)
  {

    CFURLRef v64 = 0;
    CFURLRef v61 = 0;
    filePath = 0;
    CFDictionaryRef InfoDictionary = 0;
    char v66 = 1;
    BOOL v62 = 1;
    goto LABEL_116;
  }
  CFURLRef v60 = CFBundleCopyExecutableURL(v58);
  CFURLRef v61 = v60;
  BOOL v62 = v60 == 0;
  if (!v60)
  {
    CFURLRef v64 = 0;
    goto LABEL_114;
  }
  CFURLRef v63 = CFURLCopyAbsoluteURL(v60);
  CFURLRef v64 = v63;
  if (!v63)
  {
LABEL_114:
    CFStringRef v65 = 0;
    char v66 = 1;
    v67 = filePath;
    goto LABEL_115;
  }
  CFStringRef v65 = (id)CFURLCopyFileSystemPath(v63, kCFURLPOSIXPathStyle);

  char v66 = 0;
  v67 = (__CFString *)v65;
LABEL_115:

  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(v59);
  filePath = (__CFString *)v65;
LABEL_116:
  id v159 = [(__CFDictionary *)InfoDictionary objectForKeyedSubscript:@"CFBundleIdentifier"];
  if (v57) {
    CFRelease(v57);
  }
  if (v59) {
    CFRelease(v59);
  }
  if (!v62) {
    CFRelease(v61);
  }
  if ((v66 & 1) == 0) {
    CFRelease(v64);
  }
  v121 = &_os_log_internal;
  id v122 = &_os_log_internal;
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
  {
    uint64_t v123 = [(__CFString *)filePath UTF8String];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v123;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No bundle ID passed in path: %s", buf, 0xCu);
  }

  if (v159)
  {
LABEL_14:
    uint64_t v157 = sub_2308FF5FC((uint64_t)v159);
    char v31 = v158;
    if ((int)v157 < 1) {
      char v31 = 1;
    }
    if (v31)
    {
LABEL_21:
      uint64_t v42 = *MEMORY[0x263F3F528];
      v189[0] = *MEMORY[0x263F3F520];
      v189[1] = v42;
      v190[0] = v148;
      v190[1] = v153;
      v189[2] = *MEMORY[0x263F3F550];
      v43 = [NSNumber numberWithBool:v145 ^ 1u];
      v190[2] = v43;
      v44 = [NSDictionary dictionaryWithObjects:v190 forKeys:v189 count:3];
      v151 = (void *)[v44 mutableCopy];

      if (!DTProcessShouldCaptureOutputWithOptions(v154))
      {
        id v144 = 0;
        id v146 = 0;
        goto LABEL_51;
      }
      v45 = NSTemporaryDirectory();
      v46 = [v45 stringByAppendingPathComponent:@"instruments_XXXXXX"];

      id v47 = v46;
      v48 = strdup((const char *)[v47 UTF8String]);
      if (mkdtemp(v48))
      {
        id v144 = [NSString stringWithUTF8String:v48];
        id v49 = [v144 stringByAppendingPathComponent:@"stdio.pipe"];
        if (!mkfifo((const char *)[v49 UTF8String], 0x1FFu))
        {
          id v146 = v49;
          chmod((const char *)[v146 UTF8String], 0x1B6u);
          id v144 = v144;
          chmod((const char *)[v144 UTF8String], 0x1FFu);
          [v151 setObject:v146 forKeyedSubscript:*MEMORY[0x263F3F540]];
          [v151 setObject:v146 forKeyedSubscript:*MEMORY[0x263F3F548]];
          goto LABEL_50;
        }
        v50 = &_os_log_internal;
        id v51 = &_os_log_internal;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = [v49 UTF8String];
          v53 = __error();
          v54 = strerror(*v53);
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = v52;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v54;
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "mkfifo failed for '%s': %s", buf, 0x16u);
        }
      }
      else
      {
        id v144 = 0;
      }
      id v146 = 0;
LABEL_50:
      free(v48);

LABEL_51:
      uint64_t v81 = *MEMORY[0x263F3F5E8];
      v187[0] = *MEMORY[0x263F3F5A0];
      v187[1] = v81;
      v188[0] = v151;
      v188[1] = v27;
      v187[2] = *MEMORY[0x263F3F5F8];
      v82 = [NSNumber numberWithDouble:10.0];
      v188[2] = v82;
      v83 = [NSDictionary dictionaryWithObjects:v188 forKeys:v187 count:3];
      v155 = (void *)[v83 mutableCopy];

      if (v28) {
        [v155 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F3F598]];
      }
      if (v154)
      {
        id v84 = v154;
        v85 = objc_opt_new();
        v86 = DTProcessControlOptionsGetEvent(v84);

        if (v86)
        {
          v87 = objc_opt_new();
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v88 = [v86 objectForKey:@"PCEventType"];
            if ([v88 isEqualToString:@"BackgroundFetchEvent"]) {
              [v87 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F3F518]];
            }
          }
          if ([v87 count]) {
            [v85 setObject:v87 forKeyedSubscript:*MEMORY[0x263F3F588]];
          }
        }
        [v155 addEntriesFromDictionary:v85];
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v185 = sub_2308FF668;
      *(void *)&long long v186 = sub_2308FF678;
      *((void *)&v186 + 1) = 0;
      uint64_t v168 = 0;
      v169 = &v168;
      uint64_t v170 = 0x2020000000;
      int v171 = -1;
      uint64_t v89 = MEMORY[0x263EF8330];
      for (int i = 7; ; --i)
      {
        v91 = (void *)MEMORY[0x263F086D0];
        v164[0] = v89;
        v164[1] = 3221225472;
        v164[2] = sub_2308FF680;
        v164[3] = &unk_264B90150;
        v166 = buf;
        v167 = &v168;
        id v92 = v159;
        id v165 = v92;
        v93 = [v91 blockOperationWithBlock:v164];
        v94 = [MEMORY[0x263F3F778] optionsWithDictionary:v155];
        v161[0] = MEMORY[0x263EF8330];
        v161[1] = 3221225472;
        v161[2] = sub_2308FF6C4;
        v161[3] = &unk_264B90178;
        v163 = buf;
        id v95 = v93;
        id v162 = v95;
        [v156 openApplication:v92 withOptions:v94 completion:v161];

        [v95 waitUntilFinished];
        v96 = *(void **)(*(void *)&buf[8] + 40);
        if (v96 && [v96 code] == 6 || (v158 & 1) == 0 && *((_DWORD *)v169 + 6) == v157) {
          usleep(0x7A120u);
        }

        if (!i) {
          break;
        }
        v97 = *(void **)(*(void *)&buf[8] + 40);
        if ((!v97 || [v97 code] != 6) && ((v158 & 1) != 0 || *((_DWORD *)v169 + 6) != v157)) {
          break;
        }
      }
      if (v146 && *((_DWORD *)v169 + 6) && !*(void *)(*(void *)&buf[8] + 40)) {
        -[DTProcessControlService watchOutputFileName:directory:forPid:](self, "watchOutputFileName:directory:forPid:", v146, v144);
      }
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        v98 = [NSString stringWithFormat:@"Request to launch %@ failed.", v92];
        if ([*(id *)(*(void *)&buf[8] + 40) code] == 6)
        {
          v99 = @"Device busy or Instruments is trying to launch several targets, and one of them is a foreground app.";
        }
        else if ([*(id *)(*(void *)&buf[8] + 40) code] == 5)
        {
          v99 = @"Background launch requested, but this app cannot run in the background (see UIApplicationExitsOnSuspend or 'Background Modes' in Xcode).";
        }
        else if ([*(id *)(*(void *)&buf[8] + 40) code] == 7)
        {
          v99 = @"Device is currently locked. Please unlock the device and try again.";
        }
        else
        {
          v105 = NSString;
          v106 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
          v99 = [v105 stringWithFormat:@"%@ : Failed to launch process with bundle identifier '%@'.", v106, v92];
        }
        v107 = &_os_log_internal;
        id v108 = &_os_log_internal;
        if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        {
          uint64_t v109 = [*(id *)(*(void *)&buf[8] + 40) code];
          v110 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
          *(_DWORD *)v176 = 134218242;
          *(void *)v177 = v109;
          *(_WORD *)&v177[8] = 2112;
          *(void *)&v177[10] = v110;
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DTSpringBoardProcessControlService -- Error: %ld. %@.", v176, 0x16u);
        }
        if (a8)
        {
          v111 = (void *)MEMORY[0x263F087E8];
          uint64_t v112 = *MEMORY[0x263F08338];
          v182[0] = *MEMORY[0x263F08320];
          v182[1] = v112;
          v183[0] = v98;
          v183[1] = v99;
          v182[2] = *MEMORY[0x263F08608];
          v183[2] = *(void *)(*(void *)&buf[8] + 40);
          v113 = [NSDictionary dictionaryWithObjects:v183 forKeys:v182 count:3];
          *a8 = [v111 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:2 userInfo:v113];
        }
      }
      else
      {
        int v100 = *((_DWORD *)v169 + 6);
        if (v100 > 0)
        {
          if (v157 == v100)
          {
            if ((v158 & 1) == 0)
            {
              v116 = NSString;
              v117 = [(__CFString *)filePath lastPathComponent];
              v98 = [v116 stringWithFormat:@"Executable '%@' is already running as process %d.", v117, v157];

              if (a8)
              {
                v118 = (void *)MEMORY[0x263F087E8];
                uint64_t v119 = *MEMORY[0x263F08338];
                v178[0] = *MEMORY[0x263F08320];
                v178[1] = v119;
                v179[0] = v98;
                v179[1] = @"killExisting requested, but found the existing PID.";
                v120 = [NSDictionary dictionaryWithObjects:v179 forKeys:v178 count:2];
                *a8 = [v118 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:2 userInfo:v120];
              }
              goto LABEL_103;
            }
            if ((v145 & 1) == 0)
            {
              v101 = [NSNumber numberWithInt:v157];
              [(DTProcessControlService *)self suspendPid:v101];
            }
          }
          else if ((v145 & 1) == 0)
          {
            mach_port_name_t v104 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:");
            if (v104 - 1 > 0xFFFFFFFD)
            {
              v124 = &_os_log_internal;
              id v125 = &_os_log_internal;
              if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
              {
                int v126 = *((_DWORD *)v169 + 6);
                *(_DWORD *)v176 = 67109378;
                *(_DWORD *)v177 = v126;
                *(_WORD *)&v177[4] = 2112;
                *(void *)&v177[6] = v92;
                _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to acquire task port after launch of pid %d (%@)", v176, 0x12u);
              }

              v98 = (void *)[objc_alloc(MEMORY[0x263F64638]) initWithExplanation:@"Permission to debug process denied"];
              id v127 = objc_alloc(MEMORY[0x263F64640]);
              v128 = (void *)MEMORY[0x263F645D8];
              v129 = [MEMORY[0x263F64580] identifierWithPid:*((unsigned int *)v169 + 6)];
              uint64_t v130 = [v128 predicateMatchingIdentifier:v129];
              v131 = (void *)[v127 initWithPredicate:v130 context:v98];

              id v160 = 0;
              LOBYTE(v130) = [v131 execute:&v160];
              id v132 = v160;
              if ((v130 & 1) == 0)
              {
                v133 = &_os_log_internal;
                id v134 = &_os_log_internal;
                if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                {
                  int v135 = *((_DWORD *)v169 + 6);
                  *(_DWORD *)v176 = 67109634;
                  *(_DWORD *)v177 = v135;
                  *(_WORD *)&v177[4] = 2112;
                  *(void *)&v177[6] = v92;
                  *(_WORD *)&v177[14] = 2112;
                  *(void *)&v177[16] = v132;
                  _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to attempt termination of pid %d (%@): %@", v176, 0x1Cu);
                }
              }
              v136 = [NSNumber numberWithInt:*((unsigned int *)v169 + 6)];
              [(DTProcessControlService *)self killPid:v136];

              v137 = [NSString stringWithFormat:@"Permission to debug %@ was denied.", v92];
              uint64_t v138 = [NSString stringWithFormat:@"Unable to acquire task port for PID: %d", *((unsigned int *)v169 + 6)];
              v139 = (void *)v138;
              if (a8)
              {
                v140 = (void *)MEMORY[0x263F087E8];
                uint64_t v141 = *MEMORY[0x263F08338];
                v174[0] = *MEMORY[0x263F08320];
                v174[1] = v141;
                v175[0] = v137;
                v175[1] = v138;
                v174[2] = *MEMORY[0x263F08348];
                v175[2] = @"The app must be debuggable and signed with 'get-task-allow'.";
                v142 = [NSDictionary dictionaryWithObjects:v175 forKeys:v174 count:3];
                *a8 = [v140 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:2 userInfo:v142];
              }
              goto LABEL_103;
            }
            mach_port_deallocate(*MEMORY[0x263EF8960], v104);
          }
          v70 = [NSNumber numberWithInt:*((unsigned int *)v169 + 6)];
LABEL_105:
          _Block_object_dispose(&v168, 8);
          _Block_object_dispose(buf, 8);

          id v159 = v92;
LABEL_106:

          goto LABEL_107;
        }
        if (!a8)
        {
LABEL_104:
          v70 = 0;
          goto LABEL_105;
        }
        v102 = (void *)MEMORY[0x263F087E8];
        uint64_t v103 = *MEMORY[0x263F08338];
        v180[0] = *MEMORY[0x263F08320];
        v180[1] = v103;
        v181[0] = @"Failed looking up pid of launched process.";
        v181[1] = @"Call to openApplication:withOptions:completion: succeeded, but a PID could not be found for the target Bundle Identifier.";
        v98 = [NSDictionary dictionaryWithObjects:v181 forKeys:v180 count:2];
        *a8 = [v102 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:4 userInfo:v98];
      }
LABEL_103:

      goto LABEL_104;
    }
    v32 = &_os_log_internal;
    id v33 = &_os_log_internal;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [v159 UTF8String];
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v157;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "Killing existing instance of bundle ID %{public}s with PID %i", buf, 0x12u);
    }

    v151 = (void *)[objc_alloc(MEMORY[0x263F64638]) initWithExplanation:@"Terminating any existing instance before DTServiceHub app launch"];
    id v35 = objc_alloc(MEMORY[0x263F64640]);
    v36 = (void *)MEMORY[0x263F645D8];
    v37 = [MEMORY[0x263F64580] identifierWithPid:v157];
    v38 = [v36 predicateMatchingIdentifier:v37];
    v39 = (void *)[v35 initWithPredicate:v38 context:v151];

    id v172 = 0;
    LOBYTE(v35) = [v39 execute:&v172];
    id v40 = v172;
    v41 = v40;
    if (v35)
    {
LABEL_20:

      goto LABEL_21;
    }
    v71 = [v40 domain];
    if ([v71 isEqualToString:*MEMORY[0x263F646A8]])
    {
      BOOL v72 = [v41 code] == 3;

      if (v72)
      {
        v73 = &_os_log_internal;
        id v74 = &_os_log_internal;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          uint64_t v75 = [v159 UTF8String];
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = v75;
          _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "Request to terminate existing instance of bundle ID %{public}s failed because the existing instance could no longer be found. Continuing with launch.", buf, 0xCu);
        }

        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v76 = [NSString stringWithFormat:@"Failed to terminate existing instance (%i) of bundle ID '%@'", v157, v159];
    v77 = (void *)v76;
    if (a8)
    {
      v78 = (void *)MEMORY[0x263F087E8];
      uint64_t v79 = *MEMORY[0x263F08608];
      v191[0] = *MEMORY[0x263F08320];
      v191[1] = v79;
      v192[0] = v76;
      v192[1] = v41;
      v80 = [NSDictionary dictionaryWithObjects:v192 forKeys:v191 count:2];
      *a8 = [v78 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:16 userInfo:v80];
    }
    v70 = 0;
    goto LABEL_106;
  }
LABEL_35:
  id v159 = [NSString stringWithFormat:@"Unable to locate CFBundleIdentifier for path: %@.", filePath];
  if (a8)
  {
    v68 = (void *)MEMORY[0x263F087E8];
    uint64_t v69 = *MEMORY[0x263F08338];
    v193[0] = *MEMORY[0x263F08320];
    v193[1] = v69;
    v194[0] = v159;
    v194[1] = @"Either a Bundle Identifier or a path to a bundle must be provided.";
    v152 = [NSDictionary dictionaryWithObjects:v194 forKeys:v193 count:2];
    [v68 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:1 userInfo:v152];
    v70 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v70 = 0;
  }
LABEL_107:

  return v70;
}

- (id)processIdentifierForBundleIdentifier:(id)a3
{
  int v3 = sub_2308FF5FC((uint64_t)a3);
  uint64_t v4 = v3 & ~(v3 >> 31);
  id v5 = NSNumber;
  return (id)[v5 numberWithInt:v4];
}

- (BOOL)sendProcessControlEvent:(id)a3 toPid:(id)a4 error:(id *)a5
{
  v129[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x3032000000;
  uint64_t v103 = sub_2308FF668;
  mach_port_name_t v104 = sub_2308FF678;
  id v105 = 0;
  v10 = DTProcessControlEventUnarchive(v8);
  uint64_t v11 = [v9 intValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v85.receiver = self;
    v85.super_class = (Class)DTSpringBoardProcessControlService;
    [(DTProcessControlService *)&v85 sendProcessControlEvent:v8 toPid:v9];
    goto LABEL_7;
  }
  id v84 = v10;
  id v12 = [v84 objectForKey:@"PCEventType"];
  if ([v12 isEqualToString:@"ShowSBWidgetCenter"])
  {
    CFStringRef v13 = v101;
    id v99 = (id)v101[5];
    [(DTSpringBoardProcessControlService *)self showSBWidget:v84 withError:&v99];
    id v14 = v99;
    id v15 = (void *)v13[5];
    v13[5] = (uint64_t)v14;
    goto LABEL_4;
  }
  if ([v12 isEqualToString:@"ShowNotificationCenter"])
  {
    id v15 = [v84 objectForKey:@"WidgetIdentifier"];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v19 = (id *)(v101 + 5);
        id obj = (id)v101[5];
        [(DTSpringBoardProcessControlService *)self showNotificiationCenterWidget:v15 withError:&obj];
        objc_storeStrong(v19, obj);
      }
    }
    goto LABEL_4;
  }
  if ([v12 isEqualToString:@"BackgroundFetchEvent"])
  {
    uint64_t v20 = [MEMORY[0x263F64580] identifierWithPid:v11];
    uint64_t v79 = (void *)v20;
    if (v20)
    {
      id v21 = (void *)MEMORY[0x263F64570];
      v22 = [MEMORY[0x263F645D8] predicateMatchingIdentifier:v20];
      id v23 = [v21 handleForPredicate:v22 error:0];

      v24 = [v23 bundle];
      id v15 = [v24 identifier];
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v128 = *MEMORY[0x263F3F588];
    uint64_t v126 = *MEMORY[0x263F3F518];
    uint64_t v127 = MEMORY[0x263EFFA78];
    v32 = [NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
    v129[0] = v32;
    id v33 = [NSDictionary dictionaryWithObjects:v129 forKeys:&v128 count:1];

    uint64_t v81 = [MEMORY[0x263F3F778] optionsWithDictionary:v33];
    if (v15)
    {
      uint64_t v34 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = sub_2309004AC;
      v93[3] = &unk_264B901A0;
      id v94 = v15;
      id v95 = v33;
      id v96 = v81;
      v97 = &v100;
      [v34 openApplication:v94 withOptions:v96 completion:v93];

      id v35 = v94;
    }
    else
    {
      dispatch_semaphore_t dsemaa = v33;
      id v35 = [NSString stringWithFormat:@"Failed to trigger Background Fetch for PID %d, no bundle identifier found.", v11];
      uint64_t v36 = [NSString stringWithFormat:@"Could not find CFBundleIdentifier for PID: %d.", v11];
      uint64_t v76 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08338];
      v124[0] = *MEMORY[0x263F08320];
      v124[1] = v37;
      v125[0] = v35;
      v125[1] = v36;
      v38 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:2];
      uint64_t v39 = [v76 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v38];
      id v40 = (void *)v36;
      v41 = (void *)v101[5];
      v101[5] = v39;

      id v33 = dsemaa;
    }

    goto LABEL_4;
  }
  if ([v12 isEqualToString:@"TriggerSiri"])
  {
    id v15 = [v84 objectForKeyedSubscript:@"SiriRequestPayload"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v15 length]
      && NSClassFromString(&cfstr_Afsettingsconn.isa))
    {
      id v25 = objc_alloc_init(MEMORY[0x263F285E8]);
      [v25 startUIRequest:v15];
      [v25 barrier];
    }
    else
    {
      if ([(DTSpringBoardProcessControlService *)self _triggerSiri]) {
        goto LABEL_4;
      }
      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v122 = *MEMORY[0x263F08320];
      uint64_t v123 = @"Failed to trigger Siri";
      id v25 = [NSDictionary dictionaryWithObjects:&v123 forKeys:&v122 count:1];
      uint64_t v30 = [v29 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v25];
      char v31 = (void *)v101[5];
      v101[5] = v30;
    }
    goto LABEL_4;
  }
  if (![v12 isEqualToString:@"PressHomeButton"])
  {
    if (![v12 isEqualToString:@"SimulateNotification"])
    {
      if ([v12 isEqualToString:@"ShowMessagesExtension"])
      {
        uint64_t v50 = notify_post("com.apple.MobileSMS.CKAppExtension.launch");
        if (!v50) {
          goto LABEL_5;
        }
        id v15 = [NSString stringWithFormat:@"Error sending Messages notification for '%s' status: %d.", "com.apple.MobileSMS.CKAppExtension.launch", v50];
        id v51 = (void *)MEMORY[0x263F087E8];
        uint64_t v114 = *MEMORY[0x263F08320];
        v115 = v15;
        uint64_t v52 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
        uint64_t v53 = [v51 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v52];
        v54 = (void *)v101[5];
        v101[5] = v53;
      }
      else if ([v12 isEqualToString:@"SnapshotUI"])
      {
        v55 = (void *)MEMORY[0x263F087E8];
        uint64_t v112 = *MEMORY[0x263F08320];
        v113 = @"Snapshot UI is not supported for this platform.";
        id v15 = [NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        uint64_t v56 = [v55 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v15];
        CFURLRef v57 = (void *)v101[5];
        v101[5] = v56;
      }
      else
      {
        if (![v12 isEqualToString:@"TriggerAppClip"])
        {
          v86.receiver = self;
          v86.super_class = (Class)DTSpringBoardProcessControlService;
          [(DTProcessControlService *)&v86 sendProcessControlEvent:v8 toPid:v9];
          goto LABEL_5;
        }
        id v15 = [v84 objectForKeyedSubscript:@"BundleIdentifier"];
        CFURLRef v63 = [v84 objectForKeyedSubscript:@"AppClipPayload"];
        CFURLRef v64 = NSURL;
        if ([(__CFString *)v63 length]) {
          CFStringRef v65 = v63;
        }
        else {
          CFStringRef v65 = @"https://example.com";
        }
        v83 = [v64 URLWithString:v65];
        if (dlopen_preflight("/System/Library/PrivateFrameworks/ClipServices.framework/ClipServices"))
        {
          dlopen("/System/Library/PrivateFrameworks/ClipServices.framework/ClipServices", 10);
          char v66 = NSClassFromString(&cfstr_Cpscliprequest.isa);
          if (v66)
          {
            v80 = (void *)[[v66 alloc] initWithURL:v83];
            dispatch_semaphore_t v67 = dispatch_semaphore_create(0);
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v109 = v15;
              __int16 v110 = 2112;
              v111 = v83;
              _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "Clip Request for bundleID:'%@' url:'%@'", buf, 0x16u);
            }
            v87[0] = MEMORY[0x263EF8330];
            v87[1] = 3221225472;
            v87[2] = sub_230900650;
            v87[3] = &unk_264B901C8;
            id v88 = v15;
            id v89 = v83;
            v91 = &v100;
            dispatch_semaphore_t dsema = v67;
            dispatch_semaphore_t v90 = dsema;
            [v80 installClipWithBundleID:v88 completion:v87];
            v68 = [v84 objectForKeyedSubscript:@"Timeout"];
            int v69 = [v68 intValue];

            if (v69 <= 0) {
              int64_t v70 = 30000000000;
            }
            else {
              int64_t v70 = (uint64_t)((double)v69 * 1000000000.0);
            }
            dispatch_time_t v71 = dispatch_time(0, v70);
            if (dispatch_semaphore_wait(dsema, v71))
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                sub_23093E980();
              }
              BOOL v72 = (void *)MEMORY[0x263F087E8];
              uint64_t v106 = *MEMORY[0x263F08320];
              v107 = @"Trigger AppClip timed out.";
              v73 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
              uint64_t v74 = [v72 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:32 userInfo:v73];
              uint64_t v75 = (void *)v101[5];
              v101[5] = v74;
            }
          }
        }
      }
      goto LABEL_4;
    }
    id v15 = [v84 objectForKey:@"BundleIdentifier"];
    uint64_t v42 = [v84 objectForKey:@"NotificationPayload"];
    v43 = (void *)v42;
    if (v42 && v15)
    {
      id v92 = 0;
      [(DTSpringBoardProcessControlService *)self simulateNotificationForBundleID:v15 payload:v42 withError:&v92];
      id v44 = v92;
      if (!v44)
      {
LABEL_53:

        goto LABEL_4;
      }
      v45 = [NSString stringWithFormat:@"Failed to simulate notification for bundleID: %@.", v15];
      v82 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08608];
      v118[0] = *MEMORY[0x263F08320];
      v118[1] = v46;
      v119[0] = v45;
      v119[1] = v44;
      id v47 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
      uint64_t v48 = [v82 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v47];
      id v49 = (void *)v101[5];
      v101[5] = v48;
    }
    else
    {
      v58 = @"Unknown failure.";
      if (!v42) {
        v58 = @"Notification payload is nil.";
      }
      if (!v15) {
        v58 = @"BundleIdentifer for notification is nil.";
      }
      v59 = (void *)MEMORY[0x263F087E8];
      uint64_t v60 = *MEMORY[0x263F08338];
      v116[0] = *MEMORY[0x263F08320];
      v116[1] = v60;
      v117[0] = @"Failed to simulate notification.";
      v117[1] = v58;
      id v44 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:2];
      if (v15) {
        uint64_t v61 = 8;
      }
      else {
        uint64_t v61 = 1;
      }
      uint64_t v62 = [v59 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:v61 userInfo:v44];
      v45 = (void *)v101[5];
      v101[5] = v62;
    }

    goto LABEL_53;
  }
  if ([(DTSpringBoardProcessControlService *)self _dismissTodayView]) {
    goto LABEL_5;
  }
  v26 = (void *)MEMORY[0x263F087E8];
  uint64_t v120 = *MEMORY[0x263F08320];
  v121 = @"Failed to press Home button";
  id v15 = [NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
  uint64_t v27 = [v26 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v15];
  int v28 = (void *)v101[5];
  v101[5] = v27;

LABEL_4:
LABEL_5:

LABEL_7:
  uint64_t v16 = (void *)v101[5];
  if (a5 && v16)
  {
    *a5 = v16;
    uint64_t v16 = (void *)v101[5];
  }
  BOOL v17 = v16 == 0;

  _Block_object_dispose(&v100, 8);
  return v17;
}

- (void)sendProcessControlEvent:(id)a3 toPid:(id)a4
{
  id v5 = 0;
  [(DTSpringBoardProcessControlService *)self sendProcessControlEvent:a3 toPid:a4 error:&v5];
  id v4 = v5;
  if (v4) {
    [MEMORY[0x263EFF940] raise:@"DTSHSendProcessControlEvent", @"SendProcessControlEvent:toPid: encountered an error: %@", v4 format];
  }
}

- (BOOL)simulateNotificationForBundleID:(id)a3 payload:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_2308FF668;
  BOOL v19 = sub_2308FF678;
  id v20 = 0;
  id v9 = [MEMORY[0x263F1DF48] requestWithIdentifier:&stru_26E517620 pushPayload:v8 bundleIdentifier:v7];
  v10 = (void *)[objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23090097C;
  v14[3] = &unk_264B8EA50;
  v14[4] = &v15;
  [v10 addNotificationRequest:v9 withCompletionHandler:v14];
  uint64_t v11 = (void *)v16[5];
  if (a5 && v11)
  {
    *a5 = v11;
    uint64_t v11 = (void *)v16[5];
  }
  BOOL v12 = v11 == 0;

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (BOOL)showNotificiationCenterWidget:(id)a3 withError:(id *)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_2308FF668;
  int v28 = sub_2308FF678;
  id v29 = 0;
  if (v5)
  {
    uint64_t v36 = *MEMORY[0x263F3F5A0];
    uint64_t v7 = *MEMORY[0x263F3F538];
    v34[0] = *MEMORY[0x263F3F530];
    v34[1] = v7;
    v35[0] = v5;
    v35[1] = @"com.apple.widget-extension";
    id v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v37[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];

    v10 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    uint64_t v11 = [MEMORY[0x263F3F778] optionsWithDictionary:v9];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_230900CF0;
    v21[3] = &unk_264B901F0;
    id v22 = v6;
    id v23 = &v24;
    [v10 openApplication:@"com.apple.springboard" withOptions:v11 completion:v21];

    BOOL v12 = v22;
  }
  else
  {
    CFStringRef v13 = &_os_log_internal;
    id v14 = &_os_log_internal;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [@"No Notification Center Widget specified." UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v33 = v15;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    char v31 = @"No Notification Center Widget specified.";
    id v9 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v17 = [v16 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v9];
    BOOL v12 = (void *)v25[5];
    v25[5] = v17;
  }

  id v18 = (void *)v25[5];
  if (a4 && v18)
  {
    *a4 = v18;
    id v18 = (void *)v25[5];
  }
  BOOL v19 = v18 == 0;
  _Block_object_dispose(&v24, 8);

  return v19;
}

- (BOOL)showSBWidget:(id)a3 withError:(id *)a4
{
  id v40 = a4;
  v62[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = sub_2308FF668;
  id v51 = sub_2308FF678;
  id v52 = 0;
  id v5 = [v4 objectForKey:@"WidgetIdentifier"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v41 = (id)*MEMORY[0x263F31DD0];
  id v42 = (id)*MEMORY[0x263F31DC8];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"_XCWidgetKind"];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  else {
    id v9 = &stru_26E517620;
  }
  v10 = v9;

  uint64_t v11 = [v4 objectForKeyedSubscript:@"_XCWidgetFamily"];
  BOOL v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (__CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_26E517620;
  }
  id v14 = v13;

  if (v6)
  {
    uint64_t v15 = *MEMORY[0x263F3F5E8];
    v62[0] = MEMORY[0x263EFFA88];
    uint64_t v16 = *MEMORY[0x263F3F5A0];
    v61[0] = v15;
    v61[1] = v16;
    uint64_t v17 = *MEMORY[0x263F3F538];
    v59[0] = *MEMORY[0x263F3F530];
    v59[1] = v17;
    v60[0] = v6;
    v60[1] = @"com.apple.widgetkit-extension";
    v59[2] = v41;
    v59[3] = v42;
    v60[2] = v10;
    v60[3] = v14;
    id v18 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
    v62[1] = v18;
    BOOL v19 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];

    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    id v21 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
    id v22 = [MEMORY[0x263F3F778] optionsWithDictionary:v19];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = sub_230901404;
    v43[3] = &unk_264B90218;
    id v44 = v6;
    uint64_t v46 = &v47;
    id v23 = v20;
    v45 = v23;
    [v21 openApplication:@"com.apple.springboard" withOptions:v22 completion:v43];

    uint64_t v24 = [v4 objectForKeyedSubscript:@"Timeout"];
    int v25 = [v24 intValue];

    if (v25 <= 0) {
      int64_t v26 = 10000000000;
    }
    else {
      int64_t v26 = (uint64_t)((double)v25 * 1000000000.0);
    }
    dispatch_time_t v27 = dispatch_time(0, v26);
    if (dispatch_semaphore_wait(v23, v27))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Show Notification Center Widget timed out.", buf, 2u);
      }
      int v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v57 = *MEMORY[0x263F08320];
      v58 = @"Show Notification Center Widget timed out.";
      id v29 = @{v58:v57};
      uint64_t v30 = [v28 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:32 userInfo:v29];
      char v31 = (void *)v48[5];
      v48[5] = v30;
    }
  }
  else
  {
    v32 = &_os_log_internal;
    id v33 = &_os_log_internal;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [@"No Widget specified." UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v56 = v34;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    id v35 = (void *)MEMORY[0x263F087E8];
    uint64_t v53 = *MEMORY[0x263F08320];
    v54 = @"No Widget specified.";
    BOOL v19 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    uint64_t v36 = [v35 errorWithDomain:@"com.apple.dt.deviceprocesscontrolservice" code:8 userInfo:v19];
    id v23 = v48[5];
    v48[5] = v36;
  }

  uint64_t v37 = (void *)v48[5];
  if (v40 && v37)
  {
    *id v40 = v37;
    uint64_t v37 = (void *)v48[5];
  }
  BOOL v38 = v37 == 0;

  _Block_object_dispose(&v47, 8);
  return v38;
}

- (BOOL)_triggerSiri
{
  LODWORD(v2) = dlopen_preflight("/System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation");
  if (v2)
  {
    dlopen("/System/Library/PrivateFrameworks/SiriActivation.framework/SiriActivation", 10);
    v2 = NSClassFromString(&cfstr_Sirisimpleacti.isa);
    if (v2)
    {
      v2 = (objc_class *)objc_alloc_init(v2);
      if (v2)
      {
        int v3 = v2;
        [(objc_class *)v2 activateFromSource:0];

        LOBYTE(v2) = 1;
      }
    }
  }
  return (char)v2;
}

- (BOOL)_dismissTodayView
{
  return MEMORY[0x270F9A6D0](self, sel__HIDEvent_hold_);
}

- (BOOL)_HIDEvent:(unsigned int)a3 hold:(BOOL)a4
{
  if (a4) {
    float v4 = 1.0;
  }
  else {
    float v4 = 0.1;
  }
  if (a3 != 1 && a3 != 2) {
    return 0;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  __rqtp.tv_sec = (uint64_t)v4;
  __rqtp.tv_nsec = (float)((float)(v4 - (float)(uint64_t)v4) * 1000000000.0);
  mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  uint64_t v6 = IOHIDEventCreateKeyboardEvent();
  uint64_t v7 = (const void *)v6;
  if (KeyboardEvent && v6)
  {
    sub_23090173C();
    nanosleep(&__rqtp, 0);
    sub_23090173C();
LABEL_11:
    CFRelease(KeyboardEvent);
    goto LABEL_12;
  }
  if (KeyboardEvent) {
    goto LABEL_11;
  }
LABEL_12:
  if (v7) {
    CFRelease(v7);
  }
  return 1;
}

@end