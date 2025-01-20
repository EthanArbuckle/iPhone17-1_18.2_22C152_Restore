@interface NSString
+ (id)skan_versionStringFromSKAdNetworkVersion:(int64_t)a3;
- (int64_t)skan_version;
@end

@implementation NSString

- (int64_t)skan_version
{
  v2 = [(NSString *)self stringByReplacingOccurrencesOfString:@"[.,]", @".", 1024, 0, [(NSString *)self length] withString options range];
  if (qword_10031B128[0] != -1) {
    dispatch_once(qword_10031B128, &stru_1002D5708);
  }
  v3 = [(id)qword_10031B120 objectForKeyedSubscript:v2];
  v4 = v3;
  if (v3) {
    id v5 = [v3 integerValue];
  }
  else {
    id v5 = 0;
  }

  return (int64_t)v5;
}

+ (id)skan_versionStringFromSKAdNetworkVersion:(int64_t)a3
{
  CFStringRef v3 = @"2.2";
  CFStringRef v4 = @"3.0";
  CFStringRef v5 = @"4.0";
  if (a3 != 400) {
    CFStringRef v5 = 0;
  }
  if (a3 != 300) {
    CFStringRef v4 = v5;
  }
  if (a3 != 202) {
    CFStringRef v3 = v4;
  }
  CFStringRef v6 = @"2.1";
  if (a3 != 201) {
    CFStringRef v6 = 0;
  }
  if (a3 == 200) {
    CFStringRef v6 = @"2.0";
  }
  if (a3 == 100) {
    CFStringRef v6 = @"1.0";
  }
  if (a3 <= 201) {
    return (id)v6;
  }
  else {
    return (id)v3;
  }
}

@end