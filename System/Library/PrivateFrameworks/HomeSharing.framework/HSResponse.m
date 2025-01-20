@interface HSResponse
+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7;
+ (id)responseWithResponse:(id)a3;
- (HSResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7;
- (NSData)responseData;
- (NSDictionary)responseHeaderFields;
- (NSError)error;
- (NSString)MIMEType;
- (NSURL)responseDataFileURL;
- (id)description;
- (unint64_t)responseCode;
- (void)setResponseDataFileURL:(id)a3;
@end

@implementation HSResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseDataFileURL, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_responseHeaderFields, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
}

- (NSError)error
{
  return self->_error;
}

- (void)setResponseDataFileURL:(id)a3
{
}

- (NSURL)responseDataFileURL
{
  return self->_responseDataFileURL;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSDictionary)responseHeaderFields
{
  return self->_responseHeaderFields;
}

- (unint64_t)responseCode
{
  return self->_responseCode;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)HSResponse;
  v3 = [(HSResponse *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" [%ld]: %ld bytes (%@)\n%@", self->_responseCode, -[NSData length](self->_responseData, "length"), self->_MIMEType, self->_responseHeaderFields];

  return v4;
}

- (HSResponse)initWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HSResponse;
  v16 = [(HSResponse *)&v25 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_error, a7);
    uint64_t v18 = [v14 copy];
    MIMEType = v17->_MIMEType;
    v17->_MIMEType = (NSString *)v18;

    v17->_responseCode = a3;
    uint64_t v20 = [v13 copy];
    responseData = v17->_responseData;
    v17->_responseData = (NSData *)v20;

    uint64_t v22 = [v12 copy];
    responseHeaderFields = v17->_responseHeaderFields;
    v17->_responseHeaderFields = (NSDictionary *)v22;
  }
  return v17;
}

+ (id)responseWithResponse:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [v3 responseCode];
  objc_super v6 = [v3 responseHeaderFields];
  v7 = [v3 responseData];
  v8 = [v3 MIMEType];
  v9 = [v3 error];

  v10 = (void *)[v4 initWithCode:v5 headerFields:v6 data:v7 MIMEType:v8 error:v9];
  return v10;
}

+ (id)responseWithCode:(unint64_t)a3 headerFields:(id)a4 data:(id)a5 MIMEType:(id)a6 error:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCode:a3 headerFields:v14 data:v13 MIMEType:v12 error:v11];

  return v15;
}

@end