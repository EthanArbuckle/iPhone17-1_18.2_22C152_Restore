@interface RemoteBundleLoader
- (RemoteBundleLoader)initWithTask:(unsigned int)a3;
- (void)_lookupFunctionAddresses:(_CSTypeRef)a3;
- (void)dealloc;
- (void)scheduleLibraryLoad:(id)a3 calling:(id)a4 arguments:(id)a5 callback:(id)a6;
@end

@implementation RemoteBundleLoader

- (void)_lookupFunctionAddresses:(_CSTypeRef)a3
{
  unint64_t opaque_2 = a3._opaque_2;
  unint64_t opaque_1 = a3._opaque_1;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_symbolLookupQueue);
  if (!self->_attemptedSymbolLookup)
  {
    self->_attemptedSymbolLookup = 1;
    dispatch_activate((dispatch_object_t)self->_injectionQueue);
    if ((CSIsNull() & 1) != 0 || !CSSymbolicatorGetSymbolOwnerCountAtTime())
    {
      self->_exited = 1;
    }
    else
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_2308F2274;
      aBlock[3] = &unk_264B8FD18;
      aBlock[5] = opaque_1;
      aBlock[6] = opaque_2;
      aBlock[4] = self;
      v6 = (uint64_t (**)(void *, const char *, const char *))_Block_copy(aBlock);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = sub_2308F25EC;
      v12[3] = &unk_264B8FD38;
      v12[4] = opaque_1;
      v12[5] = opaque_2;
      v7 = (uint64_t (**)(void *, const char *, const char *))_Block_copy(v12);
      remoteFunctionAddresses = self->_remoteFunctionAddresses;
      remoteFunctionAddresses->var2 = v6[2](v6, "mach_task_self_", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var3 = v6[2](v6, "mach_thread_self", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var4 = v6[2](v6, "mach_port_allocate", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var5 = v6[2](v6, "mach_port_mod_refs", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var6 = v6[2](v6, "mach_msg", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var7 = v6[2](v6, "thread_terminate", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var16 = v6[2](v6, "__syscall_logger", "libsystem_kernel.dylib");
      remoteFunctionAddresses->var14 = v6[2](v6, "_platform_strlcpy", "libsystem_platform.dylib");
      remoteFunctionAddresses->var8 = v6[2](v6, "pthread_create_from_mach_thread", "libsystem_pthread.dylib");
      remoteFunctionAddresses->var9 = v6[2](v6, "pthread_detach", "libsystem_pthread.dylib");
      uint64_t v9 = v7[2](v7, "pthread_self", "libsystem_pthread.dylib");
      remoteFunctionAddresses->var10 = v9;
      if (!v9) {
        remoteFunctionAddresses->var10 = v6[2](v6, "_pthread_self", "libsystem_pthread.dylib");
      }
      v10 = "libdyld.dylib";
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if (CSIsNull()) {
        v10 = "dyld_sim";
      }
      CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      if (CSIsNull()) {
        v11 = "dyld";
      }
      else {
        v11 = v10;
      }
      remoteFunctionAddresses->var11 = v6[2](v6, "dlopen", v11);
      remoteFunctionAddresses->var12 = v6[2](v6, "dlsym", v11);
      remoteFunctionAddresses->var13 = v6[2](v6, "dlerror", v11);
      remoteFunctionAddresses->var15 = v6[2](v6, "sandbox_extension_consume", "libsystem_sandbox.dylib");
    }
  }
}

- (RemoteBundleLoader)initWithTask:(unsigned int)a3
{
  v50.receiver = self;
  v50.super_class = (Class)RemoteBundleLoader;
  v5 = [(RemoteBundleLoader *)&v50 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  if (a3 - 1 < 0xFFFFFFFE)
  {
    v5->_targetTask = a3;
    if (!pid_for_task(a3, &v5->_targetPid))
    {
      v8 = (void *)MEMORY[0x263F086E0];
      uint64_t v9 = self;
      v10 = [v8 bundleForClass:v9];
      uint64_t v11 = [v10 pathForResource:@"RemoteInjectionAgent" ofType:0];
      helperLaunchPath = v6->_helperLaunchPath;
      v6->_helperLaunchPath = (NSString *)v11;

      v6->_remoteFunctionAddresses = ($9A2394F8224BDCEDFD6C01971D282B2A *)malloc_type_calloc(1uLL, 0x88uLL, 0x1000040B5CA6940uLL);
      LODWORD(v10) = v6->_targetPid;
      if (v10 == getpid())
      {
        v30 = [MEMORY[0x263F08690] currentHandler];
        [v30 handleFailureInMethod:a2 object:v6 file:@"RemoteBundleLoader.m" lineNumber:184 description:@"RemoteBundleLoader not intended for targeting calling process - use dlopen() instead"];
      }
      if (!v6->_helperLaunchPath)
      {
        v31 = [MEMORY[0x263F08690] currentHandler];
        [v31 handleFailureInMethod:a2 object:v6 file:@"RemoteBundleLoader.m" lineNumber:185 description:@"Unable to locate RemoteInjectionAgent; built products likely corrupt"];
      }
      dispatch_queue_t v13 = dispatch_queue_create("RemoteBundleLoader symbol lookup queue", 0);
      symbolLookupQueue = v6->_symbolLookupQueue;
      v6->_symbolLookupQueue = (OS_dispatch_queue *)v13;

      v15 = dispatch_queue_attr_make_initially_inactive(0);
      v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

      dispatch_queue_t v17 = dispatch_queue_create_with_target_V2("RemoteBundleLoader injection queue", v16, (dispatch_queue_t)v6->_symbolLookupQueue);
      injectionQueue = v6->_injectionQueue;
      v6->_injectionQueue = (OS_dispatch_queue *)v17;

      objc_initWeak(&location, v6);
      v19 = v6->_symbolLookupQueue;
      uint64_t v42 = MEMORY[0x263EF8330];
      uint64_t v43 = 3221225472;
      v44 = sub_2308F2A48;
      v45 = &unk_264B8FD88;
      v20 = v19;
      v46 = v20;
      unsigned int v48 = a3;
      objc_copyWeak(&v47, &location);
      uint64_t v21 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
      uint64_t v23 = v22;
      if (CSIsNull())
      {
        v24 = v6->_symbolLookupQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = sub_2308F2BFC;
        block[3] = &unk_264B8D590;
        v41 = v6;
        dispatch_sync(v24, block);
        id releaseOpaqueSymbolicator = v41;
      }
      else
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = sub_2308F2C0C;
        aBlock[3] = &unk_264B8FDA8;
        aBlock[4] = v21;
        aBlock[5] = v23;
        v26 = _Block_copy(aBlock);
        id releaseOpaqueSymbolicator = v6->_releaseOpaqueSymbolicator;
        v6->_id releaseOpaqueSymbolicator = v26;
      }

      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      v27 = v6->_symbolLookupQueue;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = sub_2308F2C18;
      v32[3] = &unk_264B8EC38;
      v34 = &v35;
      v6 = v6;
      v33 = v6;
      dispatch_sync(v27, v32);
      int v28 = *((unsigned __int8 *)v36 + 24);
      if (*((unsigned char *)v36 + 24))
      {

        v6 = 0;
      }

      _Block_object_dispose(&v35, 8);
      objc_destroyWeak(&v47);

      objc_destroyWeak(&location);
      if (v28) {
        goto LABEL_5;
      }
LABEL_16:
      v6 = v6;
      v7 = v6;
      goto LABEL_17;
    }
  }

  v6 = 0;
LABEL_5:
  v7 = 0;
LABEL_17:

  return v7;
}

- (void)dealloc
{
  id releaseOpaqueSymbolicator = (void (**)(id, SEL))self->_releaseOpaqueSymbolicator;
  if (releaseOpaqueSymbolicator)
  {
    releaseOpaqueSymbolicator[2](releaseOpaqueSymbolicator, a2);
    id v4 = self->_releaseOpaqueSymbolicator;
    self->_id releaseOpaqueSymbolicator = 0;
  }
  remoteFunctionAddresses = self->_remoteFunctionAddresses;
  if (remoteFunctionAddresses)
  {
    free(remoteFunctionAddresses);
    self->_remoteFunctionAddresses = 0;
  }
  if (!self->_attemptedSymbolLookup)
  {
    injectionQueue = self->_injectionQueue;
    if (injectionQueue) {
      dispatch_activate(injectionQueue);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)RemoteBundleLoader;
  [(RemoteBundleLoader *)&v7 dealloc];
}

- (void)scheduleLibraryLoad:(id)a3 calling:(id)a4 arguments:(id)a5 callback:(id)a6
{
  v105[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(void, void))v13;
  if (v10)
  {
    v15 = [MEMORY[0x263F08850] defaultManager];
    char v16 = [v15 fileExistsAtPath:v10];

    if (v16)
    {
      if (v11)
      {
        *(_OWORD *)task_info_out = 0u;
        long long v80 = 0u;
        mach_msg_type_number_t task_info_outCnt = 8;
        uint64_t v17 = task_info(self->_targetTask, 0xFu, task_info_out, &task_info_outCnt);
        if (v17)
        {
          if (v14)
          {
            v18 = (void *)MEMORY[0x263F087E8];
            uint64_t v91 = *MEMORY[0x263F08320];
            v19 = [NSString stringWithFormat:@"Unable to audit target sandbox: %d (target %d likely exited)", v17, self->_targetPid];
            v92 = v19;
            v20 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
            uint64_t v21 = [v18 errorWithDomain:@"RemoteBundleLoaderError" code:1 userInfo:v20];
            ((void (**)(void, void *))v14)[2](v14, v21);
          }
          uint64_t v22 = (void *)MEMORY[0x263EFFA68];
          goto LABEL_22;
        }
        long long v93 = *(_OWORD *)task_info_out;
        long long v94 = v80;
        id v37 = v10;
        char v38 = [MEMORY[0x263EFF9C0] setWithObject:v37];
        v39 = [v37 stringByResolvingSymlinksInPath];
        v40 = [v39 stringByDeletingLastPathComponent];

        id v41 = v37;
        uint64_t v42 = (const char *)[v41 UTF8String];
        callback[0] = MEMORY[0x263EF8330];
        callback[1] = 3221225472;
        callback[2] = sub_2308F3C18;
        callback[3] = &unk_264B8FE70;
        id v43 = v41;
        id v86 = v43;
        id v68 = v40;
        id v87 = v68;
        id v44 = v38;
        id v88 = v44;
        int v45 = macho_for_each_slice(v42, callback);
        v69 = v43;
        v67 = v44;
        if (!v45) {
          goto LABEL_27;
        }
        v46 = (void *)MEMORY[0x263F087E8];
        uint64_t v104 = *MEMORY[0x263F08320];
        id v47 = [NSString stringWithFormat:@"Failed to iterate through the mach-o file at path: '%@': due to an error: %s", v43, strerror(v45)];
        v105[0] = v47;
        unsigned int v48 = [NSDictionary dictionaryWithObjects:v105 forKeys:&v104 count:1];
        v49 = [v46 errorWithDomain:@"RemoteBundleLoaderError" code:0 userInfo:v48];

        if (v49)
        {
          id v50 = v49;
          uint64_t v22 = 0;
          id v51 = v50;
        }
        else
        {
LABEL_27:
          v65 = self;
          id v66 = v11;
          id v50 = (id)objc_opt_new();
          long long v81 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id obj = v44;
          uint64_t v52 = [obj countByEnumeratingWithState:&v81 objects:v103 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v82;
            while (2)
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v82 != v54) {
                  objc_enumerationMutation(obj);
                }
                id v56 = *(id *)(*((void *)&v81 + 1) + 8 * i);
                [v56 UTF8String];
                v102[0] = v93;
                v102[1] = v94;
                uint64_t v57 = sandbox_extension_issue_file_to_process();
                if (!v57)
                {
                  v60 = (void *)MEMORY[0x263F087E8];
                  uint64_t v101 = *MEMORY[0x263F08320];
                  v61 = [NSString stringWithFormat:@"Unable to issue sandbox extension for path: %@", v56];
                  *(void *)&v102[0] = v61;
                  v62 = [NSDictionary dictionaryWithObjects:v102 forKeys:&v101 count:1];
                  id v51 = [v60 errorWithDomain:@"RemoteBundleLoaderError" code:2 userInfo:v62];

                  uint64_t v22 = 0;
                  goto LABEL_37;
                }
                v58 = (void *)v57;
                v59 = [NSString stringWithUTF8String:v57];
                [v50 addObject:v59];

                free(v58);
              }
              uint64_t v53 = [obj countByEnumeratingWithState:&v81 objects:v103 count:16];
              if (v53) {
                continue;
              }
              break;
            }
          }

          id v50 = v50;
          id v51 = 0;
          uint64_t v22 = v50;
LABEL_37:
          id v11 = v66;
          self = v65;
        }

        id v63 = v51;
        if (v63)
        {
          v64 = v63;
          ((void (**)(void, id))v14)[2](v14, v63);

          goto LABEL_22;
        }
LABEL_12:
        int v28 = DVTLaunchHelperProcess(self->_helperLaunchPath, self->_targetPid, 0, self->_targetTask);
        v29 = v28;
        if (v28)
        {
          [v28 resume];
          injectionQueue = self->_injectionQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = sub_2308F34FC;
          block[3] = &unk_264B8FDF8;
          void block[4] = self;
          v77 = v14;
          id v72 = v10;
          id v73 = v22;
          id v74 = v11;
          id v75 = v12;
          id v76 = v29;
          dispatch_async(injectionQueue, block);
        }
        else if (v14)
        {
          v33 = (void *)MEMORY[0x263F087E8];
          uint64_t v89 = *MEMORY[0x263F08320];
          v34 = [NSString stringWithFormat:@"Unable to launch RemoteInjectionAgent"];
          v90 = v34;
          uint64_t v35 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
          v36 = [v33 errorWithDomain:@"RemoteBundleLoaderError" code:2 userInfo:v35];
          ((void (**)(void, void *))v14)[2](v14, v36);
        }
        goto LABEL_22;
      }
      if (v14)
      {
        uint64_t v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v95 = *MEMORY[0x263F08320];
        uint64_t v22 = [NSString stringWithFormat:@"No function specified"];
        v96 = v22;
        v24 = NSDictionary;
        v25 = &v96;
        v26 = &v95;
        goto LABEL_18;
      }
    }
    else
    {
      id v27 = v10;
      [v27 UTF8String];
      if (_dyld_shared_cache_real_path())
      {
        uint64_t v22 = (void *)MEMORY[0x263EFFA68];
        goto LABEL_12;
      }
      if (v14)
      {
        uint64_t v23 = (void *)MEMORY[0x263F087E8];
        uint64_t v97 = *MEMORY[0x263F08320];
        uint64_t v22 = [NSString stringWithFormat:@"No dylib found at path: %@", v27];
        v98 = v22;
        v24 = NSDictionary;
        v25 = &v98;
        v26 = &v97;
        goto LABEL_18;
      }
    }
  }
  else if (v13)
  {
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v99 = *MEMORY[0x263F08320];
    uint64_t v22 = [NSString stringWithFormat:@"No dylib path specified"];
    v100 = v22;
    v24 = NSDictionary;
    v25 = &v100;
    v26 = &v99;
LABEL_18:
    v31 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    v32 = [v23 errorWithDomain:@"RemoteBundleLoaderError" code:0 userInfo:v31];
    ((void (**)(void, void *))v14)[2](v14, v32);

LABEL_22:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_missingSymbolError, 0);
  objc_storeStrong((id *)&self->_injectionQueue, 0);
  objc_storeStrong((id *)&self->_symbolLookupQueue, 0);
  objc_storeStrong((id *)&self->_helperLaunchPath, 0);
  objc_storeStrong(&self->_releaseOpaqueSymbolicator, 0);
}

@end