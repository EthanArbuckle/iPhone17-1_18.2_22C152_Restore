@interface MDMCloudConfiguration
+ (id)canonicalConfigurationWithSupervision:(BOOL)a3;
+ (id)sharedConfiguration;
- (BOOL)alreadySignedIntoFaceTime;
- (BOOL)hasMAIDCredential;
- (BOOL)isAwaitingConfiguration;
- (BOOL)isMDMUnremovable;
- (BOOL)isProvisionallyEnrolled;
- (BOOL)isStoredProfileInstalled;
- (BOOL)isSupervised;
- (BOOL)isTeslaEnrolled;
- (MDMCloudConfiguration)init;
- (NSDictionary)details;
- (NSDictionary)memberQueueDetails;
- (NSDictionary)memberQueueSetAsideDetails;
- (NSDictionary)setAsideDetails;
- (OS_dispatch_queue)memberQueue;
- (id)MAIDUsername;
- (id)diagnosticsUploadURL;
- (id)enrollmentAnchorCertificates;
- (id)enrollmentServerInfo;
- (id)enrollmentServerSupportedFeatures;
- (id)enrollmentServerURL;
- (id)language;
- (id)languageScript;
- (id)lastDEPPushTokenHash;
- (id)mdmVersionProtocol;
- (id)provisionalEnrollmentExpirationDate;
- (id)region;
- (id)skipSetupKeys;
- (id)tvProviderUserToken;
- (int)userMode;
- (void)refreshDetailsFromDisk;
- (void)setDetails:(id)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueDetails:(id)a3;
- (void)setMemberQueueSetAsideDetails:(id)a3;
- (void)setSetAsideDetails:(id)a3;
@end

@implementation MDMCloudConfiguration

void __32__MDMCloudConfiguration_details__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueDetails];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDictionary)memberQueueDetails
{
  return self->_memberQueueDetails;
}

uint64_t __44__MDMCloudConfiguration_sharedConfiguration__block_invoke()
{
  v0 = objc_alloc_init(MDMCloudConfiguration);
  v1 = (void *)sharedConfiguration_config;
  sharedConfiguration_config = (uint64_t)v0;

  int out_token = 0;
  uint64_t v2 = (const char *)[(id)*MEMORY[0x1E4F5E548] UTF8String];
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  LODWORD(v2) = notify_register_dispatch(v2, &out_token, v3, &__block_literal_global_3);

  if (v2)
  {
    v4 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DD340000, v4, OS_LOG_TYPE_ERROR, "Could not register for Cloud Configuration change notifications.", v6, 2u);
    }
  }
  return [(id)sharedConfiguration_config refreshDetailsFromDisk];
}

- (void)refreshDetailsFromDisk
{
  uint64_t v3 = [(MDMCloudConfiguration *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MDMCloudConfiguration_refreshDetailsFromDisk__block_invoke;
  block[3] = &unk_1E6CBCC00;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)sharedConfiguration_config;

  return v2;
}

void __47__MDMCloudConfiguration_refreshDetailsFromDisk__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1DD340000, v2, OS_LOG_TYPE_DEBUG, "Refreshing cloud config details.", v15, 2u);
  }
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = MDMCloudConfigurationDetailsFilePath();
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    v7 = MDMCloudConfigurationDetailsFilePath();
    v8 = [v6 dictionaryWithContentsOfFile:v7];
    [*(id *)(a1 + 32) setMemberQueueDetails:v8];
  }
  else
  {
    [*(id *)(a1 + 32) setMemberQueueDetails:0];
  }
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = MDMCloudConfigurationSetAsideDetailsFilePath();
  int v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E4F1C9E8];
    v13 = MDMCloudConfigurationSetAsideDetailsFilePath();
    v14 = [v12 dictionaryWithContentsOfFile:v13];
    [*(id *)(a1 + 32) setMemberQueueSetAsideDetails:v14];
  }
  else
  {
    [*(id *)(a1 + 32) setMemberQueueSetAsideDetails:0];
  }
}

- (void)setMemberQueueSetAsideDetails:(id)a3
{
}

- (void)setMemberQueueDetails:(id)a3
{
}

- (MDMCloudConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)MDMCloudConfiguration;
  uint64_t v2 = [(MDMCloudConfiguration *)&v7 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("MDMCloudConfiguration member queue", v3);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (BOOL)isSupervised
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5B0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSDictionary)details
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  int v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  uint64_t v3 = [(MDMCloudConfiguration *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MDMCloudConfiguration_details__block_invoke;
  v6[3] = &unk_1E6CBCC28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

void __44__MDMCloudConfiguration_sharedConfiguration__block_invoke_2()
{
  [(id)sharedConfiguration_config refreshDetailsFromDisk];
  v0 = MEMORY[0x1E4F14428];

  dispatch_async(v0, &__block_literal_global_5);
}

void __44__MDMCloudConfiguration_sharedConfiguration__block_invoke_3()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x1E4F5E548] object:0];
}

- (void)setDetails:(id)a3
{
  id v4 = a3;
  int v5 = [(MDMCloudConfiguration *)self memberQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__MDMCloudConfiguration_setDetails___block_invoke;
  v7[3] = &unk_1E6CBCC50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __36__MDMCloudConfiguration_setDetails___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueDetails:*(void *)(a1 + 40)];
}

- (NSDictionary)setAsideDetails
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  int v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  uint64_t v3 = [(MDMCloudConfiguration *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__MDMCloudConfiguration_setAsideDetails__block_invoke;
  v6[3] = &unk_1E6CBCC28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __40__MDMCloudConfiguration_setAsideDetails__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) memberQueueSetAsideDetails];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setSetAsideDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMCloudConfiguration *)self memberQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MDMCloudConfiguration_setSetAsideDetails___block_invoke;
  v7[3] = &unk_1E6CBCC50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __44__MDMCloudConfiguration_setSetAsideDetails___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMemberQueueSetAsideDetails:*(void *)(a1 + 40)];
}

- (BOOL)isTeslaEnrolled
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E570]];
  BOOL v4 = [v3 intValue] == 1;

  return v4;
}

- (BOOL)isAwaitingConfiguration
{
  uint64_t v3 = [(MDMCloudConfiguration *)self details];
  BOOL v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5E568]];
  if ([v4 BOOLValue])
  {
    id v5 = [(MDMCloudConfiguration *)self details];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F5E578]];
    int v7 = [v6 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isMDMUnremovable
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5A0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isStoredProfileInstalled
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5E8]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)mdmVersionProtocol
{
  uint64_t v3 = [(MDMCloudConfiguration *)self details];
  uint64_t v4 = *MEMORY[0x1E4F5E5E0];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5E5E0]];

  if (v5)
  {
    id v6 = [(MDMCloudConfiguration *)self details];
    int v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    int v7 = &unk_1F38890B0;
  }

  return v7;
}

- (int)userMode
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5A8]];
  int v4 = [v3 BOOLValue];

  return v4;
}

- (id)diagnosticsUploadURL
{
  return 0;
}

- (id)MAIDUsername
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5D8]];

  return v3;
}

- (BOOL)hasMAIDCredential
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5D0]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)alreadySignedIntoFaceTime
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E560]];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)language
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5B8]];

  return v3;
}

- (id)region
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5F8]];

  return v3;
}

- (id)languageScript
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5C0]];

  return v3;
}

- (BOOL)isProvisionallyEnrolled
{
  uint64_t v2 = [(MDMCloudConfiguration *)self provisionalEnrollmentExpirationDate];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v4 = [v3 compare:v2] == -1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)provisionalEnrollmentExpirationDate
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5F0]];

  if (v3)
  {
    [v3 doubleValue];
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v4 / 1000.0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)tvProviderUserToken
{
  return 0;
}

- (id)skipSetupKeys
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E610]];

  return v3;
}

- (id)enrollmentServerInfo
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E588]];

  return v3;
}

- (id)enrollmentServerURL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v3 = [(MDMCloudConfiguration *)self details];
  double v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5E588]];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5E590]];
  id v6 = [v2 URLWithString:v5];

  return v6;
}

- (id)enrollmentAnchorCertificates
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E588]];
  double v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5E580]];

  return v4;
}

- (id)enrollmentServerSupportedFeatures
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E588]];
  double v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5E618]];

  return v4;
}

- (id)lastDEPPushTokenHash
{
  uint64_t v2 = [(MDMCloudConfiguration *)self details];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F5E5C8]];

  return v3;
}

+ (id)canonicalConfigurationWithSupervision:(BOOL)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F5E5B0];
  uint64_t v3 = [NSNumber numberWithBool:a3];
  uint64_t v4 = *MEMORY[0x1E4F5E558];
  v10[0] = v3;
  v10[1] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = *MEMORY[0x1E4F5E5E8];
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = *MEMORY[0x1E4F5E570];
  v10[2] = MEMORY[0x1E4F1CC28];
  v10[3] = &unk_1F38890C8;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  int v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (void)setMemberQueue:(id)a3
{
}

- (NSDictionary)memberQueueSetAsideDetails
{
  return self->_memberQueueSetAsideDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueSetAsideDetails, 0);
  objc_storeStrong((id *)&self->_memberQueueDetails, 0);

  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end