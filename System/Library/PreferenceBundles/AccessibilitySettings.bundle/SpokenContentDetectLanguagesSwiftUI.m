@interface SpokenContentDetectLanguagesSwiftUI
- (SpokenContentDetectLanguagesSwiftUI)initWithCoder:(id)a3;
- (SpokenContentDetectLanguagesSwiftUI)initWithNibName:(id)a3 bundle:(id)a4;
- (id)makeController;
@end

@implementation SpokenContentDetectLanguagesSwiftUI

- (id)makeController
{
  sub_1690E0();
  sub_1488A0();
  v2 = (void *)sub_1690F0();

  return v2;
}

- (SpokenContentDetectLanguagesSwiftUI)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for SpokenContentDetectLanguagesSwiftUI();
  v9 = [(SpokenContentDetectLanguagesSwiftUI *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (SpokenContentDetectLanguagesSwiftUI)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpokenContentDetectLanguagesSwiftUI();
  return [(SpokenContentDetectLanguagesSwiftUI *)&v5 initWithCoder:a3];
}

@end