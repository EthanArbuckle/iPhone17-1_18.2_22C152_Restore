@interface PCNativePrimitiveColor
+ (BOOL)supportsSecureCoding;
- (PCNativePrimitiveColor)initWithCoder:(id)a3;
- (PCNativePrimitiveColor)initWithRGBA:(int64_t)a3;
- (int64_t)rawValue;
- (unsigned)alpha;
- (unsigned)blue;
- (unsigned)green;
- (unsigned)red;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PCNativePrimitiveColor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativePrimitiveColor)initWithRGBA:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PCNativePrimitiveColor;
  result = [(PCNativePrimitiveColor *)&v5 init];
  if (result) {
    result->_rawValue = a3;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  uint64_t v10 = objc_msgSend_rawValue(self, v4, v5, v6, v7, v8, v9);
  objc_msgSend_encodeInt32_forKey_(v15, v11, v10, @"rawValue", v12, v13, v14);
}

- (PCNativePrimitiveColor)initWithCoder:(id)a3
{
  uint64_t v8 = (int)objc_msgSend_decodeInt32ForKey_(a3, a2, @"rawValue", v3, v4, v5, v6);
  return (PCNativePrimitiveColor *)MEMORY[0x270F9A6D0](self, sel_initWithRGBA_, v8, v9, v10, v11, v12);
}

- (unsigned)red
{
  return BYTE3(self->_rawValue);
}

- (unsigned)green
{
  return BYTE2(self->_rawValue);
}

- (unsigned)blue
{
  return BYTE1(self->_rawValue);
}

- (unsigned)alpha
{
  return self->_rawValue;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

@end