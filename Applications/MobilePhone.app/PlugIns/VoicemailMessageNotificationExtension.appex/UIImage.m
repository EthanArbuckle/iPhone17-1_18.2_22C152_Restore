@interface UIImage
+ (id)voicemailPauseButtonImage;
+ (id)voicemailPlayButtonImage;
@end

@implementation UIImage

+ (id)voicemailPauseButtonImage
{
  if (qword_1000695D8 != -1) {
    dispatch_once(&qword_1000695D8, &stru_10005D5B0);
  }
  v2 = (void *)qword_1000695D0;

  return v2;
}

+ (id)voicemailPlayButtonImage
{
  if (qword_1000695E8 != -1) {
    dispatch_once(&qword_1000695E8, &stru_10005D5D0);
  }
  v2 = (void *)qword_1000695E0;

  return v2;
}

@end