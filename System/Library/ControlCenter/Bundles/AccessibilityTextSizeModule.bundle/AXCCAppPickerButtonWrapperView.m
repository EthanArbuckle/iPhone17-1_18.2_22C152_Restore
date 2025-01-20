@interface AXCCAppPickerButtonWrapperView
- (AXCCAppPickerButtonWrapperView)initWithCoder:(id)a3;
- (AXCCAppPickerButtonWrapperView)initWithFrame:(CGRect)a3;
- (void)setHelper:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation AXCCAppPickerButtonWrapperView

- (AXCCAppPickerButtonWrapperView)initWithFrame:(CGRect)a3
{
  return (AXCCAppPickerButtonWrapperView *)sub_2406131D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (AXCCAppPickerButtonWrapperView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___AXCCAppPickerButtonWrapperView_model;
  type metadata accessor for AppPickerButtonModel();
  v6 = (objc_class *)swift_allocObject();
  id v7 = a3;
  sub_240612E74();
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;

  result = (AXCCAppPickerButtonWrapperView *)sub_240615470();
  __break(1u);
  return result;
}

- (void)setOptions:(id)a3
{
  sub_240614124(0, &qword_268C8B5E0);
  uint64_t v4 = sub_240615430();
  uint64_t v5 = self;
  AppPickerButtonWrapperView.setOptions(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)setHelper:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = a3;
  swift_retain();
  sub_240615280();
}

- (void).cxx_destruct
{
}

@end