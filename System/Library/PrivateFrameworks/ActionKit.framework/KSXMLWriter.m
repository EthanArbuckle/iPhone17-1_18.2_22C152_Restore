@interface KSXMLWriter
+ (id)stringFromAttributeValue:(id)a3;
+ (id)stringFromCharacters:(id)a3;
+ (void)initialize;
- (BOOL)canWriteElementInline:(id)a3;
- (BOOL)elementCanBeEmpty:(id)a3;
- (BOOL)hasCurrentAttributes;
- (BOOL)hasOpenElement:(id)a3;
- (BOOL)isWritingInline;
- (BOOL)validateElement:(id)a3;
- (KSXMLWriter)initWithOutputWriter:(id)a3;
- (KSXMLWriter)initWithOutputWriter:(id)a3 encoding:(unint64_t)a4;
- (NSArray)openElements;
- (id)currentAttributes;
- (id)topElement;
- (id)validateAttribute:(id)a3 value:(id)a4 ofElement:(id)a5;
- (id)writeElement:(id)a3 contentsInvocationTarget:(id)a4;
- (int64_t)indentationLevel;
- (unint64_t)encoding;
- (unint64_t)openElementsCount;
- (void)close;
- (void)closeComment;
- (void)closeEmptyElementTag;
- (void)closeStartTag;
- (void)decreaseIndentationLevel;
- (void)didStartElement;
- (void)endCDATA;
- (void)endElement;
- (void)increaseIndentationLevel;
- (void)openComment;
- (void)popElement;
- (void)pushAttribute:(id)a3 value:(id)a4;
- (void)pushElement:(id)a3;
- (void)setEncoding:(unint64_t)a3;
- (void)setIndentationLevel:(int64_t)a3;
- (void)startCDATA;
- (void)startDocumentWithDocType:(id)a3 encoding:(unint64_t)a4;
- (void)startElement:(id)a3;
- (void)startElement:(id)a3 attributes:(id)a4;
- (void)startElement:(id)a3 writeInline:(BOOL)a4;
- (void)startNewline;
- (void)startWritingInline;
- (void)stopWritingInline;
- (void)writeAttribute:(id)a3 value:(id)a4;
- (void)writeAttributeValue:(id)a3;
- (void)writeCharacters:(id)a3;
- (void)writeComment:(id)a3;
- (void)writeElement:(id)a3 text:(id)a4;
- (void)writeEndTag:(id)a3;
- (void)writeString:(id)a3;
- (void)writeStringByEscapingXMLEntities:(id)a3 escapeQuot:(BOOL)a4;
@end

@implementation KSXMLWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsProxy, 0);
  objc_storeStrong((id *)&self->_openElements, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

- (unint64_t)encoding
{
  return self->_encoding;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentation = a3;
}

- (int64_t)indentationLevel
{
  return self->_indentation;
}

- (void)writeString:(id)a3
{
  v5 = (__CFString *)a3;
  if (!v5)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"KSXMLWriter.m", 563, @"Invalid parameter not satisfying: %@", @"nil != string" object file lineNumber description];
  }
  if (self->_elementIsEmpty && [(__CFString *)v5 length])
  {
    self->_elementIsEmpty = 0;
    [(KSXMLWriter *)self closeStartTag];
  }
  CFIndex Length = CFStringGetLength(v5);
  if (Length)
  {
    CFIndex v7 = Length;
    CFIndex v8 = 0;
    do
    {
      CFStringEncoding v9 = CFStringConvertNSStringEncodingToEncoding([(KSXMLWriter *)self encoding]);
      v27.location = v8;
      v27.length = v7;
      CFIndex Bytes = CFStringGetBytes(v5, v27, v9, 0, 0, 0, 0, 0);
      if (Bytes >= v7)
      {
        if (v8)
        {
          v28.location = v8;
          v28.length = v7;
          CFStringRef v15 = CFStringCreateWithSubstring(0, v5, v28);
          v17.receiver = self;
          v17.super_class = (Class)KSXMLWriter;
          [(KSForwardingWriter *)&v17 writeString:v15];
          CFRelease(v15);
        }
        else
        {
          v18.receiver = self;
          v18.super_class = (Class)KSXMLWriter;
          [(KSForwardingWriter *)&v18 writeString:v5];
        }
        break;
      }
      CFIndex v11 = Bytes;
      if (Bytes)
      {
        v12 = -[__CFString substringWithRange:](v5, "substringWithRange:", v8, Bytes);
        v26.receiver = self;
        v26.super_class = (Class)KSXMLWriter;
        [(KSForwardingWriter *)&v26 writeString:v12];
      }
      int v13 = [(__CFString *)v5 characterAtIndex:v11 + v8];
      if (v13 > 8210)
      {
        switch(v13)
        {
          case 8211:
            v22.receiver = self;
            v22.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v22 writeString:@"&ndash;"];
            break;
          case 8212:
            v21.receiver = self;
            v21.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v21 writeString:@"&mdash;"];
            break;
          case 8364:
            v20.receiver = self;
            v20.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v20 writeString:@"&euro;"];
            break;
          default:
LABEL_26:
            v14 = objc_msgSend(NSString, "stringWithFormat:", @"&#%d", v13);;
            v19.receiver = self;
            v19.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v19 writeString:v14];

            break;
        }
      }
      else
      {
        switch(v13)
        {
          case 160:
            v25.receiver = self;
            v25.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v25 writeString:@"&nbsp;"];
            break;
          case 169:
            v24.receiver = self;
            v24.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v24 writeString:@"&copy;"];
            break;
          case 174:
            v23.receiver = self;
            v23.super_class = (Class)KSXMLWriter;
            [(KSForwardingWriter *)&v23 writeString:@"&reg;"];
            break;
          default:
            goto LABEL_26;
        }
      }
      v8 += v11 + 1;
      v7 -= v11 + 1;
    }
    while (v7);
  }
}

- (void)setEncoding:(unint64_t)a3
{
  if (a3 > 0xA || ((1 << a3) & 0x432) == 0)
  {
    CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(a3);
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Unsupported character encoding %@ (%u)", CFStringGetNameOfEncoding(v5), a3 format];
  }
  self->_encoding = a3;
}

- (void)writeStringByEscapingXMLEntities:(id)a3 escapeQuot:(BOOL)a4
{
  BOOL v4 = a4;
  id v24 = a3;
  CFIndex v7 = &sCharactersToEntityEscapeWithQuot;
  if (!v4) {
    CFIndex v7 = &sCharactersToEntityEscapeWithoutQuot;
  }
  id v8 = (id)*v7;
  uint64_t v9 = [v24 length];
  uint64_t v10 = objc_msgSend(v24, "rangeOfCharacterFromSet:options:range:", v8, 0, 0, v9);
  id v12 = v24;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(KSXMLWriter *)self writeString:v24];
    goto LABEL_28;
  }
  if (v9)
  {
    uint64_t v13 = v10;
    uint64_t v14 = v11;
    uint64_t v15 = 0;
    do
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v16 = v9;
      }
      else {
        uint64_t v16 = v13 - v15;
      }
      if (v16)
      {
        objc_super v17 = [v24 substringWithRange:v15];
        [(KSXMLWriter *)self writeString:v17];
      }
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v14 != 1)
      {
        objc_super v23 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v12);
        [v23 handleFailureInMethod:a2 object:self file:@"KSXMLWriter.m" lineNumber:516 description:@"trying to escaping non-single character string"];
      }
      int v18 = [v24 characterAtIndex:v13];
      if (v18 > 59)
      {
        if (v18 == 60)
        {
          objc_super v19 = self;
          objc_super v20 = @"&lt;";
        }
        else
        {
          if (v18 != 62)
          {
LABEL_27:
            objc_super v22 = objc_msgSend(NSString, "stringWithFormat:", @"&#%d", v18);;
            [(KSXMLWriter *)self writeString:v22];

            goto LABEL_25;
          }
          objc_super v19 = self;
          objc_super v20 = @"&gt;";
        }
      }
      else if (v18 == 34)
      {
        objc_super v19 = self;
        objc_super v20 = @"&quot;";
      }
      else
      {
        if (v18 != 38) {
          goto LABEL_27;
        }
        objc_super v19 = self;
        objc_super v20 = @"&amp;";
      }
      [(KSXMLWriter *)v19 writeString:v20];
LABEL_25:
      uint64_t v15 = v14 + v13;
      uint64_t v9 = [v24 length] - (v14 + v13);
      uint64_t v13 = objc_msgSend(v24, "rangeOfCharacterFromSet:options:range:", v8, 0, v14 + v13, v9);
      uint64_t v14 = v21;
    }
    while (v9);
  }
LABEL_28:
}

- (void)stopWritingInline
{
  self->_inlineWritingLevel = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)startWritingInline
{
  if (self->_inlineWritingLevel - 0x7FFFFFFFFFFFFFFFLL <= 0x8000000000000001) {
    self->_inlineWritingLevel = [(KSXMLWriter *)self openElementsCount];
  }
}

- (BOOL)isWritingInline
{
  return [(KSXMLWriter *)self openElementsCount] >= self->_inlineWritingLevel;
}

- (BOOL)elementCanBeEmpty:(id)a3
{
  return 1;
}

- (void)writeEndTag:(id)a3
{
  id v4 = a3;
  [(KSXMLWriter *)self writeString:@"</"];
  [(KSXMLWriter *)self writeString:v4];

  [(KSXMLWriter *)self writeString:@">"];
}

- (void)closeEmptyElementTag
{
}

- (void)closeStartTag
{
}

- (void)didStartElement
{
  v3 = [(KSXMLWriter *)self topElement];
  self->_elementIsEmpty = [(KSXMLWriter *)self elementCanBeEmpty:v3];

  if (!self->_elementIsEmpty)
  {
    [(KSXMLWriter *)self closeStartTag];
  }
}

- (id)topElement
{
  return (id)[(NSMutableArray *)self->_openElements lastObject];
}

- (BOOL)hasOpenElement:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CFStringEncoding v5 = self->_openElements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isEqualToString:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)openElementsCount
{
  return [(NSMutableArray *)self->_openElements count];
}

- (NSArray)openElements
{
  v2 = (void *)[(NSMutableArray *)self->_openElements copy];
  return (NSArray *)v2;
}

- (BOOL)canWriteElementInline:(id)a3
{
  return self->_inlineWritingLevel == 0;
}

- (id)validateAttribute:(id)a3 value:(id)a4 ofElement:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"KSXMLWriter.m", 373, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"KSXMLWriter.m", 374, @"Invalid parameter not satisfying: %@", @"element" object file lineNumber description];

LABEL_3:
  return v10;
}

- (BOOL)validateElement:(id)a3
{
  if (!a3)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"KSXMLWriter.m", 367, @"Invalid parameter not satisfying: %@", @"element" object file lineNumber description];
  }
  return 1;
}

- (void)decreaseIndentationLevel
{
  int64_t v3 = [(KSXMLWriter *)self indentationLevel] - 1;
  [(KSXMLWriter *)self setIndentationLevel:v3];
}

- (void)increaseIndentationLevel
{
  int64_t v3 = [(KSXMLWriter *)self indentationLevel] + 1;
  [(KSXMLWriter *)self setIndentationLevel:v3];
}

- (void)endCDATA
{
}

- (void)startCDATA
{
}

- (void)closeComment
{
}

- (void)openComment
{
}

- (void)writeComment:(id)a3
{
  id v4 = a3;
  [(KSXMLWriter *)self openComment];
  [(KSXMLWriter *)self writeStringByEscapingXMLEntities:v4 escapeQuot:1];

  [(KSXMLWriter *)self closeComment];
}

- (void)startNewline
{
  [(KSXMLWriter *)self writeString:@"\n"];
  if ([(KSXMLWriter *)self indentationLevel] >= 1)
  {
    int64_t v3 = 0;
    do
    {
      [(KSXMLWriter *)self writeString:@"\t"];
      ++v3;
    }
    while ([(KSXMLWriter *)self indentationLevel] > v3);
  }
}

- (void)writeAttribute:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v6 description];
  [(KSXMLWriter *)self writeString:@" "];
  [(KSXMLWriter *)self writeString:v7];

  id v8 = [MEMORY[0x263EFF9D0] null];

  if (v8 != v6)
  {
    [(KSXMLWriter *)self writeString:@"=\""];
    [(KSXMLWriter *)self writeAttributeValue:v9];
    [(KSXMLWriter *)self writeString:@"\""];
  }
}

- (void)writeAttributeValue:(id)a3
{
  id v4 = [a3 stringByUnescapingCrititcalXMLEntities];
  [(KSXMLWriter *)self writeStringByEscapingXMLEntities:v4 escapeQuot:1];
}

- (BOOL)hasCurrentAttributes
{
  return [(KSXMLAttributes *)self->_attributes hasAttributes];
}

- (id)currentAttributes
{
  v2 = (void *)[(KSXMLAttributes *)self->_attributes copy];
  return v2;
}

- (void)pushAttribute:(id)a3 value:(id)a4
{
}

- (void)popElement
{
  self->_elementIsEmpty = 0;
  [(NSMutableArray *)self->_openElements removeLastObject];
  if (![(KSXMLWriter *)self isWritingInline])
  {
    [(KSXMLWriter *)self stopWritingInline];
  }
}

- (void)pushElement:(id)a3
{
}

- (void)endElement
{
  [(KSXMLWriter *)self decreaseIndentationLevel];
  if (![(KSXMLWriter *)self isWritingInline]) {
    [(KSXMLWriter *)self startNewline];
  }
  if (self->_elementIsEmpty)
  {
    [(KSXMLWriter *)self popElement];
    [(KSXMLWriter *)self closeEmptyElementTag];
  }
  else
  {
    int64_t v3 = [(KSXMLWriter *)self topElement];
    [(KSXMLWriter *)self writeEndTag:v3];

    [(KSXMLWriter *)self popElement];
  }
}

- (void)startElement:(id)a3 attributes:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v13 = [v7 objectForKey:v12];
        [(KSXMLWriter *)self pushAttribute:v12 value:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [(KSXMLWriter *)self startElement:v6];
}

- (void)startElement:(id)a3 writeInline:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    [(KSXMLWriter *)self startNewline];
    [(KSXMLWriter *)self stopWritingInline];
  }
  [(KSXMLWriter *)self willStartElement:v6];
  [(KSXMLWriter *)self writeString:@"<"];
  [(KSXMLWriter *)self writeString:v6];
  [(KSXMLWriter *)self pushElement:v6];
  [(KSXMLWriter *)self startWritingInline];
  [(KSXMLAttributes *)self->_attributes writeAttributes:self];
  [(KSXMLAttributes *)self->_attributes close];
  [(KSXMLWriter *)self didStartElement];
  [(KSXMLWriter *)self increaseIndentationLevel];
}

- (void)startElement:(id)a3
{
  id v4 = a3;
  [(KSXMLWriter *)self startElement:v4 writeInline:[(KSXMLWriter *)self canWriteElementInline:v4]];
}

- (void)writeElement:(id)a3 text:(id)a4
{
  id v6 = a4;
  [(KSXMLWriter *)self startElement:a3 attributes:0];
  [(KSXMLWriter *)self writeCharacters:v6];

  [(KSXMLWriter *)self endElement];
}

- (id)writeElement:(id)a3 contentsInvocationTarget:(id)a4
{
  id v6 = a4;
  [(KSXMLWriter *)self startElement:a3];
  [(KSXMLElementContentsProxy *)self->_contentsProxy ks_prepareWithTarget:v6 XMLWriter:self];

  contentsProxy = self->_contentsProxy;
  return contentsProxy;
}

- (void)writeCharacters:(id)a3
{
}

- (void)startDocumentWithDocType:(id)a3 encoding:(unint64_t)a4
{
  id v6 = a3;
  [(KSXMLWriter *)self writeString:@"<!DOCTYPE "];
  [(KSXMLWriter *)self writeString:v6];

  [(KSXMLWriter *)self writeString:@">"];
  [(KSXMLWriter *)self startNewline];
  [(KSXMLWriter *)self setEncoding:a4];
}

- (void)close
{
  [(KSXMLWriter *)self flush];
  v3.receiver = self;
  v3.super_class = (Class)KSXMLWriter;
  [(KSForwardingWriter *)&v3 close];
}

- (KSXMLWriter)initWithOutputWriter:(id)a3 encoding:(unint64_t)a4
{
  CFStringEncoding v5 = [(KSXMLWriter *)self initWithOutputWriter:a3];
  id v6 = v5;
  if (v5) {
    [(KSXMLWriter *)v5 setEncoding:a4];
  }
  return v6;
}

- (KSXMLWriter)initWithOutputWriter:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)KSXMLWriter;
  CFStringEncoding v5 = [(KSForwardingWriter *)&v14 initWithOutputWriter:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(KSXMLAttributes);
    attributes = v5->_attributes;
    v5->_attributes = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    openElements = v5->_openElements;
    v5->_openElements = v8;

    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = [v4 encoding];
    }
    else {
      uint64_t v10 = 4;
    }
    v5->_encoding = v10;
    id v11 = [KSXMLElementContentsProxy alloc];
    contentsProxy = v5->_contentsProxy;
    v5->_contentsProxy = v11;
  }
  return v5;
}

+ (void)initialize
{
  if (!sCharactersToEntityEscapeWithQuot)
  {
    uint64_t v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"&<>\""];
    objc_super v3 = (void *)sCharactersToEntityEscapeWithQuot;
    sCharactersToEntityEscapeWithQuot = v2;
  }
  if (!sCharactersToEntityEscapeWithoutQuot)
  {
    uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"&<>"];
    CFStringEncoding v5 = (void *)sCharactersToEntityEscapeWithoutQuot;
    sCharactersToEntityEscapeWithoutQuot = v4;
  }
}

+ (id)stringFromAttributeValue:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v6 = [v4 string];
  id v7 = (void *)[objc_alloc((Class)a1) initWithOutputWriter:v6];
  [v7 writeAttributeValue:v5];

  return v6;
}

+ (id)stringFromCharacters:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v6 = [v4 string];
  id v7 = (void *)[objc_alloc((Class)a1) initWithOutputWriter:v6];
  [v7 writeCharacters:v5];

  return v6;
}

@end