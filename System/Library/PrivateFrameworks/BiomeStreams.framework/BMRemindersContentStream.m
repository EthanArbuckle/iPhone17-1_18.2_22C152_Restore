@interface BMRemindersContentStream
- (BMRemindersContentStream)init;
- (id)identifier;
@end

@implementation BMRemindersContentStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"RemindersContent"];
}

- (BMRemindersContentStream)init
{
  v3 = [(BMRemindersContentStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end