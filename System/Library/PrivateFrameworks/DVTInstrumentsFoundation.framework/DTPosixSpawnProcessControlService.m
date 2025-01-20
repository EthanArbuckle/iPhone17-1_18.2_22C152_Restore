@interface DTPosixSpawnProcessControlService
+ (int)posixSpawnWithPath:(id)a3 environment:(id)a4 arguments:(id)a5 options:(id)a6 fileDescriptorHandler:(id)a7;
+ (void)registerCapabilities:(id)a3;
- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7;
- (int)cleanupPid:(int)a3;
@end

@implementation DTPosixSpawnProcessControlService

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  if (+[DTInstrumentServer isAppleInternal])
  {
    [v4 publishCapability:@"com.apple.instruments.server.services.processcontrol.posixspawn" withVersion:2 forClass:a1];
    [v4 publishCapability:@"com.apple.dt.services.capabilities.posix_spawn" withVersion:2 forClass:a1];
    [v4 publishCapability:DTDefaultProcessControlServiceIdentifier withVersion:2 forClass:a1];
  }
}

+ (int)posixSpawnWithPath:(id)a3 environment:(id)a4 arguments:(id)a5 options:(id)a6 fileDescriptorHandler:(id)a7
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  v11 = (__CFString *)a3;
  id v100 = a4;
  id v99 = a5;
  id v12 = a6;
  id v98 = a7;
  if ([(__CFString *)v11 length])
  {
    v13 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_InheritLauncherEnvironmentVariables[0]];
    id v96 = v13;
    if (!v13 || [v13 BOOLValue])
    {
      v14 = [MEMORY[0x263F08AB0] processInfo];
      v15 = [v14 environment];
      v16 = (void *)[v15 mutableCopy];

      [v16 addEntriesFromDictionary:v100];
      id v100 = v16;
    }
    char v110 = 0;
    v17 = [MEMORY[0x263F08850] defaultManager];
    int v18 = [v17 fileExistsAtPath:v11 isDirectory:&v110];
    if (v110) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }

    if (!v19)
    {
      v97 = v11;
      goto LABEL_31;
    }
    CFURLRef v20 = CFURLCreateWithFileSystemPath(0, v11, kCFURLPOSIXPathStyle, 1u);
    v21 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v20);
    v22 = v21;
    if (v21)
    {
      CFURLRef v23 = CFBundleCopyExecutableURL(v21);
      CFURLRef v24 = v23;
      if (v23)
      {
        CFURLRef v25 = CFURLCopyAbsoluteURL(v23);
        CFURLRef v26 = v25;
        if (v25)
        {
          v97 = (__CFString *)CFURLCopyFileSystemPath(v25, kCFURLPOSIXPathStyle);
          char v27 = 0;
          char v28 = 0;
          if (!v20) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
        v97 = 0;
        char v27 = 0;
LABEL_21:
        char v28 = 1;
        if (!v20)
        {
LABEL_23:
          if (v22) {
            CFRelease(v22);
          }
          if ((v27 & 1) == 0) {
            CFRelease(v24);
          }
          if ((v28 & 1) == 0) {
            CFRelease(v26);
          }
          if (![(__CFString *)v97 length])
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = [(__CFString *)v11 UTF8String];
              LODWORD(buf) = 136315138;
              *(void *)((char *)&buf + 4) = v36;
              _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to find actual binary to posix_spawn for path: %s", (uint8_t *)&buf, 0xCu);
            }
            [MEMORY[0x263EFF940] raise:@"DTPosixSpawnFailureException", @"Unable to find actual binary to posix_spawn for path: %@\n", v11 format];

            int v29 = 0;
            goto LABEL_123;
          }

LABEL_31:
          posix_spawnattr_t v109 = 0;
          posix_spawnattr_init(&v109);
          __int16 v108 = 0;
          posix_spawnattr_getflags(&v109, &v108);
          posix_spawnattr_setpgroup(&v109, 0);
          v108 |= 0x4002u;
          id v95 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_LeaveSuspendedKey[0]];
          if (v95 && ![v95 BOOLValue]) {
            __int16 v30 = v108 & 0xFF7F;
          }
          else {
            __int16 v30 = v108 | 0x80;
          }
          __int16 v108 = v30;
          uint64_t v31 = posix_spawnattr_setflags(&v109, v30);
          if (v31)
          {
            posix_spawnattr_destroy(&v109);
            v32 = [@" (" stringByAppendingFormat:CFSTR("Unable to set flags via posix_spawnattr_setflags(): flags=0x%016x, error=%d"), v108, v31];
            v33 = [v32 stringByAppendingString:@""]);

            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 67109120;
              DWORD1(buf) = v31;
              _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&buf, 8u);
            }
            [MEMORY[0x263EFF940] raise:@"DTPosixSpawnFailureException", @"posix_spawn failure while launching: %@%@", v97, v33 format];

            int v29 = 0;
            goto LABEL_122;
          }
          v34 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_Allow64Bit[0]];
          id v94 = v34;
          if (v34)
          {
            if ([v34 BOOLValue]) {
              cpu_type_t v35 = 16777228;
            }
            else {
              cpu_type_t v35 = 12;
            }
            v121[0] = v35;
            uint64_t v37 = 1;
          }
          else
          {
            uint64_t v37 = 0;
          }
          v121[v37] = -1;
          uint64_t v38 = posix_spawnattr_setbinpref_np(&v109, v37 + 1, v121, 0);
          if (v38)
          {
            posix_spawnattr_destroy(&v109);
            v39 = [@" (" stringByAppendingFormat:CFSTR("Unable to choose architecture %d: %d") v121[0], v38];
            v40 = [v39 stringByAppendingString:@""]);

            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 67109120;
              DWORD1(buf) = v38;
              _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&buf, 8u);
            }
            [MEMORY[0x263EFF940] raise:@"DTPosixSpawnFailureException", @"posix_spawn failure while launching: %@%@", v97, v40 format];

            int v29 = 0;
            goto LABEL_121;
          }
          posix_spawn_file_actions_t v107 = 0;
          posix_spawn_file_actions_init(&v107);
          *(void *)v119 = -1;
          *(void *)v120 = -1;
          BOOL v41 = !DTProcessShouldCaptureOutputWithOptions(v12);
          if (!v98) {
            LOBYTE(v41) = 1;
          }
          if (!v41)
          {
            if (pipe(v120) == -1 || pipe(v119) == -1)
            {
              uint64_t v44 = *__error();
              posix_spawn_file_actions_destroy(&v107);
              posix_spawnattr_destroy(&v109);
              v45 = [@" (" stringByAppendingFormat:CFSTR("Unable to allocate process I/O pipes %d")];
              [v45 stringByAppendingString:@""]);
              id v93 = (id)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
              {
                *(void *)&long long buf = 67109120;
                _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&buf, 8u);
              }
              [MEMORY[0x263EFF940] raise:@"DTPosixSpawnFailureException", @"posix_spawn failure while launching: %@%@", v97, v93 format];
              int v29 = 0;
              goto LABEL_120;
            }
            posix_spawn_file_actions_addclose(&v107, v120[0]);
            posix_spawn_file_actions_adddup2(&v107, v120[1], 1);
            posix_spawn_file_actions_adddup2(&v107, v120[1], 2);
            posix_spawn_file_actions_addclose(&v107, v120[1]);
            posix_spawn_file_actions_addclose(&v107, v119[1]);
            posix_spawn_file_actions_adddup2(&v107, v119[0], 0);
            posix_spawn_file_actions_addclose(&v107, v119[0]);
          }
          id v93 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_WorkingDirectory[0]];
          if (v93 && [v93 length])
          {
            v42 = [MEMORY[0x263F08850] defaultManager];
            if ([v42 fileExistsAtPath:v93 isDirectory:&v110])
            {
              BOOL v43 = v110 == 0;

              if (!v43) {
                posix_spawn_file_actions_addchdir_np(&v107, (const char *)[v93 fileSystemRepresentation]);
              }
            }
            else
            {
            }
          }
          [v99 count];
          v90[1] = v90;
          MEMORY[0x270FA5388]();
          v48 = (char *const *)((char *)v90 - ((v47 + 47) & 0xFFFFFFFFFFFFFFF0));
          if (v46 >= 0x200) {
            size_t v49 = 512;
          }
          else {
            size_t v49 = v46;
          }
          bzero((char *)v90 - ((v47 + 47) & 0xFFFFFFFFFFFFFFF0), v49);
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v117 = 0x2020000000;
          int v118 = 0;
          v50 = v97;
          v51 = strdup((const char *)[(__CFString *)v50 UTF8String]);
          uint64_t v52 = *(int *)(*((void *)&buf + 1) + 24);
          *(_DWORD *)(*((void *)&buf + 1) + 24) = v52 + 1;
          v48[v52] = v51;
          id v92 = [v12 objectForKeyedSubscript:DTProcessControlServiceOption_DisableTALAutomaticTerminationKey[0]];
          if (v92 && (objc_opt_respondsToSelector() & 1) != 0 && [v92 longValue])
          {
            v53 = strdup("-NSDisableAutomaticTermination");
            v54 = v50;
            uint64_t v55 = *((void *)&buf + 1);
            uint64_t v56 = *(int *)(*((void *)&buf + 1) + 24);
            *(_DWORD *)(*((void *)&buf + 1) + 24) = v56 + 1;
            v48[v56] = v53;
            v57 = strdup("YES");
            *(_DWORD *)(v55 + 24) = v56 + 2;
            v50 = v54;
            v48[(int)v56 + 1] = v57;
          }
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          id v58 = v99;
          uint64_t v59 = [v58 countByEnumeratingWithState:&v103 objects:v115 count:16];
          if (v59)
          {
            uint64_t v60 = *(void *)v104;
            do
            {
              for (uint64_t i = 0; i != v59; ++i)
              {
                if (*(void *)v104 != v60) {
                  objc_enumerationMutation(v58);
                }
                id v62 = [*(id *)(*((void *)&v103 + 1) + 8 * i) description];
                v63 = strdup((const char *)[v62 UTF8String]);
                uint64_t v64 = *(int *)(*((void *)&buf + 1) + 24);
                *(_DWORD *)(*((void *)&buf + 1) + 24) = v64 + 1;
                v48[v64] = v63;
              }
              uint64_t v59 = [v58 countByEnumeratingWithState:&v103 objects:v115 count:16];
            }
            while (v59);
          }

          uint64_t v65 = *(int *)(*((void *)&buf + 1) + 24);
          *(_DWORD *)(*((void *)&buf + 1) + 24) = v65 + 1;
          v48[v65] = 0;
          [v100 count];
          MEMORY[0x270FA5388]();
          v68 = (char *const *)((char *)v90 - ((v67 + 23) & 0xFFFFFFFFFFFFFFF0));
          if (v66 >= 0x200) {
            size_t v69 = 512;
          }
          else {
            size_t v69 = v66;
          }
          bzero((char *)v90 - ((v67 + 23) & 0xFFFFFFFFFFFFFFF0), v69);
          *(_DWORD *)(*((void *)&buf + 1) + 24) = 0;
          v102[0] = MEMORY[0x263EF8330];
          v102[1] = 3221225472;
          v102[2] = sub_2308D8594;
          v102[3] = &unk_264B8F6A0;
          v102[4] = &buf;
          v102[5] = v68;
          [v100 enumerateKeysAndObjectsUsingBlock:v102];
          uint64_t v70 = *(int *)(*((void *)&buf + 1) + 24);
          *(_DWORD *)(*((void *)&buf + 1) + 24) = v70 + 1;
          v68[v70] = 0;
          v71 = [MEMORY[0x263EFFA40] standardUserDefaults];
          int v72 = [v71 BOOLForKey:@"DTPosixSpawnProcessControlServiceLog"];

          if (v72)
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
            {
              int v74 = *(_DWORD *)(*((void *)&buf + 1) + 24) - 1;
              int v111 = 67109120;
              int v112 = v74;
              _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "passing %d environment variables:", (uint8_t *)&v111, 8u);
            }
            uint64_t v75 = *((void *)&buf + 1);
            if (*(int *)(*((void *)&buf + 1) + 24) >= 2)
            {
              uint64_t v76 = 0;
              v77 = MEMORY[0x263EF8438];
              *(void *)&long long v73 = 67109378;
              long long v91 = v73;
              do
              {
                if (v68[v76])
                {
                  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                  {
                    v78 = v68[v76];
                    int v111 = v91;
                    int v112 = v76;
                    __int16 v113 = 2080;
                    v114 = v78;
                    _os_log_impl(&dword_23087D000, v77, OS_LOG_TYPE_INFO, "- %d: %s", (uint8_t *)&v111, 0x12u);
                  }
                  uint64_t v75 = *((void *)&buf + 1);
                }
                ++v76;
              }
              while (v76 < *(int *)(v75 + 24) - 1);
            }
          }
          unsigned int v101 = 0;
          v79 = v50;
          int v80 = posix_spawn((pid_t *)&v101, (const char *)[(__CFString *)v79 UTF8String], &v107, &v109, v48, v68);
          if (v101 && DTProcessShouldCaptureOutputWithOptions(v12)) {
            (*((void (**)(id, void, void, void))v98 + 2))(v98, v101, v119[1], v120[0]);
          }
          v81 = *v48;
          if (*v48)
          {
            v82 = (char **)(v48 + 1);
            do
            {
              free(v81);
              v83 = *v82++;
              v81 = v83;
            }
            while (v83);
          }
          v84 = *v68;
          if (*v68)
          {
            v85 = (char **)(v68 + 1);
            do
            {
              free(v84);
              v86 = *v85++;
              v84 = v86;
            }
            while (v86);
          }
          if (v119[0] != -1) {
            close(v119[0]);
          }
          if (v119[1] != -1) {
            close(v119[1]);
          }
          if (v120[0] != -1) {
            close(v120[0]);
          }
          if (v120[1] != -1) {
            close(v120[1]);
          }
          posix_spawn_file_actions_destroy(&v107);
          posix_spawnattr_destroy(&v109);
          if (v80)
          {
            v87 = [@" (" stringByAppendingFormat:CFSTR("%s")] (strerror(v80));
            v88 = [v87 stringByAppendingString:@""]);

            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              int v111 = 67109120;
              int v112 = v80;
              _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to set up posix_spawnattr_t: %d", (uint8_t *)&v111, 8u);
            }
            [MEMORY[0x263EFF940] raise:@"DTPosixSpawnFailureException", @"posix_spawn failure while launching: %@%@", v79, v88 format];
          }
          if (v80) {
            int v29 = 0;
          }
          else {
            int v29 = v101;
          }

          _Block_object_dispose(&buf, 8);
LABEL_120:

LABEL_121:
LABEL_122:

          v11 = v97;
LABEL_123:

          goto LABEL_124;
        }
LABEL_22:
        CFRelease(v20);
        goto LABEL_23;
      }
      v97 = 0;
    }
    else
    {
      v97 = 0;
      CFURLRef v24 = 0;
    }
    CFURLRef v26 = 0;
    char v27 = 1;
    goto LABEL_21;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_23087D000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to call posix_spawn with empty path", (uint8_t *)&buf, 2u);
  }
  [MEMORY[0x263EFF940] raise:@"DTPosixSpawnFailureException" format:@"Unable to call posix_spawn with empty path"];
  int v29 = 0;
LABEL_124:

  return v29;
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2308D8720;
  v10[3] = &unk_264B8F6C8;
  v10[4] = self;
  uint64_t v7 = +[DTPosixSpawnProcessControlService posixSpawnWithPath:a3 environment:a5 arguments:a6 options:a7 fileDescriptorHandler:v10];
  v8 = [NSNumber numberWithInt:v7];
  return v8;
}

- (int)cleanupPid:(int)a3
{
  int v4 = 0;
  if (waitpid(a3, &v4, 1) == a3) {
    return v4;
  }
  else {
    return 0x80000000;
  }
}

@end