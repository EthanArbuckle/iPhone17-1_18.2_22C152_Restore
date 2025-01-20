@interface AMSCarrierLinkResult
+ (BOOL)supportsSecureCoding;
- (AMSCarrierLinkParams)linkParams;
- (AMSCarrierLinkResult)initWithChannelLinkResult:(id)a3;
- (AMSCarrierLinkResult)initWithCoder:(id)a3;
- (AMSCarrierLinkResult)initWithLinkParams:(id)a3 channelCustomerId:(id)a4 productCode:(id)a5 statusCode:(id)a6 error:(id)a7;
- (AMSCarrierLinkResult)initWithResponse:(id)a3 linkParams:(id)a4;
- (NSDictionary)response;
- (NSError)error;
- (NSNumber)statusCode;
- (NSString)channelCustomerId;
- (NSString)productCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSCarrierLinkResult

- (AMSCarrierLinkResult)initWithResponse:(id)a3 linkParams:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)AMSCarrierLinkResult;
  v9 = [(AMSCarrierLinkResult *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_response, a3);
    v11 = [v7 objectForKeyedSubscript:@"channelCustomerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    channelCustomerId = v10->_channelCustomerId;
    v10->_channelCustomerId = v12;

    v14 = [v7 objectForKeyedSubscript:@"productCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    productCode = v10->_productCode;
    v10->_productCode = v15;

    v17 = [v7 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    statusCode = v10->_statusCode;
    v10->_statusCode = v18;

    objc_storeStrong((id *)&v10->_linkParams, a4);
    error = [v7 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = error;

      if (!v21)
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v22 = AMSError(12, @"Carrier link failure", v21, 0);
      error = v10->_error;
      v10->_error = (NSError *)v22;
    }
    else
    {
      id v21 = 0;
    }

    goto LABEL_16;
  }
LABEL_17:

  return v10;
}

- (AMSCarrierLinkResult)initWithChannelLinkResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 response];
  v6 = [AMSCarrierLinkParams alloc];
  id v7 = [v4 linkParams];

  id v8 = [v7 linkParamsString];
  v9 = [(AMSCarrierLinkParams *)v6 initWithString:v8];

  v10 = [(AMSCarrierLinkResult *)self initWithResponse:v5 linkParams:v9];
  return v10;
}

- (AMSCarrierLinkResult)initWithLinkParams:(id)a3 channelCustomerId:(id)a4 productCode:(id)a5 statusCode:(id)a6 error:(id)a7
{
  id v21 = a3;
  id v22 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)AMSCarrierLinkResult;
  v16 = [(AMSCarrierLinkResult *)&v23 init];
  if (v16)
  {
    v17 = (NSDictionary *)objc_opt_new();
    objc_storeStrong((id *)&v16->_channelCustomerId, a4);
    [(NSDictionary *)v17 setObject:v22, @"channelCustomerId", v21 forKeyedSubscript];
    objc_storeStrong((id *)&v16->_productCode, a5);
    [(NSDictionary *)v17 setObject:v13 forKeyedSubscript:@"productCode"];
    objc_storeStrong((id *)&v16->_statusCode, a6);
    [(NSDictionary *)v17 setObject:v14 forKeyedSubscript:@"status"];
    objc_storeStrong((id *)&v16->_linkParams, a3);
    objc_storeStrong((id *)&v16->_error, a7);
    v18 = [v15 localizedDescription];
    [(NSDictionary *)v17 setObject:v18 forKeyedSubscript:@"error"];

    response = v16->_response;
    v16->_response = v17;
  }
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSCarrierLinkResult *)self channelCustomerId];
  [v4 encodeObject:v5 forKey:@"channelCustomerId"];

  v6 = [(AMSCarrierLinkResult *)self error];
  [v4 encodeObject:v6 forKey:@"error"];

  id v7 = [(AMSCarrierLinkResult *)self linkParams];
  [v4 encodeObject:v7 forKey:@"linkParams"];

  id v8 = [(AMSCarrierLinkResult *)self productCode];
  [v4 encodeObject:v8 forKey:@"productCode"];

  v9 = [(AMSCarrierLinkResult *)self response];
  [v4 encodeObject:v9 forKey:@"response"];

  id v10 = [(AMSCarrierLinkResult *)self statusCode];
  [v4 encodeObject:v10 forKey:@"statusCode"];
}

- (AMSCarrierLinkResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSCarrierLinkResult;
  v5 = [(AMSCarrierLinkResult *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"channelCustomerId"];
    channelCustomerId = v5->_channelCustomerId;
    v5->_channelCustomerId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkParams"];
    linkParams = v5->_linkParams;
    v5->_linkParams = (AMSCarrierLinkParams *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productCode"];
    productCode = v5->_productCode;
    v5->_productCode = (NSString *)v12;

    id v14 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"response"];
    response = v5->_response;
    v5->_response = (NSDictionary *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusCode"];
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v17;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)channelCustomerId
{
  return self->_channelCustomerId;
}

- (AMSCarrierLinkParams)linkParams
{
  return self->_linkParams;
}

- (NSString)productCode
{
  return self->_productCode;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)response
{
  return self->_response;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
  objc_storeStrong((id *)&self->_channelCustomerId, 0);
}

@end