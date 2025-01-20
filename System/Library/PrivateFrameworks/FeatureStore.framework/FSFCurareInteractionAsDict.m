@interface FSFCurareInteractionAsDict
+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5;
- (FSFCurareInteractionAsDict)initWithContent:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5;
- (FSFCurareInteractionAsDict)initWithData:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5;
- (NSString)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFCurareInteractionAsDict

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (FSFCurareInteractionAsDict)initWithContent:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  if (+[FSFUtils isSupportedPlatform])
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFCurareInteractionAsDict;
    v11 = [(FSFCurareInteractionAsDict *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_interactionId, a4);
      objc_storeStrong((id *)&v12->_content, a3);
      v12->_dataVersion = a5;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v13 = 0;
  }

  return v13;
}

- (id)json
{
  v2 = [(FSFCurareInteractionAsDict *)self serialize];
  if (v2) {
    v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)serialize
{
  content = self->_content;
  id v7 = 0;
  v3 = [MEMORY[0x263F08900] dataWithJSONObject:content options:2 error:&v7];
  id v4 = v7;
  v5 = v4;
  if (v4) {
    NSLog(&cfstr_ErrorWhileSeri.isa, v4);
  }

  return v3;
}

- (FSFCurareInteractionAsDict)initWithData:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FSFCurareInteractionAsDict;
  id v10 = [(FSFCurareInteractionAsDict *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_dataVersion = a4;
    id v16 = 0;
    uint64_t v12 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v16];
    id v13 = v16;
    content = v11->_content;
    v11->_content = (NSDictionary *)v12;

    if (v13) {
      NSLog(&cfstr_ErrorWhileCrea_0.isa, v13);
    }
    objc_storeStrong((id *)&v11->_interactionId, a5);
  }
  return v11;
}

+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[FSFCurareInteractionAsDict alloc] initWithData:v8 dataVersion:v5 interactionId:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionId, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end