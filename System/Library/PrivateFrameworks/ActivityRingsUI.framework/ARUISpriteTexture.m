@interface ARUISpriteTexture
- (ARUISpriteTexture)initWithImage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MTLTexture)texture;
- (float)height;
- (float)width;
- (unint64_t)hash;
@end

@implementation ARUISpriteTexture

- (MTLTexture)texture
{
  return self->_texture;
}

- (ARUISpriteTexture)initWithImage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARUISpriteTexture;
  v5 = [(ARUISpriteTexture *)&v18 init];
  if (v5)
  {
    [v4 size];
    float v7 = v6;
    v5->_height = v7;
    [v4 size];
    *(float *)&double v8 = v8;
    v5->_width = *(float *)&v8;
    id v9 = MTLCreateSystemDefaultDevice();
    if (v9)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:v9];
      id v11 = v4;
      id v17 = 0;
      uint64_t v12 = objc_msgSend(v10, "newTextureWithCGImage:options:error:", objc_msgSend(v11, "CGImage"), 0, &v17);
      id v13 = v17;
      texture = v5->_texture;
      v5->_texture = (MTLTexture *)v12;

      if (v13)
      {
        v15 = arui_rings_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          [(ARUISpriteTexture *)(uint64_t)v11 initWithImage:v15];
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = +[ARUIHashBuilder builder];
  *(float *)&double v4 = self->_height;
  [v3 appendFloat:v4];
  *(float *)&double v5 = self->_width;
  [v3 appendFloat:v5];
  [v3 appendObject:self->_texture];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ARUISpriteTexture *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      double v5 = v4;
      unint64_t v6 = v5;
      if (self->_texture)
      {
        BOOL v7 = 0;
      }
      else
      {
        id v9 = [(ARUISpriteTexture *)v5 texture];
        BOOL v7 = v9 == 0;
      }
      float width = self->_width;
      [(ARUISpriteTexture *)v6 width];
      if (ARUIFloatEqual(width, v11))
      {
        float height = self->_height;
        [(ARUISpriteTexture *)v6 height];
        BOOL v8 = ARUIFloatEqual(height, v13);
        if (v8 && !v7)
        {
          texture = self->_texture;
          v15 = [(ARUISpriteTexture *)v6 texture];
          LOBYTE(v8) = texture == v15;
        }
      }
      else
      {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (float)height
{
  return self->_height;
}

- (float)width
{
  return self->_width;
}

- (void).cxx_destruct
{
}

- (void)initWithImage:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_fault_impl(&dword_21E162000, a3, OS_LOG_TYPE_FAULT, "Failed to load texture from image: %@, error: %@", (uint8_t *)&v6, 0x16u);
}

@end