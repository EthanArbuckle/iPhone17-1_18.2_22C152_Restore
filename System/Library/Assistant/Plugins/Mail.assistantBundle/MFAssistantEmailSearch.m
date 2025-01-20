@interface MFAssistantEmailSearch
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (id)_generateAceResults;
- (id)_generateMSCriterion;
- (id)_perform;
- (id)_validate;
- (void)_populateResults:(id)a3;
- (void)_searchFinished:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)search:(id)a3 didFinishWithError:(id)a4;
@end

@implementation MFAssistantEmailSearch

- (id)_validate
{
  if (MSCanSendMail())
  {
    v3 = [(MFAssistantEmailSearch *)self startDate];
    if (v3) {
      goto LABEL_7;
    }
    v3 = [(MFAssistantEmailSearch *)self endDate];
    if (v3
      || ([(MFAssistantEmailSearch *)self fromEmail],
          (v3 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(MFAssistantEmailSearch *)self subject], (v3 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(MFAssistantEmailSearch *)self toEmail], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_7:
    }
    else if (![(MFAssistantEmailSearch *)self status])
    {
      id v10 = objc_alloc((Class)SACommandFailed);
      CFStringRef v11 = @"No criteria specified for email search.";
      goto LABEL_12;
    }
    id v4 = [(MFAssistantEmailSearch *)self startDate];
    if (!v4) {
      goto LABEL_16;
    }
    v5 = v4;
    v6 = [(MFAssistantEmailSearch *)self endDate];
    if (v6)
    {
      v7 = [(MFAssistantEmailSearch *)self startDate];
      v8 = [(MFAssistantEmailSearch *)self endDate];
      v9 = (char *)[v7 compare:v8];

      if (v9 == (unsigned char *)&dword_0 + 1)
      {
        id v10 = objc_alloc((Class)SACommandFailed);
        CFStringRef v11 = @"End date is before start date.";
LABEL_12:
        id v4 = [v10 initWithReason:v11];
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v4 = 0;
  }
  else
  {
    id v12 = objc_alloc((Class)SACommandFailed);
    id v4 = [v12 initWithErrorCode:SAEmailNoAccountErrorCode];
  }
LABEL_16:

  return v4;
}

- (id)_generateMSCriterion
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(MFAssistantEmailSearch *)self fromEmail];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_alloc((Class)MSCriterion);
    v7 = [(MFAssistantEmailSearch *)self fromEmail];
    id v8 = [v6 initWithType:MSCriterionTypeSender qualifier:MSCriterionQualifierContains expression:v7];

    [v3 addObject:v8];
  }
  v9 = [(MFAssistantEmailSearch *)self subject];
  id v10 = [v9 length];

  if (v10)
  {
    id v11 = objc_alloc((Class)MSCriterion);
    id v12 = [(MFAssistantEmailSearch *)self subject];
    id v13 = [v11 initWithType:MSCriterionTypeSubject qualifier:MSCriterionQualifierContains expression:v12];

    [v3 addObject:v13];
  }
  v14 = [(MFAssistantEmailSearch *)self toEmail];
  id v15 = [v14 length];

  if (v15)
  {
    id v16 = objc_alloc((Class)MSCriterion);
    v17 = [(MFAssistantEmailSearch *)self toEmail];
    id v18 = [v16 initWithType:MSCriterionTypeAnyRecipient qualifier:MSCriterionQualifierContains expression:v17];

    [v3 addObject:v18];
  }
  v19 = [(MFAssistantEmailSearch *)self startDate];

  if (v19)
  {
    id v20 = objc_alloc((Class)MSCriterion);
    v21 = [(MFAssistantEmailSearch *)self startDate];
    id v22 = [v20 initWithType:MSCriterionTypeReceivedDate qualifier:MSCriterionQualifierGreaterThan expression:v21];

    [v3 addObject:v22];
  }
  v23 = [(MFAssistantEmailSearch *)self endDate];

  if (v23)
  {
    id v24 = objc_alloc((Class)MSCriterion);
    v25 = [(MFAssistantEmailSearch *)self endDate];
    id v26 = [v24 initWithType:MSCriterionTypeReceivedDate qualifier:MSCriterionQualifierLessThan expression:v25];

    [v3 addObject:v26];
  }
  if ([(MFAssistantEmailSearch *)self status])
  {
    id v27 = objc_alloc((Class)MSCriterion);
    unsigned int v28 = [(MFAssistantEmailSearch *)self status];
    v29 = &MSCriterionExpressionRead;
    if (v28 != 1) {
      v29 = &MSCriterionExpressionUnread;
    }
    id v30 = [v27 initWithType:MSCriterionTypeReadStatus qualifier:MSCriterionQualifierContains expression:*v29];
    [v3 addObject:v30];
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v31 = [objc_alloc((Class)MSCriterion) initWithCriteria:v3 allRequired:1];
LABEL_19:
    v32 = v31;
    goto LABEL_21;
  }
  if ([v3 count] == (char *)&dword_0 + 1)
  {
    id v31 = [v3 objectAtIndexedSubscript:0];
    goto LABEL_19;
  }
  v32 = 0;
LABEL_21:

  return v32;
}

- (id)_generateAceResults
{
  id v26 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_results;
  id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v3)
  {
    uint64_t v25 = *(void *)v28;
    uint64_t v24 = MSResultsKeyMessageReference;
    uint64_t v23 = MSResultsKeyDateSent;
    uint64_t v22 = MSResultsKeySender;
    uint64_t v4 = MSResultsKeyRecipientTo;
    uint64_t v5 = MSResultsKeyRecipientCc;
    uint64_t v6 = MSResultsKeySubject;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v9 = objc_alloc_init((Class)SAEmailEmail);
        id v10 = [v8 objectForKey:v24];
        id v11 = +[NSURL URLWithString:v10];

        [v9 setIdentifier:v11];
        id v12 = [v8 objectForKey:v23];
        [v9 setDateSent:v12];

        id v13 = [v8 objectForKey:v22];
        v14 = MFSAPersonAttributeFromEmail(v13);
        [v9 setFromEmail:v14];

        id v15 = [v8 objectForKey:v4];
        id v16 = MFSAPersonAttributesFromEmails(v15);
        [v9 setRecipientsTo:v16];

        v17 = [v8 objectForKey:v5];
        id v18 = MFSAPersonAttributesFromEmails(v17);
        [v9 setRecipientsCc:v18];

        v19 = [v8 objectForKey:v6];
        [v9 setSubject:v19];

        [v26 addObject:v9];
      }
      id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v3);
  }

  return v26;
}

- (id)_perform
{
  id v3 = [(MFAssistantEmailSearch *)self _generateMSCriterion];
  self->_currentResultCount = 0;
  uint64_t v4 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  searchCompleted = self->_searchCompleted;
  self->_searchCompleted = v4;

  uint64_t v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", MSResultsKeyMessageReference, MSResultsKeyDateSent, MSResultsKeySender, MSResultsKeyRecipientTo, MSResultsKeyRecipientCc, MSResultsKeySubject, 0);
  v7 = +[MSSearch findMessageData:v6 matchingCriterion:v3 options:4 delegate:self];

  if (v7)
  {
    id v8 = self->_searchCompleted;
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      id v10 = MFLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_8C24(v10);
      }
    }
    [v7 cancel];
    id v11 = self->_searchCompleted;
    self->_searchCompleted = 0;

    id v12 = objc_alloc((Class)SAEmailSearchCompleted);
    id v13 = [(MFAssistantEmailSearch *)self _generateAceResults];
    id v14 = [v12 initWithEmailResults:v13];
  }
  else
  {
    id v14 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Could not generate a search command."];
  }

  return v14;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, void *))a3;
  uint64_t v4 = [(MFAssistantEmailSearch *)self _validate];
  if (!v4)
  {
    uint64_t v4 = [(MFAssistantEmailSearch *)self _perform];
  }
  uint64_t v5 = [v4 dictionary];
  v6[2](v6, v5);
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
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[NSMutableArray ef_insertObject:usingSortFunction:context:allowDuplicates:](self->_results, "ef_insertObject:usingSortFunction:context:allowDuplicates:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), sub_7890, 0, 0, (void)v11);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_searchFinished:(id)a3
{
  *((unsigned char *)self + 32) = *((unsigned char *)self + 32) & 0xFE | (a3 != 0);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_searchCompleted);
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  id v5 = a4;
  unsigned int v6 = self->_currentResultCount + [v5 count];
  self->_currentResultCount = v6;
  [(MFAssistantEmailSearch *)self _populateResults:v5];

  return v6 < 0x1A;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCompleted, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end