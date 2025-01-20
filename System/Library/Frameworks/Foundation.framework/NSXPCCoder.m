@interface NSXPCCoder
+ (id)_testEncodeAndDecodeInvocation:(id)a3 interface:(id)a4;
+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClass:(Class)a4;
+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClasses:(id)a4;
- (BOOL)requiresSecureCoding;
- (NSXPCCoder)init;
- (NSXPCConnection)connection;
- (id)decodeXPCObjectForKey:(id)a3;
- (id)userInfo;
- (void)dealloc;
- (void)setUserInfo:(id)userInfo;
- (xpc_object_t)decodeXPCObjectOfType:(xpc_type_t)type forKey:(NSString *)key;
@end

@implementation NSXPCCoder

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSXPCCoder;
  [(NSXPCCoder *)&v3 dealloc];
}

- (NSXPCCoder)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSXPCCoder;
  v2 = [(NSXPCCoder *)&v4 init];
  if (v2 && _initializeClasses_onceToken != -1) {
    dispatch_once(&_initializeClasses_onceToken, &__block_literal_global_86);
  }
  return v2;
}

- (void)setUserInfo:(id)userInfo
{
}

+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClasses:(id)a4
{
  v6 = objc_alloc_init(NSXPCEncoder);
  [(NSXPCEncoder *)v6 beginEncoding];
  [(NSXPCEncoder *)v6 encodeObject:a3 forKey:@"root"];
  uint64_t v7 = [(NSXPCEncoder *)v6 finishEncoding];

  v8 = [[NSXPCDecoder alloc] initWithInterface:0];
  [(NSXPCDecoder *)v8 _startReadingFromXPCObject:v7];
  id v9 = [(NSXPCDecoder *)v8 decodeObjectOfClasses:a4 forKey:@"root"];

  return v9;
}

- (BOOL)requiresSecureCoding
{
  return 1;
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)decodeXPCObjectForKey:(id)a3
{
  return 0;
}

- (xpc_object_t)decodeXPCObjectOfType:(xpc_type_t)type forKey:(NSString *)key
{
  return 0;
}

- (NSXPCConnection)connection
{
  return 0;
}

+ (id)_testEncodeAndDecodeObject:(id)a3 allowedClass:(Class)a4
{
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:a4];

  return (id)[a1 _testEncodeAndDecodeObject:a3 allowedClasses:v6];
}

+ (id)_testEncodeAndDecodeInvocation:(id)a3 interface:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_alloc_init(NSXPCEncoder);
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  [(NSXPCEncoder *)v6 _encodeInvocation:a3 isReply:0 into:v7];

  v8 = [[NSXPCDecoder alloc] initWithInterface:a4];
  v11[0] = 0;
  [(NSXPCDecoder *)v8 _decodeMessageFromXPCObject:v7 allowingSimpleMessageSend:0 outInvocation:v11 outArguments:0 outArgumentsMaxCount:0 outMethodSignature:0 outSelector:0];
  id v9 = v8;
  xpc_release(v7);
  return (id)v11[0];
}

@end