@interface BCCloudDataNullPrivacyDelegate
+ (id)nullPrivacyDelegate;
- (BOOL)establishedSalt;
- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4;
@end

@implementation BCCloudDataNullPrivacyDelegate

+ (id)nullPrivacyDelegate
{
  if (qword_268854B38 != -1) {
    dispatch_once(&qword_268854B38, &unk_26E971B90);
  }
  v2 = (void *)qword_268854B30;
  return v2;
}

- (BOOL)establishedSalt
{
  return 1;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  v8 = @"-";
  if (a3) {
    v9 = (__CFString *)a3;
  }
  else {
    v9 = @"-";
  }
  if (a4) {
    v8 = (__CFString *)a4;
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@.%@", (uint64_t)a4, v4, v5, v6, v7, v9, v8);
}

@end