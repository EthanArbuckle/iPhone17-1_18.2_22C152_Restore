@interface BMSafariPageViewStream
- (BMSafariPageViewStream)init;
- (id)identifier;
@end

@implementation BMSafariPageViewStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"SafariPageView"];
}

- (BMSafariPageViewStream)init
{
  v3 = [(BMSafariPageViewStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end