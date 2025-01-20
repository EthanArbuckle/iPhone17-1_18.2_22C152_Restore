@interface CMHeadphoneActivityUtils
+ (int)motionActivityForHeadphoneActivity:(int64_t)a3;
@end

@implementation CMHeadphoneActivityUtils

+ (int)motionActivityForHeadphoneActivity:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return dword_19060C848[a3];
  }
}

@end