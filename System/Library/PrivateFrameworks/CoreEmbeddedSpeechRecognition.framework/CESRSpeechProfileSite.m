@interface CESRSpeechProfileSite
+ (id)_existingSpeechProfileSiteAtURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
+ (id)_speechProfileSiteAtRootDirectoryURL:(id)a3 userId:(id)a4 readOnly:(BOOL)a5 error:(id *)a6;
+ (id)_speechProfileSiteAtURL:(id)a3 userId:(id)a4 userIdHash:(id)a5 readOnly:(BOOL)a6 error:(id *)a7;
+ (id)speechProfileSiteAtURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSpeechProfileSite:(id)a3;
- (BOOL)isEquivalentSpeechProfileSiteURL:(id)a3;
- (BOOL)isInUserVault;
- (BOOL)recordMaintenance:(id *)a3;
- (BOOL)recordRebuild:(id *)a3;
- (BOOL)recordReset:(id *)a3;
- (BOOL)recordSchemaVersion:(id *)a3;
- (BOOL)remove:(id *)a3;
- (BOOL)removeInstance:(id)a3 error:(id *)a4;
- (CESRSpeechProfileSite)init;
- (CESRSpeechProfileSite)initWithSpeechProfileSiteURL:(id)a3 readOnly:(BOOL)a4 create:(BOOL)a5 userId:(id)a6 userIdHash:(id)a7 error:(id *)a8;
- (NSArray)instances;
- (NSDate)lastMaintenance;
- (NSDate)lastRebuild;
- (NSDate)lastReset;
- (NSNumber)schemaVersion;
- (NSNumber)userIdHash;
- (NSString)personaId;
- (NSString)userId;
- (NSURL)speechProfileSiteURL;
- (id)description;
- (id)instanceWithLocale:(id)a3 options:(unsigned __int8)a4 error:(id *)a5;
- (int)dataProtectionClass;
- (unint64_t)hash;
@end

@implementation CESRSpeechProfileSite

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdHash, 0);
  objc_storeStrong((id *)&self->_speechProfileSiteURL, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_description, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (NSNumber)userIdHash
{
  return self->_userIdHash;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSURL)speechProfileSiteURL
{
  return self->_speechProfileSiteURL;
}

- (BOOL)isInUserVault
{
  return self->_isInUserVault;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_speechProfileSiteURL hash];
}

- (BOOL)isEquivalentSpeechProfileSiteURL:(id)a3
{
  speechProfileSiteURL = self->_speechProfileSiteURL;
  id v4 = a3;
  v5 = [(NSURL *)speechProfileSiteURL path];
  v6 = [v4 path];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqualToSpeechProfileSite:(id)a3
{
  id v4 = [a3 speechProfileSiteURL];
  LOBYTE(self) = [(CESRSpeechProfileSite *)self isEquivalentSpeechProfileSiteURL:v4];

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CESRSpeechProfileSite *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CESRSpeechProfileSite *)self isEqualToSpeechProfileSite:v5];

  return v6;
}

- (BOOL)remove:(id *)a3
{
  return SFRemoveItemIfExistsAtURL();
}

- (BOOL)removeInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 remove:a4];
  if (v7) {
    [(NSMutableArray *)self->_instances removeObject:v6];
  }

  return v7;
}

- (id)instanceWithLocale:(id)a3 options:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v5 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = self->_instances;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = [v13 locale];
        if ([v14 isEqual:v7])
        {
          int v15 = [v13 options];

          if (v15 == v5)
          {
            id v16 = v13;

            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v16 = +[CESRSpeechProfileInstance loadOrCreateInstanceAtSpeechProfileSiteURL:self->_speechProfileSiteURL locale:v7 options:v5 error:a5];
  if (v16) {
    [(NSMutableArray *)self->_instances addObject:v16];
  }
LABEL_14:

  return v16;
}

- (NSArray)instances
{
  return (NSArray *)self->_instances;
}

- (BOOL)recordSchemaVersion:(id *)a3
{
  return [(CESRDictionaryLog *)self->_log writeUpdatedObject:&unk_1F129E818 forKey:@"schemaVersion" error:a3];
}

- (NSNumber)schemaVersion
{
  return (NSNumber *)[(CESRDictionaryLog *)self->_log objectForKey:@"schemaVersion"];
}

- (BOOL)recordReset:(id *)a3
{
  log = self->_log;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(a3) = [(CESRDictionaryLog *)log writeUpdatedObject:v5 forKey:@"lastReset" error:a3];

  return (char)a3;
}

- (NSDate)lastReset
{
  return (NSDate *)[(CESRDictionaryLog *)self->_log objectForKey:@"lastReset"];
}

- (BOOL)recordMaintenance:(id *)a3
{
  log = self->_log;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(a3) = [(CESRDictionaryLog *)log writeUpdatedObject:v5 forKey:@"lastMaintenance" error:a3];

  return (char)a3;
}

- (NSDate)lastMaintenance
{
  return (NSDate *)[(CESRDictionaryLog *)self->_log objectForKey:@"lastMaintenance"];
}

- (BOOL)recordRebuild:(id *)a3
{
  log = self->_log;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  LOBYTE(a3) = [(CESRDictionaryLog *)log writeUpdatedObject:v5 forKey:@"lastRebuild" error:a3];

  return (char)a3;
}

- (NSDate)lastRebuild
{
  return (NSDate *)[(CESRDictionaryLog *)self->_log objectForKey:@"lastRebuild"];
}

- (NSString)userId
{
  return (NSString *)[(CESRDictionaryLog *)self->_log objectForKey:@"userId"];
}

- (id)description
{
  return self->_description;
}

- (CESRSpeechProfileSite)initWithSpeechProfileSiteURL:(id)a3 readOnly:(BOOL)a4 create:(BOOL)a5 userId:(id)a6 userIdHash:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  v37.receiver = self;
  v37.super_class = (Class)CESRSpeechProfileSite;
  v18 = [(CESRSpeechProfileSite *)&v37 init];
  if (!v18) {
    goto LABEL_12;
  }
  uint64_t v19 = SFPersonaIdFromSiteURL();
  personaId = v18->_personaId;
  v18->_personaId = (NSString *)v19;

  long long v21 = [MEMORY[0x1E4F3C290] sharedInstance];
  long long v22 = [v21 personaForContainerRelativeURL:v15];
  v18->_isInUserVault = v22 != 0;

  objc_storeStrong((id *)&v18->_speechProfileSiteURL, a3);
  v18->_dataProtectionClass = SFProtectionClassForDataSiteURL();
  if (v11)
  {
    v23 = SFGetOrCreateDirectoryURL();

    if (!v23) {
      goto LABEL_13;
    }
  }
  uint64_t v24 = [[CESRDictionaryLog alloc] initWithFilename:@"Site" protectionClass:v18->_dataProtectionClass directory:v18->_speechProfileSiteURL readOnly:v12 create:v11 error:a8];
  log = v18->_log;
  v18->_log = v24;

  v26 = v18->_log;
  if (!v26
    || v16
    && v11
    && ![(CESRDictionaryLog *)v26 writeUpdatedObject:v16 forKey:@"userId" error:a8])
  {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v18->_userIdHash, a7);
  v27 = NSString;
  uint64_t v28 = SFSpeechProfileSiteDescription();
  v29 = (void *)v28;
  v30 = v18->_isInUserVault ? @" [UV]" : &stru_1F1291150;
  uint64_t v31 = [v27 stringWithFormat:@"%@%@", v28, v30];
  description = v18->_description;
  v18->_description = (NSString *)v31;

  uint64_t v33 = +[CESRSpeechProfileInstance loadAllInstancesAtSpeechProfileSiteURL:v18->_speechProfileSiteURL error:a8];
  instances = v18->_instances;
  v18->_instances = (NSMutableArray *)v33;

  if (!v18->_instances) {
LABEL_13:
  }
    v35 = 0;
  else {
LABEL_12:
  }
    v35 = v18;

  return v35;
}

- (CESRSpeechProfileSite)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

+ (id)_existingSpeechProfileSiteAtURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = SFUserIdHashFromDataSiteURL();
  uint64_t v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSpeechProfileSiteURL:v8 readOnly:v6 create:0 userId:0 userIdHash:v9 error:a5];

  if (!v10)
  {
LABEL_13:
    id v24 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    a1 = [v10 userId];
    uint64_t v11 = SFUserIdHash();
    if (!v11)
    {

      goto LABEL_15;
    }
    id v8 = (id)v11;
  }
  BOOL v12 = [v10 userId];
  v13 = SFUserIdHash();
  char v14 = [v9 isEqual:v13];

  if (v9)
  {
    if (v14) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }

  if ((v14 & 1) == 0)
  {
LABEL_9:
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F281F8];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    id v17 = NSString;
    v18 = SFUserIdHashToString();
    uint64_t v19 = [v10 speechProfileSiteURL];
    long long v20 = [v17 stringWithFormat:@"Speech profile site: %@ does not match userIdHash: %@ at speechProfileSiteURL: %@", v10, v18, v19, v26];
    v27[0] = v20;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    long long v22 = [v15 errorWithDomain:v16 code:-1000 userInfo:v21];
    v23 = v22;
    if (a5 && v22) {
      *a5 = v22;
    }

    goto LABEL_13;
  }
LABEL_15:
  id v24 = v10;
LABEL_16:

  return v24;
}

+ (id)_speechProfileSiteAtURL:(id)a3 userId:(id)a4 userIdHash:(id)a5 readOnly:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a3;
  char v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSpeechProfileSiteURL:v13 readOnly:v8 create:v8 ^ 1 userId:v11 userIdHash:v12 error:a7];

  if (v14)
  {
    if (!v11)
    {
      id v12 = [v14 userId];
      if (!v12) {
        goto LABEL_6;
      }
    }
    id v15 = [v14 userId];
    char v16 = [v11 isEqual:v15];

    if (v11)
    {
      if (v16)
      {
LABEL_6:
        id v17 = v14;
        goto LABEL_13;
      }
    }
    else
    {

      if (v16) {
        goto LABEL_6;
      }
    }
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F281F8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    long long v20 = NSString;
    long long v21 = [v14 speechProfileSiteURL];
    long long v22 = [v20 stringWithFormat:@"Speech profile site: %@ does not match userId: \"%@\" at speechProfileSiteURL: %@", v14, v11, v21];
    v28[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v24 = [v18 errorWithDomain:v19 code:-1000 userInfo:v23];
    v25 = v24;
    if (a7 && v24) {
      *a7 = v24;
    }
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

+ (id)_speechProfileSiteAtRootDirectoryURL:(id)a3 userId:(id)a4 readOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = SFUserIdHash();
  id v13 = SFDataSiteURL();

  char v14 = [a1 _speechProfileSiteAtURL:v13 userId:v10 userIdHash:v12 readOnly:v7 error:a6];

  return v14;
}

+ (id)speechProfileSiteAtURL:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  return (id)[a1 _speechProfileSiteAtURL:a3 userId:0 userIdHash:0 readOnly:a4 error:a5];
}

@end