@interface CNGeminiResult
+ (BOOL)supportsSecureCoding;
- (CNGeminiChannel)channel;
- (CNGeminiResult)init;
- (CNGeminiResult)initWithChannel:(id)a3 usage:(int64_t)a4 availableChannels:(id)a5;
- (CNGeminiResult)initWithCoder:(id)a3;
- (NSArray)availableChannels;
- (int64_t)usage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNGeminiResult

- (CNGeminiResult)initWithChannel:(id)a3 usage:(int64_t)a4 availableChannels:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNGeminiResult;
  v11 = [(CNGeminiResult *)&v17 init];
  if (v11)
  {
    if (!v9)
    {
      if (CNGuardOSLog_cn_once_token_0_0 != -1) {
        dispatch_once(&CNGuardOSLog_cn_once_token_0_0, &__block_literal_global_358);
      }
      v12 = CNGuardOSLog_cn_once_object_0_0;
      if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_0, OS_LOG_TYPE_FAULT)) {
        -[CNGeminiResult initWithChannel:usage:availableChannels:](v12);
      }
    }
    objc_storeStrong((id *)&v11->_channel, a3);
    v11->_usage = a4;
    uint64_t v13 = [v10 copy];
    availableChannels = v11->_availableChannels;
    v11->_availableChannels = (NSArray *)v13;

    v15 = v11;
  }

  return v11;
}

- (CNGeminiResult)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGeminiResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNGeminiResult;
  v5 = [(CNGeminiResult *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_channel"];
    channel = v5->_channel;
    v5->_channel = (CNGeminiChannel *)v6;

    v5->_usage = [v4 decodeIntegerForKey:@"_usage"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_availableChannels"];
    uint64_t v12 = [v11 copy];
    availableChannels = v5->_availableChannels;
    v5->_availableChannels = (NSArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  channel = self->_channel;
  id v5 = a3;
  [v5 encodeObject:channel forKey:@"_channel"];
  [v5 encodeInteger:self->_usage forKey:@"_usage"];
  [v5 encodeObject:self->_availableChannels forKey:@"_availableChannels"];
}

- (CNGeminiChannel)channel
{
  return self->_channel;
}

- (int64_t)usage
{
  return self->_usage;
}

- (NSArray)availableChannels
{
  return self->_availableChannels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableChannels, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)initWithChannel:(os_log_t)log usage:availableChannels:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1909E3000, log, OS_LOG_TYPE_FAULT, "parameter ‘channel’ must be nonnull", v1, 2u);
}

@end