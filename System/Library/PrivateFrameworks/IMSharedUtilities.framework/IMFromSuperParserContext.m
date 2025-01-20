@interface IMFromSuperParserContext
- (BOOL)foundBreadcrumbText;
- (IMFromSuperParserContext)initWithAttributedString:(id)a3;
- (NSArray)inlinedFileTransferGUIDs;
- (NSArray)standaloneFileTransferGUIDs;
- (id)name;
- (id)resultsForLogging;
- (void)dealloc;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10;
- (void)parserDidStart:(id)a3;
@end

@implementation IMFromSuperParserContext

- (IMFromSuperParserContext)initWithAttributedString:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMFromSuperParserContext;
  v3 = [(IMAttributedStringParserContext *)&v5 initWithAttributedString:a3];
  if (v3)
  {
    v3->_inlinedFileTransferGUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_standaloneFileTransferGUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_foundBreadcrumbText = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMFromSuperParserContext;
  [(IMAttributedStringParserContext *)&v3 dealloc];
}

- (id)name
{
  return @"IMFromSuper";
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"inlinedFileTransferGUIDs", @"standaloneFileTransferGUIDs", 0);
}

- (void)parserDidStart:(id)a3
{
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  objc_super v5 = [(IMAttributedStringParserContext *)self inString];
  if ([(NSAttributedString *)v5 length])
  {
    uint64_t v6 = *MEMORY[0x1E4F6C1E8];
    uint64_t v7 = [(NSAttributedString *)v5 attribute:*MEMORY[0x1E4F6C1E8] atIndex:0 effectiveRange:0];
    uint64_t v8 = *MEMORY[0x1E4F6C1F0];
    uint64_t v9 = [(NSAttributedString *)v5 attribute:*MEMORY[0x1E4F6C1F0] atIndex:0 effectiveRange:0];
    uint64_t v10 = *MEMORY[0x1E4F6C120];
    uint64_t v11 = [(NSAttributedString *)v5 attribute:*MEMORY[0x1E4F6C120] atIndex:0 effectiveRange:0];
    if (v7) {
      [v12 setObject:v7 forKey:v6];
    }
    if (v9) {
      [v12 setObject:v9 forKey:v8];
    }
    if (v11) {
      [v12 setObject:v11 forKey:v10];
    }
  }
  [(IMFromSuperParserContext *)self parserDidStart:a3 bodyAttributes:v12];
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5
{
  if (a5.length)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    uint64_t v10 = [(IMAttributedStringParserContext *)self inString];
    int v11 = [(NSString *)[(NSAttributedString *)v10 string] characterAtIndex:location];
    uint64_t v12 = [a4 objectForKey:*MEMORY[0x1E4F6C188]];
    uint64_t v13 = v12;
    if (v11 == 65532 || v12)
    {
      uint64_t v20 = [a4 objectForKey:*MEMORY[0x1E4F6C190]];
      uint64_t v14 = [a4 objectForKey:*MEMORY[0x1E4F6C180]];
      uint64_t v15 = [a4 objectForKey:*MEMORY[0x1E4F6C1C0]];
      uint64_t v16 = [a4 objectForKey:*MEMORY[0x1E4F6C1B8]];
      uint64_t v17 = [a4 objectForKey:*MEMORY[0x1E4F6C108]];
      if (v13)
      {
        if (v16) {
          BOOL v18 = v15 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        v19 = &OBJC_IVAR___IMFromSuperParserContext__standaloneFileTransferGUIDs;
        if (!v18) {
          v19 = &OBJC_IVAR___IMFromSuperParserContext__inlinedFileTransferGUIDs;
        }
        [*(id *)((char *)&self->super.super.isa + *v19) addObject:v13];
      }
      -[IMFromSuperParserContext parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:](self, "parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:", a3, a4, location, length, v13, v20, v14, v15, v16, v17);
    }
    else if (v11 == 65533)
    {
      if (!self->_foundBreadcrumbText && [a4 objectForKey:*MEMORY[0x1E4F6C138]])
      {
        self->_foundBreadcrumbText = 1;
        objc_msgSend((id)objc_msgSend(a4, "_numberForKey:", *MEMORY[0x1E4F6C140]), "intValue");
        MEMORY[0x1F4181798](self, sel_parser_foundBreadcrumbText_withOptions_);
      }
    }
    else
    {
      -[NSString substringWithRange:]([(NSAttributedString *)v10 string], "substringWithRange:", location, length);
      MEMORY[0x1F4181798](self, sel_parser_foundAttributes_inRange_characters_);
    }
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10
{
}

- (NSArray)inlinedFileTransferGUIDs
{
  return &self->_inlinedFileTransferGUIDs->super;
}

- (NSArray)standaloneFileTransferGUIDs
{
  return &self->_standaloneFileTransferGUIDs->super;
}

- (BOOL)foundBreadcrumbText
{
  return self->_foundBreadcrumbText;
}

@end