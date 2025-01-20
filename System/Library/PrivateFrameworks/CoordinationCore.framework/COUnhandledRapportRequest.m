@interface COUnhandledRapportRequest
- (COMeshRequest)request;
- (COUnhandledRapportRequest)initWithRequest:(id)a3 identifier:(id)a4 data:(id)a5 options:(id)a6 handler:(id)a7 at:(unint64_t)a8;
- (NSDictionary)data;
- (NSDictionary)options;
- (NSString)identifier;
- (id)handler;
- (unint64_t)timestamp;
@end

@implementation COUnhandledRapportRequest

- (COUnhandledRapportRequest)initWithRequest:(id)a3 identifier:(id)a4 data:(id)a5 options:(id)a6 handler:(id)a7 at:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v31.receiver = self;
  v31.super_class = (Class)COUnhandledRapportRequest;
  v20 = [(COUnhandledRapportRequest *)&v31 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_request, a3);
    uint64_t v22 = [v16 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    data = v21->_data;
    v21->_data = (NSDictionary *)v24;

    uint64_t v26 = [v18 copy];
    options = v21->_options;
    v21->_options = (NSDictionary *)v26;

    uint64_t v28 = MEMORY[0x223C8B4A0](v19);
    id handler = v21->_handler;
    v21->_id handler = (id)v28;

    v21->_timestamp = a8;
  }

  return v21;
}

- (COMeshRequest)request
{
  return self->_request;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)data
{
  return self->_data;
}

- (NSDictionary)options
{
  return self->_options;
}

- (id)handler
{
  return self->_handler;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end