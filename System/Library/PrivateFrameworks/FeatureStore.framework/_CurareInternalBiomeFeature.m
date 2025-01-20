@interface _CurareInternalBiomeFeature
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSDictionary)content;
- (_CurareInternalBiomeFeature)initWithCurareInteraction:(id)a3;
- (_CurareInternalBiomeFeature)initWithData:(id)a3;
- (id)interactionId;
- (id)json;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation _CurareInternalBiomeFeature

- (NSDictionary)content
{
  return (NSDictionary *)self->_content;
}

- (_CurareInternalBiomeFeature)initWithCurareInteraction:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_CurareInternalBiomeFeature;
  v5 = [(_CurareInternalBiomeFeature *)&v13 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    content = v5->_content;
    v5->_content = v6;

    v8 = v5->_content;
    v9 = [v4 interactionId];
    [(NSMutableDictionary *)v8 setObject:v9 forKey:@"interactionId"];

    v10 = [v4 serialize];
    v11 = +[FSFUtils getBase64EncodedStrFromData:v10];
    [(NSMutableDictionary *)v5->_content setObject:v11 forKey:@"feature"];
  }
  return v5;
}

- (_CurareInternalBiomeFeature)initWithData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CurareInternalBiomeFeature;
  v5 = [(_CurareInternalBiomeFeature *)&v11 init];
  if (v5)
  {
    id v10 = 0;
    uint64_t v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v10];
    id v7 = v10;
    content = v5->_content;
    v5->_content = (NSMutableDictionary *)v6;

    if (v7) {
      NSLog(&cfstr_ErrorWhileCrea.isa, v7);
    }
  }
  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4 = a3;
  v5 = [[_CurareInternalBiomeFeature alloc] initWithData:v4];

  return v5;
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

- (id)interactionId
{
  return (id)[(NSMutableDictionary *)self->_content objectForKeyedSubscript:@"interactionId"];
}

- (id)json
{
  content = self->_content;
  id v7 = 0;
  v3 = [MEMORY[0x263F08900] dataWithJSONObject:content options:3 error:&v7];
  id v4 = v7;
  v5 = v4;
  if (v4) {
    NSLog(&cfstr_ErrorWhileSeri.isa, v4);
  }

  return v3;
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (void).cxx_destruct
{
}

@end