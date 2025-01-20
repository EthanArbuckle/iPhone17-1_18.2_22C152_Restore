@interface CoreDAVXMLParser
+ (BOOL)canHandleContentType:(id)a3;
- (BOOL)processData:(id)a3 forTask:(id)a4;
- (CoreDAVErrorItem)rootError;
- (CoreDAVItem)rootElement;
- (CoreDAVXMLElementGenerator)rootElementGenerator;
- (CoreDAVXMLElementGenerator)rootErrorGenerator;
- (CoreDAVXMLParser)initWithData:(id)a3;
- (CoreDAVXMLParser)initWithRootElementNameSpace:(id)a3 name:(id)a4 parseClass:(Class)a5 baseURL:(id)a6;
- (NSSet)parseHints;
- (NSURL)baseURL;
- (void)setBaseURL:(id)a3;
- (void)setParseHints:(id)a3;
- (void)setRootElementGenerator:(id)a3;
- (void)setRootErrorGenerator:(id)a3;
@end

@implementation CoreDAVXMLParser

- (CoreDAVXMLParser)initWithData:(id)a3
{
  id v4 = a3;
  initializeLibXMLParser();
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVXMLParser;
  v5 = [(NSXMLParser *)&v7 initWithData:v4];

  return v5;
}

- (CoreDAVXMLParser)initWithRootElementNameSpace:(id)a3 name:(id)a4 parseClass:(Class)a5 baseURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CoreDAVXMLParser;
  v13 = [(NSXMLParser *)&v22 initForIncrementalParsing];
  v14 = v13;
  if (v13)
  {
    [(CoreDAVXMLParser *)v13 setBaseURL:v12];
    v15 = [CoreDAVXMLElementGenerator alloc];
    v16 = [(CoreDAVXMLParser *)v14 baseURL];
    v17 = [(CoreDAVXMLElementGenerator *)v15 initWithParser:v14 baseURL:v16 rootElementNameSpace:@"DAV:" elementName:@"error" parseClass:objc_opt_class()];

    [(CoreDAVXMLParser *)v14 setRootErrorGenerator:v17];
    v18 = [CoreDAVXMLElementGenerator alloc];
    v19 = [(CoreDAVXMLParser *)v14 baseURL];
    v20 = [(CoreDAVXMLElementGenerator *)v18 initWithParser:v14 baseURL:v19 rootElementNameSpace:v10 elementName:v11 parseClass:a5];

    [(CoreDAVXMLParser *)v14 setRootElementGenerator:v20];
    [(NSXMLParser *)v14 setShouldProcessNamespaces:1];
  }
  return v14;
}

- (BOOL)processData:(id)a3 forTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [(CoreDAVXMLParser *)self baseURL];

    if (!v8)
    {
      v9 = [v7 url];
      [(CoreDAVXMLParser *)self setBaseURL:v9];
    }
    BOOL v10 = [(NSXMLParser *)self parseData:v6];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v11 = 1;
      goto LABEL_9;
    }
    BOOL v10 = [(NSXMLParser *)self finishIncrementalParse];
  }
  BOOL v11 = v10;
LABEL_9:

  return v11;
}

- (CoreDAVItem)rootElement
{
  v2 = [(CoreDAVXMLParser *)self rootElementGenerator];
  v3 = [v2 element];

  return (CoreDAVItem *)v3;
}

- (CoreDAVErrorItem)rootError
{
  v2 = [(CoreDAVXMLParser *)self rootErrorGenerator];
  v3 = [v2 element];

  return (CoreDAVErrorItem *)v3;
}

+ (BOOL)canHandleContentType:(id)a3
{
  v3 = [a3 lowercaseString];
  id v4 = v3;
  if (v3 && ([v3 hasPrefix:@"text/xml"] & 1) == 0) {
    char v5 = [v4 hasPrefix:@"application/xml"];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (CoreDAVXMLElementGenerator)rootElementGenerator
{
  return self->_rootElementGenerator;
}

- (void)setRootElementGenerator:(id)a3
{
}

- (CoreDAVXMLElementGenerator)rootErrorGenerator
{
  return self->_rootErrorGenerator;
}

- (void)setRootErrorGenerator:(id)a3
{
}

- (NSSet)parseHints
{
  return self->_parseHints;
}

- (void)setParseHints:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_parseHints, 0);
  objc_storeStrong((id *)&self->_rootErrorGenerator, 0);
  objc_storeStrong((id *)&self->_rootElementGenerator, 0);
}

@end