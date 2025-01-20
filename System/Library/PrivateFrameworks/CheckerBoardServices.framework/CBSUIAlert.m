@interface CBSUIAlert
+ (BOOL)supportsSecureCoding;
+ (id)alertWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5;
- (BOOL)isActive;
- (CBSUIAlert)initWithCoder:(id)a3;
- (CBSUIAlert)initWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5;
- (NSMutableArray)actions;
- (NSString)identifier;
- (NSString)message;
- (NSString)title;
- (id)alertController;
- (int64_t)preferredStyle;
- (void)_receiveResponse;
- (void)_sendCreate;
- (void)activate;
- (void)addAction:(id)a3;
- (void)deactivate;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setPreferredStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation CBSUIAlert

- (CBSUIAlert)initWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CBSUIAlert;
  v11 = [(CBSUIAlert *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v12->_message, a4);
    v12->_preferredStyle = a5;
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    actions = v12->_actions;
    v12->_actions = (NSMutableArray *)v13;

    v15 = [MEMORY[0x263F08C38] UUID];
    uint64_t v16 = [v15 UUIDString];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v16;
  }
  return v12;
}

+ (id)alertWithTitle:(id)a3 message:(id)a4 preferredStyle:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 message:v8 preferredStyle:a5];

  return v10;
}

- (void)addAction:(id)a3
{
}

- (void)activate
{
  if (![(CBSUIAlert *)self isActive])
  {
    [(CBSUIAlert *)self setIsActive:1];
    [(CBSUIAlert *)self _sendCreate];
  }
}

- (void)deactivate
{
  if ([(CBSUIAlert *)self isActive])
  {
    [(CBSUIAlert *)self _sendDismiss];
    [(CBSUIAlert *)self setIsActive:0];
  }
}

- (id)alertController
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F1C3F8];
  v4 = [(CBSUIAlert *)self title];
  v5 = [(CBSUIAlert *)self message];
  v6 = objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, -[CBSUIAlert preferredStyle](self, "preferredStyle"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(CBSUIAlert *)self actions];
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x263F1C3F0];
        uint64_t v13 = [v11 title];
        uint64_t v14 = [v11 style];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __29__CBSUIAlert_alertController__block_invoke;
        v18[3] = &unk_265036E58;
        v18[4] = v11;
        v15 = [v12 actionWithTitle:v13 style:v14 handler:v18];

        [v6 addAction:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v6;
}

void __29__CBSUIAlert_alertController__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) handler];
    v3[2]();
  }
}

- (void)_sendCreate
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v4 = +[CBSClient defaultClient];
  v5 = [v4 remoteAlertServer];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __25__CBSUIAlert__sendCreate__block_invoke;
  v7[3] = &unk_265036E80;
  objc_copyWeak(&v9, &location);
  v6 = v3;
  uint64_t v8 = v6;
  [v5 createAlert:self timeout:0 completion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  [(CBSUIAlert *)self _receiveResponse];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __25__CBSUIAlert__sendCreate__block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CheckerBoardLogHandleForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [WeakRetained identifier];
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_23EA9B000, v5, OS_LOG_TYPE_DEFAULT, "Alert creation request for [%@] succeeded: %d", (uint8_t *)&v7, 0x12u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_receiveResponse
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v4 = +[CBSClient defaultClient];
  v5 = [v4 remoteAlertServer];
  v6 = [(CBSUIAlert *)self identifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__CBSUIAlert__receiveResponse__block_invoke;
  v8[3] = &unk_265036EA8;
  objc_copyWeak(&v10, &location);
  int v7 = v3;
  __int16 v9 = v7;
  [v5 receiveResponseFromAlertWithIdentifier:v6 timeout:v8 completion:0.0];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __30__CBSUIAlert__receiveResponse__block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = CheckerBoardLogHandleForCategory(5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [WeakRetained identifier];
    int v7 = [WeakRetained actions];
    int v15 = 138412802;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a2;
    __int16 v19 = 2048;
    uint64_t v20 = [v7 count];
    _os_log_impl(&dword_23EA9B000, v5, OS_LOG_TYPE_DEFAULT, "Alert [%@] received response: %lu/%lu", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v8 = [WeakRetained actions];
  unint64_t v9 = [v8 count];

  if (v9 > a2)
  {
    id v10 = [WeakRetained actions];
    uint64_t v11 = [v10 objectAtIndex:a2];

    v12 = CheckerBoardLogHandleForCategory(5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_23EA9B000, v12, OS_LOG_TYPE_DEFAULT, "Invoking action: %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v13 = [v11 handler];

    if (v13)
    {
      uint64_t v14 = [v11 handler];
      v14[2]();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CBSUIAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBSUIAlert;
  v5 = [(CBSUIAlert *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;

    v5->_preferredStyle = [v4 decodeIntegerForKey:@"preferredStyle"];
    id v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSMutableArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CBSUIAlert *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(CBSUIAlert *)self message];
  [v4 encodeObject:v6 forKey:@"message"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[CBSUIAlert preferredStyle](self, "preferredStyle"), @"preferredStyle");
  int v7 = [(CBSUIAlert *)self actions];
  [v4 encodeObject:v7 forKey:@"actions"];

  id v8 = [(CBSUIAlert *)self identifier];
  [v4 encodeObject:v8 forKey:@"identifier"];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end