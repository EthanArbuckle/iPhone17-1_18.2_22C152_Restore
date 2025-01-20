@interface DYExperiment
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)allowEarlyTermination;
- (BOOL)enableExperimentFinish;
- (BOOL)enablePerFrameTiming;
- (BOOL)enabled;
- (BOOL)isPresentFrameEnabled;
- (BOOL)usingModifiedArchive;
- (DYExperiment)init;
- (DYExperiment)initWithCoder:(id)a3;
- (DYExperiment)initWithName:(id)a3 results:(id)a4;
- (NSMutableDictionary)results;
- (NSString)captureArchivePath;
- (NSString)name;
- (double)frameTimeVariationLimit1;
- (double)frameTimeVariationLimit2;
- (double)frameTimeVariationRangeMax;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messageHandler;
- (int)traceMode;
- (unint64_t)profilingFlags;
- (unsigned)frameTimeArraySize;
- (unsigned)frameTimeVariationArraySize;
- (unsigned)repeatCount;
- (unsigned)warmupCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowEarlyTermination:(BOOL)a3;
- (void)setEnableExperimentFinish:(BOOL)a3;
- (void)setEnablePerFrameTiming:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrameTimeArraySize:(unsigned int)a3;
- (void)setFrameTimeVariationArraySize:(unsigned int)a3;
- (void)setFrameTimeVariationLimit1:(double)a3;
- (void)setFrameTimeVariationLimit2:(double)a3;
- (void)setFrameTimeVariationRangeMax:(double)a3;
- (void)setMessageHandler:(id)a3;
- (void)setProfilingFlags:(unint64_t)a3;
- (void)setRepeatCount:(unsigned int)a3;
- (void)setTraceMode:(int)a3;
- (void)setUsingModifiedArchive:(BOOL)a3;
- (void)setWarmupCount:(unsigned int)a3;
@end

@implementation DYExperiment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (mach_timebase_info *)MEMORY[0x263F3FA20];
    mach_timebase_info(v2);
  }
}

- (DYExperiment)init
{
  return 0;
}

- (DYExperiment)initWithName:(id)a3 results:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DYExperiment;
  v6 = [(DYExperiment *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_repeatCount = 128;
    v6->_warmupCount = 4;
    v6->_results = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:a4];
    *(_WORD *)&v7->_enableExperimentFinish = 1;
    v7->_name = (NSString *)[a3 copy];
    v7->_traceMode = 1;
    v7->_frameTimeArraySize = 32;
    v7->_frameTimeVariationArraySize = 8;
    v7->_profilingFlags = 0;
    v7->_frameTimeVariationLimit1 = 0.05;
    v7->_frameTimeVariationLimit2 = 0.1;
    v7->_frameTimeVariationRangeMax = 0.03;
    v7->_allowEarlyTermination = 1;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYExperiment)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DYExperiment;
  v4 = [(DYExperiment *)&v14 init];
  if (v4)
  {
    v4->_enabled = [a3 decodeBoolForKey:@"enabled"];
    v4->_enableExperimentFinish = [a3 decodeBoolForKey:@"enableExperimentFinish"];
    v4->_enablePerFrameTiming = [a3 decodeBoolForKey:@"enablePerFrameTiming"];
    v4->_repeatCount = [a3 decodeInt32ForKey:@"repeatCount"];
    v4->_warmupCount = [a3 decodeInt32ForKey:@"warmupCount"];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v4->_results = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0), @"results");
    v4->_captureArchivePath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"captureArchivePath"];
    v4->_name = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    v4->_traceMode = [a3 decodeInt32ForKey:@"traceMode"];
    v4->_profilingFlags = [a3 decodeInt64ForKey:@"profilingFlags"];
    v4->_frameTimeArraySize = [a3 decodeInt32ForKey:@"frameTimeArraySize"];
    v4->_frameTimeVariationArraySize = [a3 decodeInt32ForKey:@"frameTimeVariationArraySize"];
    [a3 decodeDoubleForKey:@"frameTimeVariationLimit1"];
    v4->_frameTimeVariationLimit1 = v10;
    [a3 decodeDoubleForKey:@"frameTimeVariationLimit2"];
    v4->_frameTimeVariationLimit2 = v11;
    [a3 decodeDoubleForKey:@"frameTimeVariationRangeMax"];
    v4->_frameTimeVariationRangeMax = v12;
    v4->_allowEarlyTermination = [a3 decodeBoolForKey:@"allowEarlyTermination"];
    v4->_usingModifiedArchive = [a3 decodeBoolForKey:@"usingModifiedArchive"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:self->_enableExperimentFinish forKey:@"enableExperimentFinish"];
  [a3 encodeBool:self->_enablePerFrameTiming forKey:@"enablePerFrameTiming"];
  [a3 encodeBool:self->_enabled forKey:@"enabled"];
  [a3 encodeInt32:self->_repeatCount forKey:@"repeatCount"];
  [a3 encodeInt32:self->_warmupCount forKey:@"warmupCount"];
  [a3 encodeObject:self->_results forKey:@"results"];
  [a3 encodeObject:self->_captureArchivePath forKey:@"captureArchivePath"];
  [a3 encodeObject:self->_name forKey:@"name"];
  [a3 encodeInt32:self->_traceMode forKey:@"traceMode"];
  [a3 encodeInt64:self->_profilingFlags forKey:@"profilingFlags"];
  [a3 encodeInt32:self->_frameTimeArraySize forKey:@"frameTimeArraySize"];
  [a3 encodeInt32:self->_frameTimeVariationArraySize forKey:@"frameTimeVariationArraySize"];
  [a3 encodeDouble:@"frameTimeVariationLimit1" forKey:self->_frameTimeVariationLimit1];
  [a3 encodeDouble:@"frameTimeVariationLimit2" forKey:self->_frameTimeVariationLimit2];
  [a3 encodeDouble:@"frameTimeVariationRangeMax" forKey:self->_frameTimeVariationRangeMax];
  [a3 encodeBool:self->_allowEarlyTermination forKey:@"allowEarlyTermination"];
  BOOL usingModifiedArchive = self->_usingModifiedArchive;
  [a3 encodeBool:usingModifiedArchive forKey:@"usingModifiedArchive"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:results:", self->_name, self->_results);
  *(_DWORD *)(v4 + 24) = self->_repeatCount;
  *(_DWORD *)(v4 + 28) = self->_warmupCount;
  *(unsigned char *)(v4 + 33) = self->_enableExperimentFinish;
  *(unsigned char *)(v4 + 34) = self->_enablePerFrameTiming;
  *(unsigned char *)(v4 + 32) = self->_enabled;
  *(void *)(v4 + 8) = [(NSString *)self->_captureArchivePath copy];
  *(_DWORD *)(v4 + 84) = self->_traceMode;
  *(void *)(v4 + 88) = self->_profilingFlags;
  *(_DWORD *)(v4 + 48) = self->_frameTimeArraySize;
  *(_DWORD *)(v4 + 52) = self->_frameTimeVariationArraySize;
  *(double *)(v4 + 56) = self->_frameTimeVariationLimit1;
  *(double *)(v4 + 64) = self->_frameTimeVariationLimit2;
  *(double *)(v4 + 72) = self->_frameTimeVariationRangeMax;
  *(unsigned char *)(v4 + 80) = self->_allowEarlyTermination;
  *(unsigned char *)(v4 + 96) = self->_usingModifiedArchive;
  return (id)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYExperiment;
  [(DYExperiment *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)DYExperiment;
  return (id)[NSString stringWithFormat:@"%@ name=%@ repeatCount=%u results=%@", -[DYExperiment description](&v3, sel_description), -[DYExperiment name](self, "name"), self->_repeatCount, self->_results];
}

- (BOOL)isPresentFrameEnabled
{
  return 1;
}

- (void)setRepeatCount:(unsigned int)a3
{
  if (a3 <= 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = a3;
  }
  self->_repeatCount = v3;
}

- (void)setFrameTimeArraySize:(unsigned int)a3
{
  if (a3 >= 4) {
    unsigned int v3 = a3;
  }
  else {
    unsigned int v3 = 4;
  }
  unsigned int v4 = (v3 - 1) | ((v3 - 1) >> 1) | (((v3 - 1) | ((v3 - 1) >> 1)) >> 2);
  unsigned int v5 = v4 | (v4 >> 4) | ((v4 | (v4 >> 4)) >> 8);
  self->_frameTimeArraySize = (v5 | HIWORD(v5)) + 1;
}

- (void)setFrameTimeVariationArraySize:(unsigned int)a3
{
  if (a3 >= 4) {
    unsigned int v3 = a3;
  }
  else {
    unsigned int v3 = 4;
  }
  unsigned int v4 = (v3 - 1) | ((v3 - 1) >> 1) | (((v3 - 1) | ((v3 - 1) >> 1)) >> 2);
  unsigned int v5 = v4 | (v4 >> 4) | ((v4 | (v4 >> 4)) >> 8);
  self->_frameTimeVariationArraySize = (v5 | HIWORD(v5)) + 1;
}

- (NSString)name
{
  if (self->_name) {
    return self->_name;
  }
  else {
    return (NSString *)@"name was not set!";
  }
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (unsigned)repeatCount
{
  return self->_repeatCount;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unsigned)warmupCount
{
  return self->_warmupCount;
}

- (void)setWarmupCount:(unsigned int)a3
{
  self->_warmupCount = a3;
}

- (BOOL)enableExperimentFinish
{
  return self->_enableExperimentFinish;
}

- (void)setEnableExperimentFinish:(BOOL)a3
{
  self->_enableExperimentFinish = a3;
}

- (BOOL)enablePerFrameTiming
{
  return self->_enablePerFrameTiming;
}

- (void)setEnablePerFrameTiming:(BOOL)a3
{
  self->_enablePerFrameTiming = a3;
}

- (NSString)captureArchivePath
{
  return self->_captureArchivePath;
}

- (int)traceMode
{
  return self->_traceMode;
}

- (void)setTraceMode:(int)a3
{
  self->_traceMode = a3;
}

- (unint64_t)profilingFlags
{
  return self->_profilingFlags;
}

- (void)setProfilingFlags:(unint64_t)a3
{
  self->_profilingFlags = a3;
}

- (unsigned)frameTimeArraySize
{
  return self->_frameTimeArraySize;
}

- (unsigned)frameTimeVariationArraySize
{
  return self->_frameTimeVariationArraySize;
}

- (double)frameTimeVariationLimit1
{
  return self->_frameTimeVariationLimit1;
}

- (void)setFrameTimeVariationLimit1:(double)a3
{
  self->_frameTimeVariationLimit1 = a3;
}

- (double)frameTimeVariationLimit2
{
  return self->_frameTimeVariationLimit2;
}

- (void)setFrameTimeVariationLimit2:(double)a3
{
  self->_frameTimeVariationLimit2 = a3;
}

- (double)frameTimeVariationRangeMax
{
  return self->_frameTimeVariationRangeMax;
}

- (void)setFrameTimeVariationRangeMax:(double)a3
{
  self->_frameTimeVariationRangeMax = a3;
}

- (BOOL)allowEarlyTermination
{
  return self->_allowEarlyTermination;
}

- (void)setAllowEarlyTermination:(BOOL)a3
{
  self->_allowEarlyTermination = a3;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
}

- (BOOL)usingModifiedArchive
{
  return self->_usingModifiedArchive;
}

- (void)setUsingModifiedArchive:(BOOL)a3
{
  self->_BOOL usingModifiedArchive = a3;
}

@end