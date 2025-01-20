@interface AMSChannelLinkParams
+ (BOOL)supportsSecureCoding;
+ (id)_queryDictionaryFromString:(id)a3;
- (AMSChannelLinkParams)initWithCoder:(id)a3;
- (AMSChannelLinkParams)initWithString:(id)a3;
- (NSDictionary)dictionary;
- (NSString)adamId;
- (NSString)linkParamsString;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AMSChannelLinkParams

- (AMSChannelLinkParams)initWithString:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSChannelLinkParams;
  v6 = [(AMSChannelLinkParams *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [(id)objc_opt_class() _queryDictionaryFromString:v5];
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

    objc_storeStrong((id *)&v6->_linkParamsString, a3);
  }

  return v6;
}

- (NSString)adamId
{
  v2 = [(AMSChannelLinkParams *)self dictionary];
  v3 = [v2 objectForKeyedSubscript:@"adamId"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

+ (id)_queryDictionaryFromString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setQuery:v3];
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = objc_msgSend(v4, "queryItems", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v11 value];
        v13 = [v11 name];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSChannelLinkParams *)self dictionary];
  [v4 encodeObject:v5 forKey:@"dictionary"];

  id v6 = [(AMSChannelLinkParams *)self linkParamsString];
  [v4 encodeObject:v6 forKey:@"linkParamsString"];
}

- (AMSChannelLinkParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSChannelLinkParams;
  id v5 = [(AMSChannelLinkParams *)&v12 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "ams_JSONClasses");
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkParamsString"];
    linkParamsString = v5->_linkParamsString;
    v5->_linkParamsString = (NSString *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSString)linkParamsString
{
  return self->_linkParamsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkParamsString, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end