@interface AMSMarketingItemActionComponent
- (AMSMarketingItemActionComponent)initWithDictionary:(id)a3;
- (NSDictionary)rawValues;
- (NSString)description;
- (NSURL)artworkURL;
@end

@implementation AMSMarketingItemActionComponent

- (AMSMarketingItemActionComponent)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMarketingItemActionComponent;
  v6 = [(AMSMarketingItemActionComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rawValues, a3);
  }

  return v7;
}

- (NSString)description
{
  v2 = [(AMSMarketingItemActionComponent *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FAF8];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSURL)artworkURL
{
  v2 = [(AMSMarketingItemActionComponent *)self rawValues];
  v3 = [v2 objectForKeyedSubscript:qword_1EDC7FB00];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      goto LABEL_6;
    }
  }
  else
  {

    id v4 = 0;
  }
  id v5 = 0;
LABEL_6:

  return (NSURL *)v5;
}

- (NSDictionary)rawValues
{
  return self->_rawValues;
}

- (void).cxx_destruct
{
}

@end