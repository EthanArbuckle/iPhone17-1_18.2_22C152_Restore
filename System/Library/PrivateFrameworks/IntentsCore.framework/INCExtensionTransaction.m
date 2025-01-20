@interface INCExtensionTransaction
+ (void)initialize;
- (BOOL)donateInteraction;
- (BOOL)shouldResetRequestAfterHandle;
- (INCExtensionRequest)request;
- (INCExtensionTransaction)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5;
- (INCExtensionTransactionState)state;
- (INIntent)currentIntent;
- (INIntentResponse)currentIntentResponse;
- (NSString)groupIdentifier;
- (NSUserActivity)currentUserActivity;
- (id)description;
- (id)userActivityWithIdentifier:(id)a3;
- (void)_addUserActivities:(id)a3;
- (void)_setCurrentIntent:(id)a3;
- (void)_setCurrentIntentResponse:(id)a3;
- (void)_updateCurrentUserActivityForType:(int64_t)a3 intent:(id)a4 intentResponse:(id)a5;
- (void)setShouldResetRequestAfterHandle:(BOOL)a3;
- (void)setState:(id)a3;
@end

@implementation INCExtensionTransaction

- (INCExtensionTransaction)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)INCExtensionTransaction;
  v11 = [(INCExtensionTransaction *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_currentIntent, a3);
    v12->_donateInteraction = a4;
    uint64_t v13 = [v10 copy];
    groupIdentifier = v12->_groupIdentifier;
    v12->_groupIdentifier = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userActivitiesByIdentifier = v12->_userActivitiesByIdentifier;
    v12->_userActivitiesByIdentifier = v15;

    v12->_shouldResetRequestAfterHandle = 1;
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.intents.INCExtensionTransaction.internal-queue", v17);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v18;
  }
  return v12;
}

- (INCExtensionRequest)request
{
  request = self->_request;
  if (!request)
  {
    v4 = [INCExtensionRequest alloc];
    v5 = [(INIntent *)self->_currentIntent identifier];
    v6 = [(INCExtensionRequest *)v4 initWithIdentifier:v5];
    v7 = self->_request;
    self->_request = v6;

    request = self->_request;
  }
  return request;
}

- (INIntent)currentIntent
{
  return self->_currentIntent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_currentIntentResponse, 0);
  objc_storeStrong((id *)&self->_currentIntent, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userActivitiesByIdentifier, 0);
}

- (void)setState:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_state, a3);
  v6 = (os_log_t *)MEMORY[0x1E4F30240];
  v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "-[INCExtensionTransaction setState:]";
    __int16 v18 = 2112;
    unint64_t v19 = (unint64_t)v5;
    _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s state = %@", (uint8_t *)&v16, 0x16u);
  }
  if (v5)
  {
    unint64_t v8 = [v5 type];
    if (v8 - 1 >= 5)
    {
      os_log_t v12 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = v12;
        if (v8 > 5) {
          v14 = 0;
        }
        else {
          v14 = off_1E62BB248[v8];
        }
        v15 = v14;
        int v16 = 136315650;
        v17 = "-[INCExtensionTransaction setState:]";
        __int16 v18 = 2048;
        unint64_t v19 = v8;
        __int16 v20 = 2112;
        objc_super v21 = v15;
        _os_log_error_impl(&dword_1BC57D000, v13, OS_LOG_TYPE_ERROR, "%s %ld (%@) is not an expected state type and therefore not handled.", (uint8_t *)&v16, 0x20u);
      }
    }
    else
    {
      id v9 = [v5 intent];
      id v10 = [v5 intentResponse];
      [(INCExtensionTransaction *)self _setCurrentIntent:v9];
      [(INCExtensionTransaction *)self _setCurrentIntentResponse:v10];
      [(INCExtensionTransaction *)self _updateCurrentUserActivityForType:v8 intent:v9 intentResponse:v10];
      v11 = [v5 userActivities];
      [(INCExtensionTransaction *)self _addUserActivities:v11];

      if (v8 == 5 && [(INCExtensionTransaction *)self shouldResetRequestAfterHandle]) {
        [(INCExtensionRequest *)self->_request reset];
      }
    }
  }
}

- (void)_setCurrentIntent:(id)a3
{
  id v5 = (INIntent *)a3;
  currentIntent = self->_currentIntent;
  p_currentIntent = &self->_currentIntent;
  if (currentIntent != v5)
  {
    unint64_t v8 = v5;
    objc_storeStrong((id *)p_currentIntent, a3);
    id v5 = v8;
  }
}

- (void)_setCurrentIntentResponse:(id)a3
{
}

- (void)_updateCurrentUserActivityForType:(int64_t)a3 intent:(id)a4 intentResponse:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 userActivity];
  os_log_t v12 = objc_msgSend(v11, "_intents_copy");

  if (!v12)
  {
    os_log_t v12 = [(INCExtensionTransaction *)self currentUserActivity];
    if (!v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F22488]);
      v14 = [v9 _className];
      os_log_t v12 = (void *)[v13 initWithActivityType:v14];
    }
  }
  v15 = (char *)[objc_alloc(MEMORY[0x1E4F30508]) _init];
  objc_storeStrong((id *)&v15[*MEMORY[0x1E4F30878]], a4);
  objc_storeStrong((id *)&v15[*MEMORY[0x1E4F30880]], a5);
  int v16 = [(INCExtensionTransaction *)self groupIdentifier];
  [v15 setGroupIdentifier:v16];

  objc_msgSend(v15, "setIntentHandlingStatus:", objc_msgSend(v10, "_intentHandlingStatus"));
  if (a3 <= 4)
  {
    [v15 setIntentHandlingStatus:5];
    goto LABEL_20;
  }
  if (a3 != 5)
  {
    __int16 v20 = (void *)*MEMORY[0x1E4F30240];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    objc_super v21 = NSNumber;
    uint64_t v22 = v20;
    v23 = [v21 numberWithInteger:a3];
    *(_DWORD *)buf = 136315394;
    v42 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]";
    __int16 v43 = 2112;
    v44 = v23;
    _os_log_error_impl(&dword_1BC57D000, v22, OS_LOG_TYPE_ERROR, "%s Unknown INCExtensionTransactionStateType %@", buf, 0x16u);

LABEL_19:
    goto LABEL_20;
  }
  unint64_t v17 = [v10 _intentResponseCode];
  if (v17 > 8) {
    goto LABEL_20;
  }
  unint64_t v18 = v17;
  if (((1 << v17) & 0x163) != 0)
  {
    unint64_t v19 = (void *)*MEMORY[0x1E4F30240];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO)) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  BOOL v24 = [(INCExtensionTransaction *)self donateInteraction];
  unint64_t v19 = (void *)*MEMORY[0x1E4F30240];
  BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO);
  if (!v24)
  {
    if (!v25) {
      goto LABEL_20;
    }
LABEL_18:
    v29 = NSNumber;
    uint64_t v22 = v19;
    v30 = [v29 numberWithInteger:v18];
    v31 = [v15 identifier];
    *(_DWORD *)buf = 136315650;
    v42 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]";
    __int16 v43 = 2112;
    v44 = v30;
    __int16 v45 = 2112;
    v46 = v31;
    _os_log_impl(&dword_1BC57D000, v22, OS_LOG_TYPE_INFO, "%s _intentResponseCode = %@, NOT donating interaction with identifier %@", buf, 0x20u);

    goto LABEL_19;
  }
  if (v25)
  {
    v26 = NSNumber;
    v27 = v19;
    v28 = [v26 numberWithInteger:v18];
    *(_DWORD *)buf = 136315650;
    v42 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]";
    __int16 v43 = 2112;
    v44 = v28;
    __int16 v45 = 2112;
    v46 = v15;
    _os_log_impl(&dword_1BC57D000, v27, OS_LOG_TYPE_INFO, "%s _intentResponseCode = %@, donating interaction %@", buf, 0x20u);
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke;
  v39[3] = &unk_1E62BBA60;
  v40 = v15;
  [v40 donateInteractionWithCompletion:v39];

LABEL_20:
  queue = self->_queue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke_11;
  v35[3] = &unk_1E62BB210;
  id v36 = v12;
  id v37 = v15;
  v38 = self;
  v33 = v15;
  id v34 = v12;
  dispatch_sync(queue, v35);
}

- (NSUserActivity)currentUserActivity
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__INCExtensionTransaction_currentUserActivity__block_invoke;
  v5[3] = &unk_1E62BB0C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUserActivity *)v3;
}

void __46__INCExtensionTransaction_currentUserActivity__block_invoke(uint64_t a1)
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

void __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) _setInteraction:*(void *)(a1 + 40) donate:0];
  v2 = *(void **)(a1 + 32);
  id v3 = (id *)(*(void *)(a1 + 48) + 32);
  objc_storeStrong(v3, v2);
}

- (void)_addUserActivities:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4F30240];
  uint64_t v6 = (void *)*MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    *(_DWORD *)buf = 136315394;
    v23 = "-[INCExtensionTransaction _addUserActivities:]";
    __int16 v24 = 2048;
    uint64_t v25 = [v4 count];
    _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s Adding %tu user activities...", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    *(void *)&long long v10 = 136315650;
    long long v17 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "_intentsIdentifier", v17, (void)v18);
        if (v15)
        {
          [(NSMutableDictionary *)self->_userActivitiesByIdentifier setObject:v14 forKey:v15];
          int v16 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            v23 = "-[INCExtensionTransaction _addUserActivities:]";
            __int16 v24 = 2112;
            uint64_t v25 = (uint64_t)v14;
            __int16 v26 = 2112;
            v27 = v15;
            _os_log_impl(&dword_1BC57D000, v16, OS_LOG_TYPE_INFO, "%s Added user activity %@ with identifier %@.", buf, 0x20u);
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v11);
  }
}

- (INCExtensionTransactionState)state
{
  return self->_state;
}

- (INIntentResponse)currentIntentResponse
{
  return self->_currentIntentResponse;
}

- (void)setShouldResetRequestAfterHandle:(BOOL)a3
{
  self->_shouldResetRequestAfterHandle = a3;
}

- (BOOL)shouldResetRequestAfterHandle
{
  return self->_shouldResetRequestAfterHandle;
}

- (BOOL)donateInteraction
{
  return self->_donateInteraction;
}

void __83__INCExtensionTransaction__updateCurrentUserActivityForType_intent_intentResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x1E4F30240];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      v7 = [v5 identifier];
      int v9 = 136315650;
      long long v10 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_ERROR, "%s Unable to donate interaction with identifier %@, error %@", (uint8_t *)&v9, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    v7 = [v8 identifier];
    int v9 = 136315394;
    long long v10 = "-[INCExtensionTransaction _updateCurrentUserActivityForType:intent:intentResponse:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Successfully donated interaction with identifier %@", (uint8_t *)&v9, 0x16u);
    goto LABEL_6;
  }
}

- (id)userActivityWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_8;
  }
  id v5 = [(NSMutableDictionary *)self->_userActivitiesByIdentifier objectForKey:v4];
  uint64_t v6 = *MEMORY[0x1E4F30240];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v7)
    {
      int v9 = 136315394;
      long long v10 = "-[INCExtensionTransaction userActivityWithIdentifier:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Unable to find user activity with identifier %@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_7;
  }
  if (v7)
  {
    int v9 = 136315650;
    long long v10 = "-[INCExtensionTransaction userActivityWithIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Found user activity %@ with identifier %@.", (uint8_t *)&v9, 0x20u);
  }
LABEL_8:

  return v5;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INCExtensionTransaction;
  id v4 = [(INCExtensionTransaction *)&v11 description];
  id v5 = [(INIntent *)self->_currentIntent identifier];
  currentIntent = self->_currentIntent;
  currentUserActivity = self->_currentUserActivity;
  id v8 = [(NSMutableDictionary *)self->_userActivitiesByIdentifier allKeys];
  int v9 = [v3 stringWithFormat:@"%@ {identifier = %@, currentIntent = %@, currentUserActivity = %@, userActivitiesIdentifiers = %@}", v4, v5, currentIntent, currentUserActivity, v8];

  return v9;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end