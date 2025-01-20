@interface BMNotesContentStream
- (BMNotesContentStream)init;
- (id)identifier;
@end

@implementation BMNotesContentStream

- (id)identifier
{
  return (id)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"NotesContent"];
}

- (BMNotesContentStream)init
{
  v3 = [(BMNotesContentStream *)self identifier];
  v4 = [(BMContentStream *)self initWithStreamIdentifier:v3 eventClass:objc_opt_class()];

  return v4;
}

@end