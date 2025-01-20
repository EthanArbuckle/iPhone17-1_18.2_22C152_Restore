@interface VoiceOverSpeechSwiftUI
- (VoiceOverSpeechSwiftUI)initWithCoder:(id)a3;
- (VoiceOverSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation VoiceOverSpeechSwiftUI

- (id)makeController
{
  sub_246A6AF20();
  sub_246A6A158();
  v2 = (void *)sub_246A6AF30();

  return v2;
}

- (VoiceOverSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_246A6B0A0();
    id v6 = a4;
    v7 = (void *)sub_246A6B090();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    v7 = 0;
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