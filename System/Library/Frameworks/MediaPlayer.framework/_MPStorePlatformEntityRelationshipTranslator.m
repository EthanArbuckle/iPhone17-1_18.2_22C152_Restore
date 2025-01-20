@interface _MPStorePlatformEntityRelationshipTranslator
- (_MPStorePlatformEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3 payloadTransformBlock:(id)a4;
- (id)payloadTransformBlock;
- (id)prepareSource:(id)a3 context:(id)a4;
@end

@implementation _MPStorePlatformEntityRelationshipTranslator

- (void).cxx_destruct
{
}

- (id)payloadTransformBlock
{
  return self->_payloadTransformBlock;
}

- (id)prepareSource:(id)a3 context:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionary];
  (*((void (**)(void))self->_payloadTransformBlock + 2))();

  return v9;
}

- (_MPStorePlatformEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3 payloadTransformBlock:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_MPStorePlatformEntityRelationshipTranslator;
  id v7 = [(_MPKeyPathEntityRelationshipTranslator *)&v11 initWithRelatedMPModelClass:a3];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x19971E0F0](v6);
    id payloadTransformBlock = v7->_payloadTransformBlock;
    v7->_id payloadTransformBlock = (id)v8;
  }
  return v7;
}

@end