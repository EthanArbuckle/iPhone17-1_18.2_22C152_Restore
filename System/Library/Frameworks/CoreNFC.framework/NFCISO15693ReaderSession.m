@interface NFCISO15693ReaderSession
+ (BOOL)readingAvailable;
- (NFCISO15693ReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7;
- (NFCISO15693ReaderSession)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue;
- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4;
- (void)restartPolling;
@end

@implementation NFCISO15693ReaderSession

- (void)didDetectTags:(id)a3 connectedTagIndex:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NFCISO15693ReaderSession;
  [(NFCReaderSession *)&v35 didDetectTags:v7 connectedTagIndex:a4];
  v8 = [(NFCReaderSession *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [(NFCTag *)[NFCISO15693ReaderSessionTag alloc] initWithSession:self tag:*(void *)(*((void *)&v31 + 1) + 8 * i) startupConfig:1];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __60__NFCISO15693ReaderSession_didDetectTags_connectedTagIndex___block_invoke;
    v29[3] = &unk_2645B4508;
    v29[4] = self;
    id v30 = v10;
    v17 = v10;
    [(NFCReaderSession *)self submitBlockOnDelegateQueue:v29];
  }
  else
  {
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v19 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v23 = 45;
      if (isMetaClass) {
        uint64_t v23 = 43;
      }
      v19(4, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSession:didDetectTags: method", v23, ClassName, Name, 36);
    }
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      v26 = object_getClassName(self);
      v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v38 = v25;
      __int16 v39 = 2082;
      v40 = v26;
      __int16 v41 = 2082;
      v42 = v27;
      __int16 v43 = 1024;
      int v44 = 36;
      _os_log_impl(&dword_2214B8000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Delegate does not implement -readerSession:didDetectTags: method", buf, 0x22u);
    }
  }
}

void __60__NFCISO15693ReaderSession_didDetectTags_connectedTagIndex___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)[*(id *)(a1 + 40) copy];
  [v4 readerSession:v2 didDetectTags:v3];
}

- (NFCISO15693ReaderSession)initWithDelegate:(id)a3 sessionDelegateType:(int64_t)a4 queue:(id)a5 pollMethod:(unint64_t)a6 sessionConfig:(unint64_t)a7
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF940] exceptionWithName:@"Unavailable initializer" reason:@"Not available" userInfo:0];
  objc_exception_throw(v10);
}

- (NFCISO15693ReaderSession)initWithDelegate:(id)delegate queue:(dispatch_queue_t)queue
{
  v5.receiver = self;
  v5.super_class = (Class)NFCISO15693ReaderSession;
  return [(NFCReaderSession *)&v5 initWithDelegate:delegate sessionDelegateType:1 queue:queue pollMethod:4 sessionConfig:32];
}

- (void)restartPolling
{
  v3 = _os_activity_create(&dword_2214B8000, "NFCISO15693ReaderSession restartPolling", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4.receiver = self;
  v4.super_class = (Class)NFCISO15693ReaderSession;
  [(NFCReaderSession *)&v4 restartPolling];
}

+ (BOOL)readingAvailable
{
  return +[NFCReaderSession featureAvailable:8];
}

@end