@interface _SWCollaborationDetailViewController
- (NSItemProvider)itemProvider;
- (NSObject)typeErasedViewModel;
- (SWCollaborationDetailViewModel)viewModel;
- (SWHighlight)collaborationHighlight;
- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate;
- (UIViewController)typeErasedHostingController;
- (_SWCollaborationDetailViewController)initWithCoder:(id)a3;
- (_SWCollaborationDetailViewController)initWithHighlight:(id)a3;
- (_SWCollaborationDetailViewController)initWithHighlight:(id)a3 listContent:(id)a4;
- (_SWCollaborationDetailViewController)initWithItemProvider:(id)a3;
- (_SWCollaborationDetailViewController)initWithItemProvider_impl:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setCloudSharingControllerDelegate:(id)a3;
- (void)setCollaborationHighlight:(id)a3;
- (void)setItemProvider:(id)a3;
- (void)setListContentView:(id)a3;
- (void)setManageButtonTitle:(id)a3;
- (void)setShowManageButton:(BOOL)a3;
- (void)setTypeErasedHostingController:(id)a3;
- (void)setTypeErasedViewModel:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation _SWCollaborationDetailViewController

- (_SWCollaborationDetailViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)setItemProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(_SWCollaborationDetailViewController *)self viewModel];
  [v5 setItemProvider:v4];
}

- (NSItemProvider)itemProvider
{
  v2 = [(_SWCollaborationDetailViewController *)self viewModel];
  v3 = [v2 itemProvider];

  return (NSItemProvider *)v3;
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_SWCollaborationDetailViewController *)self viewModel];
  [v5 setCloudSharingControllerDelegate:v4];
}

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  v2 = [(_SWCollaborationDetailViewController *)self viewModel];
  v3 = [v2 cloudSharingControllerDelegate];

  return (UICloudSharingControllerDelegate *)v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  [a3 preferredContentSize];

  -[_SWCollaborationDetailViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setManageButtonTitle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(_SWCollaborationDetailViewController *)self viewModel];
    id v6 = [v5 manageButtonTitle];

    id v4 = v8;
    if (v6 != v8)
    {
      v7 = [(_SWCollaborationDetailViewController *)self viewModel];
      [v7 setManageButtonTitle:v8];

      id v4 = v8;
    }
  }
}

- (void)setShowManageButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_SWCollaborationDetailViewController *)self viewModel];
  [v4 setShowManageButton:v3];
}

- (_SWCollaborationDetailViewController)initWithItemProvider:(id)a3
{
  if (a3)
  {
    self = -[_SWCollaborationDetailViewController initWithItemProvider_impl:](self, "initWithItemProvider_impl:");
    BOOL v3 = self;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (UIViewController)typeErasedHostingController
{
  return self->_typeErasedHostingController;
}

- (void)setTypeErasedHostingController:(id)a3
{
}

- (NSObject)typeErasedViewModel
{
  return self->_typeErasedViewModel;
}

- (void)setTypeErasedViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeErasedViewModel, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);

  objc_storeStrong((id *)&self->_typeErasedHostingController, 0);
}

- (_SWCollaborationDetailViewController)initWithItemProvider_impl:(id)a3
{
  return (_SWCollaborationDetailViewController *)_SWCollaborationDetailViewController.init(itemProvider:)(a3);
}

- (SWCollaborationDetailViewModel)viewModel
{
  v2 = self;
  result = [(_SWCollaborationDetailViewController *)v2 typeErasedViewModel];
  if (result)
  {

    type metadata accessor for CollaborationDetailViewModel(0);
    id v4 = (void *)swift_dynamicCastClassUnconditional();
    return (SWCollaborationDetailViewModel *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setViewModel:(id)a3
{
}

- (void)setListContentView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(_SWCollaborationDetailViewController *)v5 viewModel];
  id v7 = v4;
  sub_18FB55960();
  char v8 = v13;
  uint64_t v9 = v14;
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18FB4EF50();
  uint64_t v10 = sub_18FB554E0();
  v12 = v11;
  uint64_t v13 = v10;
  uint64_t v14 = (uint64_t)v11;
  id v15 = v7;
  char v16 = v8;
  uint64_t v17 = v9;
  sub_18FB51D24((uint64_t)&v13);

  swift_release();
}

- (SWHighlight)collaborationHighlight
{
  v2 = self;
  BOOL v3 = [(_SWCollaborationDetailViewController *)v2 viewModel];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB55490();

  swift_release();
  swift_release();

  return (SWHighlight *)v5;
}

- (void)setCollaborationHighlight:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(_SWCollaborationDetailViewController *)v5 viewModel];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18FB554A0();
}

- (_SWCollaborationDetailViewController)initWithHighlight:(id)a3 listContent:(id)a4
{
  swift_getObjectType();
  id v6 = a3;
  id v7 = (_SWCollaborationDetailViewController *)sub_18FB51460(a3, a4);
  swift_deallocPartialClassInstance();
  return v7;
}

- (_SWCollaborationDetailViewController)initWithHighlight:(id)a3
{
  id v4 = a3;
  return (_SWCollaborationDetailViewController *)_SWCollaborationDetailViewController.init(highlight:)(a3);
}

@end