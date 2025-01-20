@interface APMaintenanceHandle
- (APMaintenanceHandle)init;
- (BOOL)clearAccessTable:(id *)a3;
- (id)getStateDumpWithError:(id *)a3;
@end

@implementation APMaintenanceHandle

- (BOOL)clearAccessTable:(id *)a3
{
  return 1;
}

- (id)getStateDumpWithError:(id *)a3
{
  v3 = (void *)sub_247DC51B4();

  return v3;
}

- (APMaintenanceHandle)init
{
  v3.receiver = self;
  v3.super_class = (Class)APMaintenanceHandle;
  return [(APMaintenanceHandle *)&v3 init];
}

@end