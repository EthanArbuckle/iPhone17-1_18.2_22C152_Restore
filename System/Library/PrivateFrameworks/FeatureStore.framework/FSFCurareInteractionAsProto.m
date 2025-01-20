@interface FSFCurareInteractionAsProto
+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5;
- (FSFCurareInteractionAsProto)initWithProto:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5;
- (FSFCurareInteractionAsProto)initWithProto:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5 jsonStr:(id)a6;
- (NSString)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation FSFCurareInteractionAsProto

- (FSFCurareInteractionAsProto)initWithProto:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  if (+[FSFUtils isSupportedPlatform])
  {
    v15.receiver = self;
    v15.super_class = (Class)FSFCurareInteractionAsProto;
    v11 = [(FSFCurareInteractionAsProto *)&v15 init];
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

- (FSFCurareInteractionAsProto)initWithProto:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5 jsonStr:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (+[FSFUtils isSupportedPlatform])
  {
    v18.receiver = self;
    v18.super_class = (Class)FSFCurareInteractionAsProto;
    v14 = [(FSFCurareInteractionAsProto *)&v18 init];
    objc_super v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_interactionId, a4);
      objc_storeStrong((id *)&v15->_content, a3);
      v15->_dataVersion = a5;
      objc_storeStrong((id *)&v15->_jsonStr, a6);
    }
    self = v15;
    v16 = self;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"This method is not implemented for the current platform"];
    v16 = 0;
  }

  return v16;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)interactionId
{
  return self->_interactionId;
}

+ (id)deserialize:(id)a3 dataVersion:(unsigned int)a4 interactionId:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[FSFCurareInteractionAsProto alloc] initWithProto:v8 interactionId:v7 dataVersion:v5];

  return v9;
}

- (id)json
{
  return self->_jsonStr;
}

- (id)serialize
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonStr, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end