@interface AnimatableIntelligentView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC9DropletUI25AnimatableIntelligentView)initWithCoder:(id)a3;
- (_TtC9DropletUI25AnimatableIntelligentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation AnimatableIntelligentView

- (_TtC9DropletUI25AnimatableIntelligentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView) = 0;
  id v4 = a3;

  result = (_TtC9DropletUI25AnimatableIntelligentView *)sub_24D149448();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AnimatableIntelligentView();
  id v2 = v4.receiver;
  [(AnimatableIntelligentView *)&v4 layoutSubviews];
  id v3 = sub_24D1464B0();
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_24D149268();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = qword_26B1891A8;
  v8 = self;
  v9 = v8;
  if (v7 != -1)
  {
    LOBYTE(v8) = swift_once();
    if (v6) {
      goto LABEL_6;
    }
LABEL_11:
    __break(1u);
    return (char)v8;
  }
  if (!v6) {
    goto LABEL_11;
  }
LABEL_6:
  if (sub_24D13A814(v4, v6, (void *)qword_26B189198))
  {

    swift_bridgeObjectRelease();
    unsigned __int8 v10 = 1;
  }
  else
  {
    v11 = (void *)sub_24D149258();
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for AnimatableIntelligentView();
    unsigned __int8 v10 = [(AnimatableIntelligentView *)&v13 _shouldAnimatePropertyWithKey:v11];

    swift_bridgeObjectRelease();
  }
  LOBYTE(v8) = v10;
  return (char)v8;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_24D149268();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  unsigned __int8 v10 = self;
  sub_24D1461D0(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC9DropletUI25AnimatableIntelligentView)initWithFrame:(CGRect)a3
{
  result = (_TtC9DropletUI25AnimatableIntelligentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUI25AnimatableIntelligentView____lazy_storage___lightView));
}

@end