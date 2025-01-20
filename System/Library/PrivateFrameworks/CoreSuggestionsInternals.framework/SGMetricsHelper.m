@interface SGMetricsHelper
+ (id)asyncQueue;
+ (void)_recordConversationTurnWithDetail:(id)a3 received:(BOOL)a4 throughApp:(id)a5 withStore:(id)a6;
+ (void)recordConversationTurnWithDetail:(id)a3 received:(BOOL)a4 throughApp:(id)a5 withStore:(id)a6;
@end

@implementation SGMetricsHelper

+ (void)recordConversationTurnWithDetail:(id)a3 received:(BOOL)a4 throughApp:(id)a5 withStore:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = +[SGMetricsHelper asyncQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__SGMetricsHelper_recordConversationTurnWithDetail_received_throughApp_withStore___block_invoke;
  v16[3] = &unk_1E65BB6F0;
  BOOL v20 = a4;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

uint64_t __82__SGMetricsHelper_recordConversationTurnWithDetail_received_throughApp_withStore___block_invoke(uint64_t a1)
{
  return +[SGMetricsHelper _recordConversationTurnWithDetail:*(void *)(a1 + 32) received:*(unsigned __int8 *)(a1 + 56) throughApp:*(void *)(a1 + 40) withStore:*(void *)(a1 + 48)];
}

+ (void)_recordConversationTurnWithDetail:(id)a3 received:(BOOL)a4 throughApp:(id)a5 withStore:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!v11)
  {
    id v11 = +[SGSqlEntityStore defaultStore];
  }
  if (![v9 containsString:@"@"])
  {
    v12 = [v11 suggestContactMatchesByPhoneNumber:v9 isMaybe:1 onlySignificant:0];
    v42 = +[SGContactPipelineHelper findContactsForDetailType:0 andValue:v9];
    id v41 = (id)*MEMORY[0x1E4F1AEE0];
    if ([v12 count])
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v25 = [v12 firstObject];
      v26 = [v25 contact];
      id v15 = [v26 phones];

      uint64_t v27 = [v15 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        unsigned int v39 = v8;
        id v40 = v10;
        id v18 = 0;
        uint64_t v29 = *(void *)v44;
LABEL_17:
        uint64_t v30 = 0;
        v31 = v18;
        while (1)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(v15);
          }
          v32 = *(void **)(*((void *)&v43 + 1) + 8 * v30);
          id v18 = [v32 extractionInfo];

          v33 = [v32 phoneNumber];
          char v34 = [v9 isEqualToString:v33];

          if (v34) {
            goto LABEL_23;
          }
          ++v30;
          v31 = v18;
          if (v28 == v30)
          {
            uint64_t v28 = [v15 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v28) {
              goto LABEL_17;
            }
            goto LABEL_23;
          }
        }
      }
LABEL_25:
      id v18 = 0;
      goto LABEL_26;
    }
LABEL_24:
    id v18 = 0;
    goto LABEL_27;
  }
  v12 = [v11 suggestContactMatchesByEmailAddress:v9 isMaybe:1 onlySignificant:0];
  v42 = +[SGContactPipelineHelper findContactsForDetailType:2 andValue:v9];
  id v41 = (id)*MEMORY[0x1E4F1ADC8];
  if (![v12 count]) {
    goto LABEL_24;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v13 = [v12 firstObject];
  id v14 = [v13 contact];
  id v15 = [v14 emailAddresses];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (!v16) {
    goto LABEL_25;
  }
  uint64_t v17 = v16;
  unsigned int v39 = v8;
  id v40 = v10;
  id v18 = 0;
  uint64_t v19 = *(void *)v48;
LABEL_7:
  uint64_t v20 = 0;
  v21 = v18;
  while (1)
  {
    if (*(void *)v48 != v19) {
      objc_enumerationMutation(v15);
    }
    v22 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
    id v18 = [v22 extractionInfo];

    v23 = [v22 emailAddress];
    char v24 = [v9 isEqualToString:v23];

    if (v24) {
      break;
    }
    ++v20;
    v21 = v18;
    if (v17 == v20)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v17) {
        goto LABEL_7;
      }
      break;
    }
  }
LABEL_23:
  id v10 = v40;
  uint64_t v8 = v39;
LABEL_26:

LABEL_27:
  if ([v12 count])
  {
    v35 = (void *)MEMORY[0x1E4F5DAF8];
    v36 = [v12 firstObject];
    v37 = [v36 contact];
    v38 = [v35 realtimeContactForNewContact:v37];
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(MEMORY[0x1E4F5DB50], "recordConversationTurnWithContact:received:curated:throughApp:withDetailName:withDetailExtraction:", v38, v8, objc_msgSend(v42, "count") != 0, v10, v41, v18);
}

+ (id)asyncQueue
{
  if (asyncQueue__pasOnceToken3 != -1) {
    dispatch_once(&asyncQueue__pasOnceToken3, &__block_literal_global_29824);
  }
  v2 = (void *)asyncQueue__pasExprOnceResult;
  return v2;
}

void __29__SGMetricsHelper_asyncQueue__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v3 = dispatch_queue_create("SGMetricsHelper-asyncQueue", v2);
  v4 = (void *)asyncQueue__pasExprOnceResult;
  asyncQueue__pasExprOnceResult = (uint64_t)v3;
}

@end