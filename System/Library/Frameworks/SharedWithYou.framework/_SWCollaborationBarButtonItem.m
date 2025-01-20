@interface _SWCollaborationBarButtonItem
- (BOOL)isContentShared;
- (NSItemProvider)itemProvider;
- (SWHighlight)highlight;
- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate;
- (_SWCollaborationBarButtonItem)initWithCoder:(id)a3;
- (_SWCollaborationBarButtonItem)initWithCollaborationButtonView:(id)a3;
- (_SWCollaborationBarButtonItem)initWithHighlight:(id)a3;
- (_SWCollaborationBarButtonItem)initWithHighlight:(id)a3 detailViewListContent:(id)a4;
- (_SWCollaborationBarButtonItem)initWithItemProvider:(id)a3;
- (_SWCollaborationButtonView)collaborationButtonView;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)activeParticipantCount;
- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4;
- (void)setActiveParticipantCount:(unint64_t)a3;
- (void)setCloudSharingControllerDelegate:(id)a3;
- (void)setCollaborationButtonView:(id)a3;
- (void)setDetailViewListContent:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setIsContentShared:(BOOL)a3;
- (void)setItemProvider:(id)a3;
- (void)setManageButtonTitle:(id)a3;
- (void)setShowManageButton:(BOOL)a3;
@end

@implementation _SWCollaborationBarButtonItem

- (NSItemProvider)itemProvider
{
  v2 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v3 = [v2 buttonView];
  v4 = [v3 itemProvider];

  return (NSItemProvider *)v4;
}

- (void)setItemProvider:(id)a3
{
  id v4 = a3;
  id v6 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v5 = [v6 buttonView];
  [v5 setItemProvider:v4];
}

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  v2 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v3 = [v2 buttonView];
  id v4 = [v3 cloudSharingControllerDelegate];

  return (UICloudSharingControllerDelegate *)v4;
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
  id v4 = a3;
  id v6 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v5 = [v6 buttonView];
  [v5 setCloudSharingControllerDelegate:v4];
}

- (unint64_t)activeParticipantCount
{
  v2 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v3 = [v2 buttonView];
  unint64_t v4 = [v3 activeParticipantCount];

  return v4;
}

- (void)setActiveParticipantCount:(unint64_t)a3
{
  id v5 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  unint64_t v4 = [v5 buttonView];
  [v4 setActiveParticipantCount:a3];
}

- (BOOL)isContentShared
{
  v2 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v3 = [v2 buttonView];
  char v4 = [v3 isContentShared];

  return v4;
}

- (void)setIsContentShared:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  char v4 = [v5 buttonView];
  [v4 setIsContentShared:v3];
}

- (_SWCollaborationBarButtonItem)initWithCollaborationButtonView:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SWCollaborationBarButtonItem;
  id v5 = [(UIBarItem *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    [(_SWCollaborationBarButtonItem *)v5 setCollaborationButtonView:v4];
    [(_SWCollaborationBarButtonItem *)v6 setCustomView:v4];
    objc_initWeak(&location, v6);
    v7 = (void *)MEMORY[0x1E4FB16B8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke;
    v10[3] = &unk_1E5665A10;
    id v11 = v4;
    objc_copyWeak(&v12, &location);
    v8 = [v7 elementWithUncachedProvider:v10];
    [(_SWCollaborationBarButtonItem *)v6 _dci_setMenuRepresentation:v8];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (_SWCollaborationBarButtonItem)initWithItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SWCollaborationView *)[_SWCollaborationButtonView alloc] initWithItemProvider:v4];

  id v6 = [(_SWCollaborationBarButtonItem *)self initWithCollaborationButtonView:v5];
  return v6;
}

- (_SWCollaborationBarButtonItem)initWithCoder:(id)a3
{
  return 0;
}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v8 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  v7 = [v8 buttonView];
  [v7 dismissPopoverAnimated:v4 completion:v6];
}

- (void)setDetailViewListContent:(id)a3
{
  id v4 = a3;
  id v6 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  id v5 = [v6 buttonView];
  [v5 setDetailViewListContent:v4];
}

- (void)setManageButtonTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  id v5 = [v6 buttonView];
  [v5 setManageButtonTitle:v4];
}

- (void)setShowManageButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_SWCollaborationBarButtonItem *)self collaborationButtonView];
  id v4 = [v5 buttonView];
  [v4 setShowManageButton:v3];
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_SWCollaborationButtonView)collaborationButtonView
{
  return self->_collaborationButtonView;
}

- (void)setCollaborationButtonView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (SWHighlight)highlight
{
  v2 = self;
  BOOL v3 = [(_SWCollaborationBarButtonItem *)v2 collaborationButtonView];
  id v4 = sub_18FB41DA0(v3, sel_buttonView);

  id v5 = objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);

  return (SWHighlight *)v5;
}

- (void)setHighlight:(id)a3
{
  id v7 = a3;
  id v4 = self;
  id v5 = [(_SWCollaborationBarButtonItem *)v4 collaborationButtonView];
  id v6 = sub_18FB41DA0(v5, sel_buttonView);

  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setCollaborationHighlight_, v7);
}

- (_SWCollaborationBarButtonItem)initWithHighlight:(id)a3
{
  id v5 = objc_allocWithZone((Class)_SWCollaborationDetailViewController);
  id v6 = a3;
  id v7 = objc_msgSend(v5, sel_initWithHighlight_, v6);
  id v8 = objc_allocWithZone((Class)type metadata accessor for _SWCollaborationButtonViewImpl());
  v9 = sub_18FB3F658(v7);
  id v10 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v9);
  id v11 = [(_SWCollaborationBarButtonItem *)self initWithCollaborationButtonView:v10];

  return v11;
}

- (_SWCollaborationBarButtonItem)initWithHighlight:(id)a3 detailViewListContent:(id)a4
{
  id v7 = objc_allocWithZone((Class)_SWCollaborationDetailViewController);
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(v7, sel_initWithHighlight_listContent_, v8, v9);
  id v11 = objc_allocWithZone((Class)type metadata accessor for _SWCollaborationButtonViewImpl());
  id v12 = sub_18FB3F658(v10);
  id v13 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v12);
  objc_super v14 = [(_SWCollaborationBarButtonItem *)self initWithCollaborationButtonView:v13];

  return v14;
}

@end