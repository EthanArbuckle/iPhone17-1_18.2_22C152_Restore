@interface CKDPUserPrivacySettingsRetrieveResponse
+ (Class)applicationBundleType;
- (BOOL)hasUserPrivacySettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPUserPrivacySettings)userPrivacySettings;
- (NSMutableArray)applicationBundles;
- (id)applicationBundleAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)applicationBundlesCount;
- (unint64_t)hash;
- (void)addApplicationBundle:(id)a3;
- (void)clearApplicationBundles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationBundles:(id)a3;
- (void)setUserPrivacySettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPUserPrivacySettingsRetrieveResponse

- (BOOL)hasUserPrivacySettings
{
  return self->_userPrivacySettings != 0;
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
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPUserPrivacySettingsRetrieveResponse;
  v4 = [(CKDPUserPrivacySettingsRetrieveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings)
  {
    v8 = objc_msgSend_dictionaryRepresentation(userPrivacySettings, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"userPrivacySettings");
  }
  applicationBundles = self->_applicationBundles;
  if (applicationBundles) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)applicationBundles, @"applicationBundle");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EE926C((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userPrivacySettings) {
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_applicationBundles;
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
}

- (void)copyTo:(id)a3
{
  id v16 = a3;
  userPrivacySettings = self->_userPrivacySettings;
  if (userPrivacySettings) {
    objc_msgSend_setUserPrivacySettings_(v16, v4, (uint64_t)userPrivacySettings);
  }
  if (objc_msgSend_applicationBundlesCount(self, v4, (uint64_t)userPrivacySettings))
  {
    objc_msgSend_clearApplicationBundles(v16, v6, v7);
    uint64_t v10 = objc_msgSend_applicationBundlesCount(self, v8, v9);
    if (v10)
    {
      uint64_t v12 = v10;
      for (uint64_t i = 0; i != v12; ++i)
      {
        long long v14 = objc_msgSend_applicationBundleAtIndex_(self, v11, i);
        objc_msgSend_addApplicationBundle_(v16, v15, (uint64_t)v14);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_userPrivacySettings, v11, (uint64_t)a3);
  long long v13 = (void *)v10[2];
  v10[2] = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v14 = self->_applicationBundles;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v14);
        }
        v21 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (void)v24);
        objc_msgSend_addApplicationBundle_(v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((userPrivacySettings = self->_userPrivacySettings, uint64_t v9 = v4[2], !((unint64_t)userPrivacySettings | v9))
     || objc_msgSend_isEqual_(userPrivacySettings, v7, v9)))
  {
    applicationBundles = self->_applicationBundles;
    uint64_t v11 = v4[1];
    if ((unint64_t)applicationBundles | v11) {
      char isEqual = objc_msgSend_isEqual_(applicationBundles, v7, v11);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_userPrivacySettings, a2, v2);
  return objc_msgSend_hash(self->_applicationBundles, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  userPrivacySettings = self->_userPrivacySettings;
  uint64_t v7 = *((void *)v5 + 2);
  if (userPrivacySettings)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(userPrivacySettings, v4, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setUserPrivacySettings_(self, v4, v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = *((id *)v5 + 1);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v15, v19, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend_addApplicationBundle_(self, v11, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v15, v19, 16);
    }
    while (v12);
  }
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
}

- (NSMutableArray)applicationBundles
{
  return self->_applicationBundles;
}

- (void)setApplicationBundles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivacySettings, 0);
  objc_storeStrong((id *)&self->_applicationBundles, 0);
}

@end