@interface GDKTSSliceData
- (GDKTSContextRepresentationProtocol)context;
- (GDKTSDataAggregateRepresentation)data;
- (GDKTSQueryParams)parameters;
- (GDKTSSliceData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6;
- (GDKTSSliceData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 parameters:(id)a6;
- (NSString)description;
- (NSString)identifier;
@end

@implementation GDKTSSliceData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (GDKTSQueryParams)parameters
{
  return self->_parameters;
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
  v8 = objc_msgSend_parameters(self, v4, v5, v6, v7);
  v13 = objc_msgSend_identifier(self, v9, v10, v11, v12);
  v18 = objc_msgSend_data(self, v14, v15, v16, v17);
  v23 = objc_msgSend_context(self, v19, v20, v21, v22);
  v27 = objc_msgSend_initWithFormat_(v3, v24, @"GDKTSSliceData<parameters: %@, identifier: %@, data: %@, context: %@>", v25, v26, v8, v13, v18, v23);

  return (NSString *)v27;
}

- (GDKTSSliceData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)GDKTSSliceData;
  uint64_t v16 = [(GDKTSSliceData *)&v32 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v9, v12, v13, v14, v15);
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v23 = objc_msgSend_copy(v11, v19, v20, v21, v22);
    data = v16->_data;
    v16->_data = (GDKTSDataAggregateRepresentation *)v23;

    uint64_t v29 = objc_msgSend_copy(v10, v25, v26, v27, v28);
    context = v16->_context;
    v16->_context = (GDKTSContextRepresentationProtocol *)v29;
  }
  return v16;
}

- (GDKTSSliceData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 parameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)GDKTSSliceData;
  v18 = [(GDKTSSliceData *)&v40 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v13, v14, v15, v16, v17);
    parameters = v18->_parameters;
    v18->_parameters = (GDKTSQueryParams *)v19;

    uint64_t v25 = objc_msgSend_copy(v10, v21, v22, v23, v24);
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v25;

    uint64_t v31 = objc_msgSend_copy(v12, v27, v28, v29, v30);
    data = v18->_data;
    v18->_data = (GDKTSDataAggregateRepresentation *)v31;

    uint64_t v37 = objc_msgSend_copy(v11, v33, v34, v35, v36);
    context = v18->_context;
    v18->_context = (GDKTSContextRepresentationProtocol *)v37;
  }
  return v18;
}

@end