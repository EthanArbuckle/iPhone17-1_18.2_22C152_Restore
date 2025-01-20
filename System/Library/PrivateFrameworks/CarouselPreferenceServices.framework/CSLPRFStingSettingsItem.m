@interface CSLPRFStingSettingsItem
- (CSLPRFStingSettingsItem)initWithIdentifier:(id)a3 title:(id)a4 actionType:(id)a5 assetName:(id)a6;
- (NSNumber)actionType;
- (NSString)assetName;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (unint64_t)linkActionType;
- (void)setActionType:(id)a3;
- (void)setAssetName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CSLPRFStingSettingsItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setActionType:(id)a3
{
}

- (NSNumber)actionType
{
  return self->_actionType;
}

- (void)setAssetName:(id)a3
{
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier" skipIfEmpty:0];
  [v3 appendString:self->_title withName:@"title" skipIfEmpty:0];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[NSNumber integerValue](self->_actionType, "integerValue"), @"actionType");
  [v3 appendString:self->_assetName withName:@"assetName" skipIfEmpty:0];
  v5 = [v3 build];

  return v5;
}

- (NSString)subtitle
{
  v3 = NSString;
  unint64_t v4 = [(CSLPRFStingSettingsItem *)self linkActionType];
  if (v4 - 1 > 0x28) {
    v5 = 0;
  }
  else {
    v5 = off_264A0AC28[v4 - 1];
  }
  v6 = v5;
  v7 = [v3 stringWithFormat:@"QUICK_SWITCH_SUBTITLE_%@", v6];

  unint64_t v8 = [(CSLPRFStingSettingsItem *)self linkActionType];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = v9;
  if (v8 == 29) {
    v11 = @"LocalizableSettings-Translate";
  }
  else {
    v11 = @"LocalizableSettings-N199";
  }
  v12 = [v9 localizedStringForKey:v7 value:&stru_26E2BF688 table:v11];

  return (NSString *)v12;
}

- (unint64_t)linkActionType
{
  return [(NSNumber *)self->_actionType integerValue];
}

- (CSLPRFStingSettingsItem)initWithIdentifier:(id)a3 title:(id)a4 actionType:(id)a5 assetName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSLPRFStingSettingsItem;
  v15 = [(CSLPRFStingSettingsItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_actionType, a5);
    objc_storeStrong((id *)&v16->_assetName, a6);
  }

  return v16;
}

@end