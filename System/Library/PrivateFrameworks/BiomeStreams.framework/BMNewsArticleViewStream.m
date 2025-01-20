@interface BMNewsArticleViewStream
- (BMNewsArticleViewStream)init;
- (id)identifier;
@end

@implementation BMNewsArticleViewStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"NewsArticleView"];
}

- (BMNewsArticleViewStream)init
{
  v3 = [(BMNewsArticleViewStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end