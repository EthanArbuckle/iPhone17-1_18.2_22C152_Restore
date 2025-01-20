@interface PHShare
+ (id)PHShareErrorFromError:(id)a3;
+ (void)acceptShareWithUUID:(id)a3 photoLibrary:(id)a4 completion:(id)a5;
+ (void)fetchShareFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (void)publishShareWithUUID:(id)a3 photoLibrary:(id)a4 completion:(id)a5;
- (PHShare)init;
@end

@implementation PHShare

+ (id)PHShareErrorFromError:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    int v6 = [v5 isEqualToString:@"PHPhotosErrorDomain"];

    if (v6)
    {
      id v7 = v4;
    }
    else
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v26 = *MEMORY[0x1E4F28A50];
      v27[0] = v4;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v10 = (void *)[v8 initWithDictionary:v9];

      v11 = [v4 domain];
      int v12 = [v11 isEqualToString:*MEMORY[0x1E4F59778]];

      if (v12)
      {
        v13 = [v4 userInfo];
        v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F59788]];
        [v10 setObject:v14 forKeyedSubscript:@"PHServerGeneratedLocalizedDescriptionErrorKey"];

        v15 = [v4 userInfo];
        v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F59780]];

        if (v16)
        {
          v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
          [v10 setObject:v17 forKeyedSubscript:@"PHLearnMoreLinkErrorKey"];
        }
        uint64_t v18 = [v4 code];
        uint64_t v19 = -1;
        if (v18 > 999)
        {
          switch(v18)
          {
            case 1000:
              uint64_t v19 = 6010;
              break;
            case 1001:
            case 1003:
            case 1004:
            case 1005:
              break;
            case 1002:
              uint64_t v19 = 9999;
              break;
            case 1006:
              uint64_t v19 = 6012;
              break;
            case 1007:
              uint64_t v19 = 8500;
              break;
            case 1008:
              uint64_t v19 = 8501;
              break;
            default:
              switch(v18)
              {
                case 2008:
                  uint64_t v19 = 8502;
                  break;
                case 2009:
                  uint64_t v19 = 8503;
                  break;
                case 2010:
                  uint64_t v19 = 8504;
                  break;
                case 2011:
                  uint64_t v19 = 8507;
                  break;
                default:
                  goto LABEL_40;
              }
              break;
          }
        }
        else
        {
          switch(v18)
          {
            case 23:
            case 25:
              uint64_t v19 = 6003;
              break;
            case 24:
            case 26:
            case 27:
            case 28:
            case 29:
            case 31:
            case 32:
            case 33:
              break;
            case 30:
              uint64_t v19 = 6008;
              break;
            case 34:
              uint64_t v19 = 6002;
              break;
            case 35:
              uint64_t v19 = 6009;
              break;
            case 36:
              uint64_t v19 = 8001;
              break;
            case 37:
              uint64_t v19 = 6011;
              break;
            default:
              if ((unint64_t)(v18 - 80) >= 3)
              {
                if (v18 == 2) {
                  uint64_t v19 = 6006;
                }
              }
              else
              {
                uint64_t v19 = 6001;
              }
              break;
          }
        }
LABEL_40:
      }
      else
      {
        v20 = [v4 domain];
        int v21 = [v20 isEqualToString:*MEMORY[0x1E4F8AD00]];

        if (v21)
        {
          uint64_t v22 = [v4 code];
          if ((unint64_t)(v22 - 100) >= 3) {
            uint64_t v19 = -1;
          }
          else {
            uint64_t v19 = v22 + 5903;
          }
        }
        else
        {
          v23 = [v4 domain];
          int v24 = [v23 isEqualToString:*MEMORY[0x1E4F8C500]];

          if (v24)
          {
            if ([v4 code] == 81001) {
              uint64_t v19 = 8505;
            }
            else {
              uint64_t v19 = -1;
            }
          }
          else
          {
            uint64_t v19 = -1;
          }
        }
      }
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:v19 userInfo:v10];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)publishShareWithUUID:(id)a3 photoLibrary:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PHShare.m", 109, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  int v12 = [v10 cplStatus];
  v13 = [v12 exitDeleteTime];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PHPhotosErrorDomain" code:6007 userInfo:0];
    v15 = [a1 PHShareErrorFromError:v14];
    v11[2](v11, 0, v15);
  }
  else
  {
    v14 = [v10 assetsdClient];
    v16 = [v14 cloudInternalClient];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__PHShare_publishShareWithUUID_photoLibrary_completion___block_invoke;
    v18[3] = &unk_1E5847880;
    uint64_t v19 = v11;
    id v20 = a1;
    [v16 publishShare:v9 completionHandler:v18];
  }
}

void __56__PHShare_publishShareWithUUID_photoLibrary_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 PHShareErrorFromError:a3];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

+ (void)acceptShareWithUUID:(id)a3 photoLibrary:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PHShare.m", 101, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  int v12 = [v10 assetsdClient];
  v13 = [v12 cloudInternalClient];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PHShare_acceptShareWithUUID_photoLibrary_completion___block_invoke;
  v16[3] = &unk_1E5847858;
  id v17 = v11;
  id v18 = a1;
  id v14 = v11;
  [v13 acceptShare:v9 completionHandler:v16];
}

void __55__PHShare_acceptShareWithUUID_photoLibrary_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a2 == 0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) PHShareErrorFromError:a2];
  (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v2, v4);
}

+ (void)fetchShareFromShareURL:(id)a3 ignoreExistingShare:(BOOL)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v13)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PHShare.m", 76, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v14 = [v12 assetsdClient];
  v15 = [v14 cloudInternalClient];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke;
  v20[3] = &unk_1E5847830;
  id v21 = v12;
  id v22 = v11;
  BOOL v24 = v8;
  id v23 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  [v15 fetchShareFromShareURL:v17 ignoreExistingShare:v8 completionHandler:v20];
}

void __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  BOOL v8 = v7;
  if (v7 != (void *)*MEMORY[0x1E4F281F8])
  {

LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_7;
  }
  uint64_t v9 = [v6 code];

  if (v9 != 4099) {
    goto LABEL_6;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F8B868]);
  id v11 = [*(id *)(a1 + 32) photoLibraryURL];
  id v12 = (void *)[v10 initWithPhotoLibraryURL:v11];

  if (v12)
  {
    id v13 = [v12 cloudInternalClient];
    uint64_t v14 = *(unsigned __int8 *)(a1 + 56);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5847CD8;
    uint64_t v15 = *(void *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    [v13 fetchShareFromShareURL:v15 ignoreExistingShare:v14 completionHandler:v16];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }

LABEL_7:
}

void __85__PHShare_fetchShareFromShareURL_ignoreExistingShare_photoLibrary_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 domain];
  BOOL v8 = v7;
  if (v7 != (void *)*MEMORY[0x1E4F281F8])
  {

    goto LABEL_6;
  }
  uint64_t v9 = [v5 code];

  if (v9 != 4099)
  {
LABEL_6:
    id v10 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      uint64_t v15 = "+[PHShare fetchShareFromShareURL:ignoreExistingShare:photoLibrary:completionHandler:]_block_invoke";
      id v11 = "XPC connection invalidated first time but worked on second try in %s";
      id v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_FAULT;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v10 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v14 = 138412290;
    uint64_t v15 = (const char *)v5;
    id v11 = "Unable to fetch moment share because XPC service returned an error on second attempt. (%@)";
    id v12 = v10;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
    _os_log_impl(&dword_19B043000, v12, v13, v11, (uint8_t *)&v14, 0xCu);
  }
LABEL_9:

  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

- (void).cxx_destruct
{
}

- (PHShare)init
{
  BOOL v2 = self;
  PLAbstractMethodException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end