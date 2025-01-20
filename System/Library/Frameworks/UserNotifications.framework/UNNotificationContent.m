@interface UNNotificationContent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDefaultAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)screenCaptureProhibited;
- (BOOL)shouldAuthenticateDefaultAction;
- (BOOL)shouldBackgroundDefaultAction;
- (BOOL)shouldDisplayActionsInline;
- (BOOL)shouldHideDate;
- (BOOL)shouldHideTime;
- (BOOL)shouldIgnoreDoNotDisturb;
- (BOOL)shouldIgnoreDowntime;
- (BOOL)shouldPreemptPresentedNotification;
- (BOOL)shouldPreventNotificationDismissalAfterDefaultAction;
- (BOOL)shouldShowSubordinateIcon;
- (BOOL)shouldSuppressDefaultAction;
- (BOOL)shouldSuppressScreenLightUp;
- (BOOL)shouldSuppressSyncDismissalWhenRemoved;
- (BOOL)shouldUseRequestIdentifierForDismissalSync;
- (NSArray)attachments;
- (NSArray)peopleIdentifiers;
- (NSAttributedString)attributedBody;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSDictionary)userInfo;
- (NSNumber)badge;
- (NSSet)topicIdentifiers;
- (NSString)accessoryImageName;
- (NSString)body;
- (NSString)categoryIdentifier;
- (NSString)contentType;
- (NSString)debugDescription;
- (NSString)defaultActionBundleIdentifier;
- (NSString)defaultActionTitle;
- (NSString)description;
- (NSString)filterCriteria;
- (NSString)footer;
- (NSString)header;
- (NSString)launchImageName;
- (NSString)markedMutableCopyMessage;
- (NSString)speechLanguage;
- (NSString)subtitle;
- (NSString)summaryArgument;
- (NSString)targetContentIdentifier;
- (NSString)threadIdentifier;
- (NSString)title;
- (NSUInteger)summaryArgumentCount;
- (NSURL)defaultActionURL;
- (UNNotificationContent)contentByUpdatingWithProvider:(id)provider error:(NSError *)outError;
- (UNNotificationContent)init;
- (UNNotificationContent)initWithCoder:(id)a3;
- (UNNotificationIcon)icon;
- (UNNotificationInterruptionLevel)interruptionLevel;
- (UNNotificationSound)sound;
- (_UNNotificationCommunicationContext)communicationContext;
- (double)relevanceScore;
- (id)_descriptionForDebug:(BOOL)a3;
- (id)_initWithContentType:(id)a3 communicationContext:(id)a4 accessoryImageName:(id)a5 attachments:(id)a6 badge:(id)a7 body:(id)a8 attributedBody:(id)a9 categoryIdentifier:(id)a10 date:(id)a11 icon:(id)a12 defaultActionTitle:(id)a13 defaultActionURL:(id)a14 defaultActionBundleIdentifier:(id)a15 expirationDate:(id)a16 header:(id)a17 footer:(id)a18 launchImageName:(id)a19 peopleIdentifiers:(id)a20 shouldHideDate:(BOOL)a21 shouldHideTime:(BOOL)a22 shouldIgnoreDoNotDisturb:(BOOL)a23 shouldIgnoreDowntime:(BOOL)a24 shouldSuppressScreenLightUp:(BOOL)a25 shouldAuthenticateDefaultAction:(BOOL)a26 shouldBackgroundDefaultAction:(BOOL)a27 shouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a28 shouldShowSubordinateIcon:(BOOL)a29 shouldSuppressDefaultAction:(BOOL)a30 shouldSuppressSyncDismissalWhenRemoved:(BOOL)a31 shouldUseRequestIdentifierForDismissalSync:(BOOL)a32 shouldPreemptPresentedNotification:(BOOL)a33 shouldDisplayActionsInline:(BOOL)a34 sound:(id)a35 subtitle:(id)a36 threadIdentifier:(id)a37 title:(id)a38 topicIdentifiers:(id)a39 realertCount:(unint64_t)a40 summaryArgument:(id)a41 summaryArgumentCount:(unint64_t)a42 targetContentIdentifier:(id)a43 interruptionLevel:(unint64_t)a44 relevanceScore:(double)a45 filterCriteria:(id)a46 screenCaptureProhibited:(BOOL)a47 speechLanguage:(id)a48 userInfo:(id)a49;
- (id)_safeAttributedStringForAttributedString:(id)a3 debug:(BOOL)a4;
- (id)_safeStringForString:(id)a3 debug:(BOOL)a4;
- (id)contentByUpdatingWithAttributedMessageContext:(id)a3 error:(id *)a4;
- (id)contentByUpdatingWithReadAnnouncementIntent:(id)a3 error:(id *)a4;
- (id)contentByUpdatingWithSendMessageIntent:(id)a3 error:(id *)a4;
- (id)contentByUpdatingWithStartCallIntent:(id)a3 error:(id *)a4;
- (id)markedMutableCopyWithMessage:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)realertCount;
- (void)addSecurityScope:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enterSecurityScope;
- (void)leaveSecurityScope;
- (void)removeSecurityScope;
- (void)setMarkedMutableCopyMessage:(id)a3;
@end

@implementation UNNotificationContent

- (id)contentByUpdatingWithSendMessageIntent:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[_UNMutableNotificationCommunicationContext mutableContextFromINIntent:v5];
  v7 = [v5 sender];
  if (v7)
  {
    v8 = [v5 serviceName];
    v9 = +[_UNNotificationContact contactFromINPerson:v7 serviceName:v8];

    if (v9)
    {
      [v6 setSender:v9];
    }
    else
    {
      v10 = [v5 sender];
      int v11 = [v10 isMe];

      if (v11) {
        v12 = @"Warning: -[INSendMessageIntent sender] isMe is YES. isMe should be NO for incoming notifications. Some notification features associated with INSendMessageIntent will not work.";
      }
      else {
        v12 = @"Warning: -[INSendMessageIntent sender] is invalid. Some notification features associated with INSendMessageIntent will not work.";
      }
      UNLogToDeveloper(@"-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]", (uint64_t)v12);
    }
  }
  else
  {
    UNLogToDeveloper(@"-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]", @"Warning: -[INSendMessageIntent sender] is nil. Some notification features associated with INSendMessageIntent will not work.");
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v13 = [v5 recipients];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16 = [v5 recipients];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __109__UNNotificationContent_UserNotifications_INSendMessageIntent__contentByUpdatingWithSendMessageIntent_error___block_invoke;
    v35[3] = &unk_1E5F05F88;
    id v36 = v5;
    id v17 = v15;
    id v37 = v17;
    v38 = &v39;
    [v16 enumerateObjectsUsingBlock:v35];

    [v6 setRecipients:v17];
  }
  v18 = [v5 speakableGroupName];
  v19 = [v18 spokenPhrase];
  [v6 setDisplayName:v19];

  v20 = [v5 conversationIdentifier];
  [v6 setIdentifier:v20];

  v21 = [v5 donationMetadata];
  v22 = UNLogCommunicationNotifications;
  BOOL v23 = os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136446210;
      v44 = "-[UNNotificationContent(UserNotifications_INSendMessageIntent) contentByUpdatingWithSendMessageIntent:error:]";
      _os_log_impl(&dword_1AE729000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: Intent has INSendMessageIntentDonationMetadata", buf, 0xCu);
    }
    objc_msgSend(v6, "setMentionsCurrentUser:", objc_msgSend(v21, "mentionsCurrentUser"));
    objc_msgSend(v6, "setNotifyRecipientAnyway:", objc_msgSend(v21, "notifyRecipientAnyway"));
    objc_msgSend(v6, "setReplyToCurrentUser:", objc_msgSend(v21, "isReplyToCurrentUser"));
    objc_msgSend(v6, "setBusinessCorrespondence:", objc_msgSend(v21, "isBusinessChat"));
    uint64_t v24 = [v21 recipientCount];
    if (v24)
    {
      unint64_t v25 = v24 - *((char *)v40 + 24);
      goto LABEL_20;
    }
  }
  else if (v23)
  {
    *(_DWORD *)buf = 136446210;
    v44 = "-[UNNotificationContent(UserNotifications_INSendMessageIntent) contentByUpdatingWithSendMessageIntent:error:]";
    _os_log_impl(&dword_1AE729000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: Intent does not have INSendMessageIntentDonationMetadata", buf, 0xCu);
  }
  unint64_t v25 = 0;
LABEL_20:
  v26 = [v6 recipients];
  unint64_t v27 = [v26 count];

  if (v27 <= v25) {
    unint64_t v28 = v25;
  }
  else {
    unint64_t v28 = v27;
  }
  [v6 setRecipientCount:v28];
  v29 = (void *)[(UNNotificationContent *)self mutableCopy];
  [v29 setCommunicationContext:v6];
  int v30 = [v6 isGroup];
  v31 = _UNNotificationContentTypeMessagingGroup;
  if (!v30) {
    v31 = _UNNotificationContentTypeMessagingDirect;
  }
  [v29 setContentType:*v31];
  v32 = (id)UNLogCommunicationNotifications;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [v29 contentType];
    *(_DWORD *)buf = 136446466;
    v44 = "-[UNNotificationContent(UserNotifications_INSendMessageIntent) contentByUpdatingWithSendMessageIntent:error:]";
    __int16 v45 = 2114;
    v46 = v33;
    _os_log_impl(&dword_1AE729000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s: Created communication context for INSendMessageIntent. Set -[UNNotificationContent contentType] to '%{public}@'", buf, 0x16u);
  }
  _Block_object_dispose(&v39, 8);

  return v29;
}

void __109__UNNotificationContent_UserNotifications_INSendMessageIntent__contentByUpdatingWithSendMessageIntent_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) serviceName];
  v4 = +[_UNNotificationContact contactFromINPerson:v5 serviceName:v3];

  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
  else if ([v5 isMe])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)contentByUpdatingWithAttributedMessageContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = [v6 sendMessageIntent];
    if (v8)
    {
      v9 = [(UNNotificationContent *)self contentByUpdatingWithSendMessageIntent:v8 error:a4];
      v10 = (void *)[v9 mutableCopy];

      int v11 = [v7 attributedContent];
      [v10 setAttributedBody:v11];

      v12 = (void *)[v10 copy];
    }
    else
    {
      UNLogToDeveloper(@"-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]", @"Warning: [UNNotificationAttributedMessageContext sendMessageIntent] is nil. Some notification features associated with INSendMessageIntent will not work.");
      v12 = (void *)[(UNNotificationContent *)self copy];
    }
  }
  else
  {
    UNLogToDeveloper(@"-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]", @"Warning: attributedMessageContext is nil. Some notification features associated with UNNotificationAttributedMessageContext will not work.");
    v12 = (void *)[(UNNotificationContent *)self copy];
  }

  return v12;
}

- (id)contentByUpdatingWithStartCallIntent:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[_UNMutableNotificationCommunicationContext mutableContextFromINIntent:v5];
  v7 = [v5 contacts];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = [v5 contacts];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __111__UNNotificationContent_UserNotifications_INStartCallIntentIntent__contentByUpdatingWithStartCallIntent_error___block_invoke;
    v23[3] = &unk_1E5F06038;
    id v24 = v5;
    id v11 = v6;
    id v25 = v11;
    id v26 = v9;
    id v12 = v9;
    [v10 enumerateObjectsUsingBlock:v23];

    [v11 setRecipients:v12];
    objc_msgSend(v11, "setRecipientCount:", objc_msgSend(v12, "count"));
  }
  else
  {
    UNLogToDeveloper(@"-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]", @"Warning: -[INStartCallIntent contacts] is empty. Some notification features associated with INStartCallIntent will not work.");
  }
  if ([v5 callCapability] == 2) {
    [v6 setCapabilities:1];
  }
  v13 = (void *)[(UNNotificationContent *)self mutableCopy];
  [v13 setCommunicationContext:v6];
  if ([v5 destinationType] == 3)
  {
    uint64_t v14 = _UNNotificationContentTypeVoicemail;
  }
  else if ([v5 destinationType] == 5 {
         && ([v5 callRecordToCallBack],
  }
             id v15 = objc_claimAutoreleasedReturnValue(),
             uint64_t v16 = [v15 callRecordType],
             v15,
             v16 == 2))
  {
    uint64_t v14 = _UNNotificationContentTypeMissedCall;
  }
  else
  {
    uint64_t v17 = [v5 destinationType];
    uint64_t v14 = _UNNotificationContentTypeCallOther;
    if (v17 == 1) {
      uint64_t v14 = _UNNotificationContentTypeIncomingCall;
    }
  }
  v18 = *v14;
  [v13 setContentType:v18];
  v19 = (void *)UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    v21 = [v13 contentType];
    *(_DWORD *)buf = 136446466;
    unint64_t v28 = "-[UNNotificationContent(UserNotifications_INStartCallIntentIntent) contentByUpdatingWithStartCallIntent:error:]";
    __int16 v29 = 2114;
    int v30 = v21;
    _os_log_impl(&dword_1AE729000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: Created communication context for INStartCallIntent. Set -[UNNotificationContent contentType] to '%{public}@'", buf, 0x16u);
  }

  return v13;
}

void __111__UNNotificationContent_UserNotifications_INStartCallIntentIntent__contentByUpdatingWithStartCallIntent_error___block_invoke(id *a1, uint64_t a2)
{
  v3 = +[_UNNotificationContact contactFromINPerson:a2 serviceName:0];
  if (v3)
  {
    id v6 = v3;
    v4 = [a1[4] contacts];
    uint64_t v5 = [v4 count];

    if (v5 == 1) {
      [a1[5] setSender:v6];
    }
    else {
      [a1[6] addObject:v6];
    }
    v3 = v6;
  }
}

- (id)contentByUpdatingWithReadAnnouncementIntent:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[(UNNotificationContent *)self mutableCopy];
  uint64_t v5 = UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[UNNotificationContent(UserNotifications_INStartCallIntentIntent) contentByUpdatingWithReadAnnouncementIntent:error:]";
    __int16 v9 = 2114;
    v10 = @"UNNotificationContentTypeIntercom";
    _os_log_impl(&dword_1AE729000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Setting content type to '%{public}@'", (uint8_t *)&v7, 0x16u);
  }
  [v4 setContentType:@"UNNotificationContentTypeIntercom"];

  return v4;
}

- (UNNotificationContent)contentByUpdatingWithProvider:(id)provider error:(NSError *)outError
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = provider;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2050000000;
  int v7 = (void *)getINSendMessageIntentClass_softClass_0;
  uint64_t v25 = getINSendMessageIntentClass_softClass_0;
  if (!getINSendMessageIntentClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getINSendMessageIntentClass_block_invoke_0;
    unint64_t v27 = &unk_1E5F061A8;
    v28[0] = &v22;
    __getINSendMessageIntentClass_block_invoke_0((uint64_t)buf);
    int v7 = (void *)v23[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v22, 8);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(UNNotificationContent *)self contentByUpdatingWithSendMessageIntent:v6 error:outError];
LABEL_15:
    uint64_t v14 = (void *)v9;
    goto LABEL_16;
  }
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v10 = (void *)getINStartCallIntentClass_softClass_0;
  uint64_t v25 = getINStartCallIntentClass_softClass_0;
  if (!getINStartCallIntentClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getINStartCallIntentClass_block_invoke_0;
    unint64_t v27 = &unk_1E5F061A8;
    v28[0] = &v22;
    __getINStartCallIntentClass_block_invoke_0((uint64_t)buf);
    v10 = (void *)v23[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v22, 8);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(UNNotificationContent *)self contentByUpdatingWithStartCallIntent:v6 error:outError];
    goto LABEL_15;
  }
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v12 = (void *)getINReadAnnouncementIntentClass_softClass;
  uint64_t v25 = getINReadAnnouncementIntentClass_softClass;
  if (!getINReadAnnouncementIntentClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getINReadAnnouncementIntentClass_block_invoke;
    unint64_t v27 = &unk_1E5F061A8;
    v28[0] = &v22;
    __getINReadAnnouncementIntentClass_block_invoke((uint64_t)buf);
    id v12 = (void *)v23[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v22, 8);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(UNNotificationContent *)self contentByUpdatingWithReadAnnouncementIntent:v6 error:outError];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(UNNotificationContent *)self contentByUpdatingWithAttributedMessageContext:v6 error:outError];
    goto LABEL_15;
  }
  if (outError)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "un_errorWithUNErrorCode:userInfo:", 1500, 0);
    *outError = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  UNLogToDeveloper(@"-[UNNotificationContent contentByUpdatingWithProvider:(id<UNNotificationContentProviding>) error:(NSError *)]", @"%{public}s: Error: You provided an invalid object of type %{public}@. Only system framework objects conforming to UNNotificationContentProviding are allowed.");
  uint64_t v14 = 0;
LABEL_16:
  id v15 = (void *)UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    uint64_t v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = [v14 contentType];
    v20 = [v14 communicationContext];
    *(_DWORD *)buf = 136446978;
    *(void *)&uint8_t buf[4] = "-[UNNotificationContent contentByUpdatingWithProvider:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    unint64_t v27 = v19;
    LOWORD(v28[0]) = 2114;
    *(void *)((char *)v28 + 2) = v20;
    _os_log_impl(&dword_1AE729000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: Provided object of type '%{public}@'. Assigned content type: '%{public}@' Created communication context: '%{public}@'", buf, 0x2Au);
  }

  return (UNNotificationContent *)v14;
}

- (id)_initWithContentType:(id)a3 communicationContext:(id)a4 accessoryImageName:(id)a5 attachments:(id)a6 badge:(id)a7 body:(id)a8 attributedBody:(id)a9 categoryIdentifier:(id)a10 date:(id)a11 icon:(id)a12 defaultActionTitle:(id)a13 defaultActionURL:(id)a14 defaultActionBundleIdentifier:(id)a15 expirationDate:(id)a16 header:(id)a17 footer:(id)a18 launchImageName:(id)a19 peopleIdentifiers:(id)a20 shouldHideDate:(BOOL)a21 shouldHideTime:(BOOL)a22 shouldIgnoreDoNotDisturb:(BOOL)a23 shouldIgnoreDowntime:(BOOL)a24 shouldSuppressScreenLightUp:(BOOL)a25 shouldAuthenticateDefaultAction:(BOOL)a26 shouldBackgroundDefaultAction:(BOOL)a27 shouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a28 shouldShowSubordinateIcon:(BOOL)a29 shouldSuppressDefaultAction:(BOOL)a30 shouldSuppressSyncDismissalWhenRemoved:(BOOL)a31 shouldUseRequestIdentifierForDismissalSync:(BOOL)a32 shouldPreemptPresentedNotification:(BOOL)a33 shouldDisplayActionsInline:(BOOL)a34 sound:(id)a35 subtitle:(id)a36 threadIdentifier:(id)a37 title:(id)a38 topicIdentifiers:(id)a39 realertCount:(unint64_t)a40 summaryArgument:(id)a41 summaryArgumentCount:(unint64_t)a42 targetContentIdentifier:(id)a43 interruptionLevel:(unint64_t)a44 relevanceScore:(double)a45 filterCriteria:(id)a46 screenCaptureProhibited:(BOOL)a47 speechLanguage:(id)a48 userInfo:(id)a49
{
  id v129 = a3;
  id v128 = a4;
  id obj = a5;
  id v115 = a5;
  id v127 = a6;
  id v126 = a7;
  id v124 = a8;
  id v122 = a9;
  id v121 = a10;
  id v120 = a11;
  id v114 = a12;
  id v113 = a13;
  id v112 = a14;
  id v111 = a15;
  id v119 = a16;
  id v110 = a17;
  id v109 = a18;
  id v118 = a19;
  id v117 = a20;
  id v53 = a35;
  id v54 = a36;
  id v55 = a37;
  id v56 = a38;
  id v57 = a39;
  id v58 = a41;
  id v59 = a43;
  id v60 = a46;
  id v61 = a48;
  id v62 = a49;
  if (!v62)
  {
    id v62 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  v116 = v62;
  v130.receiver = self;
  v130.super_class = (Class)UNNotificationContent;
  v63 = [(UNNotificationContent *)&v130 init];
  if (v63)
  {
    uint64_t v64 = [v129 copy];
    contentType = v63->_contentType;
    v63->_contentType = (NSString *)v64;

    uint64_t v66 = [v128 copy];
    communicationContext = v63->_communicationContext;
    v63->_communicationContext = (_UNNotificationCommunicationContext *)v66;

    objc_storeStrong((id *)&v63->_accessoryImageName, obj);
    uint64_t v68 = [v127 copy];
    attachments = v63->_attachments;
    v63->_attachments = (NSArray *)v68;

    uint64_t v70 = [v126 copy];
    badge = v63->_badge;
    v63->_badge = (NSNumber *)v70;

    uint64_t v72 = [v124 copy];
    body = v63->_body;
    v63->_body = (NSString *)v72;

    uint64_t v74 = [v122 copy];
    attributedBody = v63->_attributedBody;
    v63->_attributedBody = (NSAttributedString *)v74;

    uint64_t v76 = [v121 copy];
    categoryIdentifier = v63->_categoryIdentifier;
    v63->_categoryIdentifier = (NSString *)v76;

    uint64_t v78 = [v120 copy];
    date = v63->_date;
    v63->_date = (NSDate *)v78;

    uint64_t v80 = [v119 copy];
    expirationDate = v63->_expirationDate;
    v63->_expirationDate = (NSDate *)v80;

    objc_storeStrong((id *)&v63->_icon, a12);
    objc_storeStrong((id *)&v63->_defaultActionTitle, a13);
    objc_storeStrong((id *)&v63->_defaultActionURL, a14);
    objc_storeStrong((id *)&v63->_defaultActionBundleIdentifier, a15);
    objc_storeStrong((id *)&v63->_header, a17);
    objc_storeStrong((id *)&v63->_footer, a18);
    uint64_t v82 = [v118 copy];
    launchImageName = v63->_launchImageName;
    v63->_launchImageName = (NSString *)v82;

    uint64_t v84 = [v117 copy];
    peopleIdentifiers = v63->_peopleIdentifiers;
    v63->_peopleIdentifiers = (NSArray *)v84;

    v63->_shouldHideDate = a21;
    v63->_shouldHideTime = a22;
    v63->_shouldIgnoreDoNotDisturb = a23;
    v63->_shouldIgnoreDowntime = a24;
    v63->_shouldAuthenticateDefaultAction = a26;
    v63->_shouldBackgroundDefaultAction = a27;
    v63->_shouldPreventNotificationDismissalAfterDefaultAction = a28;
    v63->_shouldShowSubordinateIcon = a29;
    v63->_shouldSuppressDefaultAction = a30;
    v63->_shouldSuppressScreenLightUp = a25;
    v63->_shouldSuppressSyncDismissalWhenRemoved = a31;
    v63->_shouldUseRequestIdentifierForDismissalSync = a32;
    v63->_shouldPreemptPresentedNotification = a33;
    v63->_shouldDisplayActionsInline = a34;
    uint64_t v86 = [v53 copy];
    sound = v63->_sound;
    v63->_sound = (UNNotificationSound *)v86;

    uint64_t v88 = [v54 copy];
    subtitle = v63->_subtitle;
    v63->_subtitle = (NSString *)v88;

    uint64_t v90 = [v55 copy];
    threadIdentifier = v63->_threadIdentifier;
    v63->_threadIdentifier = (NSString *)v90;

    uint64_t v92 = [v56 copy];
    title = v63->_title;
    v63->_title = (NSString *)v92;

    uint64_t v94 = [v57 copy];
    topicIdentifiers = v63->_topicIdentifiers;
    v63->_topicIdentifiers = (NSSet *)v94;

    v63->_realertCount = a40;
    uint64_t v96 = [v58 copy];
    summaryArgument = v63->_summaryArgument;
    v63->_summaryArgument = (NSString *)v96;

    v63->_summaryArgumentCount = a42;
    uint64_t v98 = [v59 copy];
    targetContentIdentifier = v63->_targetContentIdentifier;
    v63->_targetContentIdentifier = (NSString *)v98;

    v63->_interruptionLevel = a44;
    v63->_relevanceScore = a45;
    uint64_t v100 = [v60 copy];
    filterCriteria = v63->_filterCriteria;
    v63->_filterCriteria = (NSString *)v100;

    v63->_screenCaptureProhibited = a47;
    uint64_t v102 = [v61 copy];
    speechLanguage = v63->_speechLanguage;
    v63->_speechLanguage = (NSString *)v102;

    uint64_t v104 = [v116 copy];
    userInfo = v63->_userInfo;
    v63->_userInfo = (NSDictionary *)v104;
  }
  return v63;
}

- (unint64_t)hash
{
  uint64_t v80 = [(UNNotificationContent *)self contentType];
  uint64_t v3 = [v80 hash];
  v79 = [(UNNotificationContent *)self communicationContext];
  uint64_t v4 = [v79 hash] ^ v3;
  uint64_t v78 = [(UNNotificationContent *)self accessoryImageName];
  uint64_t v5 = [v78 hash];
  v77 = [(UNNotificationContent *)self attachments];
  uint64_t v6 = v4 ^ v5 ^ [v77 hash];
  uint64_t v76 = [(UNNotificationContent *)self badge];
  uint64_t v7 = [v76 hash];
  v75 = [(UNNotificationContent *)self body];
  uint64_t v8 = v7 ^ [v75 hash];
  uint64_t v74 = [(UNNotificationContent *)self attributedBody];
  uint64_t v9 = v6 ^ v8 ^ [v74 hash];
  v73 = [(UNNotificationContent *)self categoryIdentifier];
  uint64_t v10 = [v73 hash];
  uint64_t v72 = [(UNNotificationContent *)self date];
  uint64_t v11 = v10 ^ [v72 hash];
  v71 = [(UNNotificationContent *)self expirationDate];
  uint64_t v12 = v11 ^ [v71 hash];
  uint64_t v70 = [(UNNotificationContent *)self defaultActionTitle];
  uint64_t v13 = v9 ^ v12 ^ [v70 hash];
  v69 = [(UNNotificationContent *)self defaultActionURL];
  uint64_t v14 = [v69 hash];
  uint64_t v68 = [(UNNotificationContent *)self defaultActionBundleIdentifier];
  uint64_t v15 = v14 ^ [v68 hash];
  v67 = [(UNNotificationContent *)self icon];
  uint64_t v16 = v15 ^ [v67 hash];
  uint64_t v66 = [(UNNotificationContent *)self header];
  uint64_t v17 = v16 ^ [v66 hash];
  v65 = [(UNNotificationContent *)self footer];
  uint64_t v18 = v13 ^ v17 ^ [v65 hash];
  uint64_t v64 = [(UNNotificationContent *)self launchImageName];
  uint64_t v19 = [v64 hash];
  v63 = [(UNNotificationContent *)self peopleIdentifiers];
  uint64_t v20 = v19 ^ [v63 hash];
  uint64_t v21 = v20 ^ [(UNNotificationContent *)self shouldHideDate];
  uint64_t v22 = v21 ^ [(UNNotificationContent *)self shouldHideTime];
  uint64_t v23 = v22 ^ [(UNNotificationContent *)self shouldIgnoreDoNotDisturb];
  uint64_t v24 = v18 ^ v23 ^ [(UNNotificationContent *)self shouldIgnoreDowntime];
  uint64_t v25 = [(UNNotificationContent *)self shouldSuppressScreenLightUp];
  uint64_t v26 = v25 ^ [(UNNotificationContent *)self shouldAuthenticateDefaultAction];
  uint64_t v27 = v26 ^ [(UNNotificationContent *)self shouldBackgroundDefaultAction];
  uint64_t v28 = v27 ^ [(UNNotificationContent *)self shouldShowSubordinateIcon];
  uint64_t v29 = v28 ^ [(UNNotificationContent *)self shouldPreventNotificationDismissalAfterDefaultAction];
  uint64_t v30 = v24 ^ v29 ^ [(UNNotificationContent *)self shouldSuppressDefaultAction];
  uint64_t v31 = [(UNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  uint64_t v32 = v31 ^ [(UNNotificationContent *)self shouldUseRequestIdentifierForDismissalSync];
  uint64_t v33 = v32 ^ [(UNNotificationContent *)self shouldPreemptPresentedNotification];
  uint64_t v34 = v33 ^ [(UNNotificationContent *)self shouldDisplayActionsInline];
  id v62 = [(UNNotificationContent *)self sound];
  uint64_t v35 = v34 ^ [v62 hash];
  id v61 = [(UNNotificationContent *)self subtitle];
  uint64_t v36 = v35 ^ [v61 hash];
  id v37 = [(UNNotificationContent *)self threadIdentifier];
  uint64_t v38 = v30 ^ v36 ^ [v37 hash];
  uint64_t v39 = [(UNNotificationContent *)self title];
  uint64_t v40 = [v39 hash];
  uint64_t v41 = [(UNNotificationContent *)self topicIdentifiers];
  uint64_t v42 = v40 ^ [v41 hash];
  unint64_t v43 = v42 ^ [(UNNotificationContent *)self realertCount];
  v44 = [(UNNotificationContent *)self summaryArgument];
  uint64_t v45 = v43 ^ [v44 hash];
  NSUInteger v46 = v45 ^ [(UNNotificationContent *)self summaryArgumentCount];
  uint64_t v47 = [(UNNotificationContent *)self targetContentIdentifier];
  uint64_t v48 = v46 ^ [v47 hash];
  unint64_t v49 = v48 ^ [(UNNotificationContent *)self interruptionLevel];
  v50 = NSNumber;
  [(UNNotificationContent *)self relevanceScore];
  v51 = objc_msgSend(v50, "numberWithDouble:");
  uint64_t v52 = v49 ^ [v51 hash];
  id v53 = [(UNNotificationContent *)self filterCriteria];
  uint64_t v60 = v38 ^ v52 ^ [v53 hash];
  uint64_t v54 = [(UNNotificationContent *)self screenCaptureProhibited];
  id v55 = [(UNNotificationContent *)self userInfo];
  uint64_t v56 = v54 ^ [v55 hash];

  id v57 = [(UNNotificationContent *)self speechLanguage];
  unint64_t v58 = v60 ^ v56 ^ [v57 hash];

  return v58;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_49;
  }
  uint64_t v5 = [(UNNotificationContent *)self contentType];
  uint64_t v6 = [v4 contentType];
  int v7 = UNEqualStrings(v5, v6);

  if (!v7) {
    goto LABEL_49;
  }
  uint64_t v8 = [(UNNotificationContent *)self communicationContext];
  uint64_t v9 = [v4 communicationContext];
  int v10 = UNEqualObjects(v8, v9);

  if (!v10) {
    goto LABEL_49;
  }
  uint64_t v11 = [(UNNotificationContent *)self accessoryImageName];
  uint64_t v12 = [v4 accessoryImageName];
  int v13 = UNEqualObjects(v11, v12);

  if (!v13) {
    goto LABEL_49;
  }
  uint64_t v14 = [(UNNotificationContent *)self attachments];
  uint64_t v15 = [v4 attachments];
  int v16 = UNEqualObjects(v14, v15);

  if (!v16) {
    goto LABEL_49;
  }
  uint64_t v17 = [(UNNotificationContent *)self badge];
  uint64_t v18 = [v4 badge];
  int v19 = UNEqualObjects(v17, v18);

  if (!v19) {
    goto LABEL_49;
  }
  uint64_t v20 = [(UNNotificationContent *)self body];
  uint64_t v21 = [v4 body];
  int v22 = UNEqualObjects(v20, v21);

  if (!v22) {
    goto LABEL_49;
  }
  uint64_t v23 = [(UNNotificationContent *)self attributedBody];
  uint64_t v24 = [v4 attributedBody];
  int v25 = UNEqualObjects(v23, v24);

  if (!v25) {
    goto LABEL_49;
  }
  uint64_t v26 = [(UNNotificationContent *)self categoryIdentifier];
  uint64_t v27 = [v4 categoryIdentifier];
  int v28 = UNEqualStrings(v26, v27);

  if (!v28) {
    goto LABEL_49;
  }
  uint64_t v29 = [(UNNotificationContent *)self date];
  uint64_t v30 = [v4 date];
  int v31 = UNEqualObjects(v29, v30);

  if (!v31) {
    goto LABEL_49;
  }
  uint64_t v32 = [(UNNotificationContent *)self expirationDate];
  uint64_t v33 = [v4 expirationDate];
  int v34 = UNEqualObjects(v32, v33);

  if (!v34) {
    goto LABEL_49;
  }
  uint64_t v35 = [(UNNotificationContent *)self defaultActionTitle];
  uint64_t v36 = [v4 defaultActionTitle];
  int v37 = UNEqualStrings(v35, v36);

  if (!v37) {
    goto LABEL_49;
  }
  uint64_t v38 = [(UNNotificationContent *)self defaultActionURL];
  uint64_t v39 = [v4 defaultActionURL];
  int v40 = UNEqualObjects(v38, v39);

  if (!v40) {
    goto LABEL_49;
  }
  uint64_t v41 = [(UNNotificationContent *)self defaultActionBundleIdentifier];
  uint64_t v42 = [v4 defaultActionBundleIdentifier];
  int v43 = UNEqualStrings(v41, v42);

  if (!v43) {
    goto LABEL_49;
  }
  v44 = [(UNNotificationContent *)self icon];
  uint64_t v45 = [v4 icon];
  int v46 = UNEqualObjects(v44, v45);

  if (!v46) {
    goto LABEL_49;
  }
  uint64_t v47 = [(UNNotificationContent *)self header];
  uint64_t v48 = [v4 header];
  int v49 = UNEqualStrings(v47, v48);

  if (!v49) {
    goto LABEL_49;
  }
  v50 = [(UNNotificationContent *)self footer];
  v51 = [v4 footer];
  int v52 = UNEqualStrings(v50, v51);

  if (!v52) {
    goto LABEL_49;
  }
  id v53 = [(UNNotificationContent *)self launchImageName];
  uint64_t v54 = [v4 launchImageName];
  int v55 = UNEqualObjects(v53, v54);

  if (!v55) {
    goto LABEL_49;
  }
  uint64_t v56 = [(UNNotificationContent *)self peopleIdentifiers];
  id v57 = [v4 peopleIdentifiers];
  int v58 = UNEqualObjects(v56, v57);

  if (!v58) {
    goto LABEL_49;
  }
  int v59 = [(UNNotificationContent *)self shouldHideDate];
  if (v59 != [v4 shouldHideDate]) {
    goto LABEL_49;
  }
  int v60 = [(UNNotificationContent *)self shouldHideTime];
  if (v60 != [v4 shouldHideTime]) {
    goto LABEL_49;
  }
  int v61 = [(UNNotificationContent *)self shouldIgnoreDoNotDisturb];
  if (v61 != [v4 shouldIgnoreDoNotDisturb]) {
    goto LABEL_49;
  }
  int v62 = [(UNNotificationContent *)self shouldIgnoreDowntime];
  if (v62 != [v4 shouldIgnoreDowntime]) {
    goto LABEL_49;
  }
  int v63 = [(UNNotificationContent *)self shouldAuthenticateDefaultAction];
  if (v63 != [v4 shouldAuthenticateDefaultAction]) {
    goto LABEL_49;
  }
  int v64 = [(UNNotificationContent *)self shouldBackgroundDefaultAction];
  if (v64 != [v4 shouldBackgroundDefaultAction]) {
    goto LABEL_49;
  }
  int v65 = [(UNNotificationContent *)self shouldShowSubordinateIcon];
  if (v65 != [v4 shouldShowSubordinateIcon]) {
    goto LABEL_49;
  }
  int v66 = [(UNNotificationContent *)self shouldPreventNotificationDismissalAfterDefaultAction];
  if (v66 != [v4 shouldPreventNotificationDismissalAfterDefaultAction]) {
    goto LABEL_49;
  }
  int v67 = [(UNNotificationContent *)self shouldSuppressDefaultAction];
  if (v67 != [v4 shouldSuppressDefaultAction]) {
    goto LABEL_49;
  }
  int v68 = [(UNNotificationContent *)self shouldSuppressScreenLightUp];
  if (v68 != [v4 shouldSuppressScreenLightUp]) {
    goto LABEL_49;
  }
  int v69 = [(UNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  if (v69 != [v4 shouldSuppressSyncDismissalWhenRemoved]) {
    goto LABEL_49;
  }
  int v70 = [(UNNotificationContent *)self shouldUseRequestIdentifierForDismissalSync];
  if (v70 != [v4 shouldUseRequestIdentifierForDismissalSync]) {
    goto LABEL_49;
  }
  int v71 = [(UNNotificationContent *)self shouldPreemptPresentedNotification];
  if (v71 != [v4 shouldPreemptPresentedNotification]) {
    goto LABEL_49;
  }
  int v72 = [(UNNotificationContent *)self shouldDisplayActionsInline];
  if (v72 != [v4 shouldDisplayActionsInline]) {
    goto LABEL_49;
  }
  v73 = [(UNNotificationContent *)self sound];
  uint64_t v74 = [v4 sound];
  int v75 = UNEqualObjects(v73, v74);

  if (!v75) {
    goto LABEL_49;
  }
  uint64_t v76 = [(UNNotificationContent *)self subtitle];
  v77 = [v4 subtitle];
  int v78 = UNEqualObjects(v76, v77);

  if (!v78) {
    goto LABEL_49;
  }
  v79 = [(UNNotificationContent *)self threadIdentifier];
  uint64_t v80 = [v4 threadIdentifier];
  int v81 = UNEqualStrings(v79, v80);

  if (!v81) {
    goto LABEL_49;
  }
  uint64_t v82 = [(UNNotificationContent *)self title];
  v83 = [v4 title];
  int v84 = UNEqualObjects(v82, v83);

  if (!v84) {
    goto LABEL_49;
  }
  v85 = [(UNNotificationContent *)self topicIdentifiers];
  uint64_t v86 = [v4 topicIdentifiers];
  int v87 = UNEqualObjects(v85, v86);

  if (!v87) {
    goto LABEL_49;
  }
  unint64_t v88 = [(UNNotificationContent *)self realertCount];
  if (v88 != [v4 realertCount]) {
    goto LABEL_49;
  }
  v89 = [(UNNotificationContent *)self summaryArgument];
  uint64_t v90 = [v4 summaryArgument];
  int v91 = UNEqualStrings(v89, v90);

  if (!v91) {
    goto LABEL_49;
  }
  NSUInteger v92 = [(UNNotificationContent *)self summaryArgumentCount];
  if (v92 != [v4 summaryArgumentCount]) {
    goto LABEL_49;
  }
  v93 = [(UNNotificationContent *)self targetContentIdentifier];
  uint64_t v94 = [v4 targetContentIdentifier];
  int v95 = UNEqualStrings(v93, v94);

  if (!v95) {
    goto LABEL_49;
  }
  UNNotificationInterruptionLevel v96 = [(UNNotificationContent *)self interruptionLevel];
  if (v96 != [v4 interruptionLevel]) {
    goto LABEL_49;
  }
  [(UNNotificationContent *)self relevanceScore];
  double v98 = v97;
  [v4 relevanceScore];
  if (v98 != v99) {
    goto LABEL_49;
  }
  uint64_t v100 = [(UNNotificationContent *)self filterCriteria];
  v101 = [v4 filterCriteria];
  int v102 = UNEqualStrings(v100, v101);

  if (!v102) {
    goto LABEL_49;
  }
  int v103 = [(UNNotificationContent *)self screenCaptureProhibited];
  if (v103 != [v4 screenCaptureProhibited]) {
    goto LABEL_49;
  }
  uint64_t v104 = [(UNNotificationContent *)self userInfo];
  v105 = [v4 userInfo];
  int v106 = UNEqualObjects(v104, v105);

  if (v106)
  {
    v107 = [(UNNotificationContent *)self speechLanguage];
    v108 = [v4 speechLanguage];
    char v109 = UNEqualStrings(v107, v108);
  }
  else
  {
LABEL_49:
    char v109 = 0;
  }

  return v109;
}

- (NSString)contentType
{
  v2 = (void *)[(NSString *)self->_contentType copy];

  return (NSString *)v2;
}

- (_UNNotificationCommunicationContext)communicationContext
{
  v2 = (void *)[(_UNNotificationCommunicationContext *)self->_communicationContext copy];

  return (_UNNotificationCommunicationContext *)v2;
}

- (NSDate)date
{
  v2 = (void *)[(NSDate *)self->_date copy];

  return (NSDate *)v2;
}

- (NSString)defaultActionTitle
{
  v2 = (void *)[(NSString *)self->_defaultActionTitle copy];

  return (NSString *)v2;
}

- (NSURL)defaultActionURL
{
  v2 = (void *)[(NSURL *)self->_defaultActionURL copy];

  return (NSURL *)v2;
}

- (NSString)defaultActionBundleIdentifier
{
  v2 = (void *)[(NSString *)self->_defaultActionBundleIdentifier copy];

  return (NSString *)v2;
}

- (BOOL)hasDefaultAction
{
  return ![(UNNotificationContent *)self shouldSuppressDefaultAction];
}

- (NSString)header
{
  v2 = (void *)[(NSString *)self->_header copy];

  return (NSString *)v2;
}

- (NSString)footer
{
  v2 = (void *)[(NSString *)self->_footer copy];

  return (NSString *)v2;
}

- (NSString)accessoryImageName
{
  v2 = (void *)[(NSString *)self->_accessoryImageName copy];

  return (NSString *)v2;
}

- (UNNotificationIcon)icon
{
  v2 = (void *)[(UNNotificationIcon *)self->_icon copy];

  return (UNNotificationIcon *)v2;
}

- (NSString)launchImageName
{
  v2 = (void *)[(NSString *)self->_launchImageName copy];

  return (NSString *)v2;
}

- (NSArray)peopleIdentifiers
{
  v2 = (void *)[(NSArray *)self->_peopleIdentifiers copy];

  return (NSArray *)v2;
}

- (BOOL)shouldHideDate
{
  return self->_shouldHideDate;
}

- (BOOL)shouldHideTime
{
  return self->_shouldHideTime;
}

- (BOOL)shouldIgnoreDoNotDisturb
{
  return self->_shouldIgnoreDoNotDisturb;
}

- (BOOL)shouldIgnoreDowntime
{
  return self->_shouldIgnoreDowntime;
}

- (BOOL)shouldAuthenticateDefaultAction
{
  return self->_shouldAuthenticateDefaultAction;
}

- (BOOL)shouldBackgroundDefaultAction
{
  return self->_shouldBackgroundDefaultAction;
}

- (BOOL)shouldPreventNotificationDismissalAfterDefaultAction
{
  return self->_shouldPreventNotificationDismissalAfterDefaultAction;
}

- (BOOL)shouldShowSubordinateIcon
{
  return self->_shouldShowSubordinateIcon;
}

- (BOOL)shouldSuppressDefaultAction
{
  return self->_shouldSuppressDefaultAction;
}

- (BOOL)shouldSuppressScreenLightUp
{
  return self->_shouldSuppressScreenLightUp;
}

- (BOOL)shouldSuppressSyncDismissalWhenRemoved
{
  return self->_shouldSuppressSyncDismissalWhenRemoved;
}

- (BOOL)shouldUseRequestIdentifierForDismissalSync
{
  return self->_shouldUseRequestIdentifierForDismissalSync;
}

- (BOOL)shouldPreemptPresentedNotification
{
  return self->_shouldPreemptPresentedNotification;
}

- (BOOL)shouldDisplayActionsInline
{
  return self->_shouldDisplayActionsInline;
}

- (NSString)subtitle
{
  v2 = (void *)[(NSString *)self->_subtitle copy];

  return (NSString *)v2;
}

- (NSSet)topicIdentifiers
{
  v2 = (void *)[(NSSet *)self->_topicIdentifiers copy];

  return (NSSet *)v2;
}

- (unint64_t)realertCount
{
  return self->_realertCount;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (UNNotificationInterruptionLevel)interruptionLevel
{
  return self->_interruptionLevel;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (NSString)description
{
  return (NSString *)[(UNNotificationContent *)self _descriptionForDebug:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(UNNotificationContent *)self _descriptionForDebug:1];
}

- (id)_descriptionForDebug:(BOOL)a3
{
  BOOL v3 = a3;
  int v31 = [(UNNotificationContent *)self speechLanguage];
  uint64_t v26 = NSString;
  uint64_t v24 = objc_opt_class();
  uint64_t v29 = [(UNNotificationContent *)self title];
  uint64_t v23 = [(UNNotificationContent *)self _safeStringForString:v29 debug:v3];
  int v28 = [(UNNotificationContent *)self subtitle];
  uint64_t v21 = [(UNNotificationContent *)self _safeStringForString:v28 debug:v3];
  uint64_t v27 = [(UNNotificationContent *)self body];
  uint64_t v20 = [(UNNotificationContent *)self _safeStringForString:v27 debug:v3];
  int v25 = [(UNNotificationContent *)self attributedBody];
  uint64_t v30 = [(UNNotificationContent *)self _safeAttributedStringForAttributedString:v25 debug:v3];
  int v22 = [(UNNotificationContent *)self summaryArgument];
  uint64_t v17 = [(UNNotificationContent *)self _safeStringForString:v22 debug:v3];
  NSUInteger v19 = [(UNNotificationContent *)self summaryArgumentCount];
  int v16 = [(UNNotificationContent *)self categoryIdentifier];
  uint64_t v18 = [(UNNotificationContent *)self launchImageName];
  uint64_t v5 = [(UNNotificationContent *)self threadIdentifier];
  uint64_t v6 = [(UNNotificationContent *)self attachments];
  int v7 = [(UNNotificationContent *)self badge];
  uint64_t v8 = [(UNNotificationContent *)self sound];
  unint64_t v9 = [(UNNotificationContent *)self realertCount];
  UNNotificationInterruptionLevel v10 = [(UNNotificationContent *)self interruptionLevel];
  [(UNNotificationContent *)self relevanceScore];
  uint64_t v12 = v11;
  int v13 = [(UNNotificationContent *)self filterCriteria];
  objc_msgSend(v26, "stringWithFormat:", @"<%@: %p; title: %@, subtitle: %@, body: %@, attributedBody: %@, summaryArgument: %@, summaryArgumentCount: %u, categoryIdentifier: %@, launchImageName: %@, threadIdentifier: %@, attachments: %@, badge: %@, sound: %@, realert: %u, interruptionLevel: %lu, relevanceScore: %.2f, filterCriteria: %@, screenCaptureProhibited: %d, speechLanguage: %@",
    v24,
    self,
    v23,
    v21,
    v20,
    v30,
    v17,
    v19,
    v16,
    v18,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v12,
    v13,
    [(UNNotificationContent *)self screenCaptureProhibited],
  uint64_t v14 = v31);

  return v14;
}

- (id)_safeStringForString:(id)a3 debug:(BOOL)a4
{
  uint64_t v5 = (__CFString *)a3;
  uint64_t v6 = v5;
  if (a4 || ![(__CFString *)v5 length]) {
    int v7 = v6;
  }
  else {
    int v7 = @"<redacted>";
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)_safeAttributedStringForAttributedString:(id)a3 debug:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 || ![v5 length]) {
    id v7 = v6;
  }
  else {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"<redacted>"];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)markedMutableCopyWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(UNNotificationContent *)self mutableCopy];
  [v5 setMarkedMutableCopyMessage:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int v58 = [(UNNotificationContent *)self speechLanguage];
  int v40 = +[UNMutableNotificationContent allocWithZone:a3];
  id v57 = [(UNNotificationContent *)self contentType];
  uint64_t v56 = [(UNNotificationContent *)self communicationContext];
  int v55 = [(UNNotificationContent *)self accessoryImageName];
  uint64_t v54 = [(UNNotificationContent *)self attachments];
  int v52 = [(UNNotificationContent *)self badge];
  v51 = [(UNNotificationContent *)self body];
  id v53 = [(UNNotificationContent *)self attributedBody];
  uint64_t v47 = [(UNNotificationContent *)self categoryIdentifier];
  v50 = [(UNNotificationContent *)self date];
  int v49 = [(UNNotificationContent *)self icon];
  uint64_t v48 = [(UNNotificationContent *)self defaultActionTitle];
  int v46 = [(UNNotificationContent *)self defaultActionURL];
  uint64_t v39 = [(UNNotificationContent *)self defaultActionBundleIdentifier];
  uint64_t v38 = [(UNNotificationContent *)self expirationDate];
  int v37 = [(UNNotificationContent *)self header];
  uint64_t v45 = [(UNNotificationContent *)self footer];
  uint64_t v36 = [(UNNotificationContent *)self launchImageName];
  v44 = [(UNNotificationContent *)self peopleIdentifiers];
  BOOL v35 = [(UNNotificationContent *)self shouldHideDate];
  BOOL v34 = [(UNNotificationContent *)self shouldHideTime];
  BOOL v33 = [(UNNotificationContent *)self shouldIgnoreDoNotDisturb];
  BOOL v32 = [(UNNotificationContent *)self shouldIgnoreDowntime];
  BOOL v31 = [(UNNotificationContent *)self shouldSuppressScreenLightUp];
  BOOL v30 = [(UNNotificationContent *)self shouldAuthenticateDefaultAction];
  BOOL v29 = [(UNNotificationContent *)self shouldBackgroundDefaultAction];
  BOOL v28 = [(UNNotificationContent *)self shouldPreventNotificationDismissalAfterDefaultAction];
  BOOL v25 = [(UNNotificationContent *)self shouldShowSubordinateIcon];
  BOOL v27 = [(UNNotificationContent *)self shouldSuppressDefaultAction];
  BOOL v26 = [(UNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  BOOL v24 = [(UNNotificationContent *)self shouldUseRequestIdentifierForDismissalSync];
  BOOL v23 = [(UNNotificationContent *)self shouldPreemptPresentedNotification];
  BOOL v5 = [(UNNotificationContent *)self shouldDisplayActionsInline];
  int v43 = [(UNNotificationContent *)self sound];
  uint64_t v42 = [(UNNotificationContent *)self subtitle];
  uint64_t v20 = [(UNNotificationContent *)self threadIdentifier];
  int v22 = [(UNNotificationContent *)self title];
  uint64_t v21 = [(UNNotificationContent *)self topicIdentifiers];
  unint64_t v6 = [(UNNotificationContent *)self realertCount];
  id v7 = [(UNNotificationContent *)self summaryArgument];
  NSUInteger v8 = [(UNNotificationContent *)self summaryArgumentCount];
  unint64_t v9 = [(UNNotificationContent *)self targetContentIdentifier];
  UNNotificationInterruptionLevel v10 = [(UNNotificationContent *)self interruptionLevel];
  [(UNNotificationContent *)self relevanceScore];
  double v12 = v11;
  int v13 = [(UNNotificationContent *)self filterCriteria];
  BOOL v14 = [(UNNotificationContent *)self screenCaptureProhibited];
  uint64_t v15 = [(UNNotificationContent *)self userInfo];
  LOBYTE(v19) = v14;
  BYTE5(v18) = v5;
  BYTE4(v18) = v23;
  BYTE3(v18) = v24;
  BYTE2(v18) = v26;
  BYTE1(v18) = v27;
  LOBYTE(v18) = v25;
  HIBYTE(v17) = v28;
  BYTE6(v17) = v29;
  BYTE5(v17) = v30;
  BYTE4(v17) = v31;
  BYTE3(v17) = v32;
  BYTE2(v17) = v33;
  BYTE1(v17) = v34;
  LOBYTE(v17) = v35;
  id v41 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](v40, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", v57, v56, v55, v54, v52, v51, v12, v53, v47,
          v50,
          v49,
          v48,
          v46,
          v39,
          v38,
          v37,
          v45,
          v36,
          v44,
          v17,
          v18,
          v43,
          v42,
          v20,
          v22,
          v21,
          v6,
          v7,
          v8,
          v9,
          v10,
          v13,
          v19,
          v58,
          v15);

  return v41;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UNNotificationContent *)self contentType];
  [v4 encodeObject:v5 forKey:@"contentType"];

  unint64_t v6 = [(UNNotificationContent *)self communicationContext];
  [v4 encodeObject:v6 forKey:@"communicationContext"];

  id v7 = [(UNNotificationContent *)self accessoryImageName];
  [v4 encodeObject:v7 forKey:@"accessoryImageName"];

  NSUInteger v8 = [(UNNotificationContent *)self attachments];
  [v4 encodeObject:v8 forKey:@"attachments"];

  unint64_t v9 = [(UNNotificationContent *)self badge];
  [v4 encodeObject:v9 forKey:@"badge"];

  UNNotificationInterruptionLevel v10 = [(UNNotificationContent *)self body];
  double v11 = objc_msgSend(v10, "un_stringWithMaxLength:", 2000);
  [v4 encodeObject:v11 forKey:@"body"];

  double v12 = [(UNNotificationContent *)self attributedBody];
  int v13 = objc_msgSend(v12, "_un_RTFDData");
  [v4 encodeObject:v13 forKey:@"attributedBody"];

  BOOL v14 = [(UNNotificationContent *)self categoryIdentifier];
  uint64_t v15 = objc_msgSend(v14, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v15 forKey:@"categoryIdentifier"];

  int v16 = [(UNNotificationContent *)self date];
  [v4 encodeObject:v16 forKey:@"date"];

  uint64_t v17 = [(UNNotificationContent *)self defaultActionTitle];
  uint64_t v18 = objc_msgSend(v17, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v18 forKey:@"defaultActionTitle"];

  uint64_t v19 = [(UNNotificationContent *)self defaultActionURL];
  [v4 encodeObject:v19 forKey:@"defaultActionURL"];

  uint64_t v20 = [(UNNotificationContent *)self defaultActionBundleIdentifier];
  uint64_t v21 = objc_msgSend(v20, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v21 forKey:@"defaultActionBundleIdentifier"];

  int v22 = [(UNNotificationContent *)self expirationDate];
  [v4 encodeObject:v22 forKey:@"expirationDate"];

  BOOL v23 = [(UNNotificationContent *)self header];
  BOOL v24 = objc_msgSend(v23, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v24 forKey:@"header"];

  BOOL v25 = [(UNNotificationContent *)self footer];
  BOOL v26 = objc_msgSend(v25, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v26 forKey:@"footer"];

  BOOL v27 = [(UNNotificationContent *)self icon];
  [v4 encodeObject:v27 forKey:@"icon"];

  BOOL v28 = [(UNNotificationContent *)self launchImageName];
  BOOL v29 = objc_msgSend(v28, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v29 forKey:@"launchImageName"];

  BOOL v30 = [(UNNotificationContent *)self peopleIdentifiers];
  [v4 encodeObject:v30 forKey:@"peopleIdentifiers"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldHideDate](self, "shouldHideDate"), @"shouldHideDate");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldHideTime](self, "shouldHideTime"), @"shouldHideTime");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb"), @"shouldIgnoreDoNotDisturb");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldIgnoreDowntime](self, "shouldIgnoreDowntime"), @"shouldIgnoreDowntime");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction"), @"shouldAuthenticateDefaultAction");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction"), @"shouldBackgroundDefaultAction");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction"), @"shouldPreventNotificationDismissalAfterDefaultAction");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon"), @"shouldShowSubordinateIcon");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction"), @"shouldSuppressDefaultAction");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp"), @"shouldSuppressScreenLightUp");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"), @"shouldSuppressSyncDismissalWhenRemoved");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync"), @"shouldUseRequestIdentifierForDismissalSync");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification"), @"shouldPreemptPresentedNotification");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent shouldDisplayActionsInline](self, "shouldDisplayActionsInline"), @"shouldDisplayActionsInline");
  BOOL v31 = [(UNNotificationContent *)self sound];
  [v4 encodeObject:v31 forKey:@"sound"];

  BOOL v32 = [(UNNotificationContent *)self subtitle];
  BOOL v33 = objc_msgSend(v32, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v33 forKey:@"subtitle"];

  BOOL v34 = [(UNNotificationContent *)self threadIdentifier];
  BOOL v35 = objc_msgSend(v34, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v35 forKey:@"threadIdentifier"];

  uint64_t v36 = [(UNNotificationContent *)self title];
  int v37 = objc_msgSend(v36, "un_stringWithMaxLength:", 1000);
  [v4 encodeObject:v37 forKey:@"title"];

  uint64_t v38 = [(UNNotificationContent *)self topicIdentifiers];
  [v4 encodeObject:v38 forKey:@"topicIdentifiers"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationContent realertCount](self, "realertCount"), @"realertCount");
  uint64_t v39 = [(UNNotificationContent *)self summaryArgument];
  [v4 encodeObject:v39 forKey:@"summaryArgument"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount"), @"summaryArgumentCount");
  int v40 = [(UNNotificationContent *)self targetContentIdentifier];
  [v4 encodeObject:v40 forKey:@"targetContentIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationContent interruptionLevel](self, "interruptionLevel"), @"interruptionLevel");
  [(UNNotificationContent *)self relevanceScore];
  *(float *)&double v41 = v41;
  [v4 encodeFloat:@"relevanceScore" forKey:v41];
  uint64_t v42 = [(UNNotificationContent *)self filterCriteria];
  [v4 encodeObject:v42 forKey:@"filterCriteria"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited"), @"screenCaptureProhibited");
  int v43 = [(UNNotificationContent *)self userInfo];
  [v4 encodeObject:v43 forKey:@"userInfo"];

  id v44 = [(UNNotificationContent *)self speechLanguage];
  [v4 encodeObject:v44 forKey:@"speechLanguage"];
}

- (UNNotificationContent)initWithCoder:(id)a3
{
  id v3 = a3;
  double v99 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
  double v98 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"communicationContext"];
  double v97 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryImageName"];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  UNNotificationInterruptionLevel v96 = [v3 decodeObjectOfClasses:v6 forKey:@"attachments"];

  int v95 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"badge"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v94 = [v3 decodeObjectOfClasses:v9 forKey:@"body"];

  UNNotificationInterruptionLevel v10 = (void *)MEMORY[0x1E4F28B18];
  double v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attributedBody"];
  v93 = objc_msgSend(v10, "_un_attributedStringWithRTFDData:", v11);

  double v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  BOOL v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  NSUInteger v92 = [v3 decodeObjectOfClasses:v14 forKey:@"peopleIdentifiers"];

  int v91 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"categoryIdentifier"];
  uint64_t v90 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  v89 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  unint64_t v88 = [v3 decodeObjectOfClasses:v17 forKey:@"defaultActionTitle"];

  int v87 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"defaultActionURL"];
  uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  uint64_t v86 = [v3 decodeObjectOfClasses:v20 forKey:@"defaultActionBundleIdentifier"];

  v85 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  BOOL v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  int v84 = [v3 decodeObjectOfClasses:v23 forKey:@"header"];

  BOOL v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  BOOL v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  int v81 = [v3 decodeObjectOfClasses:v26 forKey:@"footer"];

  uint64_t v80 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"launchImageName"];
  char v79 = [v3 decodeBoolForKey:@"shouldHideDate"];
  char v78 = [v3 decodeBoolForKey:@"shouldHideTime"];
  char v77 = [v3 decodeBoolForKey:@"shouldIgnoreDoNotDisturb"];
  char v76 = [v3 decodeBoolForKey:@"shouldIgnoreDowntime"];
  char v75 = [v3 decodeBoolForKey:@"shouldAuthenticateDefaultAction"];
  char v74 = [v3 decodeBoolForKey:@"shouldBackgroundDefaultAction"];
  char v73 = [v3 decodeBoolForKey:@"shouldPreventNotificationDismissalAfterDefaultAction"];
  char v71 = [v3 decodeBoolForKey:@"shouldShowSubordinateIcon"];
  char v69 = [v3 decodeBoolForKey:@"shouldSuppressDefaultAction"];
  char v70 = [v3 decodeBoolForKey:@"shouldSuppressScreenLightUp"];
  char v68 = [v3 decodeBoolForKey:@"shouldSuppressSyncDismissalWhenRemoved"];
  char v66 = [v3 decodeBoolForKey:@"shouldUseRequestIdentifierForDismissalSync"];
  char v65 = [v3 decodeBoolForKey:@"shouldPreemptPresentedNotification"];
  char v63 = [v3 decodeBoolForKey:@"shouldDisplayActionsInline"];
  int v72 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sound"];
  BOOL v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  BOOL v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  int v67 = [v3 decodeObjectOfClasses:v29 forKey:@"subtitle"];

  int v64 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
  BOOL v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  BOOL v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  BOOL v33 = [v3 decodeObjectOfClasses:v32 forKey:@"title"];

  BOOL v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  int v62 = [v3 decodeObjectOfClasses:v36 forKey:@"topicIdentifiers"];

  uint64_t v59 = [v3 decodeIntegerForKey:@"realertCount"];
  int v61 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"summaryArgument"];
  uint64_t v58 = [v3 decodeIntegerForKey:@"summaryArgumentCount"];
  int v60 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"targetContentIdentifier"];
  int v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  id v44 = objc_msgSend(v37, "setWithObjects:", v38, v39, v40, v41, v42, v43, objc_opt_class(), 0);
  uint64_t v45 = [v3 decodeObjectOfClasses:v44 forKey:@"userInfo"];

  if ([v3 containsValueForKey:@"interruptionLevel"]) {
    uint64_t v46 = [v3 decodeIntegerForKey:@"interruptionLevel"];
  }
  else {
    uint64_t v46 = 1;
  }
  [v3 decodeFloatForKey:@"relevanceScore"];
  float v48 = v47;
  uint64_t v56 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"filterCriteria"];
  char v49 = [v3 decodeBoolForKey:@"screenCaptureProhibited"];
  id v57 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"speechLanguage"];
  uint64_t v50 = objc_opt_class();
  v51 = UNSafeCast(v50, v45);

  LOBYTE(v55) = v49;
  BYTE5(v54) = v63;
  BYTE4(v54) = v65;
  BYTE3(v54) = v66;
  BYTE2(v54) = v68;
  BYTE1(v54) = v69;
  LOBYTE(v54) = v71;
  HIBYTE(v53) = v73;
  BYTE6(v53) = v74;
  BYTE5(v53) = v75;
  BYTE4(v53) = v70;
  BYTE3(v53) = v76;
  BYTE2(v53) = v77;
  BYTE1(v53) = v78;
  LOBYTE(v53) = v79;
  v83 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](self, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", v99, v98, v97, v96, v95, v94, v48, v93, v91,
          v90,
          v89,
          v88,
          v87,
          v86,
          v85,
          v84,
          v81,
          v80,
          v92,
          v53,
          v54,
          v72,
          v67,
          v64,
          v33,
          v62,
          v59,
          v61,
          v58,
          v60,
          v46,
          v56,
          v55,
          v57,
          v51);

  return v83;
}

- (UNNotificationContent)init
{
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  LOBYTE(v7) = 0;
  WORD2(v6) = 0;
  LODWORD(v6) = 0;
  id v4 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](self, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", @"UNNotificationContentTypeDefault", 0, 0, 0.0, 0, &stru_1F062A810, 0, 0, 0, 0,
         0,
         0,
         &stru_1F062A810,
         &stru_1F062A810,
         &stru_1F062A810,
         MEMORY[0x1E4F1CBF0],
         0,
         v6,
         0,
         0,
         &stru_1F062A810,
         0,
         v3,
         0,
         &stru_1F062A810,
         0,
         0,
         1,
         0,
         v7,
         0,
         0);

  return v4;
}

- (void)addSecurityScope:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UNNotificationContent *)self attachments];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__UNNotificationContent_addSecurityScope___block_invoke;
  v7[3] = &unk_1E5F06418;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __42__UNNotificationContent_addSecurityScope___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addSecurityScope:*(void *)(a1 + 32)];
}

- (void)removeSecurityScope
{
  id v2 = [(UNNotificationContent *)self attachments];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_6];
}

uint64_t __44__UNNotificationContent_removeSecurityScope__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeSecurityScope];
}

- (void)enterSecurityScope
{
  id v2 = [(UNNotificationContent *)self attachments];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_198];
}

uint64_t __43__UNNotificationContent_enterSecurityScope__block_invoke(uint64_t a1, void *a2)
{
  return [a2 enterSecurityScope];
}

- (void)leaveSecurityScope
{
  id v2 = [(UNNotificationContent *)self attachments];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_200];
}

uint64_t __43__UNNotificationContent_leaveSecurityScope__block_invoke(uint64_t a1, void *a2)
{
  return [a2 leaveSecurityScope];
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSNumber)badge
{
  return self->_badge;
}

- (NSString)body
{
  return self->_body;
}

- (NSAttributedString)attributedBody
{
  return self->_attributedBody;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (UNNotificationSound)sound
{
  return self->_sound;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (NSUInteger)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (NSString)markedMutableCopyMessage
{
  return self->_markedMutableCopyMessage;
}

- (void)setMarkedMutableCopyMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedMutableCopyMessage, 0);
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_topicIdentifiers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_accessoryImageName, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_launchImageName, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultActionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_defaultActionTitle, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_attributedBody, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_communicationContext, 0);

  objc_storeStrong((id *)&self->_contentType, 0);
}

@end