@interface HMDDataStreamPendingRequest
- (BOOL)isEqual:(id)a3;
- (HMDDataStreamPendingRequest)initWithIdentifier:(id)a3 protocol:(id)a4 topic:(id)a5 payload:(id)a6 callback:(id)a7;
- (NSDictionary)payload;
- (NSNumber)identifier;
- (NSString)protocol;
- (NSString)topic;
- (id)callback;
- (unint64_t)hash;
@end

@implementation HMDDataStreamPendingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (id)callback
{
  return self->_callback;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)topic
{
  return self->_topic;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  v2 = [(HMDDataStreamPendingRequest *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (HMDDataStreamPendingRequest *)v4;
    if (self == v5)
    {
      char v8 = 1;
    }
    else
    {
      v6 = [(HMDDataStreamPendingRequest *)self identifier];
      v7 = [(HMDDataStreamPendingRequest *)v5 identifier];
      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (HMDDataStreamPendingRequest)initWithIdentifier:(id)a3 protocol:(id)a4 topic:(id)a5 payload:(id)a6 callback:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDDataStreamPendingRequest;
  v17 = [(HMDDataStreamPendingRequest *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_protocol, a4);
    objc_storeStrong((id *)&v18->_topic, a5);
    objc_storeStrong((id *)&v18->_identifier, a3);
    v19 = _Block_copy(v16);
    id callback = v18->_callback;
    v18->_id callback = v19;

    objc_storeStrong((id *)&v18->_payload, a6);
  }

  return v18;
}

@end