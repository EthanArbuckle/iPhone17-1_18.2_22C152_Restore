@interface AMSMediaVideo
- (AMSMediaVideo)initWithDictionary:(id)a3;
- (NSDictionary)videoDictionary;
- (NSURL)URL;
- (id)name;
@end

@implementation AMSMediaVideo

- (AMSMediaVideo)initWithDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMediaVideo;
  v6 = [(AMSMediaVideo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_videoDictionary, a3);
  }

  return v7;
}

- (id)name
{
  v2 = [(AMSMediaVideo *)self videoDictionary];
  v3 = [v2 objectForKeyedSubscript:@"name"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSURL)URL
{
  v2 = [(AMSMediaVideo *)self videoDictionary];
  v3 = [v2 objectForKeyedSubscript:@"video"];

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

- (NSDictionary)videoDictionary
{
  return self->_videoDictionary;
}

- (void).cxx_destruct
{
}

@end