@interface AXMBrailleCanvasDescription
+ (BOOL)supportsSecureCoding;
- (AXMBrailleCanvasDescription)initWithCoder:(id)a3;
- (AXMBrailleCanvasDescription)initWithHeight:(unint64_t)a3 width:(unint64_t)a4 numberOfDiscretePinHeights:(unint64_t)a5;
- (BOOL)hasConsistentHorizontalPinSpacing;
- (BOOL)hasConsistentVerticalPinSpacing;
- (double)horizontalPinSpacing;
- (double)interCellHorizontalSpacing;
- (double)interCellVerticalSpacing;
- (double)verticalPinSpacing;
- (id)description;
- (unint64_t)height;
- (unint64_t)numberOfDiscretePinHeights;
- (unint64_t)width;
- (void)encodeWithCoder:(id)a3;
- (void)setHasConsistentHorizontalPinSpacing:(BOOL)a3;
- (void)setHasConsistentVerticalPinSpacing:(BOOL)a3;
- (void)setHorizontalPinSpacing:(double)a3;
- (void)setInterCellHorizontalSpacing:(double)a3;
- (void)setInterCellVerticalSpacing:(double)a3;
- (void)setVerticalPinSpacing:(double)a3;
@end

@implementation AXMBrailleCanvasDescription

- (AXMBrailleCanvasDescription)initWithHeight:(unint64_t)a3 width:(unint64_t)a4 numberOfDiscretePinHeights:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AXMBrailleCanvasDescription;
  result = [(AXMBrailleCanvasDescription *)&v9 init];
  if (result)
  {
    result->_width = a4;
    result->_height = a3;
    result->_numberOfDiscretePinHeights = a5;
    *(_WORD *)&result->_hasConsistentHorizontalPinSpacing = 257;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMBrailleCanvasDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMBrailleCanvasDescription;
  v5 = [(AXMBrailleCanvasDescription *)&v12 init];
  if (!v5) {
    goto LABEL_7;
  }
  v5->_height = [v4 decodeIntegerForKey:@"height"];
  v5->_width = [v4 decodeIntegerForKey:@"width"];
  v5->_numberOfDiscretePinHeights = [v4 decodeIntegerForKey:@"numberOfDiscretePinHeights"];
  v5->_hasConsistentHorizontalPinSpacing = [v4 decodeBoolForKey:@"hasConsistentHorizontalPinSpacing"];
  v5->_hasConsistentVerticalPinSpacing = [v4 decodeBoolForKey:@"hasConsistentVerticalPinSpacing"];
  [v4 decodeDoubleForKey:@"verticalPinSpacing"];
  v5->_verticalPinSpacing = v6;
  [v4 decodeDoubleForKey:@"horizontalPinSpacing"];
  v5->_horizontalPinSpacing = v7;
  [v4 decodeDoubleForKey:@"interCellHorizontalSpacing"];
  v5->_interCellHorizontalSpacing = v8;
  [v4 decodeDoubleForKey:@"interCellVerticalSpacing"];
  v5->_interCellVerticalSpacing = v9;
  if (v5->_hasConsistentHorizontalPinSpacing && v5->_hasConsistentVerticalPinSpacing) {
    goto LABEL_7;
  }
  if (v5->_verticalPinSpacing == 0.0 || v5->_horizontalPinSpacing == 0.0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"verticalPinSpacing and horizontalPinSpacing are required if cell spacing is not uniform."];
    v10 = 0;
  }
  else
  {
LABEL_7:
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t height = self->_height;
  id v5 = a3;
  [v5 encodeInteger:height forKey:@"height"];
  [v5 encodeInteger:self->_width forKey:@"width"];
  objc_msgSend(v5, "encodeInteger:forKey:", -[AXMBrailleCanvasDescription numberOfDiscretePinHeights](self, "numberOfDiscretePinHeights"), @"numberOfDiscretePinHeights");
  [v5 encodeBool:self->_hasConsistentHorizontalPinSpacing forKey:@"hasConsistentHorizontalPinSpacing"];
  [v5 encodeBool:self->_hasConsistentVerticalPinSpacing forKey:@"hasConsistentVerticalPinSpacing"];
  [v5 encodeDouble:@"verticalPinSpacing" forKey:self->_verticalPinSpacing];
  [v5 encodeDouble:@"horizontalPinSpacing" forKey:self->_horizontalPinSpacing];
  [v5 encodeDouble:@"interCellHorizontalSpacing" forKey:self->_interCellHorizontalSpacing];
  [v5 encodeDouble:@"interCellVerticalSpacing" forKey:self->_interCellVerticalSpacing];

  if ((!self->_hasConsistentHorizontalPinSpacing || !self->_hasConsistentVerticalPinSpacing)
    && (self->_verticalPinSpacing == 0.0 || self->_horizontalPinSpacing == 0.0))
  {
    double v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    [v6 raise:v7 format:@"verticalPinSpacing and horizontalPinSpacing are required if cell spacing is not uniform."];
  }
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMBrailleCanvasDescription<%p>\n", self);
  [v3 appendFormat:@"  Options: \n"];
  [v3 appendFormat:@"    Size(%ld, %ld)\n", self->_width, self->_height];
  objc_msgSend(v3, "appendFormat:", @"    numberOfDiscretePinHeights: %ld\n", self->_numberOfDiscretePinHeights);
  if (!self->_hasConsistentVerticalPinSpacing || !self->_hasConsistentHorizontalPinSpacing)
  {
    float verticalPinSpacing = self->_verticalPinSpacing;
    [v3 appendFormat:@"        verticalPinSpacing: %.2f\n", verticalPinSpacing];
    float horizontalPinSpacing = self->_horizontalPinSpacing;
    [v3 appendFormat:@"        horizontalPinSpacing: %.2f\n", horizontalPinSpacing];
    float interCellHorizontalSpacing = self->_interCellHorizontalSpacing;
    [v3 appendFormat:@"        interCellHorizontalSpacing: %.2f\n", interCellHorizontalSpacing];
    float interCellVerticalSpacing = self->_interCellVerticalSpacing;
    [v3 appendFormat:@"        interCellVerticalSpacing: %.2f\n", interCellVerticalSpacing];
  }

  return v3;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)numberOfDiscretePinHeights
{
  return self->_numberOfDiscretePinHeights;
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  return self->_hasConsistentHorizontalPinSpacing;
}

- (void)setHasConsistentHorizontalPinSpacing:(BOOL)a3
{
  self->_hasConsistentHorizontalPinSpacing = a3;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  return self->_hasConsistentVerticalPinSpacing;
}

- (void)setHasConsistentVerticalPinSpacing:(BOOL)a3
{
  self->_hasConsistentVerticalPinSpacing = a3;
}

- (double)verticalPinSpacing
{
  return self->_verticalPinSpacing;
}

- (void)setVerticalPinSpacing:(double)a3
{
  self->_float verticalPinSpacing = a3;
}

- (double)horizontalPinSpacing
{
  return self->_horizontalPinSpacing;
}

- (void)setHorizontalPinSpacing:(double)a3
{
  self->_float horizontalPinSpacing = a3;
}

- (double)interCellHorizontalSpacing
{
  return self->_interCellHorizontalSpacing;
}

- (void)setInterCellHorizontalSpacing:(double)a3
{
  self->_float interCellHorizontalSpacing = a3;
}

- (double)interCellVerticalSpacing
{
  return self->_interCellVerticalSpacing;
}

- (void)setInterCellVerticalSpacing:(double)a3
{
  self->_float interCellVerticalSpacing = a3;
}

@end