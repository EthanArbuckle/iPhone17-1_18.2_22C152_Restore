@interface HMDSettingValueSelectionItem
- (BOOL)isEqual:(id)a3;
- (HMDSettingValueSelectionItem)initWithIdentifier:(id)a3 selection:(id)a4;
- (NSString)selection;
- (NSUUID)identifier;
- (unint64_t)hash;
@end

@implementation HMDSettingValueSelectionItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)selection
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDSettingValueSelectionItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDSettingValueSelectionItem *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDSettingValueSelectionItem *)self identifier];
      v8 = [(HMDSettingValueSelectionItem *)v6 identifier];
      if ([v7 isEqual:v8])
      {
        v9 = [(HMDSettingValueSelectionItem *)self selection];
        v10 = [(HMDSettingValueSelectionItem *)v6 selection];
        char v11 = [v9 isEqualToString:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (HMDSettingValueSelectionItem)initWithIdentifier:(id)a3 selection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSettingValueSelectionItem;
  v9 = [(HMDSettingValueSelectionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_selection, a4);
  }

  return v10;
}

@end