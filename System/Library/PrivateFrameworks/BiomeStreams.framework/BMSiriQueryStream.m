@interface BMSiriQueryStream
- (BMSiriQueryStream)init;
- (id)identifier;
@end

@implementation BMSiriQueryStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"SiriQuery"];
}

- (BMSiriQueryStream)init
{
  v3 = [(BMSiriQueryStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end