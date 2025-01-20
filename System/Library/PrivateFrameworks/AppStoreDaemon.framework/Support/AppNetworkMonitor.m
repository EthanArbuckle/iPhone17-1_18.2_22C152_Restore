@interface AppNetworkMonitor
- (BOOL)isConnected;
- (BOOL)isConstrained;
- (BOOL)isExpensive;
- (BOOL)isExpensiveOrCellular;
- (int64_t)interfaceType;
@end

@implementation AppNetworkMonitor

- (BOOL)isExpensiveOrCellular
{
  return [(AppNetworkMonitor *)self isExpensive]
      || (id)[(AppNetworkMonitor *)self interfaceType] == (id)2;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (BOOL)isConstrained
{
  return self->_constrained;
}

- (BOOL)isExpensive
{
  return self->_expensive;
}

- (int64_t)interfaceType
{
  return self->_interfaceType;
}

@end