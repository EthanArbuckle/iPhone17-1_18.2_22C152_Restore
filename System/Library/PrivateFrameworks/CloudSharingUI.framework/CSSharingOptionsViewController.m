@interface CSSharingOptionsViewController
- (CSSharingOptionsViewController)initWithCollaborationSharingOptions:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 userDidChangeOption:(id)a5 contentSizeDidChange:(id)a6;
- (CSSharingOptionsViewController)initWithCollaborationSharingOptionsView:(id)a3 userDidChangeOption:(id)a4;
- (CSSharingOptionsViewController)initWithSharingOptionsView:(id)a3 userDidChangeOption:(id)a4;
- (NSString)hostBundleID;
- (void)_commonInitWithControllerAndUpdates:(void *)a1;
- (void)setHostBundleID:(id)a3;
@end

@implementation CSSharingOptionsViewController

- (CSSharingOptionsViewController)initWithCollaborationSharingOptions:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 userDidChangeOption:(id)a5 contentSizeDidChange:(id)a6
{
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CSSharingOptionsViewController;
  v16 = [(CSSharingOptionsViewController *)&v19 initWithNibName:0 bundle:0];
  if (v16)
  {
    v17 = +[SharingOptionsViewFactory createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:](_TtC14CloudSharingUI25SharingOptionsViewFactory, "createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:", v13, v14, v15, top, leading, bottom, trailing);
    -[CSSharingOptionsViewController _commonInitWithControllerAndUpdates:](v16, v17);
  }
  return v16;
}

- (void)_commonInitWithControllerAndUpdates:(void *)a1
{
  v33[4] = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v3 = a2;
    uint64_t v4 = [v3 sourceAppBundleIDDidChangeBlock];
    v5 = (void *)a1[122];
    a1[122] = v4;

    v6 = [v3 viewController];

    [v6 beginAppearanceTransition:1 animated:0];
    v7 = [v6 view];
    [v7 setBackgroundColor:0];

    v8 = [v6 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    [a1 addChildViewController:v6];
    v9 = [a1 view];
    v10 = [v6 view];
    [v9 addSubview:v10];

    v23 = (void *)MEMORY[0x263F08938];
    v32 = [a1 view];
    v30 = [v32 widthAnchor];
    v31 = [v6 view];
    v29 = [v31 widthAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v27 = [a1 view];
    v25 = [v27 heightAnchor];
    v26 = [v6 view];
    v24 = [v26 heightAnchor];
    v22 = [v25 constraintEqualToAnchor:v24];
    v33[1] = v22;
    v21 = [a1 view];
    objc_super v19 = [v21 leftAnchor];
    v20 = [v6 view];
    v11 = [v20 leftAnchor];
    v12 = [v19 constraintEqualToAnchor:v11];
    v33[2] = v12;
    id v13 = [a1 view];
    id v14 = [v13 topAnchor];
    id v15 = [v6 view];
    v16 = [v15 topAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    v33[3] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    [v23 activateConstraints:v18];

    [v6 didMoveToParentViewController:a1];
    [v6 endAppearanceTransition];
  }
}

- (CSSharingOptionsViewController)initWithCollaborationSharingOptionsView:(id)a3 userDidChangeOption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSharingOptionsViewController;
  v8 = [(CSSharingOptionsViewController *)&v11 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = +[SharingOptionsViewFactory createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:](_TtC14CloudSharingUI25SharingOptionsViewFactory, "createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:", v6, v7, &__block_literal_global, 0.0, 0.0, 0.0, 0.0);
    -[CSSharingOptionsViewController _commonInitWithControllerAndUpdates:](v8, v9);
  }
  return v8;
}

- (CSSharingOptionsViewController)initWithSharingOptionsView:(id)a3 userDidChangeOption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSharingOptionsViewController;
  v8 = [(CSSharingOptionsViewController *)&v11 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = +[SharingOptionsViewFactory createSharingOptionsView:v6 userDidChangeOption:v7];
    -[CSSharingOptionsViewController _commonInitWithControllerAndUpdates:](v8, v9);
  }
  return v8;
}

- (void)setHostBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_hostBundleID, a3);
  id v5 = a3;
  (*((void (**)(void))self->_sourceAppBundleIDDidChangeBlock + 2))();
}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostBundleID, 0);

  objc_storeStrong(&self->_sourceAppBundleIDDidChangeBlock, 0);
}

@end