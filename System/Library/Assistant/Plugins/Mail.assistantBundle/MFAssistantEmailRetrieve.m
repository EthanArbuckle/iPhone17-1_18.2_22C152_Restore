@interface MFAssistantEmailRetrieve
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (id)_convertMSEmailToSAEmail:(id)a3;
- (id)_retrieveEmails:(id)a3;
- (id)_validateEmails:(id)a3;
- (void)_populateResults:(id)a3;
- (void)_searchFinished:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)search:(id)a3 didFinishWithError:(id)a4;
@end

@implementation MFAssistantEmailRetrieve

- (id)_validateEmails:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "identifier", (void)v9);
        if ((objc_msgSend(v7, "em_isInternalMessageURL") & 1) == 0)
        {
          id v4 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Can only retrieve messages that are in our database."];

          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_retrieveEmails:(id)a3
{
  id v30 = a3;
  if (!self->_resultsQueue)
  {
    id v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilemail.assistant-email-retrieve", 0);
    resultsQueue = self->_resultsQueue;
    self->_resultsQueue = v4;
  }
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v30;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    uint64_t v10 = MSCriterionTypeMessageReference;
    uint64_t v11 = MSCriterionQualifierContains;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v14 = objc_alloc((Class)MSCriterion);
        v15 = [v13 identifier];
        id v16 = [v14 initWithType:v10 qualifier:v11 expression:v15];

        [v6 addObject:v16];
      }
      id v8 = [v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  if ((unint64_t)[v6 count] < 2)
  {
    id v17 = [v6 lastObject];
  }
  else
  {
    id v17 = [objc_alloc((Class)MSCriterion) initWithCriteria:v6 allRequired:0];
  }
  v18 = v17;
  v19 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  searchCompleted = self->_searchCompleted;
  self->_searchCompleted = v19;

  v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", MSResultsKeyMessageReference, MSResultsKeyRecipientBcc, MSResultsKeyRecipientCc, MSResultsKeyRecipientTo, MSResultsKeySender, MSResultsKeyReceivingAddresses, 0);
  v22 = +[MSSearch findMessageData:v21 matchingCriterion:v18 options:4 delegate:self];

  if (v22)
  {
    v23 = self->_searchCompleted;
    dispatch_time_t v24 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v23, v24))
    {
      id v25 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Search timed out."];
    }
    else
    {
      id v26 = objc_alloc_init((Class)SADomainObjectRetrieveCompleted);
      v27 = self->_resultsQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_64CC;
      block[3] = &unk_C3B0;
      id v28 = v26;
      id v32 = v28;
      v33 = self;
      dispatch_sync(v27, block);
      id v25 = v28;
    }
    [v22 cancel];
  }
  else
  {
    id v25 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Could not generate a search command."];
  }

  return v25;
}

- (void)performWithCompletion:(id)a3
{
  id v8 = (void (**)(id, void *))a3;
  id v4 = [(MFAssistantEmailRetrieve *)self identifiers];
  uint64_t v5 = [(MFAssistantEmailRetrieve *)self _validateEmails:v4];

  if (!v5)
  {
    id v6 = [(MFAssistantEmailRetrieve *)self identifiers];
    uint64_t v5 = [(MFAssistantEmailRetrieve *)self _retrieveEmails:v6];
  }
  id v7 = [v5 dictionary];
  v8[2](v8, v7);
}

- (id)_convertMSEmailToSAEmail:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SAEmailEmail);
  uint64_t v5 = [v3 objectForKey:MSResultsKeyMessageReference];
  id v6 = +[NSURL URLWithString:v5];
  [v4 setIdentifier:v6];

  id v7 = [v3 objectForKey:MSResultsKeyRecipientTo];
  id v8 = MFSAPersonAttributesFromEmails(v7);
  [v4 setRecipientsTo:v8];

  uint64_t v9 = [v3 objectForKey:MSResultsKeyRecipientCc];
  uint64_t v10 = MFSAPersonAttributesFromEmails(v9);
  [v4 setRecipientsCc:v10];

  uint64_t v11 = [v3 objectForKey:MSResultsKeyRecipientBcc];
  long long v12 = MFSAPersonAttributesFromEmails(v11);
  [v4 setRecipientsBcc:v12];

  v13 = [v3 objectForKey:MSResultsKeySender];
  id v14 = MFSAPersonAttributeFromEmail(v13);
  [v4 setFromEmail:v14];

  v15 = [v3 objectForKey:MSResultsKeyReceivingAddresses];
  [v4 setReceivingAddresses:v15];

  return v4;
}

- (void)_populateResults:(id)a3
{
  id v4 = a3;
  if (!self->_results)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    results = self->_results;
    self->_results = v5;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = -[MFAssistantEmailRetrieve _convertMSEmailToSAEmail:](self, "_convertMSEmailToSAEmail:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        if (v11) {
          [(NSMutableArray *)self->_results addObject:v11];
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_searchFinished:(id)a3
{
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v5 = a4;
  resultsQueue = self->_resultsQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_6A3C;
  v9[3] = &unk_C3B0;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(resultsQueue, v9);

  return 1;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a4;
  resultsQueue = self->_resultsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6AE8;
  v8[3] = &unk_C3B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(resultsQueue, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCompleted, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end