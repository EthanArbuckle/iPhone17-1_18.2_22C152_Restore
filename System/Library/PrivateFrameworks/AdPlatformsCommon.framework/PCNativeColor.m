@interface PCNativeColor
+ (BOOL)supportsSecureCoding;
- (NSArray)darkModeColors;
- (NSArray)lightModeColors;
- (PCNativeColor)init;
- (PCNativeColor)initWithCoder:(id)a3;
- (int64_t)gradientOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)setDarkModeColors:(id)a3;
- (void)setGradientOrientation:(int64_t)a3;
- (void)setLightModeColors:(id)a3;
@end

@implementation PCNativeColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeColor)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCNativeColor;
  result = [(PCNativeColor *)&v3 init];
  if (result) {
    result->_gradientOrientation = 20000;
  }
  return result;
}

- (PCNativeColor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11 = (PCNativeColor *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v20 = objc_msgSend_setWithObjects_(v12, v15, v13, v16, v17, v18, v19, v14, 0);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, @"lightModeColors", v22, v23, v24);
    lightModeColors = v11->_lightModeColors;
    v11->_lightModeColors = (NSArray *)v25;

    uint64_t v31 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v27, (uint64_t)v20, @"darkModeColors", v28, v29, v30);
    darkModeColors = v11->_darkModeColors;
    v11->_darkModeColors = (NSArray *)v31;

    v11->_gradientOrientation = (int)objc_msgSend_decodeInt32ForKey_(v4, v33, @"gradientOrientation", v34, v35, v36, v37);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v37 = a3;
  double v10 = objc_msgSend_lightModeColors(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v37, v11, (uint64_t)v10, @"lightModeColors", v12, v13, v14);

  v21 = objc_msgSend_darkModeColors(self, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeObject_forKey_(v37, v22, (uint64_t)v21, @"darkModeColors", v23, v24, v25);

  uint64_t v32 = objc_msgSend_gradientOrientation(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeInt32_forKey_(v37, v33, v32, @"gradientOrientation", v34, v35, v36);
}

- (NSArray)lightModeColors
{
  return self->_lightModeColors;
}

- (void)setLightModeColors:(id)a3
{
}

- (NSArray)darkModeColors
{
  return self->_darkModeColors;
}

- (void)setDarkModeColors:(id)a3
{
}

- (int64_t)gradientOrientation
{
  return self->_gradientOrientation;
}

- (void)setGradientOrientation:(int64_t)a3
{
  self->_gradientOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColors, 0);
  objc_storeStrong((id *)&self->_lightModeColors, 0);
}

@end