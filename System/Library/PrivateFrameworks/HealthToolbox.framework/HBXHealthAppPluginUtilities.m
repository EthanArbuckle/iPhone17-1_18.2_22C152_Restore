@interface HBXHealthAppPluginUtilities
+ (id)defaultUtilities;
- (BOOL)_isCatalyst;
- (HBXHealthAppPluginUtilities)initWithConfigurationOverride:(int64_t)a3;
- (NSString)feedItemPluginsPath;
- (NSString)simulatorPathOverride;
- (NSString)systemPath;
- (id)_rootPath;
- (id)_simulatorPath;
- (void)setSimulatorPathOverride:(id)a3;
@end

@implementation HBXHealthAppPluginUtilities

+ (id)defaultUtilities
{
  v2 = [[HBXHealthAppPluginUtilities alloc] initWithConfigurationOverride:0];

  return v2;
}

- (HBXHealthAppPluginUtilities)initWithConfigurationOverride:(int64_t)a3
{
  result = [(HBXHealthAppPluginUtilities *)self init];
  if (result) {
    result->_configurationOverride = a3;
  }
  return result;
}

- (NSString)systemPath
{
  v2 = [(HBXHealthAppPluginUtilities *)self _rootPath];
  v3 = [v2 stringByAppendingPathComponent:@"/System"];

  return (NSString *)v3;
}

- (id)_rootPath
{
  if ([(HBXHealthAppPluginUtilities *)self _isCatalyst])
  {
    v3 = @"/System/iOSSupport/";
  }
  else
  {
    v4 = [(HBXHealthAppPluginUtilities *)self _simulatorPath];
    if ([v4 length]) {
      v3 = v4;
    }
    else {
      v3 = @"/";
    }
  }

  return v3;
}

- (BOOL)_isCatalyst
{
  return self->_configurationOverride == 3;
}

- (id)_simulatorPath
{
  int64_t configurationOverride = self->_configurationOverride;
  if (configurationOverride)
  {
    if (configurationOverride == 2)
    {
      v3 = [(HBXHealthAppPluginUtilities *)self simulatorPathOverride];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v4 = [MEMORY[0x263F08AB0] processInfo];
    v5 = [v4 environment];
    v3 = [v5 objectForKeyedSubscript:@"SIMULATOR_ROOT"];
  }

  return v3;
}

- (NSString)feedItemPluginsPath
{
  v2 = [(HBXHealthAppPluginUtilities *)self _rootPath];
  v3 = [v2 stringByAppendingPathComponent:@"/System/Library/Health/FeedItemPlugins"];

  return (NSString *)v3;
}

- (NSString)simulatorPathOverride
{
  return self->_simulatorPathOverride;
}

- (void)setSimulatorPathOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end