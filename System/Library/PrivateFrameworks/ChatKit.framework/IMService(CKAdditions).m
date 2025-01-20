@interface IMService(CKAdditions)
- (BOOL)__ck_isRCS;
- (BOOL)__ck_isSMS;
- (BOOL)__ck_isiMessage;
- (id)__ck_attributedEntryViewDisplayName;
- (id)__ck_entryViewDisplayName;
- (uint64_t)__ck_displayColor;
- (uint64_t)__ck_displayReplyColor;
- (uint64_t)__ck_isCarrierBased;
- (uint64_t)__ck_isMadrid;
- (uint64_t)__ck_isSatelliteSMS;
- (uint64_t)__ck_isiMessageLite;
- (uint64_t)__ck_maxRecipientCountForHandle:()CKAdditions simID:;
- (uint64_t)__ck_serviceType;
@end

@implementation IMService(CKAdditions)

- (BOOL)__ck_isiMessage
{
  v2 = [MEMORY[0x1E4F6BDC0] iMessageService];
  BOOL v3 = v2 == a1;

  return v3;
}

- (uint64_t)__ck_isiMessageLite
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isCarrierPigeonEnabled];

  if (!v3) {
    return 0;
  }
  v4 = [a1 name];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F6E1B8]];

  return v5;
}

- (uint64_t)__ck_isSatelliteSMS
{
  v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v3 = [v2 isCarrierPigeonEnabled];

  if (!v3) {
    return 0;
  }
  v4 = [a1 name];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x1E4F6E1A8]];

  return v5;
}

- (uint64_t)__ck_isMadrid
{
  if (objc_msgSend(a1, "__ck_isiMessage")) {
    return 1;
  }

  return objc_msgSend(a1, "__ck_isiMessageLite");
}

- (BOOL)__ck_isSMS
{
  v2 = [MEMORY[0x1E4F6BDC0] smsService];
  BOOL v3 = v2 == a1;

  return v3;
}

- (BOOL)__ck_isRCS
{
  v2 = [MEMORY[0x1E4F6BDC0] rcsService];
  BOOL v3 = v2 == a1;

  return v3;
}

- (uint64_t)__ck_isCarrierBased
{
  if (objc_msgSend(a1, "__ck_isSMS")) {
    return 1;
  }

  return objc_msgSend(a1, "__ck_isRCS");
}

- (id)__ck_attributedEntryViewDisplayName
{
  v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 messageEntryViewUsesAbbreviatedServiceNames];

  if (!v3) {
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "__ck_isiMessageLite"))
  {
    v4 = CKFrameworkBundle();
    uint64_t v5 = v4;
    v6 = @"MADRID";
  }
  else
  {
    if (!objc_msgSend(a1, "__ck_isSatelliteSMS")) {
      goto LABEL_8;
    }
    v4 = CKFrameworkBundle();
    uint64_t v5 = v4;
    v6 = @"TEXT_MESSAGE_WATCH";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v7 attributes:0];
    objc_msgSend(v8, "replaceCharactersInRange:withString:", 0, 0, @" ");
    v9 = +[CKUIBehavior sharedBehaviors];
    v10 = [v9 satelliteServiceIcon];

    id v11 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v11 setImage:v10];
    v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
    [v8 insertAttributedString:v12 atIndex:0];

    v13 = (void *)[v8 copy];
    goto LABEL_9;
  }
LABEL_8:
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  v7 = objc_msgSend(a1, "__ck_entryViewDisplayName");
  v13 = (void *)[v14 initWithString:v7];
LABEL_9:

  return v13;
}

- (id)__ck_entryViewDisplayName
{
  v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 messageEntryViewUsesAbbreviatedServiceNames];

  if (!v3) {
    goto LABEL_8;
  }
  if (!objc_msgSend(a1, "__ck_isSMS"))
  {
    if (objc_msgSend(a1, "__ck_isRCS"))
    {
      if ((IMDeviceIsGreenTea() & 1) != 0 || [MEMORY[0x1E4F6E730] IMDeviceIsChinaRegion])
      {
        v4 = CKFrameworkBundle();
        uint64_t v5 = v4;
        v6 = @"5G_MESSAGING_WATCH";
      }
      else
      {
        v4 = CKFrameworkBundle();
        uint64_t v5 = v4;
        v6 = @"RCS_WATCH";
      }
      goto LABEL_10;
    }
LABEL_8:
    v7 = objc_msgSend(a1, "__ck_displayName");
    goto LABEL_11;
  }
  v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  v6 = @"TEXT_MESSAGE_WATCH";
LABEL_10:
  v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_11:

  return v7;
}

- (uint64_t)__ck_maxRecipientCountForHandle:()CKAdditions simID:
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(a1, "__ck_isSMS"))
  {
    uint64_t v8 = (int)[MEMORY[0x1E4F6E660] IMMMSMaxRecipientsForPhoneNumber:v6 simID:v7];
  }
  else if (objc_msgSend(a1, "__ck_isRCS"))
  {
    v9 = [MEMORY[0x1E4F6E658] sharedManager];
    uint64_t v8 = [v9 groupMessagingMaxGroupSizeForPhoneNumber:v6 simID:v7];
  }
  else if ([MEMORY[0x1E4F6BDC0] iMessageEnabled])
  {
    uint64_t v8 = [a1 maxChatParticipantsForHandle:v6 simID:v7];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (uint64_t)__ck_displayColor
{
  return objc_msgSend(a1, "__ck_isMadrid");
}

- (uint64_t)__ck_displayReplyColor
{
  if (objc_msgSend(a1, "__ck_isMadrid")) {
    return 10;
  }
  else {
    return 11;
  }
}

- (uint64_t)__ck_serviceType
{
  if (objc_msgSend(a1, "__ck_isSMS"))
  {
    return 3;
  }
  else if (objc_msgSend(a1, "__ck_isiMessage"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

@end