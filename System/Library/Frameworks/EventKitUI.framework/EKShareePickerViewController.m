@interface EKShareePickerViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)canManagePresentationStyle;
- (BOOL)shouldSuggestFamilySharees;
- (BOOL)wantsManagement;
- (CGSize)preferredContentSize;
- (EKShareePickerViewController)initWithFrame:(CGRect)a3 calendar:(id)a4;
- (EKShareePickerViewControllerDelegate)delegate;
- (NSArray)filterOutFamilySharees;
- (NSArray)sharees;
- (id)_createRecipientFromSharee:(id)a3;
- (id)_createShareeFromRecipient:(id)a3;
- (id)_recipientFromSharee:(id)a3;
- (id)_shareeFromRecipient:(id)a3;
- (unint64_t)eventAttendeePicker:(id)a3 getValidationStatusForAddress:(id)a4;
- (void)add;
- (void)cancel;
- (void)eventAttendeePicker:(id)a3 cacheValidationStatus:(unint64_t)a4 forAddress:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setFilterOutFamilySharees:(id)a3;
- (void)setSearchAccountID:(id)a3;
- (void)setSharees:(id)a3;
- (void)setShouldSuggestFamilySharees:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation EKShareePickerViewController

- (EKShareePickerViewController)initWithFrame:(CGRect)a3 calendar:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)EKShareePickerViewController;
  v10 = [(EKShareePickerViewController *)&v23 initWithNibName:0 bundle:0];
  if (v10)
  {
    v11 = -[EKEventAttendeePicker initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:]([EKCalendarShareePicker alloc], "initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:", 0, v9, 0, 0, x, y, width, height);
    picker = v10->_picker;
    v10->_picker = v11;

    [(EKEventAttendeePicker *)v10->_picker setAddressValidationDelegate:v10];
    [(EKShareePickerViewController *)v10 addChildViewController:v10->_picker];
    v13 = EventKitUIBundle();
    v14 = [v13 localizedStringForKey:@"Add Person VC title" value:@"Add Person" table:0];
    [(EKShareePickerViewController *)v10 setTitle:v14];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v10 action:sel_cancel];
    v16 = [(EKShareePickerViewController *)v10 navigationItem];
    [v16 setLeftBarButtonItem:v15];

    id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v18 = EventKitUIBundle();
    v19 = [v18 localizedStringForKey:@"Add" value:&stru_1F0CC2140 table:0];
    v20 = (void *)[v17 initWithTitle:v19 style:2 target:v10 action:&sel_add];
    v21 = [(EKShareePickerViewController *)v10 navigationItem];
    [v21 setRightBarButtonItem:v20];
  }
  return v10;
}

- (void)setSearchAccountID:(id)a3
{
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)EKShareePickerViewController;
  [(EKShareePickerViewController *)&v15 viewDidLoad];
  v3 = [(EKShareePickerViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(EKCalendarShareePicker *)self->_picker view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(EKShareePickerViewController *)self view];
  v14 = [(EKCalendarShareePicker *)self->_picker view];
  [v13 addSubview:v14];
}

- (void)cancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 shareePickerViewController:self didCompleteWithAction:0];
  }
}

- (void)add
{
  [(EKEventAttendeePicker *)self->_picker commitRemainingText];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 shareePickerViewController:self didCompleteWithAction:1];
  }
}

- (id)_shareeFromRecipient:(id)a3
{
  id v4 = a3;
  id v5 = objc_getAssociatedObject(v4, &shareeKey);
  if (!v5)
  {
    id v5 = [v4 address];

    if (v5)
    {
      id v5 = [(EKShareePickerViewController *)self _createShareeFromRecipient:v4];
    }
  }

  return v5;
}

- (id)_createShareeFromRecipient:(id)a3
{
  id v3 = a3;
  if (![v3 kind])
  {
    double v11 = (void *)MEMORY[0x1E4F25610];
    id v5 = [v3 displayString];
    id v6 = [v3 address];
    double v7 = v11;
    double v8 = v5;
    double v9 = v6;
    double v10 = 0;
    goto LABEL_5;
  }
  if ([v3 kind] == 1)
  {
    id v4 = (void *)MEMORY[0x1E4F25610];
    id v5 = IdentityNameFromRecipient(v3);
    id v6 = [v3 normalizedAddress];
    double v7 = v4;
    double v8 = v5;
    double v9 = 0;
    double v10 = v6;
LABEL_5:
    v12 = 0;
LABEL_6:
    v13 = [v7 shareeWithName:v8 emailAddress:v9 phoneNumber:v10 externalID:v12];

    goto LABEL_7;
  }
  if ([v3 kind] == 4)
  {
    objc_super v15 = (void *)MEMORY[0x1E4F25610];
    id v5 = [v3 displayString];
    id v6 = [v3 address];
    double v7 = v15;
    double v8 = v5;
    double v9 = 0;
    double v10 = 0;
    v12 = v6;
    goto LABEL_6;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

- (id)_recipientFromSharee:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(EKShareePickerViewController *)self _createRecipientFromSharee:v4];
    objc_setAssociatedObject(v5, &shareeKey, v4, (void *)0x301);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_createRecipientFromSharee:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contactPredicate];
  id v5 = [MEMORY[0x1E4F576B0] defaultProvider];
  id v6 = [getCNComposeRecipientClass_0() descriptorsForRequiredKeysForContact];
  double v7 = [v5 unifiedContactsMatchingPredicate:v4 keysToFetch:v6];

  double v8 = [v7 firstObject];
  double v9 = [v3 emailAddress];

  if (v9)
  {
    id v10 = objc_alloc((Class)getCNComposeRecipientClass_0());
    double v11 = [v3 emailAddress];
    v12 = v10;
    v13 = v8;
    v14 = v11;
    uint64_t v15 = 0;
  }
  else
  {
    v16 = [v3 phoneNumber];

    if (!v16) {
      goto LABEL_6;
    }
    id v17 = objc_alloc((Class)getCNComposeRecipientClass_0());
    double v11 = [v3 phoneNumber];
    v12 = v17;
    v13 = v8;
    v14 = v11;
    uint64_t v15 = 1;
  }
  v16 = (void *)[v12 initWithContact:v13 address:v14 kind:v15];

LABEL_6:
  if (v8)
  {
    v18 = [v8 CalDisplayName];
    [v16 setDisplayString:v18];
  }

  return v16;
}

- (NSArray)sharees
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(EKEventAttendeePicker *)self->_picker recipients];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[EKShareePickerViewController _shareeFromRecipient:](self, "_shareeFromRecipient:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)setSharees:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = -[EKShareePickerViewController _recipientFromSharee:](self, "_recipientFromSharee:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(EKEventAttendeePicker *)self->_picker setRecipients:v5];
}

- (CGSize)preferredContentSize
{
  double v3 = EKUIContainedControllerIdealWidth();
  id v4 = [(EKShareePickerViewController *)self view];
  objc_msgSend(v4, "sizeThatFits:", v3, 1100.0);
  double v6 = v5;

  double v7 = v3;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (void)setShouldSuggestFamilySharees:(BOOL)a3
{
}

- (BOOL)shouldSuggestFamilySharees
{
  return [(EKEventAttendeePicker *)self->_picker shouldSuggestFamilySharees];
}

- (void)setFilterOutFamilySharees:(id)a3
{
}

- (NSArray)filterOutFamilySharees
{
  return [(EKEventAttendeePicker *)self->_picker filterOutFamilySharees];
}

- (void)eventAttendeePicker:(id)a3 cacheValidationStatus:(unint64_t)a4 forAddress:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v9 = [WeakRetained eventStoreForShareePickerViewController:self];
  [v9 cacheValidationStatusForAddress:v8 status:a4];
}

- (unint64_t)eventAttendeePicker:(id)a3 getValidationStatusForAddress:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v8 = [WeakRetained eventStoreForShareePickerViewController:self];
  unint64_t v9 = [v8 addressValidationStatus:v6];

  return v9;
}

- (EKShareePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKShareePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_picker, 0);
}

@end