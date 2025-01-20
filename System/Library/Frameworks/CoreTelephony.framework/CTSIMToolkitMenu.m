@interface CTSIMToolkitMenu
+ (BOOL)supportsSecureCoding;
- (CTSIMToolkitMenu)initWithCoder:(id)a3;
- (NSArray)subTitles;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSubTitles:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CTSIMToolkitMenu

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSIMToolkitMenu *)self title];
  [v3 appendFormat:@", Title=%@", v4];

  v5 = [(CTSIMToolkitMenu *)self subTitles];
  [v3 appendFormat:@", SubTitlesCount=%lu", objc_msgSend(v5, "count")];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTSIMToolkitMenu *)self title];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setTitle:v7];

  v8 = [(CTSIMToolkitMenu *)self subTitles];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setSubTitles:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTSIMToolkitMenu *)self title];
  [v4 encodeObject:v5 forKey:@"kTitleKey"];

  id v6 = [(CTSIMToolkitMenu *)self subTitles];
  [v4 encodeObject:v6 forKey:@"kSubTitlesKey"];
}

- (CTSIMToolkitMenu)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSIMToolkitMenu;
  v5 = [(CTSIMToolkitMenu *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTitleKey"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"kSubTitlesKey"];
    subTitles = v5->_subTitles;
    v5->_subTitles = (NSArray *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)subTitles
{
  return self->_subTitles;
}

- (void)setSubTitles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitles, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end