@interface CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings
+ (Class)applicationBundleType;
- (BOOL)hasApplicationContainer;
- (BOOL)hasApplicationContainerEnvironment;
- (BOOL)hasUserPrivacySettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPUserPrivacySettings)userPrivacySettings;
- (NSMutableArray)applicationBundles;
- (NSString)applicationContainer;
- (id)applicationBundleAtIndex:(unint64_t)a3;
- (id)applicationContainerEnvironmentAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsApplicationContainerEnvironment:(id)a3;
- (int)applicationContainerEnvironment;
- (unint64_t)applicationBundlesCount;
- (unint64_t)hash;
- (void)addApplicationBundle:(id)a3;
- (void)clearApplicationBundles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationBundles:(id)a3;
- (void)setApplicationContainer:(id)a3;
- (void)setApplicationContainerEnvironment:(int)a3;
- (void)setHasApplicationContainerEnvironment:(BOOL)a3;
- (void)setUserPrivacySettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings

- (BOOL)hasApplicationContainer
{
  return self->_applicationContainer != 0;
}

- (int)applicationContainerEnvironment
{
  if (*(unsigned char *)&self->_has) {
    return self->_applicationContainerEnvironment;
  }
  else {
    return 2;
  }
}

- (void)setApplicationContainerEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_applicationContainerEnvironment = a3;
}

- (void)setHasApplicationContainerEnvironment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasApplicationContainerEnvironment
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)applicationContainerEnvironmentAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"production";
  }
  else if (a3 == 2)
  {
    v4 = @"sandbox";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsApplicationContainerEnvironment:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"production") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"sandbox")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (void)clearApplicationBundles
{
  objc_msgSend_removeAllObjects(self->_applicationBundles, a2, v2);
}

- (void)addApplicationBundle:(id)a3
{
  v4 = (const char *)a3;
  applicationBundles = self->_applicationBundles;
  v8 = (char *)v4;
  if (!applicationBundles)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_applicationBundles;
    self->_applicationBundles = v6;

    v4 = v8;
    applicationBundles = self->_applicationBundles;
  }
  objc_msgSend_addObject_(applicationBundles, v4, (uint64_t)v4);
}

- (unint64_t)applicationBundlesCount
{
  return objc_msgSend_count(self->_applicationBundles, a2, v2);
}

- (id)applicationBundleAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_applicationBundles, a2, a3);
}

+ (Class)applicationBundleType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasUserPrivacySettings
{
  return self->_userPrivacySettings != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings;
  v4 = [(CKDPUserPrivacySettingsBatchLookupResponseContainerPrivacySettings *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  applicationContainer = self->_applicationContainer;
  if (applicationContainer) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)applicationContainer, @"applicationContainer");
  }
  if (*(unsigned char *)&self->_has)
  {
    int applicationContainerEnvironment = self->_applicationContainerEnvironment;
    if (applicationContainerEnvironment == 1)
    {
      v9 = @"production";
      objc_msgSend_setObject_forKey_(v6, v5, @"production", @"applicationContainerEnvironment");
    }
    else if (applicationContainerEnvironment == 2)
    {
      v9 = @"sandbox";
      objc_msgSend_setObject_forKey_(v6, v5, @"sandbox", @"applicationContainerEnvironment");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_applicationContainerEnvironment);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"applicationContainerEnvironment");
    }
  }
  applicationBundles = self->_applicationBundles;
  if (applicationBundles) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)applicationBundles, @"applicationBundle");
  }
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    v13 = objc_msgSend_dictionaryRepresentation(userPrivacySettings, v5, (uint64_t)applicationBundles);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"userPrivacySettings");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4D84CB0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_applicationContainer) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_applicationBundles;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_userPrivacySettings) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  applicationContainer = self->_applicationContainer;
  id v17 = v4;
  if (applicationContainer)
  {
    objc_msgSend_setApplicationContainer_(v4, v5, (uint64_t)applicationContainer);
    id v4 = v17;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_applicationContainerEnvironment;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (objc_msgSend_applicationBundlesCount(self, v5, (uint64_t)applicationContainer))
  {
    objc_msgSend_clearApplicationBundles(v17, v7, v8);
    uint64_t v11 = objc_msgSend_applicationBundlesCount(self, v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_applicationBundleAtIndex_(self, v7, i);
        objc_msgSend_addApplicationBundle_(v17, v15, (uint64_t)v14);
      }
    }
  }
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings) {
    objc_msgSend_setUserPrivacySettings_(v17, v7, (uint64_t)userPrivacySettings);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_applicationContainer, v11, (uint64_t)a3);
  long long v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 24) = self->_applicationContainerEnvironment;
    *(unsigned char *)(v10 + 40) |= 1u;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v14 = self->_applicationBundles;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v27, v31, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v14);
        }
        v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, (void)v27);
        objc_msgSend_addApplicationBundle_((void *)v10, v22, (uint64_t)v21);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v27, v31, 16);
    }
    while (v18);
  }

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_userPrivacySettings, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v24;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_13;
  }
  applicationContainer = self->_applicationContainer;
  uint64_t v9 = v4[2];
  if ((unint64_t)applicationContainer | v9)
  {
    if (!objc_msgSend_isEqual_(applicationContainer, v7, v9)) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[5] & 1) == 0 || self->_applicationContainerEnvironment != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (v4[5])
  {
LABEL_13:
    char isEqual = 0;
    goto LABEL_14;
  }
  applicationBundles = self->_applicationBundles;
  uint64_t v11 = v4[1];
  if ((unint64_t)applicationBundles | v11 && !objc_msgSend_isEqual_(applicationBundles, v7, v11)) {
    goto LABEL_13;
  }
  userPrivacySettings = self->_userPrivacySettings;
  uint64_t v13 = v4[4];
  if ((unint64_t)userPrivacySettings | v13) {
    char isEqual = objc_msgSend_isEqual_(userPrivacySettings, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_14:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_applicationContainer, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_applicationContainerEnvironment;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 ^ v4;
  uint64_t v9 = objc_msgSend_hash(self->_applicationBundles, v5, v6);
  return v8 ^ v9 ^ objc_msgSend_hash(self->_userPrivacySettings, v10, v11);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *((void *)v5 + 2);
  if (v6) {
    objc_msgSend_setApplicationContainer_(self, v4, v6);
  }
  if (*((unsigned char *)v5 + 40))
  {
    self->_int applicationContainerEnvironment = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *((id *)v5 + 1);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend_addApplicationBundle_(self, v10, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v11);
  }

  userPrivacySettings = self->_userPrivacySettings;
  uint64_t v16 = *((void *)v5 + 4);
  if (userPrivacySettings)
  {
    if (v16) {
      objc_msgSend_mergeFrom_(userPrivacySettings, v14, v16);
    }
  }
  else if (v16)
  {
    objc_msgSend_setUserPrivacySettings_(self, v14, v16);
  }
}

- (NSString)applicationContainer
{
  return self->_applicationContainer;
}

- (void)setApplicationContainer:(id)a3
{
}

- (NSMutableArray)applicationBundles
{
  return self->_applicationBundles;
}

- (void)setApplicationBundles:(id)a3
{
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivacySettings, 0);
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_applicationBundles, 0);
}

@end