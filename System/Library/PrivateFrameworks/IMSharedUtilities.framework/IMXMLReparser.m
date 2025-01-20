@interface IMXMLReparser
- (BOOL)parseWithContext:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation IMXMLReparser

- (BOOL)parseWithContext:(id)a3
{
  v5 = (void *)MEMORY[0x1A6228190](self, a2);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "_inContent"), "dataUsingEncoding:", 4);
  self->_context = (IMXMLReparserContext *)a3;
  self->_parser = (NSXMLParser *)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:v6];
  self->_output = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  self->_depth = 0;
  [(NSXMLParser *)self->_parser setDelegate:self];
  BOOL v7 = [(NSXMLParser *)self->_parser parse];
  if (!v7 || self->_error) {
    output = 0;
  }
  else {
    output = self->_output;
  }
  -[IMXMLReparserContext _setOutContent:error:](self->_context, "_setOutContent:error:", output);

  self->_output = 0;
  self->_parser = 0;

  self->_context = 0;
  self->_error = 0;
  return v7;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(NSMutableString *)self->_output appendFormat:@"<%@", a4, a5, a6, a4];
  if (self->_depth)
  {
    id v9 = a7;
  }
  else
  {
    v10 = [(IMXMLReparserContext *)self->_context attributesToPreserve];
    id v9 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v11 = [a7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(a7);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if ([(NSArray *)v10 containsObject:v15]) {
            objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a7, "objectForKey:", v15), v15);
          }
        }
        uint64_t v12 = [a7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }
    objc_msgSend(v9, "addEntriesFromDictionary:", -[IMXMLReparserContext attributesToMerge](self->_context, "attributesToMerge"));
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v9);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        v21 = (void *)IMCreateEscapedAttributeValueFromString((void *)[v9 objectForKey:v20]);
        [(NSMutableString *)self->_output appendFormat:@" %@=\"%@\"", v20, v21];
      }
      uint64_t v17 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
  [(NSMutableString *)self->_output appendFormat:@">"];
  ++self->_depth;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = (id)IMCreateEscapedStringFromString(a4, @" ", @" ", @"'", @"\"");
  [(NSMutableString *)self->_output appendString:v5];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  if (self->_error != a4)
  {
    id v5 = (NSError *)a4;
    self->_error = v5;
  }
  parser = self->_parser;

  MEMORY[0x1F4181798](parser, sel_abortParsing);
}

@end