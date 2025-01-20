@interface IMDChatUtilities
+ (IMDChatUtilities)sharedUtilities;
+ (id)_stringForChatIDs:(id)a3 onServices:(id)a4;
- (NSMutableSet)currentlyDownloadingSet;
- (void)setCurrentlyDownloadingSet:(id)a3;
@end

@implementation IMDChatUtilities

+ (IMDChatUtilities)sharedUtilities
{
  if (qword_10007D338 != -1) {
    dispatch_once(&qword_10007D338, &stru_100071960);
  }
  v2 = (void *)qword_10007D340;

  return (IMDChatUtilities *)v2;
}

+ (id)_stringForChatIDs:(id)a3 onServices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    id v7 = [&stru_100072DA0 mutableCopy];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 appendFormat:@"%@:\n", *(void *)(*((void *)&v24 + 1) + 8 * i)];
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          [v7 appendFormat:@"%@\n", *(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
        }
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    id v18 = [v7 copy];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (NSMutableSet)currentlyDownloadingSet
{
  return self->_currentlyDownloadingSet;
}

- (void)setCurrentlyDownloadingSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end