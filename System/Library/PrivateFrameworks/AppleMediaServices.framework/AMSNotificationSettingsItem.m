@interface AMSNotificationSettingsItem
- (AMSNotificationSettingsItem)initWithDictionaryRepresentation:(id)a3;
- (AMSNotificationSettingsItem)initWithTitle:(id)a3 description:(id)a4 identifier:(id)a5 enabled:(BOOL)a6;
- (BOOL)isEnabled;
- (BOOL)userChanged;
- (NSDictionary)dictionaryRepresentation;
- (NSString)desc;
- (NSString)identifier;
- (NSString)title;
- (id)description;
- (void)setEnabled:(BOOL)a3;
- (void)setUserChanged:(BOOL)a3;
@end

@implementation AMSNotificationSettingsItem

- (AMSNotificationSettingsItem)initWithTitle:(id)a3 description:(id)a4 identifier:(id)a5 enabled:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSNotificationSettingsItem;
  v14 = [(AMSNotificationSettingsItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_desc, a4);
    v15->_enabled = a6;
    objc_storeStrong((id *)&v15->_identifier, a5);
    objc_storeStrong((id *)&v15->_title, a3);
  }

  return v15;
}

- (AMSNotificationSettingsItem)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSNotificationSettingsItem;
  v5 = [(AMSNotificationSettingsItem *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"settingId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }

    identifier = v5->_identifier;
    v5->_identifier = v7;

    v9 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }

    title = v5->_title;
    v5->_title = v10;

    id v12 = [v4 objectForKeyedSubscript:@"description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    desc = v5->_desc;
    v5->_desc = v13;

    v15 = [v4 valueForKeyPath:@"value.data"];
    if (objc_opt_respondsToSelector())
    {
      v16 = [v4 valueForKeyPath:@"value.data"];
      v5->_enabled = [v16 BOOLValue];
    }
    else
    {
      v5->_enabled = 0;
    }

    objc_super v17 = [v4 valueForKeyPath:@"value.dataUpdated"];
    if (objc_opt_respondsToSelector())
    {
      v18 = [v4 valueForKeyPath:@"value.dataUpdated"];
      v5->_userChanged = [v18 BOOLValue];
    }
    else
    {
      v5->_userChanged = 0;
    }
  }
  return v5;
}

- (id)description
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v11[0] = @"itemId";
  v3 = [(AMSNotificationSettingsItem *)self identifier];
  v12[0] = v3;
  v11[1] = @"title";
  id v4 = [(AMSNotificationSettingsItem *)self title];
  v12[1] = v4;
  v11[2] = @"desc";
  v5 = [(AMSNotificationSettingsItem *)self desc];
  v12[2] = v5;
  v11[3] = @"value";
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSNotificationSettingsItem isEnabled](self, "isEnabled"));
  v12[3] = v6;
  v11[4] = @"userChanged";
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSNotificationSettingsItem userChanged](self, "userChanged"));
  v12[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  v9 = [self ams_generateDescriptionWithSubObjects:v8];

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"settingId";
  v3 = [(AMSNotificationSettingsItem *)self identifier];
  v7[1] = @"data";
  v8[0] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSNotificationSettingsItem isEnabled](self, "isEnabled"));
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)desc
{
  return self->_desc;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)userChanged
{
  return self->_userChanged;
}

- (void)setUserChanged:(BOOL)a3
{
  self->_userChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_desc, 0);
}

@end