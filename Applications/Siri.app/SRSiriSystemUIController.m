@interface SRSiriSystemUIController
- (BOOL)presentingSystemUI;
- (BOOL)shouldRedactSnippetForAddViews:(id)a3;
- (SRSiriSystemUIController)init;
- (SRSiriSystemUIController)initWithDelegate:(id)a3 systemUIDevice:(BOOL)a4 systemApertureSupportedDevice:(BOOL)a5;
- (id)transformAddViews:(id)a3 mode:(unint64_t)a4 idiom:(int64_t)a5;
- (void)collapseSystemUI;
- (void)dealloc;
- (void)orientationChangedTo:(int64_t)a3;
- (void)tapToEditPresented;
- (void)tearDown;
- (void)updateSystemUIForAddViews:(id)a3 viewMode:(int64_t)a4 lockState:(unint64_t)a5 isInAmbient:(BOOL)a6;
@end

@implementation SRSiriSystemUIController

- (SRSiriSystemUIController)initWithDelegate:(id)a3 systemUIDevice:(BOOL)a4 systemApertureSupportedDevice:(BOOL)a5
{
  swift_unknownObjectRetain();
  v8 = (SRSiriSystemUIController *)sub_10008C45C((uint64_t)a3, a4, a5);
  swift_unknownObjectRelease();
  return v8;
}

- (void)dealloc
{
  v2 = self;
  sub_10008B2FC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for SiriSystemUIController();
  [(SRSiriSystemUIController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_10007E630((uint64_t)self + OBJC_IVAR___SRSiriSystemUIController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)updateSystemUIForAddViews:(id)a3 viewMode:(int64_t)a4 lockState:(unint64_t)a5 isInAmbient:(BOOL)a6
{
  id v10 = a3;
  v11 = self;
  sub_100089864(v10, a4, a5, a6);
}

- (id)transformAddViews:(id)a3 mode:(unint64_t)a4 idiom:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = sub_10008A1F8(v8, a4, a5);

  return v10;
}

- (BOOL)shouldRedactSnippetForAddViews:(id)a3
{
  return sub_10008D01C();
}

- (void)tearDown
{
  v2 = self;
  sub_10008B2FC();
}

- (void)tapToEditPresented
{
  if (a1[OBJC_IVAR___SRSiriSystemUIController_systemUIDevice] == 1
    && *(void *)&a1[OBJC_IVAR___SRSiriSystemUIController_viewMode] == 7)
  {
    v1 = a1;
    sub_10008B574();
  }
}

- (void)orientationChangedTo:(int64_t)a3
{
  BOOL v4 = sub_10008D00C(a3);
  v5 = self;
  if (v4
    && (*((unsigned char *)&v5->super.isa + OBJC_IVAR___SRSiriSystemUIController_currentActivitySupportsLandscape) & 1) == 0)
  {
    v6 = v5;
    sub_10008B574();
    v5 = v6;
  }
}

- (BOOL)presentingSystemUI
{
  return sub_10008B4F8();
}

- (void)collapseSystemUI
{
  v2 = self;
  sub_10008B574();
}

- (SRSiriSystemUIController)init
{
  result = (SRSiriSystemUIController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end