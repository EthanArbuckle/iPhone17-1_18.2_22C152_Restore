@interface GDKTSData
- (GDEntityIdentifier)tripEntityId;
- (GDKTSContextRepresentationProtocol)context;
- (GDKTSData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6;
- (GDKTSDataAggregateRepresentation)data;
- (NSString)description;
- (NSString)identifier;
@end

@implementation GDKTSData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripEntityId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (GDEntityIdentifier)tripEntityId
{
  return self->_tripEntityId;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (GDKTSContextRepresentationProtocol)context
{
  return self->_context;
}

- (GDKTSDataAggregateRepresentation)data
{
  return self->_data;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_tripEntityId(self, v4, v5, v6, v7);
  v13 = objc_msgSend_identifier(self, v9, v10, v11, v12);
  v18 = objc_msgSend_data(self, v14, v15, v16, v17);
  v23 = objc_msgSend_context(self, v19, v20, v21, v22);
  v27 = objc_msgSend_initWithFormat_(v3, v24, @"GDKTSData<tripEntityId: %@, identifier: %@, data: %@, context: %@>", v25, v26, v8, v13, v18, v23);

  return (NSString *)v27;
}

- (GDKTSData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)GDKTSData;
  uint64_t v12 = [(GDKTSData *)&v38 init];
  if (v12)
  {
    v13 = [GDEntityIdentifier alloc];
    uint64_t v17 = objc_msgSend_initWithString_(v13, v14, (uint64_t)v9, v15, v16);
    tripEntityId = v12->_tripEntityId;
    v12->_tripEntityId = (GDEntityIdentifier *)v17;

    uint64_t v23 = objc_msgSend_copy(v9, v19, v20, v21, v22);
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v23;

    uint64_t v29 = objc_msgSend_copy(v11, v25, v26, v27, v28);
    data = v12->_data;
    v12->_data = (GDKTSDataAggregateRepresentation *)v29;

    uint64_t v35 = objc_msgSend_copy(v10, v31, v32, v33, v34);
    context = v12->_context;
    v12->_context = (GDKTSContextRepresentationProtocol *)v35;
  }
  return v12;
}

@end