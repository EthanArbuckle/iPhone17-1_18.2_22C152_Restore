@interface EAGLContext
+ (BOOL)setCurrentContext:(EAGLContext *)context;
+ (EAGLContext)currentContext;
- (BOOL)attachImage:(unint64_t)a3 toCoreSurface:(__IOSurface *)a4 invertedRender:(BOOL)a5;
- (BOOL)isMultiThreaded;
- (BOOL)presentRenderbuffer:(NSUInteger)target;
- (BOOL)presentRenderbuffer:(NSUInteger)target afterMinimumDuration:(CFTimeInterval)duration;
- (BOOL)presentRenderbuffer:(NSUInteger)target atTime:(CFTimeInterval)presentationTime;
- (BOOL)renderbufferStorage:(NSUInteger)target fromDrawable:(id)drawable;
- (BOOL)setBlockFence:(id)a3 onQueue:(id)a4;
- (BOOL)texImageIOSurface:(IOSurfaceRef)ioSurface target:(NSUInteger)target internalFormat:(NSUInteger)internalFormat width:(uint32_t)width height:(uint32_t)height format:(NSUInteger)format type:(NSUInteger)type plane:(uint32_t)plane;
- (BOOL)texImageIOSurface:(__IOSurface *)a3 target:(unint64_t)a4 internalFormat:(unint64_t)a5 width:(unsigned int)a6 height:(unsigned int)a7 format:(unint64_t)a8 type:(unint64_t)a9 plane:(unsigned int)a10 invert:(BOOL)a11;
- (EAGLContext)init;
- (EAGLContext)initWithAPI:(EAGLRenderingAPI)api;
- (EAGLContext)initWithAPI:(EAGLRenderingAPI)api sharegroup:(EAGLSharegroup *)sharegroup;
- (EAGLContext)initWithAPI:(unint64_t)a3 properties:(id)a4;
- (EAGLContext)initWithAPI:(unint64_t)a3 sharedWithCompute:(BOOL)a4;
- (EAGLMacroContext)getMacroContextPrivate;
- (EAGLRenderingAPI)API;
- (EAGLSharegroup)sharegroup;
- (NSString)debugLabel;
- (id)commonInitWithAPI:(unint64_t)a3 properties:(id)a4;
- (unint64_t)getParameter:(unsigned int)a3 to:(int *)a4;
- (unint64_t)setParameter:(unsigned int)a3 to:(int *)a4;
- (void)dealloc;
- (void)setDebugLabel:(NSString *)debugLabel;
- (void)setMultiThreaded:(BOOL)multiThreaded;
@end

@implementation EAGLContext

- (EAGLContext)init
{
}

- (EAGLContext)initWithAPI:(EAGLRenderingAPI)api
{
  return [(EAGLContext *)self initWithAPI:api properties:0];
}

- (EAGLContext)initWithAPI:(unint64_t)a3 sharedWithCompute:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v4), @"EAGLContextPropertySharedWithCompute");
  v8 = [(EAGLContext *)self initWithAPI:a3 properties:v7];

  return v8;
}

- (EAGLContext)initWithAPI:(EAGLRenderingAPI)api sharegroup:(EAGLSharegroup *)sharegroup
{
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = v7;
  if (sharegroup) {
    [v7 setObject:sharegroup forKey:@"EAGLContextPropertySharegroup"];
  }
  v9 = [(EAGLContext *)self commonInitWithAPI:api properties:v8];

  return v9;
}

- (EAGLContext)initWithAPI:(unint64_t)a3 properties:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  if (!a4)
  {
    v9 = (void *)MEMORY[0x2166732F0](self, a2);
    v12 = @"EAGLContextPropertySharedWithCompute";
    v13[0] = MEMORY[0x263EFFA80];
    v10 = -[EAGLContext commonInitWithAPI:properties:](self, "commonInitWithAPI:properties:", a3, [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1]);
    return v10;
  }
  int v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"EAGLContextPropertyClientLabel"), "intValue");
  if ((v7 - 1) >= 8)
  {
    if (v7)
    {

      return 0;
    }
    else
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:a4 copyItems:0];
      objc_msgSend(v11, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1), @"EAGLContextPropertyClientLabel");
      v10 = [(EAGLContext *)self commonInitWithAPI:a3 properties:v11];
    }
    return v10;
  }

  return (EAGLContext *)[(EAGLContext *)self commonInitWithAPI:a3 properties:a4];
}

- (id)commonInitWithAPI:(unint64_t)a3 properties:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)EAGLContext;
  v6 = [(EAGLContext *)&v21 init];
  if (!v6) {
    return v6;
  }
  int v7 = (void *)[a4 objectForKey:@"EAGLContextPropertySharegroup"];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"EAGLContextPropertySharedWithCompute"), "BOOLValue");
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      fprintf_l((FILE *)*MEMORY[0x263EF8348], 0, "%s: not a valid sharegroup\n", "-[EAGLContext commonInitWithAPI:properties:]");
      goto LABEL_24;
    }
    v9 = v7;
  }
  else
  {
    v9 = [[EAGLSharegroup alloc] initWithAPI:a3 sharedWithCompute:v8];
  }
  v10 = v9;
  if (!v9 || [(EAGLSharegroup *)v9 APIs] != a3) {
    goto LABEL_24;
  }
  v11 = (_EAGLContextPrivate *)malloc_type_calloc(1uLL, 0x40E8uLL, 0x10A00409BC24E64uLL);
  v6->_private = v11;
  if (!v11)
  {

    goto LABEL_24;
  }
  uint64_t v12 = 0;
  *((void *)v11 + 1) = v10;
  *((void *)v11 + 2) = a3;
  *(void *)v11 = v6;
  *((_DWORD *)v11 + 6) = 0;
  if (a3 - 1 <= 2) {
    uint64_t v12 = dword_2107FF308[a3 - 1];
  }
  v13 = v10->_private;
  if (*((_DWORD *)v13 + 2) != 1) {
    goto LABEL_29;
  }
  if (off_26AB590D0((char *)v11 + 32, *((void *)v13 + 2), *((void *)v13 + 3), (char *)v11 + 40, (char *)v11 + 8328, v12))
  {
LABEL_24:

    return 0;
  }
  int v14 = commonInitWithAPI_properties__EAGL_MTENGINE_FLAG;
  if (commonInitWithAPI_properties__EAGL_MTENGINE_FLAG == -1)
  {
    v15 = getenv("EAGL_MTENGINE_FLAG");
    int v14 = (v15 || (v15 = getenv("ATF_GL_MTENGINE")) != 0) && *v15 != 48;
    commonInitWithAPI_properties__EAGL_MTENGINE_FLAG = v14;
  }
  if (v14)
  {
    int v20 = 1;
    off_26AB590F0(*((void *)v6->_private + 4), 313, &v20);
  }
  unsigned int v16 = gfxLinkedOSVersion();
  int v20 = v16;
  off_26AB590F0(*((void *)v6->_private + 4), 701, &v20);
  if (v16 <= 2)
  {
    int v19 = 1;
    off_26AB590F0(*((void *)v6->_private + 4), 995, &v19);
LABEL_27:
    int v19 = 1;
    off_26AB590F0(*((void *)v6->_private + 4), 929, &v19);
    int v18 = 1;
    off_26AB590F0(*((void *)v6->_private + 4), 928, &v18);
    goto LABEL_28;
  }
  if (v16 == 3) {
    goto LABEL_27;
  }
LABEL_28:
  int v19 = v12 & 0x40;
  off_26AB590F0(*((void *)v6->_private + 4), 927, &v19);
  int v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"EAGLContextPropertyClientLabel"), "intValue");
  off_26AB590F0(*((void *)v6->_private + 4), 703, &v20);
LABEL_29:
  LOBYTE(v20) = 0;
  if (eagl_dict_read_BOOL(a4, @"EAGLContextPropertyClientRetainRelease", &v20)
    && (_BYTE)v20)
  {
    *((_DWORD *)v6->_private + 6) |= 1u;
  }
  return v6;
}

- (void)dealloc
{
  v3 = self->_private;
  if (v3)
  {
    if (*((void *)v3 + 4) && *(_DWORD *)(*(void *)(*((void *)v3 + 1) + 8) + 8) == 1)
    {
      off_26AB590D8();
      v3 = self->_private;
    }
    *((void *)v3 + 4) = 0;
    bzero((char *)self->_private + 40, 0x2060uLL);
    bzero((char *)self->_private + 8328, 0x2060uLL);
    BOOL v4 = self->_private;
    v5 = (void *)*((void *)v4 + 1);
    if (v5)
    {

      BOOL v4 = self->_private;
      *((void *)v4 + 1) = 0;
    }
    free(v4);
    self->_private = 0;
  }
  [(EAGLContext *)self setDebugLabel:0];
  v6.receiver = self;
  v6.super_class = (Class)EAGLContext;
  [(EAGLContext *)&v6 dealloc];
}

+ (BOOL)setCurrentContext:(EAGLContext *)context
{
  BOOL v4 = *(_EAGLContextPrivate **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 240);
  if (context) {
    v5 = context->_private;
  }
  else {
    v5 = 0;
  }
  if (v4 == v5)
  {
LABEL_13:
    LOBYTE(v6) = 1;
    return v6;
  }
  BOOL v6 = eagl_ctx_tls_set(v5);
  if (v6)
  {
    if (context && (*((unsigned char *)context->_private + 24) & 1) == 0) {
      int v7 = context;
    }
    if (v4)
    {
      uint64_t v8 = *(void **)v4;
      if (*(void *)v4)
      {
        if ((*(unsigned char *)(v8[1] + 24) & 1) == 0) {
      }
        }
    }
    goto LABEL_13;
  }
  return v6;
}

+ (EAGLContext)currentContext
{
  v2 = *(EAGLContext ***)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 240);
  if (v2) {
    return *v2;
  }
  else {
    return 0;
  }
}

- (EAGLRenderingAPI)API
{
  return *((void *)self->_private + 2);
}

- (EAGLSharegroup)sharegroup
{
  return (EAGLSharegroup *)*((void *)self->_private + 1);
}

- (BOOL)isMultiThreaded
{
  int v3 = 0;
  [(EAGLContext *)self getParameter:313 to:&v3];
  return v3 != 0;
}

- (void)setMultiThreaded:(BOOL)multiThreaded
{
  BOOL v3 = multiThreaded;
  [(EAGLContext *)self setParameter:313 to:&v3];
}

- (BOOL)renderbufferStorage:(NSUInteger)target fromDrawable:(id)drawable
{
  BOOL v4 = self;
  LOBYTE(self) = 0;
  unsigned __int8 v17 = 0;
  if (target != 36161) {
    return (char)self;
  }
  if (drawable)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (uint64_t v6 = [drawable performSelector:sel_nativeWindow]) == 0)
    {
      fprintf_l((FILE *)*MEMORY[0x263EF8348], 0, "%s: invalid drawable\n");
      goto LABEL_30;
    }
    uint64_t v7 = v6;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v8 = (void *)[drawable performSelector:sel_drawableProperties];
      if (v8)
      {
        v9 = v8;
        char v10 = eagl_dict_read_BOOL(v8, @"EAGLDrawablePropertyRetained", &v17);
        v11 = (__CFString *)[v9 objectForKey:@"EAGLDrawablePropertyColorFormat"];
        uint64_t v12 = 32856;
        if (v11 != @"EAGLColorFormat8888" && v11)
        {
          if (v11 == @"EAGLColorFormat565")
          {
            uint64_t v12 = 36194;
          }
          else if (v11 == @"EAGLColorFormatS8888")
          {
            uint64_t v12 = 35907;
          }
          else if (v11 == @"EAGLColorFormatSRGB_XR10")
          {
            uint64_t v12 = 37874;
          }
          else if (v11 == @"EAGLColorFormatRGBA_XR10_64BPP")
          {
            uint64_t v12 = 35446;
          }
          else
          {
            if (v11 != @"EAGLColorFormatSRGBA_XR10_64BPP")
            {
              if (v11 == @"EAGLColorFormatSRGB_XR10_A8_2P") {
                uint64_t v12 = 37881;
              }
              else {
                uint64_t v12 = 32856;
              }
              if (v11 == @"EAGLColorFormatSRGB_XR10_A8_2P") {
                char v13 = v10;
              }
              else {
                char v13 = 0;
              }
              if ((v13 & 1) == 0) {
                goto LABEL_38;
              }
              goto LABEL_26;
            }
            uint64_t v12 = 35447;
          }
        }
        if ((v10 & 1) == 0)
        {
LABEL_38:
          fprintf_l((FILE *)*MEMORY[0x263EF8348], 0, "%s: invalid property values\n");
          goto LABEL_30;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v12 = 32856;
LABEL_26:
  int v14 = v4->_private;
  if (*(_DWORD *)(*(void *)(*((void *)v14 + 1) + 8) + 8) != 1)
  {
LABEL_30:
    LOBYTE(self) = 0;
    return (char)self;
  }
  uint64_t v15 = v17;
  off_26AB59128(*((void *)v14 + 4), 0, 0, 0);
  if (!drawable || (LODWORD(self) = off_26AB59128(*((void *)v4->_private + 4), v7, v15, v12), self)) {
    LOBYTE(self) = 1;
  }
  return (char)self;
}

- (BOOL)presentRenderbuffer:(NSUInteger)target
{
  BOOL v3 = self->_private;
  int v4 = *(_DWORD *)(*(void *)(*((void *)v3 + 1) + 8) + 8);
  if (v4 == 1) {
    off_26AB59130(*((void *)v3 + 4), 0, target, 0.0);
  }
  return v4 == 1;
}

- (BOOL)presentRenderbuffer:(NSUInteger)target atTime:(CFTimeInterval)presentationTime
{
  int v4 = self->_private;
  int v5 = *(_DWORD *)(*(void *)(*((void *)v4 + 1) + 8) + 8);
  if (v5 == 1) {
    off_26AB59130(*((void *)v4 + 4), 0, target, presentationTime);
  }
  return v5 == 1;
}

- (BOOL)presentRenderbuffer:(NSUInteger)target afterMinimumDuration:(CFTimeInterval)duration
{
  int v4 = self->_private;
  int v5 = *(_DWORD *)(*(void *)(*((void *)v4 + 1) + 8) + 8);
  if (v5 == 1) {
    off_26AB59130(*((void *)v4 + 4), 1, target, duration);
  }
  return v5 == 1;
}

- (BOOL)attachImage:(unint64_t)a3 toCoreSurface:(__IOSurface *)a4 invertedRender:(BOOL)a5
{
  if (*(_DWORD *)(*(void *)(*((void *)self->_private + 1) + 8) + 8) != 1) {
    return 0;
  }
  signed int PixelFormat = IOSurfaceGetPixelFormat(a4);
  if (PixelFormat > 1278555444)
  {
    if (PixelFormat <= 1395864161)
    {
      if (PixelFormat != 1278555445)
      {
        if (PixelFormat == 1278555701)
        {
          uint64_t v10 = 6407;
          if (a3 == 36161) {
            uint64_t v11 = 36194;
          }
          else {
            uint64_t v11 = 6407;
          }
          uint64_t v12 = 33635;
          goto LABEL_39;
        }
        if (PixelFormat == 1380401729)
        {
          uint64_t v10 = 6408;
          if (a3 == 36161) {
            uint64_t v11 = 32856;
          }
          else {
            uint64_t v11 = 6408;
          }
          uint64_t v12 = 33639;
          goto LABEL_39;
        }
        goto LABEL_40;
      }
LABEL_25:
      uint64_t v10 = 6408;
      if (a3 == 36161) {
        uint64_t v11 = 32855;
      }
      else {
        uint64_t v11 = 6408;
      }
      uint64_t v12 = 32820;
      goto LABEL_39;
    }
    if (PixelFormat == 1932866865 || PixelFormat == 1395995957) {
      goto LABEL_25;
    }
    if (PixelFormat == 1395864162) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
  if (PixelFormat <= 1093677111)
  {
    if (PixelFormat == 875836468)
    {
      if (a3 == 36161) {
        uint64_t v11 = 32854;
      }
      else {
        uint64_t v11 = 6408;
      }
      uint64_t v12 = 32819;
      goto LABEL_38;
    }
    if (PixelFormat == 892679473) {
      goto LABEL_25;
    }
    goto LABEL_40;
  }
  switch(PixelFormat)
  {
    case 1093677112:
      uint64_t v12 = 5121;
      uint64_t v11 = 6406;
      uint64_t v10 = 6406;
      goto LABEL_39;
    case 1111970369:
LABEL_19:
      if (a3 == 36161) {
        uint64_t v11 = 32856;
      }
      else {
        uint64_t v11 = 6408;
      }
      uint64_t v12 = 33639;
LABEL_38:
      uint64_t v10 = 32993;
      goto LABEL_39;
    case 1278226488:
      uint64_t v12 = 5121;
      uint64_t v11 = 6409;
      uint64_t v10 = 6409;
LABEL_39:
      size_t Width = IOSurfaceGetWidth(a4);
      BYTE4(v15) = a5;
      LODWORD(v15) = 0;
      return -[EAGLContext texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:](self, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", a4, a3, v11, Width, IOSurfaceGetHeight(a4), v10, v12, v15);
  }
LABEL_40:
  fprintf_l((FILE *)*MEMORY[0x263EF8348], 0, "Unsupported IOSurface format: 0x%08x\n", PixelFormat);
  return 0;
}

- (BOOL)texImageIOSurface:(IOSurfaceRef)ioSurface target:(NSUInteger)target internalFormat:(NSUInteger)internalFormat width:(uint32_t)width height:(uint32_t)height format:(NSUInteger)format type:(NSUInteger)type plane:(uint32_t)plane
{
  BYTE4(v11) = 0;
  LODWORD(v11) = plane;
  return -[EAGLContext texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:](self, "texImageIOSurface:target:internalFormat:width:height:format:type:plane:invert:", ioSurface, target, internalFormat, *(void *)&width, *(void *)&height, format, type, v11);
}

- (BOOL)texImageIOSurface:(__IOSurface *)a3 target:(unint64_t)a4 internalFormat:(unint64_t)a5 width:(unsigned int)a6 height:(unsigned int)a7 format:(unint64_t)a8 type:(unint64_t)a9 plane:(unsigned int)a10 invert:(BOOL)a11
{
  int v11 = a8;
  int v14 = a5;
  IOSurfaceID v15 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  IOSurfaceID ID = IOSurfaceGetID(a3);
  BOOL v19 = v15;
  int v20 = v14;
  unsigned int v21 = a6;
  unsigned int v22 = a7;
  int v23 = v11;
  int v24 = a9;
  unsigned int v25 = a10;
  int v26 = 0;
  if (off_26AB590F0(*((void *)self->_private + 4), 910, &ID))
  {
    fprintf_l((FILE *)*MEMORY[0x263EF8348], 0, "Failed to create IOSurface image (texture)\n");
  }
  else
  {
    IOSurfaceID ID = v15;
    BOOL v19 = a11;
    if (!off_26AB590F0(*((void *)self->_private + 4), 921, &ID)) {
      return 1;
    }
    fprintf_l((FILE *)*MEMORY[0x263EF8348], 0, "Failed to create IOSurface image (inversion)\n");
  }
  return 0;
}

- (BOOL)setBlockFence:(id)a3 onQueue:(id)a4
{
  return ![(EAGLContext *)self setParameter:611 to:a4]
      && [(EAGLContext *)self setParameter:612 to:a3] == 0;
}

- (unint64_t)setParameter:(unsigned int)a3 to:(int *)a4
{
  int v4 = self->_private;
  if (*(_DWORD *)(*(void *)(*((void *)v4 + 1) + 8) + 8) == 1) {
    return off_26AB590F0(*((void *)v4 + 4), *(void *)&a3, a4);
  }
  else {
    return 10000;
  }
}

- (unint64_t)getParameter:(unsigned int)a3 to:(int *)a4
{
  int v4 = self->_private;
  if (*(_DWORD *)(*(void *)(*((void *)v4 + 1) + 8) + 8) == 1) {
    return off_26AB590F8(*((void *)v4 + 4), *(void *)&a3, a4);
  }
  else {
    return 10000;
  }
}

- (EAGLMacroContext)getMacroContextPrivate
{
  return (EAGLMacroContext *)((char *)self->_private + 32);
}

- (NSString)debugLabel
{
  return self->debugLabel;
}

- (void)setDebugLabel:(NSString *)debugLabel
{
}

@end