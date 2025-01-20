@interface IMSuperToSuperSanitizerContext
- (IMSuperToSuperSanitizerContext)initWithAttributedString:(id)a3 extractAttachments:(BOOL)a4;
- (NSArray)attachments;
- (NSAttributedString)sanitizedContent;
- (id)name;
- (id)resultsForLogging;
- (void)dealloc;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11;
- (void)parserDidEnd:(id)a3;
- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4;
@end

@implementation IMSuperToSuperSanitizerContext

- (IMSuperToSuperSanitizerContext)initWithAttributedString:(id)a3 extractAttachments:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)IMSuperToSuperSanitizerContext;
  v5 = [(IMFromSuperParserContext *)&v8 initWithAttributedString:a3];
  if (v5)
  {
    if (v4) {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      v6 = 0;
    }
    v5->_attachments = v6;
    v5->_extractAttachments = v4;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMSuperToSuperSanitizerContext;
  [(IMFromSuperParserContext *)&v3 dealloc];
}

- (id)name
{
  return @"SuperToSuperSanitizer";
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"sanitizedContent", 0);
}

- (void)parserDidStart:(id)a3 bodyAttributes:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)IMSuperToSuperSanitizerContext;
  self->_content = (NSMutableAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E48]), "initWithString:", -[NSAttributedString string](-[IMAttributedStringParserContext inString](&v12, sel_inString), "string"));
  self->_offset = 0;
  v6 = (void *)[a4 objectForKey:*MEMORY[0x1E4F6C1E8]];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v8 = 0;
  if (isKindOfClass) {
    objc_super v8 = v6;
  }
  self->_backgroundColor = v8;
  v9 = (void *)[a4 objectForKey:*MEMORY[0x1E4F6C1F0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  self->_foregroundColor = v10;
  v11 = (void *)[a4 objectForKey:*MEMORY[0x1E4F6C120]];
  self->_hadBaseWritingDirectionAttribute = v11 != 0;
  self->_baseWritingDirection = [v11 integerValue];
}

- (void)parserDidEnd:(id)a3
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    -[NSMutableAttributedString addAttribute:value:range:](self->_content, "addAttribute:value:range:", *MEMORY[0x1E4F6C1E8], backgroundColor, 0, [(NSMutableAttributedString *)self->_content length]);
  }
  if (self->_hadBaseWritingDirectionAttribute)
  {
    content = self->_content;
    uint64_t v6 = *MEMORY[0x1E4F6C120];
    uint64_t v7 = [NSNumber numberWithInteger:self->_baseWritingDirection];
    uint64_t v8 = [(NSMutableAttributedString *)self->_content length];
    -[NSMutableAttributedString addAttribute:value:range:](content, "addAttribute:value:range:", v6, v7, 0, v8);
  }
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_super v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v18 = sub_1A083D950;
  v19 = &unk_1E5A13688;
  id v20 = a4;
  id v21 = v12;
  uint64_t v13 = *MEMORY[0x1E4F6C198];
  uint64_t v14 = [a4 objectForKey:*MEMORY[0x1E4F6C198]];
  if (objc_opt_isKindOfClass()) {
    [v21 setObject:v14 forKey:v13];
  }
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C1A0], v10);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C1C8], v10);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C128], v10);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C2B0], v10);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C2A8], v10);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C1D0], v11);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C258], v10);
  uint64_t v15 = *MEMORY[0x1E4F6C1A8];
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C1A8], v9);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C118], v9);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C1E8], v9);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C120], v10);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C138], v9);
  ((void (*)(void *, void, uint64_t))v18)(v17, *MEMORY[0x1E4F6C140], v10);
  if (![a4 objectForKey:v15] && -[NSString length](self->_foregroundColor, "length")) {
    [v12 setObject:self->_foregroundColor forKey:v15];
  }
  -[NSMutableAttributedString setAttributes:range:](self->_content, "setAttributes:range:", v12, location - self->_offset, length);
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 fileTransferGUID:(id)a6 filename:(id)a7 bookmark:(id)a8 width:(id)a9 height:(id)a10 isAnimoji:(id)a11
{
  if (self->_extractAttachments)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    [(NSMutableArray *)self->_attachments addObject:a4];
    if (location < [(NSMutableAttributedString *)self->_content length]) {
      -[NSMutableAttributedString deleteCharactersInRange:](self->_content, "deleteCharactersInRange:", location, length);
    }
    uint64_t v14 = [(NSMutableAttributedString *)self->_content length];
    unint64_t v15 = self->_offset + length;
    if (v14 - 1 < v15) {
      unint64_t v15 = v14 - 1;
    }
    self->_offset = v15;
  }
}

- (NSAttributedString)sanitizedContent
{
  return (NSAttributedString *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

@end