@interface AXMotionCuesSystemAperturePresentable
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureElement)systemApertureElementViewController;
- (_TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable)init;
- (id)presentableDescription;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequesterIdentifier:(id)a3;
@end

@implementation AXMotionCuesSystemAperturePresentable

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

- (SBUISystemApertureElement)systemApertureElementViewController
{
  return (SBUISystemApertureElement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_bannerViewController));
}

- (id)presentableDescription
{
  NSString v2 = sub_1EC10();

  return v2;
}

- (_TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable)init
{
  result = (_TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_content + 24];
  uint64_t v4 = *(void *)&self->content[OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_content
                               + 32];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10FBC(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_bannerViewController);
}

@end