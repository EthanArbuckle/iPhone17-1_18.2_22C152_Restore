@interface KeyTransparencyFooterTextView
- (_TtC7ChatKit29KeyTransparencyFooterTextView)initWithCoder:(id)a3;
- (_TtC7ChatKit29KeyTransparencyFooterTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)layoutSubviews;
@end

@implementation KeyTransparencyFooterTextView

- (_TtC7ChatKit29KeyTransparencyFooterTextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29KeyTransparencyFooterTextView_status) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit29KeyTransparencyFooterTextView_handles) = (Class)MEMORY[0x1E4FBC860];
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for KeyTransparencyFooterTextView();
  id v4 = a3;
  v5 = [(KeyTransparencyFooterTextView *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_18F557D74();
  }
  return v6;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  type metadata accessor for KeyTransparencyFooterTextView();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  if (objc_msgSend(v10, sel_isKindOfClass_, ObjCClassFromMetadata))
  {
    sub_18F5584A0();
    uint64_t v14 = sub_18F7BA010();

    id v12 = (id)v14;
  }

  return v12;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for KeyTransparencyFooterTextView();
  id v2 = v3.receiver;
  [(KeyTransparencyFooterTextView *)&v3 layoutSubviews];
  objc_msgSend(v2, sel_sizeToFit, v3.receiver, v3.super_class);
}

- (_TtC7ChatKit29KeyTransparencyFooterTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC7ChatKit29KeyTransparencyFooterTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end