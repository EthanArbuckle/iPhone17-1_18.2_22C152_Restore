@interface IKJSArrayBufferStore
- (IKAppContext)appContext;
- (IKJSArrayBufferStore)initWithAppContext:(id)a3;
- (NSMutableDictionary)bufferStorage;
- (id)arrayBufferForData:(id)a3;
@end

@implementation IKJSArrayBufferStore

- (IKJSArrayBufferStore)initWithAppContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKJSArrayBufferStore;
  v5 = [(IKJSArrayBufferStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    bufferStorage = v5->_bufferStorage;
    v5->_bufferStorage = (NSMutableDictionary *)v6;

    objc_storeWeak((id *)&v5->_appContext, v4);
  }

  return v5;
}

- (id)arrayBufferForData:(id)a3
{
  id v4 = a3;
  v5 = [(IKJSArrayBufferStore *)self appContext];
  uint64_t v6 = [v5 jsContext];

  v7 = (void *)[v4 copy];
  v8 = [MEMORY[0x1E4F29128] UUID];
  objc_super v9 = [v8 UUIDString];

  v10 = [(IKJSArrayBufferStore *)self bufferStorage];
  [v10 setObject:v7 forKey:v9];

  v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  [v11 setObject:self forKey:@"IKJSArrayBufferStoreStoreKey"];
  [v11 setObject:v9 forKey:@"IKJSArrayBufferStoreStoredDataKey"];
  id v12 = v11;
  v13 = (const OpaqueJSContext *)[v6 JSGlobalContextRef];
  id v14 = v7;
  v15 = objc_msgSend(MEMORY[0x1E4F30938], "valueWithJSValueRef:inContext:", JSObjectMakeArrayBufferWithBytesNoCopy(v13, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), (JSTypedArrayBytesDeallocator)IKJSArrayBufferStoreDeallocator, v12, 0), v6);

  return v15;
}

- (NSMutableDictionary)bufferStorage
{
  return self->_bufferStorage;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_bufferStorage, 0);
}

@end