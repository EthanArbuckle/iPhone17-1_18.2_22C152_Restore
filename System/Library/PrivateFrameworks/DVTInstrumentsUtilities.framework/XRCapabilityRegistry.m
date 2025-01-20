@interface XRCapabilityRegistry
+ (id)applicationCapabilities;
+ (void)initialize;
- (XRCapabilityRegistry)init;
- (XRCapabilityRegistry)initWithRanges:(id)a3 unimplementedRecoveries:(id)a4 abandonedRecoveries:(id)a5;
- (_NSRange)supportedVersionsForCapability:(id)a3;
- (id)abandonedRecoveryForCapability:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)unimplementedRecoveryForCapability:(id)a3;
- (unint64_t)supportForCapability:(id)a3 versions:(_NSRange)a4;
- (void)registerCapability:(id)a3 versions:(_NSRange)a4;
- (void)setAbandonedRecoverySuggestion:(id)a3 forCapability:(id)a4;
- (void)setUnimplementedRecoverySuggestion:(id)a3 forCapability:(id)a4;
@end

@implementation XRCapabilityRegistry

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_2687AA0C8 = objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

+ (id)applicationCapabilities
{
  return (id)qword_2687AA0C8;
}

- (XRCapabilityRegistry)initWithRanges:(id)a3 unimplementedRecoveries:(id)a4 abandonedRecoveries:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)XRCapabilityRegistry;
  v12 = [(XRCapabilityRegistry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capabilityRanges, a3);
    objc_storeStrong((id *)&v13->_unimplementedRecoveries, a4);
    objc_storeStrong((id *)&v13->_abandonedRecoveries, a5);
  }

  return v13;
}

- (XRCapabilityRegistry)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v7 = [self initWithRanges:v6 unimplementedRecoveries:v3 abandonedRecoveries:v4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [XRCapabilityRegistry alloc];
  id v9 = [self->_capabilityRanges mutableCopyWithZone:v5];
  v14 = [self->_unimplementedRecoveries mutableCopyWithZone:v10];
  v19 = [self->_abandonedRecoveries mutableCopyWithZone:v15];
  v21 = [v4 initWithRanges:v20 unimplementedRecoveries:(uint64_t)v9 abandonedRecoveries:(uint64_t)v14];

  return v21;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)((uint64_t (*)(XRCapabilityRegistry *, char *, _NSZone *))MEMORY[0x270F9A6D0])(self, sel_copyWithZone_, a3);
}

- (void)registerCapability:(id)a3 versions:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v7 = (void *)MEMORY[0x263F08D40];
  id v8 = a3;
  [v7 setString:&v9 range:NSMakeRange(location, length)];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [self->_capabilityRanges setObject:(uint64_t)v13 forKeyedSubscript:(uint64_t)v8];
}

- (void)setAbandonedRecoverySuggestion:(id)a3 forCapability:(id)a4
{
  [self->_abandonedRecoveries setObject:a2 forKeyedSubscript:(uint64_t)a3];
}

- (void)setUnimplementedRecoverySuggestion:(id)a3 forCapability:(id)a4
{
  [self->_unimplementedRecoveries setObject:a2 forKeyedSubscript:(uint64_t)a3];
}

- (id)unimplementedRecoveryForCapability:(id)a3
{
  return (id)[self->_unimplementedRecoveries objectForKeyedSubscript:a2 withKey:v3 withKey:v4];
}

- (id)abandonedRecoveryForCapability:(id)a3
{
  return (id)[self->_abandonedRecoveries objectForKeyedSubscript:a2 atIndex:a3 withObject:v3 withObject:v4];
}

- (unint64_t)supportForCapability:(id)a3 versions:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = [self->_capabilityRanges objectForKeyedSubscript:a2 atIndex:a3 withRange:a4];
  uint64_t v11 = v6;
  if (v6)
  {
    NSUInteger v12 = [v6 rangeValueForRange:v7 inString:v8 limitedToRange:v9];
    NSUInteger v14 = v13;
    v20.NSUInteger location = location;
    v20.NSUInteger length = length;
    v21.NSUInteger location = v12;
    v21.NSUInteger length = v14;
    NSRange v15 = NSIntersectionRange(v20, v21);
    uint64_t v16 = 1;
    if (location + length <= v12 + v14) {
      uint64_t v16 = 2;
    }
    if (v15.location == location && v15.length == length) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v16;
    }
  }
  else
  {
    unint64_t v18 = 1;
  }

  return v18;
}

- (_NSRange)supportedVersionsForCapability:(id)a3
{
  v5 = [self->_capabilityRanges objectForKeyedSubscript:a2 withKey:a3 withKeyType:v3 withKeyTypeEncoding:v4];
  uint64_t v10 = v5;
  if (v5)
  {
    uint64_t v11 = [v5 rangeValueForRange:v6 withValue:v7 withValue:v8 withValue:v9];
    NSUInteger v13 = v12;
  }
  else
  {
    NSUInteger v13 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v14 = v11;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abandonedRecoveries, 0);
  objc_storeStrong((id *)&self->_unimplementedRecoveries, 0);

  objc_storeStrong((id *)&self->_capabilityRanges, 0);
}

@end