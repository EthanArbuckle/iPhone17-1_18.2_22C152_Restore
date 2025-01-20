@interface CLFPhoneFaceTimeSettings_GeneratedCode
+ (CLFPhoneFaceTimeSettings)sharedInstance;
+ (id)allPreferenceSelectorsAsStrings;
+ (id)domainName;
- (BOOL)inCallKeypadEnabled;
- (BOOL)muteEnabled;
- (BOOL)recentsEnabled;
- (BOOL)speakerOptionEnabled;
- (CLFPhoneFaceTimeSettings_GeneratedCode)init;
- (void)setInCallKeypadEnabled:(BOOL)a3;
- (void)setMuteEnabled:(BOOL)a3;
- (void)setRecentsEnabled:(BOOL)a3;
- (void)setSpeakerOptionEnabled:(BOOL)a3;
@end

@implementation CLFPhoneFaceTimeSettings_GeneratedCode

+ (CLFPhoneFaceTimeSettings)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_SharedSettings_0;
  return (CLFPhoneFaceTimeSettings *)v2;
}

- (CLFPhoneFaceTimeSettings_GeneratedCode)init
{
  v13.receiver = self;
  v13.super_class = (Class)CLFPhoneFaceTimeSettings_GeneratedCode;
  v2 = [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_inCallKeypadEnabled);
    [v4 setObject:@"InCallKeypadEnabled" forKeyedSubscript:v5];

    v6 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v7 = NSStringFromSelector(sel_muteEnabled);
    [v6 setObject:@"MuteEnabled" forKeyedSubscript:v7];

    v8 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v9 = NSStringFromSelector(sel_recentsEnabled);
    [v8 setObject:@"RecentsEnabled" forKeyedSubscript:v9];

    v10 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v11 = NSStringFromSelector(sel_speakerOptionEnabled);
    [v10 setObject:@"SpeakerOptionEnabled" forKeyedSubscript:v11];
  }
  return v3;
}

+ (id)domainName
{
  return @"com.apple.ClarityUI.PhoneFaceTime";
}

+ (id)allPreferenceSelectorsAsStrings
{
  v11[4] = *MEMORY[0x263EF8340];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CLFPhoneFaceTimeSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v10, sel_allPreferenceSelectorsAsStrings);
  v3 = NSStringFromSelector(sel_inCallKeypadEnabled);
  v11[0] = v3;
  v4 = NSStringFromSelector(sel_muteEnabled);
  v11[1] = v4;
  v5 = NSStringFromSelector(sel_recentsEnabled);
  v11[2] = v5;
  v6 = NSStringFromSelector(sel_speakerOptionEnabled);
  v11[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
  v8 = [v2 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (BOOL)inCallKeypadEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"InCallKeypadEnabled" defaultValue:0];
}

- (void)setInCallKeypadEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"InCallKeypadEnabled"];
}

- (BOOL)muteEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"MuteEnabled" defaultValue:0];
}

- (void)setMuteEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"MuteEnabled"];
}

- (BOOL)recentsEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"RecentsEnabled" defaultValue:0];
}

- (void)setRecentsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"RecentsEnabled"];
}

- (BOOL)speakerOptionEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"SpeakerOptionEnabled" defaultValue:0];
}

- (void)setSpeakerOptionEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SpeakerOptionEnabled"];
}

@end