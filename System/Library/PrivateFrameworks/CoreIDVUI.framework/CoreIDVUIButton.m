@interface CoreIDVUIButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (_TtC9CoreIDVUI15CoreIDVUIButton)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI15CoreIDVUIButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CoreIDVUIButton

- (BOOL)isHighlighted
{
  return sub_21F4EEDE4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return sub_21F4EEDE4(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (_TtC9CoreIDVUI15CoreIDVUIButton)initWithFrame:(CGRect)a3
{
  return (_TtC9CoreIDVUI15CoreIDVUIButton *)sub_21F4EEE98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9CoreIDVUI15CoreIDVUIButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_originalButtonText);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton____lazy_storage___activityIndicator) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style) = 4;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme) = 0;
  id v5 = a3;

  result = (_TtC9CoreIDVUI15CoreIDVUIButton *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoreIDVUIButton();
  id v2 = v3.receiver;
  [(CoreIDVUIButton *)&v3 layoutSubviews];
  sub_21F4EF308();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton____lazy_storage___activityIndicator);
}

@end