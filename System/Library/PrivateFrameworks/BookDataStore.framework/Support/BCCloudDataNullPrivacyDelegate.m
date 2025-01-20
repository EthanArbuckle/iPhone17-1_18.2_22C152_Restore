@interface BCCloudDataNullPrivacyDelegate
+ (id)nullPrivacyDelegate;
- (BOOL)establishedSalt;
- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4;
@end

@implementation BCCloudDataNullPrivacyDelegate

+ (id)nullPrivacyDelegate
{
  if (qword_100297570 != -1) {
    dispatch_once(&qword_100297570, &stru_100260FD0);
  }
  v2 = (void *)qword_100297568;
  return v2;
}

- (BOOL)establishedSalt
{
  return 1;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  CFStringRef v4 = @"-";
  if (a3) {
    CFStringRef v5 = (const __CFString *)a3;
  }
  else {
    CFStringRef v5 = @"-";
  }
  if (a4) {
    CFStringRef v4 = (const __CFString *)a4;
  }
  return +[NSString stringWithFormat:@"%@.%@", v5, v4];
}

@end