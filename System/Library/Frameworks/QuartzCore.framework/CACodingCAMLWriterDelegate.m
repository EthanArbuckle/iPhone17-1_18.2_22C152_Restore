@interface CACodingCAMLWriterDelegate
- (BOOL)CAMLWriter:(id)a3 shouldEncodeObject:(id)a4;
- (BOOL)skipHiddenLayers;
- (CACodingCAMLWriterDelegate)initWithResourceDir:(id)a3;
- (NSDictionary)imageEncodeOptions;
- (NSString)imageFormat;
- (id)CAMLWriter:(id)a3 URLForResource:(id)a4;
- (id)CAMLWriter:(id)a3 typeForObject:(id)a4;
- (void)dealloc;
- (void)setImageEncodeOptions:(id)a3;
- (void)setImageFormat:(id)a3;
- (void)setSkipHiddenLayers:(BOOL)a3;
@end

@implementation CACodingCAMLWriterDelegate

- (void)setSkipHiddenLayers:(BOOL)a3
{
  self->_skipHiddenLayers = a3;
}

- (BOOL)skipHiddenLayers
{
  return self->_skipHiddenLayers;
}

- (void)setImageEncodeOptions:(id)a3
{
}

- (NSDictionary)imageEncodeOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImageFormat:(id)a3
{
}

- (NSString)imageFormat
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)CAMLWriter:(id)a3 shouldEncodeObject:(id)a4
{
  if (!self->_skipHiddenLayers) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  if ([a4 isHidden]) {
    return 0;
  }
  [a4 opacity];
  return v6 > 0.0;
}

- (id)CAMLWriter:(id)a3 URLForResource:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CFTypeID v6 = CFGetTypeID(a4);
  if (v6 != CGImageGetTypeID()) {
    return 0;
  }
  v7 = [(CACodingCAMLWriterDelegate *)self imageEncodeOptions];
  v8 = [(CACodingCAMLWriterDelegate *)self imageFormat];
  if (a4)
  {
    if (CGImageGetBitsPerPixel((CGImageRef)a4) == 8 && CGImageGetAlphaInfo((CGImageRef)a4) == kCGImageAlphaNone)
    {
      CAGetColorSpace(3u);
      CGImageGetColorSpace((CGImageRef)a4);
      if (CGColorSpaceEqualToColorSpace())
      {
        v7 = 0;
        v8 = @"public.png";
      }
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::_extension_lock);
  id v9 = (id)-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions;
  if (!-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    -[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions = (uint64_t)v9;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];
  if (!v10)
  {
    v11 = (void *)CGImageSourceCopyTypeExtensions();
    uint64_t v10 = [v11 objectAtIndexedSubscript:0];
    [(id)-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::extensions setObject:v10 forKeyedSubscript:v8];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[CACodingCAMLWriterDelegate CAMLWriter:URLForResource:]::_extension_lock);
  v12 = NSString;
  uint64_t serial = self->_serial;
  self->_uint64_t serial = serial + 1;
  uint64_t v14 = [v12 stringWithFormat:@"assets/image%d.%@", serial, v10];
  v15 = CGImageDestinationCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:relativeToURL:", v14, objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", self->_resourceDir)), v8, 1uLL, 0);
  if (!v15) {
    return 0;
  }
  v16 = v15;
  CGImageDestinationAddImage(v15, (CGImageRef)a4, (CFDictionaryRef)v7);
  v17 = (void *)MEMORY[0x185324A30]();
  BOOL v18 = CGImageDestinationFinalize(v16);
  CFRelease(v16);
  if (!v18)
  {
    if (x_log_hook_p())
    {
      objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      x_log_();
    }
    else
    {
      v21 = x_log_category_utilities;
      if (os_log_type_enabled((os_log_t)x_log_category_utilities, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        _os_log_impl(&dword_184668000, v21, OS_LOG_TYPE_ERROR, "CAML: Failed to encode image: %s\n", buf, 0xCu);
      }
    }
    return 0;
  }
  v19 = (void *)MEMORY[0x1E4F1CB10];

  return (id)[v19 URLWithString:v14];
}

- (id)CAMLWriter:(id)a3 typeForObject:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (coding_once != -1) {
    dispatch_once_f(&coding_once, 0, (dispatch_function_t)coding_init);
  }
  v4 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:v4];
  if (v5 == self_bundle) {
    return 0;
  }
  do
  {
    v4 = (void *)[v4 superclass];
    if (!v4) {
      break;
    }
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:v4];
  }
  while (v6 != self_bundle);

  return NSStringFromClass((Class)v4);
}

- (CACodingCAMLWriterDelegate)initWithResourceDir:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CACodingCAMLWriterDelegate;
  result = [(CACodingCAMLWriterDelegate *)&v5 init];
  result->_resourceDir = (NSString *)a3;
  result->_uint64_t serial = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CACodingCAMLWriterDelegate;
  [(CACodingCAMLWriterDelegate *)&v3 dealloc];
}

@end