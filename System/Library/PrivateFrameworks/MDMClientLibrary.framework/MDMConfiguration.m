@interface MDMConfiguration
+ (BOOL)isDataSeparated;
+ (BOOL)isGetTokenSupportedByServer;
+ (BOOL)isUserEnrollmentDisregardingIdentityPresence;
+ (id)_emptyTokenErrorWithUnderlayingError:(id)a3;
+ (id)getOrgTokenForMAID:(id *)a3;
+ (id)getTokenUnsupportedError;
+ (id)getUnhidableAndUnlockableApps;
+ (id)getUnhidableApps;
+ (id)getUnlockableApps;
+ (id)getWatchPairingTokenForPhoneID:(id)a3 watchID:(id)a4 securityToken:(id)a5 outError:(id *)a6;
+ (id)sharedConfiguration;
+ (unint64_t)getManagementStateForMAID;
- (BOOL)_writeProperties:(id)a3 channelType:(unint64_t)a4 error:(id *)a5;
- (BOOL)isProfileLocked;
- (BOOL)isUserEnrollment;
- (BOOL)memberQueuePinningRevocationCheckRequired;
- (BOOL)memberQueueSignMessage;
- (BOOL)memberQueueUseDevelopmentAPNS;
- (BOOL)readConfigurationOutError:(id *)a3;
- (BOOL)supportUserChannel;
- (MDMConfiguration)init;
- (NSArray)memberQueueCheckInPinnedSecCertificateRefs;
- (NSArray)memberQueueServerCapabilities;
- (NSData)identityPersistentID;
- (NSDictionary)memberQueueMDMOptions;
- (NSDictionary)memberQueueOrganizationInfo;
- (NSNumber)memberQueuePollingInterval;
- (NSString)easEnrollmentID;
- (NSString)enrollmentID;
- (NSString)enrollmentMode;
- (NSString)memberQueueManagingProfileIdentifier;
- (NSString)memberQueuePushMagic;
- (NSString)memberQueueTopic;
- (NSString)personaID;
- (NSString)rmAccountID;
- (NSURL)memberQueueCheckInURL;
- (NSURL)memberQueueServerURL;
- (NSUUID)wallpaperConfigurationUUID;
- (OS_dispatch_queue)memberQueue;
- (__SecIdentity)copyMemberQueueIdentity;
- (__SecIdentity)memberQueueIdentity;
- (id)_mdmPropertiesFilePathForChannelType:(unint64_t)a3;
- (id)_readPropertiesForChannelType:(unint64_t)a3 createIfMissingFile:(BOOL)a4 error:(id *)a5;
- (id)fetchUnhidableAndUnlockableApps;
- (id)getPropertyForKey:(id)a3 channelType:(unint64_t)a4;
- (id)setPropertyForKey:(id)a3 value:(id)a4 channelType:(unint64_t)a5;
- (unint64_t)memberQueueAccessRights;
- (void)memberQueueForgetCurrentConfiguration;
- (void)refreshDetailsFromDisk;
- (void)setEasEnrollmentID:(id)a3;
- (void)setEnrollmentID:(id)a3;
- (void)setEnrollmentMode:(id)a3;
- (void)setIdentityPersistentID:(id)a3;
- (void)setIsUserEnrollment:(BOOL)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueueAccessRights:(unint64_t)a3;
- (void)setMemberQueueCheckInPinnedSecCertificateRefs:(id)a3;
- (void)setMemberQueueCheckInURL:(id)a3;
- (void)setMemberQueueIdentity:(__SecIdentity *)a3;
- (void)setMemberQueueMDMOptions:(id)a3;
- (void)setMemberQueueManagingProfileIdentifier:(id)a3;
- (void)setMemberQueueOrganizationInfo:(id)a3;
- (void)setMemberQueuePinningRevocationCheckRequired:(BOOL)a3;
- (void)setMemberQueuePollingInterval:(id)a3;
- (void)setMemberQueuePushMagic:(id)a3;
- (void)setMemberQueueServerCapabilities:(id)a3;
- (void)setMemberQueueServerURL:(id)a3;
- (void)setMemberQueueSignMessage:(BOOL)a3;
- (void)setMemberQueueTopic:(id)a3;
- (void)setMemberQueueUseDevelopmentAPNS:(BOOL)a3;
- (void)setPersonaID:(id)a3;
- (void)setRmAccountID:(id)a3;
- (void)setSupportUserChannel:(BOOL)a3;
- (void)setWallpaperConfigurationUUID:(id)a3;
@end

@implementation MDMConfiguration

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken_0 != -1) {
    dispatch_once(&sharedConfiguration_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedConfiguration_config_0;

  return v2;
}

uint64_t __39__MDMConfiguration_sharedConfiguration__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedConfiguration_config_0;
  sharedConfiguration_config_0 = v0;

  v2 = (void *)sharedConfiguration_config_0;

  return [v2 refreshDetailsFromDisk];
}

- (MDMConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)MDMConfiguration;
  v2 = [(MDMConfiguration *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("MDMConfiguration member queue", v3);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)refreshDetailsFromDisk
{
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v3, OS_LOG_TYPE_DEFAULT, "Refreshing MDM details.", buf, 2u);
  }
  uint64_t v4 = 0;
  [(MDMConfiguration *)self readConfigurationOutError:&v4];
}

+ (BOOL)isUserEnrollmentDisregardingIdentityPresence
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  v3 = MDMFilePath();
  uint64_t v4 = [v2 dataWithContentsOfFile:v3];

  v5 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v4 options:0 format:0 error:0];
  v6 = [v5 objectForKey:@"UserEnrollment"];
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F5E748];
      v9 = DMCErrorArray();
      v10 = objc_msgSend(v7, "DMCErrorWithDomain:code:descriptionArray:errorType:", v8, 12011, v9, *MEMORY[0x1E4F5E6B8], @"UserEnrollment", 0);
    }
  }
  char v11 = [v6 BOOLValue];

  return v11;
}

- (BOOL)readConfigurationOutError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v5, OS_LOG_TYPE_DEBUG, "MDMConfiguration: readConfigurationOutError:", buf, 2u);
  }
  v6 = [(MDMConfiguration *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MDMConfiguration_readConfigurationOutError___block_invoke;
  block[3] = &unk_1E6CBCC78;
  block[4] = self;
  block[5] = &v21;
  block[6] = &v27;
  dispatch_async_and_wait(v6, block);

  if (*((unsigned char *)v28 + 24))
  {
    objc_super v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD340000, v7, OS_LOG_TYPE_DEFAULT, "MDMConfiguration: readConfigurationOutError: Valid MDM installation found.", buf, 2u);
    }
    goto LABEL_17;
  }
  uint64_t v8 = (void *)v22[5];
  if (v8)
  {
    v9 = [v8 domain];
    if ([v9 isEqualToString:*MEMORY[0x1E4F5E748]])
    {
      BOOL v10 = [(id)v22[5] code] == 12079;

      if (v10)
      {
        char v11 = *(NSObject **)(DMCLogObjects() + 8);
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_WORD *)buf = 0;
        v12 = "MDMConfiguration: readConfigurationOutError: No MDM installation found!";
        v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 2;
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  v16 = *(NSObject **)(DMCLogObjects() + 8);
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  uint64_t v17 = v22[5];
  *(_DWORD *)buf = 138543362;
  uint64_t v32 = v17;
  v12 = "MDMConfiguration: readConfigurationOutError: Invalid MDM installation found. Error: %{public}@";
  v13 = v16;
  os_log_type_t v14 = OS_LOG_TYPE_ERROR;
  uint32_t v15 = 12;
LABEL_14:
  _os_log_impl(&dword_1DD340000, v13, v14, v12, buf, v15);
LABEL_15:
  if (a3) {
    *a3 = (id) v22[5];
  }
LABEL_17:
  BOOL v18 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __46__MDMConfiguration_readConfigurationOutError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) memberQueueForgetCurrentConfiguration];
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  v3 = MDMFilePath();
  uint64_t v4 = [v2 dataWithContentsOfFile:v3];

  v5 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v4 options:0 format:0 error:0];
  if (!v5)
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F5E748];
    v36 = DMCErrorArray();
    uint64_t v37 = *MEMORY[0x1E4F5E6B8];
    v38 = v34;
    uint64_t v39 = v35;
    uint64_t v40 = 12079;
LABEL_35:
    uint64_t v43 = objc_msgSend(v38, "DMCErrorWithDomain:code:descriptionArray:errorType:", v39, v40, v36, v37, 0);
    uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 8);
    v45 = *(void **)(v44 + 40);
    *(void *)(v44 + 40) = v43;

    goto LABEL_55;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F5E748];
    v36 = DMCErrorArray();
    uint64_t v37 = *MEMORY[0x1E4F5E6B8];
    v38 = v41;
    uint64_t v39 = v42;
    uint64_t v40 = 12011;
    goto LABEL_35;
  }
  v6 = @"UserEnrollment";
  objc_super v7 = [v5 objectForKey:@"UserEnrollment"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsUserEnrollment:", objc_msgSend(v7, "BOOLValue"));

  v6 = @"PersonaID";
  objc_super v7 = [v5 objectForKey:@"PersonaID"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  uint64_t v8 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setPersonaID:v8];

  v6 = @"EnrollmentID";
  objc_super v7 = [v5 objectForKey:@"EnrollmentID"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  v9 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setEnrollmentID:v9];

  v6 = @"EASEnrollmentID";
  objc_super v7 = [v5 objectForKey:@"EASEnrollmentID"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  BOOL v10 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setEasEnrollmentID:v10];

  v6 = @"RMAccountIdentifier";
  objc_super v7 = [v5 objectForKey:@"RMAccountIdentifier"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  char v11 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setRmAccountID:v11];

  v6 = @"EnrollmentMode";
  objc_super v7 = [v5 objectForKey:@"EnrollmentMode"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  v12 = (void *)[v7 copy];
  [*(id *)(a1 + 32) setEnrollmentMode:v12];

  v6 = @"ServerCapabilities";
  objc_super v7 = [v5 objectForKey:@"ServerCapabilities"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  [*(id *)(a1 + 32) setMemberQueueServerCapabilities:v7];
  *(unsigned char *)(*(void *)(a1 + 32) + 11) = [v7 containsObject:@"com.apple.mdm.user-channel"];

  v6 = @"IdentityPersistentRef";
  objc_super v7 = [v5 objectForKey:@"IdentityPersistentRef"];
  if (!v7) {
    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_53;
  }
  uint64_t v13 = [v7 copy];
  uint64_t v14 = *(void *)(a1 + 32);
  uint32_t v15 = *(void **)(v14 + 112);
  *(void *)(v14 + 112) = v13;

  v6 = @"CheckInURLPinningCertificatePersistentRefs";
  objc_super v7 = [v5 objectForKey:@"CheckInURLPinningCertificatePersistentRefs"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  v16 = objc_opt_class();
  uint64_t v17 = [*(id *)(a1 + 32) personaID];
  BOOL v18 = (void *)[v16 copyCertificatesWithPersistentIDs:v7 useSystemKeychain:1 enforcePersonalPersona:v17 != 0];
  [*(id *)(a1 + 32) setMemberQueueCheckInPinnedSecCertificateRefs:v18];

  v6 = @"PinningRevocationCheckRequired";
  objc_super v7 = [v5 objectForKey:@"PinningRevocationCheckRequired"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueuePinningRevocationCheckRequired:", objc_msgSend(v7, "BOOLValue"));

  v19 = @"ManagingProfileIdentifier";
  v20 = [v5 objectForKey:@"ManagingProfileIdentifier"];
  [*(id *)(a1 + 32) setMemberQueueManagingProfileIdentifier:v20];

  uint64_t v21 = [*(id *)(a1 + 32) memberQueueManagingProfileIdentifier];
  if (!v21) {
    goto LABEL_64;
  }
  v22 = (void *)v21;
  uint64_t v23 = [*(id *)(a1 + 32) memberQueueManagingProfileIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_64;
  }
  v25 = [MEMORY[0x1E4F5E758] sharedInstance];
  int v26 = [v25 hrnMode];

  if (v26 != 2)
  {
    v19 = @"Topic";
    uint64_t v27 = [v5 objectForKey:@"Topic"];
    [*(id *)(a1 + 32) setMemberQueueTopic:v27];

    uint64_t v28 = [*(id *)(a1 + 32) memberQueueTopic];
    if (v28)
    {
      uint64_t v29 = (void *)v28;
      char v30 = [*(id *)(a1 + 32) memberQueueTopic];
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
      {
LABEL_64:
        v78 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v79 = *MEMORY[0x1E4F5E748];
        v84 = v19;
        objc_super v7 = DMCErrorArray();
        uint64_t v80 = objc_msgSend(v78, "DMCErrorWithDomain:code:descriptionArray:errorType:", v79, 12011, v7, *MEMORY[0x1E4F5E6B8], v84, 0);
        uint64_t v81 = *(void *)(*(void *)(a1 + 40) + 8);
        v82 = *(void **)(v81 + 40);
        *(void *)(v81 + 40) = v80;

        goto LABEL_54;
      }
    }
  }
  v6 = @"ServerURL";
  objc_super v7 = [v5 objectForKey:@"ServerURL"];
  if (!v7) {
    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_53;
  }
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
  [*(id *)(a1 + 32) setMemberQueueServerURL:v32];

  v6 = @"CheckInURL";
  objc_super v7 = [v5 objectForKey:@"CheckInURL"];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
      [*(id *)(a1 + 32) setMemberQueueCheckInURL:v33];
      goto LABEL_37;
    }
LABEL_53:
    v62 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v63 = *MEMORY[0x1E4F5E748];
    v83 = v6;
    v64 = DMCErrorArray();
    uint64_t v65 = objc_msgSend(v62, "DMCErrorWithDomain:code:descriptionArray:errorType:", v63, 12011, v64, *MEMORY[0x1E4F5E6B8], v83, 0);
    uint64_t v66 = *(void *)(*(void *)(a1 + 40) + 8);
    v67 = *(void **)(v66 + 40);
    *(void *)(v66 + 40) = v65;

LABEL_54:
    goto LABEL_55;
  }
  uint64_t v33 = [*(id *)(a1 + 32) memberQueueServerURL];
  v46 = (void *)[v33 copy];
  [*(id *)(a1 + 32) setMemberQueueCheckInURL:v46];

LABEL_37:
  v6 = @"AccessRights";
  objc_super v7 = [v5 objectForKey:@"AccessRights"];
  if (!v7) {
    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_53;
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueAccessRights:", objc_msgSend(v7, "unsignedIntValue"));

  v6 = @"UseDevelopmentAPNS";
  objc_super v7 = [v5 objectForKey:@"UseDevelopmentAPNS"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueUseDevelopmentAPNS:", objc_msgSend(v7, "BOOLValue"));

  v6 = @"SignMessage";
  objc_super v7 = [v5 objectForKey:@"SignMessage"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setMemberQueueSignMessage:", objc_msgSend(v7, "BOOLValue"));

  v6 = @"IsProfileLocked";
  objc_super v7 = [v5 objectForKey:@"IsProfileLocked"];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_53;
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 12) = [v7 BOOLValue];

  v19 = @"PushMagic";
  v47 = [v5 objectForKey:@"PushMagic"];
  [*(id *)(a1 + 32) setMemberQueuePushMagic:v47];

  uint64_t v48 = [*(id *)(a1 + 32) memberQueuePushMagic];
  if (!v48) {
    goto LABEL_64;
  }
  v49 = (void *)v48;
  v50 = [*(id *)(a1 + 32) memberQueuePushMagic];
  objc_opt_class();
  char v51 = objc_opt_isKindOfClass();

  if ((v51 & 1) == 0) {
    goto LABEL_64;
  }
  v19 = @"OrganizationInfo";
  v52 = [v5 objectForKey:@"OrganizationInfo"];
  [*(id *)(a1 + 32) setMemberQueueOrganizationInfo:v52];

  uint64_t v53 = [*(id *)(a1 + 32) memberQueueOrganizationInfo];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [*(id *)(a1 + 32) memberQueueOrganizationInfo];
    objc_opt_class();
    char v56 = objc_opt_isKindOfClass();

    if ((v56 & 1) == 0) {
      goto LABEL_64;
    }
  }
  v19 = @"MDMOptions";
  v57 = [v5 objectForKey:@"MDMOptions"];
  [*(id *)(a1 + 32) setMemberQueueMDMOptions:v57];

  uint64_t v58 = [*(id *)(a1 + 32) memberQueueMDMOptions];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [*(id *)(a1 + 32) memberQueueMDMOptions];
    objc_opt_class();
    char v61 = objc_opt_isKindOfClass();

    if ((v61 & 1) == 0) {
      goto LABEL_64;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_55:
  v68 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD340000, v68, OS_LOG_TYPE_DEBUG, "MDMConfiguration: readConfigurationOutError: doneblock", buf, 2u);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v69 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v85 = 0;
      _os_log_impl(&dword_1DD340000, v69, OS_LOG_TYPE_DEFAULT, "MDMConfiguration: readConfigurationOutError: doneblock: Configuration not valid!", v85, 2u);
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v70 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v71 = *MEMORY[0x1E4F5E748];
      v72 = DMCErrorArray();
      v73 = DMCLocalizedString();
      v74 = DMCUSEnglishString();
      uint64_t v75 = [v70 DMCErrorWithDomain:v71 code:12011 descriptionArray:v72 suggestion:v73 USEnglishSuggestion:v74 underlyingError:0 errorType:*MEMORY[0x1E4F5E6B8]];
      uint64_t v76 = *(void *)(*(void *)(a1 + 40) + 8);
      v77 = *(void **)(v76 + 40);
      *(void *)(v76 + 40) = v75;
    }
    [*(id *)(a1 + 32) memberQueueForgetCurrentConfiguration];
  }
}

- (void)memberQueueForgetCurrentConfiguration
{
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1DD340000, v3, OS_LOG_TYPE_DEBUG, "MDMConfiguration: Forgetting Current APNS Config, clearing push topics!", v4, 2u);
  }
  [(MDMConfiguration *)self setIsUserEnrollment:0];
  [(MDMConfiguration *)self setEnrollmentID:0];
  [(MDMConfiguration *)self setPersonaID:0];
  [(MDMConfiguration *)self setEasEnrollmentID:0];
  [(MDMConfiguration *)self setRmAccountID:0];
  [(MDMConfiguration *)self setEnrollmentMode:0];
  [(MDMConfiguration *)self setSupportUserChannel:0];
  [(MDMConfiguration *)self setIdentityPersistentID:0];
  [(MDMConfiguration *)self setMemberQueueManagingProfileIdentifier:0];
  if ([(MDMConfiguration *)self memberQueueIdentity])
  {
    CFRelease([(MDMConfiguration *)self memberQueueIdentity]);
    [(MDMConfiguration *)self setMemberQueueIdentity:0];
  }
  [(MDMConfiguration *)self setMemberQueueCheckInPinnedSecCertificateRefs:0];
  [(MDMConfiguration *)self setMemberQueuePinningRevocationCheckRequired:0];
  [(MDMConfiguration *)self setMemberQueueSignMessage:0];
  [(MDMConfiguration *)self setMemberQueueTopic:0];
  [(MDMConfiguration *)self setMemberQueueOrganizationInfo:0];
  [(MDMConfiguration *)self setMemberQueueServerURL:0];
  [(MDMConfiguration *)self setMemberQueueCheckInURL:0];
  [(MDMConfiguration *)self setMemberQueueMDMOptions:0];
  [(MDMConfiguration *)self setMemberQueueAccessRights:0];
  [(MDMConfiguration *)self setMemberQueueUseDevelopmentAPNS:0];
  [(MDMConfiguration *)self setMemberQueuePushMagic:0];
  [(MDMConfiguration *)self setMemberQueueServerCapabilities:0];
}

- (__SecIdentity)copyMemberQueueIdentity
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(MDMConfiguration *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MDMConfiguration_copyMemberQueueIdentity__block_invoke;
  v6[3] = &unk_1E6CBCB68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(v3, v6);

  uint64_t v4 = (__SecIdentity *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__MDMConfiguration_copyMemberQueueIdentity__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identityPersistentID];

  if (v2)
  {
    if ([*(id *)(a1 + 32) memberQueueIdentity]) {
      goto LABEL_4;
    }
    v3 = (void *)MEMORY[0x1E4F5E798];
    uint64_t v4 = [*(id *)(a1 + 32) identityPersistentID];
    v5 = [*(id *)(a1 + 32) personaID];
    objc_msgSend(*(id *)(a1 + 32), "setMemberQueueIdentity:", objc_msgSend(v3, "copyIdentityWithPersistentID:useSystemKeychain:enforcePersonalPersona:", v4, 1, v5 != 0));

    if ([*(id *)(a1 + 32) memberQueueIdentity])
    {
LABEL_4:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) memberQueueIdentity];
      v6 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v6)
      {
        CFRetain(v6);
      }
    }
    else
    {
      if ([MEMORY[0x1E4F5E7B0] isCurrentPersonaEnterprise])
      {
        uint64_t v7 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_1DD340000, v7, OS_LOG_TYPE_ERROR, "Failed to get MDM identity. This is likely due to the user initiating MDMConfiguration under enterprise persona, but don't have the entitlement to adopt personal persona.", v8, 2u);
        }
      }
      [*(id *)(a1 + 32) setIdentityPersistentID:0];
    }
  }
}

+ (unint64_t)getManagementStateForMAID
{
  v2 = +[MDMConfiguration sharedConfiguration];
  [v2 refreshDetailsFromDisk];
  v3 = +[MDMCloudConfiguration sharedConfiguration];
  [v3 refreshDetailsFromDisk];
  int v4 = [v3 isSupervised];
  v5 = [v2 memberQueueManagingProfileIdentifier];

  if (v4)
  {
    if (v5)
    {
      unint64_t v6 = 3;
    }
    else if (DMCIsSetupBuddyDone())
    {
      unint64_t v6 = 0;
    }
    else
    {
      uint64_t v8 = [v3 enrollmentServerURL];

      if (v8) {
        unint64_t v6 = 6;
      }
      else {
        unint64_t v6 = 0;
      }
    }
  }
  else
  {
    unint64_t v6 = v5 != 0;
  }

  return v6;
}

+ (BOOL)isDataSeparated
{
  v2 = +[MDMConfiguration sharedConfiguration];
  v3 = [v2 personaID];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)isGetTokenSupportedByServer
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v2 = +[MDMConfiguration sharedConfiguration];
  [v2 refreshDetailsFromDisk];
  v3 = [v2 memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MDMConfiguration_isGetTokenSupportedByServer__block_invoke;
  block[3] = &unk_1E6CBCC28;
  char v11 = &v12;
  id v4 = v2;
  id v10 = v4;
  dispatch_async_and_wait(v3, block);

  if (*((unsigned char *)v13 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1DD340000, v6, OS_LOG_TYPE_ERROR, "MDMConfiguration: GetToken request not supported by MDM server", v8, 2u);
    }
    BOOL v5 = *((unsigned char *)v13 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  return v5;
}

void __47__MDMConfiguration_isGetTokenSupportedByServer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) memberQueueServerCapabilities];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 containsObject:@"com.apple.mdm.token"];
}

+ (id)getOrgTokenForMAID:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isGetTokenSupportedByServer])
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__3;
    v24 = __Block_byref_object_dispose__3;
    id v25 = 0;
    uint64_t v14 = 0;
    char v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__3;
    BOOL v18 = __Block_byref_object_dispose__3;
    id v19 = 0;
    int v26 = @"TokenServiceType";
    v27[0] = @"com.apple.maid";
    BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__MDMConfiguration_getOrgTokenForMAID___block_invoke;
    v13[3] = &unk_1E6CBCCA0;
    v13[4] = &v14;
    v13[5] = &v20;
    +[MDMCheckInRequest executeRequestForMessageType:@"GetToken" channelType:0 requestDict:v5 completionHandler:v13];
    if (v21[5])
    {
      id v6 = [NSString alloc];
      uint64_t v7 = (void *)[v6 initWithData:v21[5] encoding:4];
      if (v7) {
        goto LABEL_16;
      }
      uint64_t v8 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1DD340000, v8, OS_LOG_TYPE_ERROR, "MDMConfiguration: Failed to covert TokenData to a string. The data might not be properly encoded.", v12, 2u);
      }
      if (!a3) {
        goto LABEL_16;
      }
      id v9 = +[MDMConfiguration _emptyTokenErrorWithUnderlayingError:0];
    }
    else
    {
      if (!v15[5]
        || (id v10 = objc_opt_new(),
            [v10 logErrorEventForTopic:*MEMORY[0x1E4F5E6C8] reason:@"Failed to get org token" error:v15[5] details:0], v10, !a3))
      {
        uint64_t v7 = 0;
        goto LABEL_16;
      }
      id v9 = (id) v15[5];
      uint64_t v7 = 0;
    }
    *a3 = v9;
LABEL_16:

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);

    goto LABEL_17;
  }
  if (a3)
  {
    [a1 getTokenUnsupportedError];
    uint64_t v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_17:

  return v7;
}

void __39__MDMConfiguration_getOrgTokenForMAID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"ResponseStatusCode"];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 200)
  {
    id v9 = [v5 objectForKeyedSubscript:@"ResponseBody"];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v9 options:0 format:0 error:0];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v16 = [v10 objectForKeyedSubscript:@"TokenData"];
    if ([v16 length])
    {
      if (v6)
      {
        uint64_t v17 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v24 = 138543362;
          uint64_t v25 = (uint64_t)v6;
          _os_log_impl(&dword_1DD340000, v17, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData was received with accompanying error: %{public}@", (uint8_t *)&v24, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      id v19 = v16;
      uint64_t v20 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v19;
    }
    else
    {
      uint64_t v21 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138543362;
        uint64_t v25 = (uint64_t)v6;
        _os_log_impl(&dword_1DD340000, v21, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData is empty in response dict from request, with error: %{public}@", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v22 = +[MDMConfiguration _emptyTokenErrorWithUnderlayingError:v6];
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v20 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
  }
  else
  {
    char v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v11;
      uint64_t v13 = [v5 objectForKeyedSubscript:@"ResponseStatusCode"];
      int v24 = 134218242;
      uint64_t v25 = [v13 integerValue];
      __int16 v26 = 2114;
      id v27 = v6;
      _os_log_impl(&dword_1DD340000, v12, OS_LOG_TYPE_ERROR, "MDMConfiguration: Org Token request failed with Non 200 response from the server. Response code: %ld Error: %{public}@", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    id v15 = v6;
    id v10 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

+ (id)getWatchPairingTokenForPhoneID:(id)a3 watchID:(id)a4 securityToken:(id)a5 outError:(id *)a6
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([a1 isGetTokenSupportedByServer])
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy__3;
    char v30 = __Block_byref_object_dispose__3;
    id v31 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__3;
    int v24 = __Block_byref_object_dispose__3;
    id v25 = 0;
    v34[0] = @"SecurityToken";
    v34[1] = @"PhoneUDID";
    v35[0] = v12;
    v35[1] = v10;
    v34[2] = @"WatchUDID";
    v35[2] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
    v32[0] = @"TokenServiceType";
    v32[1] = @"TokenParameters";
    v33[0] = @"com.apple.watch.pairing";
    v33[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__MDMConfiguration_getWatchPairingTokenForPhoneID_watchID_securityToken_outError___block_invoke;
    v19[3] = &unk_1E6CBCCA0;
    v19[4] = &v20;
    v19[5] = &v26;
    +[MDMCheckInRequest executeRequestForMessageType:@"GetToken" channelType:0 requestDict:v14 completionHandler:v19];
    id v15 = (void *)v27[5];
    if (v15)
    {
      id v16 = v15;
    }
    else if (a6)
    {
      uint64_t v17 = (void *)v21[5];
      if (v17) {
        *a6 = v17;
      }
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else if (a6)
  {
    [a1 getTokenUnsupportedError];
    id v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

void __82__MDMConfiguration_getWatchPairingTokenForPhoneID_watchID_securityToken_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"ResponseStatusCode"];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 200)
  {
    id v9 = [v5 objectForKeyedSubscript:@"ResponseBody"];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v9 options:0 format:0 error:0];
    }
    else
    {
      id v10 = 0;
    }
    id v16 = [v10 objectForKeyedSubscript:@"TokenData"];
    if (v16)
    {
      if (v6)
      {
        uint64_t v17 = *(NSObject **)(DMCLogObjects() + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v23 = 138543362;
          uint64_t v24 = (uint64_t)v6;
          _os_log_impl(&dword_1DD340000, v17, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData for pairing was received with accompanying error: %{public}@", (uint8_t *)&v23, 0xCu);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
      uint64_t v18 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      id v19 = v16;
    }
    else
    {
      uint64_t v20 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138543362;
        uint64_t v24 = (uint64_t)v6;
        _os_log_impl(&dword_1DD340000, v20, OS_LOG_TYPE_ERROR, "MDMConfiguration: TokenData for pairing is empty in response dict from request, with error: %{public}@", (uint8_t *)&v23, 0xCu);
      }
      uint64_t v18 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      id v19 = v6;
    }
    id v21 = v19;
    uint64_t v22 = *v18;
    *uint64_t v18 = v21;
  }
  else
  {
    id v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = v11;
      uint64_t v13 = [v5 objectForKeyedSubscript:@"ResponseStatusCode"];
      int v23 = 134218242;
      uint64_t v24 = [v13 integerValue];
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1DD340000, v12, OS_LOG_TYPE_ERROR, "MDMConfiguration: Pairing Token request failed with Non 200 response from the server. Response code: %ld Error: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    id v15 = v6;
    id v10 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

+ (id)getUnhidableAndUnlockableApps
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)getUnhidableApps
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)getUnlockableApps
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)fetchUnhidableAndUnlockableApps
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)setPropertyForKey:(id)a3 value:(id)a4 channelType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  int v23 = __Block_byref_object_copy__3;
  uint64_t v24 = __Block_byref_object_dispose__3;
  id v25 = 0;
  id v10 = [(MDMConfiguration *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MDMConfiguration_setPropertyForKey_value_channelType___block_invoke;
  block[3] = &unk_1E6CBCCC8;
  uint64_t v18 = &v20;
  unint64_t v19 = a5;
  void block[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async_and_wait(v10, block);

  id v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void __56__MDMConfiguration_setPropertyForKey_value_channelType___block_invoke(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  BOOL v3 = a1[5] != 0;
  uint64_t v4 = a1[8];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v2 _readPropertiesForChannelType:v4 createIfMissingFile:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    [v6 setObject:a1[5] forKeyedSubscript:a1[6]];
    uint64_t v7 = (void *)a1[4];
    uint64_t v8 = a1[8];
    uint64_t v9 = *(void *)(a1[7] + 8);
    id v21 = *(id *)(v9 + 40);
    char v10 = [v7 _writeProperties:v6 channelType:v8 error:&v21];
    objc_storeStrong((id *)(v9 + 40), v21);
    id v11 = *(NSObject **)(DMCLogObjects() + 8);
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = a1[5];
        uint64_t v12 = a1[6];
        *(_DWORD *)buf = 138543618;
        uint64_t v24 = v12;
        __int16 v25 = 2114;
        uint64_t v26 = v13;
        uint64_t v14 = "MDMConfiguration: setPropertyForKey: %{public}@ value: %{public}@";
        id v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_7:
        uint32_t v20 = 22;
LABEL_10:
        _os_log_impl(&dword_1DD340000, v15, v16, v14, buf, v20);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "MDMConfiguration: setPropertyForKey: failed to write plist";
      id v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v20 = 2;
      goto LABEL_10;
    }
  }
  else
  {
    id v17 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = a1[6];
      uint64_t v19 = *(void *)(*(void *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v18;
      __int16 v25 = 2114;
      uint64_t v26 = v19;
      uint64_t v14 = "MDMConfiguration: setPropertyForKey: cannot set property for key %{public}@. Error: %{public}@";
      id v15 = v17;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
}

- (id)getPropertyForKey:(id)a3 channelType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  os_log_type_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  uint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v7 = [(MDMConfiguration *)self memberQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__MDMConfiguration_getPropertyForKey_channelType___block_invoke;
  v11[3] = &unk_1E6CBCCF0;
  uint64_t v13 = &v15;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  dispatch_async_and_wait(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __50__MDMConfiguration_getPropertyForKey_channelType___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C9B8];
  BOOL v3 = [*(id *)(a1 + 32) _mdmPropertiesFilePathForChannelType:*(void *)(a1 + 56)];
  uint64_t v4 = [v2 dataWithContentsOfFile:v3];

  uint64_t v5 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v4 options:0 format:0 error:0];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v17 = 138543618;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      id v12 = "MDMConfiguration: getPropertyForKey: %{public}@ value: %{public}@";
      uint64_t v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
      uint32_t v15 = 22;
LABEL_7:
      _os_log_impl(&dword_1DD340000, v13, v14, v12, (uint8_t *)&v17, v15);
    }
  }
  else
  {
    os_log_type_t v16 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      id v12 = "MDMConfiguration: getPropertyForKey: cannot get property without plist";
      uint64_t v13 = v16;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 2;
      goto LABEL_7;
    }
  }
}

- (id)_mdmPropertiesFilePathForChannelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    MDMPropertiesUserFilePath();
    self = (MDMConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    MDMPropertiesFilePath();
    self = (MDMConfiguration *)objc_claimAutoreleasedReturnValue();
  }

  return self;
}

- (id)_readPropertiesForChannelType:(unint64_t)a3 createIfMissingFile:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = [(MDMConfiguration *)self memberQueueManagingProfileIdentifier];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v11 = [(MDMConfiguration *)self _mdmPropertiesFilePathForChannelType:a3];
    id v12 = [v10 dataWithContentsOfFile:v11];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F28F98] DMCSafePropertyListWithData:v12 options:2 format:0 error:0];
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (a5)
        {
          os_log_type_t v14 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v15 = *MEMORY[0x1E4F5E748];
          os_log_type_t v16 = DMCErrorArray();
          objc_msgSend(v14, "DMCErrorWithDomain:code:descriptionArray:errorType:", v15, 12113, v16, *MEMORY[0x1E4F5E6B8], 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        id v17 = 0;
        goto LABEL_15;
      }
    }
    else if (v6)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v17 = v13;
    uint64_t v13 = v17;
LABEL_15:

    goto LABEL_16;
  }
  if (!a5)
  {
    id v17 = 0;
    goto LABEL_17;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v19 = *MEMORY[0x1E4F5E748];
  id v12 = DMCErrorArray();
  objc_msgSend(v18, "DMCErrorWithDomain:code:descriptionArray:errorType:", v19, 12113, v12, *MEMORY[0x1E4F5E6B8], 0);
  id v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_17:

  return v17;
}

- (BOOL)_writeProperties:(id)a3 channelType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(MDMConfiguration *)self _mdmPropertiesFilePathForChannelType:a4];
  char v10 = [v8 DMCWriteToBinaryFile:v9];

  if (a5 && (v10 & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5E748];
    uint64_t v13 = DMCErrorArray();
    objc_msgSend(v11, "DMCErrorWithDomain:code:descriptionArray:errorType:", v12, 12114, v13, *MEMORY[0x1E4F5E6B8], 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

+ (id)getTokenUnsupportedError
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F5E6B0];
  uint64_t v4 = DMCErrorArray();
  uint64_t v5 = objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15008, v4, *MEMORY[0x1E4F5E6B8], 0);

  return v5;
}

+ (id)_emptyTokenErrorWithUnderlayingError:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F5E6B0];
  id v5 = a3;
  BOOL v6 = DMCErrorArray();
  uint64_t v7 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 15033, v6, v5, *MEMORY[0x1E4F5E6B8], 0);

  return v7;
}

- (NSString)memberQueueManagingProfileIdentifier
{
  return self->_memberQueueManagingProfileIdentifier;
}

- (void)setMemberQueueManagingProfileIdentifier:(id)a3
{
}

- (NSArray)memberQueueCheckInPinnedSecCertificateRefs
{
  return self->_memberQueueCheckInPinnedSecCertificateRefs;
}

- (void)setMemberQueueCheckInPinnedSecCertificateRefs:(id)a3
{
}

- (BOOL)memberQueuePinningRevocationCheckRequired
{
  return self->_memberQueuePinningRevocationCheckRequired;
}

- (void)setMemberQueuePinningRevocationCheckRequired:(BOOL)a3
{
  self->_memberQueuePinningRevocationCheckRequired = a3;
}

- (BOOL)memberQueueSignMessage
{
  return self->_memberQueueSignMessage;
}

- (void)setMemberQueueSignMessage:(BOOL)a3
{
  self->_memberQueueSignMessage = a3;
}

- (NSString)memberQueueTopic
{
  return self->_memberQueueTopic;
}

- (void)setMemberQueueTopic:(id)a3
{
}

- (NSDictionary)memberQueueOrganizationInfo
{
  return self->_memberQueueOrganizationInfo;
}

- (void)setMemberQueueOrganizationInfo:(id)a3
{
}

- (NSURL)memberQueueServerURL
{
  return self->_memberQueueServerURL;
}

- (void)setMemberQueueServerURL:(id)a3
{
}

- (NSURL)memberQueueCheckInURL
{
  return self->_memberQueueCheckInURL;
}

- (void)setMemberQueueCheckInURL:(id)a3
{
}

- (NSArray)memberQueueServerCapabilities
{
  return self->_memberQueueServerCapabilities;
}

- (void)setMemberQueueServerCapabilities:(id)a3
{
}

- (BOOL)isUserEnrollment
{
  return self->_isUserEnrollment;
}

- (void)setIsUserEnrollment:(BOOL)a3
{
  self->_isUserEnrollment = a3;
}

- (BOOL)supportUserChannel
{
  return self->_supportUserChannel;
}

- (void)setSupportUserChannel:(BOOL)a3
{
  self->_supportUserChannel = a3;
}

- (NSString)enrollmentID
{
  return self->_enrollmentID;
}

- (void)setEnrollmentID:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (NSString)easEnrollmentID
{
  return self->_easEnrollmentID;
}

- (void)setEasEnrollmentID:(id)a3
{
}

- (NSString)rmAccountID
{
  return self->_rmAccountID;
}

- (void)setRmAccountID:(id)a3
{
}

- (NSString)enrollmentMode
{
  return self->_enrollmentMode;
}

- (void)setEnrollmentMode:(id)a3
{
}

- (BOOL)isProfileLocked
{
  return self->_isProfileLocked;
}

- (NSData)identityPersistentID
{
  return self->_identityPersistentID;
}

- (void)setIdentityPersistentID:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (__SecIdentity)memberQueueIdentity
{
  return self->_memberQueueIdentity;
}

- (void)setMemberQueueIdentity:(__SecIdentity *)a3
{
  self->_memberQueueIdentity = a3;
}

- (NSNumber)memberQueuePollingInterval
{
  return self->_memberQueuePollingInterval;
}

- (void)setMemberQueuePollingInterval:(id)a3
{
}

- (NSDictionary)memberQueueMDMOptions
{
  return self->_memberQueueMDMOptions;
}

- (void)setMemberQueueMDMOptions:(id)a3
{
}

- (unint64_t)memberQueueAccessRights
{
  return self->_memberQueueAccessRights;
}

- (void)setMemberQueueAccessRights:(unint64_t)a3
{
  self->_memberQueueAccessRights = a3;
}

- (BOOL)memberQueueUseDevelopmentAPNS
{
  return self->_memberQueueUseDevelopmentAPNS;
}

- (void)setMemberQueueUseDevelopmentAPNS:(BOOL)a3
{
  self->_memberQueueUseDevelopmentAPNS = a3;
}

- (NSString)memberQueuePushMagic
{
  return self->_memberQueuePushMagic;
}

- (void)setMemberQueuePushMagic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueuePushMagic, 0);
  objc_storeStrong((id *)&self->_memberQueueMDMOptions, 0);
  objc_storeStrong((id *)&self->_memberQueuePollingInterval, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_identityPersistentID, 0);
  objc_storeStrong((id *)&self->_enrollmentMode, 0);
  objc_storeStrong((id *)&self->_rmAccountID, 0);
  objc_storeStrong((id *)&self->_easEnrollmentID, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_enrollmentID, 0);
  objc_storeStrong((id *)&self->_memberQueueServerCapabilities, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInURL, 0);
  objc_storeStrong((id *)&self->_memberQueueServerURL, 0);
  objc_storeStrong((id *)&self->_memberQueueOrganizationInfo, 0);
  objc_storeStrong((id *)&self->_memberQueueTopic, 0);
  objc_storeStrong((id *)&self->_memberQueueCheckInPinnedSecCertificateRefs, 0);

  objc_storeStrong((id *)&self->_memberQueueManagingProfileIdentifier, 0);
}

- (NSUUID)wallpaperConfigurationUUID
{
  id v2 = [(MDMConfiguration *)self getPropertyForKey:@"wallpaperConfigUUID" channelType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];

  return (NSUUID *)v3;
}

- (void)setWallpaperConfigurationUUID:(id)a3
{
  id v5 = [a3 UUIDString];
  id v4 = [(MDMConfiguration *)self setPropertyForKey:@"wallpaperConfigUUID" value:v5 channelType:0];
}

@end