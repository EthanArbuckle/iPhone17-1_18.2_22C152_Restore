@interface EspressoProfilingLayerInfo
- (EspressoProfilingLayerSupportInfo)main_engine_support;
- (NSArray)runtimes;
- (NSDictionary)per_platform_support;
- (NSString)debug_name;
- (NSString)name;
- (double)average_runtime;
- (int)selected_runtime_engine;
- (void)setAverage_runtime:(double)a3;
- (void)setDebug_name:(id)a3;
- (void)setMain_engine_support:(id)a3;
- (void)setName:(id)a3;
- (void)setPer_platform_support:(id)a3;
- (void)setRuntimes:(id)a3;
- (void)setSelected_runtime_engine:(int)a3;
@end

@implementation EspressoProfilingLayerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimes, 0);
  objc_storeStrong((id *)&self->_per_platform_support, 0);
  objc_storeStrong((id *)&self->_main_engine_support, 0);
  objc_storeStrong((id *)&self->_debug_name, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAverage_runtime:(double)a3
{
  self->_average_runtime = a3;
}

- (double)average_runtime
{
  return self->_average_runtime;
}

- (void)setRuntimes:(id)a3
{
}

- (NSArray)runtimes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPer_platform_support:(id)a3
{
}

- (NSDictionary)per_platform_support
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMain_engine_support:(id)a3
{
}

- (EspressoProfilingLayerSupportInfo)main_engine_support
{
  return (EspressoProfilingLayerSupportInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSelected_runtime_engine:(int)a3
{
  self->_selected_runtime_engine = a3;
}

- (int)selected_runtime_engine
{
  return self->_selected_runtime_engine;
}

- (void)setDebug_name:(id)a3
{
}

- (NSString)debug_name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end