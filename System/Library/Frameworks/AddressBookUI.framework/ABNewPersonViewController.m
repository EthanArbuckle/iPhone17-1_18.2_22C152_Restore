@interface ABNewPersonViewController
- (ABAddressBookRef)addressBook;
- (ABNewPersonViewController)init;
- (ABNewPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 style:(int)a5;
- (ABNewPersonViewController)initWithStyle:(int)a3;
- (ABRecordRef)displayedPerson;
- (ABRecordRef)parentGroup;
- (BOOL)savesNewContactOnSuspend;
- (BOOL)showsCancelButton;
- (CGSize)preferredContentSize;
- (CNContact)mergeContact;
- (CNContactViewController)cnContactViewController;
- (id)newPersonViewDelegate;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)loadContactViewController;
- (void)loadView;
- (void)parentSource;
- (void)setAddressBook:(ABAddressBookRef)addressBook;
- (void)setCnContactViewController:(id)a3;
- (void)setDisplayedPerson:(ABRecordRef)displayedPerson;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setMergeContact:(id)a3;
- (void)setNewPersonViewDelegate:(id)newPersonViewDelegate;
- (void)setParentGroup:(ABRecordRef)parentGroup;
- (void)setParentSource:(void *)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ABNewPersonViewController

- (ABNewPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 style:(int)a5
{
  v7.receiver = self;
  v7.super_class = (Class)ABNewPersonViewController;
  v5 = -[ABNewPersonViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0, 0, *(void *)&a5);
  if (v5)
  {
    -[ABNewPersonViewController setTitle:](v5, "setTitle:", [(id)ABAddressBookUIBundle() localizedStringForKey:@"CREATE_NEW_CONTACT_TITLE" value:&stru_26EAA1368 table:@"AB"]);
    [(ABNewPersonViewController *)v5 setRestorationClass:objc_opt_class()];
    [(ABNewPersonViewController *)v5 setRestorationIdentifier:@"kABNewPersonViewControllerRestorationIdentifier"];
  }
  return v5;
}

- (ABNewPersonViewController)init
{
  return [(ABNewPersonViewController *)self initWithNibName:0 bundle:0 style:0];
}

- (ABNewPersonViewController)initWithStyle:(int)a3
{
  return [(ABNewPersonViewController *)self initWithNibName:0 bundle:0 style:*(void *)&a3];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(CNContactViewController *)self->_cnContactViewController setDelegate:0];

  addressBook = self->_addressBook;
  if (addressBook) {
    CFRelease(addressBook);
  }

  v4.receiver = self;
  v4.super_class = (Class)ABNewPersonViewController;
  [(ABNewPersonViewController *)&v4 dealloc];
}

- (id)newPersonViewDelegate
{
  return self->_newPersonViewDelegate;
}

- (void)setNewPersonViewDelegate:(id)newPersonViewDelegate
{
  self->_newPersonViewDelegate = (ABNewPersonViewControllerDelegate *)newPersonViewDelegate;
}

- (ABAddressBookRef)addressBook
{
  ABAddressBookRef result = self->_addressBook;
  if (!result)
  {
    if ([(ABNewPersonViewController *)self displayedPerson])
    {
      objc_super v4 = (void *)MEMORY[0x237E27200]([(ABNewPersonViewController *)self displayedPerson]);
      self->_addressBook = v4;
      if (v4) {
        CFRetain(v4);
      }
    }
    if ([(ABNewPersonViewController *)self parentGroup])
    {
      v5 = (void *)MEMORY[0x237E27200]([(ABNewPersonViewController *)self parentGroup]);
      self->_addressBook = v5;
      if (!v5)
      {
LABEL_9:
        ABAddressBookRef result = (ABAddressBookRef)ABAddressBookCreateWithOptionsAndPolicy();
        self->_addressBook = (void *)result;
        return result;
      }
      CFRetain(v5);
    }
    ABAddressBookRef result = self->_addressBook;
    if (result) {
      return result;
    }
    goto LABEL_9;
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

- (ABRecordRef)displayedPerson
{
  return self->_displayedPerson;
}

- (void)setDisplayedPerson:(ABRecordRef)displayedPerson
{
  v5 = self->_displayedPerson;
  if (v5)
  {
    CFRelease(v5);
    self->_displayedPerson = 0;
  }
  if (displayedPerson) {
    self->_displayedPerson = (void *)CFRetain(displayedPerson);
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  -[ABNewPersonViewController setView:](self, "setView:", (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24)));
  objc_msgSend((id)-[ABNewPersonViewController view](self, "view"), "setAutoresizingMask:", 18);

  [(ABNewPersonViewController *)self loadContactViewController];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ABNewPersonViewController;
  [(ABNewPersonViewController *)&v5 setEditing:1 animated:0];
  [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] setEditing:1 animated:0];
}

- (CGSize)preferredContentSize
{
  [(CNContactViewController *)self->_cnContactViewController preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABNewPersonViewController;
  [(ABNewPersonViewController *)&v4 viewDidAppear:a3];
  [(ABNewPersonViewController *)self preferredContentSize];
  -[ABNewPersonViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    if (a4)
    {
      if ([(ABNewPersonViewController *)self displayedPerson])
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F33560], "sharedInstance"), "isAccessGranted")) {
          ABAddressBookRef v6 = [(ABNewPersonViewController *)self addressBook];
        }
        else {
          ABAddressBookRef v6 = 0;
        }
        objc_msgSend(a4, "updateNewPublicABPerson:inAddressBook:", -[ABNewPersonViewController displayedPerson](self, "displayedPerson"), v6);
      }
      newPersonViewDelegate = self->_newPersonViewDelegate;
      ABRecordRef v9 = [(ABNewPersonViewController *)self displayedPerson];
      objc_super v7 = newPersonViewDelegate;
      v8 = self;
    }
    else
    {
      objc_super v7 = self->_newPersonViewDelegate;
      v8 = self;
      ABRecordRef v9 = 0;
    }
    [(ABNewPersonViewControllerDelegate *)v7 newPersonViewController:v8 didCompleteWithNewPerson:v9];
  }
}

- (void)loadContactViewController
{
  v15[1] = *MEMORY[0x263EF8340];
  if (![(ABNewPersonViewController *)self displayedPerson])
  {
    if ([(ABNewPersonViewController *)self parentGroup])
    {
      ABRecordRef v3 = ABGroupCopySource([(ABNewPersonViewController *)self parentGroup]);
      if (!v3)
      {
        [(ABNewPersonViewController *)self setDisplayedPerson:0];
        goto LABEL_12;
      }
      objc_super v4 = v3;
      ABRecordRef v5 = ABPersonCreateInSource(v3);
      CFRelease(v4);
    }
    else
    {
      if ([(ABNewPersonViewController *)self parentSource]) {
        ABRecordRef v6 = ABPersonCreateInSource([(ABNewPersonViewController *)self parentSource]);
      }
      else {
        ABRecordRef v6 = ABPersonCreate();
      }
      ABRecordRef v5 = v6;
    }
    [(ABNewPersonViewController *)self setDisplayedPerson:v5];
    if (v5) {
      CFRelease(v5);
    }
  }
LABEL_12:
  v15[0] = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
  objc_super v7 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v8 = objc_msgSend(v7, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x263EFEBE8], "allCardProperties"));
  ABRecordRef v9 = objc_msgSend(MEMORY[0x263EFE9F8], "contactFromPublicABPerson:keysToFetch:mutable:", -[ABNewPersonViewController displayedPerson](self, "displayedPerson"), v8, 1);
  if ([(ABNewPersonViewController *)self parentGroup])
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F33560], "sharedInstance"), "isAccessGranted"))
    {
      uint64_t v14 = 0;
      v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFEA58], "contactStoreForPublicAddressBook:", -[ABNewPersonViewController addressBook](self, "addressBook")), "groupsMatchingPredicate:error:", objc_msgSend(MEMORY[0x263EFEAB8], "predicateForiOSLegacyIdentifier:", MEMORY[0x237E27210](-[ABNewPersonViewController parentGroup](self, "parentGroup"))), &v14);
      v11 = v10;
      if (!v10)
      {
        NSLog(&cfstr_CanTRetrieveGr.isa, v14);
        goto LABEL_21;
      }
      if ([v10 count] == 1)
      {
        v11 = (void *)[v11 firstObject];
        goto LABEL_21;
      }
      NSLog(&cfstr_CanTRetrieveAS.isa, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count")));
    }
    else
    {
      NSLog(&cfstr_CanTRetrieveGr_0.isa);
    }
  }
  v11 = 0;
LABEL_21:
  if ([(ABNewPersonViewController *)self mergeContact])
  {
    uint64_t v12 = [MEMORY[0x263EFEBE8] allCardProperties];
    objc_msgSend(v9, "addProperties:excludingProperties:fromContact:", v12, objc_msgSend(MEMORY[0x263EFEBE8], "nameProperties"), -[ABNewPersonViewController mergeContact](self, "mergeContact"));
  }
  [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] willMoveToParentViewController:0];
  if (-[CNContactViewController isViewLoaded](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "isViewLoaded"))objc_msgSend((id)-[CNContactViewController view](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "view"), "removeFromSuperview"); {
  [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] removeFromParentViewController];
  }
  [(ABNewPersonViewController *)self setCnContactViewController:0];
  -[ABNewPersonViewController setCnContactViewController:](self, "setCnContactViewController:", [MEMORY[0x263EFEBF8] viewControllerForNewContact:v9]);
  [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] setAllowsEditing:1];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F33560], "sharedInstance"), "isAccessGranted")) {
    -[CNContactViewController setContactStore:](-[ABNewPersonViewController cnContactViewController](self, "cnContactViewController"), "setContactStore:", objc_msgSend(MEMORY[0x263EFEA58], "contactStoreForPublicAddressBook:", -[ABNewPersonViewController addressBook](self, "addressBook")));
  }
  if (self->_newPersonViewDelegate) {
    [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] setDelegate:self];
  }
  if (v11) {
    [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] setParentGroup:v11];
  }
  [(ABNewPersonViewController *)self addChildViewController:[(ABNewPersonViewController *)self cnContactViewController]];
  v13 = (void *)[(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] view];
  objc_msgSend((id)-[ABNewPersonViewController view](self, "view"), "bounds");
  objc_msgSend(v13, "setFrame:");
  [v13 setAutoresizingMask:18];
  objc_msgSend((id)-[ABNewPersonViewController view](self, "view"), "addSubview:", v13);
  [(CNContactViewController *)[(ABNewPersonViewController *)self cnContactViewController] didMoveToParentViewController:self];
  [(ABNewPersonViewController *)self setEditing:1 animated:0];
}

- (BOOL)showsCancelButton
{
  return 0;
}

- (BOOL)savesNewContactOnSuspend
{
  return 0;
}

- (ABRecordRef)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(ABRecordRef)parentGroup
{
  self->_parentGroup = (void *)parentGroup;
}

- (CNContactViewController)cnContactViewController
{
  return self->_cnContactViewController;
}

- (void)setCnContactViewController:(id)a3
{
}

- (void)parentSource
{
  return self->_parentSource;
}

- (void)setParentSource:(void *)a3
{
  self->_parentSource = a3;
}

- (CNContact)mergeContact
{
  return self->_mergeContact;
}

- (void)setMergeContact:(id)a3
{
}

@end