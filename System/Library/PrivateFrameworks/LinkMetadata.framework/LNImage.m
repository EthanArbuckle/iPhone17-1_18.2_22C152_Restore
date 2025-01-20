@interface LNImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INImage)inImage;
- (LNImage)initWithCoder:(id)a3;
- (LNImage)initWithData:(id)a3 renderingMode:(unint64_t)a4;
- (LNImage)initWithData:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5;
- (LNImage)initWithINImage:(id)a3;
- (LNImage)initWithINImage:(id)a3 displayStyle:(unint64_t)a4;
- (LNImage)initWithImageNamed:(id)a3;
- (LNImage)initWithImageNamed:(id)a3 renderingMode:(unint64_t)a4;
- (LNImage)initWithImageNamed:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5;
- (LNImage)initWithSystemImageNamed:(id)a3;
- (LNImage)initWithURL:(id)a3 renderingMode:(unint64_t)a4;
- (LNImage)initWithURL:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5;
- (LNImage)initWithURL:(id)a3 width:(double)a4 height:(double)a5 renderingMode:(unint64_t)a6;
- (LNImage)initWithURL:(id)a3 width:(double)a4 height:(double)a5 renderingMode:(unint64_t)a6 displayStyle:(unint64_t)a7;
- (LNImage)proxiedImageCopy;
- (id)description;
- (unint64_t)displayStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNImage

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(LNImage *)self inImage];
  [v5 encodeObject:v4 forKey:@"inImage"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNImage displayStyle](self, "displayStyle"), @"displayStyle");
}

- (INImage)inImage
{
  return self->_inImage;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void).cxx_destruct
{
}

- (LNImage)initWithSystemImageNamed:(id)a3
{
  v4 = [MEMORY[0x1E4F304C0] systemImageNamed:a3];
  if (v4)
  {
    self = [(LNImage *)self initWithINImage:v4 displayStyle:0];
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (LNImage)initWithINImage:(id)a3 displayStyle:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"LNImage.m", 106, @"Invalid parameter not satisfying: %@", @"inImage" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)LNImage;
  v9 = [(LNImage *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inImage, a3);
    v10->_displayStyle = a4;
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(LNImage *)self inImage];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(LNImage *)self displayStyle] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNImage *)a3;
  unint64_t v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v13 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v7 = [(LNImage *)self inImage];
    id v8 = [(LNImage *)v6 inImage];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      if (!v9 || !v10)
      {

LABEL_14:
        BOOL v13 = 0;
        goto LABEL_15;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_14;
      }
    }
    unint64_t v14 = [(LNImage *)self displayStyle];
    BOOL v13 = v14 == [(LNImage *)v6 displayStyle];
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (LNImage)proxiedImageCopy
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy_;
  BOOL v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = [(LNImage *)self inImage];
  id v8 = v3;
  INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler();

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v8, v5);
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (LNImage *)v6;
}

intptr_t __27__LNImage_proxiedImageCopy__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = -[LNImage initWithINImage:displayStyle:]([LNImage alloc], "initWithINImage:displayStyle:", v3, [*(id *)(a1 + 32) displayStyle]);

    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  v7 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v7);
}

uint64_t __27__LNImage_proxiedImageCopy__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  id v3 = a2;
  uint64_t v4 = [v2 mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  [v3 _setBundleIdentifier:v5];

  return 1;
}

- (LNImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inImage"];
  if (v5)
  {
    unint64_t v6 = [v4 decodeIntegerForKey:@"displayStyle"];
    if (v6 <= 1) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0;
    }
    self = [(LNImage *)self initWithINImage:v5 displayStyle:v7];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNImage *)self inImage];
  unint64_t v7 = [v3 stringWithFormat:@"<%@: %p, inImage: %@>", v5, self, v6];

  return v7;
}

- (LNImage)initWithINImage:(id)a3
{
  return [(LNImage *)self initWithINImage:a3 displayStyle:0];
}

- (LNImage)initWithURL:(id)a3 width:(double)a4 height:(double)a5 renderingMode:(unint64_t)a6 displayStyle:(unint64_t)a7
{
  id v10 = [MEMORY[0x1E4F304C0] imageWithURL:a3 width:a4 height:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    if (a6 == 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2 * (a6 == 2);
    }
    [v10 _setRenderingMode:v12];
    self = [(LNImage *)self initWithINImage:v11 displayStyle:a7];
    BOOL v13 = self;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (LNImage)initWithURL:(id)a3 width:(double)a4 height:(double)a5 renderingMode:(unint64_t)a6
{
  return [(LNImage *)self initWithURL:a3 width:a6 height:0 renderingMode:a4 displayStyle:a5];
}

- (LNImage)initWithURL:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  id v8 = [MEMORY[0x1E4F304C0] imageWithURL:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    if (a4 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (a4 == 2);
    }
    [v8 _setRenderingMode:v10];
    self = [(LNImage *)self initWithINImage:v9 displayStyle:a5];
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (LNImage)initWithURL:(id)a3 renderingMode:(unint64_t)a4
{
  return [(LNImage *)self initWithURL:a3 renderingMode:a4 displayStyle:self->_displayStyle];
}

- (LNImage)initWithData:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  id v8 = [MEMORY[0x1E4F304C0] imageWithImageData:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    if (a4 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (a4 == 2);
    }
    [v8 _setRenderingMode:v10];
    self = [(LNImage *)self initWithINImage:v9 displayStyle:a5];
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (LNImage)initWithData:(id)a3 renderingMode:(unint64_t)a4
{
  return [(LNImage *)self initWithData:a3 renderingMode:a4 displayStyle:0];
}

- (LNImage)initWithImageNamed:(id)a3 renderingMode:(unint64_t)a4 displayStyle:(unint64_t)a5
{
  id v8 = [MEMORY[0x1E4F304C0] imageNamed:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    if (a4 == 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2 * (a4 == 2);
    }
    [v8 _setRenderingMode:v10];
    self = [(LNImage *)self initWithINImage:v9 displayStyle:a5];
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (LNImage)initWithImageNamed:(id)a3 renderingMode:(unint64_t)a4
{
  return [(LNImage *)self initWithImageNamed:a3 renderingMode:a4 displayStyle:0];
}

- (LNImage)initWithImageNamed:(id)a3
{
  return [(LNImage *)self initWithImageNamed:a3 renderingMode:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end