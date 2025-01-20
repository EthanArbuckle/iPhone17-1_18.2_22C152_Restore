@interface CATSharingSentMessage
+ (id)instanceWithDictionary:(id)a3;
- (CATSharingSentMessage)initWithContent:(id)a3;
- (NSData)content;
- (NSDictionary)dictionaryValue;
- (int64_t)messageType;
@end

@implementation CATSharingSentMessage

- (CATSharingSentMessage)initWithContent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATSharingSentMessage.m", 29, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CATSharingSentMessage;
  v6 = [(CATSharingSentMessage *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    content = v6->_content;
    v6->_content = (NSData *)v7;
  }
  return v6;
}

- (int64_t)messageType
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"SharingSendMessageContent";
  v2 = [(CATSharingSentMessage *)self content];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"SharingSendMessageContent"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithContent:v7];
  }
  else
  {
    if (_CATLogGeneral_onceToken_3 != -1) {
      dispatch_once(&_CATLogGeneral_onceToken_3, &__block_literal_global_5);
    }
    v9 = (void *)_CATLogGeneral_logObj_3;
    if (os_log_type_enabled((os_log_t)_CATLogGeneral_logObj_3, OS_LOG_TYPE_ERROR)) {
      +[CATSharingSentMessage instanceWithDictionary:(uint64_t)v4];
    }
    v8 = 0;
  }

  return v8;
}

- (NSData)content
{
  return self->_content;
}

- (void).cxx_destruct
{
}

+ (void)instanceWithDictionary:(uint64_t)a3 .cold.1(void *a1, objc_class *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a1;
  v6 = NSStringFromClass(a2);
  int v7 = 138543618;
  v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_213B7F000, v5, OS_LOG_TYPE_ERROR, "%{public}@ failed to initialize, data is missing from %{public}@", (uint8_t *)&v7, 0x16u);
}

@end