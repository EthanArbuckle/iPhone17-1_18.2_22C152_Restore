@interface WPXMLRPCDecoder
- (BOOL)isFault;
- (WPXMLRPCDecoder)initWithData:(id)a3;
- (id)error;
- (id)faultString;
- (id)object;
- (int64_t)faultCode;
- (void)abortParsing;
- (void)parse;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation WPXMLRPCDecoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodName, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_originalData, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (id)object
{
  return self->_object;
}

- (id)error
{
  v23[1] = *MEMORY[0x263EF8340];
  v3 = [(NSXMLParser *)self->_parser parserError];

  if (v3)
  {
    v4 = (void *)[[NSString alloc] initWithData:self->_originalData encoding:4];
    if (v4)
    {
      id v17 = 0;
      v5 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"Allowed memory size of \\d+ bytes exhausted" options:1 error:&v17];
      id v6 = v17;
      if (objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")))
      {
        v7 = (void *)MEMORY[0x263F087E8];
        uint64_t v22 = *MEMORY[0x263F08320];
        v8 = [MEMORY[0x263F086E0] mainBundle];
        v9 = [v8 localizedStringForKey:@"Your site ran out of memory while processing this request" value:&stru_26F008428 table:@"WPXMLRPC"];
        v23[0] = v9;
        v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
        v11 = [v7 errorWithDomain:@"WPXMLRPCError" code:1 userInfo:v10];

LABEL_12:
        goto LABEL_13;
      }
    }
    v11 = [(NSXMLParser *)self->_parser parserError];
  }
  else
  {
    if (![(WPXMLRPCDecoder *)self isFault])
    {
      if (self->_object)
      {
        v11 = 0;
        goto LABEL_14;
      }
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      v4 = [MEMORY[0x263F086E0] mainBundle];
      id v6 = [v4 localizedStringForKey:@"The data doesn't look like a valid XML-RPC response" value:&stru_26F008428 table:@"WPXMLRPC"];
      id v19 = v6;
      v5 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      v11 = [v15 errorWithDomain:@"WPXMLRPCError" code:0 userInfo:v5];
      goto LABEL_12;
    }
    v12 = (void *)MEMORY[0x263F087E8];
    int64_t v13 = [(WPXMLRPCDecoder *)self faultCode];
    uint64_t v20 = *MEMORY[0x263F08320];
    v4 = [(WPXMLRPCDecoder *)self faultString];
    v21 = v4;
    v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v11 = [v12 errorWithDomain:@"WPXMLRPCFaultError" code:v13 userInfo:v14];
  }
LABEL_13:

LABEL_14:
  return v11;
}

- (id)faultString
{
  if ([(WPXMLRPCDecoder *)self isFault])
  {
    v3 = [self->_object objectForKey:@"faultString"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (int64_t)faultCode
{
  if (![(WPXMLRPCDecoder *)self isFault]) {
    return 0;
  }
  v3 = [self->_object objectForKey:@"faultCode"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isFault
{
  return self->_isFault;
}

- (void)abortParsing
{
}

- (void)parse
{
  v16[2] = *MEMORY[0x263EF8340];
  [(NSXMLParser *)self->_parser setDelegate:self];
  [(NSXMLParser *)self->_parser parse];
  v3 = [(NSXMLParser *)self->_parser parserError];

  if (v3)
  {
    int64_t v4 = [[WPXMLRPCDataCleaner alloc] initWithData:self->_originalData];
    v5 = [(WPXMLRPCDataCleaner *)v4 cleanData];
    body = self->_body;
    self->_body = v5;

    v7 = (NSXMLParser *)[objc_alloc(MEMORY[0x263F08D58]) initWithData:self->_body];
    parser = self->_parser;
    self->_parser = v7;

    [(NSXMLParser *)self->_parser setDelegate:self];
    [(NSXMLParser *)self->_parser parse];
  }
  v9 = [(NSXMLParser *)self->_parser parserError];

  if (!v9)
  {
    if (self->_methodName)
    {
      v16[0] = self->_methodName;
      v15[0] = @"methodName";
      v15[1] = @"params";
      v10 = [(WPXMLRPCDecoderDelegate *)self->_delegate elementValue];
      v16[1] = v10;
      v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      id object = self->_object;
      self->_id object = v11;
    }
    else
    {
      int64_t v13 = [(WPXMLRPCDecoderDelegate *)self->_delegate elementValue];
      id v14 = self->_object;
      self->_id object = v13;
    }
  }
}

- (WPXMLRPCDecoder)initWithData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(WPXMLRPCDecoder *)self init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_body, a3);
      objc_storeStrong((id *)&v7->_originalData, a3);
      uint64_t v8 = [objc_alloc(MEMORY[0x263F08D58]) initWithData:v5];
      parser = v7->_parser;
      v7->_parser = (NSXMLParser *)v8;

      delegate = v7->_delegate;
      v7->_delegate = 0;

      v7->_isFault = 0;
      [(WPXMLRPCDecoder *)v7 parse];
    }
    self = v7;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([a4 isEqualToString:@"methodName"])
  {
    v7 = [[WPXMLRPCDecoderDelegate alloc] initWithParent:0];
    delegate = self->_delegate;
    self->_delegate = v7;

    parser = self->_parser;
    v10 = self->_delegate;
    [(NSXMLParser *)parser setDelegate:v10];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12 = a4;
  if ([v12 isEqualToString:@"fault"])
  {
    self->_isFault = 1;
  }
  else if ([v12 isEqualToString:@"value"])
  {
    uint64_t v8 = [[WPXMLRPCDecoderDelegate alloc] initWithParent:0];
    delegate = self->_delegate;
    self->_delegate = v8;

    [(NSXMLParser *)self->_parser setDelegate:self->_delegate];
  }
  else if ([v12 isEqualToString:@"methodName"])
  {
    v10 = [MEMORY[0x263F089D8] string];
    methodName = self->_methodName;
    self->_methodName = v10;
  }
}

@end