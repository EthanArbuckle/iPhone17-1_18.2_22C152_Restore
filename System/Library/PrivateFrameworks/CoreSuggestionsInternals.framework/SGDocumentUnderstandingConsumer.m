@interface SGDocumentUnderstandingConsumer
+ (id)sharedInstance;
- (SGDocumentUnderstandingConsumer)init;
- (id)consumeMailContentWithContext:(id)a3;
- (id)consumeMessagesContentWithContext:(id)a3;
- (id)consumeNotesContentWithContext:(id)a3;
- (id)consumeRemindersContentWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
@end

@implementation SGDocumentUnderstandingConsumer

- (void).cxx_destruct
{
}

- (id)consumeRemindersContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeRemindersContentWithContext", buf, 2u);
  }

  v6 = [v4 content];
  *(void *)buf = [v6 encodeAsProto];
  if (!*(void *)buf)
  {
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }
  }
  SEL v8 = NSSelectorFromString((NSString *)@"addSerializedDocument:documentType:");
  if (objc_opt_respondsToSelector())
  {
    v9 = (void *)MEMORY[0x1CB79B230]();
    v10 = [(DUDocumentHarvesting *)self->_duReceiver methodSignatureForSelector:v8];
    v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setSelector:v8];
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 3);
    [v11 setArgument:v14 atIndex:3];
    [v11 invokeWithTarget:self->_duReceiver];
  }
  v12 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v12;
}

- (id)consumeNotesContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeNotesContentWithContext", buf, 2u);
  }

  v6 = [v4 content];
  *(void *)buf = [v6 encodeAsProto];
  if (!*(void *)buf)
  {
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }
  }
  SEL v8 = NSSelectorFromString((NSString *)@"addSerializedDocument:documentType:");
  if (objc_opt_respondsToSelector())
  {
    v9 = (void *)MEMORY[0x1CB79B230]();
    v10 = [(DUDocumentHarvesting *)self->_duReceiver methodSignatureForSelector:v8];
    v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setSelector:v8];
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 2);
    [v11 setArgument:v14 atIndex:3];
    [v11 invokeWithTarget:self->_duReceiver];
  }
  v12 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v12;
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeMessagesContentWithContext", buf, 2u);
  }

  v6 = [v4 content];
  *(void *)buf = [v6 encodeAsProto];
  if (!*(void *)buf)
  {
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }
  }
  SEL v8 = NSSelectorFromString((NSString *)@"addSerializedDocument:documentType:");
  if (objc_opt_respondsToSelector())
  {
    v9 = (void *)MEMORY[0x1CB79B230]();
    v10 = [(DUDocumentHarvesting *)self->_duReceiver methodSignatureForSelector:v8];
    v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setSelector:v8];
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 1);
    [v11 setArgument:v14 atIndex:3];
    [v11 invokeWithTarget:self->_duReceiver];
  }
  v12 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v12;
}

- (id)consumeMailContentWithContext:(id)a3
{
  id v4 = a3;
  v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDocumentUnderstandingConsumer: consumeMailContentWithContext", buf, 2u);
  }

  v6 = [v4 content];
  *(void *)buf = [v6 encodeAsProto];
  if (!*(void *)buf)
  {
    v7 = sgLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "Error encoding message as protobuf", v14, 2u);
    }
  }
  SEL v8 = NSSelectorFromString((NSString *)@"addSerializedDocument:documentType:");
  if (objc_opt_respondsToSelector())
  {
    v9 = (void *)MEMORY[0x1CB79B230]();
    v10 = [(DUDocumentHarvesting *)self->_duReceiver methodSignatureForSelector:v8];
    v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
    [v11 setSelector:v8];
    objc_msgSend(v11, "setArgument:atIndex:", buf, 2, 0);
    [v11 setArgument:v14 atIndex:3];
    [v11 invokeWithTarget:self->_duReceiver];
  }
  v12 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];

  return v12;
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  return (id)[MEMORY[0x1E4F93758] successWithNumberOfExtractions:0];
}

- (id)consumerName
{
  return @"com.apple.CoreSuggestionsInternals.SGDocumentUnderstandingConsumer";
}

- (SGDocumentUnderstandingConsumer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SGDocumentUnderstandingConsumer;
  v2 = [(SGDocumentUnderstandingConsumer *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    duReceiver = v2->_duReceiver;
    v2->_duReceiver = (DUDocumentHarvesting *)v3;

    v5 = [MEMORY[0x1E4F93750] defaultCoordinator];
    [v5 registerMailConsumer:v2 levelOfService:2];
    [v5 registerMessagesConsumer:v2 levelOfService:2];
    [v5 registerNotesConsumer:v2 levelOfService:2];
    [v5 registerRemindersConsumer:v2 levelOfService:2];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_13255 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_13255, &__block_literal_global_13256);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_13257;
  return v2;
}

void __49__SGDocumentUnderstandingConsumer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_13257;
  sharedInstance__pasExprOnceResult_13257 = v1;
}

@end