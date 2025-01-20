@interface CKSyncEngineFetchChangesZoneConfiguration
- (BOOL)CKDescriptionShouldPrintPointer;
- (BOOL)shouldFetchAssetContents;
- (CKSyncEngineFetchChangesZoneConfiguration)init;
- (NSString)description;
- (id)CKDescriptionClassName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (unint64_t)resultsLimit;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
- (void)setShouldFetchAssetContents:(BOOL)a3;
@end

@implementation CKSyncEngineFetchChangesZoneConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(CKSyncEngineFetchChangesZoneConfiguration);
  objc_msgSend_setShouldFetchAssetContents_(v4, v5, self->_shouldFetchAssetContents, v6);
  objc_msgSend_setResultsLimit_(v4, v7, self->_resultsLimit, v8);
  return v4;
}

- (void)setShouldFetchAssetContents:(BOOL)a3
{
  self->_shouldFetchAssetContents = a3;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return @"ZoneConfiguration";
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v20 = a3;
  if ((objc_msgSend_shouldFetchAssetContents(self, v4, v5, v6) & 1) == 0) {
    objc_msgSend_addProperty_value_shouldRedact_(v20, v7, @"fetchAssetContents", MEMORY[0x1E4F1CC28], 0);
  }
  uint64_t v10 = objc_msgSend_resultsLimit(self, v7, v8, v9);
  id v13 = v20;
  if (v10)
  {
    v14 = NSNumber;
    uint64_t v15 = objc_msgSend_resultsLimit(self, (const char *)v20, v11, v12);
    v18 = objc_msgSend_numberWithUnsignedInteger_(v14, v16, v15, v17);
    objc_msgSend_addProperty_value_shouldRedact_(v20, v19, @"resultsLimit", (uint64_t)v18, 0);

    id v13 = v20;
  }

  MEMORY[0x1F41817F8](v10, v13);
}

- (BOOL)shouldFetchAssetContents
{
  return self->_shouldFetchAssetContents;
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (CKSyncEngineFetchChangesZoneConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKSyncEngineFetchChangesZoneConfiguration;
  result = [(CKSyncEngineFetchChangesZoneConfiguration *)&v3 init];
  if (result)
  {
    result->_shouldFetchAssetContents = 1;
    result->_resultsLimit = 0;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchChangesZoneConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchChangesZoneConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

@end