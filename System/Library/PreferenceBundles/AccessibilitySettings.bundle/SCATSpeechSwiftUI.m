@interface SCATSpeechSwiftUI
- (SCATSpeechSwiftUI)initWithCoder:(id)a3;
- (SCATSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation SCATSpeechSwiftUI

- (id)makeController
{
  sub_1690E0();
  type metadata accessor for SCATSpeechView(0);
  sub_13A47C(&qword_265B50, (void (*)(uint64_t))type metadata accessor for SCATSpeechView);
  v2 = (void *)sub_1690F0();

  return v2;
}

- (SCATSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_169880();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SCATSpeechSwiftUI *)SCATSpeechSwiftUI.init(nibName:bundle:)(v5, v7, a4);
}

- (SCATSpeechSwiftUI)initWithCoder:(id)a3
{
  return (SCATSpeechSwiftUI *)SCATSpeechSwiftUI.init(coder:)(a3);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SCATSpeechSwiftUI__settings;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_265B58);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end