@interface BMParsecSearchEngagementStream
- (BMParsecSearchEngagementStream)init;
- (id)identifier;
@end

@implementation BMParsecSearchEngagementStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"ParsecSearchEngagement"];
}

- (BMParsecSearchEngagementStream)init
{
  v3 = [(BMParsecSearchEngagementStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end