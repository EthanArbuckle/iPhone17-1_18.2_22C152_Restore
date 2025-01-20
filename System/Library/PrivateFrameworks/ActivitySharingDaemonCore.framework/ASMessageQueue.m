@interface ASMessageQueue
- (ASMessageQueue)init;
- (ASMessageQueue)initWithQueueName:(id)a3;
- (id)messageWithIdentifier:(id)a3;
- (void)_synchronizePreferences;
- (void)dealloc;
- (void)enumerateQueuedMessagesUsingBlock:(id)a3;
- (void)removeMessageWithIdentifier:(id)a3;
- (void)setMessage:(id)a3 identifier:(id)a4;
@end

@implementation ASMessageQueue

- (ASMessageQueue)init
{
  return [(ASMessageQueue *)self initWithQueueName:@"DefaultMessageQueue"];
}

- (ASMessageQueue)initWithQueueName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASMessageQueue;
  v5 = [(ASMessageQueue *)&v14 init];
  v6 = v5;
  if (v5)
  {
    v5->_domainName = (__CFString *)*MEMORY[0x263F23CC8];
    v5->_queueName = (__CFString *)[v4 copy];
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    identifierToMessageDictionary = v6->_identifierToMessageDictionary;
    v6->_identifierToMessageDictionary = (NSMutableDictionary *)v7;

    CFPreferencesAppSynchronize(v6->_domainName);
    v9 = (void *)CFPreferencesCopyAppValue(v6->_queueName, v6->_domainName);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __36__ASMessageQueue_initWithQueueName___block_invoke;
      v12[3] = &unk_265216610;
      v13 = v6;
      [v9 enumerateKeysAndObjectsUsingBlock:v12];
    }
    else if (v9)
    {
      ASLoggingInitialize();
      v10 = (void *)*MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
        -[ASMessageQueue initWithQueueName:]((uint64_t)v4, v10);
      }
    }
  }
  return v6;
}

void __36__ASMessageQueue_initWithQueueName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[ASMessage alloc] initWithDictionary:v5];

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKeyedSubscript:v6];
}

- (void)dealloc
{
  CFRelease(self->_queueName);
  v3.receiver = self;
  v3.super_class = (Class)ASMessageQueue;
  [(ASMessageQueue *)&v3 dealloc];
}

- (id)messageWithIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_identifierToMessageDictionary objectForKeyedSubscript:a3];
}

- (void)enumerateQueuedMessagesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NSMutableDictionary *)self->_identifierToMessageDictionary copy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ASMessageQueue_enumerateQueuedMessagesUsingBlock___block_invoke;
  v7[3] = &unk_265216638;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __52__ASMessageQueue_enumerateQueuedMessagesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setMessage:(id)a3 identifier:(id)a4
{
  [(NSMutableDictionary *)self->_identifierToMessageDictionary setObject:a3 forKey:a4];
  [(ASMessageQueue *)self _synchronizePreferences];
}

- (void)removeMessageWithIdentifier:(id)a3
{
  [(NSMutableDictionary *)self->_identifierToMessageDictionary removeObjectForKey:a3];
  [(ASMessageQueue *)self _synchronizePreferences];
}

- (void)_synchronizePreferences
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  identifierToMessageDictionary = self->_identifierToMessageDictionary;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__ASMessageQueue__synchronizePreferences__block_invoke;
  v6[3] = &unk_265216660;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)identifierToMessageDictionary enumerateKeysAndObjectsUsingBlock:v6];
  CFPreferencesSetAppValue(self->_queueName, v5, self->_domainName);
  CFPreferencesAppSynchronize(self->_domainName);
}

void __41__ASMessageQueue__synchronizePreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void).cxx_destruct
{
}

- (void)initWithQueueName:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_error_impl(&dword_2474C9000, v3, OS_LOG_TYPE_ERROR, "Error parsing message queue with name %{public}@, serialized data is not a dictionary (%{public}@)", (uint8_t *)&v5, 0x16u);
}

@end