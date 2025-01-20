@interface ScrubberButton
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityIdentifier;
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC16MagnifierSupport14ScrubberButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport14ScrubberButton)initWithFrame:(CGRect)a3;
- (void)didTap:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
@end

@implementation ScrubberButton

- (_TtC16MagnifierSupport14ScrubberButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2357B9404();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2357B87E4();
}

- (void)didTap:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton_delegate;
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_2357B8A8C();
}

- (_TtC16MagnifierSupport14ScrubberButton)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport14ScrubberButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton____lazy_storage___internalButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport14ScrubberButton____lazy_storage___scrubber));
  swift_release();
  swift_release();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSString)largeContentTitle
{
  return (NSString *)sub_2357B8FC8((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23579D854);
}

- (UIImage)largeContentImage
{
  id v2 = sub_23579D108();
  return (UIImage *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_2357B8FC8((uint64_t)self, (uint64_t)a2, (void (*)(void))Control.rawValue.getter);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2357B9034(v4);

  return self & 1;
}

@end