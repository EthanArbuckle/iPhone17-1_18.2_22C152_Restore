@interface _SWCollaborationButtonViewImpl
- (BOOL)isContentShared;
- (NSItemProvider)itemProvider;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (SWCollaborationView)outerButton;
- (SWCollaborationViewDelegate)delegate;
- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate;
- (UIImage)headerImage;
- (_SWCollaborationButtonViewImpl)initWithCoder:(id)a3;
- (_SWCollaborationButtonViewImpl)initWithFrame:(CGRect)a3;
- (_SWCollaborationButtonViewImpl)initWithItemProvider:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)activeParticipantCount;
- (void)buttonTapped:(id)a3;
- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setActiveParticipantCount:(unint64_t)a3;
- (void)setCloudSharingControllerDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailViewListContent:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setIsContentShared:(BOOL)a3;
- (void)setItemProvider:(id)a3;
- (void)setManageButtonTitle:(id)a3;
- (void)setOuterButton:(id)a3;
- (void)setShowManageButton:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updatePlaceHolderSymbolScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5;
@end

@implementation _SWCollaborationButtonViewImpl

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_cloudSharingControllerDelegate);

  return (UICloudSharingControllerDelegate *)v2;
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
}

- (unint64_t)activeParticipantCount
{
  id v2 = (unint64_t *)((char *)self + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  return *v2;
}

- (void)setActiveParticipantCount:(unint64_t)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  unint64_t *v5 = a3;
  v6 = self;
  sub_18FB3E990(a3);
}

- (NSString)headerTitle
{
  return (NSString *)sub_18FB3EBFC();
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)headerSubtitle
{
  return (NSString *)sub_18FB3EBFC();
}

- (void)setHeaderSubtitle:(id)a3
{
}

- (UIImage)headerImage
{
  id v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setHeaderImage:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18FB436C0(a3);
}

- (SWCollaborationView)outerButton
{
  return (SWCollaborationView *)sub_18FB3F470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton);
}

- (void)setOuterButton:(id)a3
{
}

- (SWCollaborationViewDelegate)delegate
{
  return (SWCollaborationViewDelegate *)sub_18FB3F470((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  [(_SWCollaborationButtonViewImpl *)&v2 layoutSubviews];
}

- (_SWCollaborationButtonViewImpl)initWithCoder:(id)a3
{
  return 0;
}

- (void)tintColorDidChange
{
  objc_super v2 = self;
  _SWCollaborationButtonViewImpl.tintColorDidChange()();
}

- (void)buttonTapped:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18FB55C90();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_18FB40D20();

  sub_18FB44380((uint64_t)v6);
}

- (void)updatePlaceHolderSymbolScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5
{
  v5 = self;
  sub_18FB55320();
}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
    v10 = sub_18FB44370;
    v14[4] = sub_18FB44370;
    v14[5] = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 1107296256;
    v14[2] = sub_18FB3E65C;
    v14[3] = &block_descriptor_56;
    v11 = _Block_copy(v14);
    v12 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v9 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
    v13 = self;
    v11 = 0;
    v10 = 0;
  }
  objc_msgSend(v9, sel_dismissViewControllerAnimated_completion_, v4, v11);
  _Block_release(v11);
  sub_18FB44328((uint64_t)v10);
}

- (_SWCollaborationButtonViewImpl)initWithFrame:(CGRect)a3
{
  result = (_SWCollaborationButtonViewImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint));
  swift_unknownObjectWeakDestroy();
  sub_18FB3A0B0((uint64_t)self + OBJC_IVAR____SWCollaborationButtonViewImpl_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_numberFormatter);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18FB43D60((SEL *)&selRef_collaborationViewWillPresentPopover_);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18FB43D60((SEL *)&selRef_collaborationViewDidDismissPopover_);
}

- (NSItemProvider)itemProvider
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_itemProvider);

  return (NSItemProvider *)v2;
}

- (void)setItemProvider:(id)a3
{
}

- (BOOL)isContentShared
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared)) {
    return 1;
  }
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_collaborationHighlight);

  if (v4)
  {

    return 1;
  }
  return 0;
}

- (void)setIsContentShared:(BOOL)a3
{
  id v4 = self;
  _SWCollaborationButtonViewImpl.isContentShared.setter(a3);
}

- (_SWCollaborationButtonViewImpl)initWithItemProvider:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = objc_allocWithZone((Class)_SWCollaborationDetailViewController);
  id v6 = a3;
  id v7 = objc_msgSend(v5, sel_initWithItemProvider_impl_, v6);
  id v8 = objc_allocWithZone(ObjectType);
  v9 = sub_18FB3F658(v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_SWCollaborationButtonViewImpl *)v9;
}

- (void)setManageButtonTitle:(id)a3
{
  sub_18FB55A80();
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  id v5 = self;
  id v6 = (id)sub_18FB55A50();
  objc_msgSend(v4, sel_setManageButtonTitle_, v6);

  swift_bridgeObjectRelease();
}

- (void)setShowManageButton:(BOOL)a3
{
}

- (void)setDetailViewListContent:(id)a3
{
}

@end