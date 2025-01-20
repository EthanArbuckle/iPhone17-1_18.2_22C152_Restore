@interface DOCICloudQuotaInAppMessage
- (DOCICloudQuotaInAppMessage)initWithContentType:(unint64_t)a3 title:(id)a4 subTitle:(id)a5 icon:(id)a6 actions:(id)a7;
- (DOCICloudQuotaInAppMessage)initWithICQInAppMessage:(id)a3;
- (NSArray)actions;
- (NSString)subTitle;
- (NSString)title;
- (UIImage)icon;
- (id)contentTypeDescription;
- (unint64_t)contentType;
- (unint64_t)contentTypeWithMessage:(id)a3;
@end

@implementation DOCICloudQuotaInAppMessage

- (DOCICloudQuotaInAppMessage)initWithICQInAppMessage:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DOCICloudQuotaInAppMessage;
  v5 = [(DOCICloudQuotaInAppMessage *)&v23 init];
  v5->_contentType = [(DOCICloudQuotaInAppMessage *)v5 contentTypeWithMessage:v4];
  uint64_t v6 = [v4 title];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  uint64_t v8 = [v4 subTitle];
  subTitle = v5->_subTitle;
  v5->_subTitle = (NSString *)v8;

  v10 = [v4 sfSymbolName];
  if (v10)
  {
    v11 = (void *)MEMORY[0x263F1C6B0];
    v12 = [v4 sfSymbolName];
    uint64_t v13 = [v11 systemImageNamed:v12];
    icon = v5->_icon;
    v5->_icon = (UIImage *)v13;
  }
  else
  {
    v12 = v5->_icon;
    v5->_icon = 0;
  }

  v15 = [MEMORY[0x263EFF980] array];
  v16 = [v4 actions];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__DOCICloudQuotaInAppMessage_initWithICQInAppMessage___block_invoke;
  v21[3] = &unk_264674AB0;
  v17 = v15;
  v22 = v17;
  [v16 enumerateObjectsUsingBlock:v21];

  actions = v5->_actions;
  v5->_actions = v17;
  v19 = v17;

  return v5;
}

void __54__DOCICloudQuotaInAppMessage_initWithICQInAppMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[DOCICloudQuotaInAppAction alloc] initWithICQInAppAction:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (DOCICloudQuotaInAppMessage)initWithContentType:(unint64_t)a3 title:(id)a4 subTitle:(id)a5 icon:(id)a6 actions:(id)a7
{
  v12 = (NSString *)a4;
  uint64_t v13 = (NSString *)a5;
  v14 = (UIImage *)a6;
  v15 = (NSArray *)a7;
  v25.receiver = self;
  v25.super_class = (Class)DOCICloudQuotaInAppMessage;
  v16 = [(DOCICloudQuotaInAppMessage *)&v25 init];
  title = v16->_title;
  v16->_contentType = a3;
  v16->_title = v12;
  v18 = v12;

  subTitle = v16->_subTitle;
  v16->_subTitle = v13;
  v20 = v13;

  icon = v16->_icon;
  v16->_icon = v14;
  v22 = v14;

  actions = v16->_actions;
  v16->_actions = v15;

  return v16;
}

- (unint64_t)contentTypeWithMessage:(id)a3
{
  unint64_t v3 = [a3 contentType];
  if (v3 > 4) {
    return 0;
  }
  else {
    return qword_222E3BFA0[v3];
  }
}

- (id)contentTypeDescription
{
  unint64_t v2 = [(DOCICloudQuotaInAppMessage *)self contentType];
  unint64_t v3 = @"Error";
  if (v2 == 1) {
    unint64_t v3 = @"Error with Sync Status";
  }
  if (v2 == 2) {
    return @"Warning";
  }
  else {
    return v3;
  }
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (UIImage)icon
{
  return self->_icon;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end