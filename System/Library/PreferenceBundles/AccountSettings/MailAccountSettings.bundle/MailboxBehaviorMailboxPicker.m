@interface MailboxBehaviorMailboxPicker
- (MailboxBehaviorMailboxPicker)initWithNibName:(id)a3 bundle:(id)a4;
- (void)mailboxList:(id)a3 didSelectMailbox:(id)a4;
- (void)selectedLocally:(id)a3;
- (void)viewDidLoad;
@end

@implementation MailboxBehaviorMailboxPicker

- (MailboxBehaviorMailboxPicker)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MailboxBehaviorMailboxPicker;
  v8 = [(MailboxBehaviorMailboxPicker *)&v12 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = objc_alloc_init(MailboxListViewControllerPrefs);
    mailboxListController = v8->_mailboxListController;
    v8->_mailboxListController = v9;

    [(MailboxBehaviorMailboxPicker *)v8 addChildViewController:v8->_mailboxListController];
    [(MailboxListViewControllerPrefs *)v8->_mailboxListController didMoveToParentViewController:v8];
  }

  return v8;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)MailboxBehaviorMailboxPicker;
  [(MailboxBehaviorMailboxPicker *)&v24 viewDidLoad];
  v3 = [(MailboxBehaviorMailboxPicker *)self specifier];
  v4 = [v3 target];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_target, v4);
  }
  v5 = [v3 userInfo];
  id v6 = [v5 objectForKey:@"MailboxType"];
  self->_pickingForType = (int)[v6 intValue];

  id v7 = [(MailboxBehaviorMailboxPickerDelegate *)self->_target account];
  if ([(MailboxBehaviorMailboxPickerDelegate *)self->_target storeMailboxTypeOnServer:self->_pickingForType])
  {
    mailboxListController = self->_mailboxListController;
    v9 = [(MailboxBehaviorMailboxPickerDelegate *)self->_target mailboxUidForType:self->_pickingForType];
    [(MailboxListViewControllerBase *)mailboxListController setSelectedMailbox:v9];
  }
  v10 = objc_alloc_init(MailboxListViewingContext);
  [(MailboxListViewingContext *)v10 setAccount:v7];
  [(MailboxListViewingContext *)v10 setSelectionTarget:self];
  [(MailboxListViewingContext *)v10 setType:self->_pickingForType];
  [(MailboxListViewControllerPrefs *)self->_mailboxListController setViewingContext:v10];
  v11 = [(MailboxBehaviorMailboxPicker *)self view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(MailboxListViewControllerPrefs *)self->_mailboxListController view];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  v21 = [(MailboxListViewControllerPrefs *)self->_mailboxListController tableView];
  [v21 setUsesVariableMargins:1];

  v22 = [(MailboxBehaviorMailboxPicker *)self view];
  v23 = [(MailboxListViewControllerPrefs *)self->_mailboxListController tableView];
  [v22 addSubview:v23];

  [(MailboxListViewControllerPrefs *)self->_mailboxListController _loadMailboxes];
}

- (void)mailboxList:(id)a3 didSelectMailbox:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  target = self->_target;
  if (target) {
    [(MailboxBehaviorMailboxPickerDelegate *)target pickerDidChooseMailbox:v6 forType:self->_pickingForType];
  }
  [(MailboxListViewControllerBase *)self->_mailboxListController setSelectedMailbox:v6];
  [(MailboxListViewControllerPrefs *)self->_mailboxListController refreshDisplay];
}

- (void)selectedLocally:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxListController, 0);

  objc_storeStrong((id *)&self->_target, 0);
}

@end