@interface BMThirdPartyAppContentStream
- (BMThirdPartyAppContentStream)init;
- (id)identifier;
@end

@implementation BMThirdPartyAppContentStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"ThirdPartyAppContent"];
}

- (BMThirdPartyAppContentStream)init
{
  v3 = [(BMThirdPartyAppContentStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end