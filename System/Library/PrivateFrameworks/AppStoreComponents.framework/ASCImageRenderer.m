@interface ASCImageRenderer
+ (id)bundleImageNamed:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)systemImageNamed:(id)a3 compatibleWithTraitCollection:(id)a4;
- (ASCImageRenderer)initWithSize:(CGSize)a3;
- (ASCImageRenderer)initWithSize:(CGSize)a3 capInsets:(UIEdgeInsets)a4 renderingMode:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (UIEdgeInsets)capInsets;
- (id)description;
- (id)imageWithActions:(id)a3;
- (int64_t)renderingMode;
- (unint64_t)hash;
@end

@implementation ASCImageRenderer

- (ASCImageRenderer)initWithSize:(CGSize)a3 capInsets:(UIEdgeInsets)a4 renderingMode:(int64_t)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)ASCImageRenderer;
  result = [(ASCImageRenderer *)&v13 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_capInsets.CGFloat top = top;
    result->_capInsets.CGFloat left = left;
    result->_capInsets.CGFloat bottom = bottom;
    result->_capInsets.CGFloat right = right;
    result->_renderingMode = a5;
  }
  return result;
}

- (ASCImageRenderer)initWithSize:(CGSize)a3
{
  return -[ASCImageRenderer initWithSize:capInsets:renderingMode:](self, "initWithSize:capInsets:renderingMode:", 0, a3.width, a3.height, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
}

+ (id)bundleImageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB1818];
  v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  v9 = objc_msgSend(v6, "asc_frameworkBundle");
  v10 = [v5 imageNamed:v8 inBundle:v9 compatibleWithTraitCollection:v7];

  return v10;
}

+ (id)systemImageNamed:(id)a3 compatibleWithTraitCollection:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = a3;
  id v7 = [a4 imageConfiguration];
  id v8 = [v5 _systemImageNamed:v6 withConfiguration:v7];

  return v8;
}

- (id)imageWithActions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB17D8]);
  [(ASCImageRenderer *)self size];
  id v6 = objc_msgSend(v5, "initWithSize:");
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __37__ASCImageRenderer_imageWithActions___block_invoke;
  v19[3] = &unk_1E645DC10;
  id v20 = v4;
  id v7 = v4;
  id v8 = [v6 imageWithActions:v19];
  [(ASCImageRenderer *)self capInsets];
  if (v12 != *(double *)(MEMORY[0x1E4FB2848] + 8)
    || v9 != *MEMORY[0x1E4FB2848]
    || v11 != *(double *)(MEMORY[0x1E4FB2848] + 24)
    || v10 != *(double *)(MEMORY[0x1E4FB2848] + 16))
  {
    [(ASCImageRenderer *)self capInsets];
    uint64_t v16 = objc_msgSend(v8, "resizableImageWithCapInsets:");

    id v8 = (void *)v16;
  }
  if ([(ASCImageRenderer *)self renderingMode] == 1)
  {
    uint64_t v17 = [v8 imageWithRenderingMode:2];

    id v8 = (void *)v17;
  }

  return v8;
}

uint64_t __37__ASCImageRenderer_imageWithActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 format];
  [v4 bounds];
  unint64_t v6 = v5;
  unint64_t v8 = v7;
  unint64_t v10 = v9;
  unint64_t v12 = v11;

  [v3 CGContext];
  objc_super v13 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
  v14.n128_u64[0] = v6;
  v15.n128_u64[0] = v8;
  v16.n128_u64[0] = v10;
  v17.n128_u64[0] = v12;

  return v13(v14, v15, v16, v17);
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  [(ASCImageRenderer *)self size];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCImageRenderer *)self size];
  [(ASCHasher *)v3 combineDouble:v4];
  [(ASCImageRenderer *)self capInsets];
  -[ASCHasher combineDouble:](v3, "combineDouble:");
  [(ASCImageRenderer *)self capInsets];
  [(ASCHasher *)v3 combineDouble:v5];
  [(ASCImageRenderer *)self capInsets];
  [(ASCHasher *)v3 combineDouble:v6];
  [(ASCImageRenderer *)self capInsets];
  [(ASCHasher *)v3 combineDouble:v7];
  [(ASCHasher *)v3 combineInteger:[(ASCImageRenderer *)self renderingMode]];
  unint64_t v8 = [(ASCHasher *)v3 finalizeHash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    goto LABEL_14;
  }
  [(ASCImageRenderer *)self size];
  double v9 = v8;
  [v7 size];
  if (v9 != v10) {
    goto LABEL_14;
  }
  [(ASCImageRenderer *)self size];
  double v12 = v11;
  [v7 size];
  if (v12 != v13) {
    goto LABEL_14;
  }
  [(ASCImageRenderer *)self capInsets];
  double v15 = v14;
  [v7 capInsets];
  if (v15 != v16) {
    goto LABEL_14;
  }
  [(ASCImageRenderer *)self capInsets];
  double v18 = v17;
  [v7 capInsets];
  if (v18 != v19) {
    goto LABEL_14;
  }
  [(ASCImageRenderer *)self capInsets];
  double v21 = v20;
  [v7 capInsets];
  if (v21 == v22
    && (-[ASCImageRenderer capInsets](self, "capInsets"), double v24 = v23, [v7 capInsets], v24 == v25))
  {
    int64_t v26 = [(ASCImageRenderer *)self renderingMode];
    BOOL v27 = v26 == [v7 renderingMode];
  }
  else
  {
LABEL_14:
    BOOL v27 = 0;
  }

  return v27;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [NSString alloc];
  [(ASCImageRenderer *)self size];
  uint64_t v6 = v5;
  [(ASCImageRenderer *)self size];
  double v8 = (void *)[v4 initWithFormat:@"{%f, %f}", v6, v7];
  [(ASCDescriber *)v3 addObject:v8 withName:@"size"];
  id v9 = [NSString alloc];
  [(ASCImageRenderer *)self capInsets];
  uint64_t v11 = v10;
  [(ASCImageRenderer *)self capInsets];
  uint64_t v13 = v12;
  [(ASCImageRenderer *)self capInsets];
  uint64_t v15 = v14;
  [(ASCImageRenderer *)self capInsets];
  double v17 = (void *)[v9 initWithFormat:@"{%f, %f, %f, %f}", v11, v13, v15, v16];
  [(ASCDescriber *)v3 addObject:v17 withName:@"capInsets"];
  int64_t v18 = [(ASCImageRenderer *)self renderingMode];
  if (v18)
  {
    if (v18 != 1) {
      goto LABEL_6;
    }
    double v19 = @"ASCImageRenderingModeAlwaysTemplate";
  }
  else
  {
    double v19 = @"ASCImageRenderingModeAutomatic";
  }
  [(ASCDescriber *)v3 addObject:v19 withName:@"renderingMode"];
LABEL_6:
  double v20 = [(ASCDescriber *)v3 finalizeDescription];

  return v20;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)capInsets
{
  double top = self->_capInsets.top;
  double left = self->_capInsets.left;
  double bottom = self->_capInsets.bottom;
  double right = self->_capInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

@end