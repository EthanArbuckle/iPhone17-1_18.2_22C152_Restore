@interface GKGradient
+ (id)gradientWithColors:(id)a3 atLocations:(const double *)a4;
- (CGGradient)CGGradient;
- (GKGradient)initWithColors:(id)a3 atLocations:(const double *)a4;
- (void)dealloc;
@end

@implementation GKGradient

- (GKGradient)initWithColors:(id)a3 atLocations:(const double *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKGradient;
  v7 = [(GKGradient *)&v14 init];
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__GKGradient_initWithColors_atLocations___block_invoke;
    v12[3] = &unk_26478A388;
    id v13 = v8;
    CFArrayRef v9 = v8;
    [v6 enumerateObjectsUsingBlock:v12];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v7->_CGGradient = CGGradientCreateWithColors(DeviceRGB, v9, a4);
    CFRelease(DeviceRGB);
  }
  return v7;
}

uint64_t __41__GKGradient_initWithColors_atLocations___block_invoke(uint64_t a1, id a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 CGColor];
  return [v2 addObject:v3];
}

+ (id)gradientWithColors:(id)a3 atLocations:(const double *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithColors:v6 atLocations:a4];

  return v7;
}

- (void)dealloc
{
  CGGradient = self->_CGGradient;
  if (CGGradient) {
    CFRelease(CGGradient);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKGradient;
  [(GKGradient *)&v4 dealloc];
}

- (CGGradient)CGGradient
{
  return self->_CGGradient;
}

@end