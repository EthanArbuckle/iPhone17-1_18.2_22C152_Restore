@interface CNEncodedFetchResponse
+ (BOOL)supportsSecureCoding;
+ (id)emptyResponse;
- (CNEncodedFetchResponse)initWithCoder:(id)a3;
- (NSData)data;
- (NSDictionary)matchInfo;
- (NSSet)identifierAccountingData;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setIdentifierAccountingData:(id)a3;
- (void)setMatchInfo:(id)a3;
@end

@implementation CNEncodedFetchResponse

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
}

- (void)setIdentifierAccountingData:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierAccountingData, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (NSSet)identifierAccountingData
{
  return self->_identifierAccountingData;
}

+ (id)emptyResponse
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  v3 = [MEMORY[0x1E4F1C9B8] data];
  [v2 setData:v3];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNEncodedFetchResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CNEncodedFetchResponse *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_data"];
    uint64_t v7 = [v6 copy];
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_matchInfo"];
    uint64_t v15 = [v14 copy];
    matchInfo = v5->_matchInfo;
    v5->_matchInfo = (NSDictionary *)v15;

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"_data"];
  [v5 encodeObject:self->_matchInfo forKey:@"_matchInfo"];
}

@end