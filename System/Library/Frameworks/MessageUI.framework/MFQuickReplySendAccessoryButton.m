@interface MFQuickReplySendAccessoryButton
+ (id)buttonWithType:(int64_t)a3;
@end

@implementation MFQuickReplySendAccessoryButton

+ (id)buttonWithType:(int64_t)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___MFQuickReplySendAccessoryButton;
  v3 = objc_msgSendSuper2(&v11, sel_buttonWithType_, a3);
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForView:", 24);
  v6 = [v4 systemImageNamed:@"arrow.up.circle" withConfiguration:v5];

  [v3 setImage:v6 forState:2];
  v7 = (void *)MEMORY[0x1E4FB1818];
  v8 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_symbolConfigurationForView:", 14);
  v9 = [v7 systemImageNamed:@"arrow.up.circle.fill" withConfiguration:v8];

  [v3 setImage:v9 forState:0];

  return v3;
}

@end