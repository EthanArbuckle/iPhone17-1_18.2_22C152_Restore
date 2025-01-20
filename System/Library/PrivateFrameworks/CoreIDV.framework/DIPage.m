@interface DIPage
+ (BOOL)supportsSecureCoding;
- (DIPage)init;
- (DIPage)initWithAttributes:(id)a3 title:(id)a4 subTitle:(id)a5 page:(int64_t)a6;
- (DIPage)initWithCoder:(id)a3;
- (NSArray)attributes;
- (NSDictionary)serverValidationGroup;
- (NSString)subTitle;
- (NSString)title;
- (id)description;
- (unint64_t)page;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setPage:(unint64_t)a3;
- (void)setServerValidationGroup:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation DIPage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_attributes forKey:@"attributes"];
  [v5 encodeInteger:self->_page forKey:@"pageNumber"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subTitle forKey:@"subTitle"];

  os_unfair_lock_unlock(p_lock);
}

- (DIPage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(DIPage *)self init];
  if (v5)
  {
    v26 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v26, "setWithObjects:", v25, v24, v23, v22, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (NSArray *)v15;

    v5->_page = [v4 decodeIntegerForKey:@"pageNumber"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subTitle"];
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v19;
  }
  return v5;
}

- (DIPage)initWithAttributes:(id)a3 title:(id)a4 subTitle:(id)a5 page:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(DIPage *)self init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_attributes, a3);
    v15->_page = a6;
    objc_storeStrong((id *)&v15->_title, a4);
    objc_storeStrong((id *)&v15->_subTitle, a5);
  }

  return v15;
}

- (DIPage)init
{
  v3.receiver = self;
  v3.super_class = (Class)DIPage;
  result = [(DIPage *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setAttributes:(id)a3
{
  uint64_t v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_attributes != v6)
  {
    id v4 = (NSArray *)[(NSArray *)v6 copyWithZone:0];
    attributes = self->_attributes;
    self->_attributes = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPage:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_page = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setTitle:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_title != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    title = self->_title;
    self->_title = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setSubTitle:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_subTitle != v6)
  {
    id v4 = (NSString *)[(NSString *)v6 copyWithZone:0];
    subTitle = self->_subTitle;
    self->_subTitle = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setServerValidationGroup:(id)a3
{
  uint64_t v6 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_serverValidationGroup != v6)
  {
    id v4 = (NSDictionary *)[(NSDictionary *)v6 copyWithZone:0];
    serverValidationGroup = self->_serverValidationGroup;
    self->_serverValidationGroup = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)attributes
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_attributes;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)page
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t page = self->_page;
  os_unfair_lock_unlock(p_lock);
  return page;
}

- (NSString)title
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_title;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)subTitle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_subTitle;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDictionary)serverValidationGroup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_serverValidationGroup;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p;", objc_opt_class(), self];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v3, "appendFormat:", @"page: '%lu'; ", self->_page);
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"subTitle: '%@'; ", self->_subTitle];
  [v3 appendFormat:@"attributes: \n"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_attributes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 appendFormat:@"    attribute: '%@'\n", v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  [v3 appendFormat:@">"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverValidationGroup, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end