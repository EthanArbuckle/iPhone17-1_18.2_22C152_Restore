@interface AXMetricSession
+ (BOOL)supportsSecureCoding;
- (AXMetricSession)initWithCoder:(id)a3;
- (AXMetricSession)initWithName:(id)a3 measurementsEnabled:(BOOL)a4;
- (AXMetricSession)initWithName:(id)a3 measurementsEnabled:(BOOL)a4 orEnabledByEnvironmentVariables:(id)a5;
- (BOOL)measurementsEnabled;
- (NSArray)enabledByEnvironmentVariables;
- (NSMutableArray)childMetrics;
- (NSString)name;
- (id)generateReport;
- (id)measure:(id)a3 tryExecute:(id)a4;
- (id)startMeasure:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)measure:(id)a3 execute:(id)a4;
- (void)setChildMetrics:(id)a3;
- (void)setEnabledByEnvironmentVariables:(id)a3;
- (void)setMeasurementsEnabled:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation AXMetricSession

- (AXMetricSession)initWithName:(id)a3 measurementsEnabled:(BOOL)a4
{
  return [(AXMetricSession *)self initWithName:a3 measurementsEnabled:a4 orEnabledByEnvironmentVariables:0];
}

- (AXMetricSession)initWithName:(id)a3 measurementsEnabled:(BOOL)a4 orEnabledByEnvironmentVariables:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)AXMetricSession;
  v10 = [(AXMetricSession *)&v26 init];
  v11 = v10;
  if (v10)
  {
    [(AXMetricSession *)v10 setEnabledByEnvironmentVariables:v9];
    [(AXMetricSession *)v11 setName:v8];
    v12 = [MEMORY[0x1E4F1CA48] array];
    [(AXMetricSession *)v11 setChildMetrics:v12];

    [(AXMetricSession *)v11 setMeasurementsEnabled:v6];
    if (!v6)
    {
      v13 = [MEMORY[0x1E4F28F80] processInfo];
      v14 = [v13 environment];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = objc_msgSend(v14, "objectForKey:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);

            if (v20)
            {
              [(AXMetricSession *)v11 setMeasurementsEnabled:1];
              goto LABEL_13;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMetricSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v6 = [v4 decodeBoolForKey:@"measurementsEnabled"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"enabledByEnvironmentVariables"];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"childMetrics"];

  uint64_t v17 = [(AXMetricSession *)self initWithName:v5 measurementsEnabled:v6 orEnabledByEnvironmentVariables:v10];
  uint64_t v18 = v17;
  if (v17)
  {
    v19 = [(AXMetricSession *)v17 childMetrics];
    [v19 addObjectsFromArray:v16];
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXMetricSession *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMetricSession measurementsEnabled](self, "measurementsEnabled"), @"measurementsEnabled");
  uint64_t v6 = [(AXMetricSession *)self enabledByEnvironmentVariables];
  [v4 encodeObject:v6 forKey:@"enabledByEnvironmentVariables"];

  id v7 = [(AXMetricSession *)self childMetrics];
  [v4 encodeObject:v7 forKey:@"childMetrics"];
}

- (void)measure:(id)a3 execute:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  if ([(AXMetricSession *)self measurementsEnabled])
  {
    id v7 = [(AXMetric *)[AXBlockMetric alloc] _initWithName:v9 session:self];
    uint64_t v8 = [(AXMetricSession *)self childMetrics];
    [v8 addObject:v7];

    [v7 _startMeasurement];
    v6[2](v6, v7);

    [v7 _endMeasurement];
  }
  else
  {
    AXSharedInertMetric();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);
  }
}

- (id)measure:(id)a3 tryExecute:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([(AXMetricSession *)self measurementsEnabled])
  {
    id v8 = [(AXMetric *)[AXBlockMetric alloc] _initWithName:v6 session:self];
    id v9 = [(AXMetricSession *)self childMetrics];
    [v9 addObject:v8];

    [v8 _startMeasurement];
    v10 = v7[2](v7, v8);

    [v8 _endMeasurement];
  }
  else
  {
    AXSharedInertMetric();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v7[2](v7, v8);
  }
  return v10;
}

- (id)startMeasure:(id)a3
{
  id v4 = a3;
  if ([(AXMetricSession *)self measurementsEnabled])
  {
    id v5 = [(AXMetric *)[AXBookendMetric alloc] _initWithName:v4 session:self];
    id v6 = [(AXMetricSession *)self childMetrics];
    [v6 addObject:v5];

    [v5 _startMeasurement];
  }
  else
  {
    AXSharedInertMetric();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)generateReport
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(AXMetricSession *)self measurementsEnabled])
  {
    v3 = (void *)MEMORY[0x1E4F28E78];
    id v4 = [(AXMetricSession *)self name];
    id v5 = [v3 stringWithFormat:@"Perf report for '%@':\n", v4];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [(AXMetricSession *)self childMetrics];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * i) _appendToReport:v5 withIndentation:1];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v11 = NSString;
    id v6 = [(AXMetricSession *)self name];
    id v5 = [v11 stringWithFormat:@"Measurements are not being collected for: '%@'", v6];
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)childMetrics
{
  return self->_childMetrics;
}

- (void)setChildMetrics:(id)a3
{
}

- (BOOL)measurementsEnabled
{
  return self->_measurementsEnabled;
}

- (void)setMeasurementsEnabled:(BOOL)a3
{
  self->_measurementsEnabled = a3;
}

- (NSArray)enabledByEnvironmentVariables
{
  return self->_enabledByEnvironmentVariables;
}

- (void)setEnabledByEnvironmentVariables:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledByEnvironmentVariables, 0);
  objc_storeStrong((id *)&self->_childMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end