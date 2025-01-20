@interface DNDSLegacyBehaviorOverride
+ (BOOL)supportsSecureCoding;
- (DNDSLegacyBehaviorOverride)initWithCoder:(id)a3;
- (DNDSLegacyBehaviorOverride)initWithOverrideType:(unint64_t)a3 mode:(unint64_t)a4 effectiveIntervals:(id)a5;
- (NSArray)effectiveIntervals;
- (unint64_t)mode;
- (unint64_t)overrideType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDSLegacyBehaviorOverride

- (DNDSLegacyBehaviorOverride)initWithOverrideType:(unint64_t)a3 mode:(unint64_t)a4 effectiveIntervals:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DNDSLegacyBehaviorOverride;
  v9 = [(DNDSLegacyBehaviorOverride *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_overrideType = a3;
    v9->_mode = a4;
    uint64_t v11 = [v8 copy];
    effectiveIntervals = v10->_effectiveIntervals;
    v10->_effectiveIntervals = (NSArray *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDSLegacyBehaviorOverride)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"overrideType"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"overrideMode"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"effectiveIntervals"];

  uint64_t v11 = [(DNDSLegacyBehaviorOverride *)self initWithOverrideType:v5 mode:v6 effectiveIntervals:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDSLegacyBehaviorOverride overrideType](self, "overrideType"), @"overrideType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDSLegacyBehaviorOverride mode](self, "mode"), @"overrideMode");
  id v5 = [(DNDSLegacyBehaviorOverride *)self effectiveIntervals];
  [v4 encodeObject:v5 forKey:@"effectiveIntervals"];
}

- (unint64_t)overrideType
{
  return self->_overrideType;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSArray)effectiveIntervals
{
  return self->_effectiveIntervals;
}

- (void).cxx_destruct
{
}

@end