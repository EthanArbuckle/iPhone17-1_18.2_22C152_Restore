@interface CTCarrierSpacePlanGroupInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpacePlanGroupInfo)init;
- (CTCarrierSpacePlanGroupInfo)initWithCoder:(id)a3;
- (NSArray)groupOptionsList;
- (NSString)groupId;
- (id)description;
- (int64_t)planCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setGroupOptionsList:(id)a3;
- (void)setPlanCategory:(int64_t)a3;
@end

@implementation CTCarrierSpacePlanGroupInfo

- (CTCarrierSpacePlanGroupInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpacePlanGroupInfo;
  v2 = [(CTCarrierSpacePlanGroupInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    groupId = v2->_groupId;
    v2->_planCategory = 0;
    v2->_groupId = 0;

    groupOptionsList = v3->_groupOptionsList;
    v3->_groupOptionsList = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", planCategory=%s", CTCarrierSpacePlanCategoryAsString(-[CTCarrierSpacePlanGroupInfo planCategory](self, "planCategory"))];
  v4 = [(CTCarrierSpacePlanGroupInfo *)self groupId];
  [v3 appendFormat:@", groupId=%@", v4];

  v5 = [(CTCarrierSpacePlanGroupInfo *)self groupOptionsList];
  [v3 appendFormat:@", groupOptionsList=%@", v5];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCarrierSpacePlanGroupInfo *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(CTCarrierSpacePlanGroupInfo *)self planCategory],
          v5 == [(CTCarrierSpacePlanGroupInfo *)v4 planCategory]))
    {
      v6 = [(CTCarrierSpacePlanGroupInfo *)self groupOptionsList];
      objc_super v7 = [(CTCarrierSpacePlanGroupInfo *)v4 groupOptionsList];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(CTCarrierSpacePlanGroupInfo *)self groupOptionsList];
        v9 = [(CTCarrierSpacePlanGroupInfo *)v4 groupOptionsList];
        char v10 = [v8 isEqualToArray:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSString)groupId
{
  int64_t v2 = [(CTCarrierSpacePlanGroupInfo *)self planCategory];
  v3 = @"unknown";
  if (v2 == 3) {
    v3 = @"roaming-plans";
  }
  if (v2 == 1) {
    return (NSString *)@"domestic-plans";
  }
  else {
    return &v3->isa;
  }
}

- (void)encodeWithCoder:(id)a3
{
  int64_t planCategory = self->_planCategory;
  id v5 = a3;
  [v5 encodeInteger:planCategory forKey:@"planCategory"];
  [v5 encodeObject:self->_groupOptionsList forKey:@"groupOptionsList"];
}

- (CTCarrierSpacePlanGroupInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTCarrierSpacePlanGroupInfo;
  id v5 = [(CTCarrierSpacePlanGroupInfo *)&v12 init];
  if (v5)
  {
    v5->_int64_t planCategory = [v4 decodeIntegerForKey:@"planCategory"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"groupOptionsList"];
    groupOptionsList = v5->_groupOptionsList;
    v5->_groupOptionsList = (NSArray *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)planCategory
{
  return self->_planCategory;
}

- (void)setPlanCategory:(int64_t)a3
{
  self->_int64_t planCategory = a3;
}

- (void)setGroupId:(id)a3
{
}

- (NSArray)groupOptionsList
{
  return self->_groupOptionsList;
}

- (void)setGroupOptionsList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupOptionsList, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

@end