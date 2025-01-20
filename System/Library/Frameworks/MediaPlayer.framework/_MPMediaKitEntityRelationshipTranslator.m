@interface _MPMediaKitEntityRelationshipTranslator
- (NSString)mediaKitType;
- (_MPMediaKitEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3 mediaKitType:(id)a4 payloadTransformBlock:(id)a5;
- (id)payloadTransformBlock;
- (id)prepareSource:(id)a3 context:(id)a4;
- (void)setMediaKitType:(id)a3;
@end

@implementation _MPMediaKitEntityRelationshipTranslator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payloadTransformBlock, 0);

  objc_storeStrong((id *)&self->_mediaKitType, 0);
}

- (id)payloadTransformBlock
{
  return self->_payloadTransformBlock;
}

- (void)setMediaKitType:(id)a3
{
}

- (NSString)mediaKitType
{
  return self->_mediaKitType;
}

- (id)prepareSource:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"relationships"];
  v9 = [v8 objectForKeyedSubscript:self->_mediaKitType];
  v10 = [v9 objectForKeyedSubscript:@"data"];

  if ([v10 count] != 1) {
    goto LABEL_4;
  }
  uint64_t v11 = [v10 firstObject];
  if (!v11) {
    goto LABEL_4;
  }
  v12 = (void *)v11;
  v13 = +[MPBaseEntityTranslator translatorForMPModelClass:[(_MPKeyPathEntityRelationshipTranslator *)self relatedMPModelClass]];
  v14 = [v13 identifiersForPayload:v12 context:v7];
  v15 = [v7 relationshipPayloadProvider];
  v16 = [v15 payloadForRelatedEntityWithIdentifierSet:v14];

  if (!v16)
  {
LABEL_4:
    v17 = [MPMediaKitEntityPayloadTransformer alloc];
    mediaKitType = self->_mediaKitType;
    v19 = [v6 objectForKeyedSubscript:@"_MPMKT_transformedType"];
    if (v19)
    {
      v20 = [(MPMediaKitEntityPayloadTransformer *)v17 initWithType:mediaKitType transformedType:v19];
    }
    else
    {
      v21 = [v6 objectForKeyedSubscript:@"type"];
      v20 = [(MPMediaKitEntityPayloadTransformer *)v17 initWithType:mediaKitType transformedType:v21];
    }
    (*((void (**)(void))self->_payloadTransformBlock + 2))();
    v16 = [(MPMediaKitEntityPayloadTransformer *)v20 transformedPayload];
  }

  return v16;
}

- (_MPMediaKitEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3 mediaKitType:(id)a4 payloadTransformBlock:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_MPMediaKitEntityRelationshipTranslator;
  uint64_t v11 = [(_MPKeyPathEntityRelationshipTranslator *)&v16 initWithRelatedMPModelClass:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaKitType, a4);
    uint64_t v13 = MEMORY[0x19971E0F0](v10);
    id payloadTransformBlock = v12->_payloadTransformBlock;
    v12->_id payloadTransformBlock = (id)v13;
  }
  return v12;
}

@end