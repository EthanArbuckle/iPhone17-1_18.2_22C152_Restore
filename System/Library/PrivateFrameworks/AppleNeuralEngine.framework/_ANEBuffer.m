@interface _ANEBuffer
+ (BOOL)supportsSecureCoding;
+ (id)bufferWithIOSurfaceObject:(id)a3 symbolIndex:(id)a4 source:(int64_t)a5;
+ (id)new;
- (NSNumber)symbolIndex;
- (_ANEBuffer)init;
- (_ANEBuffer)initWithCoder:(id)a3;
- (_ANEBuffer)initWithIOSurfaceObject:(id)a3 symbolIndex:(id)a4 source:(int64_t)a5;
- (_ANEIOSurfaceObject)ioSurfaceObject;
- (id)description;
- (int64_t)source;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ANEBuffer

+ (id)bufferWithIOSurfaceObject:(id)a3 symbolIndex:(id)a4 source:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithIOSurfaceObject:v9 symbolIndex:v8 source:a5];

  return v10;
}

+ (id)new
{
  return 0;
}

- (_ANEBuffer)init
{
  return 0;
}

- (_ANEBuffer)initWithIOSurfaceObject:(id)a3 symbolIndex:(id)a4 source:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)_ANEBuffer;
    v11 = [(_ANEBuffer *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_ioSurfaceObject, a3);
      objc_storeStrong((id *)&v12->_symbolIndex, a4);
      v12->_source = a5;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_ANEBuffer *)self ioSurfaceObject];
  v7 = [(_ANEBuffer *)self symbolIndex];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { ANEIOSurfaceObject=%@ ; symbolIndex=%@ ; ANEBufferProducerAgent=%lu}",
    v5,
    v6,
    v7,
  id v8 = [(_ANEBuffer *)self source]);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(_ANEBuffer *)self ioSurfaceObject];
  [v6 encodeObject:v4 forKey:@"ioSurfaceObject"];

  v5 = [(_ANEBuffer *)self symbolIndex];
  objc_msgSend(v6, "encodeInteger:forKey:", objc_msgSend(v5, "longValue"), @"symbolIndex");

  objc_msgSend(v6, "encodeInteger:forKey:", -[_ANEBuffer source](self, "source"), @"source");
}

- (_ANEBuffer)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v13, v14);

  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ioSurfaceObject"];
  id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"symbolIndex"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"source"];

  v11 = [(_ANEBuffer *)self initWithIOSurfaceObject:v8 symbolIndex:v9 source:v10];
  return v11;
}

- (_ANEIOSurfaceObject)ioSurfaceObject
{
  return self->_ioSurfaceObject;
}

- (NSNumber)symbolIndex
{
  return self->_symbolIndex;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolIndex, 0);
  objc_storeStrong((id *)&self->_ioSurfaceObject, 0);
}

@end