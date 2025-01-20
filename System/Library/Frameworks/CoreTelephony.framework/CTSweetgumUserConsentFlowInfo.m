@interface CTSweetgumUserConsentFlowInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumUserConsentFlowInfo)init;
- (CTSweetgumUserConsentFlowInfo)initWithCoder:(id)a3;
- (NSString)postData;
- (NSString)webURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPostData:(id)a3;
- (void)setWebURL:(id)a3;
@end

@implementation CTSweetgumUserConsentFlowInfo

- (CTSweetgumUserConsentFlowInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumUserConsentFlowInfo;
  v2 = [(CTSweetgumUserConsentFlowInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    webURL = v2->_webURL;
    v2->_webURL = 0;

    postData = v3->_postData;
    v3->_postData = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumUserConsentFlowInfo *)self webURL];
  [v3 appendFormat:@" URL=%@", v4];

  v5 = [(CTSweetgumUserConsentFlowInfo *)self postData];
  [v3 appendFormat:@" postData=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTSweetgumUserConsentFlowInfo *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(CTSweetgumUserConsentFlowInfo *)self webURL];
      v8 = [(CTSweetgumUserConsentFlowInfo *)v6 webURL];
      if (v7 == v8
        || ([(CTSweetgumUserConsentFlowInfo *)self webURL],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTSweetgumUserConsentFlowInfo *)v6 webURL],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToString:v4]))
      {
        v10 = [(CTSweetgumUserConsentFlowInfo *)self postData];
        v11 = [(CTSweetgumUserConsentFlowInfo *)v6 postData];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTSweetgumUserConsentFlowInfo *)self postData];
          v13 = [(CTSweetgumUserConsentFlowInfo *)v6 postData];
          char v9 = [v12 isEqualToString:v13];
        }
        if (v7 == v8) {
          goto LABEL_13;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    char v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  webURL = self->_webURL;
  id v5 = a3;
  [v5 encodeObject:webURL forKey:@"webURL"];
  [v5 encodeObject:self->_postData forKey:@"postData"];
}

- (CTSweetgumUserConsentFlowInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTSweetgumUserConsentFlowInfo;
  id v5 = [(CTSweetgumUserConsentFlowInfo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webURL"];
    webURL = v5->_webURL;
    v5->_webURL = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postData"];
    postData = v5->_postData;
    v5->_postData = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)webURL
{
  return self->_webURL;
}

- (void)setWebURL:(id)a3
{
}

- (NSString)postData
{
  return self->_postData;
}

- (void)setPostData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postData, 0);

  objc_storeStrong((id *)&self->_webURL, 0);
}

@end