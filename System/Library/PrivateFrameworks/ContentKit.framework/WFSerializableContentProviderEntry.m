@interface WFSerializableContentProviderEntry
- (WFSerializableContentProviderEntry)initWithSerializedRepresentationBlock:(id)a3 deserializationBlock:(id)a4;
- (id)deserializationBlock;
- (id)serializationBlock;
@end

@implementation WFSerializableContentProviderEntry

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deserializationBlock, 0);
  objc_storeStrong(&self->_serializationBlock, 0);
}

- (id)deserializationBlock
{
  return self->_deserializationBlock;
}

- (id)serializationBlock
{
  return self->_serializationBlock;
}

- (WFSerializableContentProviderEntry)initWithSerializedRepresentationBlock:(id)a3 deserializationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFSerializableContentProviderEntry;
  v8 = [(WFSerializableContentProviderEntry *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id serializationBlock = v8->_serializationBlock;
    v8->_id serializationBlock = (id)v9;

    uint64_t v11 = [v7 copy];
    deid serializationBlock = v8->_deserializationBlock;
    v8->_deid serializationBlock = (id)v11;

    v13 = v8;
  }

  return v8;
}

@end