@interface LSBundleRecord
- (BOOL)sk_allowExternalLink;
- (BOOL)sk_allowExternalPurchase;
- (BOOL)sk_getTaskAllowed;
- (BOOL)sk_isAlmond;
- (NSURL)lib_receiptURL;
- (NSURL)sk_advertisingAttributionReportURL;
- (id)_lib_receiptName;
@end

@implementation LSBundleRecord

- (BOOL)sk_isAlmond
{
  return 0;
}

- (NSURL)lib_receiptURL
{
  v3 = [(LSBundleRecord *)self dataContainerURL];
  v4 = [v3 URLByAppendingPathComponent:@"StoreKit" isDirectory:1];

  if (v4)
  {
    v5 = [(LSBundleRecord *)self _lib_receiptName];
    v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];
  }
  else
  {
    if (qword_1003A06A0 != -1) {
      dispatch_once(&qword_1003A06A0, &stru_10035A6A8);
    }
    v7 = (void *)qword_1003A0658;
    if (os_log_type_enabled((os_log_t)qword_1003A0658, OS_LOG_TYPE_ERROR)) {
      sub_1002CA85C(v7, self);
    }
    v6 = 0;
  }

  return (NSURL *)v6;
}

- (id)_lib_receiptName
{
  if ([(LSBundleRecord *)self isProfileValidated]) {
    v2 = @"sandboxReceipt";
  }
  else {
    v2 = @"receipt";
  }

  return v2;
}

- (NSURL)sk_advertisingAttributionReportURL
{
  uint64_t v3 = sub_10001E6FC((uint64_t *)&unk_10039B760);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_100116C28();

  uint64_t v7 = type metadata accessor for URL();
  v9 = 0;
  if (sub_10001E448((uint64_t)v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (BOOL)sk_allowExternalLink
{
  v2 = self;
  char v3 = sub_100117448(4);

  return v3 & 1;
}

- (BOOL)sk_allowExternalPurchase
{
  v2 = self;
  char v3 = sub_100117448(5);

  return v3 & 1;
}

- (BOOL)sk_getTaskAllowed
{
  v2 = self;
  char v3 = sub_10011A430();

  return v3 & 1;
}

@end