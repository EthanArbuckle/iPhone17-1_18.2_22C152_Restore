@interface AXSSMotionTrackingInput
+ (BOOL)supportsSecureCoding;
+ (id)motionTrackingInputFromPlistDictionary:(id)a3;
- (AXSSMotionTrackingInput)init;
- (AXSSMotionTrackingInput)initWithCoder:(id)a3;
- (AXSSMotionTrackingInput)initWithPlistDictionary:(id)a3;
- (BOOL)isCamera;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMotionTrackingInput:(id)a3;
- (BOOL)isHIDDevice;
- (BOOL)isVideoFile;
- (BOOL)supportsExpressions;
- (BOOL)supportsLookAtPoint;
- (NSDictionary)plistDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation AXSSMotionTrackingInput

- (AXSSMotionTrackingInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSSMotionTrackingInput;
  return [(AXSSMotionTrackingInput *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSSMotionTrackingInput)initWithCoder:(id)a3
{
  return 0;
}

- (BOOL)isCamera
{
  return 0;
}

- (BOOL)isVideoFile
{
  return 0;
}

- (BOOL)isHIDDevice
{
  return 0;
}

- (BOOL)supportsExpressions
{
  return 0;
}

- (BOOL)supportsLookAtPoint
{
  return [(AXSSMotionTrackingInput *)self trackingType] != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [(AXSSMotionTrackingInput *)self plistDictionary];
  v4 = +[AXSSMotionTrackingInput motionTrackingInputFromPlistDictionary:v3];

  return v4;
}

- (BOOL)isEqualToMotionTrackingInput:(id)a3
{
  id v4 = a3;
  v5 = [(AXSSMotionTrackingInput *)self plistDictionary];
  v6 = [v4 plistDictionary];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(AXSSMotionTrackingInput *)self plistDictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AXSSMotionTrackingInput *)self isEqualToMotionTrackingInput:v4];

  return v5;
}

- (NSDictionary)plistDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([v4 length]) {
    [v2 setObject:v4 forKeyedSubscript:@"motionTrackingInputClass"];
  }
  BOOL v5 = (void *)[v2 copy];

  return (NSDictionary *)v5;
}

+ (id)motionTrackingInputFromPlistDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"motionTrackingInputClass"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (BOOL v5 = NSClassFromString(v4),
        [(objc_class *)v5 isSubclassOfClass:objc_opt_class()]))
  {
    v6 = (void *)[[v5 alloc] initWithPlistDictionary:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (AXSSMotionTrackingInput)initWithPlistDictionary:(id)a3
{
  return 0;
}

@end