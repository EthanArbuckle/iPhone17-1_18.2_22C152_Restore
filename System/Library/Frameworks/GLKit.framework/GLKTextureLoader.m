@interface GLKTextureLoader
+ (GLKTextureInfo)cubeMapWithContentsOfFile:(NSString *)path options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)cubeMapWithContentsOfFiles:(NSArray *)paths options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)cubeMapWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)textureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)textureWithContentsOfData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)textureWithContentsOfFile:(NSString *)path options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)textureWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)outError;
+ (GLKTextureInfo)textureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)outError;
+ (id)_textureWithTexture:(id)a3 error:(id *)a4;
+ (id)_textureWithTextureTXR:(id)a3 error:(id *)a4;
+ (id)commonCubeMapWithContentsOfFiles:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7;
+ (id)commonCubeMapWithContentsOfURL:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7;
+ (id)commonTextureWithCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7;
+ (id)commonTextureWithContentsOfData:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7;
+ (id)commonTextureWithContentsOfURL:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7;
+ (id)commonTextureWithName:(id)a3 scaleFactor:(double)a4 bundle:(id)a5 options:(id)a6 error:(id *)a7 lock:(id)a8 glContext:(id)a9;
+ (id)lockAndSwitchContext:(id)a3 glContext:(id)a4;
+ (void)unlockAndRestoreContext:(id)a3 glContext:(id)a4;
- (BOOL)supportsASTC_LDR;
- (BOOL)supportsETC2;
- (EAGLContext)glContext;
- (GLKTextureLoader)initWithSharegroup:(EAGLSharegroup *)sharegroup;
- (NSLock)nsLock;
- (void)cubeMapWithContentsOfFile:(NSString *)path options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)cubeMapWithContentsOfFiles:(NSArray *)paths options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)cubeMapWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)dealloc;
- (void)setGlContext:(id)a3;
- (void)setNsLock:(id)a3;
- (void)setSupportsASTC_LDR:(BOOL)a3;
- (void)setSupportsETC2:(BOOL)a3;
- (void)textureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)textureWithContentsOfData:(NSData *)data options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)textureWithContentsOfFile:(NSString *)path options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)textureWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
- (void)textureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block;
@end

@implementation GLKTextureLoader

- (GLKTextureLoader)initWithSharegroup:(EAGLSharegroup *)sharegroup
{
  v6.receiver = self;
  v6.super_class = (Class)GLKTextureLoader;
  v4 = [(GLKTextureLoader *)&v6 init];
  if (v4)
  {
    -[GLKTextureLoader setGlContext:](v4, "setGlContext:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F146E8]), "initWithAPI:sharegroup:", -[EAGLSharegroup APIs](sharegroup, "APIs"), sharegroup));
    if ([(GLKTextureLoader *)v4 glContext])
    {
      [(GLKTextureLoader *)v4 setNsLock:objc_alloc_init(MEMORY[0x263F08958])];
      if ([(GLKTextureLoader *)v4 nsLock])
      {
        [(EAGLContext *)[(GLKTextureLoader *)v4 glContext] setDebugLabel:@"GLKTextureLoader"];
        return v4;
      }
      fwrite("Failed to create texture loader lock\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
      [(GLKTextureLoader *)v4 setGlContext:0];
    }
    else
    {
      fwrite("Failed to create texture loader context\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  [(GLKTextureLoader *)self setGlContext:0];
  [(GLKTextureLoader *)self setNsLock:0];
  v3.receiver = self;
  v3.super_class = (Class)GLKTextureLoader;
  [(GLKTextureLoader *)&v3 dealloc];
}

+ (id)lockAndSwitchContext:(id)a3 glContext:(id)a4
{
  [a3 lock];
  if (!a4) {
    return 0;
  }
  v5 = (void *)[MEMORY[0x263F146E8] currentContext];
  [MEMORY[0x263F146E8] setCurrentContext:a4];
  return v5;
}

+ (void)unlockAndRestoreContext:(id)a3 glContext:(id)a4
{
  if (a3)
  {
    glFlush();
    [MEMORY[0x263F146E8] setCurrentContext:a4];
  }

  [a3 unlock];
}

+ (id)_textureWithTexture:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  GLuint textures = 0;
  glGenTextures(1, &textures);
  if ([a3 uploadToGLTexture:textures error:a4])
  {
    if ([a3 dataCategory] != 5
      && [a3 isMipmapped]
      && [a3 numMipMapLevels] == 1)
    {
      glGenerateMipmap([a3 bindTarget]);
    }
    objc_super v6 = [GLKTextureInfo alloc];
    return [(GLKTextureInfo *)v6 initWithTexture:a3 textureName:textures];
  }
  else
  {
    glDeleteTextures(1, &textures);
    return 0;
  }
}

+ (id)_textureWithTextureTXR:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  GLuint textures = 0;
  glGenTextures(1, &textures);
  if ([a3 uploadToGLTexture:textures error:a4])
  {
    objc_super v6 = [GLKTextureInfo alloc];
    return [(GLKTextureInfo *)v6 initWithTextureTXR:a3 textureName:textures];
  }
  else
  {
    glDeleteTextures(1, &textures);
    return 0;
  }
}

+ (id)commonTextureWithContentsOfData:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  if (a3)
  {
    v11 = [[GLKTexture alloc] initWithData:a3 forceCubeMap:0 wasCubeMap:0 cubeMapIndex:0 options:a4 error:a5];
    if (v11)
    {
      v12 = v11;
      uint64_t v13 = [a1 lockAndSwitchContext:a6 glContext:a7];
      id v14 = +[GLKTextureLoader _textureWithTexture:v12 error:a5];
      [a1 unlockAndRestoreContext:a6 glContext:v13];

      return v14;
    }
  }
  else if (a5)
  {
    *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(1, @"Invalid NSData");
  }
  return 0;
}

+ (id)commonTextureWithContentsOfURL:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  if ([a3 isFileURL]
    && ([a3 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    if (a5)
    {
      uint64_t v14 = [NSString stringWithFormat:@"Could not find resource %@ at specified location.", objc_msgSend(a3, "lastPathComponent")];
      uint64_t v15 = 0;
      goto LABEL_11;
    }
    return 0;
  }
  id v20 = 0;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:a3 options:1 error:&v20];
  if (v20)
  {
    if (a5)
    {
      uint64_t v14 = [NSString stringWithFormat:@"Invalid NSData, %@", objc_msgSend(v20, "localizedDescription")];
      uint64_t v15 = 1;
LABEL_11:
      id v18 = 0;
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(v15, v14);
      return v18;
    }
    return 0;
  }
  if (!v13) {
    return 0;
  }
  v16 = [[GLKTexture alloc] initWithData:v13 forceCubeMap:0 wasCubeMap:0 cubeMapIndex:0 options:a4 error:a5];

  if (!v16) {
    return 0;
  }
  -[GLKTexture setLabel:](v16, "setLabel:", [a3 relativeString]);
  uint64_t v17 = [a1 lockAndSwitchContext:a6 glContext:a7];
  id v18 = +[GLKTextureLoader _textureWithTexture:v16 error:a5];
  [a1 unlockAndRestoreContext:a6 glContext:v17];

  return v18;
}

+ (id)commonTextureWithName:(id)a3 scaleFactor:(double)a4 bundle:(id)a5 options:(id)a6 error:(id *)a7 lock:(id)a8 glContext:(id)a9
{
  uint64_t v16 = [MEMORY[0x263F38378] defaultUICatalogForBundle:a5];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    id v18 = objc_alloc_init(MEMORY[0x263F7F238]);
    uint64_t v19 = [v17 namedTextureWithName:a3 scaleFactor:a4];
    if (v19)
    {
      id v20 = (void *)v19;
      v21 = (void *)MEMORY[0x21D472C10]();
      v22 = (void *)[v20 textureWithBufferAllocator:v18];
      id v23 = v22;
      switch([v22 pixelFormat])
      {
        case 150:
          if (!a7) {
            goto LABEL_21;
          }
          v24 = NSString;
          v25 = "BC6H_RGBFloat";
          break;
        case 151:
          if (!a7) {
            goto LABEL_21;
          }
          v24 = NSString;
          v25 = "BC6H_RGBUfloat";
          break;
        case 152:
          if (!a7) {
            goto LABEL_21;
          }
          v24 = NSString;
          v25 = "BC7_RGBAUnorm";
          break;
        case 153:
          if (!a7) {
            goto LABEL_21;
          }
          v24 = NSString;
          v25 = "BC7_RGBAUnorm_sRGB";
          break;
        default:
          if (v22
            && (!a9 ? (id v28 = (id)[MEMORY[0x263F146E8] currentContext]) : (id v28 = a9),
                (v30 = -[GLKTextureTXR initWithTexture:API:options:error:]([GLKTextureTXR alloc], "initWithTexture:API:options:error:", v22, [v28 API], a6, a7)) != 0))
          {
            v31 = v30;
            [(GLKTextureTXR *)v30 setLabel:a3];
            uint64_t v32 = [a1 lockAndSwitchContext:a8 glContext:a9];
            id v27 = +[GLKTextureLoader _textureWithTextureTXR:v31 error:a7];
            [a1 unlockAndRestoreContext:a8 glContext:v32];
          }
          else
          {
            id v27 = 0;
          }

          return v27;
      }
      *a7 = (id)_GLKTextureErrorWithCodeAndErrorString(7, objc_msgSend(v24, "stringWithFormat:", @"Texture was created with unsupported pixel format: %s", v25));
LABEL_21:

      return 0;
    }
    if (a7)
    {
      v26 = (__CFString *)[NSString stringWithFormat:@"Could not find texture named \"%@\" in supplied bundle", a3];
      goto LABEL_10;
    }
    return 0;
  }
  if (!a7) {
    return 0;
  }
  v26 = @"Could not get asset catalog from supplied bundle";
LABEL_10:
  id v27 = 0;
  *a7 = (id)_GLKTextureErrorWithCodeAndErrorString(0, (uint64_t)v26);
  return v27;
}

+ (id)commonTextureWithCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  if (a3)
  {
    v11 = [[GLKTexture alloc] initWithCGImage:a3 forceCubeMap:0 wasCubeMap:0 cubeMapIndex:0 options:a4 error:a5];
    if (v11)
    {
      v12 = v11;
      uint64_t v13 = [a1 lockAndSwitchContext:a6 glContext:a7];
      id v14 = +[GLKTextureLoader _textureWithTexture:v12 error:a5];
      [a1 unlockAndRestoreContext:a6 glContext:v13];

      return v14;
    }
  }
  else if (a5)
  {
    *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(2, @"Invalid CGImage");
  }
  return 0;
}

+ (id)commonCubeMapWithContentsOfFiles:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  if ([a3 count] == 6)
  {
    GLuint textures = 0;
    uint64_t v13 = [a1 lockAndSwitchContext:a6 glContext:a7];
    glGenTextures(1, &textures);
    [a1 unlockAndRestoreContext:a6 glContext:v13];
    if (![a3 count])
    {
      uint64_t v34 = 0;
      v35 = 0;
      uint64_t target = 3553;
LABEL_27:
      uint64_t v27 = [a1 lockAndSwitchContext:a6 glContext:a7];
      if (HIDWORD(v34) == 5 || (v34 & 1) == 0)
      {
        id v28 = v35;
      }
      else
      {
        id v28 = v35;
        if (HIDWORD(target) == 1) {
          glGenerateMipmap(target);
        }
      }
LABEL_45:
      [a1 unlockAndRestoreContext:a6 glContext:v27];
      return v28;
    }
    uint64_t v14 = 0;
    uint64_t v34 = 0;
    v35 = 0;
    uint64_t target = 3553;
    while (1)
    {
      uint64_t v15 = (void *)[a3 objectAtIndex:v14];
      objc_opt_class();
      uint64_t v16 = v15;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v16 = (void *)[NSURL fileURLWithPath:v15];
        }
        else {
          uint64_t v16 = 0;
        }
      }
      if (([v16 checkResourceIsReachableAndReturnError:0] & 1) == 0)
      {
        if (!a5) {
          return 0;
        }
        id v23 = (__CFString *)[NSString stringWithFormat:@"Could not find resource %@ at specified location.", objc_msgSend(v16, "lastPathComponent")];
        uint64_t v24 = 0;
LABEL_25:
        v25 = (void *)_GLKTextureErrorWithCodeAndErrorString(v24, (uint64_t)v23);
        id result = 0;
        *a5 = v25;
        return result;
      }
      id v37 = 0;
      uint64_t v17 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v16 options:1 error:&v37];
      if (!v17)
      {
        if (a5)
        {
          v29 = NSString;
          if (v37) {
            v30 = (__CFString *)[v37 localizedDescription];
          }
          else {
            v30 = &stru_26C9E10F0;
          }
          v31 = (__CFString *)[v29 stringWithFormat:@"Invalid NSData for face %d, %@", v14, v30, target];
          uint64_t v32 = 1;
LABEL_43:
          *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(v32, (uint64_t)v31);
        }
LABEL_44:
        uint64_t v27 = [a1 lockAndSwitchContext:a6 glContext:a7];
        glDeleteTextures(1, &textures);

        id v28 = 0;
        goto LABEL_45;
      }
      id v18 = (void *)v17;
      char v36 = 0;
      uint64_t v19 = [[GLKTexture alloc] initWithData:v17 forceCubeMap:1 wasCubeMap:&v36 cubeMapIndex:v14 options:a4 error:a5];

      if (!v19) {
        goto LABEL_44;
      }
      if ([(GLKTexture *)v19 dataCategory] == 5 && v36)
      {

        if (a5)
        {
          v31 = @"PVR atlas unsupported";
          uint64_t v32 = 5;
          goto LABEL_43;
        }
        goto LABEL_44;
      }
      if (!v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v15 = (void *)[v15 relativeString];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
        }
        [(GLKTexture *)v19 setLabel:v15];
      }
LABEL_18:
      uint64_t v20 = [a1 lockAndSwitchContext:a6 glContext:a7];
      BOOL v21 = [(GLKTexture *)v19 uploadToGLTexture:textures error:a5];
      [a1 unlockAndRestoreContext:a6 glContext:v20];
      if (!v21)
      {

        goto LABEL_44;
      }
      if (!v14)
      {
        v22 = [GLKTextureInfo alloc];
        v35 = [(GLKTextureInfo *)v22 initWithTexture:v19 textureName:textures];
        HIDWORD(v34) = [(GLKTexture *)v19 dataCategory];
        LOBYTE(v34) = [(GLKTexture *)v19 isMipmapped];
        LODWORD(target) = [(GLKTexture *)v19 bindTarget];
        HIDWORD(target) = [(GLKTexture *)v19 numMipMapLevels];
      }

      if ([a3 count] <= (unint64_t)++v14) {
        goto LABEL_27;
      }
    }
  }
  if (a5)
  {
    id v23 = @"Invalid number of files";
    uint64_t v24 = 6;
    goto LABEL_25;
  }
  return 0;
}

+ (id)commonCubeMapWithContentsOfURL:(id)a3 options:(id)a4 error:(id *)a5 lock:(id)a6 glContext:(id)a7
{
  if ([a3 isFileURL]
    && ([a3 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    if (a5)
    {
      uint64_t v22 = [NSString stringWithFormat:@"Could not find resource %@ at specified location.", objc_msgSend(a3, "lastPathComponent")];
      uint64_t v23 = 0;
LABEL_23:
      v31 = (void *)_GLKTextureErrorWithCodeAndErrorString(v23, v22);
      id result = 0;
      *a5 = v31;
      return result;
    }
    return 0;
  }
  GLuint textures = 0;
  uint64_t v13 = [a1 lockAndSwitchContext:a6 glContext:a7];
  glGenTextures(1, &textures);
  [a1 unlockAndRestoreContext:a6 glContext:v13];
  char v63 = 0;
  id v62 = 0;
  uint64_t v14 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:a3 options:1 error:&v62];
  if (!v14)
  {
    if (a5)
    {
      uint64_t v20 = NSString;
      if (v62) {
        BOOL v21 = (__CFString *)[v62 localizedDescription];
      }
      else {
        BOOL v21 = &stru_26C9E10F0;
      }
      uint64_t v22 = [v20 stringWithFormat:@"Invalid NSData, %@", v21];
      uint64_t v23 = 1;
      goto LABEL_23;
    }
    return 0;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = [[GLKTexture alloc] initWithData:v14 forceCubeMap:1 wasCubeMap:&v63 cubeMapIndex:0 options:0 error:a5];

  if (!v16)
  {
LABEL_26:
    uint64_t v19 = [a1 lockAndSwitchContext:a6 glContext:a7];
    id v18 = 0;
LABEL_27:
    glDeleteTextures(1, &textures);

    goto LABEL_28;
  }
  if ([(GLKTexture *)v16 dataCategory] != 5)
  {
    if ([(GLKTexture *)v16 dataCategory] == 5)
    {

      uint64_t v19 = [a1 lockAndSwitchContext:a6 glContext:a7];
LABEL_28:
      id v18 = 0;
      goto LABEL_29;
    }
    unsigned int v25 = [(GLKTexture *)v16 width];
    unsigned int v26 = 3 * [(GLKTexture *)v16 height];
    unsigned int v27 = [(GLKTexture *)v16 height];
    unsigned int v56 = 6 * [(GLKTexture *)v16 width];
    unsigned int v59 = v25;
    if (v25 != 2 * v26 && v27 != v56) {
      goto LABEL_19;
    }
    int v57 = 2 * v26;
    if (v25 == 2 * v26)
    {
      int v61 = [(GLKTexture *)v16 height];
      unint64_t v32 = [(GLKTexture *)v16 rowBytes] / 6uLL;
    }
    else
    {
      if (v27 != v56) {
        goto LABEL_19;
      }
      int v61 = [(GLKTexture *)v16 width];
      unint64_t v32 = [(GLKTexture *)v16 rowBytes];
    }
    if (v32 && v61)
    {
      unsigned int v50 = v27;
      id v53 = a4;
      v54 = a5;
      id v55 = a7;
      v60 = v16;
      uint64_t v34 = [(NSData *)[(GLKTexture *)v16 imageData] bytes];
      uint64_t v35 = 0;
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      unsigned int v47 = 0;
      size_t v36 = (int)v32;
      uint64_t size = (int)v32 * (uint64_t)v61;
      unint64_t v52 = v32;
      uint64_t v37 = 6 * (int)v32;
      GLenum target = 3553;
      while (1)
      {
        if (v59 == v57)
        {
          uint64_t v34 = (char *)([(NSData *)[(GLKTexture *)v60 imageData] bytes] + v35 * v36);
          v38 = (char *)malloc_type_malloc(size, 0xA2F0899DuLL);
          v39 = v38;
          int v40 = v61;
          if (v61 >= 1)
          {
            v41 = v38;
            do
            {
              memcpy(v41, v34, v36);
              v34 += v37;
              v41 += v36;
              --v40;
            }
            while (v40);
          }
          v42 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v39 length:size freeWhenDone:1];
        }
        else if (v50 == v56)
        {
          v42 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v34 length:size freeWhenDone:0];
          v34 += size;
        }
        else
        {
          v42 = 0;
        }
        v43 = [[GLKTexture alloc] initWithDecodedData:v42 width:v61 height:v61 rowBytes:v52 texture:v60 cubeMapIndex:v35 options:v53 error:v54];

        if (!v35) {
          -[GLKTexture setLabel:](v43, "setLabel:", [a3 relativeString]);
        }
        uint64_t v44 = [a1 lockAndSwitchContext:a6 glContext:v55];
        BOOL v45 = [(GLKTexture *)v43 uploadToGLTexture:textures error:v54];
        [a1 unlockAndRestoreContext:a6 glContext:v44];
        if (!v45) {
          break;
        }
        if (!v35)
        {
          v46 = [GLKTextureInfo alloc];
          uint64_t v49 = [(GLKTextureInfo *)v46 initWithTexture:v43 textureName:textures];
          BYTE4(v48) = [(GLKTexture *)v43 isMipmapped];
          GLenum target = [(GLKTexture *)v43 bindTarget];
          LODWORD(v48) = [(GLKTexture *)v43 dataCategory];
          unsigned int v47 = [(GLKTexture *)v43 numMipMapLevels];
        }

        if (++v35 == 6)
        {
          char v33 = 1;
          goto LABEL_59;
        }
      }

      char v33 = 0;
LABEL_59:
      a7 = v55;
      uint64_t v16 = v60;
      id v18 = (id)v49;
      int v29 = v48;
      char v28 = BYTE4(v48);
      unsigned int v30 = v47;
LABEL_33:

      uint64_t v19 = [a1 lockAndSwitchContext:a6 glContext:a7];
      if (v33)
      {
        if (v29 != 5 && (v28 & 1) != 0 && v30 == 1) {
          glGenerateMipmap(target);
        }
        goto LABEL_29;
      }
      goto LABEL_27;
    }
LABEL_19:
    char v28 = 0;
    int v29 = 0;
    unsigned int v30 = 0;
    id v18 = 0;
    if (a5) {
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(9, @"Invalid cube map dimensions");
    }
    char v33 = 1;
    GLenum target = 3553;
    goto LABEL_33;
  }
  if (!v63)
  {

    if (a5) {
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(11, @"PVR file does not contain cubemap data");
    }
    goto LABEL_26;
  }
  uint64_t v17 = [a1 lockAndSwitchContext:a6 glContext:a7];
  id v18 = +[GLKTextureLoader _textureWithTexture:v16 error:a5];
  [a1 unlockAndRestoreContext:a6 glContext:v17];

  uint64_t v19 = [a1 lockAndSwitchContext:a6 glContext:a7];
  if (!v18) {
    goto LABEL_27;
  }
LABEL_29:
  [a1 unlockAndRestoreContext:a6 glContext:v19];
  return v18;
}

+ (GLKTextureInfo)textureWithContentsOfFile:(NSString *)path options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    uint64_t v9 = [NSURL fileURLWithPath:path];
    return (GLKTextureInfo *)[a1 textureWithContentsOfURL:v9 options:options error:outError];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)textureWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    return (GLKTextureInfo *)[a1 commonTextureWithContentsOfURL:url options:options error:outError lock:0 glContext:0];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)textureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    return (GLKTextureInfo *)[a1 commonTextureWithName:name scaleFactor:bundle bundle:options options:outError error:0 lock:0 glContext:scaleFactor];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)textureWithContentsOfData:(NSData *)data options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    return (GLKTextureInfo *)[a1 commonTextureWithContentsOfData:data options:options error:outError lock:0 glContext:0];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)textureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    return (GLKTextureInfo *)[a1 commonTextureWithCGImage:cgImage options:options error:outError lock:0 glContext:0];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)cubeMapWithContentsOfFiles:(NSArray *)paths options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    return (GLKTextureInfo *)[a1 commonCubeMapWithContentsOfFiles:paths options:options error:outError lock:0 glContext:0];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)cubeMapWithContentsOfFile:(NSString *)path options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    uint64_t v8 = [NSURL fileURLWithPath:path];
    return +[GLKTextureLoader cubeMapWithContentsOfURL:v8 options:options error:outError];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

+ (GLKTextureInfo)cubeMapWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)outError
{
  if ([MEMORY[0x263F146E8] currentContext])
  {
    return (GLKTextureInfo *)+[GLKTextureLoader commonCubeMapWithContentsOfURL:url options:options error:outError lock:0 glContext:0];
  }
  else
  {
    if (outError) {
      *outError = (NSError *)_GLKTextureErrorWithCodeAndErrorString(17, @"Invalid EAGL context");
    }
    return 0;
  }
}

- (void)textureWithContentsOfFile:(NSString *)path options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  uint64_t v10 = [NSURL fileURLWithPath:path];

  [(GLKTextureLoader *)self textureWithContentsOfURL:v10 options:options queue:queue completionHandler:block];
}

- (void)textureWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  if (queue) {
    uint64_t v10 = queue;
  }
  else {
    uint64_t v10 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 3221225472;
  blocka[2] = __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_26433A1A8;
  blocka[4] = url;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v2 = +[GLKTextureLoader commonTextureWithContentsOfURL:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithContentsOfURL:options:error:lock:glContext:", *(void *)(a1 + 32), *(void *)(a1 + 40), &v4, [*(id *)(a1 + 48) nsLock], objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_26433A180;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __77__GLKTextureLoader_textureWithContentsOfURL_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

- (void)textureWithName:(NSString *)name scaleFactor:(CGFloat)scaleFactor bundle:(NSBundle *)bundle options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  if (queue) {
    uint64_t v14 = queue;
  }
  else {
    uint64_t v14 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v14);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 3221225472;
  blocka[2] = __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_26433A1D0;
  *(CGFloat *)&blocka[10] = scaleFactor;
  blocka[4] = name;
  blocka[5] = bundle;
  blocka[6] = options;
  blocka[7] = self;
  blocka[8] = v14;
  void blocka[9] = block;
  dispatch_async(global_queue, blocka);
}

void __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v2 = +[GLKTextureLoader commonTextureWithName:scaleFactor:bundle:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithName:scaleFactor:bundle:options:error:lock:glContext:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), &v4, [*(id *)(a1 + 56) nsLock], objc_msgSend(*(id *)(a1 + 56), "glContext"), *(double *)(a1 + 80));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_26433A180;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 64), block);
}

void __87__GLKTextureLoader_textureWithName_scaleFactor_bundle_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

- (void)textureWithContentsOfData:(NSData *)data options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  if (queue) {
    uint64_t v10 = queue;
  }
  else {
    uint64_t v10 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 3221225472;
  blocka[2] = __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_26433A1A8;
  blocka[4] = data;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v2 = +[GLKTextureLoader commonTextureWithContentsOfData:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithContentsOfData:options:error:lock:glContext:", *(void *)(a1 + 32), *(void *)(a1 + 40), &v4, [*(id *)(a1 + 48) nsLock], objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_26433A180;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __78__GLKTextureLoader_textureWithContentsOfData_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

- (void)textureWithCGImage:(CGImageRef)cgImage options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  if (queue) {
    uint64_t v10 = queue;
  }
  else {
    uint64_t v10 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 3221225472;
  blocka[2] = __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_26433A1F8;
  blocka[7] = block;
  blocka[8] = cgImage;
  blocka[4] = options;
  blocka[5] = self;
  blocka[6] = v10;
  dispatch_async(global_queue, blocka);
}

void __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v2 = +[GLKTextureLoader commonTextureWithCGImage:options:error:lock:glContext:](GLKTextureLoader, "commonTextureWithCGImage:options:error:lock:glContext:", *(void *)(a1 + 64), *(void *)(a1 + 32), &v4, [*(id *)(a1 + 40) nsLock], objc_msgSend(*(id *)(a1 + 40), "glContext"));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_26433A180;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 48), block);
}

void __71__GLKTextureLoader_textureWithCGImage_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

- (void)cubeMapWithContentsOfFiles:(NSArray *)paths options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  if (queue) {
    uint64_t v10 = queue;
  }
  else {
    uint64_t v10 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 3221225472;
  blocka[2] = __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_26433A1A8;
  blocka[4] = paths;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v2 = +[GLKTextureLoader commonCubeMapWithContentsOfFiles:options:error:lock:glContext:](GLKTextureLoader, "commonCubeMapWithContentsOfFiles:options:error:lock:glContext:", *(void *)(a1 + 32), *(void *)(a1 + 40), &v4, [*(id *)(a1 + 48) nsLock], objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_26433A180;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __79__GLKTextureLoader_cubeMapWithContentsOfFiles_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

- (void)cubeMapWithContentsOfFile:(NSString *)path options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  uint64_t v10 = [NSURL fileURLWithPath:path];

  [(GLKTextureLoader *)self cubeMapWithContentsOfURL:v10 options:options queue:queue completionHandler:block];
}

- (void)cubeMapWithContentsOfURL:(NSURL *)url options:(NSDictionary *)options queue:(dispatch_queue_t)queue completionHandler:(GLKTextureLoaderCallback)block
{
  if (queue) {
    uint64_t v10 = queue;
  }
  else {
    uint64_t v10 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v10);
  global_queue = dispatch_get_global_queue(-2, 0);
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 3221225472;
  blocka[2] = __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke;
  blocka[3] = &unk_26433A1A8;
  blocka[4] = url;
  blocka[5] = options;
  blocka[6] = self;
  blocka[7] = v10;
  blocka[8] = block;
  dispatch_async(global_queue, blocka);
}

void __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  id v2 = +[GLKTextureLoader commonCubeMapWithContentsOfURL:options:error:lock:glContext:](GLKTextureLoader, "commonCubeMapWithContentsOfURL:options:error:lock:glContext:", *(void *)(a1 + 32), *(void *)(a1 + 40), &v4, [*(id *)(a1 + 48) nsLock], objc_msgSend(*(id *)(a1 + 48), "glContext"));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke_2;
  block[3] = &unk_26433A180;
  block[4] = v2;
  block[5] = v4;
  dispatch_async(*(dispatch_queue_t *)(a1 + 56), block);
}

void __77__GLKTextureLoader_cubeMapWithContentsOfURL_options_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

- (EAGLContext)glContext
{
  return (EAGLContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGlContext:(id)a3
{
}

- (NSLock)nsLock
{
  return (NSLock *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNsLock:(id)a3
{
}

- (BOOL)supportsASTC_LDR
{
  return self->_supportsASTC_LDR;
}

- (void)setSupportsASTC_LDR:(BOOL)a3
{
  self->_supportsASTC_LDR = a3;
}

- (BOOL)supportsETC2
{
  return self->_supportsETC2;
}

- (void)setSupportsETC2:(BOOL)a3
{
  self->_supportsETC2 = a3;
}

@end