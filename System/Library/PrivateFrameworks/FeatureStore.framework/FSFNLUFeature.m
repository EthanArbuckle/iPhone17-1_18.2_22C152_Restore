@interface FSFNLUFeature
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (FSFNLUFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4;
- (FSFNLUFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4;
- (id)content;
- (id)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFNLUFeature

- (FSFNLUFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSFNLUFeature;
  v7 = [(FSFNLUFeature *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_dataVersion = a4;
    uint64_t v9 = [[NSString alloc] initWithData:v6 encoding:4];
    content = v8->_content;
    v8->_content = (NSString *)v9;
  }
  return v8;
}

- (FSFNLUFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v12.receiver = self;
    v12.super_class = (Class)FSFNLUFeature;
    v8 = [(FSFNLUFeature *)&v12 init];
    uint64_t v9 = v8;
    if (v8)
    {
      v8->_dataVersion = a4;
      objc_storeStrong((id *)&v8->_content, a3);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v10 = 0;
  }

  return v10;
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
  id v6 = [[FSFNLUFeature alloc] initWithData:v5 dataVersion:v4];

  return v6;
}

- (id)serialize
{
  return [(NSString *)self->_content dataUsingEncoding:4];
}

- (id)json
{
  return [(NSString *)self->_content dataUsingEncoding:4];
}

- (id)interactionId
{
  v2 = [(NSString *)self->_content dataUsingEncoding:4];
  v3 = [MEMORY[0x263F08900] JSONObjectWithData:v2 options:0 error:0];
  uint64_t v4 = [v3 objectForKey:@"interactionId"];

  return v4;
}

- (void).cxx_destruct
{
}

@end