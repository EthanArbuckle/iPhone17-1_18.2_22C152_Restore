@interface AnimatableLightView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4;
- (void)layoutSubviews;
@end

@implementation AnimatableLightView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AnimatableLightView();
  id v2 = v5.receiver;
  [(AnimatableLightView *)&v5 layoutSubviews];
  id v3 = sub_24D145AAC();
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);

  id v4 = sub_24D145B70();
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
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
  uint64_t v7 = qword_26B189130;
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
  if (sub_24D13A814(v4, v6, (void *)qword_26B189120))
  {

    swift_bridgeObjectRelease();
    unsigned __int8 v10 = 1;
  }
  else
  {
    v11 = (void *)sub_24D149258();
    v13.receiver = v9;
    v13.super_class = (Class)type metadata accessor for AnimatableLightView();
    unsigned __int8 v10 = [(AnimatableLightView *)&v13 _shouldAnimatePropertyWithKey:v11];

    swift_bridgeObjectRelease();
  }
  LOBYTE(v8) = v10;
  return (char)v8;
}

- (_TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4
{
  result = (_TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___noiseView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9DropletUIP33_1A307C73748F469B76839B7113A1F63419AnimatableLightView____lazy_storage___whiteView);
}

@end