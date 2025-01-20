@interface ASDCreatePlaceholdersRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDCreatePlaceholdersRequestOptions)initWithApplicationMetadata:(id)a3;
- (ASDCreatePlaceholdersRequestOptions)initWithCoder:(id)a3;
- (BOOL)completeDataPromise;
- (BOOL)createAsMobileBackup;
- (NSArray)items;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompleteDataPromise:(BOOL)a3;
- (void)setCreateAsMobileBackup:(BOOL)a3;
@end

@implementation ASDCreatePlaceholdersRequestOptions

- (ASDCreatePlaceholdersRequestOptions)initWithApplicationMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDCreatePlaceholdersRequestOptions;
  v6 = [(ASDCreatePlaceholdersRequestOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[ASDCreatePlaceholdersRequestOptions allocWithZone:](ASDCreatePlaceholdersRequestOptions, "allocWithZone:") init];
  v5->_completeDataPromise = self->_completeDataPromise;
  v5->_createAsMobileBackup = self->_createAsMobileBackup;
  uint64_t v6 = [(NSArray *)self->_items copyWithZone:a3];
  items = v5->_items;
  v5->_items = (NSArray *)v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDCreatePlaceholdersRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDCreatePlaceholdersRequestOptions;
  id v5 = [(ASDRequestOptions *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"items"];
    items = v5->_items;
    v5->_items = (NSArray *)v9;

    v5->_completeDataPromise = [v4 decodeBoolForKey:@"completeDataPromise"];
    v5->_createAsMobileBackup = [v4 decodeBoolForKey:@"createAsMobileBackup"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ASDCreatePlaceholdersRequestOptions *)self items];
  [v5 encodeObject:v4 forKey:@"items"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ASDCreatePlaceholdersRequestOptions completeDataPromise](self, "completeDataPromise"), @"completeDataPromise");
  objc_msgSend(v5, "encodeBool:forKey:", -[ASDCreatePlaceholdersRequestOptions createAsMobileBackup](self, "createAsMobileBackup"), @"createAsMobileBackup");
}

- (BOOL)completeDataPromise
{
  return self->_completeDataPromise;
}

- (void)setCompleteDataPromise:(BOOL)a3
{
  self->_completeDataPromise = a3;
}

- (BOOL)createAsMobileBackup
{
  return self->_createAsMobileBackup;
}

- (void)setCreateAsMobileBackup:(BOOL)a3
{
  self->_createAsMobileBackup = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end