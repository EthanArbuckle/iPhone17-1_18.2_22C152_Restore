@interface CKDPCSSQLCacheTableGroup
+ (BOOL)rebootShouldClearData;
+ (id)groupIdentifierForContainerID:(id)a3 accountOverrideInfo:(id)a4;
+ (id)groupNameForContainerID:(id)a3 accountOverrideInfo:(id)a4;
- (id)cacheTable;
- (id)createTables:(id *)a3;
@end

@implementation CKDPCSSQLCacheTableGroup

+ (id)groupIdentifierForContainerID:(id)a3 accountOverrideInfo:(id)a4
{
  id v5 = a4;
  v8 = objc_msgSend_containerIdentifier(a3, v6, v7);
  v13 = objc_msgSend_accountID(v5, v9, v10);
  if (!v13
    || (objc_msgSend_stringWithFormat_(NSString, v11, @"%@.%@", v8, v13),
        (id v14 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v15 = objc_msgSend_altDSID(v5, v11, v12);
    if (!v15
      || (v18 = (void *)v15,
          objc_msgSend_stringWithFormat_(NSString, v16, @"%@.%@", v8, v15),
          id v14 = (id)objc_claimAutoreleasedReturnValue(),
          v18,
          !v14))
    {
      v20 = objc_msgSend_email(v5, v16, v17);
      if (v20)
      {
        objc_msgSend_stringWithFormat_(NSString, v19, @"%@.%@", v8, v20);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = 0;
      }

      if (v5 && !v14)
      {
        objc_msgSend_stringWithFormat_(NSString, v21, @"%@.Anonymous", v8);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!v14) {
        id v14 = v8;
      }
    }
  }

  return v14;
}

+ (id)groupNameForContainerID:(id)a3 accountOverrideInfo:(id)a4
{
  v4 = objc_msgSend_groupIdentifierForContainerID_accountOverrideInfo_(a1, a2, (uint64_t)a3, a4);
  v6 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(MEMORY[0x1E4F1A378], v5, 2, v4, @"PCSCache");

  return v6;
}

+ (BOOL)rebootShouldClearData
{
  return 1;
}

- (id)createTables:(id *)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CKDPCSSQLCacheTable);
  v7[0] = v3;
  id v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v7, 1);

  return v5;
}

- (id)cacheTable
{
  return (id)objc_msgSend_tableWithName_(self, a2, @"PCSCache");
}

@end