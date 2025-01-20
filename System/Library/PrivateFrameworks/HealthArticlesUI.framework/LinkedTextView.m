@interface LinkedTextView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC16HealthArticlesUI14LinkedTextView)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUI14LinkedTextView)initWithFrame:(CGRect)a3;
@end

@implementation LinkedTextView

- (_TtC16HealthArticlesUI14LinkedTextView)initWithFrame:(CGRect)a3
{
  return (_TtC16HealthArticlesUI14LinkedTextView *)sub_1C28FC04C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16HealthArticlesUI14LinkedTextView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v5[32] = -1;
  v6 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent;
  uint64_t v7 = type metadata accessor for HealthArticleComponent.LinkContent(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_rangeOfLink;
  *(void *)v8 = 0;
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  id v9 = a3;

  result = (_TtC16HealthArticlesUI14LinkedTextView *)sub_1C2921060();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C28FD900(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat), *((unsigned char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkFormat));
  v3 = (char *)self + OBJC_IVAR____TtC16HealthArticlesUI14LinkedTextView_linkContent;
  sub_1C28FD750((uint64_t)v3);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = sub_1C2920470();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2920460();
  id v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_1C28FD3E8();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end