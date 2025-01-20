@interface SWCollaborationDetailViewModel
- (BOOL)showManageButton;
- (NSArray)customCollaborators;
- (NSItemProvider)itemProvider;
- (NSString)customContentTitle;
- (NSString)manageButtonTitle;
- (SWCollaborationDetailViewModel)init;
- (SWCollaborationDetailViewModel)initWithHighlight:(id)a3;
- (SWCollaborationDetailViewModel)initWithItemProvider:(id)a3;
- (SWHighlight)highlight;
- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate;
- (void)highlightCenterHighlightsDidChange:(id)a3;
- (void)setCloudSharingControllerDelegate:(id)a3;
- (void)setCustomCollaborators:(id)a3;
- (void)setCustomContentTitle:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setManageButtonTitle:(id)a3;
- (void)setShowManageButton:(BOOL)a3;
@end

@implementation SWCollaborationDetailViewModel

- (NSItemProvider)itemProvider
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___SWCollaborationDetailViewModel_itemProvider);
  swift_beginAccess();
  return (NSItemProvider *)*v2;
}

- (void)setItemProvider:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_18FB39240(v5);
}

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  v2 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBDAA0](v2);

  return (UICloudSharingControllerDelegate *)v3;
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
}

- (SWHighlight)highlight
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18FB55490();

  swift_release();
  swift_release();

  return (SWHighlight *)v5;
}

- (void)setHighlight:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  sub_18FB554A0();
}

- (NSString)customContentTitle
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18FB55490();

  swift_release();
  swift_release();
  if (v6)
  {
    v4 = (void *)sub_18FB55A50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setCustomContentTitle:(id)a3
{
  if (a3) {
    sub_18FB55A80();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18FB554A0();
}

- (NSArray)customCollaborators
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18FB55490();

  swift_release();
  swift_release();
  if (v6)
  {
    sub_18FB2EF00(0, &qword_1E9265E88);
    v4 = (void *)sub_18FB55AF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setCustomCollaborators:(id)a3
{
  if (a3)
  {
    sub_18FB2EF00(0, &qword_1E9265E88);
    sub_18FB55B00();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18FB554A0();
}

- (NSString)manageButtonTitle
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18FB55490();

  swift_release();
  swift_release();
  v4 = (void *)sub_18FB55A50();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (void)setManageButtonTitle:(id)a3
{
  sub_18FB55A80();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18FB554A0();
}

- (BOOL)showManageButton
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18FB55490();

  swift_release();
  swift_release();
  return v5;
}

- (void)setShowManageButton:(BOOL)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_18FB554A0();
}

- (SWCollaborationDetailViewModel)initWithHighlight:(id)a3
{
  id v4 = a3;
  BOOL v5 = (SWCollaborationDetailViewModel *)sub_18FB37CA0(a3);

  return v5;
}

- (SWCollaborationDetailViewModel)initWithItemProvider:(id)a3
{
  return (SWCollaborationDetailViewModel *)CollaborationDetailViewModel.init(itemProvider:)(a3);
}

- (SWCollaborationDetailViewModel)init
{
  result = (SWCollaborationDetailViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___SWCollaborationDetailViewModel____lazy_storage___highlightCenter));
  sub_18FB3A0B0((uint64_t)self + OBJC_IVAR___SWCollaborationDetailViewModel_cloudSharingControllerDelegate);
  v3 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__collaborationInfo;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D60);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  BOOL v5 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__highlight;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D58);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__customContentTitle;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D50);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__headerFallback;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D48);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__customCollaborators;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D40);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__manageButtonTitle;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D18);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR___SWCollaborationDetailViewModel__showManageButton;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D30);
  v17 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);

  v17(v15, v16);
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9265D68);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = a3;
  uint64_t v10 = self;
  sub_18FB55490();
  swift_release();
  swift_release();
  sub_18FB33798(v8);
  sub_18FB3A3FC((uint64_t)v8, &qword_1E9265D68);
}

@end