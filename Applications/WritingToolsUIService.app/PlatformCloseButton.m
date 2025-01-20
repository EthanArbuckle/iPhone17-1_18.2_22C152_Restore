@interface PlatformCloseButton
- (_TtC21WritingToolsUIService19PlatformCloseButton)initWithCoder:(id)a3;
- (_TtC21WritingToolsUIService19PlatformCloseButton)initWithFrame:(CGRect)a3;
- (void)didTapCloseButton;
- (void)layoutSubviews;
@end

@implementation PlatformCloseButton

- (_TtC21WritingToolsUIService19PlatformCloseButton)initWithFrame:(CGRect)a3
{
  return (_TtC21WritingToolsUIService19PlatformCloseButton *)sub_10014E7E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC21WritingToolsUIService19PlatformCloseButton)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC21WritingToolsUIService19PlatformCloseButton_perform);
  void *v5 = 0;
  v5[1] = 0;
  v6 = self;
  id v7 = a3;
  v8 = (objc_class *)[v6 roundButtonWithStyle:0];
  if (!v8) {
    __break(1u);
  }
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21WritingToolsUIService19PlatformCloseButton_closeButton) = v8;

  result = (_TtC21WritingToolsUIService19PlatformCloseButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didTapCloseButton
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC21WritingToolsUIService19PlatformCloseButton_perform);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_10004EF18((uint64_t)v2);
    v2(v3);
    sub_10014EBA8((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(PlatformCloseButton *)&v8 layoutSubviews];
  [self preferredTapRegionSizeForStyle:0];
  double v4 = v3;
  double v6 = v5;
  id v7 = *(void **)&v2[OBJC_IVAR____TtC21WritingToolsUIService19PlatformCloseButton_closeButton];
  [v2 bounds];
  [v7 setFrame:CGRectMake(CGRectGetMaxX(v9) - v4, 0.0, v4, v6)];
}

- (void).cxx_destruct
{
  sub_10014EBA8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC21WritingToolsUIService19PlatformCloseButton_perform));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC21WritingToolsUIService19PlatformCloseButton_closeButton);
}

@end