@interface GDKTSSegmentData
- (GDEntityIdentifier)segmentEntityId;
- (GDKTSContextRepresentationProtocol)context;
- (GDKTSDataRepresentation)data;
- (GDKTSSegmentData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6;
- (NSString)description;
- (NSString)identifier;
- (NSString)segmentId;
@end

@implementation GDKTSSegmentData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentEntityId, 0);
  objc_storeStrong((id *)&self->_segmentId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (GDEntityIdentifier)segmentEntityId
{
  return self->_segmentEntityId;
}

- (NSString)segmentId
{
  return self->_segmentId;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (GDKTSContextRepresentationProtocol)context
{
  return self->_context;
}

- (GDKTSDataRepresentation)data
{
  return self->_data;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8 = objc_msgSend_segmentEntityId(self, v4, v5, v6, v7);
  v13 = objc_msgSend_segmentId(self, v9, v10, v11, v12);
  v18 = objc_msgSend_data(self, v14, v15, v16, v17);
  v23 = objc_msgSend_context(self, v19, v20, v21, v22);
  v27 = objc_msgSend_initWithFormat_(v3, v24, @"GDKTSSegmentData<segmentEntityId: %@, identifier: %@, data: %@, context: %@>", v25, v26, v8, v13, v18, v23);

  return (NSString *)v27;
}

- (GDKTSSegmentData)initWithIdentifier:(id)a3 context:(id)a4 data:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v51.receiver = self;
  v51.super_class = (Class)GDKTSSegmentData;
  v14 = [(GDKTSSegmentData *)&v51 init];
  if (v14)
  {
    uint64_t v15 = [GDEntityIdentifier alloc];
    uint64_t v19 = objc_msgSend_initWithString_(v15, v16, (uint64_t)v10, v17, v18);
    segmentEntityId = v14->_segmentEntityId;
    v14->_segmentEntityId = (GDEntityIdentifier *)v19;

    uint64_t v25 = objc_msgSend_copy(v10, v21, v22, v23, v24);
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v25;

    v31 = objc_msgSend_segmentId(v13, v27, v28, v29, v30);
    uint64_t v36 = objc_msgSend_copy(v31, v32, v33, v34, v35);
    segmentId = v14->_segmentId;
    v14->_segmentId = (NSString *)v36;

    uint64_t v42 = objc_msgSend_copy(v12, v38, v39, v40, v41);
    data = v14->_data;
    v14->_data = (GDKTSDataRepresentation *)v42;

    uint64_t v48 = objc_msgSend_copy(v11, v44, v45, v46, v47);
    context = v14->_context;
    v14->_context = (GDKTSContextRepresentationProtocol *)v48;
  }
  return v14;
}

@end