@interface IIO_CXMLParser
+ (id)dictionaryForXMLData:(id)a3 error:(id *)a4;
- (IIO_CXMLParser)initWithError:(id *)a3;
- (id)initializeWithData:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation IIO_CXMLParser

+ (id)dictionaryForXMLData:(id)a3 error:(id *)a4
{
  v5 = [[IIO_CXMLParser alloc] initWithError:a4];

  return [(IIO_CXMLParser *)v5 initializeWithData:a3];
}

- (IIO_CXMLParser)initWithError:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IIO_CXMLParser;
  result = [(IIO_CXMLParser *)&v5 init];
  if (result) {
    result->_errorPointer = a3;
  }
  return result;
}

- (id)initializeWithData:(id)a3
{
  self->_dictionaryStack = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_textInProgress = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  -[NSMutableArray addObject:](self->_dictionaryStack, "addObject:", [MEMORY[0x1E4F1CA60] dictionary]);
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:a3];
  [v5 setDelegate:self];
  if ([v5 parse]) {
    return (id)[(NSMutableArray *)self->_dictionaryStack objectAtIndex:0];
  }
  else {
    return 0;
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v8 = a4;
  v10 = (void *)[(NSMutableArray *)self->_dictionaryStack lastObject];
  if ([v8 hasPrefix:@"ofd:"]) {
    id v8 = (id)[v8 substringFromIndex:4];
  }
  v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v11 addEntriesFromDictionary:a7];
  uint64_t v12 = [v10 objectForKey:v8];
  if (v12)
  {
    v13 = (void *)v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = (void *)[MEMORY[0x1E4F1CA48] array];
      [v14 addObject:v13];
      [v10 setObject:v14 forKey:v8];
      v13 = v14;
    }
    [v13 addObject:v11];
  }
  else
  {
    [v10 setObject:v11 forKey:v8];
  }
  dictionaryStack = self->_dictionaryStack;

  [(NSMutableArray *)dictionaryStack addObject:v11];
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v6 = a4;
  id v8 = (void *)[(NSMutableArray *)self->_dictionaryStack lastObject];
  if ([v6 hasPrefix:@"ofd:"]) {
    id v6 = (id)[v6 substringFromIndex:4];
  }
  if ([(NSMutableString *)self->_textInProgress length])
  {
    [v8 setObject:self->_textInProgress forKey:@"_text"];
    [(NSMutableArray *)self->_dictionaryStack removeLastObject];
    v9 = (void *)[(NSMutableArray *)self->_dictionaryStack lastObject];
    if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v6), "count") == 1) {
      [v9 setObject:self->_textInProgress forKey:v6];
    }
    self->_textInProgress = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  else
  {
    dictionaryStack = self->_dictionaryStack;
    [(NSMutableArray *)dictionaryStack removeLastObject];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet", a3));
  textInProgress = self->_textInProgress;

  [(NSMutableString *)textInProgress appendString:v5];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  errorPointer = self->_errorPointer;
  if (errorPointer) {
    id *errorPointer = a4;
  }
  [a3 abortParsing];
  id v6 = (void *)MEMORY[0x1E4F1CA00];
  if (a4) {
    v7 = (__CFString *)objc_msgSend((id)objc_msgSend(a4, "userInfo"), "objectForKeyedSubscript:", @"NSXMLParserErrorMessage");
  }
  else {
    v7 = @"failed to parse input data";
  }
  objc_exception_throw((id)[v6 exceptionWithName:@"XML-parsing error" reason:v7 userInfo:0]);
}

@end