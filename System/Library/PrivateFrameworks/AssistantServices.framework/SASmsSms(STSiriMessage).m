@interface SASmsSms(STSiriMessage)
- (STSiriMessage)af_messageValue;
@end

@implementation SASmsSms(STSiriMessage)

- (STSiriMessage)af_messageValue
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(STSiriMessage);
  v3 = [a1 identifier];
  v4 = objc_msgSend(v3, "_af_messageIdentifierValue");
  [(STSiriModelObject *)v2 setIdentifier:v4];

  v5 = [a1 attachments];
  v6 = [v5 firstObject];
  v7 = [v6 identifier];
  [(STSiriMessage *)v2 setAttachmentURL:v7];

  v8 = [a1 dateSent];
  [(STSiriMessage *)v2 setSendDate:v8];

  v9 = [a1 message];
  [(STSiriMessage *)v2 setBodyText:v9];

  v10 = [a1 outgoing];
  -[STSiriMessage setOutbound:](v2, "setOutbound:", [v10 BOOLValue]);

  v11 = [a1 subject];
  [(STSiriMessage *)v2 setSubjectText:v11];

  v12 = [a1 chatIdentifier];
  [(STSiriMessage *)v2 setChatIdentifier:v12];

  v13 = [a1 groupName];
  [(STSiriMessage *)v2 setGroupName:v13];

  v14 = [a1 groupNameId];
  [(STSiriMessage *)v2 setGroupNameId:v14];

  v15 = [a1 msgSender];
  v16 = objc_msgSend(v15, "st_contactAddressValue");
  [(STSiriMessage *)v2 setSenderAddress:v16];

  v17 = [a1 msgSender];
  v18 = [v17 object];
  v19 = [v18 internalGUID];
  v35 = v2;
  [(STSiriMessage *)v2 _setSenderInternalGUID:v19];

  id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v21 = [a1 msgRecipients];
  v22 = objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v23 = [a1 msgRecipients];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v29 = objc_msgSend(v28, "st_contactAddressValue");
        if (v29)
        {
          [v22 addObject:v29];
        }
        else
        {
          v30 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            v31 = v30;
            v32 = [v28 aceId];
            *(_DWORD *)buf = 136315394;
            v41 = "-[SASmsSms(STSiriMessage) af_messageValue]";
            __int16 v42 = 2112;
            v43 = v32;
            _os_log_error_impl(&dword_19CF1D000, v31, OS_LOG_TYPE_ERROR, "%s Invalid message recipient has no actionable contact values %@. Ignoring that recipient.", buf, 0x16u);
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v25);
  }

  if ([v22 count]) {
    [(STSiriMessage *)v35 setRecipientAddresses:v22];
  }
  v33 = [a1 effect];
  [(STSiriMessage *)v35 setEffect:v33];

  return v35;
}

@end