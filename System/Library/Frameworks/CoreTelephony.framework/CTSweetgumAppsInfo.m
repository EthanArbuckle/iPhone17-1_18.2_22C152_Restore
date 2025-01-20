@interface CTSweetgumAppsInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumAppsInfo)init;
- (CTSweetgumAppsInfo)initWithCoder:(id)a3;
- (NSArray)appsList;
- (NSString)appsURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppsList:(id)a3;
- (void)setAppsURL:(id)a3;
@end

@implementation CTSweetgumAppsInfo

- (CTSweetgumAppsInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTSweetgumAppsInfo;
  v2 = [(CTSweetgumAppsInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    appsList = v2->_appsList;
    v2->_appsList = 0;

    appsURL = v3->_appsURL;
    v3->_appsURL = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumAppsInfo *)self appsList];
  [v3 appendFormat:@" appIdList=%@", v4];

  v5 = [(CTSweetgumAppsInfo *)self appsURL];
  [v3 appendFormat:@" appsURL=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTSweetgumAppsInfo *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = [(CTSweetgumAppsInfo *)self appsList];
      v8 = [(CTSweetgumAppsInfo *)v6 appsList];
      if (v7 == v8
        || ([(CTSweetgumAppsInfo *)self appsList],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTSweetgumAppsInfo *)v6 appsList],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToArray:v4]))
      {
        v10 = [(CTSweetgumAppsInfo *)self appsURL];
        v11 = [(CTSweetgumAppsInfo *)v6 appsURL];
        if (v10 == v11)
        {
          char v9 = 1;
        }
        else
        {
          v12 = [(CTSweetgumAppsInfo *)self appsURL];
          v13 = [(CTSweetgumAppsInfo *)v6 appsURL];
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
  appsList = self->_appsList;
  id v5 = a3;
  [v5 encodeObject:appsList forKey:@"appsList"];
  [v5 encodeObject:self->_appsURL forKey:@"appsURL"];
}

- (CTSweetgumAppsInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSweetgumAppsInfo;
  id v5 = [(CTSweetgumAppsInfo *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"appsList"];
    appsList = v5->_appsList;
    v5->_appsList = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appsURL"];
    appsURL = v5->_appsURL;
    v5->_appsURL = (NSString *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)appsList
{
  return self->_appsList;
}

- (void)setAppsList:(id)a3
{
}

- (NSString)appsURL
{
  return self->_appsURL;
}

- (void)setAppsURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsURL, 0);

  objc_storeStrong((id *)&self->_appsList, 0);
}

@end