@interface CTCarrierSpacePlansInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpacePlansInfo)init;
- (CTCarrierSpacePlansInfo)initWithCoder:(id)a3;
- (NSArray)planGroupsList;
- (NSString)morePlansURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMorePlansURL:(id)a3;
- (void)setPlanGroupsList:(id)a3;
@end

@implementation CTCarrierSpacePlansInfo

- (CTCarrierSpacePlansInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTCarrierSpacePlansInfo;
  v2 = [(CTCarrierSpacePlansInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    planGroupsList = v2->_planGroupsList;
    v2->_planGroupsList = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpacePlansInfo *)self planGroupsList];
  [v3 appendFormat:@" planGroupsList=%@", v4];

  v5 = [(CTCarrierSpacePlansInfo *)self morePlansURL];
  [v3 appendFormat:@", morePlansURL=%@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6 = (CTCarrierSpacePlansInfo *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CTCarrierSpacePlansInfo *)self planGroupsList];
      v8 = [(CTCarrierSpacePlansInfo *)v6 planGroupsList];
      if (v7 == v8
        || ([(CTCarrierSpacePlansInfo *)self planGroupsList],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTCarrierSpacePlansInfo *)v6 planGroupsList],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToArray:v4]))
      {
        v10 = [(CTCarrierSpacePlansInfo *)self morePlansURL];
        v11 = [(CTCarrierSpacePlansInfo *)v6 morePlansURL];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTCarrierSpacePlansInfo *)self morePlansURL];
          v13 = [(CTCarrierSpacePlansInfo *)v6 morePlansURL];
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
  planGroupsList = self->_planGroupsList;
  id v5 = a3;
  [v5 encodeObject:planGroupsList forKey:@"planGroupsList"];
  [v5 encodeObject:self->_morePlansURL forKey:@"morePlansURL"];
}

- (CTCarrierSpacePlansInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTCarrierSpacePlansInfo;
  id v5 = [(CTCarrierSpacePlansInfo *)&v14 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"planGroupsList"];
    planGroupsList = v5->_planGroupsList;
    v5->_planGroupsList = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"morePlansURL"];
    morePlansURL = v5->_morePlansURL;
    v5->_morePlansURL = (NSString *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)planGroupsList
{
  return self->_planGroupsList;
}

- (void)setPlanGroupsList:(id)a3
{
}

- (NSString)morePlansURL
{
  return self->_morePlansURL;
}

- (void)setMorePlansURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morePlansURL, 0);
  objc_storeStrong((id *)&self->_planGroupsList, 0);
}

@end