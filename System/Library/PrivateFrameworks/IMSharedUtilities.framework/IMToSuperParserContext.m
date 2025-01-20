@interface IMToSuperParserContext
- (NSArray)fileTransferGUIDs;
- (NSAttributedString)body;
- (NSString)backgroundColor;
- (NSString)foregroundColor;
- (id)name;
- (id)resultsForLogging;
- (int64_t)baseWritingDirection;
- (void)_clearIvars;
- (void)_incrementMessagePartNumber;
- (void)_initIvars;
- (void)_popValueFromStack:(id)a3 attributeName:(id)a4;
- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5;
- (void)_updateFontFamily;
- (void)_updateFontSize;
- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4;
- (void)appendChipList:(id)a3;
- (void)appendFileTransferWithGUID:(id)a3;
- (void)appendInlineImageWithGUID:(id)a3 filename:(id)a4 width:(int64_t)a5 height:(int64_t)a6;
- (void)appendInlineImageWithGUID:(id)a3 filename:(id)a4 width:(int64_t)a5 height:(int64_t)a6 isAnimoji:(int64_t)a7 isAdaptiveImageGlyph:(BOOL)a8;
- (void)appendRichCards:(id)a3 transferGuids:(id)a4;
- (void)appendString:(id)a3;
- (void)dealloc;
- (void)decrementBoldCount;
- (void)decrementItalicCount;
- (void)decrementStrikethroughCount;
- (void)decrementUnderlineCount;
- (void)incrementBoldCount;
- (void)incrementItalicCount;
- (void)incrementStrikethroughCount;
- (void)incrementUnderlineCount;
- (void)popBackgroundColor;
- (void)popFontFamily;
- (void)popFontSize;
- (void)popForegroundColor;
- (void)popLink;
- (void)pushBackgroundColor:(id)a3;
- (void)pushFontFamily:(id)a3;
- (void)pushFontSize:(id)a3;
- (void)pushForegroundColor:(id)a3;
- (void)pushLink:(id)a3;
- (void)reset;
- (void)setBackgroundColor:(id)a3;
- (void)setBaseWritingDirection:(int64_t)a3;
- (void)setFileTransferGUIDs:(id)a3;
- (void)setForegroundColor:(id)a3;
@end

@implementation IMToSuperParserContext

- (void)dealloc
{
  [(IMToSuperParserContext *)self _clearIvars];
  v3.receiver = self;
  v3.super_class = (Class)IMToSuperParserContext;
  [(IMXMLParserContext *)&v3 dealloc];
}

- (void)reset
{
  [(IMToSuperParserContext *)self _clearIvars];
  [(IMToSuperParserContext *)self _initIvars];
  v3.receiver = self;
  v3.super_class = (Class)IMToSuperParserContext;
  [(IMXMLParserContext *)&v3 reset];
}

- (id)name
{
  return @"IMToSuperParser";
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"backgroundColor", @"foregroundColor", @"body", @"fileTransferGUIDs", 0);
}

- (void)_initIvars
{
  self->_underlineCount = 0;
  self->_boldCount = 0;
  self->_italicCount = 0;
  self->_strikethroughCount = 0;
  self->_messagePartNumber = 0;
  self->_fontFamilyStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_fontSizeStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_linkStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  self->_currentAttributes = v3;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_messagePartNumber];
  [(NSMutableDictionary *)v3 setObject:v4 forKey:*MEMORY[0x1E4F6C1F8]];
  self->_backgroundColor = 0;
  self->_foregroundColor = 0;
  self->_body = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E4F28E48]);
  self->_fileTransferGUIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_baseWritingDirection = -1;
}

- (void)_clearIvars
{
  fileTransferGUIDs = self->_fileTransferGUIDs;
}

- (void)_updateFontFamily
{
  objc_super v3 = (void *)[(NSMutableArray *)self->_fontFamilyStack lastObject];
  uint64_t v4 = [v3 length];
  currentAttributes = self->_currentAttributes;
  uint64_t v6 = *MEMORY[0x1E4F6C198];
  if (v4)
  {
    [(NSMutableDictionary *)currentAttributes setObject:v3 forKey:v6];
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F6C198];
    -[NSMutableDictionary removeObjectForKey:](currentAttributes, "removeObjectForKey:", v7, v6);
  }
}

- (void)_updateFontSize
{
  objc_super v3 = (void *)[(NSMutableArray *)self->_fontSizeStack lastObject];
  uint64_t v4 = [v3 integerValue];
  currentAttributes = self->_currentAttributes;
  uint64_t v6 = *MEMORY[0x1E4F6C1A0];
  if (v4 < 1)
  {
    uint64_t v7 = *MEMORY[0x1E4F6C1A0];
    -[NSMutableDictionary removeObjectForKey:](currentAttributes, "removeObjectForKey:", v7, v6);
  }
  else
  {
    [(NSMutableDictionary *)currentAttributes setObject:v3 forKey:v6];
  }
}

- (void)incrementBoldCount
{
  unint64_t boldCount = self->_boldCount;
  self->_unint64_t boldCount = boldCount + 1;
  if (!boldCount) {
    [(NSMutableDictionary *)self->_currentAttributes setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6C128]];
  }
}

- (void)decrementBoldCount
{
  unint64_t boldCount = self->_boldCount;
  if (boldCount)
  {
    unint64_t v3 = boldCount - 1;
    self->_unint64_t boldCount = v3;
    if (!v3) {
      [(NSMutableDictionary *)self->_currentAttributes removeObjectForKey:*MEMORY[0x1E4F6C128]];
    }
  }
}

- (void)incrementItalicCount
{
  unint64_t italicCount = self->_italicCount;
  self->_unint64_t italicCount = italicCount + 1;
  if (!italicCount) {
    [(NSMutableDictionary *)self->_currentAttributes setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6C1C8]];
  }
}

- (void)decrementItalicCount
{
  unint64_t italicCount = self->_italicCount;
  if (italicCount)
  {
    unint64_t v3 = italicCount - 1;
    self->_unint64_t italicCount = v3;
    if (!v3) {
      [(NSMutableDictionary *)self->_currentAttributes removeObjectForKey:*MEMORY[0x1E4F6C1C8]];
    }
  }
}

- (void)incrementUnderlineCount
{
  unint64_t underlineCount = self->_underlineCount;
  self->_unint64_t underlineCount = underlineCount + 1;
  if (!underlineCount) {
    [(NSMutableDictionary *)self->_currentAttributes setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6C2B0]];
  }
}

- (void)decrementUnderlineCount
{
  unint64_t underlineCount = self->_underlineCount;
  if (underlineCount)
  {
    unint64_t v3 = underlineCount - 1;
    self->_unint64_t underlineCount = v3;
    if (!v3) {
      [(NSMutableDictionary *)self->_currentAttributes removeObjectForKey:*MEMORY[0x1E4F6C2B0]];
    }
  }
}

- (void)incrementStrikethroughCount
{
  unint64_t strikethroughCount = self->_strikethroughCount;
  self->_unint64_t strikethroughCount = strikethroughCount + 1;
  if (!strikethroughCount) {
    [(NSMutableDictionary *)self->_currentAttributes setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F6C2A8]];
  }
}

- (void)decrementStrikethroughCount
{
  unint64_t strikethroughCount = self->_strikethroughCount;
  if (strikethroughCount)
  {
    unint64_t v3 = strikethroughCount - 1;
    self->_unint64_t strikethroughCount = v3;
    if (!v3) {
      [(NSMutableDictionary *)self->_currentAttributes removeObjectForKey:*MEMORY[0x1E4F6C2A8]];
    }
  }
}

- (void)_pushValue:(id)a3 ontoStack:(id)a4 attributeName:(id)a5
{
  if (a3)
  {
    objc_msgSend(a4, "addObject:");
    currentAttributes = self->_currentAttributes;
    [(NSMutableDictionary *)currentAttributes setObject:a3 forKey:a5];
  }
}

- (void)_popValueFromStack:(id)a3 attributeName:(id)a4
{
  [a3 removeLastObject];
  uint64_t v7 = [a3 lastObject];
  currentAttributes = self->_currentAttributes;
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](currentAttributes, "setObject:forKey:");
  }
  else
  {
    [(NSMutableDictionary *)currentAttributes removeObjectForKey:a4];
  }
}

- (void)pushFontFamily:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_fontFamilyStack, "addObject:");
    MEMORY[0x1F4181798](self, sel__updateFontFamily);
  }
}

- (void)popFontFamily
{
  [(NSMutableArray *)self->_fontFamilyStack removeLastObject];

  MEMORY[0x1F4181798](self, sel__updateFontFamily);
}

- (void)pushFontSize:(id)a3
{
  if (a3)
  {
    -[NSMutableArray addObject:](self->_fontSizeStack, "addObject:");
    MEMORY[0x1F4181798](self, sel__updateFontSize);
  }
}

- (void)popFontSize
{
  [(NSMutableArray *)self->_fontSizeStack removeLastObject];

  MEMORY[0x1F4181798](self, sel__updateFontSize);
}

- (void)pushLink:(id)a3
{
}

- (void)popLink
{
}

- (void)pushBackgroundColor:(id)a3
{
}

- (void)popBackgroundColor
{
}

- (void)pushForegroundColor:(id)a3
{
}

- (void)popForegroundColor
{
}

- (void)_incrementMessagePartNumber
{
  ++self->_messagePartNumber;
  currentAttributes = self->_currentAttributes;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v4 = *MEMORY[0x1E4F6C1F8];

  [(NSMutableDictionary *)currentAttributes setObject:v3 forKey:v4];
}

- (void)appendString:(id)a3
{
  if ([a3 length])
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3 attributes:self->_currentAttributes];
    [(NSMutableAttributedString *)self->_body appendAttributedString:v5];
  }
}

- (void)appendFileTransferWithGUID:(id)a3
{
}

- (void)appendInlineImageWithGUID:(id)a3 filename:(id)a4 width:(int64_t)a5 height:(int64_t)a6
{
}

- (void)appendInlineImageWithGUID:(id)a3 filename:(id)a4 width:(int64_t)a5 height:(int64_t)a6 isAnimoji:(int64_t)a7 isAdaptiveImageGlyph:(BOOL)a8
{
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
  if (!a8) {
    [(IMToSuperParserContext *)self _incrementMessagePartNumber];
  }
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:self->_messagePartNumber];
  [v15 setObject:v16 forKey:*MEMORY[0x1E4F6C1F8]];
  [v15 setObject:a3 forKey:*MEMORY[0x1E4F6C188]];
  if (a4 && a5 >= 1 && a6 >= 1)
  {
    v17 = (void *)[objc_alloc(NSNumber) initWithInteger:a5];
    v18 = (void *)[objc_alloc(NSNumber) initWithInteger:a6];
    [v15 setObject:v17 forKey:*MEMORY[0x1E4F6C1C0]];
    [v15 setObject:v18 forKey:*MEMORY[0x1E4F6C1B8]];
    [v15 setObject:a4 forKey:*MEMORY[0x1E4F6C190]];
  }
  if (a7 >= 1)
  {
    v19 = (void *)[objc_alloc(NSNumber) initWithInteger:a7];
    [v15 setObject:v19 forKey:*MEMORY[0x1E4F6C108]];
  }
  __int16 v22 = -4;
  v20 = (void *)[[NSString alloc] initWithCharacters:&v22 length:1];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v20 attributes:v15];
  [(NSMutableAttributedString *)self->_body appendAttributedString:v21];
  [(NSMutableArray *)self->_fileTransferGUIDs addObject:a3];
  if (!a8) {
    [(IMToSuperParserContext *)self _incrementMessagePartNumber];
  }
}

- (void)appendBreadcrumbText:(id)a3 withOptions:(unsigned int)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F6C140];
  v9[0] = *MEMORY[0x1E4F6C138];
  v9[1] = v5;
  v10[0] = a3;
  v10[1] = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  v8 = (void *)[v7 initWithString:*MEMORY[0x1E4F6C130] attributes:v6];
  [(NSMutableAttributedString *)self->_body appendAttributedString:v8];
}

- (void)appendRichCards:(id)a3 transferGuids:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\uFFFE" attributes:a3];
    [(NSMutableAttributedString *)self->_body appendAttributedString:v6];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v7 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(a4);
          }
          [(NSMutableArray *)self->_fileTransferGUIDs addObject:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [a4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)appendChipList:(id)a3
{
  if (a3)
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\uFFFF" attributes:a3];
    [(NSMutableAttributedString *)self->_body appendAttributedString:v4];
  }
}

- (NSAttributedString)body
{
  uint64_t v3 = [(NSMutableAttributedString *)self->_body length];
  if (!self->_didAddBodyAttributes && v3 != 0)
  {
    uint64_t v5 = v3;
    backgroundColor = self->_backgroundColor;
    if (backgroundColor) {
      -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", *MEMORY[0x1E4F6C1E8], backgroundColor, 0, v3);
    }
    foregroundColor = self->_foregroundColor;
    if (foregroundColor) {
      -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", *MEMORY[0x1E4F6C1F0], foregroundColor, 0, v5);
    }
    uint64_t v8 = (void *)[objc_alloc(NSNumber) initWithInteger:self->_baseWritingDirection];
    -[NSMutableAttributedString addAttribute:value:range:](self->_body, "addAttribute:value:range:", *MEMORY[0x1E4F6C120], v8, 0, v5);

    self->_didAddBodyAttributes = 1;
  }
  return &self->_body->super;
}

- (NSArray)fileTransferGUIDs
{
  return &self->_fileTransferGUIDs->super;
}

- (void)setFileTransferGUIDs:(id)a3
{
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (int64_t)baseWritingDirection
{
  return self->_baseWritingDirection;
}

- (void)setBaseWritingDirection:(int64_t)a3
{
  self->_baseWritingDirection = a3;
}

@end