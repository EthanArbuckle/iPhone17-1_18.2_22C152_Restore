@interface MDMDeclarativeManagement
+ (id)_createNoInstallationError;
+ (id)_createUnsupportedFeatureError;
+ (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5;
+ (void)executeRequestForEndpoint:(id)a3 channelType:(unint64_t)a4 requestData:(id)a5 completionHandler:(id)a6;
+ (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMDeclarativeManagement

+ (void)executeRequestForEndpoint:(id)a3 channelType:(unint64_t)a4 requestData:(id)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, id, id))a6;
  v13 = +[MDMConfiguration sharedConfiguration];
  [v13 refreshDetailsFromDisk];
  v14 = [v13 memberQueueManagingProfileIdentifier];

  if (v14)
  {
    id v30 = v11;
    id v31 = v10;
    v15 = [v13 memberQueueCheckInURL];
    v16 = (const void *)[v13 copyMemberQueueIdentity];
    uint64_t v29 = [v13 memberQueueCheckInPinnedSecCertificateRefs];
    uint64_t v17 = [v13 memberQueuePinningRevocationCheckRequired];
    uint64_t v18 = [v13 memberQueueSignMessage];
    uint64_t v19 = [v13 isUserEnrollment];
    v20 = [v13 enrollmentID];
    if (v15 && v16)
    {
      v28 = +[MDMClientCore clientWithChannelType:a4];
      v21 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v35 = a4;
        _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_INFO, "Calling remoteManagementCheckInURL - channel type: %lu", buf, 0xCu);
      }
      id v32 = 0;
      id v33 = 0;
      v22 = (void *)v29;
      uint64_t v23 = v18;
      id v10 = v31;
      [v28 remoteManagementCheckInURL:v15 identity:v16 pinnedSecCertificateRefs:v29 pinningRevocationCheckRequired:v17 signMessage:v23 isUserEnrollment:v19 enrollmentID:v20 endpoint:v31 requestData:v30 outResponse:&v33 outError:&v32];
      id v24 = v33;
      id v25 = v32;
      CFRelease(v16);
      v12[2](v12, v24, v25);

      id v11 = v30;
    }
    else
    {
      if (v16) {
        CFRelease(v16);
      }
      v27 = [a1 _createNoInstallationError];
      v12[2](v12, 0, v27);

      id v11 = v30;
      id v10 = v31;
      v22 = (void *)v29;
    }
  }
  else
  {
    v26 = [a1 _createNoInstallationError];
    v12[2](v12, 0, v26);
  }
}

+ (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MDMConfiguration sharedConfiguration];
  [v8 refreshDetailsFromDisk];
  v9 = [v8 memberQueueManagingProfileIdentifier];

  if (v9)
  {
    id v10 = (const void *)[v8 copyMemberQueueIdentity];
    id v11 = [v8 memberQueueCheckInPinnedSecCertificateRefs];
    uint64_t v12 = [v8 memberQueuePinningRevocationCheckRequired];
    uint64_t v13 = [v8 memberQueueSignMessage];
    v14 = [v8 rmAccountID];
    if (v10)
    {
      v15 = [[MDMHTTPTransaction alloc] initWithURL:v6 identity:v10 pinnedCertificates:v11 pinningRevocationCheckRequired:v12 signMessage:v13 isShortTransaction:0 rmAccountID:v14];
      CFRelease(v10);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__MDMDeclarativeManagement_fetchDataAtURL_completionHandler___block_invoke;
      v17[3] = &unk_1E6CBCD18;
      uint64_t v18 = v15;
      id v19 = v7;
      v16 = v15;
      [(DMCHTTPTransaction *)v16 performCompletionBlock:v17];
    }
    else
    {
      v16 = [a1 _createNoInstallationError];
      (*((void (**)(id, void, MDMHTTPTransaction *))v7 + 2))(v7, 0, v16);
    }
  }
  else
  {
    id v11 = [a1 _createNoInstallationError];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __61__MDMDeclarativeManagement_fetchDataAtURL_completionHandler___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = @"ResponseStatusCode";
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "statusCode"));
    v11[0] = v3;
    v10[1] = @"ResponseHeaders";
    v4 = [*(id *)(a1 + 32) responseHeaders];
    v11[1] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [*(id *)(a1 + 32) responseData];
    [v6 setObject:v7 forKeyedSubscript:@"ResponseBody"];

    uint64_t v8 = *(void *)(a1 + 40);
    v9 = (void *)[v6 copy];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
}

+ (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[MDMConfiguration sharedConfiguration];
  [v11 refreshDetailsFromDisk];
  uint64_t v12 = [v11 memberQueueManagingProfileIdentifier];

  if (v12)
  {
    uint64_t v13 = (const void *)[v11 copyMemberQueueIdentity];
    v14 = [v11 memberQueueCheckInPinnedSecCertificateRefs];
    uint64_t v15 = [v11 memberQueuePinningRevocationCheckRequired];
    uint64_t v16 = [v11 memberQueueSignMessage];
    uint64_t v17 = [v11 rmAccountID];
    if (v13)
    {
      LOBYTE(v20) = 0;
      uint64_t v18 = [[MDMHTTPTransaction alloc] initWithURL:v8 downloadURL:v9 identity:v13 pinnedCertificates:v14 pinningRevocationCheckRequired:v15 signMessage:v16 isShortTransaction:v20 rmAccountID:v17];
      CFRelease(v13);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __76__MDMDeclarativeManagement_downloadDataAtURL_downloadURL_completionHandler___block_invoke;
      v21[3] = &unk_1E6CBCD40;
      v22 = v18;
      id v24 = v10;
      id v23 = v9;
      id v19 = v18;
      [(DMCHTTPTransaction *)v19 performCompletionBlock:v21];
    }
    else
    {
      id v19 = [a1 _createNoInstallationError];
      (*((void (**)(id, void, MDMHTTPTransaction *))v10 + 2))(v10, 0, v19);
    }
  }
  else
  {
    v14 = [a1 _createNoInstallationError];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

void __76__MDMDeclarativeManagement_downloadDataAtURL_downloadURL_completionHandler___block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = @"ResponseStatusCode";
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "statusCode"));
    v8[0] = v3;
    v7[1] = @"ResponseHeaders";
    v4 = [*(id *)(a1 + 32) responseHeaders];
    v7[2] = @"ResponseDownloadURL";
    uint64_t v5 = *(void *)(a1 + 40);
    v8[1] = v4;
    v8[2] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (id)_createUnsupportedFeatureError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_createNoInstallationError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E748];
  v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12079, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

@end