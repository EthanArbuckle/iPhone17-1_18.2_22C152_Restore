@interface DDFaceTimeAudioAction
+ (BOOL)isAvailable;
+ (id)matchingSchemes;
- (DDFaceTimeAudioAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)callProvider;
- (id)dialRequest;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)subtitle;
- (int)interactionType;
@end

@implementation DDFaceTimeAudioAction

+ (id)matchingSchemes
{
  return &unk_1EF510CF8;
}

- (DDFaceTimeAudioAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDFaceTimeAudioAction;
  v9 = [(DDTelephoneNumberAction *)&v14 initWithURL:v8 result:a4 context:a5];
  v10 = v9;
  if (v8 && v9 && !v9->super.super._phoneNumber)
  {
    uint64_t v11 = objc_msgSend(v8, "dd_emailFromMailtoScheme");
    phoneNumber = v10->super.super._phoneNumber;
    v10->super.super._phoneNumber = (NSString *)v11;
  }
  return v10;
}

- (id)localizedName
{
  return DDLocalizedString(@"FaceTime Audio");
}

- (id)subtitle
{
  return 0;
}

- (id)callProvider
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FADAB0]);
  v3 = [v2 faceTimeProvider];

  return v3;
}

- (id)dialRequest
{
  v3 = [(DDFaceTimeAudioAction *)self callProvider];
  v4 = [(DDCallAction *)self dialRequestWithProvider:v3];

  return v4;
}

- (int)interactionType
{
  return 0;
}

+ (BOOL)isAvailable
{
  return [MEMORY[0x1E4FADA88] supportsFaceTimeAudioCalls];
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.facetime";
}

- (id)notificationTitle
{
  v3 = NSString;
  v4 = DDLocalizedString(@"FaceTime Audio %@");
  v5 = -[DDCallAction notificationTitleTargetString](self);
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

@end