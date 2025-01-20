@interface AXMetric
+ (BOOL)supportsSecureCoding;
- (AXMetric)initWithCoder:(id)a3;
- (AXMetricSession)session;
- (BOOL)measurementsEnabled;
- (NSMutableArray)childMetrics;
- (NSString)name;
- (double)elapsedTime;
- (double)endTime;
- (double)startTime;
- (id)_formatDeltaKbAsMbString:(int64_t)a3;
- (id)_formatKbAsMbString:(int64_t)a3;
- (id)_initWithName:(id)a3 session:(id)a4;
- (id)measure:(id)a3 tryExecute:(id)a4;
- (id)startMeasure:(id)a3;
- (int64_t)cpuInstructions;
- (int64_t)cpuTime;
- (int64_t)dirtyMemory;
- (int64_t)dirtyMemoryDelta;
- (int64_t)dirtyMemoryPeak;
- (int64_t)dirtyMemoryPeakDelta;
- (int64_t)dirtyMemoryPeakLifetime;
- (pc_session)perfCheckSession;
- (void)_appendToReport:(id)a3 withIndentation:(int64_t)a4;
- (void)_endMeasurement;
- (void)_startMeasurement;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)measure:(id)a3 execute:(id)a4;
- (void)setChildMetrics:(id)a3;
- (void)setCpuInstructions:(int64_t)a3;
- (void)setCpuTime:(int64_t)a3;
- (void)setDirtyMemory:(int64_t)a3;
- (void)setDirtyMemoryDelta:(int64_t)a3;
- (void)setDirtyMemoryPeak:(int64_t)a3;
- (void)setDirtyMemoryPeakDelta:(int64_t)a3;
- (void)setDirtyMemoryPeakLifetime:(int64_t)a3;
- (void)setEndTime:(double)a3;
- (void)setName:(id)a3;
- (void)setPerfCheckSession:(pc_session *)a3;
- (void)setSession:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation AXMetric

- (id)_initWithName:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMetric;
  v8 = [(AXMetric *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(AXMetric *)v8 setName:v6];
    [(AXMetric *)v9 setSession:v7];
    if ([v7 measurementsEnabled])
    {
      v10 = [MEMORY[0x1E4F1CA48] array];
      [(AXMetric *)v9 setChildMetrics:v10];

      v9->_perfCheckSession = (pc_session *)pc_session_create();
      v11 = [MEMORY[0x1E4F28F80] processInfo];
      [v11 processIdentifier];
      pc_session_set_procpid();

      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
      pc_session_add_metric();
    }
  }

  return v9;
}

- (void)dealloc
{
  if (self->_perfCheckSession) {
    pc_session_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)AXMetric;
  [(AXMetric *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXMetric;
  v5 = [(AXMetric *)&v15 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(AXMetric *)v5 setName:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session"];
    [(AXMetric *)v5 setSession:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    objc_super v13 = [v4 decodeObjectOfClasses:v12 forKey:@"childMetrics"];
    [(AXMetric *)v5 setChildMetrics:v13];

    [v4 decodeDoubleForKey:@"startTime"];
    -[AXMetric setStartTime:](v5, "setStartTime:");
    [v4 decodeDoubleForKey:@"endTime"];
    -[AXMetric setEndTime:](v5, "setEndTime:");
    -[AXMetric setDirtyMemory:](v5, "setDirtyMemory:", [v4 decodeInt64ForKey:@"dirtyMemory"]);
    -[AXMetric setDirtyMemoryDelta:](v5, "setDirtyMemoryDelta:", [v4 decodeInt64ForKey:@"dirtyMemoryDelta"]);
    -[AXMetric setDirtyMemoryPeak:](v5, "setDirtyMemoryPeak:", [v4 decodeInt64ForKey:@"dirtyMemoryPeak"]);
    -[AXMetric setDirtyMemoryPeakDelta:](v5, "setDirtyMemoryPeakDelta:", [v4 decodeInt64ForKey:@"dirtyMemoryPeakDelta"]);
    -[AXMetric setDirtyMemoryPeakLifetime:](v5, "setDirtyMemoryPeakLifetime:", [v4 decodeInt64ForKey:@"dirtyMemoryPeakLifetime"]);
    -[AXMetric setCpuTime:](v5, "setCpuTime:", [v4 decodeInt64ForKey:@"cpuTime"]);
    -[AXMetric setCpuInstructions:](v5, "setCpuInstructions:", [v4 decodeInt64ForKey:@"cpuInstructions"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AXMetric *)self name];
  [v7 encodeObject:v4 forKey:@"name"];

  v5 = [(AXMetric *)self childMetrics];
  [v7 encodeObject:v5 forKey:@"childMetrics"];

  [(AXMetric *)self startTime];
  objc_msgSend(v7, "encodeDouble:forKey:", @"startTime");
  [(AXMetric *)self endTime];
  objc_msgSend(v7, "encodeDouble:forKey:", @"endTime");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemory](self, "dirtyMemory"), @"dirtyMemory");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryDelta](self, "dirtyMemoryDelta"), @"dirtyMemoryDelta");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryPeak](self, "dirtyMemoryPeak"), @"dirtyMemoryPeak");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryPeakDelta](self, "dirtyMemoryPeakDelta"), @"dirtyMemoryPeakDelta");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric dirtyMemoryPeakLifetime](self, "dirtyMemoryPeakLifetime"), @"dirtyMemoryPeakLifetime");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric cpuTime](self, "cpuTime"), @"cpuTime");
  objc_msgSend(v7, "encodeInt64:forKey:", -[AXMetric cpuInstructions](self, "cpuInstructions"), @"cpuInstructions");
  NSClassFromString(&cfstr_Nsxpcencoder.isa);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [(AXMetric *)self session];
    [v7 encodeConditionalObject:v6 forKey:@"session"];
  }
}

- (void)_startMeasurement
{
  id v5 = [(AXMetric *)self session];
  if ([v5 measurementsEnabled])
  {
    perfCheckSession = self->_perfCheckSession;

    if (perfCheckSession)
    {
      pc_session_begin();
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      self->_startTime = v4;
    }
  }
  else
  {
  }
}

- (void)_endMeasurement
{
  id v5 = [(AXMetric *)self session];
  if ([v5 measurementsEnabled])
  {
    perfCheckSession = self->_perfCheckSession;

    if (perfCheckSession)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      self->_endTime = v4;
      pc_session_end();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      pc_session_get_value();
      self->_dirtyMemory = (uint64_t)0.0;
      self->_dirtyMemoryDelta = (uint64_t)0.0;
      self->_dirtyMemoryPeak = (uint64_t)0.0;
      self->_dirtyMemoryPeakDelta = (uint64_t)0.0;
      self->_dirtyMemoryPeakLifetime = (uint64_t)0.0;
      self->_cpuTime = (uint64_t)0.0 / 0xF4240uLL;
      self->_cpuInstructions = (uint64_t)0.0;
      pc_session_destroy();
      self->_perfCheckSession = 0;
    }
  }
  else
  {
  }
}

- (double)elapsedTime
{
  return self->_endTime - self->_startTime;
}

- (id)_formatKbAsMbString:(int64_t)a3
{
  return (id)[NSString stringWithFormat:@"%.2fMB", (double)a3 * 0.0009765625];
}

- (id)_formatDeltaKbAsMbString:(int64_t)a3
{
  objc_super v3 = @"▼";
  if (a3 > 0) {
    objc_super v3 = @"▲";
  }
  if (!a3) {
    objc_super v3 = @"=";
  }
  return (id)[NSString stringWithFormat:@"%@%.2fMB", v3, (double)a3 * 0.0009765625];
}

- (void)_appendToReport:(id)a3 withIndentation:(int64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(AXMetric *)self session];
  int v8 = [v7 measurementsEnabled];

  if (v8)
  {
    uint64_t v9 = [&stru_1EDF601D0 stringByPaddingToLength:2 * a4 withString:@" " startingAtIndex:0];
    [v6 appendString:v9];

    uint64_t v10 = [(AXMetric *)self name];
    [(AXMetric *)self elapsedTime];
    [v6 appendFormat:@"%@: [Time:%.3fs]", v10, v11];

    objc_msgSend(v6, "appendFormat:", @" [CPU:%lldms istrCnt:%lld]", -[AXMetric cpuTime](self, "cpuTime"), -[AXMetric cpuInstructions](self, "cpuInstructions"));
    v12 = [(AXMetric *)self _formatKbAsMbString:[(AXMetric *)self dirtyMemory]];
    objc_super v13 = [(AXMetric *)self _formatDeltaKbAsMbString:[(AXMetric *)self dirtyMemoryDelta]];
    [v6 appendFormat:@" [Dirty Memory:%@ %@]", v12, v13];

    v14 = [(AXMetric *)self _formatKbAsMbString:[(AXMetric *)self dirtyMemoryPeak]];
    objc_super v15 = [(AXMetric *)self _formatDeltaKbAsMbString:[(AXMetric *)self dirtyMemoryPeakDelta]];
    [v6 appendFormat:@" [Metric Peak:%@ %@]", v14, v15];

    v16 = [(AXMetric *)self _formatKbAsMbString:[(AXMetric *)self dirtyMemoryPeakLifetime]];
    [v6 appendFormat:@" [Global Peak:%@]\n", v16];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v17 = [(AXMetric *)self childMetrics];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      int64_t v21 = a4 + 1;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v22++) _appendToReport:v6 withIndentation:v21];
        }
        while (v19 != v22);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }
}

- (void)measure:(id)a3 execute:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = [(AXMetric *)self session];
  if ([v7 measurementsEnabled] && self->_perfCheckSession)
  {
    id v8 = [(AXMetric *)[AXBlockMetric alloc] _initWithName:v10 session:v7];
    uint64_t v9 = [(AXMetric *)self childMetrics];
    [v9 addObject:v8];

    [v8 _startMeasurement];
    v6[2](v6, v8);
    [v8 _endMeasurement];
  }
  else
  {
    AXSharedInertMetric();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }
}

- (id)measure:(id)a3 tryExecute:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [(AXMetric *)self session];
  if ([v8 measurementsEnabled] && self->_perfCheckSession)
  {
    id v9 = [(AXMetric *)[AXBlockMetric alloc] _initWithName:v6 session:v8];
    id v10 = [(AXMetric *)self childMetrics];
    [v10 addObject:v9];

    [v9 _startMeasurement];
    uint64_t v11 = v7[2](v7, v9);
    [v9 _endMeasurement];
  }
  else
  {
    AXSharedInertMetric();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = v7[2](v7, v9);
  }

  return v11;
}

- (id)startMeasure:(id)a3
{
  id v4 = a3;
  id v5 = [(AXMetric *)self session];
  if ([v5 measurementsEnabled] && self->_perfCheckSession)
  {
    id v6 = [(AXMetric *)[AXBookendMetric alloc] _initWithName:v4 session:v5];
    id v7 = [(AXMetric *)self childMetrics];
    [v7 addObject:v6];

    [v6 _startMeasurement];
  }
  else
  {
    AXSharedInertMetric();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)measurementsEnabled
{
  v2 = [(AXMetric *)self session];
  char v3 = [v2 measurementsEnabled];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int64_t)dirtyMemory
{
  return self->_dirtyMemory;
}

- (void)setDirtyMemory:(int64_t)a3
{
  self->_dirtyMemory = a3;
}

- (int64_t)dirtyMemoryDelta
{
  return self->_dirtyMemoryDelta;
}

- (void)setDirtyMemoryDelta:(int64_t)a3
{
  self->_dirtyMemoryDelta = a3;
}

- (int64_t)dirtyMemoryPeak
{
  return self->_dirtyMemoryPeak;
}

- (void)setDirtyMemoryPeak:(int64_t)a3
{
  self->_dirtyMemoryPeak = a3;
}

- (int64_t)dirtyMemoryPeakDelta
{
  return self->_dirtyMemoryPeakDelta;
}

- (void)setDirtyMemoryPeakDelta:(int64_t)a3
{
  self->_dirtyMemoryPeakDelta = a3;
}

- (int64_t)dirtyMemoryPeakLifetime
{
  return self->_dirtyMemoryPeakLifetime;
}

- (void)setDirtyMemoryPeakLifetime:(int64_t)a3
{
  self->_dirtyMemoryPeakLifetime = a3;
}

- (int64_t)cpuTime
{
  return self->_cpuTime;
}

- (void)setCpuTime:(int64_t)a3
{
  self->_cpuTime = a3;
}

- (int64_t)cpuInstructions
{
  return self->_cpuInstructions;
}

- (void)setCpuInstructions:(int64_t)a3
{
  self->_cpuInstructions = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (pc_session)perfCheckSession
{
  return self->_perfCheckSession;
}

- (void)setPerfCheckSession:(pc_session *)a3
{
  self->_perfCheckSession = a3;
}

- (NSMutableArray)childMetrics
{
  return self->_childMetrics;
}

- (void)setChildMetrics:(id)a3
{
}

- (AXMetricSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (AXMetricSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_childMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end