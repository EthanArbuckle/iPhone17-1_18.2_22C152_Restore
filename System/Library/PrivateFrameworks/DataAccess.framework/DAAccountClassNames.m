@interface DAAccountClassNames
- (NSString)accountClassName;
- (NSString)agentClassName;
- (NSString)clientAccountClassName;
- (NSString)daemonAccountClassName;
- (id)description;
- (void)setAccountClassName:(id)a3;
- (void)setAgentClassName:(id)a3;
- (void)setClientAccountClassName:(id)a3;
- (void)setDaemonAccountClassName:(id)a3;
@end

@implementation DAAccountClassNames

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:\n\tAccountClassName=%@\n\tClientAccountClassName=%@\n\tDaemonAccountClassName=%@\n\tAgentClassName=%@", v5, self->_accountClassName, self->_clientAccountClassName, self->_daemonAccountClassName, self->_agentClassName];

  return v6;
}

- (NSString)accountClassName
{
  return self->_accountClassName;
}

- (void)setAccountClassName:(id)a3
{
}

- (NSString)clientAccountClassName
{
  return self->_clientAccountClassName;
}

- (void)setClientAccountClassName:(id)a3
{
}

- (NSString)daemonAccountClassName
{
  return self->_daemonAccountClassName;
}

- (void)setDaemonAccountClassName:(id)a3
{
}

- (NSString)agentClassName
{
  return self->_agentClassName;
}

- (void)setAgentClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentClassName, 0);
  objc_storeStrong((id *)&self->_daemonAccountClassName, 0);
  objc_storeStrong((id *)&self->_clientAccountClassName, 0);
  objc_storeStrong((id *)&self->_accountClassName, 0);
}

@end