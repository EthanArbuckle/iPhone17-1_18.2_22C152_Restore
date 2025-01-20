@interface _ANEIOSurfaceOutputSets
+ (BOOL)supportsSecureCoding;
+ (id)new;
+ (id)objectWithstatsSurRef:(__IOSurface *)a3 outputBuffer:(id)a4;
- (NSArray)outputBuffer;
- (_ANEIOSurfaceOutputSets)init;
- (_ANEIOSurfaceOutputSets)initWithCoder:(id)a3;
- (_ANEIOSurfaceOutputSets)initWithstatsSurRef:(__IOSurface *)a3 outputBuffer:(id)a4;
- (__IOSurface)statsSurRef;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ANEIOSurfaceOutputSets

+ (id)objectWithstatsSurRef:(__IOSurface *)a3 outputBuffer:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithstatsSurRef:a3 outputBuffer:v6];

  return v7;
}

+ (id)new
{
  return 0;
}

- (_ANEIOSurfaceOutputSets)init
{
  return 0;
}

- (_ANEIOSurfaceOutputSets)initWithstatsSurRef:(__IOSurface *)a3 outputBuffer:(id)a4
{
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (a3 && v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)_ANEIOSurfaceOutputSets;
    v10 = [(_ANEIOSurfaceOutputSets *)&v13 init];
    v11 = v10;
    if (v10)
    {
      v10->_statsSurRef = a3;
      objc_storeStrong((id *)&v10->_outputBuffer, a4);
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_ANEIOSurfaceOutputSets;
  [(_ANEIOSurfaceOutputSets *)&v2 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(_ANEIOSurfaceOutputSets *)self statsSurRef];
  id v7 = [(_ANEIOSurfaceOutputSets *)self outputBuffer];
  v8 = [v3 stringWithFormat:@"%@: { statsSurRef=%@  outputBuffer=%@}", v5, v6, v7];;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id XPCObject = IOSurfaceCreateXPCObject([(_ANEIOSurfaceOutputSets *)self statsSurRef]);
  [v4 encodeXPCObject:XPCObject forKey:@"statsSurRef"];
  v5 = [(_ANEIOSurfaceOutputSets *)self outputBuffer];
  [v4 encodeObject:v5 forKey:@"outputs"];
}

- (_ANEIOSurfaceOutputSets)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v7 = [v4 setWithArray:v6];

  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"outputs"];
  v9 = [v5 decodeXPCObjectForKey:@"statsSurRef"];

  if (v9)
  {
    IOSurfaceRef v10 = IOSurfaceLookupFromXPCObject(v9);
    self = [(_ANEIOSurfaceOutputSets *)self initWithstatsSurRef:v10 outputBuffer:v8];
    CFRelease(v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (__IOSurface)statsSurRef
{
  return self->_statsSurRef;
}

- (NSArray)outputBuffer
{
  return self->_outputBuffer;
}

- (void).cxx_destruct
{
}

@end