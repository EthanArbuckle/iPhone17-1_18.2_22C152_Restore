@interface PromotionTileView
- (_TtC18HealthExperienceUI17PromotionTileView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI17PromotionTileView)initWithFrame:(CGRect)a3;
- (void)didChangePreferredContentSize;
- (void)didMoveToSuperview;
- (void)didTapAction:(id)a3;
- (void)didTapLinkAction:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation PromotionTileView

- (_TtC18HealthExperienceUI17PromotionTileView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI17PromotionTileView *)sub_1AD6782B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI17PromotionTileView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI17PromotionTileViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1AD678620();
}

- (void)didChangePreferredContentSize
{
  v4 = self;
  id v2 = sub_1AD677AA8();
  objc_msgSend(v2, sel_invalidateIntrinsicContentSize);

  id v3 = sub_1AD677ECC();
  objc_msgSend(v3, sel_invalidateIntrinsicContentSize);

  sub_1AD678710();
}

- (void)didTapAction:(id)a3
{
}

- (void)didTapLinkAction:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_pluginActionHandler));
  sub_1AD67D9B8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_context, (uint64_t (*)(void))sub_1AD2DF36C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___heroView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___body));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___link));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView____lazy_storage___primaryButton));
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1AD2147D4(0, (unint64_t *)&qword_1E9A2DE88);
  sub_1AD6336A8();
  sub_1AD73F720();
  v6 = self;
  id v7 = a4;
  v8 = (void *)sub_1AD73F710();
  v12.receiver = v6;
  v12.super_class = (Class)type metadata accessor for PromotionTileView();
  [(PromotionTileView *)&v12 touchesCancelled:v8 withEvent:v7];

  v9 = (void **)((char *)&v6->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryLabel);
  swift_beginAccess();
  v10 = *v9;
  if (v10)
  {
    v11 = (Class *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUI17PromotionTileView_accessoryColor);
    swift_beginAccess();
    objc_msgSend(v10, sel_setTextColor_, *v11);
  }

  swift_bridgeObjectRelease();
}

@end