@interface DKDAAPWriterContainer
- (DKDAAPWriterContainer)initWithCode:(unsigned int)a3;
- (NSMutableData)childData;
- (id)formattedOutputData;
- (unsigned)code;
- (void)setChildData:(id)a3;
@end

@implementation DKDAAPWriterContainer

- (void).cxx_destruct
{
}

- (void)setChildData:(id)a3
{
}

- (NSMutableData)childData
{
  return self->_childData;
}

- (unsigned)code
{
  return self->_code;
}

- (id)formattedOutputData
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF990];
  v4 = [(DKDAAPWriterContainer *)self childData];
  v5 = objc_msgSend(v3, "dataWithCapacity:", objc_msgSend(v4, "length") + 8);

  LODWORD(v9[0]) = bswap32([(DKDAAPWriterContainer *)self code]);
  v6 = [(DKDAAPWriterContainer *)self childData];
  HIDWORD(v9[0]) = bswap32([v6 length]);

  [v5 appendBytes:v9 length:8];
  v7 = [(DKDAAPWriterContainer *)self childData];
  [v5 appendData:v7];

  return v5;
}

- (DKDAAPWriterContainer)initWithCode:(unsigned int)a3
{
  v9.receiver = self;
  v9.super_class = (Class)DKDAAPWriterContainer;
  v4 = [(DKDAAPWriterContainer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_code = a3;
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    childData = v5->_childData;
    v5->_childData = v6;
  }
  return v5;
}

@end