@interface CoreDAVGetToFileTask
- (BOOL)shouldLogResponseBody;
- (CoreDAVGetToFileTask)initWithURL:(id)a3 destinationFile:(id)a4;
- (NSFileHandle)destinationFile;
- (id)copyDefaultParserForContentType:(id)a3;
- (void)setDestinationFile:(id)a3;
@end

@implementation CoreDAVGetToFileTask

- (CoreDAVGetToFileTask)initWithURL:(id)a3 destinationFile:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVGetToFileTask;
  v8 = [(CoreDAVTask *)&v11 initWithURL:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_destinationFile, a4);
  }

  return v9;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  v4 = [CoreDAVOctetStreamToFileParser alloc];
  v5 = [(CoreDAVGetToFileTask *)self destinationFile];
  v6 = [(CoreDAVOctetStreamToFileParser *)v4 initWithFileHandle:v5];

  return v6;
}

- (BOOL)shouldLogResponseBody
{
  return 0;
}

- (NSFileHandle)destinationFile
{
  return self->_destinationFile;
}

- (void)setDestinationFile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end