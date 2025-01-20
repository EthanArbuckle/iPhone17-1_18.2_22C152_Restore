@interface CKSQLiteCacheTableTrackingTable
+ (Class)entryClass;
+ (id)dbProperties;
- (id)updateEntryOldestExpireDate:(id)a3 oldestExpirationDate:(id)a4;
@end

@implementation CKSQLiteCacheTableTrackingTable

+ (id)dbProperties
{
  return &unk_1ED846A20;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (id)updateEntryOldestExpireDate:(id)a3 oldestExpirationDate:(id)a4
{
  id v6 = a3;
  objc_msgSend_setOldestExpireDate_(v6, v7, (uint64_t)a4, v8);
  v10 = objc_msgSend_updateProperties_usingObject_label_(self, v9, (uint64_t)&unk_1ED845F40, (uint64_t)v6, off_1E5463600);

  return v10;
}

@end