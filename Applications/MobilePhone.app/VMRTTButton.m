@interface VMRTTButton
- (VMRTTButton)init;
@end

@implementation VMRTTButton

- (VMRTTButton)init
{
  v3 = +[VMRTTButton buttonWithType:1];
  -[VMRTTButton setBounds:](v3, "setBounds:", 0.0, 0.0, 40.0, 40.0);
  [(VMRTTButton *)v3 setClipsToBounds:1];
  v4 = +[UIColor clearColor];
  [(VMRTTButton *)v3 setBackgroundColor:v4];

  -[VMRTTButton _setTouchInsets:](v3, "_setTouchInsets:", -40.0, -40.0, -40.0, -40.0);
  v5 = +[UIImage voicemailTTYGlyphImage];
  [(VMRTTButton *)v3 setImage:v5 forState:0];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"VOICEMAILUI_MESSAGE_TOOLBAR_BUTTON_TITLE_RTT" value:&stru_100285990 table:@"VoicemailUI"];
  [(VMRTTButton *)v3 setAccessibilityLabel:v7];

  return v3;
}

@end