@interface SPColorWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapperForColor:(id)a3;
- (SPColorWrapper)initWithCoder:(id)a3;
- (UIColor)color;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPColorWrapper

+ (id)wrapperForColor:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SPColorWrapper);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_color, a3);
    v7 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPColorWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SPColorWrapper;
  v5 = [(SPColorWrapper *)&v32 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"c"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"c"];
      color = v5->_color;
      v5->_color = (UIColor *)v6;
    }
    else
    {
      uint64_t v31 = 0;
      v8 = (unsigned char *)[v4 decodeBytesWithReturnedLength:&v31];
      switch(v31)
      {
        case 1:
          id v9 = objc_alloc(MEMORY[0x263F1C550]);
          LOBYTE(v10) = *v8;
          double v11 = (double)v10 / 255.0;
          double v12 = 1.0;
          goto LABEL_9;
        case 2:
          id v9 = objc_alloc(MEMORY[0x263F1C550]);
          LOBYTE(v14) = *v8;
          double v11 = (double)v14 / 255.0;
          LOBYTE(v15) = v8[1];
          double v12 = (double)v15 / 255.0;
LABEL_9:
          uint64_t v16 = [v9 initWithWhite:v11 alpha:v12];
          goto LABEL_13;
        case 3:
          id v17 = objc_alloc(MEMORY[0x263F1C550]);
          LOBYTE(v18) = *v8;
          double v19 = (double)v18 / 255.0;
          LOBYTE(v20) = v8[1];
          double v21 = (double)v20 / 255.0;
          LOBYTE(v22) = v8[2];
          double v23 = (double)v22 / 255.0;
          double v24 = 1.0;
          goto LABEL_12;
        case 4:
          id v17 = objc_alloc(MEMORY[0x263F1C550]);
          LOBYTE(v25) = *v8;
          double v19 = (double)v25 / 255.0;
          LOBYTE(v26) = v8[1];
          double v21 = (double)v26 / 255.0;
          LOBYTE(v27) = v8[2];
          double v23 = (double)v27 / 255.0;
          LOBYTE(v28) = v8[3];
          double v24 = (double)v28 / 255.0;
LABEL_12:
          uint64_t v16 = [v17 initWithRed:v19 green:v21 blue:v23 alpha:v24];
LABEL_13:
          p_super = &v5->_color->super;
          v5->_color = (UIColor *)v16;
          break;
        default:
          p_super = wk_default_log();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
            -[SPColorWrapper initWithCoder:]();
          }
          break;
      }
    }
    v29 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(UIColor *)self->_color CGColor];
  ColorSpace = CGColorGetColorSpace(v5);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model > kCGColorSpaceModelRGB)
  {
    [v4 encodeObject:self->_color forKey:@"c"];
  }
  else
  {
    CGColorSpaceModel v8 = Model;
    size_t NumberOfComponents = CGColorGetNumberOfComponents(v5);
    uint64_t v10 = NumberOfComponents;
    uint64_t v11 = 4;
    if (v8 == kCGColorSpaceModelMonochrome) {
      uint64_t v11 = 2;
    }
    if (NumberOfComponents != v11)
    {
      double v12 = wk_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SPColorWrapper encodeWithCoder:](v10, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    double v19 = &buf[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
    Components = CGColorGetComponents(v5);
    unint64_t v22 = Components;
    uint64_t v23 = v10 - 1;
    if (v10 != 1)
    {
      *(void *)&long long v21 = 136446722;
      long long v35 = v21;
      double v24 = (double *)Components;
      unint64_t v25 = &buf[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 16];
      uint64_t v26 = v10 - 1;
      do
      {
        double v27 = *v24;
        if (*v24 < 0.0 || v27 > 1.0)
        {
          v29 = wk_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            double v30 = *v24;
            *(_DWORD *)buf = v35;
            v37 = "-[SPColorWrapper encodeWithCoder:]";
            __int16 v38 = 1024;
            int v39 = 88;
            __int16 v40 = 2048;
            double v41 = v30;
            _os_log_error_impl(&dword_2211F3000, v29, OS_LOG_TYPE_ERROR, "%{public}s:%d: Color component with value %f must be in the range [0, 1].", buf, 0x1Cu);
          }

          double v27 = *v24;
        }
        *v25++ = (int)(v27 * 255.0);
        ++v24;
        --v26;
      }
      while (v26);
    }
    uint64_t v31 = (double *)&v22[v23];
    double v32 = *v31;
    if (*v31 < 0.0 || v32 > 1.0)
    {
      v34 = wk_default_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SPColorWrapper encodeWithCoder:]();
      }

      double v32 = *v31;
    }
    if (v32 >= 1.0) {
      --v10;
    }
    else {
      v19[v23] = (int)(v32 * 255.0);
    }
    objc_msgSend(v4, "encodeBytes:length:", v19, v10, v35);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_color);
  return v4;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Unexpected number of decoded color components (%lu).", v2, v3, v4, v5, 2u);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2211F3000, v0, v1, "%{public}s:%d: Alpha component with value %f must be in the range [0, 1].", v2, v3, v4, v5, 2u);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end