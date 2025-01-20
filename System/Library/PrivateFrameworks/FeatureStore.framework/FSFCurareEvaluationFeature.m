@interface FSFCurareEvaluationFeature
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (FSFCurareEvaluationFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4;
- (FSFCurareEvaluationFeature)initWithContentJson:(id)a3 dataVersion:(unsigned int)a4;
- (FSFCurareEvaluationFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4;
- (id)content;
- (id)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFCurareEvaluationFeature

- (FSFCurareEvaluationFeature)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FSFCurareEvaluationFeature;
  v7 = [(FSFCurareEvaluationFeature *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_dataVersion = a4;
    uint64_t v9 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:0];
    content = v8->_content;
    v8->_content = (NSDictionary *)v9;
  }
  return v8;
}

- (FSFCurareEvaluationFeature)initWithContent:(id)a3 dataVersion:(unsigned int)a4
{
  id v7 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v12.receiver = self;
    v12.super_class = (Class)FSFCurareEvaluationFeature;
    v8 = [(FSFCurareEvaluationFeature *)&v12 init];
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

- (FSFCurareEvaluationFeature)initWithContentJson:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (+[FSFUtils isSupportedPlatform])
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFCurareEvaluationFeature;
    id v7 = [(FSFCurareEvaluationFeature *)&v15 init];
    v8 = v7;
    if (v7)
    {
      v7->_dataVersion = a4;
      uint64_t v9 = (void *)MEMORY[0x263F08900];
      v10 = [v6 dataUsingEncoding:4];
      uint64_t v11 = [v9 JSONObjectWithData:v10 options:0 error:0];
      content = v8->_content;
      v8->_content = (NSDictionary *)v11;
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

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[FSFCurareEvaluationFeature alloc] initWithData:v5 dataVersion:v4];

  return v6;
}

- (id)serialize
{
  return (id)[MEMORY[0x263F08900] dataWithJSONObject:self->_content options:3 error:0];
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

- (id)json
{
  return (id)[MEMORY[0x263F08900] dataWithJSONObject:self->_content options:3 error:0];
}

- (id)interactionId
{
  return [(NSDictionary *)self->_content objectForKeyedSubscript:@"interactionId"];
}

- (void).cxx_destruct
{
}

@end