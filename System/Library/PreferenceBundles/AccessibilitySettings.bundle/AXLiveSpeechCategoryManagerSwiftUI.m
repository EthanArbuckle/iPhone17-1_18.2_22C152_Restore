@interface AXLiveSpeechCategoryManagerSwiftUI
- (AXLiveSpeechCategoryManagerSwiftUI)initWithCoder:(id)a3;
- (AXLiveSpeechCategoryManagerSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation AXLiveSpeechCategoryManagerSwiftUI

- (id)makeController
{
  sub_1690E0();
  sub_169130();
  sub_138F08(&qword_265AD8, (void (*)(uint64_t))&type metadata accessor for LiveSpeechCategoryManagerView);
  v2 = (void *)sub_1690F0();

  return v2;
}

- (AXLiveSpeechCategoryManagerSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
{
  return (AXLiveSpeechCategoryManagerSwiftUI *)sub_1390D0(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(id))type metadata accessor for LiveSpeechCategoryManagerSwiftUI);
}

- (AXLiveSpeechCategoryManagerSwiftUI)initWithCoder:(id)a3
{
  return (AXLiveSpeechCategoryManagerSwiftUI *)sub_139204(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for LiveSpeechCategoryManagerSwiftUI);
}

@end