@interface CLFMessagesSettings_GeneratedCode
+ (CLFMessagesSettings)sharedInstance;
+ (id)allPreferenceSelectorsAsStrings;
+ (id)domainName;
- (BOOL)conversationDetailsEnabled;
- (BOOL)emojiKeyboardEnabled;
- (BOOL)softwareKeyboardEnabled;
- (BOOL)tapToSpeakEnabled;
- (BOOL)videoRecordingEnabled;
- (CLFMessagesSettings_GeneratedCode)init;
- (void)setConversationDetailsEnabled:(BOOL)a3;
- (void)setEmojiKeyboardEnabled:(BOOL)a3;
- (void)setSoftwareKeyboardEnabled:(BOOL)a3;
- (void)setTapToSpeakEnabled:(BOOL)a3;
- (void)setVideoRecordingEnabled:(BOOL)a3;
@end

@implementation CLFMessagesSettings_GeneratedCode

+ (CLFMessagesSettings)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_SharedSettings_2;
  return (CLFMessagesSettings *)v2;
}

- (CLFMessagesSettings_GeneratedCode)init
{
  v15.receiver = self;
  v15.super_class = (Class)CLFMessagesSettings_GeneratedCode;
  v2 = [(CLFBaseCommunicationLimitSettings_GeneratedCode *)&v15 init];
  v3 = v2;
  if (v2)
  {
    v4 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v5 = NSStringFromSelector(sel_conversationDetailsEnabled);
    [v4 setObject:@"ConversationDetailsEnabled" forKeyedSubscript:v5];

    v6 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v7 = NSStringFromSelector(sel_emojiKeyboardEnabled);
    [v6 setObject:@"EmojiKeyboardEnabled" forKeyedSubscript:v7];

    v8 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v9 = NSStringFromSelector(sel_softwareKeyboardEnabled);
    [v8 setObject:@"SoftwareKeyboardEnabled" forKeyedSubscript:v9];

    v10 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v11 = NSStringFromSelector(sel_tapToSpeakEnabled);
    [v10 setObject:@"TapToSpeakEnabled" forKeyedSubscript:v11];

    v12 = -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v13 = NSStringFromSelector(sel_videoRecordingEnabled);
    [v12 setObject:@"VideoRecordingEnabled" forKeyedSubscript:v13];
  }
  return v3;
}

+ (id)domainName
{
  return @"com.apple.ClarityUI.Messages";
}

+ (id)allPreferenceSelectorsAsStrings
{
  v12[5] = *MEMORY[0x263EF8340];
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___CLFMessagesSettings_GeneratedCode;
  v2 = objc_msgSendSuper2(&v11, sel_allPreferenceSelectorsAsStrings);
  v3 = NSStringFromSelector(sel_conversationDetailsEnabled);
  v12[0] = v3;
  v4 = NSStringFromSelector(sel_emojiKeyboardEnabled);
  v12[1] = v4;
  v5 = NSStringFromSelector(sel_softwareKeyboardEnabled);
  v12[2] = v5;
  v6 = NSStringFromSelector(sel_tapToSpeakEnabled);
  v12[3] = v6;
  v7 = NSStringFromSelector(sel_videoRecordingEnabled);
  v12[4] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  v9 = [v2 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (BOOL)conversationDetailsEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"ConversationDetailsEnabled" defaultValue:0];
}

- (void)setConversationDetailsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"ConversationDetailsEnabled"];
}

- (BOOL)emojiKeyboardEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"EmojiKeyboardEnabled" defaultValue:1];
}

- (void)setEmojiKeyboardEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"EmojiKeyboardEnabled"];
}

- (BOOL)softwareKeyboardEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"SoftwareKeyboardEnabled" defaultValue:1];
}

- (void)setSoftwareKeyboardEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"SoftwareKeyboardEnabled"];
}

- (BOOL)tapToSpeakEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"TapToSpeakEnabled" defaultValue:0];
}

- (void)setTapToSpeakEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"TapToSpeakEnabled"];
}

- (BOOL)videoRecordingEnabled
{
  return [(AXBaseSettings *)self BOOLValueForPreferenceKey:@"VideoRecordingEnabled" defaultValue:1];
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(AXBaseSettings *)self setValue:v4 forPreferenceKey:@"VideoRecordingEnabled"];
}

@end