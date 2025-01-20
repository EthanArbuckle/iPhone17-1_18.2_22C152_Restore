@interface ICSAriadne
+ (BOOL)shouldTraceSingposts;
+ (void)trace:(unint64_t)a3;
@end

@implementation ICSAriadne

+ (BOOL)shouldTraceSingposts
{
  if (qword_100326098 != -1) {
    dispatch_once(&qword_100326098, &stru_1002CF160);
  }
  return byte_100326090;
}

+ (void)trace:(unint64_t)a3
{
  __int16 v3 = a3;
  if ([a1 shouldTraceSingposts])
  {
    _kdebug_trace((4 * (v3 & 0x3FFF)) | 0x2B1A0000u, 0, 0, 0, 0);
  }
}

@end