@interface QLGradientView
- (BOOL)reversed;
- (_TtC9QuickLook14QLGradientView)init;
- (_TtC9QuickLook14QLGradientView)initWithCoder:(id)a3;
- (_TtC9QuickLook14QLGradientView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setReversed:(BOOL)a3;
@end

@implementation QLGradientView

- (BOOL)reversed
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed;
  swift_beginAccess();
  return *v2;
}

- (void)setReversed:(BOOL)a3
{
  v4 = self;
  sub_2180016E4(a3);
}

- (_TtC9QuickLook14QLGradientView)init
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed) = 0;
  uint64_t v3 = OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer;
  id v4 = objc_allocWithZone(MEMORY[0x263F157D0]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for QLGradientView();
  v6 = -[QLGradientView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_218001AF8();

  return v6;
}

- (_TtC9QuickLook14QLGradientView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed) = 0;
  uint64_t v5 = OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F157D0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9QuickLook14QLGradientView *)sub_218038B14();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for QLGradientView();
  v2 = (char *)v4.receiver;
  [(QLGradientView *)&v4 layoutSubviews];
  uint64_t v3 = *(void **)&v2[OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (_TtC9QuickLook14QLGradientView)initWithFrame:(CGRect)a3
{
  result = (_TtC9QuickLook14QLGradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end