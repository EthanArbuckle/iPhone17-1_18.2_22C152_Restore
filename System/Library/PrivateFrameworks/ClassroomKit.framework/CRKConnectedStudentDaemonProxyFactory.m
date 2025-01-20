@interface CRKConnectedStudentDaemonProxyFactory
+ (void)makeConnectedStudentDaemonProxyWithCompletion:(id)a3;
- (CRKConnectedStudentDaemonProxyFactory)initWithStudentDaemonProxy:(id)a3 didConnectHandler:(id)a4;
- (CRKConnectedStudentDaemonProxyFactory)selfReference;
- (CRKStudentDaemonProxy)studentDaemonProxy;
- (id)didConnectHandler;
- (void)beginConnection;
- (void)daemonProxyDidConnect:(id)a3;
- (void)setDidConnectHandler:(id)a3;
- (void)setSelfReference:(id)a3;
@end

@implementation CRKConnectedStudentDaemonProxyFactory

- (CRKConnectedStudentDaemonProxyFactory)initWithStudentDaemonProxy:(id)a3 didConnectHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKConnectedStudentDaemonProxyFactory;
  v9 = [(CRKConnectedStudentDaemonProxyFactory *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_studentDaemonProxy, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id didConnectHandler = v10->_didConnectHandler;
    v10->_id didConnectHandler = (id)v11;
  }
  return v10;
}

+ (void)makeConnectedStudentDaemonProxyWithCompletion:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_opt_new();
  v4 = [[CRKConnectedStudentDaemonProxyFactory alloc] initWithStudentDaemonProxy:v5 didConnectHandler:v3];

  [v5 addObserver:v4];
  [(CRKConnectedStudentDaemonProxyFactory *)v4 beginConnection];
}

- (void)beginConnection
{
  [(CRKConnectedStudentDaemonProxyFactory *)self setSelfReference:self];
  id v3 = [(CRKConnectedStudentDaemonProxyFactory *)self studentDaemonProxy];
  [v3 connect];
}

- (void)daemonProxyDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConnectedStudentDaemonProxyFactory *)self didConnectHandler];
  [(CRKConnectedStudentDaemonProxyFactory *)self setDidConnectHandler:0];
  v5[2](v5, v4);

  [(CRKConnectedStudentDaemonProxyFactory *)self setSelfReference:0];
}

- (CRKStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (id)didConnectHandler
{
  return self->_didConnectHandler;
}

- (void)setDidConnectHandler:(id)a3
{
}

- (CRKConnectedStudentDaemonProxyFactory)selfReference
{
  return self->_selfReference;
}

- (void)setSelfReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong(&self->_didConnectHandler, 0);

  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

@end