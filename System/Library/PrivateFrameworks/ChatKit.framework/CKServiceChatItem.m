@interface CKServiceChatItem
- (BOOL)hasInformativeText;
- (id)_appendServiceInfoIfNeeded;
- (id)_serviceName;
- (id)_smsFallbackStringForChatItem:(id)a3;
- (id)_subtextImage;
- (id)_subtextWithImage:(id)a3;
- (id)loadTranscriptText;
- (unint64_t)layoutType;
- (void)setHasInformativeText:(BOOL)a3;
@end

@implementation CKServiceChatItem

- (unint64_t)layoutType
{
  return 2;
}

- (id)loadTranscriptText
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDE4CA38];
  v4 = [(CKServiceChatItem *)self _serviceName];
  if (!v4)
  {
    id v14 = v3;
    goto LABEL_11;
  }
  v5 = +[CKUIBehavior sharedBehaviors];
  v6 = [v5 transcriptEmphasizedFontAttributes];
  v7 = (void *)[v6 mutableCopy];

  v8 = [(CKServiceChatItem *)self _subtextImage];
  if (v8)
  {
    if (![v3 length])
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v7];
      [v3 appendAttributedString:v9];
    }
    v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v11 = [v10 shouldShowServiceEncryptionIcon];

    if (!v11) {
      goto LABEL_10;
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v3 appendAttributedString:v12];

    v13 = [(CKServiceChatItem *)self _subtextWithImage:v8];
    [v3 appendAttributedString:v13];
  }
  else
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4 attributes:v7];

    v13 = [(CKServiceChatItem *)self _appendServiceInfoIfNeeded];
    [v15 appendAttributedString:v13];
    v3 = v15;
  }

LABEL_10:
  id v14 = v3;

LABEL_11:

  return v14;
}

- (id)_serviceName
{
  v3 = [(CKChatItem *)self IMChatItem];
  v4 = [(CKChatItem *)self IMChatItem];
  v5 = [v4 handle];
  int v6 = [v5 isStewieEmergency];

  if (v6)
  {
    v7 = CKFrameworkBundle();
    v8 = v7;
    v9 = @"STEWIE_EMERGENCY_STATUS_SERVICE";
    v10 = @"ChatKit-SYDROB_FEATURES";
LABEL_7:
    uint64_t v14 = [v7 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:v10];
    goto LABEL_8;
  }
  int v11 = [(CKChatItem *)self IMChatItem];
  v12 = [v11 handle];
  int v13 = [v12 isStewieRoadside];

  if (v13)
  {
    v7 = CKFrameworkBundle();
    v8 = v7;
    v9 = @"STEWIE_ROADSIDE_STATUS_SERVICE";
    v10 = @"ChatKit-Avocet";
    goto LABEL_7;
  }
  if ([v3 isStewieSharingChat])
  {
    v7 = CKFrameworkBundle();
    v8 = v7;
    v9 = @"TS_DESCRIPTION_SERVICE_NAME";
    v10 = @"TranscriptSharing-SYDROB_FEATURES";
    goto LABEL_7;
  }
  v8 = [v3 service];
  uint64_t v14 = objc_msgSend(v8, "__ck_displayName");
LABEL_8:
  v15 = (void *)v14;

  return v15;
}

- (id)_subtextImage
{
  v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 shouldShowServiceEncryptionIcon];

  if (v4)
  {
    v5 = [(CKChatItem *)self IMChatItem];
    int v6 = [v5 service];
    int v7 = [v6 supportsCapability:*MEMORY[0x1E4F6E070]];

    if (v7)
    {
      v8 = +[CKUIBehavior sharedBehaviors];
      uint64_t v9 = [v8 encryptedServiceIcon];
LABEL_6:
      int v13 = (void *)v9;

      goto LABEL_8;
    }
    v10 = [(CKChatItem *)self IMChatItem];
    int v11 = [v10 service];
    int v12 = objc_msgSend(v11, "__ck_isSMS");

    if (v12)
    {
      v8 = +[CKUIBehavior sharedBehaviors];
      uint64_t v9 = [v8 unencryptedServiceIcon];
      goto LABEL_6;
    }
  }
  int v13 = 0;
LABEL_8:

  return v13;
}

- (id)_subtextWithImage:(id)a3
{
  id v4 = a3;
  v5 = [(CKChatItem *)self IMChatItem];
  int v6 = [v5 handle];
  int v7 = [v6 isStewie];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDE4CA38];
    goto LABEL_10;
  }
  uint64_t v9 = objc_opt_new();
  v10 = [(CKChatItem *)self IMChatItem];
  int v11 = [v10 service];
  int v12 = objc_msgSend(v11, "__ck_isiMessage");

  if (v12)
  {
    int v13 = CKFrameworkBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"IMESSAGE_MESSAGE_CHATITEM_SUBTEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = [v15 transcriptiMessageEmphasizedFontAttributes];
  }
  else
  {
    v17 = [(CKChatItem *)self IMChatItem];
    v18 = [v17 service];
    int v19 = objc_msgSend(v18, "__ck_isSMS");

    if (!v19)
    {
      uint64_t v14 = &stru_1EDE4CA38;
      goto LABEL_9;
    }
    v20 = CKFrameworkBundle();
    uint64_t v14 = [v20 localizedStringForKey:@"TEXT_MESSAGE_CHATITEM_SUBTEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];

    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = [v15 transcriptSMSEmphasizedFontAttributes];
  }
  v21 = v16;
  uint64_t v22 = [v16 mutableCopy];

  uint64_t v9 = (void *)v22;
LABEL_9:
  id v23 = objc_alloc(MEMORY[0x1E4F28E48]);
  v24 = [NSString stringWithFormat:@" %@", v14];
  v8 = (void *)[v23 initWithString:v24];

  v25 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v4];
  v26 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v25];
  [v8 insertAttributedString:v26 atIndex:0];

  objc_msgSend(v8, "addAttributes:range:", v9, 0, objc_msgSend(v8, "length"));
LABEL_10:

  return v8;
}

- (id)_appendServiceInfoIfNeeded
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDE4CA38];
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isCarrierPigeonEnabled];

  if (v5)
  {
    int v6 = +[CKUIBehavior sharedBehaviors];
    int v7 = [v6 transcriptRegularFontAttributes];

    v8 = [(CKChatItem *)self IMChatItem];
    uint64_t v9 = [v8 service];
    int v10 = objc_msgSend(v9, "__ck_isSatelliteSMS");

    if (v10)
    {
      int v11 = [(CKServiceChatItem *)self _smsFallbackStringForChatItem:v8];
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11 attributes:v7];

      v3 = (void *)v12;
    }
  }
  if ([v3 length])
  {
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v3 insertAttributedString:v13 atIndex:0];
    [(CKServiceChatItem *)self setHasInformativeText:1];
  }

  return v3;
}

- (id)_smsFallbackStringForChatItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 handle];
  int v5 = [v4 _displayNameWithAbbreviation];

  int v6 = [v3 isLiteServiceCapable];
  int v7 = NSString;
  v8 = CKFrameworkBundle();
  uint64_t v9 = v8;
  if (v6) {
    int v10 = @"SMS_FALLBACK_STATUS_MESSAGE";
  }
  else {
    int v10 = @"SMS_FALLBACK_STATUS_MESSAGE_NO_REPLY";
  }
  int v11 = [v8 localizedStringForKey:v10 value:&stru_1EDE4CA38 table:@"ChatKit-CarrierPigeon"];
  uint64_t v12 = objc_msgSend(v7, "localizedStringWithFormat:", v11, v5);

  int v13 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v14 = [v13 userInterfaceLayoutDirection];

  if (v14 == 1) {
    v15 = @"\u200F";
  }
  else {
    v15 = @"\u200E";
  }
  v16 = [(__CFString *)v15 stringByAppendingString:v12];

  return v16;
}

- (BOOL)hasInformativeText
{
  return self->_hasInformativeText;
}

- (void)setHasInformativeText:(BOOL)a3
{
  self->_hasInformativeText = a3;
}

@end