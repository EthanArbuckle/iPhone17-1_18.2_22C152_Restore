@interface _MLCANEIOSurface
+ (id)objectWithDataLength:(unint64_t)a3 liveIOStatus:(id)a4;
+ (void)initialize;
- (NSDictionary)liveIOStatus;
- (_ANEIOSurfaceObject)ioSurfaceObject;
- (_MLCANEIOSurface)initWithDataLength:(unint64_t)a3 liveIOStatus:(id)a4;
- (__IOSurface)createIOSurface1x1WithLength:(unint64_t)a3;
- (id)aneIOSurfaceObjectWithDataLength:(unint64_t)a3;
@end

@implementation _MLCANEIOSurface

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_0);
  }
}

+ (id)objectWithDataLength:(unint64_t)a3 liveIOStatus:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithDataLength:a3 liveIOStatus:v6];

  return v7;
}

- (_MLCANEIOSurface)initWithDataLength:(unint64_t)a3 liveIOStatus:(id)a4
{
  id v8 = a4;
  if (!gIsAppleNeuralEngineAvailable)
  {
    v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEIOSurface initWithDataLength:liveIOStatus:](a2);
    }
    goto LABEL_11;
  }
  v9 = [(_MLCANEIOSurface *)self aneIOSurfaceObjectWithDataLength:a3];
  if (!v9)
  {
    v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEIOSurface initWithDataLength:liveIOStatus:](a2);
    }

LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)_MLCANEIOSurface;
  v10 = [(_MLCANEIOSurface *)&v15 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ioSurfaceObject, v9);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_12:

  return v12;
}

- (__IOSurface)createIOSurface1x1WithLength:(unint64_t)a3
{
  v4 = (void *)MEMORY[0x1E01B11E0](self, a2);
  v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  id v6 = [NSNumber numberWithUnsignedLong:a3];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2F2C0]];

  [v5 setObject:&unk_1F3876708 forKeyedSubscript:*MEMORY[0x1E4F2F0E8]];
  v7 = [NSNumber numberWithUnsignedLong:a3];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2EFE0]];

  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFDictionaryRef)v5);
  v9 = IOSurfaceCreate(Copy);
  CFRelease(Copy);

  return v9;
}

- (id)aneIOSurfaceObjectWithDataLength:(unint64_t)a3
{
  v4 = [(_MLCANEIOSurface *)self createIOSurface1x1WithLength:a3];
  if (v4)
  {
    v5 = v4;
    id v6 = [softLinkClass_ANEIOSurfaceObject() objectWithIOSurface:v4];
    CFRelease(v5);
  }
  else
  {
    v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEIOSurface aneIOSurfaceObjectWithDataLength:](a2);
    }

    id v6 = 0;
  }

  return v6;
}

- (_ANEIOSurfaceObject)ioSurfaceObject
{
  return self->_ioSurfaceObject;
}

- (NSDictionary)liveIOStatus
{
  return self->_liveIOStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveIOStatus, 0);

  objc_storeStrong((id *)&self->_ioSurfaceObject, 0);
}

- (void)initWithDataLength:(const char *)a1 liveIOStatus:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: AppleNeuralEngine framework is not available", v4, v5, v6, v7, 2u);
}

- (void)initWithDataLength:(const char *)a1 liveIOStatus:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to create an IOSurface object", v4, v5, v6, v7, 2u);
}

- (void)aneIOSurfaceObjectWithDataLength:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to allocate an IOSurface", v4, v5, v6, v7, 2u);
}

@end