@interface MFMailCompositionValues
+ (BOOL)supportsSecureCoding;
- (BOOL)ckShareAllowOthersToInvite;
- (BOOL)includeAttachments;
- (BOOL)isHTML;
- (BOOL)isUsingDefaultAccount;
- (BOOL)prefersFirstLineSelection;
- (BOOL)showContentImmediately;
- (BOOL)showKeyboardImmediately;
- (CKContainerSetupInfo)ckContainerSetupInfo;
- (CKShare)ckShare;
- (FPSandboxingURLWrapper)sharingSandboxingURLWrapper;
- (MFMailCompositionValues)init;
- (MFMailCompositionValues)initWithCoder:(id)a3;
- (MFMailCompositionValues)initWithDictionaryRepresentation:(id)a3;
- (NSArray)UTITypes;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)cloudPhotoIDs;
- (NSArray)contentText;
- (NSArray)contentURLs;
- (NSArray)originalContent;
- (NSArray)photoIDs;
- (NSArray)toRecipients;
- (NSData)serializedMailboxObjectID;
- (NSData)serializedMessageObjectID;
- (NSDate)sendLaterDate;
- (NSMutableArray)contentVariations;
- (NSMutableArray)deferredAttachments;
- (NSString)autosaveIdentifier;
- (NSString)from;
- (NSString)hideMyEmailFrom;
- (NSString)messageBody;
- (NSString)preferredSendingEmailAddress;
- (NSString)shareSheetSessionID;
- (NSString)subject;
- (NSURL)mailtoURL;
- (id)addContentVariationWithName:(id)a3;
- (id)dictionaryRepresentation;
- (int)sourceAccountManagement;
- (int64_t)ckSharePermissionType;
- (int64_t)composeType;
- (int64_t)defaultContentVariationIndex;
- (unint64_t)caretPosition;
- (unint64_t)sendLaterContext;
- (void)_processDictionaryRepresentation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAutosaveIdentifier:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setCcRecipients:(id)a3;
- (void)setCkContainerSetupInfo:(id)a3;
- (void)setCkShare:(id)a3;
- (void)setCkShareAllowOthersToInvite:(BOOL)a3;
- (void)setCkSharePermissionType:(int64_t)a3;
- (void)setCloudPhotoIDs:(id)a3;
- (void)setComposeType:(int64_t)a3;
- (void)setContentText:(id)a3;
- (void)setContentURLs:(id)a3;
- (void)setContentVariations:(id)a3;
- (void)setDefaultContentVariationIndex:(int64_t)a3;
- (void)setDeferredAttachments:(id)a3;
- (void)setFrom:(id)a3;
- (void)setHideMyEmailFrom:(id)a3;
- (void)setIncludeAttachments:(BOOL)a3;
- (void)setIsHTML:(BOOL)a3;
- (void)setIsUsingDefaultAccount:(BOOL)a3;
- (void)setMailtoURL:(id)a3;
- (void)setMessageBody:(id)a3;
- (void)setOriginalContent:(id)a3;
- (void)setPhotoIDs:(id)a3;
- (void)setPreferredSendingEmailAddress:(id)a3;
- (void)setPrefersFirstLineSelection:(BOOL)a3;
- (void)setSendLaterContext:(unint64_t)a3;
- (void)setSendLaterDate:(id)a3;
- (void)setSerializedMailboxObjectID:(id)a3;
- (void)setSerializedMessageObjectID:(id)a3;
- (void)setShareSheetSessionID:(id)a3;
- (void)setSharingSandboxingURLWrapper:(id)a3;
- (void)setShowContentImmediately:(BOOL)a3;
- (void)setShowKeyboardImmediately:(BOOL)a3;
- (void)setSourceAccountManagement:(int)a3;
- (void)setSubject:(id)a3;
- (void)setToRecipients:(id)a3;
- (void)setUTITypes:(id)a3;
@end

@implementation MFMailCompositionValues

- (MFMailCompositionValues)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailCompositionValues;
  result = [(MFMailCompositionValues *)&v3 init];
  if (result)
  {
    result->_showContentImmediately = 1;
    result->_caretPosition = 0x7FFFFFFFFFFFFFFFLL;
    result->_defaultContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (MFMailCompositionValues)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(MFMailCompositionValues *)self init];
  v6 = v5;
  if (v5) {
    [(MFMailCompositionValues *)v5 _processDictionaryRepresentation:v4];
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MFMailCompositionValues *)self mailtoURL];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v4, @"URL");

  v5 = [(MFMailCompositionValues *)self autosaveIdentifier];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v5, @"AutosaveIdentifier");

  v6 = [(MFMailCompositionValues *)self messageBody];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v6, @"Body");

  v7 = [(MFMailCompositionValues *)self from];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v7, @"From");

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues isHTML](self, "isHTML"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v8, @"BodyIsHTML");

  v9 = [(MFMailCompositionValues *)self subject];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v9, @"Subject");

  v10 = [(MFMailCompositionValues *)self hideMyEmailFrom];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v10, @"HideMyEmailFrom");

  v11 = [(MFMailCompositionValues *)self toRecipients];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v11, @"ToRecipients");

  v12 = [(MFMailCompositionValues *)self ccRecipients];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v12, @"CcRecipients");

  v13 = [(MFMailCompositionValues *)self bccRecipients];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v13, @"BccRecipients");

  v14 = [(MFMailCompositionValues *)self originalContent];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v14, @"OriginalContent");

  v15 = [(MFMailCompositionValues *)self preferredSendingEmailAddress];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v15, @"PreferredSendingEmailAddress");

  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues showKeyboardImmediately](self, "showKeyboardImmediately"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v16, @"ShowKeyboardImmediately");

  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues showContentImmediately](self, "showContentImmediately"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v17, @"ShowContentImmediately");

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MFMailCompositionValues sourceAccountManagement](self, "sourceAccountManagement"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v18, @"SourceAccountManagement");

  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MFMailCompositionValues caretPosition](self, "caretPosition"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v19, @"CaretPosition");

  v20 = [(MFMailCompositionValues *)self UTITypes];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v20, @"UTITypes");

  v21 = [(MFMailCompositionValues *)self photoIDs];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v21, @"PhotoIDs");

  v22 = [(MFMailCompositionValues *)self cloudPhotoIDs];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v22, @"CloudPhotoIDs");

  v23 = [(MFMailCompositionValues *)self contentText];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v23, @"ContentText");

  v24 = [(MFMailCompositionValues *)self contentURLs];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v24, @"ContentURLs");

  v25 = [(MFMailCompositionValues *)self contentVariations];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v25, @"ContentVariations");

  v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[MFMailCompositionValues defaultContentVariationIndex](self, "defaultContentVariationIndex"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v26, @"DefaultContentVariationIndex");

  v27 = [(MFMailCompositionValues *)self shareSheetSessionID];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v27, @"ShareSheetSessionID");

  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues isUsingDefaultAccount](self, "isUsingDefaultAccount"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v28, @"IsUsingDefaultAccount");

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues prefersFirstLineSelection](self, "prefersFirstLineSelection"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v29, @"PrefersFirstLineSelection");

  v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[MFMailCompositionValues composeType](self, "composeType"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v30, @"ComposeType");

  v31 = [(MFMailCompositionValues *)self serializedMessageObjectID];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v31, @"SerializedMessageObjectID");

  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues includeAttachments](self, "includeAttachments"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v32, @"IncludeAttachments");

  v33 = [(MFMailCompositionValues *)self serializedMailboxObjectID];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v33, @"SerializedMailboxObjectID");

  v34 = [(MFMailCompositionValues *)self deferredAttachments];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v34, @"DeferredAttachments");

  v35 = [(MFMailCompositionValues *)self sendLaterDate];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v35, @"SendLaterDate");

  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MFMailCompositionValues sendLaterContext](self, "sendLaterContext"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v36, @"SendLaterContext");

  v37 = [(MFMailCompositionValues *)self sharingSandboxingURLWrapper];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v37, @"SharingSandboxingURLWrapper");

  v38 = [(MFMailCompositionValues *)self ckShare];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v38, @"CKShare");

  v39 = [(MFMailCompositionValues *)self ckContainerSetupInfo];
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v39, @"CKContainerSetupInfo");

  v40 = objc_msgSend(NSNumber, "numberWithInteger:", -[MFMailCompositionValues ckSharePermissionType](self, "ckSharePermissionType"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v40, @"CKSharePermissionType");

  v41 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailCompositionValues ckShareAllowOthersToInvite](self, "ckShareAllowOthersToInvite"));
  objc_msgSend(v3, "ef_setOptionalObject:forKey:", v41, @"CKShareAllowOthersToInvite");

  return v3;
}

- (void)_processDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"URL"];
  [(MFMailCompositionValues *)self setMailtoURL:v5];

  v6 = [v4 objectForKeyedSubscript:@"AutosaveIdentifier"];
  [(MFMailCompositionValues *)self setAutosaveIdentifier:v6];

  v7 = [v4 objectForKeyedSubscript:@"Subject"];
  [(MFMailCompositionValues *)self setSubject:v7];

  v8 = [v4 objectForKeyedSubscript:@"HideMyEmailFrom"];
  [(MFMailCompositionValues *)self setHideMyEmailFrom:v8];

  v9 = [v4 objectForKeyedSubscript:@"From"];
  [(MFMailCompositionValues *)self setFrom:v9];

  v10 = [v4 objectForKeyedSubscript:@"ToRecipients"];
  [(MFMailCompositionValues *)self setToRecipients:v10];

  v11 = [v4 objectForKeyedSubscript:@"CcRecipients"];
  [(MFMailCompositionValues *)self setCcRecipients:v11];

  v12 = [v4 objectForKeyedSubscript:@"BccRecipients"];
  [(MFMailCompositionValues *)self setBccRecipients:v12];

  v13 = [v4 objectForKeyedSubscript:@"OriginalContent"];
  [(MFMailCompositionValues *)self setOriginalContent:v13];

  v14 = [v4 objectForKeyedSubscript:@"UTITypes"];
  [(MFMailCompositionValues *)self setUTITypes:v14];

  v15 = [v4 objectForKeyedSubscript:@"PhotoIDs"];
  [(MFMailCompositionValues *)self setPhotoIDs:v15];

  v16 = [v4 objectForKeyedSubscript:@"CloudPhotoIDs"];
  [(MFMailCompositionValues *)self setCloudPhotoIDs:v16];

  v17 = [v4 objectForKeyedSubscript:@"ContentText"];
  [(MFMailCompositionValues *)self setContentText:v17];

  v18 = [v4 objectForKeyedSubscript:@"ContentURLs"];
  [(MFMailCompositionValues *)self setContentURLs:v18];

  v19 = [v4 objectForKeyedSubscript:@"ContentVariations"];
  [(MFMailCompositionValues *)self setContentVariations:v19];

  v20 = [v4 objectForKeyedSubscript:@"SerializedMessageObjectID"];
  [(MFMailCompositionValues *)self setSerializedMessageObjectID:v20];

  v21 = [v4 objectForKeyedSubscript:@"SerializedMailboxObjectID"];
  [(MFMailCompositionValues *)self setSerializedMailboxObjectID:v21];

  v22 = [v4 objectForKeyedSubscript:@"ShowKeyboardImmediately"];
  -[MFMailCompositionValues setShowKeyboardImmediately:](self, "setShowKeyboardImmediately:", [v22 BOOLValue]);

  v23 = [v4 objectForKeyedSubscript:@"ShowContentImmediately"];
  -[MFMailCompositionValues setShowContentImmediately:](self, "setShowContentImmediately:", [v23 BOOLValue]);

  v24 = [v4 objectForKeyedSubscript:@"CaretPosition"];
  -[MFMailCompositionValues setCaretPosition:](self, "setCaretPosition:", [v24 unsignedIntegerValue]);

  v25 = [v4 objectForKeyedSubscript:@"DefaultContentVariationIndex"];
  -[MFMailCompositionValues setDefaultContentVariationIndex:](self, "setDefaultContentVariationIndex:", [v25 integerValue]);

  v26 = [v4 objectForKeyedSubscript:@"IsUsingDefaultAccount"];
  -[MFMailCompositionValues setIsUsingDefaultAccount:](self, "setIsUsingDefaultAccount:", [v26 BOOLValue]);

  v27 = [v4 objectForKeyedSubscript:@"PrefersFirstLineSelection"];
  -[MFMailCompositionValues setPrefersFirstLineSelection:](self, "setPrefersFirstLineSelection:", [v27 BOOLValue]);

  v28 = [v4 objectForKeyedSubscript:@"ComposeType"];
  -[MFMailCompositionValues setComposeType:](self, "setComposeType:", [v28 integerValue]);

  v29 = [v4 objectForKeyedSubscript:@"IncludeAttachments"];
  -[MFMailCompositionValues setIncludeAttachments:](self, "setIncludeAttachments:", [v29 BOOLValue]);

  v30 = [v4 objectForKeyedSubscript:@"DeferredAttachments"];
  [(MFMailCompositionValues *)self setDeferredAttachments:v30];

  v31 = [v4 objectForKeyedSubscript:@"SourceAccountManagement"];
  -[MFMailCompositionValues setSourceAccountManagement:](self, "setSourceAccountManagement:", [v31 intValue]);

  v32 = [v4 objectForKeyedSubscript:@"SendLaterDate"];
  [(MFMailCompositionValues *)self setSendLaterDate:v32];

  v33 = [v4 objectForKeyedSubscript:@"SendLaterContext"];
  -[MFMailCompositionValues setSendLaterContext:](self, "setSendLaterContext:", [v33 integerValue]);

  v34 = [v4 objectForKeyedSubscript:@"SharingSandboxingURLWrapper"];
  [(MFMailCompositionValues *)self setSharingSandboxingURLWrapper:v34];

  v35 = [v4 objectForKeyedSubscript:@"CKShare"];
  [(MFMailCompositionValues *)self setCkShare:v35];

  v36 = [v4 objectForKeyedSubscript:@"CKContainerSetupInfo"];
  [(MFMailCompositionValues *)self setCkContainerSetupInfo:v36];

  v37 = [v4 objectForKeyedSubscript:@"CKSharePermissionType"];
  -[MFMailCompositionValues setCkSharePermissionType:](self, "setCkSharePermissionType:", [v37 integerValue]);

  v38 = [v4 objectForKeyedSubscript:@"CKShareAllowOthersToInvite"];
  -[MFMailCompositionValues setCkShareAllowOthersToInvite:](self, "setCkShareAllowOthersToInvite:", [v38 BOOLValue]);

  v39 = [v4 objectForKeyedSubscript:@"BodyIsHTML"];
  uint64_t v40 = [v39 BOOLValue];

  [(MFMailCompositionValues *)self setIsHTML:v40];
  v41 = [v4 objectForKeyedSubscript:@"Body"];
  if (v41)
  {
    v42 = +[_MFMailCompositionContext processMessageBody:v41 asHTML:[(MFMailCompositionValues *)self isHTML]];
    [(MFMailCompositionValues *)self setMessageBody:v42];
  }
  v43 = [v4 objectForKeyedSubscript:@"PreferredSendingEmailAddress"];
  if (v43)
  {
    id v44 = (id)[MEMORY[0x1E4F77C70] mailAccounts];
    v45 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:v43];
    if (v45) {
      [(MFMailCompositionValues *)self setPreferredSendingEmailAddress:v43];
    }
  }
  v46 = [v4 objectForKeyedSubscript:@"ShareSheetSessionID"];
  if (v46)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __60__MFMailCompositionValues__processDictionaryRepresentation___block_invoke;
    v47[3] = &unk_1E5F7A450;
    v47[4] = self;
    [MEMORY[0x1E4F9F338] requestMailRecipientsForSessionID:v46 completionHandler:v47];
    [(MFMailCompositionValues *)self setShareSheetSessionID:v46];
  }
}

uint64_t __60__MFMailCompositionValues__processDictionaryRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setToRecipients:a2];
}

- (id)addContentVariationWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailCompositionValues *)self contentVariations];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(MFMailCompositionValues *)self setContentVariations:v5];
  }
  v6 = [[_MFMailComposeContentVariation alloc] initWithName:v4];
  [v5 addObject:v6];
  if ([(MFMailCompositionValues *)self defaultContentVariationIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    [(MFMailCompositionValues *)self setDefaultContentVariationIndex:0];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MFMailCompositionValues)initWithCoder:(id)a3
{
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)MFMailCompositionValues;
  id v5 = [(MFMailCompositionValues *)&v91 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mailtoURL"];
    mailtoURL = v5->_mailtoURL;
    v5->_mailtoURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_autosaveIdentifier"];
    autosaveIdentifier = v5->_autosaveIdentifier;
    v5->_autosaveIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_messageBody"];
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v10;

    v5->_isHTML = [v4 decodeBoolForKey:@"EFPropertyKey_isHTML"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_hideMyEmailFrom"];
    hideMyEmailFrom = v5->_hideMyEmailFrom;
    v5->_hideMyEmailFrom = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_from"];
    from = v5->_from;
    v5->_from = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"EFPropertyKey_toRecipients"];
    toRecipients = v5->_toRecipients;
    v5->_toRecipients = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"EFPropertyKey_ccRecipients"];
    ccRecipients = v5->_ccRecipients;
    v5->_ccRecipients = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"EFPropertyKey_bccRecipients"];
    bccRecipients = v5->_bccRecipients;
    v5->_bccRecipients = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"EFPropertyKey_originalContent"];
    originalContent = v5->_originalContent;
    v5->_originalContent = (NSArray *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_preferredSendingEmailAddress"];
    preferredSendingEmailAddress = v5->_preferredSendingEmailAddress;
    v5->_preferredSendingEmailAddress = (NSString *)v38;

    v5->_showKeyboardImmediately = [v4 decodeBoolForKey:@"EFPropertyKey_showKeyboardImmediately"];
    v5->_showContentImmediately = [v4 decodeBoolForKey:@"EFPropertyKey_showContentImmediately"];
    v5->_sourceAccountManagement = [v4 decodeIntegerForKey:@"EFPropertyKey_sourceAccountManagement"];
    v5->_caretPosition = [v4 decodeIntegerForKey:@"EFPropertyKey_caretPosition"];
    uint64_t v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"EFPropertyKey_UTITypes"];
    UTITypes = v5->_UTITypes;
    v5->_UTITypes = (NSArray *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"EFPropertyKey_photoIDs"];
    photoIDs = v5->_photoIDs;
    v5->_photoIDs = (NSArray *)v48;

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"EFPropertyKey_cloudPhotoIDs"];
    cloudPhotoIDs = v5->_cloudPhotoIDs;
    v5->_cloudPhotoIDs = (NSArray *)v53;

    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"EFPropertyKey_contentText"];
    contentText = v5->_contentText;
    v5->_contentText = (NSArray *)v58;

    v60 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v61 = objc_opt_class();
    v62 = objc_msgSend(v60, "setWithObjects:", v61, objc_opt_class(), 0);
    uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"EFPropertyKey_contentURLs"];
    contentURLs = v5->_contentURLs;
    v5->_contentURLs = (NSArray *)v63;

    v65 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v66 = objc_opt_class();
    v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"EFPropertyKey_contentVariations"];
    contentVariations = v5->_contentVariations;
    v5->_contentVariations = (NSMutableArray *)v68;

    v5->_defaultContentVariationIndex = [v4 decodeIntegerForKey:@"EFPropertyKey_defaultContentVariationIndex"];
    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_shareSheetSessionID"];
    shareSheetSessionID = v5->_shareSheetSessionID;
    v5->_shareSheetSessionID = (NSString *)v70;

    v5->_isUsingDefaultAccount = [v4 decodeBoolForKey:@"EFPropertyKey_isUsingDefaultAccount"];
    v5->_prefersFirstLineSelection = [v4 decodeBoolForKey:@"EFPropertyKey_prefersFirstLineSelection"];
    v5->_composeType = [v4 decodeIntegerForKey:@"EFPropertyKey_composeType"];
    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_serializedMessageObjectID"];
    serializedMessageObjectID = v5->_serializedMessageObjectID;
    v5->_serializedMessageObjectID = (NSData *)v72;

    v5->_includeAttachments = [v4 decodeBoolForKey:@"EFPropertyKey_includeAttachments"];
    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_serializedMailboxObjectID"];
    serializedMailboxObjectID = v5->_serializedMailboxObjectID;
    v5->_serializedMailboxObjectID = (NSData *)v74;

    v76 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v77 = objc_opt_class();
    uint64_t v78 = objc_opt_class();
    v79 = objc_msgSend(v76, "setWithObjects:", v77, v78, objc_opt_class(), 0);
    uint64_t v80 = [v4 decodeObjectOfClasses:v79 forKey:@"EFPropertyKey_deferredAttachments"];
    deferredAttachments = v5->_deferredAttachments;
    v5->_deferredAttachments = (NSMutableArray *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sendLaterDate"];
    sendLaterDate = v5->_sendLaterDate;
    v5->_sendLaterDate = (NSDate *)v82;

    uint64_t v84 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_sharingSandboxingURLWrapper"];
    sharingSandboxingURLWrapper = v5->_sharingSandboxingURLWrapper;
    v5->_sharingSandboxingURLWrapper = (FPSandboxingURLWrapper *)v84;

    uint64_t v86 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_ckShare"];
    ckShare = v5->_ckShare;
    v5->_ckShare = (CKShare *)v86;

    uint64_t v88 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_ckContainerSetupInfo"];
    ckContainerSetupInfo = v5->_ckContainerSetupInfo;
    v5->_ckContainerSetupInfo = (CKContainerSetupInfo *)v88;

    v5->_ckSharePermissionType = [v4 decodeIntegerForKey:@"EFPropertyKey_ckSharePermissionType"];
    v5->_ckShareAllowOthersToInvite = [v4 decodeBoolForKey:@"EFPropertyKey_ckShareAllowOthersToInvite"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v29 = a3;
  id v4 = [(MFMailCompositionValues *)self mailtoURL];
  [v29 encodeObject:v4 forKey:@"EFPropertyKey_mailtoURL"];

  id v5 = [(MFMailCompositionValues *)self autosaveIdentifier];
  [v29 encodeObject:v5 forKey:@"EFPropertyKey_autosaveIdentifier"];

  uint64_t v6 = [(MFMailCompositionValues *)self messageBody];
  [v29 encodeObject:v6 forKey:@"EFPropertyKey_messageBody"];

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues isHTML](self, "isHTML"), @"EFPropertyKey_isHTML");
  v7 = [(MFMailCompositionValues *)self subject];
  [v29 encodeObject:v7 forKey:@"EFPropertyKey_subject"];

  uint64_t v8 = [(MFMailCompositionValues *)self hideMyEmailFrom];
  [v29 encodeObject:v8 forKey:@"EFPropertyKey_hideMyEmailFrom"];

  v9 = [(MFMailCompositionValues *)self from];
  [v29 encodeObject:v9 forKey:@"EFPropertyKey_from"];

  uint64_t v10 = [(MFMailCompositionValues *)self toRecipients];
  [v29 encodeObject:v10 forKey:@"EFPropertyKey_toRecipients"];

  v11 = [(MFMailCompositionValues *)self ccRecipients];
  [v29 encodeObject:v11 forKey:@"EFPropertyKey_ccRecipients"];

  uint64_t v12 = [(MFMailCompositionValues *)self bccRecipients];
  [v29 encodeObject:v12 forKey:@"EFPropertyKey_bccRecipients"];

  v13 = [(MFMailCompositionValues *)self originalContent];
  [v29 encodeObject:v13 forKey:@"EFPropertyKey_originalContent"];

  uint64_t v14 = [(MFMailCompositionValues *)self preferredSendingEmailAddress];
  [v29 encodeObject:v14 forKey:@"EFPropertyKey_preferredSendingEmailAddress"];

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues showKeyboardImmediately](self, "showKeyboardImmediately"), @"EFPropertyKey_showKeyboardImmediately");
  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues showContentImmediately](self, "showContentImmediately"), @"EFPropertyKey_showContentImmediately");
  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues sourceAccountManagement](self, "sourceAccountManagement"), @"EFPropertyKey_sourceAccountManagement");
  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues caretPosition](self, "caretPosition"), @"EFPropertyKey_caretPosition");
  v15 = [(MFMailCompositionValues *)self UTITypes];
  [v29 encodeObject:v15 forKey:@"EFPropertyKey_UTITypes"];

  uint64_t v16 = [(MFMailCompositionValues *)self photoIDs];
  [v29 encodeObject:v16 forKey:@"EFPropertyKey_photoIDs"];

  v17 = [(MFMailCompositionValues *)self cloudPhotoIDs];
  [v29 encodeObject:v17 forKey:@"EFPropertyKey_cloudPhotoIDs"];

  v18 = [(MFMailCompositionValues *)self contentText];
  [v29 encodeObject:v18 forKey:@"EFPropertyKey_contentText"];

  uint64_t v19 = [(MFMailCompositionValues *)self contentURLs];
  [v29 encodeObject:v19 forKey:@"EFPropertyKey_contentURLs"];

  v20 = [(MFMailCompositionValues *)self contentVariations];
  [v29 encodeObject:v20 forKey:@"EFPropertyKey_contentVariations"];

  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues defaultContentVariationIndex](self, "defaultContentVariationIndex"), @"EFPropertyKey_defaultContentVariationIndex");
  uint64_t v21 = [(MFMailCompositionValues *)self shareSheetSessionID];
  [v29 encodeObject:v21 forKey:@"EFPropertyKey_shareSheetSessionID"];

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues isUsingDefaultAccount](self, "isUsingDefaultAccount"), @"EFPropertyKey_isUsingDefaultAccount");
  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues prefersFirstLineSelection](self, "prefersFirstLineSelection"), @"EFPropertyKey_prefersFirstLineSelection");
  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues composeType](self, "composeType"), @"EFPropertyKey_composeType");
  v22 = [(MFMailCompositionValues *)self serializedMessageObjectID];
  [v29 encodeObject:v22 forKey:@"EFPropertyKey_serializedMessageObjectID"];

  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues includeAttachments](self, "includeAttachments"), @"EFPropertyKey_includeAttachments");
  v23 = [(MFMailCompositionValues *)self serializedMailboxObjectID];
  [v29 encodeObject:v23 forKey:@"EFPropertyKey_serializedMailboxObjectID"];

  uint64_t v24 = [(MFMailCompositionValues *)self deferredAttachments];
  [v29 encodeObject:v24 forKey:@"EFPropertyKey_deferredAttachments"];

  v25 = [(MFMailCompositionValues *)self sendLaterDate];
  [v29 encodeObject:v25 forKey:@"EFPropertyKey_sendLaterDate"];

  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues sendLaterContext](self, "sendLaterContext"), @"EFPropertyKey_sendLaterContext");
  uint64_t v26 = [(MFMailCompositionValues *)self sharingSandboxingURLWrapper];
  [v29 encodeObject:v26 forKey:@"EFPropertyKey_sharingSandboxingURLWrapper"];

  v27 = [(MFMailCompositionValues *)self ckShare];
  [v29 encodeObject:v27 forKey:@"EFPropertyKey_ckShare"];

  v28 = [(MFMailCompositionValues *)self ckContainerSetupInfo];
  [v29 encodeObject:v28 forKey:@"EFPropertyKey_ckContainerSetupInfo"];

  objc_msgSend(v29, "encodeInteger:forKey:", -[MFMailCompositionValues ckSharePermissionType](self, "ckSharePermissionType"), @"EFPropertyKey_ckSharePermissionType");
  objc_msgSend(v29, "encodeBool:forKey:", -[MFMailCompositionValues ckShareAllowOthersToInvite](self, "ckShareAllowOthersToInvite"), @"EFPropertyKey_ckShareAllowOthersToInvite");
}

- (NSURL)mailtoURL
{
  return self->_mailtoURL;
}

- (void)setMailtoURL:(id)a3
{
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (void)setAutosaveIdentifier:(id)a3
{
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (void)setMessageBody:(id)a3
{
}

- (BOOL)isHTML
{
  return self->_isHTML;
}

- (void)setIsHTML:(BOOL)a3
{
  self->_isHTML = a3;
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)hideMyEmailFrom
{
  return self->_hideMyEmailFrom;
}

- (void)setHideMyEmailFrom:(id)a3
{
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setToRecipients:(id)a3
{
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setCcRecipients:(id)a3
{
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setBccRecipients:(id)a3
{
}

- (NSString)preferredSendingEmailAddress
{
  return self->_preferredSendingEmailAddress;
}

- (void)setPreferredSendingEmailAddress:(id)a3
{
}

- (BOOL)showKeyboardImmediately
{
  return self->_showKeyboardImmediately;
}

- (void)setShowKeyboardImmediately:(BOOL)a3
{
  self->_showKeyboardImmediately = a3;
}

- (BOOL)showContentImmediately
{
  return self->_showContentImmediately;
}

- (void)setShowContentImmediately:(BOOL)a3
{
  self->_showContentImmediately = a3;
}

- (int)sourceAccountManagement
{
  return self->_sourceAccountManagement;
}

- (void)setSourceAccountManagement:(int)a3
{
  self->_sourceAccountManagement = a3;
}

- (unint64_t)caretPosition
{
  return self->_caretPosition;
}

- (void)setCaretPosition:(unint64_t)a3
{
  self->_caretPosition = a3;
}

- (NSArray)UTITypes
{
  return self->_UTITypes;
}

- (void)setUTITypes:(id)a3
{
}

- (NSArray)photoIDs
{
  return self->_photoIDs;
}

- (void)setPhotoIDs:(id)a3
{
}

- (NSArray)cloudPhotoIDs
{
  return self->_cloudPhotoIDs;
}

- (void)setCloudPhotoIDs:(id)a3
{
}

- (NSArray)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
}

- (NSArray)contentURLs
{
  return self->_contentURLs;
}

- (void)setContentURLs:(id)a3
{
}

- (NSMutableArray)contentVariations
{
  return self->_contentVariations;
}

- (void)setContentVariations:(id)a3
{
}

- (int64_t)defaultContentVariationIndex
{
  return self->_defaultContentVariationIndex;
}

- (void)setDefaultContentVariationIndex:(int64_t)a3
{
  self->_defaultContentVariationIndex = a3;
}

- (NSString)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (void)setShareSheetSessionID:(id)a3
{
}

- (BOOL)isUsingDefaultAccount
{
  return self->_isUsingDefaultAccount;
}

- (void)setIsUsingDefaultAccount:(BOOL)a3
{
  self->_isUsingDefaultAccount = a3;
}

- (BOOL)prefersFirstLineSelection
{
  return self->_prefersFirstLineSelection;
}

- (void)setPrefersFirstLineSelection:(BOOL)a3
{
  self->_prefersFirstLineSelection = a3;
}

- (int64_t)composeType
{
  return self->_composeType;
}

- (void)setComposeType:(int64_t)a3
{
  self->_composeType = a3;
}

- (NSData)serializedMessageObjectID
{
  return self->_serializedMessageObjectID;
}

- (void)setSerializedMessageObjectID:(id)a3
{
}

- (BOOL)includeAttachments
{
  return self->_includeAttachments;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  self->_includeAttachments = a3;
}

- (NSArray)originalContent
{
  return self->_originalContent;
}

- (void)setOriginalContent:(id)a3
{
}

- (NSData)serializedMailboxObjectID
{
  return self->_serializedMailboxObjectID;
}

- (void)setSerializedMailboxObjectID:(id)a3
{
}

- (NSMutableArray)deferredAttachments
{
  return self->_deferredAttachments;
}

- (void)setDeferredAttachments:(id)a3
{
}

- (NSDate)sendLaterDate
{
  return self->_sendLaterDate;
}

- (void)setSendLaterDate:(id)a3
{
}

- (unint64_t)sendLaterContext
{
  return self->_sendLaterContext;
}

- (void)setSendLaterContext:(unint64_t)a3
{
  self->_sendLaterContext = a3;
}

- (FPSandboxingURLWrapper)sharingSandboxingURLWrapper
{
  return self->_sharingSandboxingURLWrapper;
}

- (void)setSharingSandboxingURLWrapper:(id)a3
{
}

- (CKShare)ckShare
{
  return self->_ckShare;
}

- (void)setCkShare:(id)a3
{
}

- (CKContainerSetupInfo)ckContainerSetupInfo
{
  return self->_ckContainerSetupInfo;
}

- (void)setCkContainerSetupInfo:(id)a3
{
}

- (int64_t)ckSharePermissionType
{
  return self->_ckSharePermissionType;
}

- (void)setCkSharePermissionType:(int64_t)a3
{
  self->_ckSharePermissionType = a3;
}

- (BOOL)ckShareAllowOthersToInvite
{
  return self->_ckShareAllowOthersToInvite;
}

- (void)setCkShareAllowOthersToInvite:(BOOL)a3
{
  self->_ckShareAllowOthersToInvite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckContainerSetupInfo, 0);
  objc_storeStrong((id *)&self->_ckShare, 0);
  objc_storeStrong((id *)&self->_sharingSandboxingURLWrapper, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_deferredAttachments, 0);
  objc_storeStrong((id *)&self->_serializedMailboxObjectID, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);
  objc_storeStrong((id *)&self->_serializedMessageObjectID, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_storeStrong((id *)&self->_contentVariations, 0);
  objc_storeStrong((id *)&self->_contentURLs, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_cloudPhotoIDs, 0);
  objc_storeStrong((id *)&self->_photoIDs, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
  objc_storeStrong((id *)&self->_preferredSendingEmailAddress, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_hideMyEmailFrom, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);

  objc_storeStrong((id *)&self->_mailtoURL, 0);
}

@end