@interface FSFNluUserParseFeature
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (FSFNluUserParseFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4;
- (FSFNluUserParseFeature)initWithContentJson:(id)a3 dataVersion:(unsigned int)a4;
- (FSFNluUserParseFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4;
- (id)content;
- (id)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFNluUserParseFeature

- (id)interactionId
{
  return 0;
}

- (FSFNluUserParseFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSFNluUserParseFeature;
  v7 = [(FSFNluUserParseFeature *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_dataVersion = a4;
    uint64_t v9 = [objc_alloc(MEMORY[0x263F71D88]) initWithData:v6];
    content = v8->_content;
    v8->_content = (SIRINLUEXTERNALUserParse *)v9;
  }
  return v8;
}

- (FSFNluUserParseFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v12.receiver = self;
    v12.super_class = (Class)FSFNluUserParseFeature;
    v8 = [(FSFNluUserParseFeature *)&v12 init];
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

- (FSFNluUserParseFeature)initWithContentJson:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFNluUserParseFeature;
    id v7 = [(FSFNluUserParseFeature *)&v15 init];
    v8 = v7;
    if (v7)
    {
      v7->_dataVersion = a4;
      id v9 = objc_alloc(MEMORY[0x263F71D88]);
      v10 = [v6 dataUsingEncoding:4];
      uint64_t v11 = [v9 initWithData:v10];
      content = v8->_content;
      v8->_content = (SIRINLUEXTERNALUserParse *)v11;
    }
    self = v8;
    v13 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v13 = 0;
  }

  return v13;
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
  id v6 = [[FSFNluUserParseFeature alloc] initWithData:v5 dataVersion:v4];

  return v6;
}

- (id)serialize
{
  return (id)[(SIRINLUEXTERNALUserParse *)self->_content data];
}

- (id)json
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(SIRINLUEXTERNALUserParse *)self->_content dictionaryRepresentation];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:3 error:0];

  return v4;
}

- (void).cxx_destruct
{
}

@end