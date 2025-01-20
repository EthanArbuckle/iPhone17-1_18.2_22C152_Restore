@interface AMSUIWebLogAction
- (AMSUIWebLogAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)sensitive;
- (NSString)message;
- (id)runAction;
- (int64_t)level;
- (unsigned)_logTypeFromLevel:(int64_t)a3;
- (void)setLevel:(int64_t)a3;
- (void)setMessage:(id)a3;
- (void)setSensitive:(BOOL)a3;
@end

@implementation AMSUIWebLogAction

- (AMSUIWebLogAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebLogAction;
  v7 = [(AMSUIWebAction *)&v16 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"level"];
    if (objc_opt_respondsToSelector()) {
      v7->_level = [v8 integerValue];
    }
    v9 = NSString;
    v10 = [v6 objectForKeyedSubscript:@"message"];
    uint64_t v11 = [v9 stringWithFormat:@"%@", v10];
    message = v7->_message;
    v7->_message = (NSString *)v11;

    v13 = [v6 objectForKeyedSubscript:@"sensitive"];
    if (objc_opt_respondsToSelector())
    {
      v14 = [v6 objectForKeyedSubscript:@"sensitive"];
      v7->_sensitive = [v14 BOOLValue];
    }
    else
    {
      v7->_sensitive = 1;
    }
  }
  return v7;
}

- (id)runAction
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebLogAction;
  id v3 = [(AMSUIWebAction *)&v12 runAction];
  os_log_type_t v4 = [(AMSUIWebLogAction *)self _logTypeFromLevel:[(AMSUIWebLogAction *)self level]];
  if ([(AMSUIWebLogAction *)self sensitive] && !os_variant_has_internal_content())
  {
    v5 = @"<private>";
  }
  else
  {
    v5 = [(AMSUIWebLogAction *)self message];
  }
  id v6 = [MEMORY[0x263F27CB8] sharedWebUIPageConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, v4))
  {
    v8 = [(AMSUIWebAction *)self context];
    v9 = [v8 logKey];
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    __int16 v15 = 2112;
    objc_super v16 = v5;
    _os_log_impl(&dword_21C134000, v7, v4, "JSLog: [%{public}@] %@", buf, 0x16u);
  }
  v10 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];

  return v10;
}

- (unsigned)_logTypeFromLevel:(int64_t)a3
{
  unint64_t v3 = [(AMSUIWebLogAction *)self level];
  unint64_t v4 = 0x1101100002uLL >> (8 * v3);
  if (v3 >= 5) {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (void).cxx_destruct
{
}

@end