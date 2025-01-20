@interface SMSFilterExtensionParams
+ (BOOL)supportsSecureCoding;
- (NSString)filterModeStringValue;
- (NSString)folderName;
- (NSString)iconName;
- (NSString)label;
- (SMSFilterExtensionParams)init;
- (SMSFilterExtensionParams)initWithCoder:(id)a3;
- (unint64_t)action;
- (unint64_t)category;
- (unint64_t)filterMode;
- (unint64_t)orderOfPlacementInUI;
- (unint64_t)subAction;
- (unint64_t)subCategory;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(unint64_t)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setFilterMode:(unint64_t)a3;
- (void)setFilterModeStringValue:(id)a3;
- (void)setFolderName:(id)a3;
- (void)setIconName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setOrderOfPlacementInUI:(unint64_t)a3;
- (void)setSubAction:(unint64_t)a3;
- (void)setSubCategory:(unint64_t)a3;
@end

@implementation SMSFilterExtensionParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSFilterExtensionParams)init
{
  v3.receiver = self;
  v3.super_class = (Class)SMSFilterExtensionParams;
  return [(SMSFilterExtensionParams *)&v3 init];
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams action](self, "action"));
  [v5 encodeObject:v6 forKey:@"action"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams subAction](self, "subAction"));
  [v5 encodeObject:v7 forKey:@"subAction"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams filterMode](self, "filterMode"));
  [v5 encodeObject:v8 forKey:@"filterMode"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams orderOfPlacementInUI](self, "orderOfPlacementInUI"));
  [v5 encodeObject:v9 forKey:@"orderOfPlacementInUI"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams category](self, "category"));
  [v5 encodeObject:v10 forKey:@"category"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams subCategory](self, "subCategory"));
  [v5 encodeObject:v11 forKey:@"subCategory"];

  v12 = [(SMSFilterExtensionParams *)self filterModeStringValue];
  [v5 encodeObject:v12 forKey:@"filterModeStringValue"];

  v13 = [(SMSFilterExtensionParams *)self label];
  [v5 encodeObject:v13 forKey:@"label"];

  v14 = [(SMSFilterExtensionParams *)self iconName];
  [v5 encodeObject:v14 forKey:@"iconName"];

  id v15 = [(SMSFilterExtensionParams *)self folderName];
  [v5 encodeObject:v15 forKey:@"folderName"];
}

- (SMSFilterExtensionParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SMSFilterExtensionParams;
  id v5 = [(SMSFilterExtensionParams *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    -[SMSFilterExtensionParams setAction:](v5, "setAction:", [v6 unsignedIntegerValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subAction"];
    -[SMSFilterExtensionParams setSubAction:](v5, "setSubAction:", [v7 unsignedIntegerValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterMode"];
    -[SMSFilterExtensionParams setFilterMode:](v5, "setFilterMode:", [v8 unsignedIntegerValue]);

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orderOfPlacementInUI"];
    -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v5, "setOrderOfPlacementInUI:", [v9 unsignedIntegerValue]);

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    -[SMSFilterExtensionParams setCategory:](v5, "setCategory:", [v10 unsignedIntegerValue]);

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subCategory"];
    -[SMSFilterExtensionParams setSubCategory:](v5, "setSubCategory:", [v11 unsignedIntegerValue]);

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterModeStringValue"];
    [(SMSFilterExtensionParams *)v5 setFilterModeStringValue:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    [(SMSFilterExtensionParams *)v5 setLabel:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconName"];
    [(SMSFilterExtensionParams *)v5 setIconName:v14];

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"folderName"];
    [(SMSFilterExtensionParams *)v5 setFolderName:v15];
  }
  return v5;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (unint64_t)subAction
{
  return self->_subAction;
}

- (void)setSubAction:(unint64_t)a3
{
  self->_subAction = a3;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(unint64_t)a3
{
  self->_filterMode = a3;
}

- (unint64_t)orderOfPlacementInUI
{
  return self->_orderOfPlacementInUI;
}

- (void)setOrderOfPlacementInUI:(unint64_t)a3
{
  self->_orderOfPlacementInUI = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (unint64_t)subCategory
{
  return self->_subCategory;
}

- (void)setSubCategory:(unint64_t)a3
{
  self->_subCategory = a3;
}

- (NSString)filterModeStringValue
{
  return self->_filterModeStringValue;
}

- (void)setFilterModeStringValue:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_filterModeStringValue, 0);
}

@end