@interface FSFCurareInteractionAsJsonStr
+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5;
- (FSFCurareInteractionAsJsonStr)initWithJsonStr:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5;
- (NSString)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFCurareInteractionAsJsonStr

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (FSFCurareInteractionAsJsonStr)initWithJsonStr:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[FSFUtils isSupportedPlatform])
  {
    v16.receiver = self;
    v16.super_class = (Class)FSFCurareInteractionAsJsonStr;
    v10 = [(FSFCurareInteractionAsJsonStr *)&v16 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_interactionId, a4);
      uint64_t v12 = [v8 dataUsingEncoding:4];
      content = v11->_content;
      v11->_content = (NSData *)v12;

      v11->_dataVersion = a5;
    }
    self = v11;
    v14 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v14 = 0;
  }

  return v14;
}

- (id)json
{
  v2 = (void *)[[NSString alloc] initWithData:self->_content encoding:4];

  return v2;
}

- (id)serialize
{
  return self->_content;
}

+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v7 = (objc_class *)NSString;
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initWithData:v9 encoding:4];

  v11 = [[FSFCurareInteractionAsJsonStr alloc] initWithJsonStr:v10 interactionId:v8 dataVersion:v5];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionId, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end