@interface VoiceOverSpeechSwiftUI
- (VoiceOverSpeechSwiftUI)initWithCoder:(id)a3;
- (VoiceOverSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation VoiceOverSpeechSwiftUI

- (id)makeController
{
  sub_1690E0();
  sub_151588();
  v2 = (void *)sub_1690F0();

  return v2;
}

- (VoiceOverSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_169880();
    id v6 = a4;
    NSString v7 = sub_169850();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for VoiceOverSpeechSwiftUI();
  v9 = [(VoiceOverSpeechSwiftUI *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (VoiceOverSpeechSwiftUI)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VoiceOverSpeechSwiftUI();
  return [(VoiceOverSpeechSwiftUI *)&v5 initWithCoder:a3];
}

@end