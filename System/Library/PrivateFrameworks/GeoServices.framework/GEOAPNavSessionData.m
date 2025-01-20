@interface GEOAPNavSessionData
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isCurrentRouteId:(id)a3;
- (BOOL)isEV;
- (GEOAPNavSessionData)init;
- (GEOAPNavSessionData)initWithCoder:(id)a3;
- (NSUUID)routeId;
- (NSUUID)sessionId;
- (double)accumulatedSessionDurationAt:(double)a3;
- (double)legStartTime;
- (void)clearNavSession;
- (void)encodeWithCoder:(id)a3;
- (void)endNavWithRouteId:(id)a3 at:(double)a4;
- (void)pauseNavWithRouteId:(id)a3 at:(double)a4;
- (void)rerollAt:(double)a3;
- (void)resumeNavWithRouteId:(id)a3 at:(double)a4;
- (void)startNavWithRouteId:(id)a3 isEV:(BOOL)a4 at:(double)a5;
@end

@implementation GEOAPNavSessionData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOAPNavSessionData)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAPNavSessionData;
  v2 = [(GEOAPNavSessionData *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isEV = 257;
    v2->_startTime = 0.0;
    v2->_accumulatedNavTime = 0.0;
    routeId = v2->_routeId;
    v2->_routeId = 0;

    sessionId = v3->_sessionId;
    v3->_sessionId = 0;
  }
  return v3;
}

- (GEOAPNavSessionData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOAPNavSessionData;
  v5 = [(GEOAPNavSessionData *)&v13 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"a"];
    v5->_accumulatedNavTime = v6;
    v5->_isEV = [v4 decodeBoolForKey:@"e"];
    v5->_isPaused = [v4 decodeBoolForKey:@"p"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];
    routeId = v5->_routeId;
    v5->_routeId = (NSUUID *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSUUID *)v9;

    [v4 decodeDoubleForKey:@"t"];
    v5->_startTime = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double accumulatedNavTime = self->_accumulatedNavTime;
  id v5 = a3;
  [v5 encodeDouble:@"a" forKey:accumulatedNavTime];
  [v5 encodeBool:self->_isEV forKey:@"e"];
  [v5 encodeBool:self->_isPaused forKey:@"p"];
  [v5 encodeObject:self->_routeId forKey:@"r"];
  [v5 encodeObject:self->_sessionId forKey:@"s"];
  [v5 encodeDouble:@"t" forKey:self->_startTime];
}

- (BOOL)isActive
{
  return self->_routeId && !self->_isPaused;
}

- (double)legStartTime
{
  if ([(GEOAPNavSessionData *)self isActive]) {
    return self->_startTime;
  }
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
  double result = 0.0;
  if (v4)
  {
    *(_WORD *)id v5 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [self isActive]", v5, 2u);
    return 0.0;
  }
  return result;
}

- (double)accumulatedSessionDurationAt:(double)a3
{
  double v3 = 0.0;
  if (!self->_isPaused) {
    double v3 = a3 - self->_startTime;
  }
  return v3 + self->_accumulatedNavTime;
}

- (void)startNavWithRouteId:(id)a3 isEV:(BOOL)a4 at:(double)a5
{
  objc_storeStrong((id *)&self->_routeId, a3);
  id v11 = a3;
  self->_isEV = a4;
  self->_startTime = a5;
  self->_double accumulatedNavTime = 0.0;
  self->_isPaused = 0;
  uint64_t v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
  sessionId = self->_sessionId;
  self->_sessionId = v9;
}

- (void)pauseNavWithRouteId:(id)a3 at:(double)a4
{
  self->_isPaused = 1;
  self->_double accumulatedNavTime = self->_accumulatedNavTime + a4 - self->_startTime;
  self->_startTime = 0.0;
}

- (void)resumeNavWithRouteId:(id)a3 at:(double)a4
{
  self->_isPaused = 0;
  self->_startTime = a4;
  id v5 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
  sessionId = self->_sessionId;
  self->_sessionId = v5;
}

- (void)endNavWithRouteId:(id)a3 at:(double)a4
{
  routeId = self->_routeId;
  self->_routeId = 0;

  self->_double accumulatedNavTime = self->_accumulatedNavTime + a4 - self->_startTime;
  self->_startTime = 0.0;
}

- (void)clearNavSession
{
  self->_isEV = 1;
  routeId = self->_routeId;
  self->_routeId = 0;

  sessionId = self->_sessionId;
  self->_sessionId = 0;

  self->_startTime = 0.0;
}

- (BOOL)isCurrentRouteId:(id)a3
{
  return [(NSUUID *)self->_routeId isEqual:a3];
}

- (void)rerollAt:(double)a3
{
  id v5 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
  sessionId = self->_sessionId;
  self->_sessionId = v5;

  self->_startTime = a3;
}

- (NSUUID)routeId
{
  return self->_routeId;
}

- (NSUUID)sessionId
{
  return self->_sessionId;
}

- (BOOL)isEV
{
  return self->_isEV;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);

  objc_storeStrong((id *)&self->_routeId, 0);
}

@end