@interface CRSIconLayoutPage
+ (BOOL)supportsSecureCoding;
- (CRSIconLayoutPage)initWithCoder:(id)a3;
- (CRSIconLayoutPage)initWithIcons:(id)a3;
- (NSArray)icons;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRSIconLayoutPage

- (CRSIconLayoutPage)initWithIcons:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSIconLayoutPage;
  v5 = [(CRSIconLayoutPage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    icons = v5->_icons;
    v5->_icons = (NSArray *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v9.receiver = self;
  v9.super_class = (Class)CRSIconLayoutPage;
  id v4 = [(CRSIconLayoutPage *)&v9 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(CRSIconLayoutPage *)self icons];
  v7 = [v6 componentsJoinedByString:@", "];
  [v5 appendFormat:@" %@", v7];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSIconLayoutPage)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRSIconLayoutPage;
  v5 = [(CRSIconLayoutPage *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CRSIconLayoutPageIcons"];
    icons = v5->_icons;
    v5->_icons = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSIconLayoutPage *)self icons];
  [v4 encodeObject:v5 forKey:@"CRSIconLayoutPageIcons"];
}

- (NSArray)icons
{
  return self->_icons;
}

- (void).cxx_destruct
{
}

@end