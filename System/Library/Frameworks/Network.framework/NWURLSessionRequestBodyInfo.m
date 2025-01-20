@interface NWURLSessionRequestBodyInfo
- (id)bodyProviderFromOffset:(void *)a1;
- (id)initWithFileURL:(void *)a3 queue:;
- (id)initWithRequest:(void *)a3 queue:;
@end

@implementation NWURLSessionRequestBodyInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (id)initWithFileURL:(void *)a3 queue:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)NWURLSessionRequestBodyInfo;
    v8 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 3, a2);
      id v16 = 0;
      uint64_t v9 = *MEMORY[0x1E4F1C5F8];
      id v15 = 0;
      int v10 = [v6 getResourceValue:&v16 forKey:v9 error:&v15];
      id v11 = v16;
      id v12 = v15;
      if (v10)
      {
        a1[1] = (id)[v11 longLongValue];
      }
      else
      {
        a1[1] = (id)-1;
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        v13 = (id)gurlLogObj;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v19 = v6;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "Failed to size file %@: %@", buf, 0x16u);
        }
      }
      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

- (id)initWithRequest:(void *)a3 queue:
{
  id v6 = a3;
  if (a1)
  {
    id v7 = a2;
    uint64_t v8 = [v7 HTTPBody];
    uint64_t v9 = [v7 HTTPBodyStream];

    if (v8 | v9)
    {
      v16.receiver = a1;
      v16.super_class = (Class)NWURLSessionRequestBodyInfo;
      id v11 = objc_msgSendSuper2(&v16, sel_init);
      if (v11)
      {
        if (v8)
        {
          uint64_t v12 = [(id)v8 _createDispatchData];
          v13 = (void *)*((void *)v11 + 2);
          *((void *)v11 + 2) = v12;

          uint64_t v14 = [(id)v8 length];
        }
        else
        {
          if (![(id)v9 streamStatus]) {
            objc_storeStrong((id *)v11 + 4, (id)v9);
          }
          uint64_t v14 = -1;
        }
        *((void *)v11 + 1) = v14;
        objc_storeStrong((id *)v11 + 5, a3);
      }
      a1 = v11;
      id v10 = a1;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)bodyProviderFromOffset:(void *)a1
{
  id v3 = a1;
  if (!a1) {
    goto LABEL_22;
  }
  id v4 = a2;
  if (a1[2])
  {
    v5 = [NWURLSessionRequestBodyData alloc];
    id v6 = (void *)*((void *)v3 + 2);
    v2 = v6;
    if (v5)
    {
      cleanup_handler.receiver = v5;
      cleanup_handler.super_class = (Class)NWURLSessionRequestBodyData;
      id v7 = objc_msgSendSuper2(&cleanup_handler, sel_init);
      id v3 = v7;
      if (v7)
      {
        objc_storeStrong(v7 + 1, v6);
        *((void *)v3 + 2) = dispatch_data_get_size(v2);
        *((void *)v3 + 3) = v4;
      }
      goto LABEL_6;
    }
LABEL_28:
    id v3 = 0;
LABEL_6:

    goto LABEL_22;
  }
  if (!a1[3])
  {
    objc_super v16 = (void *)a1[4];
    if (v16)
    {
      if ((void *)a1[6] != a2)
      {
        _os_crash();
        __break(1u);
        goto LABEL_27;
      }
      a1[4] = 0;
      id v17 = v16;

      v18 = [NWURLSessionRequestBodyStream alloc];
      id v19 = (void *)*((void *)v3 + 5);
      id v4 = v17;
      v2 = v19;
      if (v18)
      {
        cleanup_handler.receiver = v18;
        cleanup_handler.super_class = (Class)NWURLSessionRequestBodyStream;
        id v3 = objc_msgSendSuper2(&cleanup_handler, sel_init);
        if (!v3)
        {
LABEL_21:

          goto LABEL_22;
        }
        if (![v4 streamStatus])
        {
          objc_storeStrong((id *)v3 + 2, v16);
          *((void *)v3 + 3) = 0;
          objc_storeStrong((id *)v3 + 4, v19);
          __int16 v20 = objc_alloc_init(NWURLSessionReadRequest);
          id v21 = (void *)*((void *)v3 + 5);
          *((void *)v3 + 5) = v20;

          goto LABEL_21;
        }
LABEL_27:
        _os_crash();
        __break(1u);
        goto LABEL_28;
      }
    }
    else
    {
      _os_crash();
      __break(1u);
    }
    id v3 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = [NWURLSessionRequestBodyFile alloc];
  uint64_t v9 = (void *)*((void *)v3 + 5);
  id v10 = *((id *)v3 + 3);
  id v11 = v9;
  if (v8)
  {
    v27.receiver = v8;
    v27.super_class = (Class)NWURLSessionRequestBodyFile;
    id v3 = objc_msgSendSuper2(&v27, sel_init);
    if (v3)
    {
      int v12 = open((const char *)[v10 fileSystemRepresentation], 0);
      if (v12 < 0)
      {
        *((_DWORD *)v3 + 2) = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
      }
      else
      {
        dispatch_fd_t v13 = v12;
        if (v4)
        {
          lseek(v12, (off_t)v4, 0);
          *((void *)v3 + 4) = v4;
        }
        cleanup_handler.receiver = (id)MEMORY[0x1E4F143A8];
        cleanup_handler.super_class = (Class)3221225472;
        v24 = __60__NWURLSessionRequestBodyFile_initWithFileURL_offset_queue___block_invoke;
        v25 = &__block_descriptor_36_e8_v12__0i8l;
        dispatch_fd_t v26 = v13;
        dispatch_io_t v14 = dispatch_io_create(0, v13, v11, &cleanup_handler);
        id v15 = (void *)*((void *)v3 + 2);
        *((void *)v3 + 2) = v14;

        dispatch_io_set_low_water(*((dispatch_io_t *)v3 + 2), 0xFFFFFFFFFFFFFFFFLL);
        objc_storeStrong((id *)v3 + 3, v9);
      }
    }
  }
  else
  {
    id v3 = 0;
  }

LABEL_22:

  return v3;
}

@end