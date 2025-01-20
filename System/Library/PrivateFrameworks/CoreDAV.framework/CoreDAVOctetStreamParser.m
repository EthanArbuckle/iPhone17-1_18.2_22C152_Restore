@interface CoreDAVOctetStreamParser
+ (BOOL)canHandleContentType:(id)a3;
- (BOOL)processData:(id)a3 forTask:(id)a4;
- (CoreDAVOctetStreamParser)init;
- (NSError)parserError;
- (NSMutableData)octetStreamData;
- (NSString)description;
- (void)setOctetStreamData:(id)a3;
@end

@implementation CoreDAVOctetStreamParser

- (CoreDAVOctetStreamParser)init
{
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVOctetStreamParser;
  v2 = [(CoreDAVOctetStreamParser *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    octetStreamData = v2->_octetStreamData;
    v2->_octetStreamData = v3;

    parserError = v2->_parserError;
    v2->_parserError = 0;
  }
  return v2;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)CoreDAVOctetStreamParser;
  v2 = [(CoreDAVOctetStreamParser *)&v4 description];
  return (NSString *)v2;
}

- (BOOL)processData:(id)a3 forTask:(id)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = [(CoreDAVOctetStreamParser *)self octetStreamData];
    [v6 appendData:v5];
  }
  return 1;
}

- (NSError)parserError
{
  return self->_parserError;
}

+ (BOOL)canHandleContentType:(id)a3
{
  return 1;
}

- (NSMutableData)octetStreamData
{
  return self->_octetStreamData;
}

- (void)setOctetStreamData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_octetStreamData, 0);
}

@end