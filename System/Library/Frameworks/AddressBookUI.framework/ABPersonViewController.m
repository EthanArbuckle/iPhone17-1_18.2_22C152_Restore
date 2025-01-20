@interface ABPersonViewController
+ (ABPersonViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (ABAddressBookRef)addressBook;
- (ABPersonViewController)init;
- (ABPersonViewController)initWithAddressBook:(void *)a3;
- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 addressBook:(void *)a5;
- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 addressBook:(void *)a5 style:(int)a6;
- (ABPersonViewController)initWithStyle:(int)a3;
- (ABRecordRef)displayedPerson;
- (BOOL)allowsActions;
- (BOOL)allowsEditing;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)highlightedImportant;
- (BOOL)shouldShowLinkedPeople;
- (CGSize)preferredContentSize;
- (CNContactStore)contactStore;
- (CNContactViewController)cnContactViewController;
- (NSArray)displayedProperties;
- (id)personViewDelegate;
- (int)highlightedMultiValueIdentifier;
- (int)highlightedProperty;
- (int)style;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)loadView;
- (void)reloadContactViewController;
- (void)setAddressBook:(ABAddressBookRef)addressBook;
- (void)setAllowsActions:(BOOL)allowsActions;
- (void)setAllowsEditing:(BOOL)allowsEditing;
- (void)setCnContactViewController:(id)a3;
- (void)setDisplayedPerson:(ABRecordRef)displayedPerson;
- (void)setDisplayedProperties:(NSArray *)displayedProperties;
- (void)setHighlightedImportant:(BOOL)a3;
- (void)setHighlightedItemForProperty:(ABPropertyID)property withIdentifier:(ABMultiValueIdentifier)identifier;
- (void)setHighlightedItemForProperty:(int)a3 withIdentifier:(int)a4 important:(BOOL)a5;
- (void)setHighlightedItemForProperty:(int)a3 withIdentifier:(int)a4 person:(void *)a5 important:(BOOL)a6;
- (void)setHighlightedMultiValueIdentifier:(int)a3;
- (void)setHighlightedProperty:(int)a3;
- (void)setPersonViewDelegate:(id)personViewDelegate;
- (void)setShouldShowLinkedPeople:(BOOL)shouldShowLinkedPeople;
- (void)setStyle:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ABPersonViewController

- (ABPersonViewController)init
{
  return [(ABPersonViewController *)self initWithNibName:0 bundle:0];
}

- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 addressBook:(void *)a5 style:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  v11.receiver = self;
  v11.super_class = (Class)ABPersonViewController;
  v8 = [(ABPersonViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(ABPersonViewController *)v8 setAddressBook:a5];
    [(ABPersonViewController *)v9 setAllowsEditing:1];
    [(ABPersonViewController *)v9 setAllowsActions:1];
    [(ABPersonViewController *)v9 setShouldShowLinkedPeople:0];
    [(ABPersonViewController *)v9 setRestorationIdentifier:@"PeoplePickerPersonRestorationIdentifier"];
    [(ABPersonViewController *)v9 setRestorationClass:objc_opt_class()];
    objc_msgSend((id)-[ABPersonViewController navigationItem](v9, "navigationItem"), "_setBackgroundHidden:", 1);
    [(ABPersonViewController *)v9 setStyle:v6];
  }
  return v9;
}

- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4 addressBook:(void *)a5
{
  return [(ABPersonViewController *)self initWithNibName:a3 bundle:a4 addressBook:a5 style:0];
}

- (ABPersonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(ABPersonViewController *)self initWithNibName:a3 bundle:a4 addressBook:0];
}

- (ABPersonViewController)initWithStyle:(int)a3
{
  return [(ABPersonViewController *)self initWithNibName:0 bundle:0 addressBook:0 style:*(void *)&a3];
}

- (ABPersonViewController)initWithAddressBook:(void *)a3
{
  return [(ABPersonViewController *)self initWithNibName:0 bundle:0 addressBook:a3];
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
  v5.super_class = (Class)ABPersonViewController;
  [(ABPersonViewController *)&v5 dealloc];
}

- (ABAddressBookRef)addressBook
{
  ABAddressBookRef result = self->_addressBook;
  if (!result)
  {
    if ([(ABPersonViewController *)self displayedPerson])
    {
      v4 = (void *)MEMORY[0x237E27200]([(ABPersonViewController *)self displayedPerson]);
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

- (CNContactStore)contactStore
{
  v2 = (void *)MEMORY[0x263EFEA58];
  ABAddressBookRef v3 = [(ABPersonViewController *)self addressBook];

  return (CNContactStore *)[v2 contactStoreForPublicAddressBook:v3];
}

- (ABRecordRef)displayedPerson
{
  return self->_displayedPerson;
}

- (void)setDisplayedPerson:(ABRecordRef)displayedPerson
{
  if (self->_displayedPerson != displayedPerson)
  {
    [(ABPersonViewController *)self setAddressBook:0];
    objc_super v5 = self->_displayedPerson;
    if (v5)
    {
      CFRelease(v5);
      self->_displayedPerson = (void *)displayedPerson;
    }
    if (displayedPerson) {
      self->_displayedPerson = (void *)CFRetain(displayedPerson);
    }
    if ([(ABPersonViewController *)self cnContactViewController])
    {
      [(ABPersonViewController *)self reloadContactViewController];
    }
  }
}

- (void)setHighlightedItemForProperty:(ABPropertyID)property withIdentifier:(ABMultiValueIdentifier)identifier
{
}

- (void)loadView
{
  -[ABPersonViewController setView:](self, "setView:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", 0.0, 0.0, 500.0, 500.0));
  objc_msgSend((id)-[ABPersonViewController view](self, "view"), "setAutoresizingMask:", 18);
  if (![(ABPersonViewController *)self cnContactViewController])
  {
    [(ABPersonViewController *)self reloadContactViewController];
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ABPersonViewController;
  -[ABPersonViewController encodeRestorableStateWithCoder:](&v10, sel_encodeRestorableStateWithCoder_);
  ABRecordRef v5 = [(ABPersonViewController *)self displayedPerson];
  if (v5)
  {
    uint64_t v6 = v5;
    CFTypeRef v7 = ABRecordCopyValue(v5, *MEMORY[0x263EFB608]);
    CFTypeRef v8 = ABRecordCopyValue(v6, *MEMORY[0x263EFB620]);
    int v9 = MEMORY[0x237E27210](v6);
    if (v7)
    {
      [a3 encodeObject:v7 forKey:@"FirstName"];
      CFRelease(v7);
    }
    if (v8)
    {
      [a3 encodeObject:v8 forKey:@"LastName"];
      CFRelease(v8);
    }
    [a3 encodeInteger:v9 forKey:@"Identifier"];
  }
  objc_msgSend(a3, "encodeBool:forKey:", -[ABPersonViewController shouldShowLinkedPeople](self, "shouldShowLinkedPeople"), @"kABDisplayedPersonShowLinkedPeople");
}

+ (ABPersonViewController)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  ABRecordRef v5 = (const void *)ABAddressBookCreateWithOptionsAndPolicy();
  uint64_t v6 = (void *)[a4 decodeObjectOfClass:objc_opt_class() forKey:@"FirstName"];
  CFTypeRef v7 = (void *)[a4 decodeObjectOfClass:objc_opt_class() forKey:@"LastName"];
  uint64_t v8 = [a4 decodeIntegerForKey:@"Identifier"];
  if (v8 == -1) {
    goto LABEL_17;
  }
  ABRecordRef PersonWithRecordID = ABAddressBookGetPersonWithRecordID(v5, v8);
  if (!PersonWithRecordID)
  {
    NSLog(&cfstr_SNoPersonFound_0.isa, "ABRecordRef _getPersonFromSavedState(NSCoder *, ABAddressBookRef)", (int)v8, v6, v7);
    goto LABEL_17;
  }
  objc_super v10 = PersonWithRecordID;
  CFTypeRef v11 = ABRecordCopyValue(PersonWithRecordID, *MEMORY[0x263EFB608]);
  CFTypeRef v12 = ABRecordCopyValue(v10, *MEMORY[0x263EFB620]);
  if (v6 && ![v6 isEqualToString:v11]
    || v7 && ![v7 isEqualToString:v12])
  {
    NSLog(&cfstr_SMismatchOnNam.isa, "ABRecordRef _getPersonFromSavedState(NSCoder *, ABAddressBookRef)", v8, v6, v7, v11, v12);
    objc_super v10 = 0;
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  NSLog(&cfstr_SFoundPersonFo.isa, "ABRecordRef _getPersonFromSavedState(NSCoder *, ABAddressBookRef)", v8, v6, v7);
  if (v11) {
LABEL_11:
  }
    CFRelease(v11);
LABEL_12:
  if (v12) {
    CFRelease(v12);
  }
  if (v10)
  {
    v13 = [[ABPersonViewController alloc] initWithAddressBook:v5];
    [(ABPersonViewController *)v13 setDisplayedPerson:v10];
    -[ABPersonViewController setShouldShowLinkedPeople:](v13, "setShouldShowLinkedPeople:", [a4 decodeBoolForKey:@"kABDisplayedPersonShowLinkedPeople"]);
    if (!v5) {
      return v13;
    }
    goto LABEL_18;
  }
LABEL_17:
  NSLog(&cfstr_SNoPersonFound.isa, "+[ABPersonViewController viewControllerWithRestorationIdentifierPath:coder:]");
  v13 = 0;
  if (v5) {
LABEL_18:
  }
    CFRelease(v5);
  return v13;
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
  v4.super_class = (Class)ABPersonViewController;
  [(ABPersonViewController *)&v4 viewDidAppear:a3];
  [(ABPersonViewController *)self preferredContentSize];
  -[ABPersonViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  [(ABPersonViewController *)self personViewDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  ABAddressBookRef v8 = [(ABPersonViewController *)self addressBook];
  uint64_t v6 = -[CNContactStore publicABPersonFromContact:publicAddressBook:](-[ABPersonViewController contactStore](self, "contactStore"), "publicABPersonFromContact:publicAddressBook:", [a4 contact], &v8);
  return objc_msgSend(-[ABPersonViewController personViewDelegate](self, "personViewDelegate"), "personViewController:shouldPerformDefaultActionForPerson:property:identifier:", self, v6, objc_msgSend(MEMORY[0x263EFE9F8], "publicABPropertyIDFromContactPropertyKey:", objc_msgSend(a4, "key")), -[CNContactStore publicMultiValueIdentifierFromLabeledValue:](-[ABPersonViewController contactStore](self, "contactStore"), "publicMultiValueIdentifierFromLabeledValue:", objc_msgSend(a4, "labeledValue")));
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if ([(ABPersonViewController *)self displayedPerson])
  {
    ABRecordRef v6 = [(ABPersonViewController *)self displayedPerson];
    [a4 overwritePublicABPerson:v6];
  }
}

- (void)setHighlightedItemForProperty:(int)a3 withIdentifier:(int)a4 important:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  [(ABPersonViewController *)self setHighlightedProperty:*(void *)&a3];
  [(ABPersonViewController *)self setHighlightedMultiValueIdentifier:v6];

  [(ABPersonViewController *)self setHighlightedImportant:v5];
}

- (void)setHighlightedItemForProperty:(int)a3 withIdentifier:(int)a4 person:(void *)a5 important:(BOOL)a6
{
}

- (void)reloadContactViewController
{
  v24[1] = *MEMORY[0x263EF8340];
  if (![(ABPersonViewController *)self displayedPerson])
  {
    ABRecordRef v3 = ABPersonCreate();
    [(ABPersonViewController *)self setDisplayedPerson:v3];
    if (v3) {
      CFRelease(v3);
    }
  }
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFE9F8], "contactPropertyKeyFromPublicABPropertyID:", -[ABPersonViewController highlightedProperty](self, "highlightedProperty"));
  v24[0] = [MEMORY[0x263EFEBF8] descriptorForRequiredKeys];
  BOOL v5 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  uint64_t v6 = (uint64_t)v5;
  if (v4) {
    uint64_t v6 = [v5 arrayByAddingObject:v4];
  }
  CFTypeRef v7 = objc_msgSend(MEMORY[0x263EFE9F8], "contactFromPublicABPerson:keysToFetch:", -[ABPersonViewController displayedPerson](self, "displayedPerson"), v6);
  ABAddressBookRef v8 = v7;
  if (v4
    && (int v9 = (void *)[v7 valueForKey:v4], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (long long v21 = 0u,
        long long v22 = 0u,
        long long v19 = 0u,
        long long v20 = 0u,
        (uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16]) != 0))
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v15 = [v14 iOSLegacyIdentifier];
        if (v15 == [(ABPersonViewController *)self highlightedMultiValueIdentifier])
        {
          uint64_t v16 = [v14 identifier];
          goto LABEL_18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v16 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_18:
  uint64_t v17 = [(NSArray *)[(ABPersonViewController *)self displayedProperties] _cn_map:&__block_literal_global_1];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] willMoveToParentViewController:0];
  if (-[CNContactViewController isViewLoaded](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "isViewLoaded"))objc_msgSend((id)-[CNContactViewController view](-[ABPersonViewController cnContactViewController](self, "cnContactViewController"), "view"), "removeFromSuperview"); {
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] removeFromParentViewController];
  }
  [(ABPersonViewController *)self setCnContactViewController:0];
  -[ABPersonViewController setCnContactViewController:](self, "setCnContactViewController:", [MEMORY[0x263EFEBF8] viewControllerForContact:v8]);
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] setAllowsEditing:[(ABPersonViewController *)self allowsEditing]];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] setAllowsActions:[(ABPersonViewController *)self allowsActions]];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] setShouldShowLinkedContacts:[(ABPersonViewController *)self shouldShowLinkedPeople]];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] setDisplayedPropertyKeys:v17];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] setDelegate:self];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] highlightPropertyWithKey:v4 identifier:v16 important:[(ABPersonViewController *)self highlightedImportant]];
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] setContactStore:[(ABPersonViewController *)self contactStore]];
  [(ABPersonViewController *)self addChildViewController:[(ABPersonViewController *)self cnContactViewController]];
  v18 = (void *)[(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] view];
  objc_msgSend((id)-[ABPersonViewController view](self, "view"), "bounds");
  objc_msgSend(v18, "setFrame:");
  [v18 setAutoresizingMask:18];
  objc_msgSend((id)-[ABPersonViewController view](self, "view"), "addSubview:", v18);
  [(CNContactViewController *)[(ABPersonViewController *)self cnContactViewController] didMoveToParentViewController:self];
}

uint64_t __53__ABPersonViewController_reloadContactViewController__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v3 = [a2 intValue];

  return [v2 contactPropertyKeyFromPublicABPropertyID:v3];
}

- (id)personViewDelegate
{
  return self->_personViewDelegate;
}

- (void)setPersonViewDelegate:(id)personViewDelegate
{
  self->_personViewDelegate = (ABPersonViewControllerDelegate *)personViewDelegate;
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (void)setDisplayedProperties:(NSArray *)displayedProperties
{
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)allowsEditing
{
  self->_allowsEditing = allowsEditing;
}

- (BOOL)allowsActions
{
  return self->_allowsActions;
}

- (void)setAllowsActions:(BOOL)allowsActions
{
  self->_allowsActions = allowsActions;
}

- (BOOL)shouldShowLinkedPeople
{
  return self->_shouldShowLinkedPeople;
}

- (void)setShouldShowLinkedPeople:(BOOL)shouldShowLinkedPeople
{
  self->_shouldShowLinkedPeople = shouldShowLinkedPeople;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int)highlightedProperty
{
  return self->_highlightedProperty;
}

- (void)setHighlightedProperty:(int)a3
{
  self->_highlightedProperty = a3;
}

- (int)highlightedMultiValueIdentifier
{
  return self->_highlightedMultiValueIdentifier;
}

- (void)setHighlightedMultiValueIdentifier:(int)a3
{
  self->_highlightedMultiValueIdentifier = a3;
}

- (BOOL)highlightedImportant
{
  return self->_highlightedImportant;
}

- (void)setHighlightedImportant:(BOOL)a3
{
  self->_highlightedImportant = a3;
}

- (CNContactViewController)cnContactViewController
{
  return self->_cnContactViewController;
}

- (void)setCnContactViewController:(id)a3
{
}

@end