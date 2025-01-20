@interface FAInviteContext
- (BOOL)canEditRecipients;
- (FAInviteContext)initWithResults:(id)a3;
- (NSArray)invitees;
- (NSString)action;
- (NSString)eventType;
- (NSString)mailLinkSubtitle;
- (NSString)mailLinkTitle;
- (NSString)mailMessageBodyHTML;
- (NSString)mailMessageSubject;
- (NSString)messageBubbleAppleIDSettingsLinkLabel;
- (NSString)messageBubbleFamilySettingsLinkLabel;
- (NSString)messageBubbleInviteAcceptButtonLabel;
- (NSString)messageBubbleInviteAcceptedIcon;
- (NSString)messageBubbleInviteAcceptedSubTitleReceiver;
- (NSString)messageBubbleInviteAcceptedSubTitleSender;
- (NSString)messageBubbleInviteAcceptedTitleReceiver;
- (NSString)messageBubbleInviteAcceptedTitleSender;
- (NSString)messageBubbleInviteDeclineAlertSheetMessage;
- (NSString)messageBubbleInviteDeclineAlertSheetTitle;
- (NSString)messageBubbleInviteDeclineButtonLabel;
- (NSString)messageBubbleInviteDeclinedIcon;
- (NSString)messageBubbleInviteDeclinedSubTitleReceiver;
- (NSString)messageBubbleInviteDeclinedSubTitleSender;
- (NSString)messageBubbleInviteDeclinedTitleReceiver;
- (NSString)messageBubbleInviteDeclinedTitleSender;
- (NSString)messageBubbleInviteExpiredIcon;
- (NSString)messageBubbleInviteExpiredSubTitleReceiver;
- (NSString)messageBubbleInviteExpiredSubTitleSender;
- (NSString)messageBubbleInviteExpiredTitleReceiver;
- (NSString)messageBubbleInviteExpiredTitleSender;
- (NSString)messageBubbleInviteLoadingLabel;
- (NSString)messageBubbleInvitePendingIcon;
- (NSString)messageBubbleInvitePendingSubTitle;
- (NSString)messageBubbleInvitePendingTitle;
- (NSString)messageBubbleLearnMoreLinkLabel;
- (NSString)messageBubbleSubTitle;
- (NSString)messageBubbleSubTitleTeen;
- (NSString)messageBubbleSubscriptionsList;
- (NSString)messageBubbleTitle;
- (NSString)messageBubbleViewInvitationButtonLabel;
- (NSString)overlaidTextColorString;
- (NSString)secondaryTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)iconURL;
- (NSURL)imageURL;
- (NSURL)inviteURL;
- (NSURL)messageBubbleAcceptInviteURL;
- (NSURL)messageBubbleDeclineInviteURL;
- (NSURL)reportInviteeDetailsUrl;
- (id)buildInviteMessageBubbleURL:(id)a3;
- (id)description;
- (id)privacySafeInvitees;
- (unint64_t)_validatonFromString:(id)a3 eventType:(id)a4;
- (unint64_t)maxFamilySuggestions;
- (unint64_t)remainingFamilySpots;
- (unint64_t)validation;
- (void)_parseResultsDictionary:(id)a3;
- (void)setAction:(id)a3;
- (void)setCanEditRecipients:(BOOL)a3;
- (void)setEventType:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setInviteURL:(id)a3;
- (void)setInvitees:(id)a3;
- (void)setMailLinkSubtitle:(id)a3;
- (void)setMailLinkTitle:(id)a3;
- (void)setMailMessageBodyHTML:(id)a3;
- (void)setMailMessageSubject:(id)a3;
- (void)setMessageBubbleAcceptInviteURL:(id)a3;
- (void)setMessageBubbleAppleIDSettingsLinkLabel:(id)a3;
- (void)setMessageBubbleDeclineInviteURL:(id)a3;
- (void)setMessageBubbleFamilySettingsLinkLabel:(id)a3;
- (void)setMessageBubbleInviteAcceptButtonLabel:(id)a3;
- (void)setMessageBubbleInviteAcceptedIcon:(id)a3;
- (void)setMessageBubbleInviteAcceptedSubTitleReceiver:(id)a3;
- (void)setMessageBubbleInviteAcceptedSubTitleSender:(id)a3;
- (void)setMessageBubbleInviteAcceptedTitleReceiver:(id)a3;
- (void)setMessageBubbleInviteAcceptedTitleSender:(id)a3;
- (void)setMessageBubbleInviteDeclineAlertSheetMessage:(id)a3;
- (void)setMessageBubbleInviteDeclineAlertSheetTitle:(id)a3;
- (void)setMessageBubbleInviteDeclineButtonLabel:(id)a3;
- (void)setMessageBubbleInviteDeclinedIcon:(id)a3;
- (void)setMessageBubbleInviteDeclinedSubTitleReceiver:(id)a3;
- (void)setMessageBubbleInviteDeclinedSubTitleSender:(id)a3;
- (void)setMessageBubbleInviteDeclinedTitleReceiver:(id)a3;
- (void)setMessageBubbleInviteDeclinedTitleSender:(id)a3;
- (void)setMessageBubbleInviteExpiredIcon:(id)a3;
- (void)setMessageBubbleInviteExpiredSubTitleReceiver:(id)a3;
- (void)setMessageBubbleInviteExpiredSubTitleSender:(id)a3;
- (void)setMessageBubbleInviteExpiredTitleReceiver:(id)a3;
- (void)setMessageBubbleInviteExpiredTitleSender:(id)a3;
- (void)setMessageBubbleInviteLoadingLabel:(id)a3;
- (void)setMessageBubbleInvitePendingIcon:(id)a3;
- (void)setMessageBubbleInvitePendingSubTitle:(id)a3;
- (void)setMessageBubbleInvitePendingTitle:(id)a3;
- (void)setMessageBubbleLearnMoreLinkLabel:(id)a3;
- (void)setMessageBubbleSubTitle:(id)a3;
- (void)setMessageBubbleSubTitleTeen:(id)a3;
- (void)setMessageBubbleSubscriptionsList:(id)a3;
- (void)setMessageBubbleTitle:(id)a3;
- (void)setMessageBubbleViewInvitationButtonLabel:(id)a3;
- (void)setOverlaidTextColorString:(id)a3;
- (void)setReportInviteeDetailsUrl:(id)a3;
- (void)setSecondaryTitle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValidation:(unint64_t)a3;
@end

@implementation FAInviteContext

- (unint64_t)maxFamilySuggestions
{
  return 5;
}

- (FAInviteContext)initWithResults:(id)a3
{
  id v4 = a3;
  v5 = [(FAInviteContext *)self init];
  v6 = v5;
  if (v5) {
    [(FAInviteContext *)v5 _parseResultsDictionary:v4];
  }

  return v6;
}

- (unint64_t)_validatonFromString:(id)a3 eventType:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 || ([v6 isEqualToString:@"familyInvite"] & 1) == 0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = objc_msgSend(v5, "componentsSeparatedByString:", @",", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v8 = 0;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * i) isEqualToString:@"inviteesNotPartOfFamily"])unint64_t v8 = 1; {
        }
          }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

- (void)_parseResultsDictionary:(id)a3
{
  id v123 = a3;
  id v4 = [v123 objectForKeyedSubscript:@"eventType"];
  eventType = self->_eventType;
  self->_eventType = v4;

  id v6 = [v123 objectForKeyedSubscript:@"title"];
  title = self->_title;
  self->_title = v6;

  unint64_t v8 = [v123 objectForKeyedSubscript:@"secondaryTitle"];
  secondaryTitle = self->_secondaryTitle;
  self->_secondaryTitle = v8;

  uint64_t v10 = [v123 objectForKeyedSubscript:@"description"];
  subtitle = self->_subtitle;
  self->_subtitle = v10;

  uint64_t v12 = [v123 objectForKeyedSubscript:@"recipientsEditable"];
  self->_canEditRecipients = [v12 BOOLValue];

  v13 = [v123 objectForKeyedSubscript:@"actionLabel"];
  action = self->_action;
  self->_action = v13;

  long long v15 = [v123 objectForKeyedSubscript:@"invitees"];
  long long v16 = [v15 componentsSeparatedByString:@","];
  invitees = self->_invitees;
  self->_invitees = v16;

  long long v18 = [v123 objectForKeyedSubscript:@"overlaidTextColor"];
  overlaidTextColorString = self->_overlaidTextColorString;
  self->_overlaidTextColorString = v18;

  uint64_t v20 = [v123 objectForKeyedSubscript:@"validate"];
  self->_validation = [(FAInviteContext *)self _validatonFromString:v20 eventType:self->_eventType];

  v21 = [v123 objectForKeyedSubscript:@"inviteUrl"];
  if (v21)
  {
    v22 = [MEMORY[0x1E4F1CB10] URLWithString:v21];
    inviteURL = self->_inviteURL;
    self->_inviteURL = v22;
  }
  v24 = [v123 objectForKeyedSubscript:@"backgroundImageUrl"];
  if (v24)
  {
    v25 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
    imageURL = self->_imageURL;
    self->_imageURL = v25;
  }
  v27 = [v123 objectForKeyedSubscript:@"iconUrl"];
  if (v27)
  {
    v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
    iconURL = self->_iconURL;
    self->_iconURL = v28;
  }
  v30 = [v123 objectForKeyedSubscript:@"reportInviteeDetailsUrl"];
  if (v30)
  {
    v31 = [MEMORY[0x1E4F1CB10] URLWithString:v30];
    reportInviteeDetailsUrl = self->_reportInviteeDetailsUrl;
    self->_reportInviteeDetailsUrl = v31;
  }
  v33 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptLink"];
  if (v33)
  {
    v34 = [MEMORY[0x1E4F1CB10] URLWithString:v33];
    messageBubbleAcceptInviteURL = self->_messageBubbleAcceptInviteURL;
    self->_messageBubbleAcceptInviteURL = v34;
  }
  v36 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclineLink"];
  if (v36)
  {
    v37 = [MEMORY[0x1E4F1CB10] URLWithString:v36];
    messageBubbleDeclineInviteURL = self->_messageBubbleDeclineInviteURL;
    self->_messageBubbleDeclineInviteURL = v37;
  }
  v39 = [v123 objectForKeyedSubscript:@"remainingFamilySpots"];
  uint64_t v40 = [v39 integerValue];

  unint64_t v41 = 5;
  if (v40) {
    unint64_t v41 = v40;
  }
  self->_remainingFamilySpots = v41;
  v42 = [v123 objectForKeyedSubscript:@"mailLinkTitle"];
  mailLinkTitle = self->_mailLinkTitle;
  self->_mailLinkTitle = v42;

  v44 = [v123 objectForKeyedSubscript:@"mailLinkSubtitle"];
  mailLinkSubtitle = self->_mailLinkSubtitle;
  self->_mailLinkSubtitle = v44;

  v46 = [v123 objectForKeyedSubscript:@"mailMessageSubject"];
  mailMessageSubject = self->_mailMessageSubject;
  self->_mailMessageSubject = v46;

  v48 = [v123 objectForKeyedSubscript:@"mailMessageBodyHTML"];
  mailMessageBodyHTML = self->_mailMessageBodyHTML;
  self->_mailMessageBodyHTML = v48;

  v50 = [v123 objectForKeyedSubscript:@"messageBubbleTitle"];
  messageBubbleTitle = self->_messageBubbleTitle;
  self->_messageBubbleTitle = v50;

  v52 = [v123 objectForKeyedSubscript:@"messageBubbleSubTitle"];
  messageBubbleSubTitle = self->_messageBubbleSubTitle;
  self->_messageBubbleSubTitle = v52;

  v54 = [v123 objectForKeyedSubscript:@"messageBubbleSubTitleTeen"];
  messageBubbleSubTitleTeen = self->_messageBubbleSubTitleTeen;
  self->_messageBubbleSubTitleTeen = v54;

  v56 = [v123 objectForKeyedSubscript:@"messageBubbleViewInvitationButtonLabel"];
  messageBubbleViewInvitationButtonLabel = self->_messageBubbleViewInvitationButtonLabel;
  self->_messageBubbleViewInvitationButtonLabel = v56;

  v58 = [v123 objectForKeyedSubscript:@"messageBubbleLearnMoreLinkLabel"];
  messageBubbleLearnMoreLinkLabel = self->_messageBubbleLearnMoreLinkLabel;
  self->_messageBubbleLearnMoreLinkLabel = v58;

  v60 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptButtonLabel"];
  messageBubbleInviteAcceptButtonLabel = self->_messageBubbleInviteAcceptButtonLabel;
  self->_messageBubbleInviteAcceptButtonLabel = v60;

  v62 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclineButtonLabel"];
  messageBubbleInviteDeclineButtonLabel = self->_messageBubbleInviteDeclineButtonLabel;
  self->_messageBubbleInviteDeclineButtonLabel = v62;

  v64 = [v123 objectForKeyedSubscript:@"messageBubbleSubscriptionsList"];
  messageBubbleSubscriptionsList = self->_messageBubbleSubscriptionsList;
  self->_messageBubbleSubscriptionsList = v64;

  v66 = [v123 objectForKeyedSubscript:@"messageBubbleFamilySettingsLinkLabel"];
  messageBubbleFamilySettingsLinkLabel = self->_messageBubbleFamilySettingsLinkLabel;
  self->_messageBubbleFamilySettingsLinkLabel = v66;

  v68 = [v123 objectForKeyedSubscript:@"messageBubbleAppleIDSettingsLinkLabel"];
  messageBubbleAppleIDSettingsLinkLabel = self->_messageBubbleAppleIDSettingsLinkLabel;
  self->_messageBubbleAppleIDSettingsLinkLabel = v68;

  v70 = [v123 objectForKeyedSubscript:@"messageBubbleLoadingLabel"];
  messageBubbleInviteLoadingLabel = self->_messageBubbleInviteLoadingLabel;
  self->_messageBubbleInviteLoadingLabel = v70;

  if (![(NSString *)self->_messageBubbleInviteLoadingLabel length])
  {
    v72 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v73 = [v72 localizedStringForKey:@"LOADING" value:&stru_1F29387B0 table:@"Localizable"];
    v74 = self->_messageBubbleInviteLoadingLabel;
    self->_messageBubbleInviteLoadingLabel = v73;
  }
  v75 = [v123 objectForKeyedSubscript:@"messageBubbleInvitePendingTitle"];
  messageBubbleInvitePendingTitle = self->_messageBubbleInvitePendingTitle;
  self->_messageBubbleInvitePendingTitle = v75;

  v77 = [v123 objectForKeyedSubscript:@"messageBubbleInvitePendingSubTitle"];
  messageBubbleInvitePendingSubTitle = self->_messageBubbleInvitePendingSubTitle;
  self->_messageBubbleInvitePendingSubTitle = v77;

  v79 = [v123 objectForKeyedSubscript:@"messageBubbleInvitePendingIcon"];
  messageBubbleInvitePendingIcon = self->_messageBubbleInvitePendingIcon;
  self->_messageBubbleInvitePendingIcon = v79;

  v81 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptedTitleSender"];
  messageBubbleInviteAcceptedTitleSender = self->_messageBubbleInviteAcceptedTitleSender;
  self->_messageBubbleInviteAcceptedTitleSender = v81;

  v83 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptedTitleReceiver"];
  messageBubbleInviteAcceptedTitleReceiver = self->_messageBubbleInviteAcceptedTitleReceiver;
  self->_messageBubbleInviteAcceptedTitleReceiver = v83;

  v85 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptedSubTitleSender"];
  messageBubbleInviteAcceptedSubTitleSender = self->_messageBubbleInviteAcceptedSubTitleSender;
  self->_messageBubbleInviteAcceptedSubTitleSender = v85;

  v87 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptedSubTitleReceiver"];
  messageBubbleInviteAcceptedSubTitleReceiver = self->_messageBubbleInviteAcceptedSubTitleReceiver;
  self->_messageBubbleInviteAcceptedSubTitleReceiver = v87;

  v89 = [v123 objectForKeyedSubscript:@"messageBubbleInviteAcceptedIcon"];
  messageBubbleInviteAcceptedIcon = self->_messageBubbleInviteAcceptedIcon;
  self->_messageBubbleInviteAcceptedIcon = v89;

  v91 = [v123 objectForKeyedSubscript:@"messageBubbleInviteExpiredTitleSender"];
  messageBubbleInviteExpiredTitleSender = self->_messageBubbleInviteExpiredTitleSender;
  self->_messageBubbleInviteExpiredTitleSender = v91;

  v93 = [v123 objectForKeyedSubscript:@"messageBubbleInviteExpiredTitleReceiver"];
  messageBubbleInviteExpiredTitleReceiver = self->_messageBubbleInviteExpiredTitleReceiver;
  self->_messageBubbleInviteExpiredTitleReceiver = v93;

  v95 = [v123 objectForKeyedSubscript:@"messageBubbleInviteExpiredSubTitleSender"];
  messageBubbleInviteExpiredSubTitleSender = self->_messageBubbleInviteExpiredSubTitleSender;
  self->_messageBubbleInviteExpiredSubTitleSender = v95;

  v97 = [v123 objectForKeyedSubscript:@"messageBubbleInviteExpiredSubTitleReceiver"];
  messageBubbleInviteExpiredSubTitleReceiver = self->_messageBubbleInviteExpiredSubTitleReceiver;
  self->_messageBubbleInviteExpiredSubTitleReceiver = v97;

  v99 = [v123 objectForKeyedSubscript:@"messageBubbleInviteExpiredIcon"];
  messageBubbleInviteExpiredIcon = self->_messageBubbleInviteExpiredIcon;
  self->_messageBubbleInviteExpiredIcon = v99;

  v101 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclinedTitleSender"];
  messageBubbleInviteDeclinedTitleSender = self->_messageBubbleInviteDeclinedTitleSender;
  self->_messageBubbleInviteDeclinedTitleSender = v101;

  v103 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclinedTitleReceiver"];
  messageBubbleInviteDeclinedTitleReceiver = self->_messageBubbleInviteDeclinedTitleReceiver;
  self->_messageBubbleInviteDeclinedTitleReceiver = v103;

  v105 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclinedSubTitleSender"];
  messageBubbleInviteDeclinedSubTitleSender = self->_messageBubbleInviteDeclinedSubTitleSender;
  self->_messageBubbleInviteDeclinedSubTitleSender = v105;

  v107 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclinedSubTitleReceiver"];
  messageBubbleInviteDeclinedSubTitleReceiver = self->_messageBubbleInviteDeclinedSubTitleReceiver;
  self->_messageBubbleInviteDeclinedSubTitleReceiver = v107;

  v109 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclinedIcon"];
  messageBubbleInviteDeclinedIcon = self->_messageBubbleInviteDeclinedIcon;
  self->_messageBubbleInviteDeclinedIcon = v109;

  v111 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclineAlertSheetTitle"];
  v112 = v111;
  if (v111)
  {
    v113 = v111;
    messageBubbleInviteDeclineAlertSheetTitle = self->_messageBubbleInviteDeclineAlertSheetTitle;
    self->_messageBubbleInviteDeclineAlertSheetTitle = v113;
  }
  else
  {
    messageBubbleInviteDeclineAlertSheetTitle = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v115 = [messageBubbleInviteDeclineAlertSheetTitle localizedStringForKey:@"InviteDeclineAlertSheetTitle" value:&stru_1F29387B0 table:@"Localizable"];
    v116 = self->_messageBubbleInviteDeclineAlertSheetTitle;
    self->_messageBubbleInviteDeclineAlertSheetTitle = v115;
  }
  v117 = [v123 objectForKeyedSubscript:@"messageBubbleInviteDeclineAlertSheetMessage"];
  v118 = v117;
  if (v117)
  {
    v119 = v117;
    messageBubbleInviteDeclineAlertSheetMessage = self->_messageBubbleInviteDeclineAlertSheetMessage;
    self->_messageBubbleInviteDeclineAlertSheetMessage = v119;
  }
  else
  {
    messageBubbleInviteDeclineAlertSheetMessage = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v121 = [messageBubbleInviteDeclineAlertSheetMessage localizedStringForKey:@"InviteDeclineAlertSheetMessage" value:&stru_1F29387B0 table:@"Localizable"];
    v122 = self->_messageBubbleInviteDeclineAlertSheetMessage;
    self->_messageBubbleInviteDeclineAlertSheetMessage = v121;
  }
}

- (id)privacySafeInvitees
{
  v2 = [(FAInviteContext *)self invitees];
  v3 = +[FAHandlePrivacyResolver privacySafeInvitees:v2];

  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FAInviteContext *)self title];
  id v6 = [(FAInviteContext *)self subtitle];
  v7 = [(FAInviteContext *)self action];
  unint64_t v8 = [(FAInviteContext *)self inviteURL];
  v9 = [v8 absoluteString];
  uint64_t v10 = [(FAInviteContext *)self invitees];
  uint64_t v11 = [v3 stringWithFormat:@"%@ - title: %@ subtitle: %@ action: %@ inviteURL: %@ invitees: %@ canEditRecipients: %d", v4, v5, v6, v7, v9, v10, -[FAInviteContext canEditRecipients](self, "canEditRecipients")];

  return v11;
}

- (id)buildInviteMessageBubbleURL:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v70 = objc_alloc_init(v4);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"messageTitle" value:self->_messageBubbleTitle];
  [v6 addObject:v7];

  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"messageSubTitle" value:self->_messageBubbleSubTitle];
  [v6 addObject:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"messageSubTitleTeen" value:self->_messageBubbleSubTitleTeen];
  [v6 addObject:v9];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"inviteButtonLabel" value:self->_messageBubbleViewInvitationButtonLabel];
  [v6 addObject:v10];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"acceptButtonLabel" value:self->_messageBubbleInviteAcceptButtonLabel];
  [v6 addObject:v11];

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declineButtonLabel" value:self->_messageBubbleInviteDeclineButtonLabel];
  [v6 addObject:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"learnMoreLinkLabel" value:self->_messageBubbleLearnMoreLinkLabel];
  [v6 addObject:v13];

  id v14 = objc_alloc(MEMORY[0x1E4F290C8]);
  long long v15 = [(NSURL *)self->_inviteURL absoluteString];
  long long v16 = (void *)[v14 initWithName:@"inviteUrl" value:v15];
  [v6 addObject:v16];

  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"subscriptionList" value:self->_messageBubbleSubscriptionsList];
  [v6 addObject:v17];

  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"familySettingsLinkLabel" value:self->_messageBubbleFamilySettingsLinkLabel];
  [v6 addObject:v18];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"appleIDSettingsLinkLabel" value:self->_messageBubbleAppleIDSettingsLinkLabel];
  [v6 addObject:v19];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"inviteLoadingLabel" value:self->_messageBubbleInviteLoadingLabel];
  [v6 addObject:v20];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"receiverHandle" value:v5];
  [v6 addObject:v21];

  v22 = [MEMORY[0x1E4F179C8] defaultStore];
  v23 = objc_msgSend(v22, "aa_primaryAppleAccount");
  v24 = [v23 username];

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"senderHandle" value:v24];
  [v6 addObject:v25];

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"pendingTitle" value:self->_messageBubbleInvitePendingTitle];
  [v6 addObject:v26];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"pendingSubTitle" value:self->_messageBubbleInvitePendingSubTitle];
  [v6 addObject:v27];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"pendingIcon" value:self->_messageBubbleInvitePendingIcon];
  [v6 addObject:v28];

  v29 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"acceptedTitleSender" value:self->_messageBubbleInviteAcceptedTitleSender];
  [v6 addObject:v29];

  v30 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"acceptedTitleReceiver" value:self->_messageBubbleInviteAcceptedTitleReceiver];
  [v6 addObject:v30];

  v31 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"acceptedSubTitleReceiver" value:self->_messageBubbleInviteAcceptedSubTitleReceiver];
  [v6 addObject:v31];

  v32 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"acceptedSubTitleSender" value:self->_messageBubbleInviteAcceptedSubTitleSender];
  [v6 addObject:v32];

  v33 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"acceptedIcon" value:self->_messageBubbleInviteAcceptedIcon];
  [v6 addObject:v33];

  id v34 = objc_alloc(MEMORY[0x1E4F290C8]);
  v35 = [(NSURL *)self->_messageBubbleAcceptInviteURL absoluteString];
  v36 = (void *)[v34 initWithName:@"acceptInviteUrl" value:v35];
  [v6 addObject:v36];

  v37 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"expiredTitleSender" value:self->_messageBubbleInviteExpiredTitleSender];
  [v6 addObject:v37];

  v38 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"expiredTitleReceiver" value:self->_messageBubbleInviteExpiredTitleReceiver];
  [v6 addObject:v38];

  v39 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"expiredSubTitleReceiver" value:self->_messageBubbleInviteExpiredSubTitleReceiver];
  [v6 addObject:v39];

  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"expiredSubTitleSender" value:self->_messageBubbleInviteExpiredSubTitleSender];
  [v6 addObject:v40];

  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"expiredIcon" value:self->_messageBubbleInviteExpiredIcon];
  [v6 addObject:v41];

  v42 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declinedTitleSender" value:self->_messageBubbleInviteDeclinedTitleSender];
  [v6 addObject:v42];

  v43 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declinedTitleReceiver" value:self->_messageBubbleInviteDeclinedTitleReceiver];
  [v6 addObject:v43];

  v44 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declinedSubTitleReceiver" value:self->_messageBubbleInviteDeclinedSubTitleReceiver];
  [v6 addObject:v44];

  v45 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declinedSubTitleSender" value:self->_messageBubbleInviteDeclinedSubTitleSender];
  [v6 addObject:v45];

  v46 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declinedIcon" value:self->_messageBubbleInviteDeclinedIcon];
  [v6 addObject:v46];

  id v47 = objc_alloc(MEMORY[0x1E4F290C8]);
  v48 = [(NSURL *)self->_messageBubbleDeclineInviteURL absoluteString];
  v49 = (void *)[v47 initWithName:@"declineInviteUrl" value:v48];
  [v6 addObject:v49];

  id v50 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v50 setDateFormat:@"yyyy-MM-dd"];
  id v51 = objc_alloc(MEMORY[0x1E4F290C8]);
  v52 = [MEMORY[0x1E4F1C9C8] now];
  v53 = [v50 stringFromDate:v52];
  v54 = (void *)[v51 initWithName:@"senderMessageDate" value:v53];
  [v6 addObject:v54];

  v55 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declineAlertTitle" value:self->_messageBubbleInviteDeclineAlertSheetTitle];
  [v6 addObject:v55];

  v56 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"declineAlertMessage" value:self->_messageBubbleInviteDeclineAlertSheetMessage];
  [v6 addObject:v56];

  id v57 = objc_alloc(MEMORY[0x1E4F290C8]);
  v58 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v59 = [v58 localizedStringForKey:@"DeclineAlertButtonTitle" value:&stru_1F29387B0 table:@"Localizable"];
  v60 = (void *)[v57 initWithName:@"declineAlertButtonTitle" value:v59];
  [v6 addObject:v60];

  id v61 = objc_alloc(MEMORY[0x1E4F290C8]);
  v62 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v63 = [v62 localizedStringForKey:@"CANCEL" value:&stru_1F29387B0 table:@"Localizable"];
  v64 = (void *)[v61 initWithName:@"declineAlertCancelButtonTitle" value:v63];
  [v6 addObject:v64];

  v65 = (void *)[v6 copy];
  [v70 setQueryItems:v65];

  v66 = _FALogSystem();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = [v70 URL];
    *(_DWORD *)buf = 138412290;
    v72 = v67;
    _os_log_impl(&dword_1D252C000, v66, OS_LOG_TYPE_DEFAULT, "message bubble url %@", buf, 0xCu);
  }
  v68 = [v70 URL];

  return v68;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
}

- (unint64_t)validation
{
  return self->_validation;
}

- (void)setValidation:(unint64_t)a3
{
  self->_validation = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)secondaryTitle
{
  return self->_secondaryTitle;
}

- (void)setSecondaryTitle:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSURL)inviteURL
{
  return self->_inviteURL;
}

- (void)setInviteURL:(id)a3
{
}

- (NSURL)reportInviteeDetailsUrl
{
  return self->_reportInviteeDetailsUrl;
}

- (void)setReportInviteeDetailsUrl:(id)a3
{
}

- (NSString)overlaidTextColorString
{
  return self->_overlaidTextColorString;
}

- (void)setOverlaidTextColorString:(id)a3
{
}

- (NSArray)invitees
{
  return self->_invitees;
}

- (void)setInvitees:(id)a3
{
}

- (BOOL)canEditRecipients
{
  return self->_canEditRecipients;
}

- (void)setCanEditRecipients:(BOOL)a3
{
  self->_canEditRecipients = a3;
}

- (unint64_t)remainingFamilySpots
{
  return self->_remainingFamilySpots;
}

- (NSString)mailLinkTitle
{
  return self->_mailLinkTitle;
}

- (void)setMailLinkTitle:(id)a3
{
}

- (NSString)mailLinkSubtitle
{
  return self->_mailLinkSubtitle;
}

- (void)setMailLinkSubtitle:(id)a3
{
}

- (NSString)mailMessageSubject
{
  return self->_mailMessageSubject;
}

- (void)setMailMessageSubject:(id)a3
{
}

- (NSString)mailMessageBodyHTML
{
  return self->_mailMessageBodyHTML;
}

- (void)setMailMessageBodyHTML:(id)a3
{
}

- (NSString)messageBubbleTitle
{
  return self->_messageBubbleTitle;
}

- (void)setMessageBubbleTitle:(id)a3
{
}

- (NSString)messageBubbleSubTitle
{
  return self->_messageBubbleSubTitle;
}

- (void)setMessageBubbleSubTitle:(id)a3
{
}

- (NSString)messageBubbleSubTitleTeen
{
  return self->_messageBubbleSubTitleTeen;
}

- (void)setMessageBubbleSubTitleTeen:(id)a3
{
}

- (NSString)messageBubbleViewInvitationButtonLabel
{
  return self->_messageBubbleViewInvitationButtonLabel;
}

- (void)setMessageBubbleViewInvitationButtonLabel:(id)a3
{
}

- (NSString)messageBubbleInviteDeclineButtonLabel
{
  return self->_messageBubbleInviteDeclineButtonLabel;
}

- (void)setMessageBubbleInviteDeclineButtonLabel:(id)a3
{
}

- (NSString)messageBubbleInviteAcceptButtonLabel
{
  return self->_messageBubbleInviteAcceptButtonLabel;
}

- (void)setMessageBubbleInviteAcceptButtonLabel:(id)a3
{
}

- (NSString)messageBubbleSubscriptionsList
{
  return self->_messageBubbleSubscriptionsList;
}

- (void)setMessageBubbleSubscriptionsList:(id)a3
{
}

- (NSString)messageBubbleFamilySettingsLinkLabel
{
  return self->_messageBubbleFamilySettingsLinkLabel;
}

- (void)setMessageBubbleFamilySettingsLinkLabel:(id)a3
{
}

- (NSString)messageBubbleAppleIDSettingsLinkLabel
{
  return self->_messageBubbleAppleIDSettingsLinkLabel;
}

- (void)setMessageBubbleAppleIDSettingsLinkLabel:(id)a3
{
}

- (NSString)messageBubbleLearnMoreLinkLabel
{
  return self->_messageBubbleLearnMoreLinkLabel;
}

- (void)setMessageBubbleLearnMoreLinkLabel:(id)a3
{
}

- (NSString)messageBubbleInviteLoadingLabel
{
  return self->_messageBubbleInviteLoadingLabel;
}

- (void)setMessageBubbleInviteLoadingLabel:(id)a3
{
}

- (NSString)messageBubbleInviteAcceptedTitleSender
{
  return self->_messageBubbleInviteAcceptedTitleSender;
}

- (void)setMessageBubbleInviteAcceptedTitleSender:(id)a3
{
}

- (NSString)messageBubbleInviteAcceptedTitleReceiver
{
  return self->_messageBubbleInviteAcceptedTitleReceiver;
}

- (void)setMessageBubbleInviteAcceptedTitleReceiver:(id)a3
{
}

- (NSString)messageBubbleInviteAcceptedIcon
{
  return self->_messageBubbleInviteAcceptedIcon;
}

- (void)setMessageBubbleInviteAcceptedIcon:(id)a3
{
}

- (NSString)messageBubbleInviteAcceptedSubTitleSender
{
  return self->_messageBubbleInviteAcceptedSubTitleSender;
}

- (void)setMessageBubbleInviteAcceptedSubTitleSender:(id)a3
{
}

- (NSString)messageBubbleInviteAcceptedSubTitleReceiver
{
  return self->_messageBubbleInviteAcceptedSubTitleReceiver;
}

- (void)setMessageBubbleInviteAcceptedSubTitleReceiver:(id)a3
{
}

- (NSURL)messageBubbleAcceptInviteURL
{
  return self->_messageBubbleAcceptInviteURL;
}

- (void)setMessageBubbleAcceptInviteURL:(id)a3
{
}

- (NSString)messageBubbleInviteDeclinedTitleSender
{
  return self->_messageBubbleInviteDeclinedTitleSender;
}

- (void)setMessageBubbleInviteDeclinedTitleSender:(id)a3
{
}

- (NSString)messageBubbleInviteDeclinedTitleReceiver
{
  return self->_messageBubbleInviteDeclinedTitleReceiver;
}

- (void)setMessageBubbleInviteDeclinedTitleReceiver:(id)a3
{
}

- (NSString)messageBubbleInviteDeclinedIcon
{
  return self->_messageBubbleInviteDeclinedIcon;
}

- (void)setMessageBubbleInviteDeclinedIcon:(id)a3
{
}

- (NSString)messageBubbleInviteDeclinedSubTitleSender
{
  return self->_messageBubbleInviteDeclinedSubTitleSender;
}

- (void)setMessageBubbleInviteDeclinedSubTitleSender:(id)a3
{
}

- (NSString)messageBubbleInviteDeclinedSubTitleReceiver
{
  return self->_messageBubbleInviteDeclinedSubTitleReceiver;
}

- (void)setMessageBubbleInviteDeclinedSubTitleReceiver:(id)a3
{
}

- (NSURL)messageBubbleDeclineInviteURL
{
  return self->_messageBubbleDeclineInviteURL;
}

- (void)setMessageBubbleDeclineInviteURL:(id)a3
{
}

- (NSString)messageBubbleInviteExpiredTitleSender
{
  return self->_messageBubbleInviteExpiredTitleSender;
}

- (void)setMessageBubbleInviteExpiredTitleSender:(id)a3
{
}

- (NSString)messageBubbleInviteExpiredTitleReceiver
{
  return self->_messageBubbleInviteExpiredTitleReceiver;
}

- (void)setMessageBubbleInviteExpiredTitleReceiver:(id)a3
{
}

- (NSString)messageBubbleInviteExpiredIcon
{
  return self->_messageBubbleInviteExpiredIcon;
}

- (void)setMessageBubbleInviteExpiredIcon:(id)a3
{
}

- (NSString)messageBubbleInviteExpiredSubTitleSender
{
  return self->_messageBubbleInviteExpiredSubTitleSender;
}

- (void)setMessageBubbleInviteExpiredSubTitleSender:(id)a3
{
}

- (NSString)messageBubbleInviteExpiredSubTitleReceiver
{
  return self->_messageBubbleInviteExpiredSubTitleReceiver;
}

- (void)setMessageBubbleInviteExpiredSubTitleReceiver:(id)a3
{
}

- (NSString)messageBubbleInvitePendingTitle
{
  return self->_messageBubbleInvitePendingTitle;
}

- (void)setMessageBubbleInvitePendingTitle:(id)a3
{
}

- (NSString)messageBubbleInvitePendingSubTitle
{
  return self->_messageBubbleInvitePendingSubTitle;
}

- (void)setMessageBubbleInvitePendingSubTitle:(id)a3
{
}

- (NSString)messageBubbleInvitePendingIcon
{
  return self->_messageBubbleInvitePendingIcon;
}

- (void)setMessageBubbleInvitePendingIcon:(id)a3
{
}

- (NSString)messageBubbleInviteDeclineAlertSheetTitle
{
  return self->_messageBubbleInviteDeclineAlertSheetTitle;
}

- (void)setMessageBubbleInviteDeclineAlertSheetTitle:(id)a3
{
}

- (NSString)messageBubbleInviteDeclineAlertSheetMessage
{
  return self->_messageBubbleInviteDeclineAlertSheetMessage;
}

- (void)setMessageBubbleInviteDeclineAlertSheetMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclineAlertSheetMessage, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclineAlertSheetTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleInvitePendingIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInvitePendingSubTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleInvitePendingTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredSubTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredSubTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteExpiredTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleDeclineInviteURL, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedSubTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedSubTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclinedTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleAcceptInviteURL, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedSubTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedSubTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedIcon, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedTitleReceiver, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptedTitleSender, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteLoadingLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleLearnMoreLinkLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleAppleIDSettingsLinkLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleFamilySettingsLinkLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleSubscriptionsList, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteAcceptButtonLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleInviteDeclineButtonLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleViewInvitationButtonLabel, 0);
  objc_storeStrong((id *)&self->_messageBubbleSubTitleTeen, 0);
  objc_storeStrong((id *)&self->_messageBubbleSubTitle, 0);
  objc_storeStrong((id *)&self->_messageBubbleTitle, 0);
  objc_storeStrong((id *)&self->_mailMessageBodyHTML, 0);
  objc_storeStrong((id *)&self->_mailMessageSubject, 0);
  objc_storeStrong((id *)&self->_mailLinkSubtitle, 0);
  objc_storeStrong((id *)&self->_mailLinkTitle, 0);
  objc_storeStrong((id *)&self->_invitees, 0);
  objc_storeStrong((id *)&self->_overlaidTextColorString, 0);
  objc_storeStrong((id *)&self->_reportInviteeDetailsUrl, 0);
  objc_storeStrong((id *)&self->_inviteURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_secondaryTitle, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end