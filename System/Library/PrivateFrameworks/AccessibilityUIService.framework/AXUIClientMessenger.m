@interface AXUIClientMessenger
+ (id)clientMessengerWithIdentifier:(id)a3;
- (AXMultiplexConnectionHandler)connection;
- (AXUIClientMessenger)init;
- (AXUIClientMessenger)initWithClientIdentifier:(id)a3 connection:(id)a4;
- (NSString)clientIdentifier;
- (id)description;
- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 error:(id *)a5;
- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completion:(id)a6;
- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completionRequiresWritingBlock:(BOOL)a6 completion:(id)a7;
- (void)setClientIdentifier:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation AXUIClientMessenger

+ (id)clientMessengerWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[AXUIServiceManager sharedServiceManager];
  v5 = [v4 _clientMessengerWithIdentifier:v3];

  return v5;
}

- (AXUIClientMessenger)init
{
  v4.receiver = self;
  v4.super_class = (Class)AXUIClientMessenger;
  v2 = [(AXUIClientMessenger *)&v4 init];
  if (v2) {

  }
  return 0;
}

- (AXUIClientMessenger)initWithClientIdentifier:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXUIClientMessenger;
  v8 = [(AXUIClientMessenger *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXUIClientMessenger *)v8 setClientIdentifier:v6];
    [(AXUIClientMessenger *)v9 setConnection:v7];
  }

  return v9;
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completion:(id)a6
{
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completionRequiresWritingBlock:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = +[AXUIServiceManager sharedServiceManager];
  [v15 _sendAsynchronousMessage:v14 withIdentifier:a4 toClientWithMessenger:self targetAccessQueue:v13 completionRequiresWritingBlock:v7 completion:v12];
}

- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = +[AXUIServiceManager sharedServiceManager];
  v10 = [v9 _sendSynchronousMessage:v8 withIdentifier:a4 toClientWithMessenger:self error:a5];

  return v10;
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(AXUIClientMessenger *)self clientIdentifier];
  BOOL v7 = [v3 stringWithFormat:@"<%@: %p clientIdentifier = \"%@\">", v5, self, v6];;

  return v7;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (AXMultiplexConnectionHandler)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end