@interface AXLiveSpeechVoiceSelectionSwiftUI
- (AXLiveSpeechVoiceSelectionSwiftUI)initWithCoder:(id)a3;
- (AXLiveSpeechVoiceSelectionSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation AXLiveSpeechVoiceSelectionSwiftUI

- (id)makeController
{
  sub_1690E0();
  sub_169110();
  sub_138F08(&qword_265AE0, (void (*)(uint64_t))&type metadata accessor for LiveSpeechVoiceSelectionView);
  v2 = (void *)sub_1690F0();

  return v2;
}

- (AXLiveSpeechVoiceSelectionSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
{
  return (AXLiveSpeechVoiceSelectionSwiftUI *)sub_1390D0(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(id))type metadata accessor for LiveSpeechVoiceSelectionSwiftUI);
}

- (AXLiveSpeechVoiceSelectionSwiftUI)initWithCoder:(id)a3
{
  return (AXLiveSpeechVoiceSelectionSwiftUI *)sub_139204(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for LiveSpeechVoiceSelectionSwiftUI);
}

@end