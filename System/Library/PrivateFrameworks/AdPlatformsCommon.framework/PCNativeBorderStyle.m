@interface PCNativeBorderStyle
+ (BOOL)supportsSecureCoding;
- (PCNativeBorderStyle)initWithCoder:(id)a3;
- (PCNativeColor)color;
- (double)cornerRadius;
- (double)width;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setWidth:(double)a3;
@end

@implementation PCNativeBorderStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeBorderStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"color", v14, v15, v16);
    v18 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v17;

    objc_msgSend_decodeDoubleForKey_(v4, v19, @"width", v20, v21, v22, v23);
    *(double *)(v11 + 16) = v24;
    objc_msgSend_decodeDoubleForKey_(v4, v25, @"cornerRadius", v26, v27, v24, v28);
    *(void *)(v11 + 24) = v29;
  }

  return (PCNativeBorderStyle *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v37 = a3;
  double v10 = objc_msgSend_color(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeObject_forKey_(v37, v11, (uint64_t)v10, @"color", v12, v13, v14);

  objc_msgSend_width(self, v15, v16, v17, v18, v19, v20);
  objc_msgSend_encodeDouble_forKey_(v37, v21, @"width", v22, v23, v24, v25);
  objc_msgSend_cornerRadius(self, v26, v27, v28, v29, v30, v31);
  objc_msgSend_encodeDouble_forKey_(v37, v32, @"cornerRadius", v33, v34, v35, v36);
}

- (PCNativeColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end