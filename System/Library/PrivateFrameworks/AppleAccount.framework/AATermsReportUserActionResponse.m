@interface AATermsReportUserActionResponse
- (AATermsReportUserActionResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSDictionary)responseParameters;
@end

@implementation AATermsReportUserActionResponse

- (AATermsReportUserActionResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AATermsReportUserActionResponse;
  v7 = [(AAResponse *)&v16 initWithHTTPResponse:a3 data:v6 bodyIsPlist:0];
  v8 = v7;
  if (v6 && v7 && [v6 length])
  {
    id v15 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v15];
    id v10 = v15;
    responseParameters = v8->_responseParameters;
    v8->_responseParameters = (NSDictionary *)v9;

    if (v10)
    {
      v12 = _AALogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
        *(_DWORD *)buf = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Error: Could not parse server response data: %@. Details: %@", buf, 0x16u);
      }
    }
  }
  return v8;
}

- (NSDictionary)responseParameters
{
  return self->_responseParameters;
}

- (void).cxx_destruct
{
}

@end