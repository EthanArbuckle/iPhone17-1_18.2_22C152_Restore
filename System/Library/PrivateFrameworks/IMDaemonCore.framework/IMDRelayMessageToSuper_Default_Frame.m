@interface IMDRelayMessageToSuper_Default_Frame
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation IMDRelayMessageToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F28B88];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 newlineCharacterSet];
  v13 = [v9 stringByRemovingCharactersFromSet:v12];

  v14.receiver = self;
  v14.super_class = (Class)IMDRelayMessageToSuper_Default_Frame;
  [(IMToSuperParserFrame *)&v14 parser:v11 context:v10 foundCharacters:v13];
}

@end