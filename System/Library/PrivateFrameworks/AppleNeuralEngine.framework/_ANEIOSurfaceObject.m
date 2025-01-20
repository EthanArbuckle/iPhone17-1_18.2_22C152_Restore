@interface _ANEIOSurfaceObject
+ (BOOL)supportsSecureCoding;
+ (_ANEIOSurfaceObject)new;
+ (_ANEIOSurfaceObject)objectWithIOSurface:(__IOSurface *)a3;
+ (_ANEIOSurfaceObject)objectWithIOSurface:(__IOSurface *)a3 startOffset:(id)a4;
+ (_ANEIOSurfaceObject)objectWithIOSurfaceNoRetain:(__IOSurface *)a3 startOffset:(id)a4;
+ (__IOSurface)createIOSurfaceWithWidth:(int)a3 pixel_size:(int)a4 height:(int)a5;
+ (__IOSurface)createIOSurfaceWithWidth:(int)a3 pixel_size:(int)a4 height:(int)a5 bytesPerElement:(int)a6;
- (NSNumber)startOffset;
- (_ANEIOSurfaceObject)init;
- (_ANEIOSurfaceObject)initWithCoder:(id)a3;
- (_ANEIOSurfaceObject)initWithIOSurface:(__IOSurface *)a3 startOffset:(id)a4 shouldRetain:(BOOL)a5;
- (__IOSurface)ioSurface;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ANEIOSurfaceObject

- (__IOSurface)ioSurface
{
  return self->_ioSurface;
}

+ (_ANEIOSurfaceObject)objectWithIOSurface:(__IOSurface *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithIOSurface:a3 startOffset:&unk_1F35EC140 shouldRetain:1];
  return (_ANEIOSurfaceObject *)v3;
}

- (_ANEIOSurfaceObject)initWithIOSurface:(__IOSurface *)a3 startOffset:(id)a4 shouldRetain:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)_ANEIOSurfaceObject;
    v10 = [(_ANEIOSurfaceObject *)&v13 init];
    if (v10)
    {
      if (v5) {
        CFRetain(a3);
      }
      v10->_ioSurface = a3;
      objc_storeStrong((id *)&v10->_startOffset, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (_ANEIOSurfaceObject)objectWithIOSurface:(__IOSurface *)a3 startOffset:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithIOSurface:a3 startOffset:v6 shouldRetain:1];

  return (_ANEIOSurfaceObject *)v7;
}

+ (_ANEIOSurfaceObject)objectWithIOSurfaceNoRetain:(__IOSurface *)a3 startOffset:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithIOSurface:a3 startOffset:v6 shouldRetain:0];

  return (_ANEIOSurfaceObject *)v7;
}

+ (_ANEIOSurfaceObject)new
{
  return 0;
}

- (_ANEIOSurfaceObject)init
{
  return 0;
}

- (void)dealloc
{
  ioSurface = self->_ioSurface;
  if (ioSurface) {
    CFRelease(ioSurface);
  }
  v4.receiver = self;
  v4.super_class = (Class)_ANEIOSurfaceObject;
  [(_ANEIOSurfaceObject *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(_ANEIOSurfaceObject *)self ioSurface];
  v7 = [(_ANEIOSurfaceObject *)self startOffset];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { ioSurface=%p ; startOffset=%lu }",
    v5,
    v6,
  v8 = [v7 unsignedIntegerValue]);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(_ANEIOSurfaceObject *)self ioSurface])
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject([(_ANEIOSurfaceObject *)self ioSurface]);
    [v5 encodeXPCObject:XPCObject forKey:@"_ANEIOSurface"];
  }
}

- (_ANEIOSurfaceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 decodeXPCObjectForKey:@"_ANEIOSurface"];
    id v6 = v5;
    if (v5)
    {
      IOSurfaceRef v7 = IOSurfaceLookupFromXPCObject(v5);
      self = [(_ANEIOSurfaceObject *)self initWithIOSurface:v7 startOffset:&unk_1F35EC140 shouldRetain:1];
      CFRelease(v7);

      id v6 = self;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (__IOSurface)createIOSurfaceWithWidth:(int)a3 pixel_size:(int)a4 height:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  v8 = (void *)MEMORY[0x1E0193890](a1, a2);
  id v9 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v10 = [NSNumber numberWithInt:v7];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F2F2C0]];

  v11 = [NSNumber numberWithInt:v5];
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2F0E8]];

  v12 = [NSNumber numberWithInt:(a4 * v7)];
  [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2EFE0]];

  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDictionaryRef)v9);
  v14 = IOSurfaceCreate(Copy);
  CFRelease(Copy);

  return v14;
}

+ (__IOSurface)createIOSurfaceWithWidth:(int)a3 pixel_size:(int)a4 height:(int)a5 bytesPerElement:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v9 = *(void *)&a3;
  v10 = (void *)MEMORY[0x1E0193890](a1, a2);
  v11 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  v12 = [NSNumber numberWithInt:v6];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2EFD8]];

  objc_super v13 = [NSNumber numberWithInt:v9];
  [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2F2C0]];

  v14 = [NSNumber numberWithInt:v7];
  [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F2F0E8]];

  v15 = [NSNumber numberWithInt:(a4 * v9 * v6)];
  [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F2EFE0]];

  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDictionaryRef)v11);
  v17 = IOSurfaceCreate(Copy);
  CFRelease(Copy);

  return v17;
}

- (NSNumber)startOffset
{
  return self->_startOffset;
}

- (void).cxx_destruct
{
}

@end