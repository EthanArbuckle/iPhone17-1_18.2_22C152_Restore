@interface ATXLazyIntent
- (ATXLazyIntent)initWithIntent:(id)a3;
- (ATXLazyIntent)initWithIntent:(id)a3 intentData:(id)a4;
- (ATXLazyIntent)initWithIntentData:(id)a3;
- (ATXLazyIntentDelegateProtocol)delegate;
- (BOOL)isDeserialized;
- (INIntent)intent;
- (NSData)intentData;
- (id)_deserializeIntent;
- (void)_deserializeIntent;
- (void)handleMemoryPressure;
- (void)setDelegate:(id)a3;
@end

@implementation ATXLazyIntent

- (ATXLazyIntent)initWithIntent:(id)a3
{
  return [(ATXLazyIntent *)self initWithIntent:a3 intentData:0];
}

- (ATXLazyIntent)initWithIntentData:(id)a3
{
  return [(ATXLazyIntent *)self initWithIntent:0 intentData:a3];
}

- (ATXLazyIntent)initWithIntent:(id)a3 intentData:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ATXLazyIntent.m", 41, @"Invalid parameter not satisfying: %@", @"intent || intentData" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)ATXLazyIntent;
  v10 = [(ATXLazyIntent *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_intent, a3);
    objc_storeStrong((id *)&v11->_intentData, a4);
  }

  return v11;
}

- (INIntent)intent
{
  v2 = self;
  objc_sync_enter(v2);
  intent = v2->_intent;
  if (!intent)
  {
    uint64_t v4 = [(ATXLazyIntent *)v2 _deserializeIntent];
    v5 = v2->_intent;
    v2->_intent = (INIntent *)v4;

    id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
    [WeakRetained didDeserializeIntent:v2->_intent];

    intent = v2->_intent;
  }
  v7 = intent;
  objc_sync_exit(v2);

  return v7;
}

- (NSData)intentData
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_intentData;
  objc_sync_exit(v2);

  return v3;
}

- (id)_deserializeIntent
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(NSData *)v2->_intentData length])
  {
    v3 = (void *)MEMORY[0x1AD0D3C30]();
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v5 = objc_opt_class();
    intentData = v2->_intentData;
    id v11 = 0;
    v7 = [v4 unarchivedObjectOfClass:v5 fromData:intentData error:&v11];
    id v8 = v11;
    if (v8)
    {
      unint64_t v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(ATXLazyIntent *)(uint64_t)v8 _deserializeIntent];
      }
    }
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v2);

  return v7;
}

- (BOOL)isDeserialized
{
  return self->_intent != 0;
}

- (void)handleMemoryPressure
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(ATXLazyIntent *)v2 intentData];
  if (v3)
  {
    uint64_t v4 = [(ATXLazyIntent *)v2 intent];

    if (v4)
    {
      uint64_t v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXLazyIntent purging intent data due to memory pressure", v7, 2u);
      }

      intentData = v2->_intentData;
      v2->_intentData = 0;
    }
  }
  objc_sync_exit(v2);
}

- (ATXLazyIntentDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXLazyIntentDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_intentData, 0);

  objc_storeStrong((id *)&self->_intent, 0);
}

- (void)_deserializeIntent
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "ATXLazyIntent could not de-serialize intent: %@", (uint8_t *)&v2, 0xCu);
}

@end