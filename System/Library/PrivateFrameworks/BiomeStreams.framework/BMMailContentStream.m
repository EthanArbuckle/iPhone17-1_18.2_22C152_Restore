@interface BMMailContentStream
- (BMMailContentStream)init;
- (id)identifier;
@end

@implementation BMMailContentStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"MailContent"];
}

- (BMMailContentStream)init
{
  v3 = [(BMMailContentStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end