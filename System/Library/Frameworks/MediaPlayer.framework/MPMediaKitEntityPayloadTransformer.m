@interface MPMediaKitEntityPayloadTransformer
- (MPMediaKitEntityPayloadTransformer)initWithType:(id)a3 transformedType:(id)a4;
- (NSDictionary)transformedPayload;
- (NSMutableDictionary)attributes;
- (NSMutableDictionary)meta;
- (NSMutableDictionary)relationships;
- (NSString)identifier;
- (NSString)transformedType;
- (NSString)type;
- (void)setIdentifier:(id)a3;
@end

@implementation MPMediaKitEntityPayloadTransformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_transformedType, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSMutableDictionary)relationships
{
  return self->_relationships;
}

- (NSString)transformedType
{
  return self->_transformedType;
}

- (NSMutableDictionary)meta
{
  return self->_meta;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (NSString)type
{
  return self->_type;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)transformedPayload
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  [v3 setObject:self->_identifier forKeyedSubscript:@"id"];
  [v3 setObject:self->_type forKeyedSubscript:@"type"];
  [v3 setObject:self->_transformedType forKeyedSubscript:@"_MPMKT_transformedType"];
  [v3 setObject:self->_attributes forKeyedSubscript:@"attributes"];
  [v3 setObject:self->_meta forKeyedSubscript:@"meta"];
  [v3 setObject:self->_relationships forKeyedSubscript:@"relationships"];

  return (NSDictionary *)v3;
}

- (MPMediaKitEntityPayloadTransformer)initWithType:(id)a3 transformedType:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MPMediaKitEntityTranslator.m", 79, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)MPMediaKitEntityPayloadTransformer;
  v10 = [(MPMediaKitEntityPayloadTransformer *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_type, a3);
    objc_storeStrong((id *)&v11->_transformedType, a4);
    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    attributes = v11->_attributes;
    v11->_attributes = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    meta = v11->_meta;
    v11->_meta = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    relationships = v11->_relationships;
    v11->_relationships = (NSMutableDictionary *)v16;
  }
  return v11;
}

@end