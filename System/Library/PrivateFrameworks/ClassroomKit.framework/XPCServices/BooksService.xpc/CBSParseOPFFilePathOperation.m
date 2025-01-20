@interface CBSParseOPFFilePathOperation
- (BOOL)isAsynchronous;
- (CBSParseOPFFilePathOperation)initWithBookFilePath:(id)a3;
- (void)main;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
@end

@implementation CBSParseOPFFilePathOperation

- (CBSParseOPFFilePathOperation)initWithBookFilePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBSParseOPFFilePathOperation;
  v6 = [(CBSParseOPFFilePathOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mBookFilePath, a3);
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  id v9 = [(NSString *)self->mBookFilePath stringByAppendingPathComponent:@"META-INF/container.xml"];
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:v9 isDirectory:0];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSXMLParser);
    v6 = +[NSURL fileURLWithPath:v9];
    v7 = (NSXMLParser *)[v5 initWithContentsOfURL:v6];
    mContainerParser = self->mContainerParser;
    self->mContainerParser = v7;

    [(NSXMLParser *)self->mContainerParser setDelegate:self];
    [(NSXMLParser *)self->mContainerParser parse];
  }
  else
  {
    [(CBSParseOPFFilePathOperation *)self endOperationWithResultObject:0];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v18 = a3;
  id v10 = a7;
  if ([a4 isEqualToString:@"rootfile"])
  {
    uint64_t v11 = [v10 objectForKeyedSubscript:@"full-path"];
    if (v11)
    {
      v12 = (void *)v11;
      v13 = [v10 objectForKeyedSubscript:@"media-type"];
      unsigned int v14 = [v13 isEqualToString:@"application/oebps-package+xml"];

      if (v14)
      {
        mBookFilePath = self->mBookFilePath;
        v16 = [v10 objectForKeyedSubscript:@"full-path"];
        v17 = [(NSString *)mBookFilePath stringByAppendingPathComponent:v16];

        [(CBSParseOPFFilePathOperation *)self endOperationWithResultObject:v17];
        [v18 setDelegate:0];
        [v18 abortParsing];
      }
    }
  }
}

- (void)parserDidEndDocument:(id)a3
{
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBookFilePath, 0);

  objc_storeStrong((id *)&self->mContainerParser, 0);
}

@end