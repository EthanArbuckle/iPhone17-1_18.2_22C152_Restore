@interface MediaControlsTheme
+ (UIImage)airplayVideoImage;
+ (UIImage)appleTVRemote;
+ (UIImage)backwardImage;
+ (UIImage)captionsImage;
+ (UIImage)forwardImage;
+ (UIImage)hamburgerImage;
+ (UIImage)pauseImage;
+ (UIImage)playImage;
+ (UIImage)starFillImage;
+ (UIImage)starImage;
+ (UIImage)stopImage;
+ (UIImage)volumeMaxImage;
+ (UIImage)volumeMinImage;
+ (id)goBackwardImageForTimeInterval:(double)a3;
+ (id)goForwardImageForTimeInterval:(double)a3;
@end

@implementation MediaControlsTheme

+ (UIImage)playImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
}

+ (UIImage)pauseImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"pause.fill"];
}

+ (UIImage)stopImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"stop.fill"];
}

+ (UIImage)forwardImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"forward.fill"];
}

+ (UIImage)backwardImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"backward.fill"];
}

+ (id)goBackwardImageForTimeInterval:(double)a3
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"gobackward.%i", llround(fabs(a3)));
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gobackward.minus"];
  }
  v7 = v6;

  return v7;
}

+ (id)goForwardImageForTimeInterval:(double)a3
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"goforward.%i", llround(fabs(a3)));
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"goforward.plus"];
  }
  v7 = v6;

  return v7;
}

+ (UIImage)captionsImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"captions.bubble"];
}

+ (UIImage)starImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"star"];
}

+ (UIImage)starFillImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"star.fill"];
}

+ (UIImage)hamburgerImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"line.horizontal.3"];
}

+ (UIImage)volumeMinImage
{
  v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:16.0];
  v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"volume.1.fill"];
  v4 = [v3 imageByApplyingSymbolConfiguration:v2];

  return (UIImage *)v4;
}

+ (UIImage)volumeMaxImage
{
  v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:16.0];
  v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"volume.3.fill"];
  v4 = [v3 imageByApplyingSymbolConfiguration:v2];

  return (UIImage *)v4;
}

+ (UIImage)airplayVideoImage
{
  return (UIImage *)[MEMORY[0x1E4FB1818] systemImageNamed:@"airplayvideo"];
}

+ (UIImage)appleTVRemote
{
  return (UIImage *)[MEMORY[0x1E4FB1818] _systemImageNamed:@"appletvremote"];
}

@end