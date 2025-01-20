@interface HealthImageActivityItemProvider
- (_TtC18HealthExperienceUI31HealthImageActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation HealthImageActivityItemProvider

- (id)item
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC18HealthExperienceUI31HealthImageActivityItemProvider_image));
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1AD6100B0();

  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1AD610198();

  return v10;
}

- (_TtC18HealthExperienceUI31HealthImageActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  result = (_TtC18HealthExperienceUI31HealthImageActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31HealthImageActivityItemProvider_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31HealthImageActivityItemProvider_thumbnailImage));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end