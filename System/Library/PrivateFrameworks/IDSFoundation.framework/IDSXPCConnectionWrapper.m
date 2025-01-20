@interface IDSXPCConnectionWrapper
- (IDSXPCConnectionWrapper)initWithConnection:(id)a3;
- (void)cancel;
- (void)resume;
@end

@implementation IDSXPCConnectionWrapper

- (IDSXPCConnectionWrapper)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSXPCConnectionWrapper;
  v6 = [(IDSXPCConnectionWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)resume
{
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end