@interface AMSNotificationSettingsSection
- (AMSNotificationSettingsSection)initWithDictionaryRepresentation:(id)a3;
- (AMSNotificationSettingsSection)initWithTitle:(id)a3 footer:(id)a4 items:(id)a5;
- (NSArray)items;
- (NSDictionary)dictionaryRepresentation;
- (NSString)footer;
- (NSString)identifier;
- (NSString)title;
- (id)description;
@end

@implementation AMSNotificationSettingsSection

- (AMSNotificationSettingsSection)initWithTitle:(id)a3 footer:(id)a4 items:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSNotificationSettingsSection;
  v12 = [(AMSNotificationSettingsSection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_footer, a4);
    objc_storeStrong((id *)&v13->_items, a5);
  }

  return v13;
}

- (AMSNotificationSettingsSection)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSNotificationSettingsSection;
  v5 = [(AMSNotificationSettingsSection *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"disclaimer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }

    footer = v5->_footer;
    v5->_footer = v7;

    id v9 = [v4 objectForKeyedSubscript:@"sectionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    identifier = v5->_identifier;
    v5->_identifier = v10;

    v12 = [v4 objectForKeyedSubscript:@"settings"];
    uint64_t v13 = objc_msgSend(v12, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_102);
    items = v5->_items;
    v5->_items = (NSArray *)v13;

    objc_super v15 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }

    title = v5->_title;
    v5->_title = v16;
  }
  return v5;
}

AMSNotificationSettingsItem *__67__AMSNotificationSettingsSection_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[AMSNotificationSettingsItem alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  return 0;
}

- (id)description
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"sectionId";
  v3 = [(AMSNotificationSettingsSection *)self identifier];
  v11[0] = v3;
  v10[1] = @"title";
  id v4 = [(AMSNotificationSettingsSection *)self title];
  v11[1] = v4;
  v10[2] = @"footer";
  v5 = [(AMSNotificationSettingsSection *)self footer];
  v11[2] = v5;
  v10[3] = @"items";
  v6 = [(AMSNotificationSettingsSection *)self items];
  v11[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v8 = [self ams_generateDescriptionWithSubObjects:v7];

  return v8;
}

- (NSString)footer
{
  return self->_footer;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_footer, 0);
}

@end