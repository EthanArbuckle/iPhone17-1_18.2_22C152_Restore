@interface DDFaceTimeAction
+ (BOOL)isAvailable;
+ (id)matchingSchemes;
- (id)dialRequest;
- (id)iconName;
- (id)localizedName;
- (id)notificationTitle;
@end

@implementation DDFaceTimeAction

+ (id)matchingSchemes
{
  return &unk_1EF510D10;
}

- (id)localizedName
{
  return DDLocalizedString(@"FaceTime");
}

- (id)iconName
{
  return @"video";
}

- (id)notificationTitle
{
  v3 = NSString;
  v4 = DDLocalizedString(@"FaceTime %@");
  v5 = -[DDCallAction notificationTitleTargetString](self);
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

+ (BOOL)isAvailable
{
  return [MEMORY[0x1E4FADA88] supportsFaceTimeVideoCalls];
}

- (id)dialRequest
{
  v4.receiver = self;
  v4.super_class = (Class)DDFaceTimeAction;
  v2 = [(DDFaceTimeAudioAction *)&v4 dialRequest];
  [v2 setVideo:1];
  return v2;
}

@end