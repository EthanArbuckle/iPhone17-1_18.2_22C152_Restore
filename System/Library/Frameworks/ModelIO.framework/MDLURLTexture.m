@interface MDLURLTexture
- (MDLURLTexture)initWithURL:(NSURL *)URL name:(NSString *)name;
- (NSURL)URL;
- (void)setURL:(NSURL *)URL;
@end

@implementation MDLURLTexture

- (MDLURLTexture)initWithURL:(NSURL *)URL name:(NSString *)name
{
  v6 = URL;
  v7 = name;
  v14.receiver = self;
  v14.super_class = (Class)MDLURLTexture;
  v9 = [(MDLTexture *)&v14 init];
  if (v9)
  {
    if (v7)
    {
      uint64_t v10 = objc_msgSend_stringWithString_(NSString, v8, (uint64_t)v7);
      v11 = v9->super._name;
      v9->super._name = (NSString *)v10;
    }
    objc_msgSend_setURL_(v9, v8, (uint64_t)v6);
    v12 = v9;
  }

  return v9;
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(NSURL *)URL
{
  url = URL;
  objc_storeStrong((id *)&self->_url, URL);
  if (url)
  {
    v5 = CGImageSourceCreateWithURL((CFURLRef)url, 0);
    v6 = v5;
    if (v5)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
      CFRelease(v6);
      if (ImageAtIndex)
      {
        unsigned int Width = CGImageGetWidth(ImageAtIndex);
        signed int Height = CGImageGetHeight(ImageAtIndex);
        *(void *)self->super._anon_118 = __PAIR64__(Height, Width);
        if (Height / 6 == Width) {
          self->super._anon_118[16] = 1;
        }
        id v10 = objc_alloc(MEMORY[0x263EFF990]);
        v12 = (NSData *)objc_msgSend_initWithLength_(v10, v11, (int)(4 * HIDWORD(*(void *)self->super._anon_118) * *(void *)self->super._anon_118));
        v13 = self->super._bottomLeftOriginData[0];
        self->super._bottomLeftOriginData[0] = v12;

        objc_super v14 = self->super._bottomLeftOriginData[0];
        self->super._textureData.bottomLeftBytesForMip[0] = (char *)objc_msgSend_bytes(v14, v15, v16);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v18 = self->super._bottomLeftOriginData[0];
        v21 = objc_msgSend_bytes(v18, v19, v20);
        v22 = CGBitmapContextCreate(v21, (int)*(void *)self->super._anon_118, (int)HIDWORD(*(void *)self->super._anon_118), 8uLL, (int)(4 * *(void *)self->super._anon_118), DeviceRGB, 1u);
        CFRelease(DeviceRGB);
        CGContextSetBlendMode(v22, kCGBlendModeCopy);
        uint64_t v23 = *(void *)self->super._anon_118;
        v26.size.width = (double)(int)v23;
        v26.size.height = (double)SHIDWORD(v23);
        v26.origin.x = 0.0;
        v26.origin.y = 0.0;
        CGContextDrawImage(v22, v26, ImageAtIndex);
        CGContextRelease(v22);
        CFRelease(ImageAtIndex);
        *(void *)&self->super._anon_118[8] = (int)(4 * *(void *)self->super._anon_118);
        self->super._textureData.channelCount = 4;
        self->super._channelEncoding = 1;
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end