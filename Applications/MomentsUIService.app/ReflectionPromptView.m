@interface ReflectionPromptView
- (_TtC16MomentsUIService20ReflectionPromptView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService20ReflectionPromptView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updatePromptIndex:(id)a3;
@end

@implementation ReflectionPromptView

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ReflectionPromptView();
  [(ReflectionPromptView *)&v2 layoutSubviews];
}

- (_TtC16MomentsUIService20ReflectionPromptView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ReflectionPromptView.init(coder:)();
}

- (void)updatePromptIndex:(id)a3
{
  v4 = *(uint64_t (**)(uint64_t))((char *)&self->super.super.super.isa
                                         + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_updateReflectionIndex);
  id v5 = a3;
  v8 = self;
  uint64_t v6 = swift_retain();
  uint64_t v7 = v4(v6);
  swift_release();
  *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_promptIndex) = (Class)v7;
  (*(void (**)(void))((swift_isaMask & (uint64_t)v8->super.super.super.isa) + 0x1A0))();
}

- (_TtC16MomentsUIService20ReflectionPromptView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService20ReflectionPromptView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_tertiaryVibrancyEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_blurredEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_accentColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_blurBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_reflectionPrompt));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService20ReflectionPromptView_categoryLabel);
}

@end