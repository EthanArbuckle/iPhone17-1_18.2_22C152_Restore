@interface NSString
+ (id)deviceSpecificString:(id)a3;
@end

@implementation NSString

+ (id)deviceSpecificString:(id)a3
{
  id v3 = a3;
  int v4 = MGGetSInt32Answer();
  int v5 = MGGetSInt32Answer();
  CFStringRef v6 = @"-568h";
  switch(v4)
  {
    case 4:
      if (MGGetBoolAnswer()) {
        CFStringRef v6 = @"-air";
      }
      else {
        CFStringRef v6 = @"-ipad";
      }
      break;
    case 5:
      break;
    case 6:
      CFStringRef v6 = @"-163r";
      break;
    case 7:
      CFStringRef v6 = @"-mini";
      break;
    case 8:
      CFStringRef v6 = @"-375w-667h";
      break;
    case 9:
    case 10:
      CFStringRef v6 = @"-414w-736h";
      break;
    case 11:
      CFStringRef v6 = @"-pro";
      break;
    case 15:
      CFStringRef v6 = @"-D22";
      break;
    default:
      CFStringRef v7 = &stru_419A0;
      if (v5 == 1) {
        CFStringRef v7 = @"-iphone";
      }
      if (v5 == 3) {
        CFStringRef v6 = @"-ipad";
      }
      else {
        CFStringRef v6 = v7;
      }
      break;
  }
  v8 = [v3 stringByAppendingString:v6];

  return v8;
}

@end