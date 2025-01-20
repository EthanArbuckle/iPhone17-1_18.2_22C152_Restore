@interface CUFileServer
- (CUFileServer)init;
- (NSString)label;
- (NSString)serviceType;
- (NSURL)rootDirectoryURL;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (void)_activateWithCompletion:(id)a3;
- (void)_handleKeepAlive:(id)a3 responseHandler:(id)a4;
- (void)_handleQuery:(id)a3 responseHandler:(id)a4;
- (void)_handleQuery:(id)a3 session:(id)a4;
- (void)_handleRequestFiles:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionStart:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionStop:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_invalidated;
- (void)_sessionInvalidate:(id)a3;
- (void)_sessionTimerFired;
- (void)_update;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRootDirectoryURL:(id)a3;
- (void)setServiceType:(id)a3;
@end

@implementation CUFileServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_sessionMap, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong((id *)&self->_clinkClient, 0);
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setRootDirectoryURL:(id)a3
{
}

- (NSURL)rootDirectoryURL
{
  return self->_rootDirectoryURL;
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_handleRequestFiles:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3068;
  v34 = __Block_byref_object_dispose__3069;
  id v35 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CUFileServer__handleRequestFiles_responseHandler___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  v29 = &v30;
  aBlock[4] = self;
  id v8 = v7;
  id v28 = v8;
  v9 = (void (**)(void))_Block_copy(aBlock);
  v15 = NSDictionaryGetNSNumber(v6, @"sid", 0);
  if (!v15)
  {
    uint64_t v23 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v26);
    v21 = (void *)v31[5];
    v31[5] = v23;
    goto LABEL_8;
  }
  v21 = [(NSMutableDictionary *)self->_sessionMap objectForKeyedSubscript:v15];
  if (!v21)
  {
    uint64_t v24 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    v25 = (void *)v31[5];
    v31[5] = v24;

    v21 = 0;
    goto LABEL_8;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_7;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleRequestFiles:responseHandler:]", 0x1Eu, (uint64_t)"RequestFiles: ID %@", v17, v18, v19, v20, (uint64_t)v15);
  }
LABEL_7:
  [v21 setLastRequestTicks:mach_absolute_time()];
  (*((void (**)(id, void, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC08], 0, 0);
LABEL_8:

  v9[2](v9);
  _Block_object_dispose(&v30, 8);
}

uint64_t __52__CUFileServer__handleRequestFiles_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  v9 = (void *)result;
  uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v9[4] + 1088);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleRequestFiles:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Keep alive failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

- (void)_handleQuery:(id)a3 session:(id)a4
{
  id v6 = a3;
  v88 = (char *)a4;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__3068;
  v101 = __Block_byref_object_dispose__3069;
  id v102 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CUFileServer__handleQuery_session___block_invoke;
  aBlock[3] = &unk_1E55BE028;
  v96 = &v97;
  aBlock[4] = self;
  id v7 = v6;
  id v95 = v7;
  v86 = (void (**)(void))_Block_copy(aBlock);
  v87 = v7;
  uint64_t v8 = [v7 path];
  v85 = (void *)v8;
  if (v8)
  {
    v9 = [(NSURL *)self->_rootDirectoryURL URLByAppendingPathComponent:v8 isDirectory:0];
    *__error() = 0;
    id v10 = v9;
    uint64_t v11 = realpath_DARWIN_EXTSN((const char *)[v10 fileSystemRepresentation], v88 + 8);
    uint64_t v17 = v11;
    if (!v11)
    {
      v57 = __error();
      uint64_t v55 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960592, (uint64_t)"realpath failed: %d", v58, v59, v60, v61, v62, *v57);
      goto LABEL_49;
    }
    int v18 = self->_rootPath[0];
    if (self->_rootPath[0])
    {
      uint64_t v19 = &self->_rootPath[1];
      uint64_t v20 = v11;
      while (*v20 == v18)
      {
        ++v20;
        int v21 = *v19++;
        int v18 = v21;
        if (!v21) {
          goto LABEL_7;
        }
      }
      uint64_t v55 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960592, (uint64_t)"Path outside root", v12, v13, v14, v15, v16, v82);
LABEL_49:
      v56 = (void *)v98[5];
      v98[5] = v55;

      goto LABEL_44;
    }
LABEL_7:
    v22 = (DIR *)[v88 dirStream];
    if (v22) {
      closedir(v22);
    }
    uint64_t v23 = opendir(v17);
    if (!v23)
    {
      v63 = __error();
      uint64_t v55 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960592, (uint64_t)"opendir failed: %d", v64, v65, v66, v67, v68, *v63);
      goto LABEL_49;
    }
    [v88 setDirStream:v23];
  }
  uint64_t v24 = (DIR *)[v88 dirStream];
  if (!v24)
  {
    uint64_t v24 = opendir(self->_rootPath);
    if (!v24)
    {
      v75 = __error();
      uint64_t v81 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960592, (uint64_t)"opendir failed: %d", v76, v77, v78, v79, v80, *v75);
      id v10 = (id)v98[5];
      v98[5] = v81;
      goto LABEL_44;
    }
    [v88 setDirStream:v24];
    strlcpy(v88 + 8, self->_rootPath, 0x400uLL);
  }
  v84 = self;
  id v10 = 0;
  int v25 = 500;
  while (1)
  {
    *__error() = 0;
    uint64_t v26 = readdir(v24);
    if (!v26)
    {
      v44 = v84;
      if (*__error())
      {
        v69 = __error();
        uint64_t v53 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"readdir failed: %d", v70, v71, v72, v73, v74, *v69);
        goto LABEL_47;
      }
      uint64_t v43 = 1;
LABEL_39:
      p_var0 = &v44->_ucat->var0;
      if (*p_var0 <= 30)
      {
        if (*p_var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v44->_ucat, 0x1Eu)) {
            goto LABEL_43;
          }
          p_var0 = &v44->_ucat->var0;
        }
        uint64_t v46 = [v10 count];
        LogPrintF((uint64_t)p_var0, (uint64_t)"-[CUFileServer _handleQuery:session:]", 0x1Eu, (uint64_t)"Query response: %d item(s)", v47, v48, v49, v50, v46);
      }
LABEL_43:
      v51 = objc_alloc_init(CUFileResponse);
      [(CUFileResponse *)v51 setFileItems:v10];
      [(CUFileResponse *)v51 setFlags:v43];
      dispatchQueue = v44->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__CUFileServer__handleQuery_session___block_invoke_3;
      block[3] = &unk_1E55BF170;
      id v90 = v87;
      v91 = v51;
      dispatch_async(dispatchQueue, block);

      goto LABEL_44;
    }
    d_name = v26->d_name;
    if (!strcmp(v26->d_name, ".") || !strcmp(d_name, "..")) {
      goto LABEL_35;
    }
    v93 = 0;
    asprintf(&v93, "%s/%s", v88 + 8, d_name);
    if (!v93)
    {
      uint64_t v53 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"entry path failed", v28, v29, v30, v31, v32, v83);
      goto LABEL_47;
    }
    memset(&v92, 0, sizeof(v92));
    if (lstat(v93, &v92)) {
      break;
    }
    free(v93);
LABEL_24:
    int v39 = v92.st_mode & 0xF000;
    switch(v39)
    {
      case 40960:
        uint64_t v40 = 3;
        goto LABEL_30;
      case 32768:
        uint64_t v40 = 1;
        goto LABEL_30;
      case 16384:
        uint64_t v40 = 2;
LABEL_30:
        v41 = objc_alloc_init(CUFileItem);
        v42 = [NSString stringWithUTF8String:d_name];
        [(CUFileItem *)v41 setName:v42];

        [(CUFileItem *)v41 setType:v40];
        if ((v92.st_mode & 0xF000) == 0x8000) {
          [(CUFileItem *)v41 setSize:v92.st_size];
        }
        if (!v10) {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        [v10 addObject:v41];

        break;
    }
LABEL_35:
    if (!--v25)
    {
      uint64_t v43 = 0;
      v44 = v84;
      goto LABEL_39;
    }
  }
  if (*__error())
  {
    uint64_t v33 = *__error();
    free(v93);
    if (v33) {
      goto LABEL_46;
    }
    goto LABEL_24;
  }
  free(v93);
  uint64_t v33 = 4294960596;
LABEL_46:
  uint64_t v53 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"stat failed: %d", v34, v35, v36, v37, v38, v33);
LABEL_47:
  v54 = (void *)v98[5];
  v98[5] = v53;

LABEL_44:
  v86[2](v86);

  _Block_object_dispose(&v97, 8);
}

void __37__CUFileServer__handleQuery_session___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(int **)(v10 + 1088);
    if (*v11 <= 90)
    {
      if (*v11 == -1)
      {
        BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
        uint64_t v10 = *(void *)(a1 + 32);
        if (!v12) {
          goto LABEL_6;
        }
        uint64_t v11 = *(int **)(v10 + 1088);
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUFileServer _handleQuery:session:]_block_invoke", 0x5Au, (uint64_t)"### Query failed: %{error}", a5, a6, a7, a8, v8);
      uint64_t v10 = *(void *)(a1 + 32);
    }
LABEL_6:
    uint64_t v13 = *(NSObject **)(v10 + 1096);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CUFileServer__handleQuery_session___block_invoke_2;
    block[3] = &unk_1E55BE000;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    id v17 = v14;
    uint64_t v18 = v15;
    dispatch_async(v13, block);
  }
}

void __37__CUFileServer__handleQuery_session___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0);
}

void __37__CUFileServer__handleQuery_session___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_handleQuery:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v65 = 0;
  uint64_t v66 = (id *)&v65;
  uint64_t v67 = 0x3032000000;
  uint64_t v68 = __Block_byref_object_copy__3068;
  v69 = __Block_byref_object_dispose__3069;
  id v70 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v64 = &v65;
  aBlock[4] = self;
  id v8 = v7;
  id v63 = v8;
  v9 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v55 = v9;
  uint64_t v15 = NSDictionaryGetNSNumber(v6, @"sid", 0);
  if (!v15)
  {
    uint64_t v51 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v54);
    id v21 = v66[5];
    v66[5] = (id)v51;
    goto LABEL_14;
  }
  id v21 = [(NSMutableDictionary *)self->_sessionMap objectForKeyedSubscript:v15];
  if (!v21)
  {
    uint64_t v52 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    id v28 = v66[5];
    v66[5] = (id)v52;
    goto LABEL_13;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue((const __CFDictionary *)v6, @"fQry", TypeID, 0);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    uint64_t v29 = [CUFileQuery alloc];
    uint64_t v30 = v66;
    id obj = v66[5];
    uint64_t v31 = [(CUFileQuery *)v29 initWithDictionary:v28 error:&obj];
    objc_storeStrong(v30 + 5, obj);
    if (v31)
    {
      [v21 setLastRequestTicks:mach_absolute_time()];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke_2;
      v59[3] = &unk_1E55BDFD8;
      id v60 = v8;
      [(CUFileQuery *)v31 setCompletionHandler:v59];
      ucat = self->_ucat;
      if (ucat->var0 <= 30)
      {
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
            goto LABEL_9;
          }
          ucat = self->_ucat;
        }
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleQuery:responseHandler:]", 0x1Eu, (uint64_t)"Query start: ID %@, %@", v32, v33, v34, v35, (uint64_t)v15);
      }
LABEL_9:
      id v37 = v6;
      v45 = self->_ioQueue;
      if (!v45)
      {
        NSPrintF((uint64_t)"%s-IO", v38, v39, v40, v41, v42, v43, v44, (uint64_t)self->_ucat->var4);
        id v46 = objc_claimAutoreleasedReturnValue();
        uint64_t v47 = (const char *)[v46 UTF8String];

        uint64_t v48 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v45 = (OS_dispatch_queue *)dispatch_queue_create(v47, v48);

        objc_storeStrong((id *)&self->_ioQueue, v45);
      }
      ioQueue = self->_ioQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__CUFileServer__handleQuery_responseHandler___block_invoke_3;
      block[3] = &unk_1E55BE528;
      void block[4] = self;
      uint64_t v50 = v31;
      v57 = v50;
      id v58 = v21;
      dispatch_async(ioQueue, block);

      id v6 = v37;
      v9 = v55;
      goto LABEL_12;
    }
    uint64_t v50 = 0;
  }
  else
  {
    uint64_t v53 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No query", v23, v24, v25, v26, v27, v54);
    uint64_t v50 = (CUFileQuery *)v66[5];
    v66[5] = (id)v53;
  }
LABEL_12:

LABEL_13:
LABEL_14:

  v9[2](v9);
  _Block_object_dispose(&v65, 8);
}

uint64_t __45__CUFileServer__handleQuery_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  v9 = (void *)result;
  uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v9[4] + 1088);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleQuery:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Query failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

void __45__CUFileServer__handleQuery_responseHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 encodeWithDictionary:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __45__CUFileServer__handleQuery_responseHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQuery:*(void *)(a1 + 40) session:*(void *)(a1 + 48)];
}

- (void)_handleKeepAlive:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__3068;
  uint64_t v39 = __Block_byref_object_dispose__3069;
  id v40 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CUFileServer__handleKeepAlive_responseHandler___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v34 = &v35;
  aBlock[4] = self;
  id v8 = v7;
  id v33 = v8;
  v9 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v15 = NSDictionaryGetNSNumber(v6, @"sid", 0);
  if (!v15)
  {
    uint64_t v28 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v31);
    id v21 = (void *)v36[5];
    v36[5] = v28;
    goto LABEL_8;
  }
  id v21 = [(NSMutableDictionary *)self->_sessionMap objectForKeyedSubscript:v15];
  if (!v21)
  {
    uint64_t v29 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    uint64_t v30 = (void *)v36[5];
    v36[5] = v29;

    id v21 = 0;
    goto LABEL_8;
  }
  uint64_t v22 = mach_absolute_time();
  UpTicksToSeconds(v22 - [v21 lastRequestTicks]);
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u)) {
        goto LABEL_7;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleKeepAlive:responseHandler:]", 0x14u, (uint64_t)"Keep alive: ID %@, %llu seconds", v23, v24, v25, v26, (uint64_t)v15);
  }
LABEL_7:
  [v21 setLastRequestTicks:mach_absolute_time()];
  (*((void (**)(id, void, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC08], 0, 0);
LABEL_8:

  v9[2](v9);
  _Block_object_dispose(&v35, 8);
}

uint64_t __49__CUFileServer__handleKeepAlive_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  v9 = (void *)result;
  uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v9[4] + 1088);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleKeepAlive:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Keep alive failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

- (void)_handleSessionStop:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__3068;
  uint64_t v34 = __Block_byref_object_dispose__3069;
  id v35 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CUFileServer__handleSessionStop_responseHandler___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v29 = &v30;
  aBlock[4] = self;
  id v8 = v7;
  id v28 = v8;
  v9 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v15 = NSDictionaryGetNSNumber(v6, @"sid", 0);
  if (!v15)
  {
    uint64_t v23 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No session ID", v10, v11, v12, v13, v14, v26);
    id v21 = (void *)v31[5];
    v31[5] = v23;
    goto LABEL_8;
  }
  id v21 = [(NSMutableDictionary *)self->_sessionMap objectForKeyedSubscript:v15];
  if (!v21)
  {
    uint64_t v24 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960569, (uint64_t)"Session not found: ID %@", v16, v17, v18, v19, v20, (uint64_t)v15);
    uint64_t v25 = (void *)v31[5];
    v31[5] = v24;

    id v21 = 0;
    goto LABEL_8;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_7;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleSessionStop:responseHandler:]", 0x1Eu, (uint64_t)"Session stop: ID %@", v17, v18, v19, v20, (uint64_t)v15);
  }
LABEL_7:
  [(NSMutableDictionary *)self->_sessionMap setObject:0 forKeyedSubscript:v15];
  [(CUFileServer *)self _sessionInvalidate:v21];
  [(CUFileServer *)self _update];
  (*((void (**)(id, void, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC08], 0, 0);
LABEL_8:

  v9[2](v9);
  _Block_object_dispose(&v30, 8);
}

uint64_t __51__CUFileServer__handleSessionStop_responseHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  v9 = (void *)result;
  uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v9[4] + 1088);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _handleSessionStop:responseHandler:]_block_invoke", 0x5Au, (uint64_t)"### Session stop failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

- (void)_handleSessionStart:(id)a3 responseHandler:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [(NSMutableDictionary *)self->_sessionMap count];
  if (v6 < 0x1E)
  {
    uint64_t v16 = objc_alloc_init(CUFileServerSession);
    [(CUFileServerSession *)v16 setLastRequestTicks:mach_absolute_time()];
    unint64_t v18 = self->_lastSessionID + 1;
    self->_lastSessionID = v18;
    [(CUFileServerSession *)v16 setSessionID:v18];
    if (!self->_sessionMap)
    {
      uint64_t v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      sessionMap = self->_sessionMap;
      self->_sessionMap = v19;
    }
    id v21 = [NSNumber numberWithUnsignedLongLong:v18];
    [(NSMutableDictionary *)self->_sessionMap setObject:v16 forKeyedSubscript:v21];
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_13;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _handleSessionStart:responseHandler:]", 0x1Eu, (uint64_t)"Session start: ID %llu", v22, v23, v24, v25, v18);
LABEL_13:
    [(CUFileServer *)self _update];
    id v28 = @"sid";
    v29[0] = v21;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    (*((void (**)(id, void *, void, void))v5 + 2))(v5, v27, 0, 0);

    goto LABEL_14;
  }
  NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294896146, (uint64_t)"Too many sessions: %d", v7, v8, v9, v10, v11, v6);
  uint64_t v16 = (CUFileServerSession *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = self->_ucat;
  if (v17->var0 <= 90)
  {
    if (v17->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v17, 0x5Au)) {
        goto LABEL_11;
      }
      uint64_t v17 = self->_ucat;
    }
    LogPrintF((uint64_t)v17, (uint64_t)"-[CUFileServer _handleSessionStart:responseHandler:]", 0x5Au, (uint64_t)"### Session start failed: %{error}", v12, v13, v14, v15, (uint64_t)v16);
  }
LABEL_11:
  (*((void (**)(id, void, void, CUFileServerSession *))v5 + 2))(v5, 0, 0, v16);
LABEL_14:
}

- (void)_update
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sessionMap count];
  sessionTimer = self->_sessionTimer;
  if (v3)
  {
    if (sessionTimer) {
      return;
    }
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)&self->_sessionTimer, v5);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__23__CUFileServer__update__block_invoke;
    v19[3] = (uint64_t)&unk_1E55BF170;
    v19[4] = (uint64_t)v5;
    v19[5] = (uint64_t)self;
    dispatch_source_set_event_handler(v5, v19);
    dispatch_time_t v6 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v5, v6, 0x37E11D600uLL, 0x3B9ACA00uLL);
    dispatch_activate(v5);
    ucat = self->_ucat;
    if (ucat->var0 > 30) {
      goto LABEL_13;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_13;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _update]", 0x1Eu, (uint64_t)"Session timer started", v7, v8, v9, v10, v19[0]);
LABEL_13:

    return;
  }
  if (sessionTimer)
  {
    uint64_t v12 = sessionTimer;
    dispatch_source_cancel(v12);
    uint64_t v13 = self->_sessionTimer;
    self->_sessionTimer = 0;

    unint64_t v18 = self->_ucat;
    if (v18->var0 <= 30)
    {
      if (v18->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v18, 0x1Eu)) {
          return;
        }
        unint64_t v18 = self->_ucat;
      }
      LogPrintF((uint64_t)v18, (uint64_t)"-[CUFileServer _update]", 0x1Eu, (uint64_t)"Session timer stopped", v14, v15, v16, v17, v21);
    }
  }
}

void *__23__CUFileServer__update__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[135]) {
    return (void *)[result _sessionTimerFired];
  }
  return result;
}

- (void)_sessionTimerFired
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  ucat = self->_ucat;
  if (ucat->var0 > 20) {
    goto LABEL_5;
  }
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x14u)) {
      goto LABEL_5;
    }
    ucat = self->_ucat;
  }
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _sessionTimerFired]", 0x14u, (uint64_t)"Session timer fired", v2, v3, v4, v5, v22);
LABEL_5:
  uint64_t v8 = mach_absolute_time();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(NSMutableDictionary *)self->_sessionMap allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v24;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v24 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * v13);
      uint64_t v15 = [(NSMutableDictionary *)self->_sessionMap objectForKeyedSubscript:v14];
      if (UpTicksToSeconds(v8 - [v15 lastRequestTicks]) >= 0x1E)
      {
        uint64_t v20 = self->_ucat;
        if (v20->var0 <= 30)
        {
          if (v20->var0 != -1) {
            goto LABEL_13;
          }
          if (_LogCategory_Initialize((uint64_t)v20, 0x1Eu))
          {
            uint64_t v20 = self->_ucat;
LABEL_13:
            LogPrintF((uint64_t)v20, (uint64_t)"-[CUFileServer _sessionTimerFired]", 0x1Eu, (uint64_t)"Session stale: ID %@, %llu seconds", v16, v17, v18, v19, v14);
          }
        }
        [(NSMutableDictionary *)self->_sessionMap setObject:0 forKeyedSubscript:v14];
        [(CUFileServer *)self _sessionInvalidate:v15];
      }

      ++v13;
    }
    while (v11 != v13);
    uint64_t v21 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v11 = v21;
  }
  while (v21);
LABEL_20:
}

- (void)_sessionInvalidate:(id)a3
{
  id v4 = a3;
  uint64_t v3 = (DIR *)[v4 dirStream];
  if (v3)
  {
    closedir(v3);
    [v4 setDirStream:0];
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled || self->_invalidateDone || self->_clinkClient) {
    return;
  }
  uint64_t v11 = (void (**)(void *))_Block_copy(self->_invalidationHandler);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  uint64_t v8 = v11;
  if (v11)
  {
    v11[2](v11);
    uint64_t v8 = v11;
  }
  self->_invalidateDone = 1;
  uint64_t ucat = (uint64_t)self->_ucat;
  if (*(int *)ucat <= 30)
  {
    if (*(_DWORD *)ucat == -1)
    {
      uint64_t ucat = _LogCategory_Initialize(ucat, 0x1Eu);
      uint64_t v8 = v11;
      if (!ucat) {
        goto LABEL_11;
      }
      uint64_t ucat = (uint64_t)self->_ucat;
    }
    uint64_t ucat = LogPrintF(ucat, (uint64_t)"-[CUFileServer _invalidated]", 0x1Eu, (uint64_t)"Invalidated", v4, v5, v6, v7, v10);
    uint64_t v8 = v11;
  }
LABEL_11:
  MEMORY[0x1F41817F8](ucat, v8);
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  uint64_t ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      uint64_t ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _invalidate]", 0x1Eu, (uint64_t)"Invalidate", v2, v3, v4, v5, v13);
  }
LABEL_6:
  [(RPCompanionLinkClient *)self->_clinkClient invalidate];
  sessionTimer = self->_sessionTimer;
  if (sessionTimer)
  {
    uint64_t v9 = sessionTimer;
    dispatch_source_cancel(v9);
    uint64_t v10 = self->_sessionTimer;
    self->_sessionTimer = 0;
  }
  sessionMap = self->_sessionMap;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __27__CUFileServer__invalidate__block_invoke;
  v14[3] = &unk_1E55BDFB0;
  v14[4] = self;
  [(NSMutableDictionary *)sessionMap enumerateKeysAndObjectsUsingBlock:v14];
  [(NSMutableDictionary *)self->_sessionMap removeAllObjects];
  uint64_t v12 = self->_sessionMap;
  self->_sessionMap = 0;

  [(CUFileServer *)self _invalidated];
}

uint64_t __27__CUFileServer__invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionInvalidate:");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CUFileServer_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CUFileServer_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x3032000000;
  uint64_t v81 = __Block_byref_object_copy__3068;
  uint64_t v82 = __Block_byref_object_dispose__3069;
  id v83 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CUFileServer__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v77 = &v78;
  aBlock[4] = self;
  id v5 = v4;
  id v76 = v5;
  uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  uint64_t ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUFileServer _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate", v6, v7, v8, v9, v66);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      uint64_t ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v17 = self->_rootDirectoryURL;
  if (!v17)
  {
    uint64_t v59 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No root directory URL", v12, v13, v14, v15, v16, v66);
LABEL_11:
    id v18 = (id)v79[5];
    v79[5] = v59;
    goto LABEL_8;
  }
  *__error() = 0;
  if (!realpath_DARWIN_EXTSN([(NSURL *)v17 fileSystemRepresentation], self->_rootPath))
  {
    id v60 = __error();
    uint64_t v59 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960592, (uint64_t)"Bad root directory: error %d", v61, v62, v63, v64, v65, *v60);
    goto LABEL_11;
  }
  [(RPCompanionLinkClient *)self->_clinkClient invalidate];
  id v18 = objc_alloc_init((Class)getRPCompanionLinkClientClass[0]());
  objc_storeStrong((id *)&self->_clinkClient, v18);
  [v18 setDispatchQueue:self->_dispatchQueue];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __40__CUFileServer__activateWithCompletion___block_invoke_2;
  v74[3] = &unk_1E55BF170;
  v74[4] = v18;
  v74[5] = self;
  [v18 setInvalidationHandler:v74];
  long long v26 = NSPrintF((uint64_t)"FSSr:%@", v19, v20, v21, v22, v23, v24, v25, (uint64_t)self->_serviceType);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __40__CUFileServer__activateWithCompletion___block_invoke_3;
  v73[3] = &unk_1E55BDF60;
  v73[4] = self;
  [v18 registerRequestID:v26 options:0 handler:v73];

  uint64_t v34 = NSPrintF((uint64_t)"FSSp:%@", v27, v28, v29, v30, v31, v32, v33, (uint64_t)self->_serviceType);
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __40__CUFileServer__activateWithCompletion___block_invoke_4;
  v72[3] = &unk_1E55BDF60;
  v72[4] = self;
  [v18 registerRequestID:v34 options:0 handler:v72];

  uint64_t v42 = NSPrintF((uint64_t)"FSQy:%@", v35, v36, v37, v38, v39, v40, v41, (uint64_t)self->_serviceType);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __40__CUFileServer__activateWithCompletion___block_invoke_5;
  v71[3] = &unk_1E55BDF60;
  v71[4] = self;
  [v18 registerRequestID:v42 options:0 handler:v71];

  uint64_t v50 = NSPrintF((uint64_t)"FSRF:%@", v43, v44, v45, v46, v47, v48, v49, (uint64_t)self->_serviceType);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __40__CUFileServer__activateWithCompletion___block_invoke_6;
  v70[3] = &unk_1E55BDF60;
  v70[4] = self;
  [v18 registerRequestID:v50 options:0 handler:v70];

  id v58 = NSPrintF((uint64_t)"FSKA:%@", v51, v52, v53, v54, v55, v56, v57, (uint64_t)self->_serviceType);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __40__CUFileServer__activateWithCompletion___block_invoke_7;
  v69[3] = &unk_1E55BDF60;
  v69[4] = self;
  [v18 registerRequestID:v58 options:0 handler:v69];

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __40__CUFileServer__activateWithCompletion___block_invoke_8;
  v67[3] = &unk_1E55BDF88;
  v67[4] = self;
  id v68 = v5;
  [v18 activateWithCompletion:v67];

LABEL_8:
  v10[2](v10);

  _Block_object_dispose(&v78, 8);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  uint64_t v9 = (void *)result;
  uint64_t v10 = *(int **)(*(void *)(result + 32) + 1088);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v9[4] + 1088);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_2(uint64_t result)
{
  v1 = *(void **)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (v1 == *(void **)(v2 + 16))
  {
    uint64_t v3 = result;
    *(void *)(v2 + 16) = 0;

    id v4 = *(void **)(v3 + 40);
    return [v4 _invalidated];
  }
  return result;
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStart:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStop:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQuery:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestFiles:responseHandler:", a2);
}

uint64_t __40__CUFileServer__activateWithCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeepAlive:responseHandler:", a2);
}

void __40__CUFileServer__activateWithCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088);
  int v9 = *v8;
  id v12 = v3;
  if (!v3)
  {
    if (v9 > 30) {
      goto LABEL_11;
    }
    if (v9 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v8, 0x1Eu)) {
        goto LABEL_11;
      }
      uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088);
    }
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke_8", 0x1Eu, (uint64_t)"CLink activated", v4, v5, v6, v7, v11);
    goto LABEL_11;
  }
  if (v9 > 90) {
    goto LABEL_11;
  }
  if (v9 != -1) {
    goto LABEL_4;
  }
  BOOL v10 = _LogCategory_Initialize((uint64_t)v8, 0x5Au);
  id v3 = v12;
  if (v10)
  {
    uint64_t v8 = *(int **)(*(void *)(a1 + 32) + 1088);
LABEL_4:
    LogPrintF((uint64_t)v8, (uint64_t)"-[CUFileServer _activateWithCompletion:]_block_invoke_8", 0x5Au, (uint64_t)"### CLink activate failed: %{error}", v4, v5, v6, v7, (uint64_t)v3);
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CUFileServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __39__CUFileServer_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v9 + 8))
  {
    uint64_t v10 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960575, (uint64_t)"Activate already called", a4, a5, a6, a7, a8, v19);
    uint64_t v15 = *(int **)(*(void *)(a1 + 32) + 1088);
    id v20 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        BOOL v18 = _LogCategory_Initialize((uint64_t)v15, 0x5Au);
        uint64_t v10 = (uint64_t)v20;
        if (!v18) {
          goto LABEL_9;
        }
        uint64_t v15 = *(int **)(*(void *)(a1 + 32) + 1088);
      }
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUFileServer activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", v11, v12, v13, v14, v10);
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    return;
  }
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  [v16 _activateWithCompletion:v17];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_uint64_t ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CC8A8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)dealloc
{
  uint64_t ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_uint64_t ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUFileServer;
  [(CUFileServer *)&v4 dealloc];
}

- (CUFileServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUFileServer;
  uint64_t v2 = [(CUFileServer *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_uint64_t ucat = (LogCategory *)&gLogCategory_CUFileServer;
    objc_super v4 = v3;
  }

  return v3;
}

@end