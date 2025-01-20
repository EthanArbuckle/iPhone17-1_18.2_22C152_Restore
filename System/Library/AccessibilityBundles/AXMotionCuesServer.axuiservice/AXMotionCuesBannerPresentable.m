@interface AXMotionCuesBannerPresentable
- (BNTemplateItemProviding)primaryTemplateItemProvider;
- (BNTemplateItemProviding)secondaryTemplateItemProvider;
- (BNTemplateViewProviding)leadingTemplateViewProvider;
- (BNTemplateViewProviding)trailingTemplateViewProvider;
- (BOOL)providesTemplateContent;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (_TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable)init;
- (id)presentableDescription;
- (int64_t)presentableBehavior;
- (void)handleTemplateContentEvent:(int64_t)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequesterIdentifier:(id)a3;
@end

@implementation AXMotionCuesBannerPresentable

- (NSString)requesterIdentifier
{
  return (NSString *)sub_119C8();
}

- (void)setRequesterIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_119C8();
}

- (void)setRequestIdentifier:(id)a3
{
}

- (BOOL)providesTemplateContent
{
  return 1;
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  NSString v2 = sub_1EC10();

  return v2;
}

- (BNTemplateViewProviding)leadingTemplateViewProvider
{
  NSString v2 = *(void **)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content + 24];
  if (v2)
  {
    id v4 = objc_allocWithZone((Class)BNImageProvider);
    v5 = self;
    id v6 = v2;
    id v7 = [v4 initWithImage:v6];
    id v8 = [objc_allocWithZone((Class)BNTemplateItemProvider) initWithItem:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (BNTemplateViewProviding *)v8;
}

- (BNTemplateViewProviding)trailingTemplateViewProvider
{
  NSString v2 = self;
  id v3 = sub_1AB7C();

  return (BNTemplateViewProviding *)v3;
}

- (BNTemplateItemProviding)primaryTemplateItemProvider
{
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content);
  uint64_t v3 = *(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content];
  id v5 = objc_allocWithZone((Class)BNTemplateItemProvider);
  swift_bridgeObjectRetain_n();
  id v6 = self;
  id v7 = objc_msgSend(v5, "initWithItem:", sub_1F070(), v4, v3);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return (BNTemplateItemProviding *)v7;
}

- (BNTemplateItemProviding)secondaryTemplateItemProvider
{
  uint64_t v4 = *(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content + 8];
  uint64_t v3 = *(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content + 16];
  id v5 = objc_allocWithZone((Class)BNTemplateItemProvider);
  swift_bridgeObjectRetain_n();
  id v6 = self;
  id v7 = objc_msgSend(v5, "initWithItem:", sub_1F070(), v4, v3);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return (BNTemplateItemProviding *)v7;
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = *(void (**)(void))&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content
                                        + 32];
    if (v3)
    {
      uint64_t v4 = self;
      v3();
    }
  }
}

- (_TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable)init
{
  result = (_TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v2 = *(void **)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content + 24];
  uint64_t v3 = *(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content + 32];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10FBC(v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end