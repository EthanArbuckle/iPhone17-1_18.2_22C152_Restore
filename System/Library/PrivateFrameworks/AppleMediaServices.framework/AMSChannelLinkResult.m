@interface AMSChannelLinkResult
+ (BOOL)supportsSecureCoding;
- (AMSChannelLinkParams)linkParams;
- (AMSChannelLinkResult)initWithCoder:(id)a3;
- (AMSChannelLinkResult)initWithResponse:(id)a3 linkParams:(id)a4;
- (AMSChannelLinkResult)initWithResponse:(id)a3 linkParams:(id)a4 supplementaryFields:(id)a5;
- (NSDictionary)response;
- (NSError)error;
- (NSNumber)statusCode;
- (NSSet)postLinkingFields;
- (NSSet)supplementaryFields;
- (NSString)channelCustomerId;
- (NSString)productCode;
- (NSString)subscriptionId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSChannelLinkResult

- (AMSChannelLinkResult)initWithResponse:(id)a3 linkParams:(id)a4
{
  return [(AMSChannelLinkResult *)self initWithResponse:a3 linkParams:a4 supplementaryFields:0];
}

- (AMSChannelLinkResult)initWithResponse:(id)a3 linkParams:(id)a4 supplementaryFields:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AMSChannelLinkResult;
  v12 = [(AMSChannelLinkResult *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_response, a3);
    v14 = [v9 objectForKeyedSubscript:@"channelCustomerId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }

    channelCustomerId = v13->_channelCustomerId;
    v13->_channelCustomerId = v15;

    v17 = [v9 objectForKeyedSubscript:@"productCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }

    productCode = v13->_productCode;
    v13->_productCode = v18;

    v20 = [v9 objectForKeyedSubscript:@"status"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }

    statusCode = v13->_statusCode;
    v13->_statusCode = v21;

    v23 = [v9 objectForKeyedSubscript:@"subId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }

    subscriptionId = v13->_subscriptionId;
    v13->_subscriptionId = v24;

    objc_storeStrong((id *)&v13->_linkParams, a4);
    objc_storeStrong((id *)&v13->_supplementaryFields, a5);
    postLinkingFields = [v9 objectForKeyedSubscript:@"postLinkingFields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = postLinkingFields;

      if (!v27) {
        goto LABEL_19;
      }
      uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v27];
      postLinkingFields = v13->_postLinkingFields;
      v13->_postLinkingFields = (NSSet *)v28;
    }
    else
    {
      id v27 = 0;
    }

LABEL_19:
    error = [v9 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v30 = error;

      if (!v30)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v31 = AMSError(12, @"Channel link failure", v30, 0);
      error = v13->_error;
      v13->_error = (NSError *)v31;
    }
    else
    {
      id v30 = 0;
    }

    goto LABEL_24;
  }
LABEL_25:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSChannelLinkResult *)self channelCustomerId];
  [v4 encodeObject:v5 forKey:@"channelCustomerId"];

  v6 = [(AMSChannelLinkResult *)self error];
  [v4 encodeObject:v6 forKey:@"error"];

  v7 = [(AMSChannelLinkResult *)self linkParams];
  [v4 encodeObject:v7 forKey:@"linkParams"];

  v8 = [(AMSChannelLinkResult *)self postLinkingFields];
  [v4 encodeObject:v8 forKey:@"postLinkingFields"];

  id v9 = [(AMSChannelLinkResult *)self productCode];
  [v4 encodeObject:v9 forKey:@"productCode"];

  id v10 = [(AMSChannelLinkResult *)self response];
  [v4 encodeObject:v10 forKey:@"response"];

  id v11 = [(AMSChannelLinkResult *)self statusCode];
  [v4 encodeObject:v11 forKey:@"statusCode"];

  id v12 = [(AMSChannelLinkResult *)self subscriptionId];
  [v4 encodeObject:v12 forKey:@"subscriptionId"];
}

- (AMSChannelLinkResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AMSChannelLinkResult;
  v5 = [(AMSChannelLinkResult *)&v27 init];
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
    v5->_linkParams = (AMSChannelLinkParams *)v10;

    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"postLinkingFields"];
    postLinkingFields = v5->_postLinkingFields;
    v5->_postLinkingFields = (NSSet *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productCode"];
    productCode = v5->_productCode;
    v5->_productCode = (NSString *)v17;

    v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"response"];
    response = v5->_response;
    v5->_response = (NSDictionary *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusCode"];
    statusCode = v5->_statusCode;
    v5->_statusCode = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionId"];
    subscriptionId = v5->_subscriptionId;
    v5->_subscriptionId = (NSString *)v24;
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

- (AMSChannelLinkParams)linkParams
{
  return self->_linkParams;
}

- (NSString)productCode
{
  return self->_productCode;
}

- (NSSet)postLinkingFields
{
  return self->_postLinkingFields;
}

- (NSString)subscriptionId
{
  return self->_subscriptionId;
}

- (NSSet)supplementaryFields
{
  return self->_supplementaryFields;
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
  objc_storeStrong((id *)&self->_supplementaryFields, 0);
  objc_storeStrong((id *)&self->_subscriptionId, 0);
  objc_storeStrong((id *)&self->_postLinkingFields, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
  objc_storeStrong((id *)&self->_channelCustomerId, 0);
}

@end