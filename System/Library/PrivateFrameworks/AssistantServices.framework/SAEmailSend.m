@interface SAEmailSend
- (id)_ad_transformedMailSuccessResponse;
- (id)_ad_transformedSendEmailRequest;
- (id)_personsForRecipients:(id)a3;
@end

@implementation SAEmailSend

- (id)_personsForRecipients:(id)a3
{
  id v3 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = objc_alloc_init((Class)STPersonContactHandle);
        [v9 setType:0];
        v10 = [v8 data];
        [v9 setHandle:v10];

        id v11 = objc_alloc_init((Class)STPerson);
        v12 = +[NSSet setWithObject:v9];
        [v11 setContactHandles:v12];

        v13 = [v8 displayText];
        [v11 setFullName:v13];

        if (v11) {
          [v16 addObject:v11];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v16;
}

- (id)_ad_transformedMailSuccessResponse
{
  id v2 = objc_alloc_init((Class)SACommandSucceeded);
  return v2;
}

- (id)_ad_transformedSendEmailRequest
{
  id v3 = [(SAEmailSend *)self email];
  id v4 = [v3 type];
  unsigned __int8 v5 = [v4 isEqualToString:SAEmailTypeNewValue];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v7 = [v3 type];
    unsigned __int8 v8 = [v7 isEqualToString:SAEmailTypeReplyValue];

    if (v8)
    {
      uint64_t v6 = 1;
    }
    else
    {
      id v9 = [v3 type];
      unsigned __int8 v10 = [v9 isEqualToString:SAEmailTypeReplyAllValue];

      if (v10)
      {
        uint64_t v6 = 2;
      }
      else
      {
        id v11 = [v3 type];
        unsigned int v12 = [v11 isEqualToString:SAEmailTypeForwardValue];

        if (v12) {
          uint64_t v6 = 3;
        }
        else {
          uint64_t v6 = 0;
        }
      }
    }
  }
  id v13 = objc_alloc_init((Class)STEmailMessage);
  [v13 setType:v6];
  v14 = [v3 recipientsTo];
  v15 = [(SAEmailSend *)self _personsForRecipients:v14];
  [v13 setToRecipients:v15];

  id v16 = [v3 recipientsCc];
  long long v17 = [(SAEmailSend *)self _personsForRecipients:v16];
  [v13 setCcRecipients:v17];

  long long v18 = [v3 recipientsBcc];
  long long v19 = [(SAEmailSend *)self _personsForRecipients:v18];
  [v13 setBccRecipients:v19];

  long long v20 = [v3 receivingAddresses];
  [v13 setReceivingAddresses:v20];

  uint64_t v21 = [v3 fromEmail];
  v22 = (void *)v21;
  if (v21)
  {
    uint64_t v31 = v21;
    v23 = +[NSArray arrayWithObjects:&v31 count:1];
    v24 = [(SAEmailSend *)self _personsForRecipients:v23];
    v25 = [v24 firstObject];
    [v13 setSender:v25];
  }
  v26 = [v3 subject];
  [v13 setSubject:v26];

  v27 = [v3 message];
  [v13 setMessageBody:v27];

  v28 = [v3 identifier];
  [v13 setMessageIdentifier:v28];

  id v29 = [objc_alloc((Class)STSendEmailRequest) _initWithMessage:v13];
  return v29;
}

@end