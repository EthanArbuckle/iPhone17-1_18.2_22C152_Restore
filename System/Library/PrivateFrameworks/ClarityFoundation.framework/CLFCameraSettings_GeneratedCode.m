@interface CLFCameraSettings_GeneratedCode
+ (CLFCameraSettings)sharedInstance;
+ (id)allPreferenceSelectorsAsStrings;
+ (id)domainName;
- (BOOL)allowPhotoCapture;
- (BOOL)allowSelfieCapture;
- (BOOL)allowSelfieVideoCapture;
- (BOOL)allowVideoCapture;
- (CLFCameraSettings_GeneratedCode)init;
- (void)setAllowPhotoCapture:(BOOL)a3;
- (void)setAllowSelfieCapture:(BOOL)a3;
- (void)setAllowSelfieVideoCapture:(BOOL)a3;
- (void)setAllowVideoCapture:(BOOL)a3;
@end

@implementation CLFCameraSettings_GeneratedCode

+ (CLFCameraSettings)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_SharedSettings_3;
  return (CLFCameraSettings *)v2;
}

- (CLFCameraSettings_GeneratedCode)init
{
  v13.receiver = self;
  v13.super_class = (Class)CLFCameraSettings_GeneratedCode;
  v2 = [(CLFBaseSettings *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_allowPhotoCapture);
    [v4 setObject:@"AllowPhotoCapture" forKeyedSubscript:v5];

    v6 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v7 = NSStringFromSelector(sel_allowSelfieCapture);
    [v6 setObject:@"AllowSelfieCapture" forKeyedSubscript:v7];

    v8 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v9 = NSStringFromSelector(sel_allowSelfieVideoCapture);
    [v8 setObject:@"AllowSelfieVideoCapture" forKeyedSubscript:v9];

    v10 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v11 = NSStringFromSelector(sel_allowVideoCapture);
    [v10 setObject:@"AllowVideoCapture" forKeyedSubscript:v11];
  }
  return v3;
}

+ (id)domainName
{
  return @"com.apple.ClarityUI.Camera";
}

+ (id)allPreferenceSelectorsAsStrings
{
  v11[4] = *MEMORY[0x263EF8340];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CLFCameraSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v10, sel_allPreferenceSelectorsAsStrings);
  v3 = NSStringFromSelector(sel_allowPhotoCapture);
  v11[0] = v3;
  v4 = NSStringFromSelector(sel_allowSelfieCapture);
  v11[1] = v4;
  v5 = NSStringFromSelector(sel_allowSelfieVideoCapture);
  v11[2] = v5;
  v6 = NSStringFromSelector(sel_allowVideoCapture);
  v11[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  v8 = [v2 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (BOOL)allowPhotoCapture
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"AllowPhotoCapture" defaultValue:1];
}

- (void)setAllowPhotoCapture:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AllowPhotoCapture"];
}

- (BOOL)allowSelfieCapture
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"AllowSelfieCapture" defaultValue:0];
}

- (void)setAllowSelfieCapture:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AllowSelfieCapture"];
}

- (BOOL)allowSelfieVideoCapture
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"AllowSelfieVideoCapture" defaultValue:0];
}

- (void)setAllowSelfieVideoCapture:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AllowSelfieVideoCapture"];
}

- (BOOL)allowVideoCapture
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"AllowVideoCapture" defaultValue:0];
}

- (void)setAllowVideoCapture:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"AllowVideoCapture"];
}

@end