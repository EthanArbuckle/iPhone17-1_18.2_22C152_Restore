@interface AFConversationError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
- (AFConversationError)initWithCode:(int64_t)a3;
- (AFConversationError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4;
- (AFConversationError)initWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation AFConversationError

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 userInfo:0];
}

+ (id)errorWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithCode:a3 localizedFailureReason:v6];

  return v7;
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithCode:a3 userInfo:v6];

  return v7;
}

- (AFConversationError)initWithCode:(int64_t)a3
{
  return [(AFConversationError *)self initWithCode:a3 userInfo:0];
}

- (AFConversationError)initWithCode:(int64_t)a3 localizedFailureReason:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F28588];
  v12[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [(AFConversationError *)self initWithCode:a3 userInfo:v8];
  return v9;
}

- (AFConversationError)initWithCode:(int64_t)a3 userInfo:(id)a4
{
  return [(AFConversationError *)self initWithDomain:@"com.apple.assistant.conversation.ErrorDomain" code:a3 userInfo:a4];
}

@end