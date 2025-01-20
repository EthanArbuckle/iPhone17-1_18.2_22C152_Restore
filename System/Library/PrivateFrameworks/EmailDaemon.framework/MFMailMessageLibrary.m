@interface MFMailMessageLibrary
- (id)libraryMessageForMessageId:(id)a3 libraryOptions:(unsigned int)a4;
- (id)libraryMessagesForMessageIds:(id)a3 protectedDataAvailable:(BOOL *)a4;
- (id)loadLibraryMessagesFromLibraryMatchingCriterion:(id)a3 count:(unint64_t)a4 protectedDataAvailable:(BOOL *)a5;
@end

@implementation MFMailMessageLibrary

- (id)libraryMessageForMessageId:(id)a3 libraryOptions:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v5 = +[NSURL URLWithString:a3];
  v6 = objc_msgSend(v5, "mf_messageCriterion");
  v7 = +[MFMailMessageLibrary defaultInstance];
  v8 = [v7 messagesMatchingCriterion:v6 options:v4];

  v9 = [v8 firstObject];

  return v9;
}

- (id)libraryMessagesForMessageIds:(id)a3 protectedDataAvailable:(BOOL *)a4
{
  id v19 = a3;
  if ([v19 count])
  {
    v18 = self;
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v19;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v12 = +[NSURL URLWithString:v11];
          v13 = objc_msgSend(v12, "mf_messageCriterion");

          if (v13)
          {
            [v6 addObject:v13];
          }
          else
          {
            v14 = MFLogGeneral();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v25 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Nano Could not create criterion for message id: %{public}@", buf, 0xCu);
            }
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }

    id v15 = objc_alloc_init((Class)MFMessageCriterion);
    [v15 setCriterionType:25];
    [v15 setAllCriteriaMustBeSatisfied:0];
    [v15 setCriteria:v6];
    v16 = [(MFMailMessageLibrary *)v18 loadLibraryMessagesFromLibraryMatchingCriterion:v15 count:0x7FFFFFFFFFFFFFFFLL protectedDataAvailable:a4];
  }
  else
  {
    v16 = &__NSArray0__struct;
  }

  return v16;
}

- (id)loadLibraryMessagesFromLibraryMatchingCriterion:(id)a3 count:(unint64_t)a4 protectedDataAvailable:(BOOL *)a5
{
  id v7 = a3;
  if (a5)
  {
    id v8 = +[MFMailMessageLibrary defaultInstance];
    *a5 = [v8 protectedDataAvailability] == 0;
  }
  uint64_t v9 = +[MFMailMessageLibrary defaultInstance];
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    [v9 messagesMatchingCriterion:v7 options:6297791];
  }
  else {
  v10 = objc_msgSend(v9, "messagesMatchingCriterion:options:range:", v7, 6297791, 0, a4);
  }

  if (a5)
  {
    uint64_t v11 = +[MFMailMessageLibrary defaultInstance];
    if ([v11 protectedDataAvailability]) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = !*a5;
    }
    BOOL v13 = !v12;
    *a5 = v13;
  }

  return v10;
}

@end