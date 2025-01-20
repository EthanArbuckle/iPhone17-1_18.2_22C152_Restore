@interface MDMCheckInRequest
+ (id)_createNoInstallationError;
+ (id)_createUnsupportedFeatureError;
+ (void)executeRequestForMessageType:(id)a3 channelType:(unint64_t)a4 requestDict:(id)a5 completionHandler:(id)a6;
@end

@implementation MDMCheckInRequest

+ (void)executeRequestForMessageType:(id)a3 channelType:(unint64_t)a4 requestDict:(id)a5 completionHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  if (([v10 isEqualToString:@"Authenticate"] & 1) != 0
    || ([v10 isEqualToString:@"TokenUpdate"] & 1) != 0
    || [v10 isEqualToString:@"CheckOut"])
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v32 = (unint64_t)v10;
      _os_log_impl(&dword_1DD340000, v13, OS_LOG_TYPE_ERROR, "This checkin channel does not support the messageType: %{public}@", buf, 0xCu);
    }
    v14 = [a1 _createUnsupportedFeatureError];
    v12[2](v12, 0, v14);
  }
  else
  {
    v14 = +[MDMConfiguration sharedConfiguration];
    [v14 refreshDetailsFromDisk];
    v15 = [v14 memberQueueManagingProfileIdentifier];

    if (v15)
    {
      v16 = [v14 memberQueueCheckInURL];
      v17 = (const void *)[v14 copyMemberQueueIdentity];
      uint64_t v28 = [v14 memberQueueCheckInPinnedSecCertificateRefs];
      unsigned int v27 = [v14 memberQueuePinningRevocationCheckRequired];
      unsigned int v26 = [v14 memberQueueSignMessage];
      uint64_t v18 = [v14 isUserEnrollment];
      v19 = [v14 enrollmentID];
      if (v16 && v17)
      {
        v25 = +[MDMClientCore clientWithChannelType:a4];
        v20 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v32 = a4;
          _os_log_impl(&dword_1DD340000, v20, OS_LOG_TYPE_INFO, "Calling checkInRequestAtURL - channel type: %lu", buf, 0xCu);
        }
        id v29 = 0;
        id v30 = 0;
        v21 = (void *)v28;
        [v25 checkInRequestAtURL:v16 identity:v17 pinnedSecCertificateRefs:v28 pinningRevocationCheckRequired:v27 signMessage:v26 isUserEnrollment:v18 enrollmentID:v19 messageType:v10 requestDict:v11 outResponse:&v30 outError:&v29];
        id v22 = v30;
        id v23 = v29;
        CFRelease(v17);
        ((void (**)(id, id, void *))v12)[2](v12, v22, v23);
      }
      else
      {
        if (v17) {
          CFRelease(v17);
        }
        v24 = [a1 _createNoInstallationError];
        v12[2](v12, 0, v24);

        v21 = (void *)v28;
      }
    }
    else
    {
      v16 = [a1 _createNoInstallationError];
      v12[2](v12, 0, v16);
    }
  }
}

+ (id)_createUnsupportedFeatureError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  v4 = DMCErrorArray();
  v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_createNoInstallationError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E748];
  v4 = DMCErrorArray();
  v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12079, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

@end