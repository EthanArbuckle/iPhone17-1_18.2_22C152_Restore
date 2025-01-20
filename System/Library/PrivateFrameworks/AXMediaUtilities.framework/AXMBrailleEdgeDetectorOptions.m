@interface AXMBrailleEdgeDetectorOptions
+ (BOOL)supportsSecureCoding;
- (AXMBrailleCanvasDescription)canvasDescription;
- (AXMBrailleEdgeDetectorOptions)initWithCanvasDescription:(id)a3;
- (AXMBrailleEdgeDetectorOptions)initWithCoder:(id)a3;
- (BOOL)invert;
- (CGPoint)origin;
- (double)edgeStrength;
- (double)zoomLevel;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCanvasDescription:(id)a3;
- (void)setEdgeStrength:(double)a3;
- (void)setInvert:(BOOL)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setZoomLevel:(double)a3;
@end

@implementation AXMBrailleEdgeDetectorOptions

- (AXMBrailleEdgeDetectorOptions)initWithCanvasDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMBrailleEdgeDetectorOptions;
  v6 = [(AXMBrailleEdgeDetectorOptions *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_canvasDescription, a3);
    v7->_zoomLevel = 1.0;
    v7->_origin.x = 0.0;
    v7->_origin.y = 0.0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMBrailleEdgeDetectorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMBrailleEdgeDetectorOptions;
  id v5 = [(AXMBrailleEdgeDetectorOptions *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"canvasDescription"];
    canvasDescription = v5->_canvasDescription;
    v5->_canvasDescription = (AXMBrailleCanvasDescription *)v6;

    [v4 decodeDoubleForKey:@"zoomLevel"];
    v5->_zoomLevel = v8;
    [v4 axmDecodePointForKey:@"origin"];
    v5->_origin.x = v9;
    v5->_origin.y = v10;
    [v4 decodeDoubleForKey:@"edgeStrength"];
    v5->_edgeStrength = v11;
    v5->_invert = [v4 decodeBoolForKey:@"invert"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  canvasDescription = self->_canvasDescription;
  id v5 = a3;
  [v5 encodeObject:canvasDescription forKey:@"canvasDescription"];
  [v5 encodeDouble:@"zoomLevel" forKey:self->_zoomLevel];
  objc_msgSend(v5, "axmEncodePoint:forKey:", @"origin", self->_origin.x, self->_origin.y);
  [v5 encodeDouble:@"edgeStrength" forKey:self->_edgeStrength];
  [v5 encodeBool:self->_invert forKey:@"invert"];
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMBrailleEdgeDetectorOptions<%p>\n", self);
  [v3 appendFormat:@"  Options: \n"];
  [v3 appendFormat:@"    CanvasDescription: %@\n", self->_canvasDescription];
  [v3 appendFormat:@"    zoomLevel: %.2f\n", *(void *)&self->_zoomLevel];
  id v4 = AXMStringFromCGPoint(self->_origin.x, self->_origin.y);
  [v3 appendFormat:@"    origin: %@\n", v4];

  [v3 appendFormat:@"    edgeStrength: %.2f\n", *(void *)&self->_edgeStrength];

  return v3;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  self->_zoomLevel = a3;
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (double)edgeStrength
{
  return self->_edgeStrength;
}

- (void)setEdgeStrength:(double)a3
{
  self->_edgeStrength = a3;
}

- (BOOL)invert
{
  return self->_invert;
}

- (void)setInvert:(BOOL)a3
{
  self->_invert = a3;
}

- (AXMBrailleCanvasDescription)canvasDescription
{
  return self->_canvasDescription;
}

- (void)setCanvasDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end