@interface FSFBMStringData
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (FSFBMStringData)initWithContent:(id)a3 dataVersion:(unsigned int)a4;
- (FSFBMStringData)initWithData:(id)a3 dataVersion:(unsigned int)a4;
- (id)content;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFBMStringData

- (FSFBMStringData)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v13.receiver = self;
    v13.super_class = (Class)FSFBMStringData;
    v7 = [(FSFBMStringData *)&v13 init];
    v8 = v7;
    if (v7)
    {
      v7->_dataVersion = a4;
      uint64_t v9 = [[NSString alloc] initWithData:v6 encoding:4];
      content = v8->_content;
      v8->_content = (NSString *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v11 = 0;
  }

  return v11;
}

- (FSFBMStringData)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSFBMStringData;
  v8 = [(FSFBMStringData *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_dataVersion = a4;
    objc_storeStrong((id *)&v8->_content, a3);
  }

  return v9;
}

- (id)content
{
  if (+[FSFUtils isSupportedPlatform])
  {
    v3 = self->_content;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v3 = 0;
  }

  return v3;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[FSFBMStringData alloc] initWithData:v5 dataVersion:v4];

  return v6;
}

- (id)serialize
{
  return [(NSString *)self->_content dataUsingEncoding:4];
}

- (void).cxx_destruct
{
}

@end