@interface CKDServerConfiguration
- (BOOL)allowCloudMediaProcessingOffloadForGM:(id)a3;
- (BOOL)allowCloudMediaProcessingOffloadForSeed:(id)a3;
- (BOOL)allowExpiredDNSBehavior:(id)a3;
- (BOOL)applicationWithBundleID:(id)a3 canSyncUsingVersion:(id)a4 forContainerID:(id)a5;
- (BOOL)isExpired;
- (CKDServerConfiguration)initWithPropertyDictionary:(id)a3;
- (CKDServerConfiguration)initWithValues:(id)a3;
- (NSDate)expiry;
- (NSDictionary)values;
- (NSMutableDictionary)allowedAppVersionsCache;
- (NSString)description;
- (double)publicIdentitiesExpirationTimeout:(id)a3;
- (id)chunkProfileConfigurationDefaultProfilePolicy:(id)a3;
- (id)chunkProfileConfigurationFileExtensionToProfileMap:(id)a3;
- (id)chunkProfileConfigurationVersion:(id)a3;
- (id)cloudMediaProcessingPublicKeyURLString:(id)a3;
- (id)dictionaryPropertyEncoding;
- (id)iCloudAppSiteAssociationData;
- (id)suggestedMergeableDeltaSize:(id)a3;
- (id)transcodeServerPublicKeyURLs:(id)a3;
- (id)valueForKeyPath:(id)a3 forContainerID:(id)a4;
- (id)valuesForContainerID:(id)a3;
- (int64_t)tokenRegisterDays:(id)a3;
- (unint64_t)c2AllOperationGroupMetricsReportFrequency:(id)a3;
- (unint64_t)c2AllOperationGroupMetricsReportFrequencyBase:(id)a3;
- (unint64_t)c2AllOperationMetricsReportFrequency:(id)a3;
- (unint64_t)c2AllOperationMetricsReportFrequencyBase:(id)a3;
- (unint64_t)c2ClientApplicationMetricsReportFrequency:(id)a3;
- (unint64_t)c2ClientApplicationMetricsReportFrequencyBase:(id)a3;
- (unint64_t)c2ClientOperationMetricsReportFrequency:(id)a3;
- (unint64_t)c2ClientOperationMetricsReportFrequencyBase:(id)a3;
- (unint64_t)c2NetworkMetricsReportFrequency:(id)a3;
- (unint64_t)c2NetworkMetricsReportFrequencyBase:(id)a3;
- (unint64_t)maxBatchSize:(id)a3;
- (unint64_t)maxInlineMergeableDeltaSize:(id)a3;
- (void)setAllowedAppVersionsCache:(id)a3;
@end

@implementation CKDServerConfiguration

- (CKDServerConfiguration)initWithValues:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKDServerConfiguration;
  v7 = [(CKDServerConfiguration *)&v21 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_copy(v4, v5, v6);
    values = v7->_values;
    v7->_values = (NSDictionary *)v8;

    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"expiresAfterSeconds");
    v14 = v11;
    if (v11)
    {
      v15 = (void *)MEMORY[0x1E4F1C9C8];
      objc_msgSend_doubleValue(v11, v12, v13);
      uint64_t v18 = objc_msgSend_dateWithTimeIntervalSinceNow_(v15, v16, v17);
      expiry = v7->_expiry;
      v7->_expiry = (NSDate *)v18;
    }
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v8 = objc_msgSend_expiry(self, v6, v7);
  v11 = objc_msgSend_values(self, v9, v10);
  uint64_t v13 = objc_msgSend_stringWithFormat_(v3, v12, @"<%@ %p> (Expires %@, Values %@)", v5, self, v8, v11);

  return (NSString *)v13;
}

- (BOOL)isExpired
{
  v3 = objc_msgSend_expiry(self, a2, v2);
  uint64_t v6 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v4, v5);
  BOOL v8 = objc_msgSend_compare_(v3, v7, (uint64_t)v6) == -1;

  return v8;
}

- (id)valuesForContainerID:(id)a3
{
  id v4 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    BOOL v8 = objc_msgSend_objectForKeyedSubscript_(self->_values, v5, @"containerOverrides");
    v11 = objc_msgSend_containerIdentifier(v4, v9, v10);
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v12, (uint64_t)v11);

    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_addObject_(v7, v14, (uint64_t)v13);
      }
    }
  }
  if (objc_msgSend_isAppleInternal(v4, v5, v6))
  {
    v16 = objc_msgSend_objectForKeyedSubscript_(self->_values, v15, @"appleOverrides");
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend_addObject_(v7, v17, (uint64_t)v16);
      }
    }
  }
  values = self->_values;
  if (values) {
    objc_msgSend_addObject_(v7, v15, (uint64_t)values);
  }

  return v7;
}

- (id)valueForKeyPath:(id)a3 forContainerID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_msgSend_valuesForContainerID_(self, v7, (uint64_t)a4);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v18, v22, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = objc_msgSend_valueForKeyPath_(*(void **)(*((void *)&v18 + 1) + 8 * i), v11, (uint64_t)v6, (void)v18);
        if (v15)
        {
          v16 = (void *)v15;
          goto LABEL_11;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v18, v22, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)applicationWithBundleID:(id)a3 canSyncUsingVersion:(id)a4 forContainerID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_length(v9, v11, v12))
  {
    v14 = objc_msgSend_stringByAppendingString_(v8, v13, (uint64_t)v9);
    uint64_t v15 = self;
    objc_sync_enter(v15);
    long long v18 = objc_msgSend_allowedAppVersionsCache(v15, v16, v17);

    if (!v18)
    {
      long long v21 = objc_opt_new();
      objc_msgSend_setAllowedAppVersionsCache_(v15, v22, (uint64_t)v21);
    }
    uint64_t v23 = objc_msgSend_allowedAppVersionsCache(v15, v19, v20);
    v25 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v14);

    if (!v25)
    {
      v28 = objc_msgSend_values(v15, v26, v27);
      v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"bundleIds");

      v32 = objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)v8);
      uint64_t v33 = compareVersionStrings(v32, v9);
      if (v33 == -1 || v33 == 0 || v32 == 0) {
        v25 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        v25 = (void *)MEMORY[0x1E4F1CC28];
      }
      v38 = objc_msgSend_allowedAppVersionsCache(v15, v34, v35);
      objc_msgSend_setObject_forKeyedSubscript_(v38, v39, (uint64_t)v25, v14);
    }
    objc_sync_exit(v15);

    char v42 = objc_msgSend_BOOLValue(v25, v40, v41);
  }
  else
  {
    char v42 = 1;
  }

  return v42;
}

- (int64_t)tokenRegisterDays:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"pushTokenRegisterDays", a3);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int64_t v6 = objc_msgSend_integerValue(v3, v4, v5);
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

- (id)transcodeServerPublicKeyURLs:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"assetKeyEncryption", a3);
}

- (id)cloudMediaProcessingPublicKeyURLString:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"cmpIdentityUrl", a3);
}

- (BOOL)allowCloudMediaProcessingOffloadForSeed:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"allowCmpOffloadForSeed", a3);
  int64_t v6 = v3;
  if (v3) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)allowCloudMediaProcessingOffloadForGM:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"allowCmpOffloadForGM", a3);
  int64_t v6 = v3;
  if (v3) {
    char v7 = objc_msgSend_BOOLValue(v3, v4, v5);
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)maxBatchSize:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F19E98];
  id v5 = a3;
  id v8 = objc_msgSend_sharedOptions(v4, v6, v7);
  unint64_t v11 = objc_msgSend_maxBatchSize(v8, v9, v10);

  uint64_t v13 = objc_msgSend_valueForKeyPath_forContainerID_(self, v12, @"maxBatchSize", v5);

  if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
    unint64_t v11 = objc_msgSend_unsignedIntegerValue(v13, v14, v15);
  }

  return v11;
}

- (double)publicIdentitiesExpirationTimeout:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F19E98];
  id v5 = a3;
  id v8 = objc_msgSend_sharedOptions(v4, v6, v7);
  objc_msgSend_publicIdentitiesExpirationTimeout(v8, v9, v10);
  double v12 = v11;

  v14 = objc_msgSend_valueForKeyPath_forContainerID_(self, v13, @"expirationTimeout", v5);

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_doubleValue(v14, v15, v16);
    double v12 = v17;
  }

  return v12;
}

- (BOOL)allowExpiredDNSBehavior:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F19E98];
  id v5 = a3;
  id v8 = objc_msgSend_sharedOptions(v4, v6, v7);
  char v11 = objc_msgSend_allowExpiredDNSBehavior(v8, v9, v10);

  uint64_t v13 = objc_msgSend_valueForKeyPath_forContainerID_(self, v12, @"allowExpiredDNSBehavior", v5);

  if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v11 = objc_msgSend_BOOLValue(v13, v14, v15);
  }

  return v11;
}

- (unint64_t)c2NetworkMetricsReportFrequency:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.reportFrequency", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2NetworkMetricsReportFrequencyBase:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.reportFrequencyBase", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientOperationMetricsReportFrequency:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.clientOperationMetrics.reportFrequency", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientOperationMetricsReportFrequencyBase:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.clientOperationMetrics.reportFrequencyBase", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientApplicationMetricsReportFrequency:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.applicationMetrics.reportFrequency", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2ClientApplicationMetricsReportFrequencyBase:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.applicationMetrics.reportFrequencyBase", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationMetricsReportFrequency:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.allOperationMetrics.reportFrequency", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationMetricsReportFrequencyBase:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.allOperationMetrics.reportFrequencyBase", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationGroupMetricsReportFrequency:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.allOperationGroupMetrics.reportFrequency", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (unint64_t)c2AllOperationGroupMetricsReportFrequencyBase:(id)a3
{
  v3 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"c2MetricsLegacy.allOperationGroupMetrics.reportFrequencyBase", a3);
  unint64_t v6 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);

  return v6;
}

- (id)chunkProfileConfigurationVersion:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"chunkProfileConfiguration.version", a3);
}

- (id)chunkProfileConfigurationFileExtensionToProfileMap:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = objc_msgSend_valuesForContainerID_(self, v6, (uint64_t)v4);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = objc_msgSend_reverseObjectEnumerator(v7, v8, v9, 0);
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v20, v24, 16);
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v10);
        }
        double v17 = objc_msgSend_valueForKeyPath_(*(void **)(*((void *)&v20 + 1) + 8 * i), v13, @"chunkProfileConfiguration.fileExtensionToProfileMap");
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend_addEntriesFromDictionary_(v5, v18, (uint64_t)v17);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v20, v24, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)chunkProfileConfigurationDefaultProfilePolicy:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"chunkProfileConfiguration.defaultProfilePolicy", a3);
}

- (id)iCloudAppSiteAssociationData
{
  uint64_t v2 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"iCloudAppSiteAssociationData", 0);
  objc_opt_class();
  id v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    unint64_t v6 = objc_msgSend_allKeys(v3, v4, v5);
    uint64_t v9 = objc_msgSend_firstObject(v6, v7, v8);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend_objectForKeyedSubscript_(v3, v10, (uint64_t)v9),
          char v11 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          (isKindOfClass & 1) == 0))
    {

      uint64_t v9 = v3;
      id v3 = 0;
    }
  }
  return v3;
}

- (unint64_t)maxInlineMergeableDeltaSize:(id)a3
{
  unint64_t v3 = 92160;
  id v4 = objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"maxInlineMergeableDeltaSize", a3);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    unint64_t v3 = objc_msgSend_unsignedIntegerValue(v4, v5, v6);
  }

  return v3;
}

- (id)suggestedMergeableDeltaSize:(id)a3
{
  return (id)objc_msgSend_valueForKeyPath_forContainerID_(self, a2, @"suggestedMergeableDeltaSize", a3);
}

- (CKDServerConfiguration)initWithPropertyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v8 = (CKDServerConfiguration *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v4, v7, @"valuesData");
    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      long long v19 = objc_msgSend_initWithObjects_(v11, v18, v12, v13, v14, v15, v16, v17, 0);
      long long v21 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v20, (uint64_t)v19, v10, 0);
      uint64_t v24 = objc_msgSend_mutableCopy(v21, v22, v23);
      values = v8->_values;
      v8->_values = (NSDictionary *)v24;
    }
    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v4, v9, @"expiry");
    expiry = v8->_expiry;
    v8->_expiry = (NSDate *)v26;
  }
  return v8;
}

- (id)dictionaryPropertyEncoding
{
  v15[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F28DB0];
  values = self->_values;
  if (values)
  {
    uint64_t v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E4F28DB0], a2, (uint64_t)values, 1, 0);
  }
  else
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v3, v9, (uint64_t)v8, 1, 0);
  }
  v14[0] = @"valuesData";
  v14[1] = @"expiry";
  v15[0] = v7;
  expiry = self->_expiry;
  id v11 = expiry;
  if (!expiry)
  {
    id v11 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6);
  }
  v15[1] = v11;
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v15, v14, 2);
  if (!expiry) {

  }
  return v12;
}

- (NSDictionary)values
{
  return self->_values;
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (NSMutableDictionary)allowedAppVersionsCache
{
  return self->_allowedAppVersionsCache;
}

- (void)setAllowedAppVersionsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedAppVersionsCache, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

@end