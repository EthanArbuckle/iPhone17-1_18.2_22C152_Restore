@interface BDSAppGroupContainer
+ (BOOL)isUnitTesting;
+ (NSURL)containerURL;
+ (NSURL)documentsURL;
+ (id)containerIdentifier;
+ (void)setUnitTesting:(BOOL)a3;
@end

@implementation BDSAppGroupContainer

+ (BOOL)isUnitTesting
{
  if (qword_26AD775F0 != -1) {
    dispatch_once(&qword_26AD775F0, &unk_26E971FB0);
  }
  return (byte_268854B90 | byte_26AD760F0) != 0;
}

+ (void)setUnitTesting:(BOOL)a3
{
  byte_268854B90 = a3;
}

+ (id)containerIdentifier
{
  return (id)*MEMORY[0x263F2BA30];
}

+ (NSURL)containerURL
{
  if (objc_msgSend_isUnitTesting(a1, a2, v2, v3, v4, v5, v6, v7))
  {
    if (qword_268854B98 != -1) {
      dispatch_once(&qword_268854B98, &unk_26E971FD0);
    }
    id v15 = (id)qword_268854BA0;
  }
  else
  {
    objc_msgSend_bu_booksGroupContainerURL(NSURL, v8, v9, v10, v11, v12, v13, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (NSURL *)v15;
}

+ (NSURL)documentsURL
{
  uint64_t v2 = objc_opt_class();
  uint64_t v10 = objc_msgSend_containerURL(v2, v3, v4, v5, v6, v7, v8, v9);
  v17 = objc_msgSend_URLByAppendingPathComponent_(v10, v11, @"Documents", v12, v13, v14, v15, v16);

  return (NSURL *)v17;
}

@end