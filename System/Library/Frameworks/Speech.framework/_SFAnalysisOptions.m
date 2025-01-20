@interface _SFAnalysisOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)keepANEModelLoaded;
- (NSString)aneContext;
- (NSString)cpuContext;
- (NSString)gpuContext;
- (_SFAnalysisOptions)initWithCoder:(id)a3;
- (_SFAnalysisOptions)initWithPriority:(int64_t)a3 aneContext:(id)a4 cpuContext:(id)a5 gpuContext:(id)a6 keepANEModelLoaded:(BOOL)a7;
- (int64_t)priority;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFAnalysisOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gpuContext, 0);
  objc_storeStrong((id *)&self->_cpuContext, 0);

  objc_storeStrong((id *)&self->_aneContext, 0);
}

- (BOOL)keepANEModelLoaded
{
  return self->_keepANEModelLoaded;
}

- (NSString)gpuContext
{
  return self->_gpuContext;
}

- (NSString)cpuContext
{
  return self->_cpuContext;
}

- (NSString)aneContext
{
  return self->_aneContext;
}

- (int64_t)priority
{
  return self->_priority;
}

- (_SFAnalysisOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFAnalysisOptions;
  v5 = [(_SFAnalysisOptions *)&v13 init];
  if (v5)
  {
    v5->_priority = [v4 decodeIntegerForKey:@"_priority"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_aneContext"];
    aneContext = v5->_aneContext;
    v5->_aneContext = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cpuContext"];
    cpuContext = v5->_cpuContext;
    v5->_cpuContext = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_gpuContext"];
    gpuContext = v5->_gpuContext;
    v5->_gpuContext = (NSString *)v10;

    v5->_keepANEModelLoaded = [v4 decodeBoolForKey:@"_keepANEModelLoaded"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t priority = self->_priority;
  id v5 = a3;
  [v5 encodeInteger:priority forKey:@"_priority"];
  [v5 encodeObject:self->_aneContext forKey:@"_aneContext"];
  [v5 encodeObject:self->_cpuContext forKey:@"_cpuContext"];
  [v5 encodeObject:self->_gpuContext forKey:@"_gpuContext"];
  [v5 encodeBool:self->_keepANEModelLoaded forKey:@"_keepANEModelLoaded"];
}

- (_SFAnalysisOptions)initWithPriority:(int64_t)a3 aneContext:(id)a4 cpuContext:(id)a5 gpuContext:(id)a6 keepANEModelLoaded:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_SFAnalysisOptions;
  v15 = [(_SFAnalysisOptions *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_int64_t priority = a3;
    uint64_t v17 = [v12 copy];
    aneContext = v16->_aneContext;
    v16->_aneContext = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    cpuContext = v16->_cpuContext;
    v16->_cpuContext = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    gpuContext = v16->_gpuContext;
    v16->_gpuContext = (NSString *)v21;

    v16->_keepANEModelLoaded = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end