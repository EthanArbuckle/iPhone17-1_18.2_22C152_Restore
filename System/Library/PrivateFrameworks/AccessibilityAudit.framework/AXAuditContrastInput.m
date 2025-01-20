@interface AXAuditContrastInput
- (AXAuditContrastInput)init;
- (BOOL)enhanced;
- (CGRect)imageFrame;
- (NSData)imageData;
- (NSString)backgroundHexColorValue;
- (NSString)foregroundHexColorValue;
- (NSString)identifier;
- (double)displayScaleFactor;
- (double)fontSize;
- (id)description;
- (void)setBackgroundHexColorValue:(id)a3;
- (void)setDisplayScaleFactor:(double)a3;
- (void)setEnhanced:(BOOL)a3;
- (void)setFontSize:(double)a3;
- (void)setForegroundHexColorValue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageFrame:(CGRect)a3;
@end

@implementation AXAuditContrastInput

- (AXAuditContrastInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXAuditContrastInput;
  result = [(AXAuditContrastInput *)&v3 init];
  if (result) {
    result->_displayScaleFactor = 1.0;
  }
  return result;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v4 = [(AXAuditContrastInput *)self identifier];
  uint64_t v5 = [(__CFString *)v4 length];
  v6 = &stru_26FB6E0B0;
  if (v5) {
    v6 = v4;
  }
  v7 = v6;

  v17.receiver = self;
  v17.super_class = (Class)AXAuditContrastInput;
  v8 = [(AXAuditContrastInput *)&v17 description];
  [(AXAuditContrastInput *)self imageFrame];
  v9 = NSStringFromRect(v19);
  [v3 appendFormat:@"%@, %@, %@", v8, v7, v9];

  if ([(AXAuditContrastInput *)self enhanced]) {
    [v3 appendString:@" Enhanced "];
  }
  v10 = [(AXAuditContrastInput *)self foregroundHexColorValue];

  if (v10)
  {
    v11 = [(AXAuditContrastInput *)self foregroundHexColorValue];
    [v3 appendFormat:@"ForegroundColor: %@", v11];
  }
  v12 = [(AXAuditContrastInput *)self backgroundHexColorValue];

  if (v12)
  {
    v13 = [(AXAuditContrastInput *)self backgroundHexColorValue];
    [v3 appendFormat:@"BackgroundColor: %@", v13];
  }
  [(AXAuditContrastInput *)self fontSize];
  if (v14 > 0.0)
  {
    [(AXAuditContrastInput *)self fontSize];
    objc_msgSend(v3, "appendFormat:", @"FontSize: %.1f", v15);
  }

  return v3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (CGRect)imageFrame
{
  double x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageFrame:(CGRect)a3
{
  self->_imageFrame = a3;
}

- (double)displayScaleFactor
{
  return self->_displayScaleFactor;
}

- (void)setDisplayScaleFactor:(double)a3
{
  self->_displayScaleFactor = a3;
}

- (BOOL)enhanced
{
  return self->_enhanced;
}

- (void)setEnhanced:(BOOL)a3
{
  self->_enhanced = a3;
}

- (NSString)foregroundHexColorValue
{
  return self->_foregroundHexColorValue;
}

- (void)setForegroundHexColorValue:(id)a3
{
}

- (NSString)backgroundHexColorValue
{
  return self->_backgroundHexColorValue;
}

- (void)setBackgroundHexColorValue:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_backgroundHexColorValue, 0);
  objc_storeStrong((id *)&self->_foregroundHexColorValue, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end