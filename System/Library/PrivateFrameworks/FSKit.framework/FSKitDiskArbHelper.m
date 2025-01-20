@interface FSKitDiskArbHelper
+ (id)getFileProviderID;
+ (id)waitForPreviousTasksToComplete:(id)a3 client:(id)a4;
+ (int)DAMountFSKitVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 mountOptions:(id)a7;
+ (int)DAMountUserFSVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 auditToken:(id *)a7 mountOptions:(id)a8;
+ (int)DAMountUserFSVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 mountOptions:(id)a7;
@end

@implementation FSKitDiskArbHelper

+ (id)getFileProviderID
{
  return @"com.apple.filesystems.UserFS.FileProvider";
}

+ (id)waitForPreviousTasksToComplete:(id)a3 client:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  id v37 = (id)objc_opt_new();
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke;
  v21[3] = &unk_26530B558;
  id v7 = v5;
  id v22 = v7;
  v23 = &v32;
  [v6 currentTasksSync:v21];
  if ([(id)v33[5] count])
  {
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_3;
    aBlock[3] = &unk_26530C338;
    id v17 = v7;
    v19 = &v32;
    v20 = v24;
    v9 = v8;
    v18 = v9;
    v10 = _Block_copy(aBlock);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_5;
    v15[3] = &unk_26530B770;
    v15[4] = &v26;
    [v6 setTaskUpdateHandler:v10 replyHandler:v15];
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v9, v11);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_6;
    v14[3] = &unk_26530B770;
    v14[4] = &v26;
    [v6 setTaskUpdateHandler:0 replyHandler:v14];
    id v12 = (id)v27[5];
  }
  else
  {
    id v12 = 0;
  }

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v12;
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_2;
  v6[3] = &unk_26530C310;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 enumerateObjectsUsingBlock:v6];
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 taskResource];
  id v4 = [v3 getResourceID];
  uint64_t v5 = [*(id *)(a1 + 32) getResourceID];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 taskState] == 3)
  {
    id v7 = [v5 taskResource];
    uint64_t v8 = [v7 getResourceID];
    v9 = [*(id *)(a1 + 32) getResourceID];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      id v22 = __Block_byref_object_copy__5;
      v23 = __Block_byref_object_dispose__5;
      id v24 = 0;
      dispatch_time_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      v15 = __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_4;
      v16 = &unk_26530C310;
      id v17 = v5;
      v18 = &v19;
      [v11 enumerateObjectsUsingBlock:&v13];
      if (v20[5]) {
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "removeObject:", v13, v14, v15, v16);
      }

      _Block_object_dispose(&v19, 8);
    }
  }
  id v12 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_sync_enter(v12);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && ![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  objc_sync_exit(v12);
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 taskID];
  uint64_t v8 = [*(id *)(a1 + 32) taskID];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 description];
    NSLog(&cfstr_ErrorSettingUp.isa, [v5 UTF8String]);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v6;
  }
}

void __60__FSKitDiskArbHelper_waitForPreviousTasksToComplete_client___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 description];
    NSLog(&cfstr_ErrorSettingUp.isa, [v5 UTF8String]);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v6;
  }
}

+ (int)DAMountFSKitVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 mountOptions:(id)a7
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v12 = a3;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v50 = a5;
  id v49 = a6;
  id v14 = a7;
  v15 = fskit_std_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v89 = v13;
    *(_WORD *)v90 = 2112;
    *(void *)&v90[2] = v50;
    *(_WORD *)&v90[10] = 2112;
    *(void *)&v90[12] = v49;
    __int16 v91 = 2112;
    id v92 = v14;
    _os_log_debug_impl(&dword_24DDB2000, v15, OS_LOG_TYPE_DEBUG, "%s:start:fsShortName(%@):deviceName(%@):mountPoint(%@):volumeName(%@):mountOptionString(%@)", buf, 0x3Eu);
  }

  v16 = objc_opt_new();
  id v17 = objc_opt_new();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v89 = __Block_byref_object_copy__5;
  *(void *)v90 = __Block_byref_object_dispose__5;
  *(void *)&v90[8] = 0;
  uint64_t v18 = [v14 containsString:@"rdonly"];
  if ([v12 isEqualToString:@"passthroughfs"])
  {
    uint64_t v19 = [NSURL fileURLWithPath:v13];
    v20 = +[FSGenericURLResource secureResourceWithURL:v19 readonly:v18];
  }
  else
  {
    v20 = +[FSBlockDeviceResource proxyResourceForBSDName:v13 isWritable:v18 ^ 1];
  }
  uint64_t v21 = +[FSKitDiskArbHelper waitForPreviousTasksToComplete:v20 client:v16];
  id v22 = *(void **)(*(void *)&buf[8] + 40);
  *(void *)(*(void *)&buf[8] + 40) = v21;

  v23 = *(void **)(*(void *)&buf[8] + 40);
  if (v23)
  {
    int v24 = [v23 code];
  }
  else
  {
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__5;
    v78 = __Block_byref_object_dispose__5;
    id v79 = 0;
    v47 = [a1 getFileProviderID];
    v48 = objc_msgSend(MEMORY[0x263F522A0], "newClientForProvider:");
    char v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke;
    v70[3] = &unk_26530C360;
    v72 = buf;
    v73 = &v74;
    uint64_t v26 = v25;
    v71 = v26;
    [v16 loadResource:v20 shortName:v12 options:v17 replyHandler:v70];
    dispatch_time_t v27 = dispatch_time(0, 20000000000);
    if (dispatch_group_wait(v26, v27))
    {
      uint64_t v28 = fs_errorForPOSIXError(60);
      v29 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v28;

      v30 = fskit_std_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        +[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]((uint64_t)v13, (uint64_t)&buf[8], v30);
      }
    }
    id v31 = *(void **)(*(void *)&buf[8] + 40);
    if (v31)
    {
      int v24 = [v31 code];
    }
    else
    {
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      uint64_t v69 = 0;
      uint64_t v32 = (void *)v75[5];
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27;
      v53[3] = &unk_26530C3B0;
      id v33 = v16;
      id v54 = v33;
      id v34 = v12;
      id v55 = v34;
      id v56 = v17;
      v63 = buf;
      v45 = v13;
      v57 = v45;
      id v58 = v48;
      id v59 = v47;
      id v60 = 0;
      id v61 = v50;
      int v65 = 4096;
      id v62 = v14;
      v64 = &v66;
      [v32 enumerateObjectsUsingBlock:v53];
      if (!v67[3])
      {
        v44 = objc_opt_new();
        v35 = dispatch_group_create();
        dispatch_group_enter(v35);
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_31;
        v51[3] = &unk_26530B2D0;
        dispatch_group_t group = v35;
        dispatch_group_t v52 = group;
        [v33 unloadResource:v20 shortName:v34 options:v44 replyHandler:v51];
        dispatch_time_t v36 = dispatch_time(0, 20000000000);
        if (dispatch_group_wait(group, v36))
        {
          uint64_t v37 = fs_errorForPOSIXError(60);
          v38 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v37;

          v39 = fskit_std_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v42 = [v20 getResourceID];
            uint64_t v43 = *(void *)(*(void *)&buf[8] + 40);
            *(_DWORD *)v80 = 136315906;
            v81 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]";
            __int16 v82 = 2112;
            v83 = v45;
            __int16 v84 = 2112;
            v85 = v42;
            __int16 v86 = 2112;
            uint64_t v87 = v43;
            _os_log_error_impl(&dword_24DDB2000, v39, OS_LOG_TYPE_ERROR, "%s: %@ failed to unloadResource (%@) error (%@)", v80, 0x2Au);
          }
        }
      }
      v40 = *(void **)(*(void *)&buf[8] + 40);
      if (v40) {
        int v24 = [v40 code];
      }
      else {
        int v24 = 0;
      }

      _Block_object_dispose(&v66, 8);
    }

    _Block_object_dispose(&v74, 8);
  }

  _Block_object_dispose(buf, 8);
  return v24;
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (v7)
  {
    uint64_t v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27_cold_3(v6, v7);
  }

  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  int v9 = *(void **)(a1 + 32);
  id v10 = [v6 volumeID];
  uint64_t v12 = a1 + 104;
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_28;
  v51[3] = &unk_26530C388;
  uint64_t v54 = v11;
  id v15 = v6;
  id v52 = v15;
  v16 = v8;
  v53 = v16;
  [v9 activateVolume:v10 shortName:v13 options:v14 replyHandler:v51];

  dispatch_time_t v17 = dispatch_time(0, 20000000000);
  if (dispatch_group_wait(v16, v17))
  {
    uint64_t v18 = fs_errorForPOSIXError(60);
    uint64_t v19 = *(void *)(*(void *)v12 + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  if (*(void *)(*(void *)(*(void *)v12 + 8) + 40))
  {
    uint64_t v21 = fskit_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27_cold_2();
    }

    *a4 = 1;
  }
  else
  {
    id v22 = [v15 volumeID];
    v23 = [v22 description];

    int v24 = *(void **)(a1 + 64);
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = [v15 volumeName];
    dispatch_time_t v27 = [v26 string];
    uint64_t v28 = [v24 mountVolume:v23 fileSystem:v25 displayName:v27 provider:*(void *)(a1 + 72) domainError:*(void *)(a1 + 80) on:*(void *)(a1 + 88) how:*(int *)(a1 + 120) options:*(void *)(a1 + 96)];
    uint64_t v29 = *(void *)(*(void *)(a1 + 104) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
    {
      v47 = v23;
      id v31 = fskit_std_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27_cold_1();
      }

      dispatch_group_enter(v16);
      uint64_t v32 = *(void **)(a1 + 32);
      id v33 = [v15 volumeID];
      uint64_t v34 = *(void *)(a1 + 40);
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_29;
      v48[3] = &unk_26530B258;
      v35 = v15;
      id v49 = v35;
      dispatch_time_t v36 = v16;
      id v50 = v36;
      [v32 deactivateVolume:v33 shortName:v34 numericOptions:2 replyHandler:v48];

      dispatch_time_t v37 = dispatch_time(0, 20000000000);
      intptr_t v38 = dispatch_group_wait(v36, v37);
      v23 = v47;
      if (v38)
      {
        uint64_t v39 = fs_errorForPOSIXError(60);
        uint64_t v40 = *(void *)(*(void *)v12 + 8);
        v41 = *(void **)(v40 + 40);
        *(void *)(v40 + 40) = v39;

        v42 = fskit_std_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v44 = *(void **)(a1 + 56);
          v45 = [v35 volumeID];
          uint64_t v46 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
          *(_DWORD *)buf = 136315906;
          id v56 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]_block_invoke";
          __int16 v57 = 2112;
          id v58 = v44;
          __int16 v59 = 2112;
          id v60 = v45;
          __int16 v61 = 2112;
          uint64_t v62 = v46;
          _os_log_error_impl(&dword_24DDB2000, v42, OS_LOG_TYPE_ERROR, "%s: %@ failed to deactivateVolume (%@) error (%@)", buf, 0x2Au);

          v23 = v47;
        }
      }
      *a4 = 1;

      uint64_t v43 = v49;
    }
    else
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
      uint64_t v43 = fskit_std_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v56 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]_block_invoke";
        __int16 v57 = 2112;
        id v58 = v23;
        _os_log_impl(&dword_24DDB2000, v43, OS_LOG_TYPE_INFO, "%s: Mounted %@ successfully.", buf, 0x16u);
      }
    }
  }
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_28(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = fskit_std_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();
    }
  }
  else if (v6)
  {
    __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_28_cold_1(a1);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fskit_std_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();
    }
  }
  else if (v5)
  {
    __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_29_cold_1(a1);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = fskit_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (int)DAMountUserFSVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 mountOptions:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  dispatch_time_t v17 = +[FSAuditToken token];
  uint64_t v18 = v17;
  if (v17) {
    objc_msgSend(v17, "audit_token");
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  int v19 = [a1 DAMountUserFSVolume:v12 deviceName:v13 mountPoint:v14 volumeName:v15 auditToken:v21 mountOptions:v16];

  return v19;
}

+ (int)DAMountUserFSVolume:(id)a3 deviceName:(id)a4 mountPoint:(id)a5 volumeName:(id)a6 auditToken:(id *)a7 mountOptions:(id)a8
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (![v14 hasSuffix:@"_fskit"])
  {
    id v50 = v18;
    uint64_t v49 = MEMORY[0x25332B920]();
    id v21 = +[stolenUSBLocalStorageClient newManager];
    __int16 v59 = (void *)[MEMORY[0x263F522A0] newClientForProvider:@"com.apple.filesystems.UserFS.FileProvider"];
    id v64 = 0;
    uint64_t v54 = v21;
    a1 = [v21 loadVolumes:v15 ofType:v14 withError:&v64];
    id v22 = v64;
    id v51 = a1;
    if (v22)
    {
      v23 = v22;
      int v24 = fskit_std_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[FSKitDiskArbHelper DAMountUserFSVolume:deviceName:mountPoint:volumeName:auditToken:mountOptions:]((uint64_t)v15, (uint64_t)v23, v24);
      }

      uint64_t v25 = (void *)v49;
    }
    else
    {
      if (!a1)
      {
        uint64_t v25 = (void *)v49;
        goto LABEL_8;
      }
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id obj = a1;
      uint64_t v58 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v58)
      {
        id v56 = v16;
        id v57 = v14;
        id v48 = v15;
        id v27 = 0;
        v23 = 0;
        uint64_t v55 = *(void *)v61;
        uint64_t v53 = *MEMORY[0x263F08438];
        while (2)
        {
          for (uint64_t i = 0; i != v58; ++i)
          {
            uint64_t v29 = v23;
            v30 = v27;
            if (*(void *)v61 != v55) {
              objc_enumerationMutation(obj);
            }
            id v27 = *(id *)(*((void *)&v60 + 1) + 8 * i);

            id v31 = [v27 objectForKey:@"UUID"];
            uint64_t v32 = [v27 objectForKey:@"name"];
            if (v17 && ([v17 isEqual:v32] & 1) == 0)
            {
              id v33 = fskit_std_log();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v48;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v17;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&unsigned char buf[24] = v32;
                _os_log_impl(&dword_24DDB2000, v33, OS_LOG_TYPE_INFO, "%@: got 2 different names from probe and userfs: p->%@  u->%@", buf, 0x20u);
              }

              if ([v32 isEqual:@"Untitled"])
              {
                id v34 = v17;

                uint64_t v32 = v34;
              }
            }
            v35 = [v27 objectForKeyedSubscript:@"how"];
            int v36 = [v35 intValue];

            dispatch_time_t v37 = [v27 objectForKeyedSubscript:@"errorForDomain"];

            if (v37)
            {
              intptr_t v38 = [v27 objectForKeyedSubscript:@"errorForDomain"];
              uint64_t v39 = [v38 integerValue];

              if (v39 != -1000)
              {
                v47 = fskit_std_log();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = v39;
                  _os_log_error_impl(&dword_24DDB2000, v47, OS_LOG_TYPE_ERROR, "unsupported error code for domain: %ld", buf, 0xCu);
                }

                v23 = [MEMORY[0x263F087E8] errorWithDomain:v53 code:22 userInfo:0];

                uint64_t v46 = obj;
                id obj = v27;
                goto LABEL_44;
              }
              uint64_t v40 = [MEMORY[0x263F087E8] errorWithDomain:v53 code:80 userInfo:0];
            }
            else
            {
              uint64_t v40 = 0;
            }
            v41 = fskit_std_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              *(void *)&uint8_t buf[4] = v31;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v32;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&unsigned char buf[24] = v40;
              __int16 v66 = 1024;
              int v67 = v36;
              _os_log_impl(&dword_24DDB2000, v41, OS_LOG_TYPE_INFO, "%@ mounting with name %@, error %@, and how 0x%x.", buf, 0x26u);
            }

            long long v42 = *(_OWORD *)&a7->var0[4];
            *(_OWORD *)buf = *(_OWORD *)a7->var0;
            *(_OWORD *)&buf[16] = v42;
            v23 = [v59 mountVolume:v31 fileSystem:v57 displayName:v32 provider:@"com.apple.filesystems.UserFS.FileProvider" domainError:v40 on:v56 how:v36 options:0 auditToken:buf];

            uint64_t v43 = fskit_std_log();
            v44 = v43;
            if (v23)
            {
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v48;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v23;
                _os_log_error_impl(&dword_24DDB2000, v44, OS_LOG_TYPE_ERROR, "%@ mount failed with %@", buf, 0x16u);
              }

              v44 = [v54 forgetVolume:v31 withFlags:0];
              if (v44)
              {
                v45 = fskit_std_log();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v32;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v44;
                  _os_log_error_impl(&dword_24DDB2000, v45, OS_LOG_TYPE_ERROR, "unload for volume %@ failed with %@", buf, 0x16u);
                }
              }
            }
            else if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v31;
              _os_log_impl(&dword_24DDB2000, v44, OS_LOG_TYPE_INFO, "Mounted %@ successfully.", buf, 0xCu);
            }
          }
          uint64_t v58 = [obj countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v58) {
            continue;
          }
          break;
        }
        uint64_t v46 = v27;
LABEL_44:
        id v15 = v48;
        uint64_t v25 = (void *)v49;
        id v18 = v50;

        id v16 = v56;
        id v14 = v57;
      }
      else
      {
        v23 = 0;
        uint64_t v25 = (void *)v49;
      }

      if (!v23)
      {
        LODWORD(a1) = 0;
        goto LABEL_8;
      }
    }
    LODWORD(a1) = [v23 code];

LABEL_8:

    goto LABEL_9;
  }
  int v19 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"_"];
  uint64_t v20 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "rangeOfCharacterFromSet:", v19));

  LODWORD(a1) = [a1 DAMountFSKitVolume:v20 deviceName:v15 mountPoint:v16 volumeName:v17 mountOptions:v18];
  id v14 = (id)v20;
LABEL_9:

  return (int)a1;
}

+ (void)DAMountFSKitVolume:(NSObject *)a3 deviceName:mountPoint:volumeName:mountOptions:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 136315650;
  *(void *)&v3[4] = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_2_2(&dword_24DDB2000, a2, a3, "%s: %@ failed to load resource (%@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *(void *)(*(void *)a2 + 40));
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10_0(&dword_24DDB2000, v0, v1, "%s:error:%@", v2, v3, v4, v5, 2u);
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_24DDB2000, v0, v1, "%s: %@ mount failed with %@", v2);
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27_cold_2()
{
  OUTLINED_FUNCTION_4_1(*MEMORY[0x263EF8340]);
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(&dword_24DDB2000, v0, v1, "%s: %@ failed to activate volume (%@)", v2);
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_27_cold_3(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 volumeName];
  uint64_t v5 = [v4 string];
  BOOL v6 = [a1 volumeID];
  int v7 = 136315650;
  uint64_t v8 = "+[FSKitDiskArbHelper DAMountFSKitVolume:deviceName:mountPoint:volumeName:mountOptions:]_block_invoke";
  __int16 v9 = 2112;
  id v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_debug_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_DEBUG, "%s: Activating volumeName (%@) volumeID (%@)", (uint8_t *)&v7, 0x20u);
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_28_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) volumeID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:done activating volume (%@)", v4, v5, v6, v7, 2u);
}

void __87__FSKitDiskArbHelper_DAMountFSKitVolume_deviceName_mountPoint_volumeName_mountOptions___block_invoke_29_cold_1(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) volumeID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s:done deactivating volume (%@)", v4, v5, v6, v7, 2u);
}

+ (void)DAMountUserFSVolume:(os_log_t)log deviceName:mountPoint:volumeName:auditToken:mountOptions:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_24DDB2000, log, OS_LOG_TYPE_ERROR, "%@ loadVolumes failed with %@", (uint8_t *)&v3, 0x16u);
}

@end