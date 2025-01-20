@interface CCUISControlsGalleryResult
- (BOOL)promptsForUserConfiguration;
- (CCUISConfiguredControl)control;
- (CCUISControlsGalleryResult)init;
- (CCUISControlsGalleryResult)initWithControl:(id)a3 promptsForUserConfiguration:(BOOL)a4;
- (NSString)description;
@end

@implementation CCUISControlsGalleryResult

- (CCUISConfiguredControl)control
{
  return (CCUISConfiguredControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___CCUISControlsGalleryResult_control));
}

- (BOOL)promptsForUserConfiguration
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryResult_promptsForUserConfiguration);
}

- (CCUISControlsGalleryResult)initWithControl:(id)a3 promptsForUserConfiguration:(BOOL)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryResult_control) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CCUISControlsGalleryResult_promptsForUserConfiguration) = a4;
  v6.receiver = self;
  v6.super_class = (Class)CCUISControlsGalleryResult;
  id v4 = a3;
  return [(CCUISControlsGalleryResult *)&v6 init];
}

- (NSString)description
{
  v2 = self;
  CCUISControlsGalleryResult.description.getter();

  v3 = (void *)sub_24A7DCA10();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CCUISControlsGalleryResult)init
{
  result = (CCUISControlsGalleryResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end