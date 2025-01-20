@interface LSCopyOrMoveFileResource
@end

@implementation LSCopyOrMoveFileResource

uint64_t ___LSCopyOrMoveFileResource_block_invoke(uint64_t a1)
{
  v83[1] = *(id *)MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x18530F680]();
  v3 = [MEMORY[0x1E4F29060] currentThread];
  [v3 setName:@"LS MDT helper thread/run loop"];

  CFTypeRef cf = 0;
  v4 = objc_alloc_init(_LSOpenCopierContext);
  id v5 = *(id *)(a1 + 32);
  LOBYTE(v70) = 0;
  char v71 = 0;
  if (*(unsigned char *)(a1 + 72))
  {
    v6 = 0;
LABEL_3:
    uint64_t v7 = 3;
    goto LABEL_4;
  }
  v18 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 32);
  id v20 = v18;
  v21 = v20;
  long long v73 = xmmword_182AF9050;
  uint64_t v74 = 0;
  DWORD2(v73) = -2147352576;
  if (!v20)
  {
    v83[0] = *(id *)MEMORY[0x1E4F28228];
    *(void *)buf = @"Missing resource file handle";
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v83 count:1];
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -50, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", 317, v43);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_33;
  }
  if (fstat([v20 fileDescriptor], &v76) < 0 || fstatfs(objc_msgSend(v21, "fileDescriptor"), &v80) < 0)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v41 = 322;
LABEL_30:
    _LSMakeNSErrorImpl(v40, *v39, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", v41, 0);
    id v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
    id v44 = v42;
    v6 = 0;
    id v42 = v44;
    v22 = v19;
    goto LABEL_34;
  }
  if (getattrlist(v80.f_mntonname, &v73, v75, 0x24uLL, 0x800u) < 0)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v41 = 327;
    goto LABEL_30;
  }
  if (fcntl([v21 fileDescriptor], 50, v79) == -1)
  {
    v39 = __error();
    v40 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v41 = 338;
    goto LABEL_30;
  }
  v22 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v79 isDirectory:(v76.st_mode & 0xF000) == 0x4000 relativeToURL:0];

  if (v80.f_flags) {
    goto LABEL_68;
  }
  if ((v75[10] & 1) == 0 || *(unsigned __int16 *)v80.f_mntonname == 47)
  {
    if (*(unsigned __int16 *)v80.f_mntonname != 47)
    {
      v56 = _LSDefaultLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v22;
        _os_log_impl(&dword_182959000, v56, OS_LOG_TYPE_DEFAULT, "Open of %@ from writable non-clone-supporting filesystem is unexpected.", buf, 0xCu);
      }

      if ((v76.st_mode & 0xF000) == 0x8000)
      {
        v83[0] = 0;
        copyProvidedResourceToStagingContainerRegularFile(v22, v21, v83, buf);
        id v42 = v83[0];
        v6 = *(id **)buf;
        goto LABEL_76;
      }
      v83[0] = *(id *)MEMORY[0x1E4F28228];
      *(void *)buf = @"Open of non-regular file from writable filesystem requires clone support";
      v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v83 count:1];
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"_LSStageOrConfirmInPlaceOpenabilityOfFileResource", 355, v43);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = v22;
      goto LABEL_32;
    }
LABEL_68:
    operator new();
  }
  id v23 = v22;
  id v24 = v21;
  *(void *)buf = 0;
  v68 = v24;
  uint64_t v25 = getFileProtectionValueForFileHandle(v24, buf);
  id v26 = *(id *)buf;
  v27 = v26;
  if (v25)
  {
    v66 = (void *)v25;
    v28 = +[LSOpenStagingDirectoryManager sharedServerInstance];
    v83[0] = v27;
    v67 = [v28 stagingDirectoryForCloningFileHandle:v24 error:v83];
    id v29 = v83[0];

    if (v67)
    {
      v30 = [MEMORY[0x1E4F29128] UUID];
      v31 = [v30 UUIDString];
      v65 = [v67 URLByAppendingPathComponent:v31];

      v32 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v81 = *MEMORY[0x1E4F1C590];
      v82 = v66;
      v62 = v32;
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
      id v77 = v29;
      LODWORD(v32) = [v32 createDirectoryAtURL:v65 withIntermediateDirectories:0 attributes:v33 error:&v77];
      id v64 = v77;

      if (v32)
      {
        v34 = [v23 lastPathComponent];
        v35 = [v65 URLByAppendingPathComponent:v34];

        id v61 = v65;
        id v36 = v35;
        id v60 = v68;
        LODWORD(v34) = [v60 fileDescriptor];
        id v63 = v36;
        if (!fclonefileat((int)v34, -2, (const char *)[v63 fileSystemRepresentation], 1u)) {
          operator new();
        }
        v37 = __error();
        _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], *v37, (uint64_t)"stageResourceByCloningHandle", 233, 0);
        id v38 = (id)objc_claimAutoreleasedReturnValue();

        id v57 = v38;
        id v64 = v57;
      }

      id v29 = v64;
    }
    else
    {
    }
  }
  else
  {
    id v29 = v26;
  }
  id v58 = v29;
  v6 = 0;
  id v59 = v58;

  id v42 = v59;
LABEL_76:
  if (!v6)
  {
    id v19 = v22;
    goto LABEL_33;
  }
  id v44 = 0;
LABEL_34:

  id v45 = v44;
  v46 = v45;
  if (v6)
  {
    id v69 = v45;
    (*((void (**)(statfs *__return_ptr, id *, id *))*v6 + 2))(&v80, v6, &v69);
    id v47 = v69;

    v46 = v47;
  }
  else
  {
    *(void *)&v80.f_bsize = 0;
    LOBYTE(v80.f_blocks) = 1;
  }
  std::__optional_storage_base<NSString * {__strong},false>::__assign_from[abi:nn180100]<std::__optional_move_assign_base<NSString * {__strong},false>>((uint64_t)&v70, (uint64_t *)&v80);
  if (LOBYTE(v80.f_blocks)) {

  }
  if (!v6)
  {
LABEL_46:
    CFTypeRef v49 = v46;
    v50 = (void *)v49;
    CFTypeRef v51 = cf;
    if (cf != v49)
    {
      CFTypeRef cf = v49;
      CFTypeRef v49 = v51;
    }
    if (v49) {
      CFRelease(v49);
    }

    v6 = 0;
    if (!*(unsigned char *)(a1 + 72)) {
      goto LABEL_51;
    }
    goto LABEL_3;
  }
  if (!v71)
  {
    (*((void (**)(id *))*v6 + 1))(v6);
    goto LABEL_46;
  }
  id v48 = v6[1];

  if ((*((unsigned int (**)(id *))*v6 + 3))(v6)) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 1;
  }

  id v5 = v48;
LABEL_4:
  CFURLRef v8 = *(const __CFURL **)(a1 + 48);
  CFStringRef v9 = *(const __CFString **)(a1 + 56);
  if (v71) {
    id v10 = v70;
  }
  else {
    id v10 = 0;
  }
  CFStringRef v11 = (const __CFString *)v10;
  CFTypeRef v12 = cf;
  CFTypeRef cf = 0;
  if (v12) {
    CFRelease(v12);
  }
  v13 = MDTCreateCopierWithSandboxExtensionAndReturnError((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (const __CFURL *)v5, v8, v9, v11, (__CFMachPort *)v7, (__CFMachPort *)_LSCopierCallback, (__CFMachPort *)v4, (CFErrorRef *)&cf);
  if (!v13)
  {
LABEL_51:
    [(_LSOpenCopierContext *)v4 setError:cf];
    v13 = 0;
    char v17 = 1;
    goto LABEL_52;
  }
  Current = CFRunLoopGetCurrent();
  if (MDTCopierScheduleWithRunLoop((uint64_t)v13, Current, @"LSOpenCallbackWaitMode"))
  {
    if (MDTCopierStart((uint64_t)v13))
    {
      CFRunLoopRunInMode(@"LSOpenCallbackWaitMode", 1.0e99, 1u);
      MDTCopierInvalidate((uint64_t)v13);
      if ([(_LSOpenCopierContext *)v4 callbackType] == 2)
      {
        v15 = _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 89, (uint64_t)"_LSCopyOrMoveFileResource_block_invoke", 442, 0);
        [(_LSOpenCopierContext *)v4 setError:v15];
      }
    }
    v16 = CFRunLoopGetCurrent();
    MDTCopierUnscheduleFromRunLoop((uint64_t)v13, v16, @"LSOpenCallbackWaitMode");
  }
  char v17 = 0;
LABEL_52:
  uint64_t v52 = *(void *)(a1 + 64);
  v53 = [(_LSOpenCopierContext *)v4 destURL];
  v54 = [(_LSOpenCopierContext *)v4 error];
  (*(void (**)(uint64_t, void *, void *))(v52 + 16))(v52, v53, v54);

  if (v71) {
  if (v6)
  }
    (*((void (**)(id *))*v6 + 1))(v6);

  if (cf) {
    CFRelease(cf);
  }
  if ((v17 & 1) == 0) {
    CFRelease(v13);
  }
  return MEMORY[0x185310460]();
}

@end