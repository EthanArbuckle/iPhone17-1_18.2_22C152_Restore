@interface ABUnknownPersonViewController
- (ABAddressBookRef)addressBook;
- (ABRecordRef)displayedPerson;
- (ABUnknownPersonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)allowsActions;
- (BOOL)allowsAddingToAddressBook;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 property:(id)a5 labeledValue:(id)a6;
- (CGSize)preferredContentSize;
- (CNContactViewController)cnContactViewController;
- (NSString)alternateName;
- (NSString)message;
- (id)contactStore;
- (id)unknownPersonViewDelegate;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)loadContactViewController;
- (void)loadView;
- (void)setAddressBook:(ABAddressBookRef)addressBook;
- (void)setAllowsActions:(BOOL)allowsActions;
- (void)setAllowsAddingToAddressBook:(BOOL)allowsAddingToAddressBook;
- (void)setAlternateName:(NSString *)alternateName;
- (void)setCnContactViewController:(id)a3;
- (void)setDisplayedPerson:(ABRecordRef)displayedPerson;
- (void)setMessage:(NSString *)message;
- (void)setUnknownPersonViewDelegate:(id)unknownPersonViewDelegate;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ABUnknownPersonViewController

- (ABUnknownPersonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ABUnknownPersonViewController;
  v4 = [(ABUnknownPersonViewController *)&v7 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v4->_allowsAddingToAddressBook = 1;
    v4->_allowsActions = 0;
    objc_msgSend((id)-[ABUnknownPersonViewController navigationItem](v4, "navigationItem"), "_setBackgroundHidden:", 1);
  }
  return v5;
}

- (void)dealloc
{
  [(CNContactViewController *)self->_cnContactViewController setDelegate:0];

  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }
  displayedPerson = self->_displayedPerson;
  if (displayedPerson) {
    CFRelease(displayedPerson);
  }

  v5.receiver = self;
  v5.super_class = (Class)ABUnknownPersonViewController;
  [(ABUnknownPersonViewController *)&v5 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  -[ABUnknownPersonViewController setView:](self, "setView:", (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24)));
  objc_msgSend((id)-[ABUnknownPersonViewController view](self, "view"), "setAutoresizingMask:", 18);

  [(ABUnknownPersonViewController *)self loadContactViewController];
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)ABUnknownPersonViewController;
  -[ABUnknownPersonViewController encodeRestorableStateWithCoder:](&v7, sel_encodeRestorableStateWithCoder_);
  if ([(ABUnknownPersonViewController *)self displayedPerson])
  {
    objc_super v5 = (void *)MEMORY[0x263EFE9F8];
    ABRecordRef v6 = [(ABUnknownPersonViewController *)self displayedPerson];
    v8[0] = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(v5, "contactFromPublicABPerson:keysToFetch:", v6, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v8, 1)), @"kABUnknownPersonRecordKey");
  }
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ABUnknownPersonViewController;
  -[ABUnknownPersonViewController decodeRestorableStateWithCoder:](&v9, sel_decodeRestorableStateWithCoder_);
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kABUnknownPersonRecordKey"];
  if (v5)
  {
    uint64_t v6 = v5;
    ABAddressBookRef v8 = [(ABUnknownPersonViewController *)self addressBook];
    uint64_t v7 = objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", v6, &v8);
    if (v7) {
      [(ABUnknownPersonViewController *)self setDisplayedPerson:v7];
    }
  }
}

- (CGSize)preferredContentSize
{
  cnContactViewController = self->_cnContactViewController;
  if (cnContactViewController)
  {
    [(CNContactViewController *)cnContactViewController preferredContentSize];
  }
  else
  {
    double v3 = *MEMORY[0x263F001B0];
    double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABUnknownPersonViewController;
  [(ABUnknownPersonViewController *)&v4 viewDidAppear:a3];
  [(ABUnknownPersonViewController *)self preferredContentSize];
  -[ABUnknownPersonViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (ABAddressBookRef)addressBook
{
  ABAddressBookRef result = self->_addressBook;
  if (!result)
  {
    if ([(ABUnknownPersonViewController *)self displayedPerson])
    {
      objc_super v4 = (void *)MEMORY[0x237E27200]([(ABUnknownPersonViewController *)self displayedPerson]);
      self->_addressBook = v4;
      if (!v4)
      {
LABEL_6:
        ABAddressBookRef result = (ABAddressBookRef)ABAddressBookCreateWithOptionsAndPolicy();
        self->_addressBook = (void *)result;
        return result;
      }
      CFRetain(v4);
    }
    ABAddressBookRef result = self->_addressBook;
    if (result) {
      return result;
    }
    goto LABEL_6;
  }
  return result;
}

- (void)setAddressBook:(ABAddressBookRef)addressBook
{
  ABAddressBookRef v4 = self->_addressBook;
  if (v4 != addressBook)
  {
    if (v4)
    {
      CFRelease(v4);
      self->_addressBook = 0;
    }
    if (addressBook) {
      self->_addressBook = (void *)CFRetain(addressBook);
    }
  }
}

- (id)contactStore
{
  v2 = (void *)MEMORY[0x263EFEA58];
  ABAddressBookRef v3 = [(ABUnknownPersonViewController *)self addressBook];

  return (id)[v2 contactStoreForPublicAddressBook:v3];
}

- (ABRecordRef)displayedPerson
{
  return self->_displayedPerson;
}

- (void)setDisplayedPerson:(ABRecordRef)displayedPerson
{
  uint64_t v5 = self->_displayedPerson;
  if (v5)
  {
    CFRelease(v5);
    self->_displayedPerson = 0;
  }
  if (displayedPerson) {
    self->_displayedPerson = (void *)CFRetain(displayedPerson);
  }
}

- (CNContactViewController)cnContactViewController
{
  if (!self->_cnContactViewController
    && ([(ABUnknownPersonViewController *)self displayedPerson]
     || [(ABUnknownPersonViewController *)self alternateName]))
  {
    [(ABUnknownPersonViewController *)self loadContactViewController];
  }
  return self->_cnContactViewController;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  [(ABUnknownPersonViewController *)self unknownPersonViewDelegate];
  if (objc_opt_respondsToSelector())
  {
    if (a4)
    {
      ABAddressBookRef v6 = [(ABUnknownPersonViewController *)self addressBook];
      ABAddressBookRef v11 = v6;
      if (![(ABUnknownPersonViewController *)self displayedPerson]) {
        goto LABEL_8;
      }
      uint64_t v7 = (void *)MEMORY[0x263EFE9F8];
      ABRecordRef v8 = [(ABUnknownPersonViewController *)self displayedPerson];
      v12[0] = *MEMORY[0x263EFDFE0];
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "contactFromPublicABPerson:keysToFetch:", v8, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v12, 1)), "identifier"), "isEqualToString:", objc_msgSend(a4, "identifier")))goto LABEL_8; {
      if ((objc_msgSend(a4, "updateNewPublicABPerson:inAddressBook:", -[ABUnknownPersonViewController displayedPerson](self, "displayedPerson"), v6) & 1) == 0)NSLog(&cfstr_CouldnTUpdateD.isa, a4);
      }
      ABRecordRef v9 = [(ABUnknownPersonViewController *)self displayedPerson];
      if (!v9) {
LABEL_8:
      }
        ABRecordRef v9 = (ABRecordRef)objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", a4, &v11);
      objc_msgSend(-[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate"), "unknownPersonViewController:didResolveToPerson:", self, v9);
    }
    else
    {
      id v10 = [(ABUnknownPersonViewController *)self unknownPersonViewDelegate];
      [v10 unknownPersonViewController:self didResolveToPerson:0];
    }
  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 property:(id)a5 labeledValue:(id)a6
{
  [(ABUnknownPersonViewController *)self unknownPersonViewDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  ABAddressBookRef v12 = [(ABUnknownPersonViewController *)self addressBook];
  uint64_t v10 = objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", a4, &v12);
  return objc_msgSend(-[ABUnknownPersonViewController unknownPersonViewDelegate](self, "unknownPersonViewDelegate"), "unknownPersonViewController:shouldPerformDefaultActionForPerson:property:identifier:", self, v10, objc_msgSend(MEMORY[0x263EFE9F8], "publicABPropertyIDFromContactPropertyKey:", a5), objc_msgSend(-[ABUnknownPersonViewController contactStore](self, "contactStore"), "publicMultiValueIdentifierFromLabeledValue:", a6));
}

- (void)loadContactViewController
{
  v9[1] = *MEMORY[0x263EF8340];
  if (![(ABUnknownPersonViewController *)self displayedPerson]
    && ![(ABUnknownPersonViewController *)self alternateName])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ABUnknownPersonViewController.m", 249, @"We should always have a person here.");
  }
  ABAddressBookRef v4 = (void *)MEMORY[0x263EFE9F8];
  ABRecordRef v5 = [(ABUnknownPersonViewController *)self displayedPerson];
  v9[0] = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
  uint64_t v6 = objc_msgSend(v4, "contactFromPublicABPerson:keysToFetch:", v5, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v9, 1));
  [(CNContactViewController *)self->_cnContactViewController willMoveToParentViewController:0];
  if ([(CNContactViewController *)self->_cnContactViewController isViewLoaded]) {
    objc_msgSend((id)-[CNContactViewController view](self->_cnContactViewController, "view"), "removeFromSuperview");
  }
  [(CNContactViewController *)self->_cnContactViewController removeFromParentViewController];
  self->_cnContactViewController = 0;
  -[ABUnknownPersonViewController setCnContactViewController:](self, "setCnContactViewController:", [MEMORY[0x263EFEBF8] viewControllerForUnknownContact:v6]);
  [(CNContactViewController *)self->_cnContactViewController setAllowsEditing:0];
  [(CNContactViewController *)self->_cnContactViewController setMessage:[(ABUnknownPersonViewController *)self message]];
  [(CNContactViewController *)self->_cnContactViewController setAllowsActions:[(ABUnknownPersonViewController *)self allowsActions]];
  [(CNContactViewController *)self->_cnContactViewController setAlternateName:[(ABUnknownPersonViewController *)self alternateName]];
  if ([(ABUnknownPersonViewController *)self allowsAddingToAddressBook])
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F33560], "sharedInstance"), "isAccessGranted")) {
      id v7 = [(ABUnknownPersonViewController *)self contactStore];
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x263EFEA58]);
    }
    [(CNContactViewController *)self->_cnContactViewController setContactStore:v7];
  }
  if ([(ABUnknownPersonViewController *)self unknownPersonViewDelegate]) {
    [(CNContactViewController *)self->_cnContactViewController setDelegate:self];
  }
  [(ABUnknownPersonViewController *)self addChildViewController:self->_cnContactViewController];
  ABRecordRef v8 = (void *)[(CNContactViewController *)self->_cnContactViewController view];
  [v8 setAutoresizingMask:18];
  objc_msgSend((id)-[ABUnknownPersonViewController view](self, "view"), "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend((id)-[ABUnknownPersonViewController view](self, "view"), "addSubview:", v8);
  [(CNContactViewController *)self->_cnContactViewController didMoveToParentViewController:self];
}

- (id)unknownPersonViewDelegate
{
  return self->_unknownPersonViewDelegate;
}

- (void)setUnknownPersonViewDelegate:(id)unknownPersonViewDelegate
{
  self->_unknownPersonViewDelegate = (ABUnknownPersonViewControllerDelegate *)unknownPersonViewDelegate;
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(NSString *)alternateName
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(NSString *)message
{
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsActions:(BOOL)allowsActions
{
  self->_allowsActions = allowsActions;
}

- (BOOL)allowsAddingToAddressBook
{
  return self->_allowsAddingToAddressBook;
}

- (void)setAllowsAddingToAddressBook:(BOOL)allowsAddingToAddressBook
{
  self->_allowsAddingToAddressBook = allowsAddingToAddressBook;
}

- (void)setCnContactViewController:(id)a3
{
}

@end