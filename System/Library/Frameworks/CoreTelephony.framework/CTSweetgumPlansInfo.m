@interface CTSweetgumPlansInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumPlansInfo)init;
- (CTSweetgumPlansInfo)initWithCoder:(id)a3;
- (NSArray)planGroups;
- (NSString)morePlansURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMorePlansURL:(id)a3;
- (void)setPlanGroups:(id)a3;
@end

@implementation CTSweetgumPlansInfo

- (CTSweetgumPlansInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumPlansInfo;
  v2 = [(CTSweetgumPlansInfo *)&v6 init];
  v3 = v2;
  if (v2)
  {
    planGroups = v2->_planGroups;
    v2->_planGroups = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumPlansInfo *)self planGroups];
  [v3 appendFormat:@" planGroups=%@", v4];

  v5 = [(CTSweetgumPlansInfo *)self morePlansURL];
  [v3 appendFormat:@", morePlansURL=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6 = (CTSweetgumPlansInfo *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CTSweetgumPlansInfo *)self planGroups];
      v8 = [(CTSweetgumPlansInfo *)v6 planGroups];
      if (v7 == v8
        || ([(CTSweetgumPlansInfo *)self planGroups],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTSweetgumPlansInfo *)v6 planGroups],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToArray:v4]))
      {
        v10 = [(CTSweetgumPlansInfo *)self morePlansURL];
        v11 = [(CTSweetgumPlansInfo *)v6 morePlansURL];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTSweetgumPlansInfo *)self morePlansURL];
          v13 = [(CTSweetgumPlansInfo *)v6 morePlansURL];
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
  planGroups = self->_planGroups;
  id v5 = a3;
  [v5 encodeObject:planGroups forKey:@"planGroups"];
  [v5 encodeObject:self->_morePlansURL forKey:@"morePlansURL"];
}

- (CTSweetgumPlansInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSweetgumPlansInfo;
  id v5 = [(CTSweetgumPlansInfo *)&v14 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"planGroups"];
    planGroups = v5->_planGroups;
    v5->_planGroups = (NSArray *)v9;

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

- (NSArray)planGroups
{
  return self->_planGroups;
}

- (void)setPlanGroups:(id)a3
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

  objc_storeStrong((id *)&self->_planGroups, 0);
}

@end