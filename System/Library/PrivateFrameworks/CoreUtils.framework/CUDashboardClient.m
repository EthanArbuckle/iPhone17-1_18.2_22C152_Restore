@interface CUDashboardClient
- (NSString)server;
- (int)_logCStr:(const char *)a3 length:(unint64_t)a4;
- (int)activate;
- (int)logJSON:(id)a3;
- (int)logf:(const char *)a3;
- (int)logv:(const char *)a3 args:(char *)a4;
- (void)setServer:(id)a3;
@end

@implementation CUDashboardClient

- (void).cxx_destruct
{
}

- (void)setServer:(id)a3
{
}

- (NSString)server
{
  return self->_server;
}

- (int)_logCStr:(const char *)a3 length:(unint64_t)a4
{
  return 0;
}

- (int)logv:(const char *)a3 args:(char *)a4
{
  return 0;
}

- (int)logf:(const char *)a3
{
  return 0;
}

- (int)logJSON:(id)a3
{
  return 0;
}

- (int)activate
{
  return 0;
}

@end