@interface DAUserInterruptAlert
- (DAUserInterruptAlert)initWithSuiteName:(id)a3 withHandler:(id)a4;
- (NSString)suiteName;
- (id)handler;
- (void)activate;
- (void)setHandler:(id)a3;
- (void)setSuiteName:(id)a3;
@end

@implementation DAUserInterruptAlert

- (DAUserInterruptAlert)initWithSuiteName:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DAUserInterruptAlert;
  v9 = [(DAUserInterruptAlert *)&v13 init];
  if (v9)
  {
    id v10 = objc_retainBlock(v8);
    id handler = v9->_handler;
    v9->_id handler = v10;

    objc_storeStrong((id *)&v9->_suiteName, a3);
  }

  return v9;
}

- (void)activate
{
  v3 = [(DAUserInterruptAlert *)self suiteName];
  sub_1000150C0(@"SKIP_SUITE", @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = +[DAPlatform currentPlatform];
  v11 = sub_100014FD4(@"SKIP");
  v12 = sub_100014FD4(@"CANCEL");
  objc_super v13 = [(DAUserInterruptAlert *)self handler];
  [v10 activateSimpleAlertWithTitle:v14 message:0 defaultButtonName:v11 cancelButtonName:v12 handler:v13];
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suiteName, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end