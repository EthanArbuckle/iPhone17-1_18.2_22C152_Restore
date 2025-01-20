@interface CRCSVParser
- (BOOL)_ensureBufferSize:(unint64_t)a3;
- (BOOL)parse;
- (BOOL)parseableDataAvailable;
- (BOOL)shouldProceedParsing;
- (CRCSVParser)initWithPath:(id)a3;
- (NSString)separator;
- (id)_consumeSingleCharacter:(char)a3;
- (id)_parseDoubleQuote;
- (id)_parseEscapedText;
- (id)_parseField;
- (id)_parseLineSeparator;
- (id)_parseRecord;
- (id)_parseSeparator;
- (id)_parseText;
- (id)_parseTwoDoubleQuotes;
- (id)parserError;
- (unint64_t)_availableBytes;
- (void)_fillBuffer:(unint64_t)a3;
- (void)abortParsing;
- (void)dealloc;
- (void)didFindError:(id)a3;
- (void)didFinishParsing;
- (void)setParsedLineBlock:(id)a3;
- (void)setSeparator:(id)a3;
@end

@implementation CRCSVParser

- (CRCSVParser)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRCSVParser;
  v5 = [(CRCSVParser *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(CRCSVParser *)v5 setSeparator:@","];
    v7 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    data = v6->_data;
    v6->_data = v7;

    v9 = (NSInputStream *)[objc_alloc((Class)NSInputStream) initWithFileAtPath:v4];
    stream = v6->_stream;
    v6->_stream = v9;

    [(NSInputStream *)v6->_stream open];
    v11 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(NSInputStream *)self->_stream close];
  v3.receiver = self;
  v3.super_class = (Class)CRCSVParser;
  [(CRCSVParser *)&v3 dealloc];
}

- (void)setSeparator:(id)a3
{
  id v4 = (NSString *)a3;
  if (self->_separator != v4)
  {
    v9 = v4;
    v5 = (NSString *)[(NSString *)v4 copy];
    separator = self->_separator;
    self->_separator = v5;

    v7 = [(NSString *)v9 dataUsingEncoding:4];
    separatorData = self->_separatorData;
    self->_separatorData = v7;

    id v4 = v9;
  }
}

- (void)setParsedLineBlock:(id)a3
{
  self->_parsedLineBlock = objc_retainBlock(a3);

  _objc_release_x1();
}

- (BOOL)shouldProceedParsing
{
  return !self->_shouldAbort && self->_parserError == 0;
}

- (BOOL)parseableDataAvailable
{
  return [(NSInputStream *)self->_stream hasBytesAvailable]
      || [(CRCSVParser *)self _availableBytes] != 0;
}

- (void)didFindError:(id)a3
{
  id v5 = a3;
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_28BC((uint64_t)v5, v6);
  }

  parserError = self->_parserError;
  p_parserError = &self->_parserError;
  if (!parserError) {
    objc_storeStrong((id *)p_parserError, a3);
  }
}

- (void)didFinishParsing
{
  [(NSInputStream *)self->_stream close];
  stream = self->_stream;
  self->_stream = 0;
}

- (unint64_t)_availableBytes
{
  return [(NSMutableData *)self->_data length] - self->_head;
}

- (void)_fillBuffer:(unint64_t)a3
{
  objc_super v3 = (id *)__chkstk_darwin(self, a2, a3);
  size_t v5 = v4;
  v6 = v3;
  if ([v3 shouldProceedParsing]
    && (unint64_t)[v6 _availableBytes] < v5)
  {
    uint64_t v7 = 4096;
    v8 = __b;
    memset(__b, 170, sizeof(__b));
    if (v5 > 0x1000)
    {
      v8 = malloc_type_malloc(v5, 0x52BC8A32uLL);
      uint64_t v7 = v5;
    }
    unint64_t v9 = (unint64_t)[v6[2] read:v8 maxLength:v7];
    if ((v9 & 0x8000000000000000) != 0)
    {
      v11 = +[NSError errorWithDomain:@"CRCSVParserErrorDomain" code:0 userInfo:0];
      [v6 didFindError:v11];
    }
    else
    {
      id v10 = v6[5];
      if (v10)
      {
        objc_msgSend(v6[4], "replaceBytesInRange:withBytes:length:", 0, v10, 0, 0);
        v6[5] = 0;
      }
      if (v9) {
        [v6[4] appendBytes:v8 length:v9];
      }
    }
    if (v8 != __b) {
      free(v8);
    }
  }
}

- (BOOL)_ensureBufferSize:(unint64_t)a3
{
  -[CRCSVParser _fillBuffer:](self, "_fillBuffer:");
  if ([(CRCSVParser *)self _availableBytes] < a3)
  {
    size_t v5 = +[NSError errorWithDomain:@"CRCSVParserErrorDomain" code:1 userInfo:0];
    [(CRCSVParser *)self didFindError:v5];
  }
  BOOL v6 = [(CRCSVParser *)self shouldProceedParsing];
  if (v6) {
    LOBYTE(v6) = [(CRCSVParser *)self _availableBytes] >= a3;
  }
  return v6;
}

- (id)_consumeSingleCharacter:(char)a3
{
  int v3 = a3;
  if ([(CRCSVParser *)self _ensureBufferSize:1]
    && (size_t v5 = (char *)[(NSMutableData *)self->_data bytes], v3 == v5[self->_head]))
  {
    id v6 = [objc_alloc((Class)NSString) initWithBytes:&v5[self->_head++] length:1 encoding:4];
    self->_consumedNullText = 0;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_parseDoubleQuote
{
  return [(CRCSVParser *)self _consumeSingleCharacter:34];
}

- (id)_parseLineSeparator
{
  int v3 = [(CRCSVParser *)self _consumeSingleCharacter:13];
  if (v3)
  {
    [(CRCSVParser *)self _consumeSingleCharacter:10];

    return @"\n";
  }
  size_t v4 = [(CRCSVParser *)self _consumeSingleCharacter:10];

  if (v4) {
    return @"\n";
  }
  return 0;
}

- (id)_parseTwoDoubleQuotes
{
  if (![(CRCSVParser *)self _ensureBufferSize:2]) {
    return 0;
  }
  int v3 = [(NSMutableData *)self->_data bytes];
  unint64_t head = self->_head;
  if (v3[head] != 34 || v3[head + 1] != 34) {
    return 0;
  }
  self->_unint64_t head = head + 2;
  self->_consumedNullText = 0;
  return @"\"\"";
}

- (id)_parseSeparator
{
  if ([(CRCSVParser *)self _ensureBufferSize:[(NSData *)self->_separatorData length]]
    && (-[NSMutableData rangeOfData:options:range:](self->_data, "rangeOfData:options:range:", self->_separatorData, 2, self->_head, (char *)[(NSMutableData *)self->_data length] - self->_head), v3 == (void *)[(NSData *)self->_separatorData length]))
  {
    size_t v4 = self->_separator;
    self->_head += [(NSData *)self->_separatorData length];
    self->_consumedNullText = 0;
  }
  else
  {
    size_t v4 = 0;
  }

  return v4;
}

- (id)_parseText
{
  if (self->_consumedNullText
    || ([(CRCSVParser *)self _fillBuffer:128],
        int v3 = (char *)[(NSMutableData *)self->_data bytes],
        unint64_t head = self->_head,
        unint64_t v5 = [(CRCSVParser *)self _availableBytes],
        id v6 = [(NSData *)self->_separatorData bytes],
        NSUInteger v7 = [(NSData *)self->_separatorData length],
        ![(CRCSVParser *)self shouldProceedParsing]))
  {
LABEL_27:
    id v18 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    unint64_t v9 = 128;
    if (v5 >= 0x80) {
      unint64_t v10 = 128;
    }
    else {
      unint64_t v10 = v5;
    }
    v11 = &v3[head];
    while (v8 >= v10)
    {
LABEL_18:
      v9 *= 2;
      [(CRCSVParser *)self _fillBuffer:v9];
      unint64_t v15 = [(CRCSVParser *)self _availableBytes];
      if (v9 >= v15) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = v9;
      }
      if (v16 == v10)
      {
        v19 = +[NSError errorWithDomain:@"CRCSVParserErrorDomain" code:1 userInfo:0];
        [(CRCSVParser *)self didFindError:v19];
        goto LABEL_26;
      }
      v11 = (char *)[(NSMutableData *)self->_data bytes] + self->_head;
      unsigned __int8 v17 = [(CRCSVParser *)self shouldProceedParsing];
      id v18 = 0;
      unint64_t v10 = v16;
      if ((v17 & 1) == 0) {
        goto LABEL_28;
      }
    }
    while (1)
    {
      unsigned int v12 = v11[v8];
      if (v12 <= 0x22 && ((1 << v12) & 0x400002400) != 0) {
        break;
      }
      if (v12 == *v6)
      {
        if (v10 - v8 < v7) {
          goto LABEL_18;
        }
        -[NSMutableData rangeOfData:options:range:](self->_data, "rangeOfData:options:range:", self->_separatorData, 2, self->_head + v8, (char *)[(NSMutableData *)self->_data length] - v8 - self->_head);
        if (v14 == v7) {
          break;
        }
      }
      if (++v8 == v10)
      {
        unint64_t v8 = v10;
        goto LABEL_18;
      }
    }
    id v18 = [objc_alloc((Class)NSString) initWithBytes:v11 length:v8 encoding:4];
    self->_head += v8;
    self->_consumedNullText = v8 == 0;
    if (!v18)
    {
      v19 = +[NSError errorWithDomain:@"CRCSVParserErrorDomain" code:3 userInfo:0];
      [(CRCSVParser *)self didFindError:v19];
LABEL_26:

      goto LABEL_27;
    }
  }
LABEL_28:

  return v18;
}

- (id)_parseEscapedText
{
  int v3 = [(CRCSVParser *)self _parseDoubleQuote];

  if (v3)
  {
    int v3 = +[NSMutableString string];
    while (1)
    {
      size_t v4 = [(CRCSVParser *)self _parseText];
      if (!v4)
      {
        size_t v4 = [(CRCSVParser *)self _parseSeparator];
        if (!v4)
        {
          size_t v4 = [(CRCSVParser *)self _parseLineSeparator];
          if (!v4)
          {
            unint64_t v5 = [(CRCSVParser *)self _parseTwoDoubleQuotes];

            size_t v4 = @"\"";
            if (!v5) {
              break;
            }
          }
        }
      }
      [v3 appendString:v4];
    }
    id v6 = [(CRCSVParser *)self _parseDoubleQuote];

    if (!v6)
    {
      NSUInteger v7 = +[NSError errorWithDomain:@"CRCSVParserErrorDomain" code:4 userInfo:0];
      [(CRCSVParser *)self didFindError:v7];

      int v3 = 0;
    }
  }

  return v3;
}

- (id)_parseField
{
  int v3 = [(CRCSVParser *)self _parseEscapedText];
  if (!v3)
  {
    int v3 = [(CRCSVParser *)self _parseText];
  }

  return v3;
}

- (id)_parseRecord
{
  if ([(CRCSVParser *)self parseableDataAvailable]
    && ([(CRCSVParser *)self _parseField], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    size_t v4 = (void *)v3;
    for (i = +[NSMutableArray arrayWithObject:v3];
    {
      id v6 = [(CRCSVParser *)self _parseSeparator];

      if (!v6) {
        break;
      }
      uint64_t v7 = [(CRCSVParser *)self _parseField];

      if (!v7)
      {
        unint64_t v8 = +[NSError errorWithDomain:@"CRCSVParserErrorDomain" code:2 userInfo:0];
        [(CRCSVParser *)self didFindError:v8];

        size_t v4 = 0;
        i = 0;
        break;
      }
      size_t v4 = (void *)v7;
    }
  }
  else
  {
    i = 0;
  }

  return i;
}

- (BOOL)parse
{
  if (!self->_stream) {
    sub_2934();
  }
  size_t v4 = [(CRCSVParser *)self _parseRecord];
  if ([v4 count]) {
    (*((void (**)(void))self->_parsedLineBlock + 2))();
  }

  if ([(CRCSVParser *)self shouldProceedParsing])
  {
    do
    {
      if (![(CRCSVParser *)self parseableDataAvailable]) {
        break;
      }
      id v6 = [(CRCSVParser *)self _parseLineSeparator];
      uint64_t v7 = [(CRCSVParser *)self _parseRecord];
      if ([v7 count]) {
        (*((void (**)(void))self->_parsedLineBlock + 2))();
      }
    }
    while ([(CRCSVParser *)self shouldProceedParsing]);
  }
  if ([(CRCSVParser *)self shouldProceedParsing]) {
    [(CRCSVParser *)self didFinishParsing];
  }
  return self->_parserError == 0;
}

- (void)abortParsing
{
  self->_shouldAbort = 1;
}

- (id)parserError
{
  return self->_parserError;
}

- (NSString)separator
{
  return self->_separator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong(&self->_parsedLineBlock, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_separatorData, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

@end