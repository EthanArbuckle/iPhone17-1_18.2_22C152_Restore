@interface CRCameraReaderOutputInternal
- (CGRect)boundingBox;
- (NSArray)targetVertices;
- (NSArray)vertices;
- (NSAttributedString)overlayString;
- (NSNumber)dayValue;
- (NSNumber)monthValue;
- (NSNumber)yearValue;
- (NSString)capturePath;
- (NSString)formattedStringValue;
- (NSString)stringValue;
- (NSString)type;
- (UIImage)imageValue;
- (float)rotation;
- (void)setBoundingBox:(CGRect)a3;
- (void)setCapturePath:(id)a3;
- (void)setDayValue:(id)a3;
- (void)setFormattedStringValue:(id)a3;
- (void)setImageValue:(id)a3;
- (void)setMonthValue:(id)a3;
- (void)setOverlayString:(id)a3;
- (void)setRotation:(float)a3;
- (void)setStringValue:(id)a3;
- (void)setTargetVertices:(id)a3;
- (void)setType:(id)a3;
- (void)setVertices:(id)a3;
- (void)setYearValue:(id)a3;
@end

@implementation CRCameraReaderOutputInternal

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  if (a3)
  {
    v4 = (NSString *)objc_msgSend(NSString, "_newZStringWithString:");
    stringValue = self->_stringValue;
    self->_stringValue = v4;
  }
  else
  {
    v6 = [(CRCameraReaderOutputInternal *)self type];
    NSLog(&cfstr_AttemptToSetNi.isa, v6);

    stringValue = self->_stringValue;
    self->_stringValue = 0;
  }
}

- (NSString)formattedStringValue
{
  return self->_formattedStringValue;
}

- (void)setFormattedStringValue:(id)a3
{
  v4 = (NSString *)[NSString _newZStringWithString:a3];
  formattedStringValue = self->_formattedStringValue;
  self->_formattedStringValue = v4;
}

- (NSArray)vertices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVertices:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setType:(id)a3
{
}

- (NSAttributedString)overlayString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOverlayString:(id)a3
{
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_boundingBox, &v3, 32, 1, 0);
}

- (float)rotation
{
  return self->_rotation;
}

- (void)setRotation:(float)a3
{
  self->_rotation = a3;
}

- (NSArray)targetVertices
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTargetVertices:(id)a3
{
}

- (NSString)capturePath
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCapturePath:(id)a3
{
}

- (NSNumber)yearValue
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setYearValue:(id)a3
{
}

- (NSNumber)monthValue
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMonthValue:(id)a3
{
}

- (NSNumber)dayValue
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDayValue:(id)a3
{
}

- (UIImage)imageValue
{
  return (UIImage *)objc_getProperty(self, a2, 56, 1);
}

- (void)setImageValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayString, 0);
  objc_storeStrong((id *)&self->_formattedStringValue, 0);
  objc_storeStrong((id *)&self->_capturePath, 0);
  objc_storeStrong((id *)&self->_targetVertices, 0);
  objc_storeStrong((id *)&self->overlayString, 0);
  objc_storeStrong((id *)&self->_imageValue, 0);
  objc_storeStrong((id *)&self->_dayValue, 0);
  objc_storeStrong((id *)&self->_monthValue, 0);
  objc_storeStrong((id *)&self->_yearValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end