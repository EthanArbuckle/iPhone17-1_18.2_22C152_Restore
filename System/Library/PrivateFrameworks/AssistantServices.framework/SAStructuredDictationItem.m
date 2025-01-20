@interface SAStructuredDictationItem
- (id)ad_transcriptionResults;
@end

@implementation SAStructuredDictationItem

- (id)ad_transcriptionResults
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(SAStructuredDictationItem *)self resultOptions];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(SAStructuredDictationItem *)self resultOptions];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v9 = v7;
    v10 = 0;
    uint64_t v11 = *(void *)v19;
    *(void *)&long long v8 = 136315394;
    long long v17 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (!v10)
        {
          if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "ad_transcriptionResultRequiresAddressBook"))v10 = objc_alloc_init(ADAddressBookManager); {
          else
          }
            v10 = 0;
        }
        v14 = objc_msgSend(v13, "ad_transcriptionResultWithAddressBookManager:", v10, v17);
        if (v14)
        {
          [v5 addObject:v14];
        }
        else
        {
          v15 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[SAStructuredDictationItem(StructuredDictation) ad_transcriptionResults]";
            __int16 v24 = 2112;
            v25 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Don't know how to create a transcription result for %@", buf, 0x16u);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v5;
}

@end