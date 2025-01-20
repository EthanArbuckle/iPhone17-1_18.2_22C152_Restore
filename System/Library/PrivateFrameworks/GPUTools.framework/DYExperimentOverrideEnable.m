@interface DYExperimentOverrideEnable
+ (BOOL)supportsSecureCoding;
- (BOOL)isPresentFrameEnabled;
- (DYExperimentOverrideEnable)initWithCoder:(id)a3;
- (DYExperimentOverrideEnable)initWithName:(id)a3;
- (DYExperimentOverrideEnable)initWithName:(id)a3 captureArchivePath:(id)a4 overrides:(id)a5;
- (NSMutableDictionary)properties;
- (NSSet)overrideTypeStrings;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DYExperimentOverrideEnable

- (DYExperimentOverrideEnable)initWithName:(id)a3
{
  return [(DYExperimentOverrideEnable *)self initWithName:a3 captureArchivePath:0 overrides:0];
}

- (DYExperimentOverrideEnable)initWithName:(id)a3 captureArchivePath:(id)a4 overrides:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DYExperimentOverrideEnable;
  v7 = [(DYExperiment *)&v9 initWithName:a3 results:0];
  if (v7)
  {
    v7->_overrideTypeStrings = (NSSet *)a5;
    v7->_properties = (NSMutableDictionary *)objc_opt_new();
    v7->super._captureArchivePath = (NSString *)a4;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYExperimentOverrideEnable)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DYExperimentOverrideEnable;
  v4 = -[DYExperiment initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->_overrideTypeStrings = (NSSet *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"overrideTypeStrings");
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v4->_properties = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0), @"properties");
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v4->_perFunctionProfilingData = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0), @"perFunctionProfilingData");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DYExperimentOverrideEnable;
  -[DYExperiment encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_overrideTypeStrings forKey:@"overrideTypeStrings"];
  [a3 encodeObject:self->_properties forKey:@"properties"];
  [a3 encodeObject:self->_perFunctionProfilingData forKey:@"perFunctionProfilingData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DYExperimentOverrideEnable;
  v4 = [(DYExperiment *)&v6 copyWithZone:a3];
  v4[14] = [(NSMutableDictionary *)self->_properties mutableCopy];
  v4[15] = [(NSSet *)self->_overrideTypeStrings copy];
  v4[16] = [(NSArray *)self->_perFunctionProfilingData copy];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYExperimentOverrideEnable;
  [(DYExperiment *)&v3 dealloc];
}

- (BOOL)isPresentFrameEnabled
{
  return ![(NSSet *)self->_overrideTypeStrings containsObject:@"DYFunctionPlayerOverrideDisablePresent"];
}

- (NSMutableDictionary)properties
{
  return self->_properties;
}

- (NSSet)overrideTypeStrings
{
  return self->_overrideTypeStrings;
}

@end