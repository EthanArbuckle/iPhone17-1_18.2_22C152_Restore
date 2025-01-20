@interface TapbackPickerImageShapeView.TapbackPickerImageView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithCoder:(id)a3;
- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithFrame:(CGRect)a3;
- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithImage:(id)a3;
- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation TapbackPickerImageShapeView.TapbackPickerImageView

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithCoder:(id)a3
{
  result = (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithImage:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapbackPickerImageShapeView.TapbackPickerImageView();
  id v4 = a3;
  v5 = [(TapbackPickerImageShapeView.TapbackPickerImageView *)&v11 initWithImage:v4];
  sub_18F7B97E0();
  id v6 = objc_allocWithZone(MEMORY[0x1E4F39BC0]);
  v7 = v5;
  v8 = (void *)sub_18F7B97A0();
  id v9 = objc_msgSend(v6, sel_initWithType_, v8, v11.receiver, v11.super_class);

  sub_18F61D0AC(v9);
  swift_bridgeObjectRelease();

  return v7;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    id v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    id v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F71F14C(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView)initWithFrame:(CGRect)a3
{
  result = (_TtCC7ChatKit27TapbackPickerImageShapeView22TapbackPickerImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end