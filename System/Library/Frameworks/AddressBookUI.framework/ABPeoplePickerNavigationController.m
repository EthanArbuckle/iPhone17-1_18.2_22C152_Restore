@interface ABPeoplePickerNavigationController
- (ABAddressBookRef)addressBook;
- (ABPeoplePickerNavigationController)init;
- (ABPeoplePickerNavigationController)initWithAddressBook:(void *)a3;
- (ABPeoplePickerNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_allowsAutorotation;
- (BOOL)_isDelayingPresentation;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSArray)displayedProperties;
- (NSPredicate)predicateForEnablingPerson;
- (NSPredicate)predicateForSelectionOfPerson;
- (NSPredicate)predicateForSelectionOfProperty;
- (id)contactStore;
- (id)displayedPropertyKeys;
- (id)peoplePickerDelegate;
- (void)_endDelayingPresentation;
- (void)_setViewController:(id)a3 animated:(BOOL)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)setAddressBook:(ABAddressBookRef)addressBook;
- (void)setDisplayedProperties:(NSArray *)displayedProperties;
- (void)setPeoplePickerDelegate:(id)peoplePickerDelegate;
- (void)setPredicateForEnablingPerson:(NSPredicate *)predicateForEnablingPerson;
- (void)setPredicateForSelectionOfPerson:(NSPredicate *)predicateForSelectionOfPerson;
- (void)setPredicateForSelectionOfProperty:(NSPredicate *)predicateForSelectionOfProperty;
- (void)setupViewControllers;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ABPeoplePickerNavigationController

- (ABPeoplePickerNavigationController)initWithAddressBook:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ABPeoplePickerNavigationController;
  v4 = [(ABPeoplePickerNavigationController *)&v7 initWithNibName:0 bundle:0];
  if (v4)
  {
    if (([(ABPeoplePickerNavigationController *)v4 isMemberOfClass:objc_opt_class()] & 1) == 0) {
      NSLog(&cfstr_Abpeoplepicker.isa);
    }
    if (a3) {
      v5 = (void *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_addressBook = v5;
    [(ABPeoplePickerNavigationController *)v4 _setClipUnderlapWhileTransitioning:1];
  }
  return v4;
}

- (ABPeoplePickerNavigationController)init
{
  return [(ABPeoplePickerNavigationController *)self initWithAddressBook:0];
}

- (ABPeoplePickerNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[ABPeoplePickerNavigationController initWithAddressBook:](self, "initWithAddressBook:", 0, a4);
}

- (void)dealloc
{
  addressBook = self->_addressBook;
  if (addressBook)
  {
    CFRelease(addressBook);
    self->_addressBook = 0;
  }
  self->_peoplePickerDelegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  [(ABPeoplePickerNavigationController *)&v4 dealloc];
}

- (void)_setViewController:(id)a3 animated:(BOOL)a4
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = a3;
  -[ABPeoplePickerNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1], a4);
}

- (void)setupViewControllers
{
  if (!objc_msgSend((id)-[ABPeoplePickerNavigationController viewControllers](self, "viewControllers"), "count"))
  {
    if (([(ABPeoplePickerNavigationController *)self isMemberOfClass:objc_opt_class()] & 1) == 0) {
      NSLog(&cfstr_Abpeoplepicker.isa);
    }
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F33560], "sharedInstance"), "isAccessGranted"))
    {
      if (!self->_addressBook) {
        self->_addressBook = (void *)ABAddressBookCreateWithOptionsAndPolicy();
      }
    }
    v3 = (CNContactPickerViewController *)[objc_alloc(MEMORY[0x263EFEBE0]) initWithNibName:0 bundle:0];
    self->_contactPicker = v3;
    [(CNContactPickerViewController *)v3 setDelegate:self];
    [(CNContactPickerViewController *)self->_contactPicker setPredicateForEnablingContact:[(ABPeoplePickerNavigationController *)self predicateForEnablingPerson]];
    [(CNContactPickerViewController *)self->_contactPicker setPredicateForSelectionOfContact:[(ABPeoplePickerNavigationController *)self predicateForSelectionOfPerson]];
    [(CNContactPickerViewController *)self->_contactPicker setDisplayedPropertyKeys:[(ABPeoplePickerNavigationController *)self displayedPropertyKeys]];
    [(CNContactPickerViewController *)self->_contactPicker setAllowsCancel:[(ABPeoplePickerNavigationController *)self _shouldPreventCancelButtonsFromShowing] ^ 1];
    v4.receiver = self;
    v4.super_class = (Class)ABPeoplePickerNavigationController;
    [(ABPeoplePickerNavigationController *)&v4 setNavigationBarHidden:1 animated:0];
    [(ABPeoplePickerNavigationController *)self _setViewController:self->_contactPicker animated:0];
    [(CNContactPickerViewController *)self->_contactPicker _viewWillBePresented];
  }
}

- (id)displayedPropertyKeys
{
  v2 = [(ABPeoplePickerNavigationController *)self displayedProperties];

  return (id)[(NSArray *)v2 _cn_map:&__block_literal_global_0];
}

uint64_t __59__ABPeoplePickerNavigationController_displayedPropertyKeys__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v3 = [a2 intValue];

  return [v2 contactPropertyKeyFromPublicABPropertyID:v3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_contactPicker_didSelectContactProperty_ == a3 || sel_contactPicker_didSelectContact_ == a3)
  {
    [(ABPeoplePickerNavigationController *)self peoplePickerDelegate];
    unsigned __int8 v3 = objc_opt_respondsToSelector();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ABPeoplePickerNavigationController;
    unsigned __int8 v3 = -[ABPeoplePickerNavigationController respondsToSelector:](&v5, sel_respondsToSelector_);
  }
  return v3 & 1;
}

- (BOOL)_allowsAutorotation
{
  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  unsigned int v2 = [(ABPeoplePickerNavigationController *)&v4 _allowsAutorotation];
  if (v2) {
    LOBYTE(v2) = ABAddressBookShouldAllowAutorotation();
  }
  return v2;
}

- (BOOL)_isDelayingPresentation
{
  v5.receiver = self;
  v5.super_class = (Class)ABPeoplePickerNavigationController;
  if ([(ABPeoplePickerNavigationController *)&v5 _isDelayingPresentation]) {
    return 1;
  }
  if (!self->_ignoreViewWillBePresented && (objc_opt_respondsToSelector() & 1) != 0) {
    [(ABPeoplePickerNavigationController *)self _viewWillBePresented];
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  return [(ABPeoplePickerNavigationController *)&v4 _isDelayingPresentation];
}

- (void)_endDelayingPresentation
{
  self->_ignoreViewWillBePresented = 1;
  v3.receiver = self;
  v3.super_class = (Class)ABPeoplePickerNavigationController;
  [(ABPeoplePickerNavigationController *)&v3 _endDelayingPresentation];
  self->_ignoreViewWillBePresented = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABPeoplePickerNavigationController;
  [(ABPeoplePickerNavigationController *)&v4 viewWillAppear:a3];
  [(ABPeoplePickerNavigationController *)self setupViewControllers];
  if (([(ABPeoplePickerNavigationController *)self isBeingPresented] & 1) != 0
    || [(ABPeoplePickerNavigationController *)self isMovingToParentViewController])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFEC38], "sharedCollector"), "logPresentation");
  }
}

- (ABAddressBookRef)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(ABAddressBookRef)addressBook
{
  int v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F33560], "sharedInstance"), "isAccessGranted");
  if (addressBook && v5 && self->_addressBook != addressBook)
  {
    CFRetain(addressBook);
    v6 = self->_addressBook;
    if (v6) {
      CFRelease(v6);
    }
    self->_addressBook = (void *)addressBook;
  }
}

- (id)contactStore
{
  unsigned int v2 = (void *)MEMORY[0x263EFEA58];
  ABAddressBookRef v3 = [(ABPeoplePickerNavigationController *)self addressBook];

  return (id)[v2 contactStoreForPublicAddressBook:v3];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  _CNUILog();
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(ABPeoplePickerNavigationController *)self contactStore];
    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x263EFEA58]);
    }
    ABAddressBookRef v8 = [(ABPeoplePickerNavigationController *)self addressBook];
    objc_msgSend(self->_peoplePickerDelegate, "peoplePickerNavigationController:didSelectPerson:", self, objc_msgSend(v6, "publicABPersonFromContact:publicAddressBook:", a4, &v8));
  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  _CNUILog();
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(ABPeoplePickerNavigationController *)self contactStore];
    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x263EFEA58]);
    }
    ABAddressBookRef v9 = [(ABPeoplePickerNavigationController *)self addressBook];
    uint64_t v7 = objc_msgSend(v6, "publicABPersonFromContact:publicAddressBook:", objc_msgSend(a4, "contact"), &v9);
    objc_msgSend(self->_peoplePickerDelegate, "peoplePickerNavigationController:didSelectPerson:property:identifier:", self, v7, objc_msgSend(MEMORY[0x263EFE9F8], "publicABPropertyIDFromContactPropertyKey:", objc_msgSend(a4, "key")), objc_msgSend(v6, "publicMultiValueIdentifierFromLabeledValue:", objc_msgSend(a4, "labeledValue")));
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  _CNUILog();
  if (objc_opt_respondsToSelector())
  {
    id peoplePickerDelegate = self->_peoplePickerDelegate;
    [peoplePickerDelegate peoplePickerNavigationControllerDidCancel:self];
  }
}

- (id)peoplePickerDelegate
{
  return self->_peoplePickerDelegate;
}

- (void)setPeoplePickerDelegate:(id)peoplePickerDelegate
{
  self->_id peoplePickerDelegate = peoplePickerDelegate;
}

- (NSArray)displayedProperties
{
  return self->_displayedProperties;
}

- (void)setDisplayedProperties:(NSArray *)displayedProperties
{
}

- (NSPredicate)predicateForEnablingPerson
{
  return self->_predicateForEnablingPerson;
}

- (void)setPredicateForEnablingPerson:(NSPredicate *)predicateForEnablingPerson
{
}

- (NSPredicate)predicateForSelectionOfPerson
{
  return self->_predicateForSelectionOfPerson;
}

- (void)setPredicateForSelectionOfPerson:(NSPredicate *)predicateForSelectionOfPerson
{
}

- (NSPredicate)predicateForSelectionOfProperty
{
  return self->_predicateForSelectionOfProperty;
}

- (void)setPredicateForSelectionOfProperty:(NSPredicate *)predicateForSelectionOfProperty
{
}

@end