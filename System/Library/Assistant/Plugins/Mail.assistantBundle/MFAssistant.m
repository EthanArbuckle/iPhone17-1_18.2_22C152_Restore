@interface MFAssistant
+ (id)loadEmailContentForEmails:(id)a3 delegate:(id)a4;
+ (void)permuteEmail:(id)a3 withResults:(id)a4;
@end

@implementation MFAssistant

+ (id)loadEmailContentForEmails:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v21 = v5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    uint64_t v11 = MSCriterionTypeMessageReference;
    uint64_t v12 = MSCriterionQualifierContains;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        id v14 = [objc_alloc((Class)MSCriterion) initWithType:v11 qualifier:v12 expression:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v7 addObject:v14];
      }
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  if ((unint64_t)[v7 count] < 2)
  {
    id v15 = [v7 lastObject];
  }
  else
  {
    id v15 = [objc_alloc((Class)MSCriterion) initWithCriteria:v7 allRequired:0];
  }
  v16 = v15;
  v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", MSResultsKeyMessageReference, MSResultsKeySender, MSResultsKeySubject, MSResultsKeyDateSent, MSResultsKeyRecipientTo, MSResultsKeyRecipientCc, MSResultsKeyBodySummary, MSResultsKeyOutgoing, MSResultsKeyStatus, _MSResultsKeyIsLocalDraft, _MSResultsKeyRFC822Data, 0, v21, (void)v22);
  v18 = +[MSSearch findMessageData:v17 matchingCriterion:v16 options:0 delegate:v6];
  if (!v18)
  {
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#Warning Could not initiate search for %@", buf, 0xCu);
    }
  }

  return v18;
}

+ (void)permuteEmail:(id)a3 withResults:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [v6 allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = MSResultsKeySender;
    uint64_t v11 = MSResultsKeySubject;
    uint64_t v24 = MSResultsKeyDateSent;
    uint64_t v23 = MSResultsKeyRecipientTo;
    uint64_t v22 = MSResultsKeyRecipientCc;
    uint64_t v21 = MSResultsKeyOutgoing;
    uint64_t v20 = MSResultsKeyBodySummary;
    uint64_t v18 = MSResultsKeyStatus;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
        id v14 = [v6 objectForKey:v13];
        if ([v13 isEqualToString:v10])
        {
          MFSAPersonAttributeFromEmail(v14);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          [v5 setFromEmail:v15];
LABEL_8:

          goto LABEL_13;
        }
        if ([v13 isEqualToString:v11])
        {
          [v5 setSubject:v14];
        }
        else if ([v13 isEqualToString:v24])
        {
          [v5 setDateSent:v14];
        }
        else
        {
          if ([v13 isEqualToString:v23])
          {
            MFSAPersonAttributesFromEmails(v14);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            [v5 setRecipientsTo:v15];
            goto LABEL_8;
          }
          if ([v13 isEqualToString:v22])
          {
            MFSAPersonAttributesFromEmails(v14);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            [v5 setRecipientsCc:v15];
            goto LABEL_8;
          }
          if ([v13 isEqualToString:v21])
          {
            [v5 setOutgoing:v14];
          }
          else if ([v13 isEqualToString:v20])
          {
            v19 = [v5 message];
            BOOL v16 = [v19 length] == 0;

            if (v16) {
              [v5 setMessage:v14];
            }
          }
          else if ([v13 isEqualToString:v18])
          {
            id v15 = v14;
            objc_msgSend(v5, "setStatusFlags:", objc_msgSend(v15, "unsignedIntegerValue"));
            goto LABEL_8;
          }
        }
LABEL_13:

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v17 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v8 = v17;
    }
    while (v17);
  }
}

@end