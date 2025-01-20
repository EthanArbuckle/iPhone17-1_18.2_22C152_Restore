@interface CNStarkActionsController
+ (CNKeyDescriptor)descriptorForRequiredKeys;
- (BOOL)_isMessagesDefaultAppImpl;
- (BOOL)isMessagesDefaultApp;
- (CNContact)contact;
- (CNContactQuickActionsController)quickActionsController;
- (CNStarkActionView)callActionView;
- (CNStarkActionView)directionsActionView;
- (CNStarkActionView)messageActionView;
- (CNStarkActionsController)initWithContact:(id)a3;
- (NSArray)layoutConstraints;
- (UINavigationControllerDelegate)phoneNavigationControllerDelegate;
- (UIViewController)disambiguationViewController;
- (double)willTransitionToBoundsWidth;
- (id)viewForActionType:(id)a3;
- (void)actionViewTapped:(id)a3;
- (void)addForwardingDelegate;
- (void)contactQuickActionsController:(id)a3 dismissDisambiguationViewController:(id)a4 forActionType:(id)a5;
- (void)contactQuickActionsController:(id)a3 presentDisambiguationViewController:(id)a4 forActionType:(id)a5;
- (void)forwardDelegateForNavigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)removeForwardingDelegate;
- (void)resetLayoutConstraints;
- (void)setDisambiguationViewController:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setPhoneNavigationControllerDelegate:(id)a3;
- (void)setWillTransitionToBoundsWidth:(double)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)updateViews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNStarkActionsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_directionsActionView, 0);
  objc_storeStrong((id *)&self->_callActionView, 0);
  objc_storeStrong((id *)&self->_messageActionView, 0);
  objc_destroyWeak((id *)&self->_phoneNavigationControllerDelegate);
  objc_destroyWeak((id *)&self->_disambiguationViewController);
  objc_storeStrong((id *)&self->_quickActionsController, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)setLayoutConstraints:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setWillTransitionToBoundsWidth:(double)a3
{
  self->_willTransitionToBoundsWidth = a3;
}

- (double)willTransitionToBoundsWidth
{
  return self->_willTransitionToBoundsWidth;
}

- (BOOL)isMessagesDefaultApp
{
  return self->_isMessagesDefaultApp;
}

- (CNStarkActionView)directionsActionView
{
  return self->_directionsActionView;
}

- (CNStarkActionView)callActionView
{
  return self->_callActionView;
}

- (CNStarkActionView)messageActionView
{
  return self->_messageActionView;
}

- (void)setPhoneNavigationControllerDelegate:(id)a3
{
}

- (UINavigationControllerDelegate)phoneNavigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phoneNavigationControllerDelegate);

  return (UINavigationControllerDelegate *)WeakRetained;
}

- (void)setDisambiguationViewController:(id)a3
{
}

- (UIViewController)disambiguationViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disambiguationViewController);

  return (UIViewController *)WeakRetained;
}

- (CNContactQuickActionsController)quickActionsController
{
  return self->_quickActionsController;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)_isMessagesDefaultAppImpl
{
  v2 = +[CNUIContactsEnvironment currentEnvironment];
  v3 = [v2 applicationWorkspace];
  v4 = [v3 defaultApplicationForDefaultAppCategory:0];

  v5 = [v4 bundleIdentifier];
  LOBYTE(v3) = [v5 isEqualToString:*MEMORY[0x1E4F1AD08]];

  return (char)v3;
}

- (void)removeForwardingDelegate
{
  v3 = [(CNStarkActionsController *)self disambiguationViewController];
  id v5 = [v3 navigationController];

  v4 = [(CNStarkActionsController *)self phoneNavigationControllerDelegate];
  [v5 setDelegate:v4];

  [(CNStarkActionsController *)self setPhoneNavigationControllerDelegate:0];
}

- (void)forwardDelegateForNavigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  v9 = [(CNStarkActionsController *)self phoneNavigationControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(CNStarkActionsController *)self phoneNavigationControllerDelegate];
    [v11 navigationController:v12 willShowViewController:v8 animated:v5];
  }
}

- (void)addForwardingDelegate
{
  v3 = [(CNStarkActionsController *)self navigationController];
  v4 = [v3 delegate];
  [(CNStarkActionsController *)self setPhoneNavigationControllerDelegate:v4];

  id v5 = [(CNStarkActionsController *)self navigationController];
  [v5 setDelegate:self];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v11 = a4;
  -[CNStarkActionsController forwardDelegateForNavigationController:willShowViewController:animated:](self, "forwardDelegateForNavigationController:willShowViewController:animated:", a3);
  v7 = [(CNStarkActionsController *)self disambiguationViewController];

  if (v7)
  {
    id v8 = [(CNStarkActionsController *)self disambiguationViewController];

    if (v8 != v11)
    {
      [(CNStarkActionsController *)self removeForwardingDelegate];
      v9 = [(CNStarkActionsController *)self quickActionsController];
      char v10 = [(CNStarkActionsController *)self disambiguationViewController];
      [v9 disambiguationViewControllerDismissedExternally:v10];

      [(CNStarkActionsController *)self setDisambiguationViewController:0];
    }
  }
}

- (void)contactQuickActionsController:(id)a3 dismissDisambiguationViewController:(id)a4 forActionType:(id)a5
{
  id v13 = a4;
  v6 = [v13 presentingViewController];

  if (v6 == self)
  {
    [(CNStarkActionsController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    uint64_t v7 = [v13 navigationController];
    if (v7)
    {
      id v8 = (void *)v7;
      v9 = [v13 navigationController];
      id v10 = [v9 topViewController];

      if (v10 == v13)
      {
        id v11 = [v13 navigationController];
        id v12 = (id)[v11 popViewControllerAnimated:1];
      }
    }
  }
  [(CNStarkActionsController *)self removeForwardingDelegate];
  [(CNStarkActionsController *)self setDisambiguationViewController:0];
}

- (void)contactQuickActionsController:(id)a3 presentDisambiguationViewController:(id)a4 forActionType:(id)a5
{
  id v6 = a4;
  [(CNStarkActionsController *)self addForwardingDelegate];
  [(CNStarkActionsController *)self showViewController:v6 sender:0];
  [(CNStarkActionsController *)self setDisambiguationViewController:v6];
}

- (id)viewForActionType:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNStarkActionsController *)self messageActionView];
  v14[0] = v5;
  id v6 = [(CNStarkActionsController *)self callActionView];
  v14[1] = v6;
  uint64_t v7 = [(CNStarkActionsController *)self directionsActionView];
  v14[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__CNStarkActionsController_viewForActionType___block_invoke;
  v12[3] = &unk_1E549A0D0;
  id v13 = v4;
  id v9 = v4;
  id v10 = objc_msgSend(v8, "_cn_firstObjectPassingTest:", v12);

  return v10;
}

uint64_t __46__CNStarkActionsController_viewForActionType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 actionType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)actionViewTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  id v9 = v4;
  id v6 = [v4 actionType];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [(CNStarkActionsController *)self quickActionsController];
    id v8 = [v9 actionType];
    [v7 executeTapBehaviorForActionType:v8];
  }
}

- (void)updateViews
{
  id v4 = [(CNStarkActionsController *)self contact];
  v3 = [(CNStarkActionsController *)self quickActionsController];
  [v3 setContact:v4];
}

- (void)setupLayoutConstraints
{
  v82[4] = *MEMORY[0x1E4F143B8];
  [(CNStarkActionsController *)self willTransitionToBoundsWidth];
  if ((int)v3)
  {
    [(CNStarkActionsController *)self willTransitionToBoundsWidth];
    double v5 = v4;
  }
  else
  {
    id v6 = [(CNStarkActionsController *)self view];
    [v6 bounds];
    double v5 = v7;
  }
  [(CNStarkActionsController *)self setWillTransitionToBoundsWidth:0.0];
  double v8 = (v5 + -150.0) * 0.25 + 50.0;
  v76 = [(CNStarkActionsController *)self messageActionView];
  v70 = [v76 topAnchor];
  v73 = [(CNStarkActionsController *)self view];
  v67 = [v73 safeAreaLayoutGuide];
  v64 = [v67 topAnchor];
  v61 = [v70 constraintEqualToAnchor:v64];
  v82[0] = v61;
  v58 = [(CNStarkActionsController *)self messageActionView];
  v52 = [v58 bottomAnchor];
  v55 = [(CNStarkActionsController *)self view];
  v49 = [v55 safeAreaLayoutGuide];
  v46 = [v49 bottomAnchor];
  v43 = [v52 constraintEqualToAnchor:v46];
  v82[1] = v43;
  id v9 = [(CNStarkActionsController *)self messageActionView];
  id v10 = [v9 centerXAnchor];
  id v11 = [(CNStarkActionsController *)self view];
  id v12 = [v11 safeAreaLayoutGuide];
  id v13 = [v12 centerXAnchor];
  v14 = [v10 constraintEqualToAnchor:v13 constant:-v8];
  v82[2] = v14;
  v15 = [(CNStarkActionsController *)self messageActionView];
  v16 = [v15 widthAnchor];
  v17 = [v16 constraintEqualToConstant:v8];
  v82[3] = v17;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];

  v74 = [(CNStarkActionsController *)self callActionView];
  v68 = [v74 topAnchor];
  v71 = [(CNStarkActionsController *)self view];
  v65 = [v71 safeAreaLayoutGuide];
  v62 = [v65 topAnchor];
  v59 = [v68 constraintEqualToAnchor:v62];
  v81[0] = v59;
  v56 = [(CNStarkActionsController *)self callActionView];
  v50 = [v56 bottomAnchor];
  v53 = [(CNStarkActionsController *)self view];
  v47 = [v53 safeAreaLayoutGuide];
  v44 = [v47 bottomAnchor];
  v41 = [v50 constraintEqualToAnchor:v44];
  v81[1] = v41;
  v18 = [(CNStarkActionsController *)self callActionView];
  v19 = [v18 centerXAnchor];
  v20 = [(CNStarkActionsController *)self view];
  v21 = [v20 safeAreaLayoutGuide];
  v22 = [v21 centerXAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  v81[2] = v23;
  v24 = [(CNStarkActionsController *)self callActionView];
  v25 = [v24 widthAnchor];
  v26 = [v25 constraintEqualToConstant:v8];
  v81[3] = v26;
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:4];

  v75 = [(CNStarkActionsController *)self directionsActionView];
  v69 = [v75 topAnchor];
  v72 = [(CNStarkActionsController *)self view];
  v66 = [v72 safeAreaLayoutGuide];
  v63 = [v66 topAnchor];
  v60 = [v69 constraintEqualToAnchor:v63];
  v80[0] = v60;
  v57 = [(CNStarkActionsController *)self directionsActionView];
  v51 = [v57 bottomAnchor];
  v54 = [(CNStarkActionsController *)self view];
  v48 = [v54 safeAreaLayoutGuide];
  v45 = [v48 bottomAnchor];
  v42 = [v51 constraintEqualToAnchor:v45];
  v80[1] = v42;
  v27 = [(CNStarkActionsController *)self directionsActionView];
  v28 = [v27 centerXAnchor];
  v29 = [(CNStarkActionsController *)self view];
  v30 = [v29 safeAreaLayoutGuide];
  v31 = [v30 centerXAnchor];
  v32 = [v28 constraintEqualToAnchor:v31 constant:v8];
  v80[2] = v32;
  v33 = [(CNStarkActionsController *)self directionsActionView];
  v34 = [v33 widthAnchor];
  v35 = [v34 constraintEqualToConstant:v8];
  v80[3] = v35;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:4];

  v79[0] = v78;
  v79[1] = v77;
  v79[2] = v40;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
  v37 = objc_msgSend(v36, "_cn_flatten");
  [(CNStarkActionsController *)self setLayoutConstraints:v37];

  v38 = [(CNStarkActionsController *)self view];
  v39 = [(CNStarkActionsController *)self layoutConstraints];
  [v38 addConstraints:v39];
}

- (void)updateViewConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkActionsController;
  [(CNStarkActionsController *)&v5 updateViewConstraints];
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  double v4 = [(CNStarkActionsController *)self layoutConstraints];
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3) {
    [(CNStarkActionsController *)self setupLayoutConstraints];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNStarkActionsController;
  -[CNStarkActionsController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v6 = [(CNStarkActionsController *)self view];
  [v6 bounds];
  int v8 = (int)v7;

  if ((int)width != v8)
  {
    [(CNStarkActionsController *)self setWillTransitionToBoundsWidth:width];
    [(CNStarkActionsController *)self resetLayoutConstraints];
  }
}

- (void)resetLayoutConstraints
{
  uint64_t v3 = [(CNStarkActionsController *)self view];
  double v4 = [(CNStarkActionsController *)self layoutConstraints];
  [v3 removeConstraints:v4];

  [(CNStarkActionsController *)self setLayoutConstraints:0];
  id v5 = [(CNStarkActionsController *)self view];
  [v5 setNeedsUpdateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNStarkActionsController;
  [(CNStarkActionsController *)&v4 traitCollectionDidChange:a3];
  [(CNStarkActionsController *)self resetLayoutConstraints];
}

- (void)setupViews
{
  uint64_t v3 = [(CNStarkActionsController *)self messageActionView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v4 = [(CNStarkActionsController *)self callActionView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(CNStarkActionsController *)self directionsActionView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(CNStarkActionsController *)self view];
  double v7 = [(CNStarkActionsController *)self messageActionView];
  [v6 addSubview:v7];

  int v8 = [(CNStarkActionsController *)self view];
  objc_super v9 = [(CNStarkActionsController *)self callActionView];
  [v8 addSubview:v9];

  id v11 = [(CNStarkActionsController *)self view];
  id v10 = [(CNStarkActionsController *)self directionsActionView];
  [v11 addSubview:v10];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkActionsController;
  [(CNStarkActionsController *)&v5 viewDidLoad];
  [(CNStarkActionsController *)self setupViews];
  [(CNStarkActionsController *)self updateViews];
  if (![(CNStarkActionsController *)self isMessagesDefaultApp])
  {
    uint64_t v3 = [(CNContactQuickActionsController *)self->_quickActionsController defaultTitleForActionType:*MEMORY[0x1E4F1AD48]];
    objc_super v4 = [(CNStarkActionsController *)self messageActionView];
    [v4 setTitle:v3];
  }
}

- (CNStarkActionsController)initWithContact:(id)a3
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNStarkActionsController;
  id v6 = [(CNStarkActionsController *)&v24 initWithNibName:0 bundle:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v7->_isMessagesDefaultApp = [(CNStarkActionsController *)v7 _isMessagesDefaultAppImpl];
    if ([(CNStarkActionsController *)v7 isMessagesDefaultApp])
    {
      uint64_t v8 = *MEMORY[0x1E4F1AD48];
      uint64_t v9 = *MEMORY[0x1E4F1AD20];
      v26[0] = *MEMORY[0x1E4F1AD48];
      v26[1] = v9;
      uint64_t v10 = *MEMORY[0x1E4F1AD28];
      v26[2] = *MEMORY[0x1E4F1AD28];
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F1AD20];
      uint64_t v10 = *MEMORY[0x1E4F1AD28];
      v25[0] = *MEMORY[0x1E4F1AD20];
      v25[1] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      uint64_t v8 = *MEMORY[0x1E4F1AD48];
    }
    id v12 = +[CNContactQuickActionsDisambiguationMenuPresentation modalPresentation];
    id v13 = [[CNContactQuickActionsController alloc] initWithActionTypes:v11 contactQuickActionViewContainer:v7 disambiguationMenuPresentation:v12];
    quickActionsController = v7->_quickActionsController;
    v7->_quickActionsController = v13;

    v15 = +[CNUINavigationListStyleProvider carPlayStyle];
    [(CNContactQuickActionsController *)v7->_quickActionsController setNavigationListStyle:v15];

    [(CNContactQuickActionsController *)v7->_quickActionsController setIsCarPlay:1];
    [(CNContactQuickActionsController *)v7->_quickActionsController setDelegate:v7];
    uint64_t v16 = +[CNStarkActionView quickActionButtonWithDelegate:v7];
    messageActionView = v7->_messageActionView;
    v7->_messageActionView = (CNStarkActionView *)v16;

    [(CNStarkActionView *)v7->_messageActionView setActionType:v8];
    uint64_t v18 = +[CNStarkActionView quickActionButtonWithDelegate:v7];
    callActionView = v7->_callActionView;
    v7->_callActionView = (CNStarkActionView *)v18;

    [(CNStarkActionView *)v7->_callActionView setActionType:v9];
    uint64_t v20 = +[CNStarkActionView quickActionButtonWithDelegate:v7];
    directionsActionView = v7->_directionsActionView;
    v7->_directionsActionView = (CNStarkActionView *)v20;

    [(CNStarkActionView *)v7->_directionsActionView setActionType:v10];
    v22 = v7;
  }
  return v7;
}

+ (CNKeyDescriptor)descriptorForRequiredKeys
{
  return +[CNContactQuickActionsController descriptorForRequiredKeys];
}

@end