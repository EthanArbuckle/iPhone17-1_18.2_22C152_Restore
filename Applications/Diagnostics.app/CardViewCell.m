@interface CardViewCell
- (_TtC11Diagnostics12CardViewCell)initWithCoder:(id)a3;
- (_TtC11Diagnostics12CardViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC11Diagnostics13CardStackView)stackView;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation CardViewCell

- (_TtC11Diagnostics13CardStackView)stackView
{
  return (_TtC11Diagnostics13CardStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView));
}

- (void)dealloc
{
  v2 = self;
  sub_100085E08();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CardViewCell();
  [(CardViewCell *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackViewContainer));
  sub_10003C44C((uint64_t)self + OBJC_IVAR____TtC11Diagnostics12CardViewCell_controller, (uint64_t *)&unk_1001858E0);
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics12CardViewCell_layoutUpdateHandler));

  swift_release();
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics12CardViewCell_stackViewContainer);
  objc_super v3 = self;
  id v4 = [v2 layer];
  id v5 = [self opaqueSeparatorColor];
  id v6 = [v5 CGColor];

  [v4 setBorderColor:v6];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000867C4();
}

- (_TtC11Diagnostics12CardViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC11Diagnostics12CardViewCell *)sub_1000869EC(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics12CardViewCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics12CardViewCell *)sub_100086B98(a3);
}

@end