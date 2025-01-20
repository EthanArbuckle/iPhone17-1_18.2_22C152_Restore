@interface HTMLToSuper_Default_Frame
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation HTMLToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)HTMLToSuper_Default_Frame;
  -[IMToSuperParserFrame parser:context:foundCharacters:](&v5, sel_parser_context_foundCharacters_, a3, a4, objc_msgSend(a5, "stringByRemovingCharactersFromSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet")));
}

@end