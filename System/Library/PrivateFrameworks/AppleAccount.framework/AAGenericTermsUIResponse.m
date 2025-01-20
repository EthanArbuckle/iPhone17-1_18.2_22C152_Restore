@interface AAGenericTermsUIResponse
- (AAGenericTermsUIResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSData)responseData;
- (NSDictionary)termsDictionary;
- (NSString)agreeURL;
@end

@implementation AAGenericTermsUIResponse

- (AAGenericTermsUIResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AAGenericTermsUIResponse;
  v8 = [(AAResponse *)&v20 initWithHTTPResponse:a3 data:v7 bodyIsPlist:1];
  v9 = v8;
  if (v8 && [(NSHTTPURLResponse *)v8->super._httpResponse statusCode] == 200)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_responseData, a4);
      uint64_t v10 = [(NSDictionary *)v9->super._responseDictionary objectForKey:@"terms"];
      responseTermsDictionary = v9->_responseTermsDictionary;
      v9->_responseTermsDictionary = (NSDictionary *)v10;

      uint64_t v12 = [(NSDictionary *)v9->super._responseDictionary objectForKey:@"agreeUrl"];
      responseAgreeURL = v9->_responseAgreeURL;
      v9->_responseAgreeURL = (NSString *)v12;

      v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        responseDictionary = v9->super._responseDictionary;
        *(_DWORD *)buf = 138412290;
        v22 = responseDictionary;
        v16 = "AAGenericTermsUIResponse _responseDictionary %@";
        v17 = v14;
        uint32_t v18 = 12;
LABEL_8:
        _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      v14 = _AALogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "ERROR: reponse data is nil";
        v17 = v14;
        uint32_t v18 = 2;
        goto LABEL_8;
      }
    }
  }
  return v9;
}

- (NSDictionary)termsDictionary
{
  return self->_responseTermsDictionary;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSString)agreeURL
{
  return self->_responseAgreeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_responseAgreeURL, 0);

  objc_storeStrong((id *)&self->_responseTermsDictionary, 0);
}

@end