@interface HUHomeControlServiceContext
+ (id)_homeInfoFromDefaultActionURL:(id)a3;
- (CGRect)animationOriginRect;
- (HUHomeControlServiceContext)initWithAlertConfigurationContext:(id)a3;
- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 defaultActionURL:(id)a4;
- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 home:(id)a4 accessory:(id)a5 presentingViewController:(id)a6;
- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 home:(id)a4 room:(id)a5;
- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 homeIdentifier:(id)a4 accessoryIdentifier:(id)a5;
- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 homeIdentifier:(id)a4 roomIdentifier:(id)a5;
- (NSSet)actions;
- (NSString)accessoryIdentifier;
- (NSString)accessoryName;
- (NSString)homeIdentifier;
- (NSString)homeName;
- (NSString)roomIdentifier;
- (NSString)roomName;
- (NSURL)defaultActionURL;
- (SBUIRemoteAlertHostInterface)remoteViewControllerProxy;
- (UIViewController)presentingViewController;
- (id)_initWithUserInfo:(id)a3;
- (id)userInfo;
- (unint64_t)serviceType;
- (void)dealloc;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAccessoryName:(id)a3;
- (void)setActions:(id)a3;
- (void)setAnimationOriginRect:(CGRect)a3;
- (void)setDefaultActionURL:(id)a3;
- (void)setHomeIdentifier:(id)a3;
- (void)setHomeName:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRemoteViewControllerProxy:(id)a3;
- (void)setRoomIdentifier:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setServiceType:(unint64_t)a3;
@end

@implementation HUHomeControlServiceContext

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 homeIdentifier:(id)a4 roomIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUHomeControlServiceContext;
  v11 = [(HUHomeControlServiceContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeIdentifier, a4);
    objc_storeStrong((id *)&v12->_roomIdentifier, a5);
    v12->_serviceType = a3;
  }

  return v12;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 home:(id)a4 room:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 uniqueIdentifier];
  v11 = [v10 UUIDString];
  v12 = [v9 uniqueIdentifier];
  v13 = [v12 UUIDString];
  objc_super v14 = [(HUHomeControlServiceContext *)self initWithServiceType:a3 homeIdentifier:v11 roomIdentifier:v13];

  if (v14)
  {
    uint64_t v15 = [v8 name];
    homeName = v14->_homeName;
    v14->_homeName = (NSString *)v15;

    uint64_t v17 = [v9 name];
    roomName = v14->_roomName;
    v14->_roomName = (NSString *)v17;
  }
  return v14;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 homeIdentifier:(id)a4 accessoryIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUHomeControlServiceContext;
  v11 = [(HUHomeControlServiceContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeIdentifier, a4);
    objc_storeStrong((id *)&v12->_accessoryIdentifier, a5);
    v12->_serviceType = a3;
  }

  return v12;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 home:(id)a4 accessory:(id)a5 presentingViewController:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 uniqueIdentifier];
  objc_super v14 = [v13 UUIDString];
  uint64_t v15 = [v11 uniqueIdentifier];
  v16 = [v15 UUIDString];
  uint64_t v17 = [(HUHomeControlServiceContext *)self initWithServiceType:a3 homeIdentifier:v14 accessoryIdentifier:v16];

  if (v17)
  {
    uint64_t v18 = [v10 name];
    homeName = v17->_homeName;
    v17->_homeName = (NSString *)v18;

    uint64_t v20 = [v11 name];
    accessoryName = v17->_accessoryName;
    v17->_accessoryName = (NSString *)v20;

    objc_storeWeak((id *)&v17->_presentingViewController, v12);
    v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [(HUHomeControlServiceContext *)v17 presentingViewController];
      int v27 = 138413058;
      v28 = v24;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "Initializing %@ with home %@, accessory name %@, presentingViewController = %@", (uint8_t *)&v27, 0x2Au);
    }
  }

  return v17;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 defaultActionURL:(id)a4
{
  id v7 = a4;
  id v8 = +[HUHomeControlServiceContext _homeInfoFromDefaultActionURL:v7];
  id v9 = [v8 objectForKeyedSubscript:@"home-identifier-key"];
  id v10 = [(HUHomeControlServiceContext *)self initWithServiceType:a3 homeIdentifier:v9 roomIdentifier:0];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_defaultActionURL, a4);
    uint64_t v11 = [v8 objectForKeyedSubscript:@"home-name-key"];
    homeName = v10->_homeName;
    v10->_homeName = (NSString *)v11;
  }
  return v10;
}

- (HUHomeControlServiceContext)initWithAlertConfigurationContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [(HUHomeControlServiceContext *)self _initWithUserInfo:v5];

  if (v6)
  {
    uint64_t v7 = [v4 actions];
    actions = v6->_actions;
    v6->_actions = (NSSet *)v7;
  }
  return v6;
}

- (void)dealloc
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)HUHomeControlServiceContext;
  [(HUHomeControlServiceContext *)&v4 dealloc];
}

- (id)userInfo
{
  v3 = objc_opt_new();
  objc_super v4 = [(HUHomeControlServiceContext *)self homeIdentifier];

  if (v4)
  {
    v5 = [(HUHomeControlServiceContext *)self homeIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"home-identifier-key"];
  }
  v6 = [(HUHomeControlServiceContext *)self roomIdentifier];

  if (v6)
  {
    uint64_t v7 = [(HUHomeControlServiceContext *)self roomIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"room-identifier-key"];
  }
  id v8 = [(HUHomeControlServiceContext *)self accessoryIdentifier];

  if (v8)
  {
    id v9 = [(HUHomeControlServiceContext *)self accessoryIdentifier];
    [v3 setObject:v9 forKeyedSubscript:@"accessory-identifier-key"];
  }
  id v10 = [(HUHomeControlServiceContext *)self homeName];

  if (v10)
  {
    uint64_t v11 = [(HUHomeControlServiceContext *)self homeName];
    [v3 setObject:v11 forKeyedSubscript:@"home-name-key"];
  }
  id v12 = [(HUHomeControlServiceContext *)self roomName];

  if (v12)
  {
    v13 = [(HUHomeControlServiceContext *)self roomName];
    [v3 setObject:v13 forKeyedSubscript:@"room-name-key"];
  }
  objc_super v14 = [(HUHomeControlServiceContext *)self accessoryName];

  if (v14)
  {
    uint64_t v15 = [(HUHomeControlServiceContext *)self accessoryName];
    [v3 setObject:v15 forKeyedSubscript:@"accessory-name-key"];
  }
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUHomeControlServiceContext serviceType](self, "serviceType"));
  [v3 setObject:v16 forKeyedSubscript:@"service-type-key"];

  uint64_t v17 = [(HUHomeControlServiceContext *)self defaultActionURL];

  if (v17)
  {
    uint64_t v18 = [(HUHomeControlServiceContext *)self defaultActionURL];
    v19 = [v18 absoluteString];
    [v3 setObject:v19 forKeyedSubscript:@"default-action-url-key"];
  }
  [(HUHomeControlServiceContext *)self animationOriginRect];
  if (!CGRectEqualToRect(v24, *MEMORY[0x1E4F1DB28]))
  {
    [(HUHomeControlServiceContext *)self animationOriginRect];
    uint64_t v20 = NSStringFromCGRect(v25);
    [v3 setObject:v20 forKeyedSubscript:@"animation-origin-rect-key"];
  }
  v21 = (void *)[v3 copy];

  return v21;
}

- (id)_initWithUserInfo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HUHomeControlServiceContext;
  v5 = [(HUHomeControlServiceContext *)&v28 init];
  if (!v5) {
    goto LABEL_32;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v22 = 0;
    uint64_t v23 = 0;
    uint64_t v9 = *(void *)v25;
    id v21 = v4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, v21);
        if ([v11 isEqualToString:@"home-identifier-key"])
        {
          objc_storeStrong((id *)&v5->_homeIdentifier, v12);
          LOBYTE(v23) = 1;
        }
        if ([v11 isEqualToString:@"room-identifier-key"]) {
          objc_storeStrong((id *)&v5->_roomIdentifier, v12);
        }
        if ([v11 isEqualToString:@"accessory-identifier-key"])
        {
          objc_storeStrong((id *)&v5->_accessoryIdentifier, v12);
          BYTE4(v23) = 1;
        }
        if ([v11 isEqualToString:@"service-type-key"])
        {
          v5->_serviceType = [v12 unsignedIntValue];
          char v22 = 1;
        }
        if ([v11 isEqualToString:@"home-name-key"]) {
          objc_storeStrong((id *)&v5->_homeName, v12);
        }
        if ([v11 isEqualToString:@"room-name-key"]) {
          objc_storeStrong((id *)&v5->_roomName, v12);
        }
        if ([v11 isEqualToString:@"accessory-name-key"]) {
          objc_storeStrong((id *)&v5->_accessoryName, v12);
        }
        if ([v11 isEqualToString:@"default-action-url-key"])
        {
          uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
          defaultActionURL = v5->_defaultActionURL;
          v5->_defaultActionURL = (NSURL *)v13;
        }
        if ([v11 isEqualToString:@"animation-origin-rect-key"]) {
          v5->_animationOriginRect = CGRectFromString((NSString *)v12);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);

    char v15 = v22 & v23;
    id v4 = v21;
    char v16 = BYTE4(v23);
  }
  else
  {

    char v16 = 0;
    char v15 = 0;
  }
  uint64_t v17 = [(HUHomeControlServiceContext *)v5 serviceType];
  char v18 = v15 & v16;
  if (v17 != 2) {
    char v18 = v15;
  }
  if ((v18 & 1) == 0) {
    v19 = 0;
  }
  else {
LABEL_32:
  }
    v19 = v5;

  return v19;
}

+ (id)_homeInfoFromDefaultActionURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F29088];
  id v4 = [a3 absoluteString];
  v5 = [v3 componentsWithString:v4];

  long long v25 = v5;
  id v6 = [v5 queryItems];
  uint64_t v7 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    uint64_t v12 = *MEMORY[0x1E4F4A780];
    uint64_t v13 = *MEMORY[0x1E4F4A768];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        char v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        char v16 = [v15 name];
        int v17 = [v16 isEqualToString:v12];

        if (v17)
        {
          char v18 = [v15 value];
          v19 = v7;
          uint64_t v20 = v18;
          id v21 = @"home-name-key";
        }
        else
        {
          char v22 = [v15 name];
          int v23 = [v22 isEqualToString:v13];

          if (!v23) {
            continue;
          }
          char v18 = [v15 value];
          v19 = v7;
          uint64_t v20 = v18;
          id v21 = @"home-identifier-key";
        }
        [v19 setObject:v20 forKey:v21];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }

  return v7;
}

- (SBUIRemoteAlertHostInterface)remoteViewControllerProxy
{
  return self->_remoteViewControllerProxy;
}

- (void)setRemoteViewControllerProxy:(id)a3
{
}

- (CGRect)animationOriginRect
{
  double x = self->_animationOriginRect.origin.x;
  double y = self->_animationOriginRect.origin.y;
  double width = self->_animationOriginRect.size.width;
  double height = self->_animationOriginRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAnimationOriginRect:(CGRect)a3
{
  self->_animationOriginRect = a3;
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)roomIdentifier
{
  return self->_roomIdentifier;
}

- (void)setRoomIdentifier:(id)a3
{
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_roomIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);

  objc_storeStrong((id *)&self->_remoteViewControllerProxy, 0);
}

@end