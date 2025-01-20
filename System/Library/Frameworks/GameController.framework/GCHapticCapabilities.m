@interface GCHapticCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)initialized;
- (GCDeviceHaptics)deviceHaptics;
- (GCHapticCapabilities)init;
- (GCHapticCapabilities)initWithCoder:(id)a3;
- (GCHapticCapabilities)initWithIdentifier:(id)a3 hapticEnginesInfo:(id)a4 hapticCapabilityGraph:(id)a5;
- (GCHapticCapabilityGraph)capabilityGraph;
- (NSArray)hapticEngines;
- (NSObject)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)initializeHapticEngines;
- (void)removeHapticEngines;
- (void)setController:(id)a3;
- (void)setHapticEngines:(id)a3;
@end

@implementation GCHapticCapabilities

- (GCHapticCapabilities)initWithIdentifier:(id)a3 hapticEnginesInfo:(id)a4 hapticCapabilityGraph:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GCHapticCapabilities;
  v11 = [(GCHapticCapabilities *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copyWithZone:0];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    uint64_t v14 = +[NSArray array];
    hapticEngines = v11->_hapticEngines;
    v11->_hapticEngines = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_hapticEnginesInfo, a4);
    objc_storeStrong((id *)&v11->_capabilityGraph, a5);
  }

  return v11;
}

- (GCHapticCapabilities)init
{
  v3 = +[NSUUID UUID];
  v4 = [(GCHapticCapabilities *)self initWithIdentifier:v3 hapticEnginesInfo:0 hapticCapabilityGraph:0];

  return v4;
}

- (void)initializeHapticEngines
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "Unable to create CHHapticEngine!", buf, 2u);
}

- (void)removeHapticEngines
{
  if (self->_initialized)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = self->_hapticEngines;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "stopWithCompletionHandler:", &__block_literal_global_7, (void)v10);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    id v8 = (NSArray *)objc_opt_new();
    hapticEngines = self->_hapticEngines;
    self->_hapticEngines = v8;

    self->_initialized = 0;
  }
}

- (void)setController:(id)a3
{
  p_controller = &self->_controller;
  id v5 = a3;
  objc_storeWeak((id *)p_controller, v5);
  [(GCDeviceHaptics *)self->_deviceHaptics setController:v5];
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (GCHapticCapabilityGraph)capabilityGraph
{
  return (GCHapticCapabilityGraph *)objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceHaptics)deviceHaptics
{
  return (GCDeviceHaptics *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)hapticEngines
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHapticEngines:(id)a3
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hapticEngines, 0);
  objc_storeStrong((id *)&self->_deviceHaptics, 0);
  objc_storeStrong((id *)&self->_capabilityGraph, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_controller);

  objc_storeStrong((id *)&self->_hapticEnginesInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCHapticCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GCHapticCapabilities;
  id v5 = [(GCHapticCapabilities *)&v25 init];
  if (v5)
  {
    uint64_t v6 = GCIPCObjectIdentifier_Classes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = objc_opt_class();
    long long v10 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"hapticEnginesInfo"];
    hapticEnginesInfo = v5->_hapticEnginesInfo;
    v5->_hapticEnginesInfo = (NSArray *)v11;

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    objc_super v17 = [v4 decodeObjectOfClasses:v16 forKey:@"capabilityGraphDict"];
    v18 = [[GCHapticCapabilityGraph alloc] initWithJSONDictionaryRepresentation:v17];
    capabilityGraph = v5->_capabilityGraph;
    v5->_capabilityGraph = v18;

    v20 = [[GCDeviceHaptics alloc] initWithCapabilityGraph:v5->_capabilityGraph];
    deviceHaptics = v5->_deviceHaptics;
    v5->_deviceHaptics = v20;

    uint64_t v22 = +[NSArray array];
    hapticEngines = v5->_hapticEngines;
    v5->_hapticEngines = (NSArray *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  capabilityGraph = self->_capabilityGraph;
  id v5 = a3;
  uint64_t v6 = [(GCHapticCapabilityGraph *)capabilityGraph jsonDictionaryRepresentation];
  [v5 encodeObject:v6 forKey:@"capabilityGraphDict"];

  [v5 encodeObject:self->_hapticEnginesInfo forKey:@"hapticEnginesInfo"];
  id v7 = [(GCHapticCapabilities *)self identifier];
  [v5 encodeObject:v7 forKey:@"identifier"];
}

@end