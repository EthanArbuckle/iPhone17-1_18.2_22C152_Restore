@interface CPInformationItem
+ (BOOL)supportsSecureCoding;
- (CPInformationItem)initWithCoder:(id)a3;
- (CPInformationItem)initWithTitle:(NSString *)title detail:(NSString *)detail;
- (NSString)detail;
- (NSString)title;
- (id)_init;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPInformationItem

- (CPInformationItem)initWithTitle:(NSString *)title detail:(NSString *)detail
{
  v6 = title;
  v7 = detail;
  v14.receiver = self;
  v14.super_class = (Class)CPInformationItem;
  v8 = [(CPInformationItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    v10 = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_detail;
    v8->_detail = (NSString *)v11;
  }
  return v8;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)CPInformationItem;
  return [(CPInformationItem *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPInformationItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPInformationItem *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPInformationItemTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPInformationItemDetailKey"];
    detail = v5->_detail;
    v5->_detail = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPInformationItem *)self title];
  [v4 encodeObject:v5 forKey:@"kCPInformationItemTitleKey"];

  id v6 = [(CPInformationItem *)self detail];
  [v4 encodeObject:v6 forKey:@"kCPInformationItemDetailKey"];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end