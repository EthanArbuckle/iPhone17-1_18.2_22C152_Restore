@interface EKEventAttendeesEditViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)appendOnly;
- (BOOL)canManagePresentationStyle;
- (BOOL)disableShowingButtons;
- (BOOL)editItemShouldBeAskedForInjectableViewController;
- (BOOL)isModalInPresentation;
- (BOOL)prefersToBePresentedFromUINavigationController;
- (BOOL)presentModally;
- (BOOL)validateEmailWithString:(id)a3;
- (BOOL)wantsManagement;
- (EKEventAttendeesEditViewController)initWithFrame:(CGRect)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6;
- (NSArray)attendees;
- (id)_attendeeFromRecipient:(id)a3;
- (id)_createAttendeeFromRecipient:(id)a3;
- (id)_createRecipientFromAttendee:(id)a3;
- (id)_firstInvalidRecipientAddress;
- (id)_recipientFromAttendee:(id)a3;
- (void)_cancelTapped:(id)a3;
- (void)setAppendOnly:(BOOL)a3;
- (void)setAttendees:(id)a3;
- (void)setDisableShowingButtons:(BOOL)a3;
- (void)setSearchAccountID:(id)a3;
- (void)validateAllowingAlert:(BOOL)a3 callback:(id)a4;
- (void)viewDidLoad;
@end

@implementation EKEventAttendeesEditViewController

- (EKEventAttendeesEditViewController)initWithFrame:(CGRect)a3 event:(id)a4 overriddenEventStartDate:(id)a5 overriddenEventEndDate:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)EKEventAttendeesEditViewController;
  v17 = -[EKEditItemViewController initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_event, a4);
    v19 = -[EKEventAttendeePicker initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:]([EKEventAttendeePicker alloc], "initWithFrame:event:calendar:overriddenEventStartDate:overriddenEventEndDate:", v14, 0, v15, v16, x, y, width, height);
    picker = v18->_picker;
    v18->_picker = v19;

    if (![(EKEventAttendeesEditViewController *)v18 disableShowingButtons])
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v18 action:sel__cancelTapped_];
      v22 = [(EKEventAttendeesEditViewController *)v18 navigationItem];
      [v22 setLeftBarButtonItem:v21];

      v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v18 action:sel__doneTapped_];
      v24 = [(EKEventAttendeesEditViewController *)v18 navigationItem];
      [v24 setRightBarButtonItem:v23];
    }
    [(EKEventAttendeesEditViewController *)v18 addChildViewController:v18->_picker];
    [(EKEventAttendeePicker *)v18->_picker didMoveToParentViewController:v18];
    v25 = EventKitUIBundle();
    v26 = [v25 localizedStringForKey:@"Title - Add Invitees" value:@"Add Invitees" table:0];
    [(EKEventAttendeesEditViewController *)v18 setTitle:v26];
  }
  return v18;
}

- (void)setSearchAccountID:(id)a3
{
}

- (BOOL)prefersToBePresentedFromUINavigationController
{
  return 1;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)_cancelTapped:(id)a3
{
  self->_cancelTapped = 1;
  [(EKEditItemViewController *)self cancel];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)EKEventAttendeesEditViewController;
  [(EKEditItemViewController *)&v16 viewDidLoad];
  v3 = [(EKEventAttendeesEditViewController *)self view];
  v4 = [(EKEventAttendeePicker *)self->_picker view];
  [v3 addSubview:v4];

  v5 = [(EKEventAttendeePicker *)self->_picker view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(EKEventAttendeePicker *)self->_picker view];
  v7 = _NSDictionaryOfVariableBindings(&cfstr_Pickerview.isa, v6, 0);
  v8 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v9 = MEMORY[0x1E4F1CC08];
  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[pickerView]|" options:0 metrics:MEMORY[0x1E4F1CC08] views:v7];
  [v8 activateConstraints:v10];

  v11 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[pickerView]|" options:0 metrics:v9 views:v7];
  [v11 activateConstraints:v12];

  p_editDelegate = &self->super._editDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_editDelegate);
  LOBYTE(v12) = objc_opt_respondsToSelector();

  if (v12)
  {
    id v15 = objc_loadWeakRetained((id *)p_editDelegate);
    [v15 editItemViewControllerWantsKeyboardPinned:1];
  }
}

- (BOOL)isModalInPresentation
{
  return [(EKEventAttendeePicker *)self->_picker hasChanges];
}

- (BOOL)validateEmailWithString:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = a3;
  v5 = [v3 predicateWithFormat:@"SELF MATCHES %@", @"[A-Z0-9a-z._%+'-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"];
  char v6 = [v5 evaluateWithObject:v4];

  return v6;
}

- (id)_firstInvalidRecipientAddress
{
  v2 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(EKEventAttendeePicker *)self->_picker recipients];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    unint64_t v7 = 0x1E9CF6000uLL;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v21 = v5;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        if ([v9 kind])
        {
          int v10 = 0;
        }
        else
        {
          v11 = [v9 uncommentedAddress];
          int v10 = ![(EKEventAttendeesEditViewController *)v2 validateEmailWithString:v11];
        }
        if ([v9 kind] == 1)
        {
          uint64_t v12 = [*(id *)((char *)&v2->super.super.super.super.isa + *(int *)(v7 + 2652)) calendar];
          v13 = [v12 constraints];
          if ([v13 supportsPhoneNumbers])
          {
            [v9 normalizedAddress];
            uint64_t v14 = v6;
            id v15 = v2;
            v17 = id v16 = v3;
            int v18 = objc_msgSend(v17, "cal_isPhoneNumber") ^ 1;

            id v3 = v16;
            v2 = v15;
            uint64_t v6 = v14;
            unint64_t v7 = 0x1E9CF6000;
          }
          else
          {
            int v18 = 1;
          }

          uint64_t v5 = v21;
        }
        else
        {
          int v18 = 0;
        }
        if ((v10 | v18) == 1)
        {
          v19 = [v9 uncommentedAddress];
          goto LABEL_20;
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (void)validateAllowingAlert:(BOOL)a3 callback:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = a4;
  [(EKEventAttendeePicker *)self->_picker commitRemainingText];
  unint64_t v7 = [(EKEventAttendeesEditViewController *)self _firstInvalidRecipientAddress];
  uint64_t v8 = [(EKEvent *)self->_event calendar];
  uint64_t v9 = [v8 maxAttendees];

  if (v9 < 1)
  {
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    int v10 = [(EKEventAttendeePicker *)self->_picker recipients];
    uint64_t v11 = [v10 count];

    if (!v7)
    {
      if (v11 + 1 > (unint64_t)v9)
      {
        if (v4)
        {
          v44 = (void *)MEMORY[0x1E4FB1418];
          v46 = EventKitUIBundle();
          v43 = [v46 localizedStringForKey:@"Too Many Invitees" value:&stru_1F0CC2140 table:0];
          uint64_t v12 = NSString;
          v45 = EventKitUIBundle();
          v13 = [v45 localizedStringForKey:@"This event has %ld invitees but this account only supports %ld invitees. The server will not accept events with too many invitees. Do you want to continue editing the invitees or attempt to save the event anyway?" value:&stru_1F0CC2140 table:0];
          uint64_t v14 = [(EKEventAttendeePicker *)self->_picker recipients];
          uint64_t v15 = [v14 count] + 1;
          id v16 = [(EKEvent *)self->_event calendar];
          v17 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v15, objc_msgSend(v16, "maxAttendees"));
          int v18 = [v44 alertControllerWithTitle:v43 message:v17 preferredStyle:1];

          v19 = (void *)MEMORY[0x1E4FB1410];
          v20 = EventKitUIBundle();
          uint64_t v21 = [v20 localizedStringForKey:@"Edit" value:&stru_1F0CC2140 table:0];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke;
          v50[3] = &unk_1E6088E68;
          long long v22 = v6;
          id v51 = v22;
          BOOL v52 = v4;
          long long v23 = [v19 actionWithTitle:v21 style:1 handler:v50];
          [v18 addAction:v23];

          long long v24 = (void *)MEMORY[0x1E4FB1410];
          long long v25 = EventKitUIBundle();
          v26 = [v25 localizedStringForKey:@"Continue" value:&stru_1F0CC2140 table:0];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke_2;
          v47[3] = &unk_1E6088E68;
          v48 = v22;
          BOOL v49 = v4;
          uint64_t v27 = [v24 actionWithTitle:v26 style:0 handler:v47];
          [v18 addAction:v27];

          [(EKEventAttendeesEditViewController *)self presentViewController:v18 animated:1 completion:0];
          goto LABEL_12;
        }
        v41 = (void (*)(void *, uint64_t, uint64_t))v6[2];
        v42 = v6;
        uint64_t v40 = 1;
LABEL_11:
        v41(v42, v40, 1);
        goto LABEL_12;
      }
LABEL_10:
      uint64_t v40 = !v4;
      v41 = (void (*)(void *, uint64_t, uint64_t))v6[2];
      v42 = v6;
      goto LABEL_11;
    }
  }
  if (v4)
  {
    objc_super v28 = (void *)MEMORY[0x1E4FB1418];
    v29 = EventKitUIBundle();
    v30 = [v29 localizedStringForKey:@"Cannot Send Invitation" value:&stru_1F0CC2140 table:0];
    v31 = NSString;
    v32 = EventKitUIBundle();
    v33 = [v32 localizedStringForKey:@"“%@” does not appear to be a valid email address." value:&stru_1F0CC2140 table:0];
    v34 = objc_msgSend(v31, "localizedStringWithFormat:", v33, v7);
    v35 = [v28 alertControllerWithTitle:v30 message:v34 preferredStyle:1];

    v36 = (void *)MEMORY[0x1E4FB1410];
    v37 = EventKitUIBundle();
    v38 = [v37 localizedStringForKey:@"OK" value:&stru_1F0CC2140 table:0];
    v39 = [v36 actionWithTitle:v38 style:1 handler:0];
    [v35 addAction:v39];

    [(EKEventAttendeesEditViewController *)self presentViewController:v35 animated:1 completion:0];
  }
  ((void (*)(void *, BOOL, void))v6[2])(v6, !v4, 0);
LABEL_12:
}

uint64_t __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0, 0);
}

uint64_t __69__EKEventAttendeesEditViewController_validateAllowingAlert_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) == 0, 1);
}

- (id)_attendeeFromRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_getAssociatedObject(v4, &kEKUI_CNComposeReciepentParticipantKey);
  if (!v5)
  {
    uint64_t v5 = [v4 address];

    if (v5)
    {
      uint64_t v5 = [(EKEventAttendeesEditViewController *)self _createAttendeeFromRecipient:v4];
    }
  }
  uint64_t v6 = [(EKEvent *)self->_event calendar];
  unint64_t v7 = [v6 ownerIdentityAddress];

  uint64_t v8 = [v5 URL];
  uint64_t v9 = v8;
  if (v8 && v7)
  {
    int v10 = [v5 URL];
    char v11 = [v10 CDVIsEqualToURL:v7];

    if (v11)
    {
      id v12 = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v12 = v5;
LABEL_10:

  return v12;
}

- (id)_createAttendeeFromRecipient:(id)a3
{
  id v3 = a3;
  id v4 = [v3 displayString];
  uint64_t v5 = [v4 length];

  if (v5) {
    [v3 displayString];
  }
  else {
  uint64_t v6 = [v3 compositeName];
  }
  if ([v3 kind] == 4)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F254A0];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v9 = [v3 normalizedAddress];
    int v10 = [v8 URLWithString:v9];
    uint64_t v11 = [v7 attendeeWithName:v6 url:v10];
LABEL_9:
    v13 = (void *)v11;

LABEL_11:
    goto LABEL_12;
  }
  if (![v3 kind])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F254A0];
    uint64_t v9 = [v3 address];
    v13 = [v14 attendeeWithName:v6 emailAddress:v9];
    goto LABEL_11;
  }
  if ([v3 kind] == 1)
  {
    id v12 = (void *)MEMORY[0x1E4F254A0];
    uint64_t v9 = IdentityNameFromRecipient(v3);
    int v10 = [v3 normalizedAddress];
    uint64_t v11 = [v12 attendeeWithName:v9 phoneNumber:v10];
    goto LABEL_9;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (id)_recipientFromAttendee:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(EKEventAttendeesEditViewController *)self _createRecipientFromAttendee:v4];
    objc_setAssociatedObject(v5, &kEKUI_CNComposeReciepentParticipantKey, v4, (void *)0x301);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_createRecipientFromAttendee:(id)a3
{
  id v3 = a3;
  id v4 = [v3 contactPredicate];
  uint64_t v5 = [MEMORY[0x1E4F576B0] defaultProvider];
  uint64_t v6 = [getCNComposeRecipientClass() descriptorsForRequiredKeysForContact];
  unint64_t v7 = [v5 unifiedContactsMatchingPredicate:v4 keysToFetch:v6];

  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v3 emailAddress];

  if (v9)
  {
    id v10 = objc_alloc((Class)getCNComposeRecipientClass());
    uint64_t v11 = [v3 emailAddress];
    id v12 = v10;
    v13 = v8;
    uint64_t v14 = v11;
    uint64_t v15 = 0;
LABEL_5:
    int v18 = (void *)[v12 initWithContact:v13 address:v14 kind:v15];
    goto LABEL_6;
  }
  id v16 = [v3 phoneNumber];

  if (v16)
  {
    id v17 = objc_alloc((Class)getCNComposeRecipientClass());
    uint64_t v11 = [v3 phoneNumber];
    id v12 = v17;
    v13 = v8;
    uint64_t v14 = v11;
    uint64_t v15 = 1;
    goto LABEL_5;
  }
  uint64_t v21 = [v3 URL];
  int v22 = objc_msgSend(v21, "cal_hasSchemeMailto");

  if (v22)
  {
    id v23 = objc_alloc((Class)getCNComposeRecipientClass());
    uint64_t v11 = [v3 URL];
    uint64_t v24 = [v11 resourceSpecifier];
LABEL_16:
    objc_super v28 = (void *)v24;
    v29 = v23;
    v30 = v8;
    v31 = v28;
    uint64_t v32 = 0;
    goto LABEL_17;
  }
  long long v25 = [v3 URL];
  int v26 = objc_msgSend(v25, "cal_hasSchemeTel");

  id v23 = objc_alloc((Class)getCNComposeRecipientClass());
  uint64_t v27 = [v3 URL];
  uint64_t v11 = v27;
  if (!v26)
  {
    uint64_t v24 = [v27 absoluteString];
    goto LABEL_16;
  }
  objc_super v28 = [v27 resourceSpecifier];
  v29 = v23;
  v30 = v8;
  v31 = v28;
  uint64_t v32 = 1;
LABEL_17:
  int v18 = (void *)[v29 initWithContact:v30 address:v31 kind:v32];

LABEL_6:
  if (v8)
  {
    v19 = [v8 CalDisplayName];
    [v18 setDisplayString:v19];
  }

  return v18;
}

- (NSArray)attendees
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
        id v10 = -[EKEventAttendeesEditViewController _attendeeFromRecipient:](self, "_attendeeFromRecipient:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
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

- (void)setAttendees:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [(EKEventAttendeesEditViewController *)self _recipientFromAttendee:v12];
        if (v13)
        {
          [v5 addObject:v13];
          [v6 setObject:v12 forKey:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__EKEventAttendeesEditViewController_setAttendees___block_invoke;
  v15[3] = &unk_1E6088E90;
  id v16 = v6;
  id v14 = v6;
  [v5 sortUsingComparator:v15];
  [(EKEventAttendeePicker *)self->_picker setRecipients:v5];
}

uint64_t __51__EKEventAttendeesEditViewController_setAttendees___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKey:v5];
  uint64_t v8 = [v7 participantRole];

  uint64_t v9 = [*(id *)(a1 + 32) objectForKey:v6];
  uint64_t v10 = [v9 participantRole];

  if (v8 != 2 || v10 == 2)
  {
    if (v8 != 2 && v10 == 2)
    {
      uint64_t v15 = -1;
    }
    else
    {
      long long v13 = [v5 address];
      id v14 = [v6 address];
      uint64_t v15 = [v13 compare:v14];
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

- (BOOL)presentModally
{
  return 1;
}

- (BOOL)editItemShouldBeAskedForInjectableViewController
{
  if (self->_cancelTapped) {
    return 0;
  }
  id v3 = [(EKEventAttendeePicker *)self->_picker recipients];
  BOOL v2 = [v3 count] != 0;

  return v2;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)disableShowingButtons
{
  return self->_disableShowingButtons;
}

- (void)setDisableShowingButtons:(BOOL)a3
{
  self->_disableShowingButtons = a3;
}

- (BOOL)appendOnly
{
  return self->_appendOnly;
}

- (void)setAppendOnly:(BOOL)a3
{
  self->_appendOnldouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_picker, 0);
}

@end