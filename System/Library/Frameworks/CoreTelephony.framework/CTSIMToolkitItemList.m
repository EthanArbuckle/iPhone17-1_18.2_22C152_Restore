@interface CTSIMToolkitItemList
+ (BOOL)supportsSecureCoding;
- (CTSIMToolkitItemList)initWithCoder:(id)a3;
- (NSArray)itemList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setItemList:(id)a3;
@end

@implementation CTSIMToolkitItemList

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSIMToolkitItemList *)self itemList];
  [v3 appendFormat:@", ItemCount=%lu", objc_msgSend(v4, "count")];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTSIMToolkitItemList *)self itemList];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setItemList:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTSIMToolkitItemList *)self itemList];
  [v4 encodeObject:v5 forKey:@"kItemListKey"];
}

- (CTSIMToolkitItemList)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTSIMToolkitItemList;
  id v5 = [(CTSIMToolkitItemList *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"kItemListKey"];
    itemList = v5->_itemList;
    v5->_itemList = (NSArray *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)itemList
{
  return self->_itemList;
}

- (void)setItemList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end