@interface MFNanoServerMessageFetchService
- (id)_criterionForFilterType:(unint64_t)a3;
- (id)_criterionForMessagesFromMailbox:(id)a3 param:(id)a4;
- (id)_criterionForMessagesFromMailboxes:(id)a3 param:(id)a4;
- (id)_filterTypeCriterionForMailbox:(id)a3;
- (id)criterionForMailboxUrl:(id)a3;
- (id)messagesForMailboxes:(id)a3 param:(id)a4;
@end

@implementation MFNanoServerMessageFetchService

- (id)messagesForMailboxes:(id)a3 param:(id)a4
{
  id v6 = a4;
  v7 = [(MFNanoServerMessageFetchService *)self _criterionForMessagesFromMailboxes:a3 param:v6];
  if (v7)
  {
    unsigned __int8 v11 = 0;
    v8 = +[MFMailMessageLibrary defaultInstance];
    v9 = objc_msgSend(v8, "loadLibraryMessagesFromLibraryMatchingCriterion:count:protectedDataAvailable:", v7, objc_msgSend(v6, "count"), &v11);

    [v6 setProtectedDataAvailable:v11];
  }
  else
  {
    v9 = &__NSArray0__struct;
  }

  return v9;
}

- (id)_criterionForMessagesFromMailboxes:(id)a3 param:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = -[MFNanoServerMessageFetchService _criterionForMessagesFromMailbox:param:](self, "_criterionForMessagesFromMailbox:param:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        if (v13) {
          [v8 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v8];

  return v14;
}

- (id)_criterionForMessagesFromMailbox:(id)a3 param:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 url];
  id v9 = [(MFNanoServerMessageFetchService *)self criterionForMailboxUrl:v8];

  if (v9)
  {
    id v10 = objc_alloc_init((Class)NSMutableArray);
    [v10 addObject:v9];
    uint64_t v11 = [(MFNanoServerMessageFetchService *)self _filterTypeCriterionForMailbox:v6];
    if (v11) {
      [v10 addObject:v11];
    }
    v12 = [v7 beforeDateReceived];

    if (v12)
    {
      id v13 = objc_alloc((Class)MFMessageCriterion);
      v14 = [v7 beforeDateReceived];
      [v14 timeIntervalSince1970];
      long long v16 = +[NSString stringWithFormat:@"%lld", (uint64_t)v15];
      id v17 = [v13 initWithType:11 qualifier:5 expression:v16];

      [v10 addObject:v17];
    }
    long long v18 = [v7 dateReceivedLimit];

    if (v18)
    {
      id v19 = objc_alloc((Class)MFMessageCriterion);
      v20 = [v7 dateReceivedLimit];
      [v20 timeIntervalSince1970];
      v22 = +[NSString stringWithFormat:@"%lld", (uint64_t)(v21 + -1.0)];
      id v23 = [v19 initWithType:11 qualifier:6 expression:v22];

      [v10 addObject:v23];
    }
    v24 = [v7 conversationId];

    if (v24)
    {
      id v25 = objc_alloc((Class)MFMessageCriterion);
      v26 = [v7 conversationId];
      id v27 = [v25 initWithType:34 qualifier:3 expression:v26];

      [v10 addObject:v27];
    }
    v28 = +[MFMessageCriterion andCompoundCriterionWithCriteria:v10];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)criterionForMailboxUrl:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 absoluteString];
    id v6 = +[MFMessageCriterion criterionForMailboxURL:v5];
  }
  else
  {
    id v7 = +[MailAccount nano_activeMailAccounts];
    id v17 = v7;
    if (v7)
    {
      id v8 = +[NSMutableArray array];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v19;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) mailboxUidOfType:7 createIfNeeded:0];
            v14 = [v13 URLString];
            double v15 = +[MFMessageCriterion criterionForMailboxURL:v14];
            [v8 addObject:v15];
          }
          id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      id v6 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v8];
    }
    else
    {
      id v6 = 0;
    }
  }

  return v6;
}

- (id)_filterTypeCriterionForMailbox:(id)a3
{
  id v4 = a3;
  if ([v4 hasFilterType:1])
  {
    v5 = 0;
  }
  else
  {
    id v6 = +[NSMutableArray array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [&off_100146598 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(&off_100146598);
          }
          id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntegerValue];
          if ([v4 hasFilterType:v10])
          {
            uint64_t v11 = [(MFNanoServerMessageFetchService *)self _criterionForFilterType:v10];
            if (v11) {
              [v6 addObject:v11];
            }
          }
        }
        id v7 = [&off_100146598 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    v5 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v6];
  }

  return v5;
}

- (id)_criterionForFilterType:(unint64_t)a3
{
  id v3 = 0;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        id v3 = +[MFMessageCriterion includesMeCriterion];
        break;
      case 0x20uLL:
        id v3 = +[MFMessageCriterion threadNotifyMessageCriterion];
        break;
      case 0x40uLL:
        id v3 = +[MFMessageCriterion todayMessageCriterion];
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 2uLL:
        id v3 = +[MFMessageCriterion senderIsVIPCriterion:1];
        break;
      case 4uLL:
        id v3 = +[MFMessageCriterion flaggedMessageCriterion];
        break;
      case 8uLL:
        id v3 = +[MFMessageCriterion unreadMessageCriterion];
        break;
    }
  }

  return v3;
}

@end