@interface EKUIEmailCompositionManager
+ (BOOL)canShowViewControllerForEvent:(id)a3 withParticipantRecipients:(id)a4;
+ (id)_recipientEmailAddressesToDisplayNames:(id)a3 withParticipantRecipients:(id)a4;
- (EKEvent)event;
- (EKUIEmailCompositionManager)initWithEvent:(id)a3;
- (EKUIEmailCompositionManager)initWithEvent:(id)a3 participantRecipients:(id)a4 subjectPrefix:(id)a5 bodyPrefix:(id)a6;
- (MFMailComposeViewController)composeViewController;
- (id)_htmlBodyForMailMessageWithNames:(id)a3;
- (id)messageSendingComplete;
- (void)initViewController;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setComposeViewController:(id)a3;
- (void)setEvent:(id)a3;
- (void)setMessageSendingComplete:(id)a3;
@end

@implementation EKUIEmailCompositionManager

- (EKUIEmailCompositionManager)initWithEvent:(id)a3 participantRecipients:(id)a4 subjectPrefix:(id)a5 bodyPrefix:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EKUIEmailCompositionManager;
  v15 = [(EKUIEmailCompositionManager *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_event, a3);
    objc_storeStrong((id *)&v16->_participantRecipients, a4);
    objc_storeStrong((id *)&v16->_subjectPrefix, a5);
    objc_storeStrong((id *)&v16->_bodyPrefix, a6);
    [(EKUIEmailCompositionManager *)v16 initViewController];
  }

  return v16;
}

- (EKUIEmailCompositionManager)initWithEvent:(id)a3
{
  return [(EKUIEmailCompositionManager *)self initWithEvent:a3 participantRecipients:0 subjectPrefix:0 bodyPrefix:0];
}

+ (BOOL)canShowViewControllerForEvent:(id)a3 withParticipantRecipients:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v14 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = 0;
      v15 = "No event given.  Will not determine whether this view controller should be shown.";
      v16 = (uint8_t *)&v19;
LABEL_11:
      _os_log_impl(&dword_1B3F4C000, v14, OS_LOG_TYPE_DEBUG, v15, v16, 2u);
    }
LABEL_12:
    BOOL v13 = 0;
    goto LABEL_13;
  }
  v7 = [MEMORY[0x1E4F57B18] sharedInstance];
  v8 = [v5 calendar];
  v9 = [v8 source];
  int v10 = [v7 sourceIsManaged:v9];

  if (v10) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  if (([(objc_class *)+[CalendarMessageUIProxy MFMailComposeViewControllerClass] canSendMailSourceAccountManagement:v11] & 1) == 0)
  {
    id v14 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = 0;
      v15 = "Cannot send mail, so this view shouldn't be shown.";
      v16 = (uint8_t *)&v18;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v12 = [(id)objc_opt_class() _recipientEmailAddressesToDisplayNames:v5 withParticipantRecipients:v6];
  BOOL v13 = [v12 count] != 0;

LABEL_13:
  return v13;
}

- (void)initViewController
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() _recipientEmailAddressesToDisplayNames:self->_event withParticipantRecipients:self->_participantRecipients];
  v4 = [(id)objc_opt_class() _recipientEmailAddressesToDisplayNames:self->_event withParticipantRecipients:0];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __49__EKUIEmailCompositionManager_initViewController__block_invoke;
  v36[3] = &unk_1E6087EE0;
  id v7 = v5;
  id v37 = v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v36];
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __49__EKUIEmailCompositionManager_initViewController__block_invoke_2;
  v34 = &unk_1E6087EE0;
  id v8 = v6;
  id v35 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:&v31];
  v9 = [MEMORY[0x1E4F57B18] sharedInstance];
  int v10 = [(EKEvent *)self->_event calendar];
  uint64_t v11 = [v10 source];
  int v12 = [v9 sourceIsManaged:v11];

  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  id v14 = (MFMailComposeViewController *)objc_msgSend(objc_alloc(+[CalendarMessageUIProxy MFMailComposeViewControllerClass](CalendarMessageUIProxy, "MFMailComposeViewControllerClass")), "initWithURL:sourceAccountManagement:", 0, v13);
  composeViewController = self->_composeViewController;
  self->_composeViewController = v14;

  [(MFMailComposeViewController *)self->_composeViewController setMailComposeDelegate:self];
  [(MFMailComposeViewController *)self->_composeViewController setToRecipients:v7];
  v16 = [(EKEvent *)self->_event selfAttendee];
  v17 = [v16 emailAddress];

  if (v17)
  {
    __int16 v18 = self->_composeViewController;
    __int16 v19 = [(EKEvent *)self->_event selfAttendee];
    v20 = [v19 emailAddress];
    [(MFMailComposeViewController *)v18 setPreferredSendingEmailAddress:v20];
  }
  if ([(EKEvent *)self->_event isSelfOrganized])
  {
    v21 = [(EKEvent *)self->_event organizer];

    if (v21)
    {
      v22 = self->_composeViewController;
      v23 = [(EKEvent *)self->_event organizer];
      v24 = [v23 emailAddress];
      [(MFMailComposeViewController *)v22 setPreferredSendingEmailAddress:v24];
    }
  }
  subjectPrefix = self->_subjectPrefix;
  if (subjectPrefix)
  {
    v26 = NSString;
    v27 = [(EKEvent *)self->_event title];
    v28 = [v26 stringWithFormat:@"%@ %@", subjectPrefix, v27, v31, v32, v33, v34];
    [(MFMailComposeViewController *)self->_composeViewController setSubject:v28];
  }
  else
  {
    v27 = [(EKEvent *)self->_event title];
    [(MFMailComposeViewController *)self->_composeViewController setSubject:v27];
  }

  v29 = [(EKUIEmailCompositionManager *)self _htmlBodyForMailMessageWithNames:v8];
  [(MFMailComposeViewController *)self->_composeViewController setMessageBody:v29 isHTML:1];
  v30 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v29;
    _os_log_impl(&dword_1B3F4C000, v30, OS_LOG_TYPE_DEBUG, "Applied HTML message body: [%@]", buf, 0xCu);
  }
}

uint64_t __49__EKUIEmailCompositionManager_initViewController__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __49__EKUIEmailCompositionManager_initViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 3)
  {
    int v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "Mail compose controller failed to send result: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v11 = [(EKUIEmailCompositionManager *)self messageSendingComplete];

  int v12 = kEKUILogHandle;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_DEFAULT, "Notify of composition completion.", (uint8_t *)&v14, 2u);
    }
    uint64_t v13 = [(EKUIEmailCompositionManager *)self messageSendingComplete];
    ((void (**)(void, BOOL))v13)[2](v13, a4 == 2);
  }
  else if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_ERROR, "No 'messageSendingComplete' block provided.  Will not notify of completion.", (uint8_t *)&v14, 2u);
  }
}

+ (id)_recipientEmailAddressesToDisplayNames:(id)a3 withParticipantRecipients:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (![v6 count])
  {
    id v7 = +[EKUICommunicationUtilities attendeesIgnoringMe:v5];
  }
  uint64_t v8 = [v7 count];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  int v10 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_DEBUG, "Generating a mapping between recipient email addresses and display names.", buf, 2u);
  }
  int v14 = v7;
  id v15 = v9;
  id v11 = v7;
  CalendarFoundationPerformBlockOnSharedContactStore();
  id v12 = v15;

  return v12;
}

void __96__EKUIEmailCompositionManager__recipientEmailAddressesToDisplayNames_withParticipantRecipients___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v30;
    uint64_t v26 = *MEMORY[0x1E4F1ADC8];
    unint64_t v6 = 0x1E4F1B000uLL;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v9 = [v8 emailAddress];
        int v10 = [v8 name];
        if (v10)
        {
          if (v9) {
            goto LABEL_19;
          }
        }
        else
        {
          id v11 = [*(id *)(v6 + 2320) descriptorForRequiredKeysForStyle:0];
          v34 = v11;
          id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];

          uint64_t v13 = [v8 contactPredicate];
          int v14 = [v28 unifiedContactsMatchingPredicate:v13 keysToFetch:v12 error:0];

          if ([v14 count])
          {
            id v15 = *(void **)(v6 + 2320);
            uint64_t v16 = [v14 objectAtIndexedSubscript:0];
            int v10 = [v15 stringFromContact:v16 style:0];

            unint64_t v6 = 0x1E4F1B000;
          }
          else
          {
            int v10 = 0;
          }

          if (v9)
          {
LABEL_19:
            if (v10) {
              v25 = v10;
            }
            else {
              v25 = (void *)v9;
            }
            [*(id *)(a1 + 40) setObject:v25 forKey:v9];
            v17 = (void *)v9;
            goto LABEL_23;
          }
        }
        uint64_t v33 = v26;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        __int16 v18 = [v8 contactPredicate];
        __int16 v19 = [v28 unifiedContactsMatchingPredicate:v18 keysToFetch:v17 error:0];

        if (![v19 count])
        {

LABEL_23:
          goto LABEL_24;
        }
        v20 = [v19 objectAtIndexedSubscript:0];
        v21 = [v20 emailAddresses];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          v23 = [v20 emailAddresses];
          v24 = [v23 objectAtIndexedSubscript:0];

          uint64_t v9 = [v24 value];
        }
        else
        {
          uint64_t v9 = 0;
        }
        unint64_t v6 = 0x1E4F1B000;

        if (v9) {
          goto LABEL_19;
        }
LABEL_24:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v4);
  }
}

- (id)_htmlBodyForMailMessageWithNames:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v5 appendString:@"<br><br>"];
  if (self->_bodyPrefix) {
    objc_msgSend(v5, "appendString:");
  }
  [v5 appendString:@"<br><br>"];
  unint64_t v6 = [(EKEvent *)self->_event title];
  [v5 appendFormat:@"<b>%@</b><br>", v6];

  id v7 = [MEMORY[0x1E4F57B70] sharedGenerator];
  uint64_t v8 = [v7 dateStringRepresentationForEvent:self->_event];

  if (v8) {
    [v5 appendFormat:@"%@<br>", v8];
  }
  uint64_t v9 = [(EKEvent *)self->_event locationWithoutPrediction];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    id v11 = NSString;
    id v12 = EventKitUIBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"Location: %@" value:&stru_1F0CC2140 table:0];
    int v14 = [(EKEvent *)self->_event locationWithoutPrediction];
    id v15 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v14);
    [v5 appendFormat:@"%@<br>", v15];
  }
  uint64_t v16 = [(EKEvent *)self->_event virtualConference];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F57B70] sharedGenerator];
    __int16 v18 = [v17 virtualConferenceEmailHTMLRepresentation:self->_event];
    [v5 appendString:v18];
  }
  if ([v4 count])
  {
    __int16 v19 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    v20 = objc_msgSend(v4, "mf_commaSeparatedRecipientListWithWidth:forFont:", v19, 1.79769313e308);

    v21 = NSString;
    uint64_t v22 = EventKitUIBundle();
    v23 = [v22 localizedStringForKey:@"Invitees: %@" value:&stru_1F0CC2140 table:0];
    v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);
    [v5 appendFormat:@"%@", v24];
  }

  return v5;
}

- (id)messageSendingComplete
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setMessageSendingComplete:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (MFMailComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setComposeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong(&self->_messageSendingComplete, 0);
  objc_storeStrong((id *)&self->_bodyPrefix, 0);
  objc_storeStrong((id *)&self->_subjectPrefix, 0);

  objc_storeStrong((id *)&self->_participantRecipients, 0);
}

@end