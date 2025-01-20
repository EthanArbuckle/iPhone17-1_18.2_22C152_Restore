@interface EspressoProfilingNetworkInfo
- (EspressoProfilingANEcompilerAnalytics)ane_compiler_analytics;
- (EspressoProfilingNetworkANEInfo)ane_performance_info;
- (NSMutableArray)layers;
- (NSString)network_at_path;
- (void)setAne_compiler_analytics:(id)a3;
- (void)setAne_performance_info:(id)a3;
- (void)setLayers:(id)a3;
- (void)setNetwork_at_path:(id)a3;
@end

@implementation EspressoProfilingNetworkInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ane_compiler_analytics, 0);
  objc_storeStrong((id *)&self->_ane_performance_info, 0);
  objc_storeStrong((id *)&self->_network_at_path, 0);

  objc_storeStrong((id *)&self->_layers, 0);
}

- (void)setAne_compiler_analytics:(id)a3
{
}

- (EspressoProfilingANEcompilerAnalytics)ane_compiler_analytics
{
  return (EspressoProfilingANEcompilerAnalytics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAne_performance_info:(id)a3
{
}

- (EspressoProfilingNetworkANEInfo)ane_performance_info
{
  return (EspressoProfilingNetworkANEInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNetwork_at_path:(id)a3
{
}

- (NSString)network_at_path
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLayers:(id)a3
{
}

- (NSMutableArray)layers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

@end