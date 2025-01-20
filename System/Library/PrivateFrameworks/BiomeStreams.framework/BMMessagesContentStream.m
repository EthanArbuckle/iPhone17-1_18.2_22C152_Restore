@interface BMMessagesContentStream
- (BMMessagesContentStream)init;
- (id)identifier;
@end

@implementation BMMessagesContentStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"MessagesContent"];
}

- (BMMessagesContentStream)init
{
  v3 = [(BMMessagesContentStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end