@interface AXSSMotionTrackingVideoFileInput
+ (BOOL)supportsSecureCoding;
+ (id)videoFileInputWithName:(id)a3;
- (AXSSMotionTrackingVideoFileInput)initWithCoder:(id)a3;
- (AXSSMotionTrackingVideoFileInput)initWithName:(id)a3;
- (AXSSMotionTrackingVideoFileInput)initWithPlistDictionary:(id)a3;
- (BOOL)isVideoFile;
- (BOOL)supportsExpressions;
- (NSString)_name;
- (NSString)name;
- (id)description;
- (id)plistDictionary;
- (unint64_t)trackingType;
- (void)encodeWithCoder:(id)a3;
- (void)set_name:(id)a3;
@end

@implementation AXSSMotionTrackingVideoFileInput

+ (id)videoFileInputWithName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length]) {
    v6 = (void *)[objc_alloc((Class)a1) initWithName:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (AXSSMotionTrackingVideoFileInput)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSSMotionTrackingVideoFileInput;
  v5 = [(AXSSMotionTrackingInput *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->__name;
    v5->__name = (NSString *)v6;
  }
  return v5;
}

- (NSString)name
{
  v2 = [(AXSSMotionTrackingVideoFileInput *)self _name];
  v3 = v2;
  if (v2 && [v2 length])
  {
    id v4 = [NSString stringWithFormat:@"%@ (Test Video File)", v3];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return (NSString *)v5;
}

- (unint64_t)trackingType
{
  return 1;
}

- (BOOL)isVideoFile
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AXSSMotionTrackingVideoFileInput *)self name];

  if (v4)
  {
    v5 = [(AXSSMotionTrackingVideoFileInput *)self _name];
    uint64_t v6 = NSStringFromSelector(sel_name);
    [v7 encodeObject:v5 forKey:v6];
  }
}

- (AXSSMotionTrackingVideoFileInput)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_name);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  if (v7 && [v7 length]) {
    v8 = (AXSSMotionTrackingVideoFileInput *)[objc_alloc((Class)objc_opt_class()) initWithName:v7];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXSSMotionTrackingVideoFileInput;
  id v4 = [(AXSSMotionTrackingVideoFileInput *)&v8 description];
  uint64_t v5 = [(AXSSMotionTrackingVideoFileInput *)self _name];
  uint64_t v6 = [v3 stringWithFormat:@"%@ <%@>", v4, v5];

  return v6;
}

- (BOOL)supportsExpressions
{
  return 1;
}

- (id)plistDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v13.receiver = self;
  v13.super_class = (Class)AXSSMotionTrackingVideoFileInput;
  id v4 = [(AXSSMotionTrackingInput *)&v13 plistDictionary];
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }
  uint64_t v5 = [(AXSSMotionTrackingVideoFileInput *)self _name];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(AXSSMotionTrackingVideoFileInput *)self _name];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      objc_super v9 = [(AXSSMotionTrackingVideoFileInput *)self _name];
      v10 = NSStringFromSelector(sel_name);
      [v3 setObject:v9 forKeyedSubscript:v10];
    }
  }
  v11 = (void *)[v3 copy];

  return v11;
}

- (AXSSMotionTrackingVideoFileInput)initWithPlistDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_name);
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
  {
    self = [(AXSSMotionTrackingVideoFileInput *)self initWithName:v6];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (NSString)_name
{
  return self->__name;
}

- (void)set_name:(id)a3
{
}

- (void).cxx_destruct
{
}

@end