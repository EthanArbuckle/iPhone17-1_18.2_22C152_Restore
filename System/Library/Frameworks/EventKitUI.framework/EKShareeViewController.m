@interface EKShareeViewController
- (BOOL)_shouldDisplayResendInvitationButton;
- (BOOL)_shouldDisplayStopSharingButton;
- (BOOL)allowEditing;
- (BOOL)allowLocalDelete;
- (BOOL)allowResendInvitations;
- (BOOL)allowStopSharing;
- (CGSize)preferredContentSize;
- (EKSharee)sharee;
- (EKShareeViewController)initWithSharee:(id)a3;
- (EKShareeViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int)_subitemAtRow:(int64_t)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_allowEditingChanged:(id)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_reloadTitle;
- (void)loadView;
- (void)localDeleteTapped;
- (void)removeClicked:(id)a3;
- (void)setAllowEditing:(BOOL)a3;
- (void)setAllowLocalDelete:(BOOL)a3;
- (void)setAllowResendInvitations:(BOOL)a3;
- (void)setAllowStopSharing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setSharee:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKShareeViewController

- (EKShareeViewController)initWithSharee:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKShareeViewController;
  v5 = [(EKShareeViewController *)&v10 initWithStyle:2];
  v6 = v5;
  if (v5)
  {
    [(EKShareeViewController *)v5 setSharee:v4];
    v7 = [(EKShareeViewController *)v6 sharee];
    -[EKShareeViewController setAllowEditing:](v6, "setAllowEditing:", [v7 shareeAccessLevel] == 2);

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel__contentSizeCategoryChanged_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v6;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
}

- (BOOL)_shouldDisplayResendInvitationButton
{
  return [(EKSharee *)self->_sharee shareeStatus] != 1 && self->_allowResendInvitations;
}

- (BOOL)_shouldDisplayStopSharingButton
{
  return self->_allowStopSharing;
}

- (int)_subitemAtRow:(int64_t)a3
{
  LODWORD(v5) = ![(EKShareeViewController *)self _shouldDisplayResendInvitationButton];
  if (a3 > 1) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 0;
  }
  int64_t v6 = v5
     + a3
     + ((v5 + a3 > 2) & ~[(EKShareeViewController *)self _shouldDisplayStopSharingButton]);
  return v6 + ((v6 > 3) & ~[(EKShareeViewController *)self allowLocalDelete]);
}

- (void)_reloadTitle
{
  id v4 = [(EKShareeViewController *)self sharee];
  v3 = DisplayStringForIdentity((uint64_t)v4, 1, 0);
  [(EKShareeViewController *)self setTitle:v3];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)EKShareeViewController;
  [(EKShareeViewController *)&v3 loadView];
  [(EKShareeViewController *)self _reloadTitle];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EKShareeViewController;
  [(EKShareeViewController *)&v9 viewWillAppear:a3];
  [(EKShareeViewController *)self _reloadTitle];
  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v4 lineHeight];
  double v6 = v5;
  v7 = [(EKShareeViewController *)self tableView];
  [v7 setEstimatedRowHeight:v6];

  v8 = [(EKShareeViewController *)self tableView];
  [v8 reloadData];
}

- (void)setAllowEditing:(BOOL)a3
{
  self->_allowEditing = a3;
}

- (void)_allowEditingChanged:(id)a3
{
  id v9 = a3;
  if (v9) {
    -[EKShareeViewController setAllowEditing:](self, "setAllowEditing:", [v9 isOn]);
  }
  if ([(EKShareeViewController *)self allowEditing]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  double v5 = [(EKShareeViewController *)self sharee];
  [v5 setShareeAccessLevel:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 shareeViewControllerDidChangeAccessLevel:self];
  }
}

- (CGSize)preferredContentSize
{
  v2 = [(EKShareeViewController *)self tableView];
  objc_msgSend(v2, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1100.0);
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(EKShareeViewController *)self _shouldDisplayResendInvitationButton]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  uint64_t v5 = v4 + [(EKShareeViewController *)self _shouldDisplayStopSharingButton];
  return v5 + [(EKShareeViewController *)self allowLocalDelete];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  switch(-[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", objc_msgSend(a4, "section", a3)))
  {
    case 0:
      uint64_t v5 = [[AddressCardTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"addressCard"];
      [(AddressCardTableViewCell *)v5 setAccessoryType:1];
      id v6 = [(EKShareeViewController *)self sharee];
      double v7 = DisplayStringForIdentity((uint64_t)v6, 0, 0);
      uint64_t v8 = DisplayAddressForIdentity(v6);
      uint64_t v9 = [v7 length];
      objc_super v10 = [(AddressCardTableViewCell *)v5 textLabel];
      v11 = v10;
      if (v9)
      {
        [v10 setText:v7];

        v11 = [(AddressCardTableViewCell *)v5 detailTextLabel];
      }
      v67 = (void *)v8;
      [v11 setText:v8];

      v12 = [(AddressCardTableViewCell *)v5 textLabel];
      [v12 setHidden:1];

      v13 = [(AddressCardTableViewCell *)v5 detailTextLabel];
      [v13 setHidden:1];

      v14 = objc_opt_new();
      v15 = [(AddressCardTableViewCell *)v5 textLabel];
      v16 = [v15 font];
      [v14 setFont:v16];

      v17 = [(AddressCardTableViewCell *)v5 textLabel];
      v18 = [v17 text];
      [v14 setText:v18];

      v19 = [MEMORY[0x1E4FB1618] labelColor];
      [v14 setTextColor:v19];

      [v14 setNumberOfLines:1];
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = [[EKUILabeledAvatarView alloc] initWithIdentity:v6 placement:0 options:0];
      [(EKUILabeledAvatarView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      v21 = [(AddressCardTableViewCell *)v5 contentView];
      [v21 addSubview:v14];

      v22 = [(AddressCardTableViewCell *)v5 contentView];
      [v22 addSubview:v20];

      unint64_t v23 = 0x1E4F28000uLL;
      if ([v7 length])
      {
        v24 = objc_opt_new();
        v25 = [(AddressCardTableViewCell *)v5 detailTextLabel];
        v26 = [v25 font];
        [v24 setFont:v26];

        v27 = [(AddressCardTableViewCell *)v5 detailTextLabel];
        v28 = [v27 text];
        [v24 setText:v28];

        v29 = [MEMORY[0x1E4FB1618] labelColor];
        [v24 setTextColor:v29];

        [v24 setNumberOfLines:1];
        [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
        v30 = [(AddressCardTableViewCell *)v5 contentView];
        [v30 addSubview:v24];

        v31 = _NSDictionaryOfVariableBindings(&cfstr_TitleAvatarAdd.isa, v14, v20, v24, 0);
        v32 = (void *)MEMORY[0x1E4F28DC8];
        [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-[avatar(==37)]-(12)-[address]-|" options:0 metrics:0 views:v31];
        v66 = v20;
        v34 = v33 = v7;
        [v32 activateConstraints:v34];

        v35 = [v24 firstBaselineAnchor];
        v36 = [(AddressCardTableViewCell *)v5 detailTextLabel];
        v37 = [v36 firstBaselineAnchor];
        v38 = [v35 constraintEqualToAnchor:v37 constant:0.0];
        [v38 setActive:1];

        double v7 = v33;
        v20 = v66;

        unint64_t v23 = 0x1E4F28000;
      }
      else
      {
        v31 = _NSDictionaryOfVariableBindings(&cfstr_TitleAvatar.isa, v14, v20, 0);
      }
      v53 = *(void **)(v23 + 3528);
      v54 = [v53 constraintsWithVisualFormat:@"H:|-[avatar(==37)]-(12)-[title]-|" options:0 metrics:0 views:v31];
      [v53 activateConstraints:v54];

      v55 = *(void **)(v23 + 3528);
      v56 = [v55 constraintsWithVisualFormat:@"V:|-(>=0)-[avatar]-(>=0)-|" options:0 metrics:0 views:v31];
      [v55 activateConstraints:v56];

      v57 = [v14 firstBaselineAnchor];
      v58 = [(AddressCardTableViewCell *)v5 textLabel];
      v59 = [v58 firstBaselineAnchor];
      v60 = [v57 constraintEqualToAnchor:v59 constant:0.0];
      [v60 setActive:1];

      v61 = [(EKUILabeledAvatarView *)v20 centerYAnchor];
      v62 = [(AddressCardTableViewCell *)v5 contentView];
      v63 = [v62 centerYAnchor];
      v64 = [v61 constraintEqualToAnchor:v63];
      [v64 setActive:1];

      goto LABEL_15;
    case 1:
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
      [v6 setOn:self->_allowEditing];
      [v6 addTarget:self action:sel__allowEditingChanged_ forControlEvents:4096];
      uint64_t v5 = (AddressCardTableViewCell *)objc_alloc_init(MEMORY[0x1E4FB1D08]);
      [(AddressCardTableViewCell *)v5 setAccessoryView:v6];
      v39 = EventKitUIBundle();
      v40 = [v39 localizedStringForKey:@"Allow Editing" value:&stru_1F0CC2140 table:0];
      v41 = [(AddressCardTableViewCell *)v5 textLabel];
      [v41 setText:v40];

      [(AddressCardTableViewCell *)v5 setSelectionStyle:0];
      goto LABEL_15;
    case 2:
      uint64_t v5 = [[EKUICenteredTextTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"resendInvitation"];
      [(AddressCardTableViewCell *)v5 setAccessoryType:0];
      v42 = EventKitUIBundle();
      id v6 = v42;
      v43 = @"Resend Sharing Invitation";
      goto LABEL_10;
    case 3:
      uint64_t v5 = [[EKUICenteredTextTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
      v44 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
      [(AddressCardTableViewCell *)v5 setBackgroundColor:v44];

      v45 = [MEMORY[0x1E4FB1618] _systemDestructiveTintColor];
      v46 = [(AddressCardTableViewCell *)v5 textLabel];
      [v46 setTextColor:v45];

      v42 = EventKitUIBundle();
      id v6 = v42;
      v43 = @"Stop Sharing";
LABEL_10:
      v47 = &stru_1F0CC2140;
      goto LABEL_12;
    case 4:
      uint64_t v5 = [[EKUICenteredTextTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
      v48 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
      [(AddressCardTableViewCell *)v5 setBackgroundColor:v48];

      v49 = [MEMORY[0x1E4FB1618] _systemDestructiveTintColor];
      v50 = [(AddressCardTableViewCell *)v5 textLabel];
      [v50 setTextColor:v49];

      v42 = EventKitUIBundle();
      id v6 = v42;
      v43 = @"DeleteCalendarSharee";
      v47 = @"Delete";
LABEL_12:
      v51 = [v42 localizedStringForKey:v43 value:v47 table:0];
      v52 = [(AddressCardTableViewCell *)v5 textLabel];
      [v52 setText:v51];

LABEL_15:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ([(EKShareeViewController *)self _subitemAtRow:a4] == 1)
  {
    uint64_t v4 = EventKitUIBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"Allow this person to make changes to the calendar." value:&stru_1F0CC2140 table:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(EKShareeViewController *)self traitCollection];
  BOOL v10 = EKUIUsesLargeTextLayout(v9);

  if (!v10)
  {
    int v11 = -[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", [v8 section]);
    if ((v11 - 1) < 2)
    {
      double v13 = 45.0;
    }
    else
    {
      if ((v11 - 3) < 2)
      {
        [v7 rowHeight];
LABEL_10:
        double v4 = v12;
        goto LABEL_11;
      }
      if (v11) {
        goto LABEL_11;
      }
      double v13 = 63.0;
    }
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v13];
    goto LABEL_10;
  }
  double v4 = *MEMORY[0x1E4FB2F28];
LABEL_11:

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = [(EKShareeViewController *)self traitCollection];
  BOOL v7 = EKUIUsesLargeTextLayout(v6);

  if (v7 || [(EKShareeViewController *)self _subitemAtRow:a4] != 2) {
    return *MEMORY[0x1E4FB2F28];
  }

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:28.0];
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a4;
  switch(-[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", [v12 section]))
  {
    case 0:
      uint64_t v5 = [EKIdentityViewController alloc];
      id v6 = [(EKShareeViewController *)self sharee];
      BOOL v7 = [(EKIdentityViewController *)v5 initWithIdentity:v6];

      id v8 = [(EKShareeViewController *)self navigationController];
      [v8 pushViewController:v7 animated:1];

      goto LABEL_8;
    case 2:
      uint64_t v9 = [(EKShareeViewController *)self tableView];
      [v9 selectRowAtIndexPath:0 animated:1 scrollPosition:0];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        break;
      }
      BOOL v7 = (EKIdentityViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      [(EKIdentityViewController *)v7 shareeViewController:self didCompleteWithAction:1];
      goto LABEL_8;
    case 3:
      [(EKShareeViewController *)self removeClicked:0];
      goto LABEL_7;
    case 4:
      [(EKShareeViewController *)self localDeleteTapped];
LABEL_7:
      BOOL v7 = [(EKShareeViewController *)self tableView];
      [(EKIdentityViewController *)v7 deselectRowAtIndexPath:v12 animated:1];
LABEL_8:

      break;
    default:
      break;
  }
}

- (void)removeClicked:(id)a3
{
  double v4 = [(EKShareeViewController *)self sharee];
  uint64_t v5 = DisplayStringForIdentity((uint64_t)v4, 1, 0);

  id v6 = (void *)MEMORY[0x1E4FB1418];
  BOOL v7 = NSString;
  id v8 = EventKitUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"%@ will immediately lose access to this calendar." value:&stru_1F0CC2140 table:0];
  BOOL v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);
  char v11 = [v6 alertControllerWithTitle:v10 message:0 preferredStyle:0];
  removeAlertController = self->_removeAlertController;
  self->_removeAlertController = v11;

  double v13 = self->_removeAlertController;
  v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = EventKitUIBundle();
  v16 = [v15 localizedStringForKey:@"Remove" value:&stru_1F0CC2140 table:0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__EKShareeViewController_removeClicked___block_invoke;
  v23[3] = &unk_1E60874A8;
  v23[4] = self;
  v17 = [v14 actionWithTitle:v16 style:2 handler:v23];
  [(UIAlertController *)v13 addAction:v17];

  v18 = self->_removeAlertController;
  v19 = (void *)MEMORY[0x1E4FB1410];
  v20 = EventKitUIBundle();
  v21 = [v20 localizedStringForKey:@"Cancel - remove clicked" value:@"Cancel" table:0];
  v22 = [v19 actionWithTitle:v21 style:1 handler:0];
  [(UIAlertController *)v18 addAction:v22];

  [(EKShareeViewController *)self presentViewController:self->_removeAlertController animated:1 completion:0];
}

void __40__EKShareeViewController_removeClicked___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1048));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1048));
    [v4 shareeViewController:*(void *)(a1 + 32) didCompleteWithAction:0];
  }
}

- (void)localDeleteTapped
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 shareeViewController:self didCompleteWithAction:2];
  }
}

- (EKSharee)sharee
{
  return self->_sharee;
}

- (void)setSharee:(id)a3
{
}

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (BOOL)allowStopSharing
{
  return self->_allowStopSharing;
}

- (void)setAllowStopSharing:(BOOL)a3
{
  self->_allowStopSharing = a3;
}

- (BOOL)allowResendInvitations
{
  return self->_allowResendInvitations;
}

- (void)setAllowResendInvitations:(BOOL)a3
{
  self->_allowResendInvitations = a3;
}

- (BOOL)allowLocalDelete
{
  return self->_allowLocalDelete;
}

- (void)setAllowLocalDelete:(BOOL)a3
{
  self->_allowLocalDelete = a3;
}

- (EKShareeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKShareeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharee, 0);

  objc_storeStrong((id *)&self->_removeAlertController, 0);
}

@end