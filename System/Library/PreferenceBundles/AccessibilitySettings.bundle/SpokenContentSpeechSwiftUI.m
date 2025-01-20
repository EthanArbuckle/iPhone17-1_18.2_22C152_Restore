@interface SpokenContentSpeechSwiftUI
- (SpokenContentSpeechSwiftUI)initWithCoder:(id)a3;
- (SpokenContentSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation SpokenContentSpeechSwiftUI

- (id)makeController
{
  sub_1690E0();
  sub_136208();
  v2 = (void *)sub_1690F0();

  return v2;
}

- (SpokenContentSpeechSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for SpokenContentSpeechSwiftUI();
  v9 = [(SpokenContentSpeechSwiftUI *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (SpokenContentSpeechSwiftUI)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpokenContentSpeechSwiftUI();
  return [(SpokenContentSpeechSwiftUI *)&v5 initWithCoder:a3];
}

@end