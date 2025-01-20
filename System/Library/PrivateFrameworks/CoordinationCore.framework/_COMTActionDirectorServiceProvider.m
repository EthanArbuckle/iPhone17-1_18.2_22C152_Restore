@interface _COMTActionDirectorServiceProvider
- (id)clusterRoleMonitorWithCluster:(id)a3;
- (id)messageChannelWithTopic:(id)a3 cluster:(id)a4;
@end

@implementation _COMTActionDirectorServiceProvider

- (id)clusterRoleMonitorWithCluster:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F33F70];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCluster:v4];

  return v5;
}

- (id)messageChannelWithTopic:(id)a3 cluster:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F33F90];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithTopic:v7 cluster:v6];

  return v8;
}

@end