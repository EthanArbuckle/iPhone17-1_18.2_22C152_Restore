@interface CPLInfoFeedbackMessage
+ (id)feedbackType;
- (CPLInfoFeedbackMessage)initWithInfo:(id)a3 libraryIdentifier:(id)a4;
- (NSDictionary)info;
- (id)serverMessage;
@end

@implementation CPLInfoFeedbackMessage

- (void).cxx_destruct
{
}

- (NSDictionary)info
{
  return self->_info;
}

- (id)serverMessage
{
  v9.receiver = self;
  v9.super_class = (Class)CPLInfoFeedbackMessage;
  v3 = [(CPLFeedbackMessage *)&v9 serverMessage];
  info = self->_info;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CPLInfoFeedbackMessage_serverMessage__block_invoke;
  v7[3] = &unk_1E60A74F0;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)info enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __39__CPLInfoFeedbackMessage_serverMessage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  [(CPLServerFeedbackKeyAndValue *)v7 setKey:v6];

  [(CPLServerFeedbackKeyAndValue *)v7 setValue:v5];
  [*(id *)(a1 + 32) addKeysAndValues:v7];
}

- (CPLInfoFeedbackMessage)initWithInfo:(id)a3 libraryIdentifier:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLInfoFeedbackMessage;
  v7 = [(CPLFeedbackMessage *)&v11 initWithLibraryIdentifier:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    info = v7->_info;
    v7->_info = (NSDictionary *)v8;
  }
  return v7;
}

+ (id)feedbackType
{
  return @"info";
}

@end