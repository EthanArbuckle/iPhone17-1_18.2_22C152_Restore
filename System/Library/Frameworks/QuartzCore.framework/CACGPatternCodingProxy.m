@interface CACGPatternCodingProxy
+ (BOOL)supportsSecureCoding;
- (CACGPatternCodingProxy)initWithCoder:(id)a3;
- (CACGPatternCodingProxy)initWithObject:(id)a3;
- (id)decodedObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CACGPatternCodingProxy

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CGPatternRelease(self->_pattern);
  v3.receiver = self;
  v3.super_class = (Class)CACGPatternCodingProxy;
  [(CACGPatternCodingProxy *)&v3 dealloc];
}

- (CACGPatternCodingProxy)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  memset(&v19, 0, sizeof(v19));
  long long v18 = 0uLL;
  v17.receiver = self;
  v17.super_class = (Class)CACGPatternCodingProxy;
  uint64_t v4 = [(CACGPatternCodingProxy *)&v17 init];
  if (v4
    && objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"CGPatternType"), "isEqualToString:", @"tiling"))
  {
    if ((objc_msgSend(a3, "CA_decodeCGFloatArray:count:forKey:", &v20, 6, @"CGPatternMatrix") & 1) == 0)
    {
      long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v20.c = v5;
      *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    if ((objc_msgSend(a3, "CA_decodeCGFloatArray:count:forKey:", &v19, 4, @"CGPatternBounds") & 1) == 0)
    {
      CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v19.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v19.size = v6;
    }
    if ((objc_msgSend(a3, "CA_decodeCGFloatArray:count:forKey:", &v18, 2, @"CGPatternStep") & 1) == 0) {
      long long v18 = *MEMORY[0x1E4F1DB30];
    }
    CGPatternTiling v7 = [a3 decodeIntForKey:@"CGPatternTiling"];
    int v8 = [a3 decodeIntForKey:@"CGPatternColored"];
    v9 = objc_msgSend(a3, "CA_decodeObjectForKey:", @"CGPatternImage");
    if (v9)
    {
      v10 = v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CGImageGetTypeID())
      {
        if (v19.origin.x == 0.0
          && v19.origin.y == 0.0
          && (double width = v19.size.width, width == (double)CGImageGetWidth((CGImageRef)v10))
          && (double height = v19.size.height, height == (double)CGImageGetHeight((CGImageRef)v10))
          && *(double *)&v18 == v19.size.width
          && *((double *)&v18 + 1) == v19.size.height
          && (v8 != 0) != CGImageIsMask((CGImageRef)v10))
        {
          v16[1] = v20;
          v4->_pattern = (CGPattern *)CGPatternCreateWithImage2();
        }
        else
        {
          v16[0] = v20;
          CGPatternRef v14 = CGPatternCreate(v10, v19, v16, *(CGFloat *)&v18, *((CGFloat *)&v18 + 1), v7, v8 != 0, &pattern_callbacks);
          v4->_pattern = v14;
          if (v14) {
            CGImageRetain((CGImageRef)v10);
          }
        }
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!CGPatternGetType())
  {
    memset(v25, 0, sizeof(v25));
    [a3 encodeObject:@"tiling" forKey:@"CGPatternType"];
    CGPatternGetMatrix();
    objc_msgSend(a3, "CA_encodeCGFloatArray:count:forKey:", v25, 6, @"CGPatternMatrix");
    CGPatternGetBounds();
    v24[0] = v5;
    v24[1] = v6;
    v24[2] = v7;
    v24[3] = v8;
    objc_msgSend(a3, "CA_encodeCGFloatArray:count:forKey:", v24, 4, @"CGPatternBounds");
    CGPatternGetStep();
    v23[0] = v9;
    v23[1] = v10;
    objc_msgSend(a3, "CA_encodeCGFloatArray:count:forKey:", v23, 2, @"CGPatternStep");
    [a3 encodeInt:CGPatternGetTiling() forKey:@"CGPatternTiling"];
    [a3 encodeInt:CGPatternIsColored() forKey:@"CGPatternColored"];
    uint64_t Image = CGPatternGetImage();
    if (Image) {
      goto LABEL_3;
    }
    pattern = self->_pattern;
    v13 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    __asm { FMOV            V0.2D, #1.0 }
    long long v22 = _Q0;
    pattern_image = CA::Render::create_pattern_image((uint64_t)pattern, v13, (CGFloat *)&v22, v24);
    if (!pattern_image)
    {
LABEL_3:
      objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", Image, @"CGPatternImage", 0);
    }
    else
    {
      CGAffineTransform v20 = (atomic_uint *)pattern_image;
      uint64_t v21 = CA::Render::Image::copy_cgimage(pattern_image);
      if (atomic_fetch_add(v20 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v20 + 16))(v20);
      }
      objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", v21, @"CGPatternImage", 0);
      CGImageRelease(v21);
    }
  }
}

- (id)decodedObject
{
  return self->_pattern;
}

- (CACGPatternCodingProxy)initWithObject:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CACGPatternCodingProxy;
  uint64_t v4 = [(CACGPatternCodingProxy *)&v6 init];
  if (v4) {
    v4->_pattern = CGPatternRetain((CGPatternRef)a3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end