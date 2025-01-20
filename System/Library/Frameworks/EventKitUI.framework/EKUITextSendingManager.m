@interface EKUITextSendingManager
+ (BOOL)canSendMessageToRecipientsOnEvent:(id)a3;
+ (BOOL)messagingAvailable;
+ (id)addressesForRecipientsOnEvent:(id)a3;
+ (void)getPhone:(id *)a3 andEmail:(id *)a4 forContact:(id)a5;
- (EKUITextSendingManager)initWithEvent:(id)a3;
- (UIViewController)viewController;
- (id)messageSendingComplete;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
- (void)setMessageSendingComplete:(id)a3;
- (void)setupControllerWithAddresses:(id)a3;
@end

@implementation EKUITextSendingManager

+ (void)getPhone:(id *)a3 andEmail:(id *)a4 forContact:(id)a5
{
  id v7 = a5;
  id v17 = v7;
  if (a3)
  {
    v8 = [v7 phoneNumbers];
    uint64_t v9 = [v8 count];

    id v7 = v17;
    if (v9)
    {
      v10 = [v17 phoneNumbers];
      v11 = [v10 objectAtIndexedSubscript:0];

      v12 = [v11 value];
      *a3 = [v12 stringValue];

      id v7 = v17;
    }
  }
  if (a4)
  {
    v13 = [v17 emailAddresses];
    uint64_t v14 = [v13 count];

    id v7 = v17;
    if (v14)
    {
      v15 = [v17 emailAddresses];
      v16 = [v15 objectAtIndexedSubscript:0];

      *a4 = [v16 value];

      id v7 = v17;
    }
  }
}

+ (id)addressesForRecipientsOnEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v6 = +[EKUICommunicationUtilities attendeesIgnoringMe:v4];

  id v10 = v5;
  id v7 = v6;
  CalendarFoundationPerformBlockOnSharedContactStore();
  id v8 = v10;

  return v8;
}

void __56__EKUITextSendingManager_addressesForRecipientsOnEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    uint64_t v20 = *MEMORY[0x1E4F1AEE0];
    uint64_t v19 = *MEMORY[0x1E4F1ADC8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * v6);
        id v8 = objc_msgSend(v7, "phoneNumber", v19, v20);
        uint64_t v9 = [v7 emailAddress];
        if (v9) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10) {
          goto LABEL_14;
        }
        v29[0] = v20;
        v29[1] = v19;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
        v12 = [v7 contactPredicate];
        v13 = [v21 unifiedContactsMatchingPredicate:v12 keysToFetch:v11 error:0];

        if ([v13 count])
        {
          uint64_t v14 = [v13 objectAtIndexedSubscript:0];
          v15 = *(void **)(a1 + 48);
          id v23 = v9;
          id v24 = v8;
          [v15 getPhone:&v24 andEmail:&v23 forContact:v14];
          id v16 = v24;

          id v17 = v23;
          uint64_t v9 = v17;
          id v8 = v16;
        }

        if (v8)
        {
LABEL_14:
          [*(id *)(a1 + 40) addObject:v8];

          uint64_t v9 = v8;
LABEL_15:

          goto LABEL_16;
        }
        if (v9)
        {
          [*(id *)(a1 + 40) addObject:v9];
          goto LABEL_15;
        }
LABEL_16:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      uint64_t v4 = v18;
    }
    while (v18);
  }
}

+ (BOOL)messagingAvailable
{
  v2 = [(id)EKWeakLinkClass() defaultCapabilitiesManager];
  char v3 = [v2 isMadridConfigured];

  return v3;
}

+ (BOOL)canSendMessageToRecipientsOnEvent:(id)a3
{
  id v4 = a3;
  if ([v4 hasAttendees] && objc_msgSend(a1, "messagingAvailable"))
  {
    uint64_t v5 = [a1 addressesForRecipientsOnEvent:v4];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (EKUITextSendingManager)initWithEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKUITextSendingManager;
  uint64_t v5 = [(EKUITextSendingManager *)&v8 init];
  if (v5)
  {
    BOOL v6 = [(id)objc_opt_class() addressesForRecipientsOnEvent:v4];
    [(EKUITextSendingManager *)v5 setupControllerWithAddresses:v6];
  }
  return v5;
}

- (void)setupControllerWithAddresses:(id)a3
{
  id v6 = a3;
  id v4 = (MFMessageComposeViewController *)objc_alloc_init(+[CalendarMessageUIProxy MFMessageComposeViewControllerClass]);
  composeViewController = self->_composeViewController;
  self->_composeViewController = v4;

  [(MFMessageComposeViewController *)self->_composeViewController setMessageComposeDelegate:self];
  [(MFMessageComposeViewController *)self->_composeViewController setRecipients:v6];
}

- (UIViewController)viewController
{
  return (UIViewController *)self->_composeViewController;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6 = [(EKUITextSendingManager *)self messageSendingComplete];

  if (v6)
  {
    id v7 = [(EKUITextSendingManager *)self messageSendingComplete];
    v7[2](v7, a4 == 1);
  }
}

- (id)messageSendingComplete
{
  return self->_messageSendingComplete;
}

- (void)setMessageSendingComplete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageSendingComplete, 0);

  objc_storeStrong((id *)&self->_composeViewController, 0);
}

@end