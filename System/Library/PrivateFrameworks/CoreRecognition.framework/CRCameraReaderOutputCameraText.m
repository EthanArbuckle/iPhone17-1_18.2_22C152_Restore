@interface CRCameraReaderOutputCameraText
- (CGRect)boundingBox;
- (NSAttributedString)overlayString;
- (float)rotation;
- (void)setBoundingBox:(CGRect)a3;
- (void)setOverlayString:(id)a3;
- (void)setRotation:(float)a3;
@end

@implementation CRCameraReaderOutputCameraText

- (void)setOverlayString:(id)a3
{
  id v4 = a3;
  id v5 = [(CRCameraReaderOutput *)self objectInternal];
  [v5 setOverlayString:v4];
}

- (NSAttributedString)overlayString
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  v3 = [v2 overlayString];

  return (NSAttributedString *)v3;
}

- (void)setRotation:(float)a3
{
  id v5 = [(CRCameraReaderOutput *)self objectInternal];
  *(float *)&double v4 = a3;
  [v5 setRotation:v4];
}

- (float)rotation
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  [v2 rotation];
  float v4 = v3;

  return v4;
}

- (void)setBoundingBox:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(CRCameraReaderOutput *)self objectInternal];
  objc_msgSend(v7, "setBoundingBox:", x, y, width, height);
}

- (CGRect)boundingBox
{
  v2 = [(CRCameraReaderOutput *)self objectInternal];
  [v2 boundingBox];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

@end