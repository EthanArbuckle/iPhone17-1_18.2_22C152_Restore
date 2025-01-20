@interface _CPUITextField
- (BOOL)_becomeFirstResponderWhenPossible;
- (_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField)initWithCoder:(id)a3;
- (_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField)initWithFrame:(CGRect)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)tintColorDidChange;
@end

@implementation _CPUITextField

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _CPUITextField();
  id v2 = v6.receiver;
  [(_CPUITextField *)&v6 tintColorDidChange];
  id v3 = [v2 inputAccessoryView];
  if (v3)
  {
    v4 = v3;
    id v5 = [v2 tintColor];
    [v4 setTintColor:v5];

    id v2 = v4;
  }
}

- (BOOL)_becomeFirstResponderWhenPossible
{
  return 0;
}

- (void)buildMenuWithBuilder:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_100006CD0(a3);
  swift_unknownObjectRelease();
}

- (_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _CPUITextField();
  return -[_CPUITextField initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ColorPickerUIServiceP33_B2FE14F7DB151A9888581FFCE687814914_CPUITextField)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _CPUITextField();
  return [(_CPUITextField *)&v5 initWithCoder:a3];
}

@end