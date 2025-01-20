@interface ActionButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (_TtC21_MarketplaceKit_UIKit12ActionButton)initWithCoder:(id)a3;
- (_TtC21_MarketplaceKit_UIKit12ActionButton)initWithFrame:(CGRect)a3;
- (void)defaultAction:(id)a3 event:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setTintColor:(id)a3;
@end

@implementation ActionButton

- (_TtC21_MarketplaceKit_UIKit12ActionButton)initWithCoder:(id)a3
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v4 = a3;
  v5 = (_TtC21_MarketplaceKit_UIKit12ActionButton *)sub_2465B52E0();
  swift_release();
  return v5;
}

- (BOOL)isHighlighted
{
  return sub_2465ACE04(self, (uint64_t)a2, 62, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return sub_2465ACE04(self, (uint64_t)a2, 72, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (UIColor)backgroundColor
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  id v4 = sub_2465AD130();
  swift_release();

  return (UIColor *)v4;
}

- (void)setBackgroundColor:(id)a3
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  v6 = self;
  sub_2465AD300(a3);
  swift_release();
}

- (UIColor)tintColor
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ActionButton(0);
  id v4 = [(ActionButton *)&v6 tintColor];
  swift_release();

  swift_release();

  return v4;
}

- (void)setTintColor:(id)a3
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v5 = a3;
  objc_super v6 = self;
  sub_2465AD74C(a3);

  swift_release();
}

- (void)defaultAction:(id)a3 event:(id)a4
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_2465B5490(v8);

  swift_release();
}

- (_TtC21_MarketplaceKit_UIKit12ActionButton)initWithFrame:(CGRect)a3
{
  sub_2465BDF98();
  sub_2465BDF88();
  sub_2465BDF78();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  result = (_TtC21_MarketplaceKit_UIKit12ActionButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2465B6A6C((uint64_t)self + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_action, type metadata accessor for ActionButton.Action);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__backgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton__borderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_slotView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC21_MarketplaceKit_UIKit12ActionButton_contentDelegate);
}

@end