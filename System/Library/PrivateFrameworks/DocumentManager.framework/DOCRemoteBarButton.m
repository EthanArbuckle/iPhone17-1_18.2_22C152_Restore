@interface DOCRemoteBarButton
+ (BOOL)supportsSecureCoding;
- (DOCRemoteBarButton)initWithBarButton:(id)a3;
- (DOCRemoteBarButton)initWithCoder:(id)a3;
- (NSUUID)uuid;
- (UIBarButtonItem)barButton;
- (id)remoteUIBarButtonItemDisplayedInNavigationBar:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performOverflowAction;
- (void)performOverflowAction_forCommand:(id)a3;
- (void)performOverflowAction_menuLeaf:(id)a3;
- (void)performPrimaryAction;
@end

@implementation DOCRemoteBarButton

- (DOCRemoteBarButton)initWithBarButton:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DOCRemoteBarButton;
  v6 = [(DOCRemoteBarButton *)&v16 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263F08C38] UUID];
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_barButton, a3);
    v9 = (NSObject **)MEMORY[0x263F3AC28];
    v10 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v6->_uuid;
      v12 = v10;
      v13 = [(NSUUID *)v11 UUIDString];
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "initWithBarButton: uuid: %@", buf, 0xCu);
    }
    v14 = v6;
  }

  return v6;
}

- (void)performPrimaryAction
{
  id v2 = [(DOCRemoteBarButton *)self barButton];
  objc_msgSend(v2, "_doc_ipi_triggerActionForEvent:", 0);
}

- (void)performOverflowAction
{
  id v4 = [(DOCRemoteBarButton *)self barButton];
  v3 = [v4 menuRepresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(DOCRemoteBarButton *)self performOverflowAction_forCommand:v3];
  }
  else if ([v3 conformsToProtocol:&unk_26C42DAE8])
  {
    [(DOCRemoteBarButton *)self performOverflowAction_menuLeaf:v3];
  }
}

- (void)performOverflowAction_forCommand:(id)a3
{
  id v6 = a3;
  id v4 = [(DOCRemoteBarButton *)self barButton];
  id v5 = [v4 target];
  [v6 action];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "performSelector:withObject:", objc_msgSend(v6, "action"), v4);
  }
}

- (void)performOverflowAction_menuLeaf:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCRemoteBarButton *)self barButton];
  [v4 performWithSender:v5 target:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCRemoteBarButton)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [DOCRemoteUIBarButtonItem alloc];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uint64_t v7 = (NSObject **)MEMORY[0x263F3AC28];
  v8 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [v6 UUIDString];
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_impl(&dword_21361D000, v9, OS_LOG_TYPE_INFO, "initWithCoder: bar button with uuid: %@", buf, 0xCu);
  }
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"style"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"landscapeImagePhone"];
  if ([v4 decodeBoolForKey:@"isSystemItem"])
  {
    uint64_t v15 = -[DOCRemoteUIBarButtonItem initWithBarButtonSystemItem:target:action:](v5, "initWithBarButtonSystemItem:target:action:", [v4 decodeIntegerForKey:@"systemItem"], 0, 0);
  }
  else if (v11)
  {
    uint64_t v15 = [(DOCRemoteUIBarButtonItem *)v5 initWithTitle:v11 style:v12 target:0 action:0];
  }
  else if (v13 && v14)
  {
    uint64_t v15 = [(DOCRemoteUIBarButtonItem *)v5 initWithImage:v13 landscapeImagePhone:v14 style:v12 target:0 action:0];
  }
  else
  {
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v15 = [(DOCRemoteUIBarButtonItem *)v5 initWithImage:v13 style:v12 target:0 action:0];
  }
  id v5 = (DOCRemoteUIBarButtonItem *)v15;
LABEL_15:
  -[DOCRemoteUIBarButtonItem setEnabled:](v5, "setEnabled:", [v4 decodeBoolForKey:@"enabled"]);
  objc_super v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"possibleTitles"];
  [(DOCRemoteUIBarButtonItem *)v5 setPossibleTitles:v19];

  [v4 decodeFloatForKey:@"width"];
  [(DOCRemoteUIBarButtonItem *)v5 setWidth:v20];
  [v4 decodeUIEdgeInsetsForKey:@"imageInsets"];
  -[DOCRemoteUIBarButtonItem setImageInsets:](v5, "setImageInsets:");
  [v4 decodeUIEdgeInsetsForKey:@"landscapeImagePhoneInsets"];
  -[DOCRemoteUIBarButtonItem setLandscapeImagePhoneInsets:](v5, "setLandscapeImagePhoneInsets:");
  [(DOCRemoteUIBarButtonItem *)v5 setUuid:v6];
  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityLabel"];
  [(DOCRemoteUIBarButtonItem *)v5 setAccessibilityLabel:v21];

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityHint"];
  [(DOCRemoteUIBarButtonItem *)v5 setAccessibilityHint:v22];

  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"menuRepresentation"];
  [(DOCRemoteUIBarButtonItem *)v5 setMenuRepresentation:v23];

  v24 = [(DOCRemoteBarButton *)self initWithBarButton:v5];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_uuid, v6);
    v26 = +[DOCRemoteUIBarButtonItemRegistry shared];
    [v26 registerInstance:v5];

    v27 = v25;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DOCRemoteBarButton *)self barButton];
  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "isSystemItem"), @"isSystemItem");
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v5, "systemItem"), @"systemItem");
  id v6 = [v5 image];
  [v4 encodeObject:v6 forKey:@"image"];

  uint64_t v7 = [v5 landscapeImagePhone];
  [v4 encodeObject:v7 forKey:@"landscapeImagePhone"];

  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v5, "style"), @"style");
  v8 = [v5 title];
  [v4 encodeObject:v8 forKey:@"title"];

  objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "isEnabled"), @"enabled");
  v9 = [v5 possibleTitles];
  [v4 encodeObject:v9 forKey:@"possibleTitles"];

  [v5 width];
  *(float *)&double v10 = v10;
  [v4 encodeFloat:@"width" forKey:v10];
  [v5 imageInsets];
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"imageInsets");
  [v5 landscapeImagePhoneInsets];
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"landscapeImagePhoneInsets");
  [v4 encodeObject:self->_uuid forKey:@"uuid"];
  v11 = [v5 accessibilityLabel];
  [v4 encodeObject:v11 forKey:@"accessibilityLabel"];

  uint64_t v12 = [v5 accessibilityHint];
  [v4 encodeObject:v12 forKey:@"accessibilityHint"];

  v13 = [v5 menuRepresentation];
  [v4 encodeObject:v13 forKey:@"menuRepresentation"];

  v14 = (NSObject **)MEMORY[0x263F3AC28];
  uint64_t v15 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    uint64_t v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uuid = self->_uuid;
    uint64_t v17 = v15;
    v18 = [(NSUUID *)uuid UUIDString];
    int v19 = 138412290;
    float v20 = v18;
    _os_log_impl(&dword_21361D000, v17, OS_LOG_TYPE_INFO, "encodeWithCoder: bar button with uuid: %@", (uint8_t *)&v19, 0xCu);
  }
}

- (UIBarButtonItem)barButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_barButton, 0);
}

- (id)remoteUIBarButtonItemDisplayedInNavigationBar:(id)a3
{
  id v4 = a3;
  id v5 = +[DOCRemoteUIBarButtonItemRegistry shared];
  id v6 = [(DOCRemoteBarButton *)self uuid];
  uint64_t v7 = [v5 barButtonItemPresentedInNavigationBar:v4 uuid:v6];

  return v7;
}

@end