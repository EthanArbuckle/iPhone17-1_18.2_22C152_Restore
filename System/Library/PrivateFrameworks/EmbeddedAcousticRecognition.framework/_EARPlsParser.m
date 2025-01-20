@interface _EARPlsParser
- (NSMutableDictionary)lexemes;
- (_EARPlsParser)initWithData:(id)a3;
- (_EARPlsParser)initWithFilePath:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation _EARPlsParser

- (_EARPlsParser)initWithData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARPlsParser;
  v5 = [(_EARPlsParser *)&v11 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  lexemes = v5->_lexemes;
  v5->_lexemes = v6;

  v8 = (_EARPlsParser *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v4];
  parser = v5->_parser;
  v5->_parser = (NSXMLParser *)v8;

  if (v8)
  {
    [(NSXMLParser *)v5->_parser setDelegate:v5];
    [(NSXMLParser *)v5->_parser parse];
LABEL_4:
    v8 = v5;
  }

  return v8;
}

- (_EARPlsParser)initWithFilePath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_EARPlsParser;
  v5 = [(_EARPlsParser *)&v12 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4];
    v7 = [(_EARPlsParser *)v5 initWithData:v6];
    if (!v7)
    {
      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      v9 = (EARLogger *)[v8 fileExistsAtPath:v4];
      if (v9)
      {
        v10 = EARLogger::QuasarOSLogger(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[_EARPlsParser initWithFilePath:]((uint64_t)v4, v10);
        }

        v7 = 0;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12 = a4;
  v8 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  elementValue = self->_elementValue;
  self->_elementValue = v8;

  if ([v12 isEqualToString:@"lexeme"])
  {
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    currentPhonemes = self->_currentPhonemes;
    self->_currentPhonemes = v10;
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v12 = a4;
  if ([v12 isEqualToString:@"lexeme"])
  {
    lexemes = self->_lexemes;
    currentGrapheme = [MEMORY[0x1E4F1CAD0] setWithSet:self->_currentPhonemes];
    v9 = (void *)[(NSString *)self->_currentGrapheme copy];
    [(NSMutableDictionary *)lexemes setObject:currentGrapheme forKey:v9];
  }
  else if ([v12 isEqualToString:@"grapheme"])
  {
    v10 = (NSString *)[(NSMutableString *)self->_elementValue copy];
    currentGrapheme = self->_currentGrapheme;
    self->_currentGrapheme = v10;
  }
  else
  {
    if (![v12 isEqualToString:@"phoneme"]) {
      goto LABEL_8;
    }
    currentPhonemes = self->_currentPhonemes;
    currentGrapheme = (void *)[(NSMutableString *)self->_elementValue copy];
    [(NSMutableSet *)currentPhonemes addObject:currentGrapheme];
  }

LABEL_8:
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6 = a4;
  elementValue = self->_elementValue;
  if (elementValue) {
    [(NSMutableString *)elementValue appendString:v6];
  }
}

- (NSMutableDictionary)lexemes
{
  return self->_lexemes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lexemes, 0);
  objc_storeStrong((id *)&self->_elementValue, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_currentPhonemes, 0);
  objc_storeStrong((id *)&self->_currentGrapheme, 0);
}

- (void)initWithFilePath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Failed to initialize XML parser for custom prons file at %@", (uint8_t *)&v2, 0xCu);
}

@end