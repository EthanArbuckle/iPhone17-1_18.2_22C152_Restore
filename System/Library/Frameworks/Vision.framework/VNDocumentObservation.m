@interface VNDocumentObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldReprocessDocument;
- (NSArray)getBlocks;
- (NSString)getTranscript;
- (VNDocumentObservation)initWithCoder:(id)a3;
- (VNDocumentObservation)initWithTopLevelRegion:(id)a3 requestRevision:(unint64_t)a4;
- (VNRecognizedTextBlockObservation)getTitle;
- (_NSRange)rangeOfTextBlock:(id)a3;
- (_NSRange)rangeOfTextBlockObservation:(id)a3;
- (id)_textBlockObservationsFromRegion:(id)a3 requestRevision:(unint64_t)a4;
- (id)blocksWithTypes:(unint64_t)a3 inRegion:(CGRect)a4;
- (id)boundingBoxForTextRange:(_NSRange)a3 error:(id *)a4;
- (id)closestTextBlockOfTypes:(unint64_t)a3 toPoint:(CGPoint)a4 maximumPixelDistance:(int64_t)a5;
- (id)getCRDocumentOutputRegion;
- (id)getDataDetectorResults:(id *)a3;
- (id)textBlockOfTypes:(unint64_t)a3 containingTextAtIndex:(int64_t)a4;
- (id)textBlockWithCharacterRange:(_NSRange)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNDocumentObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);

  objc_storeStrong((id *)&self->_topLevelRegion, 0);
}

- (VNDocumentObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNDocumentObservation;
  v5 = [(VNDetectedObjectObservation *)&v10 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"topLevelRegion"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        topLevelRegion = v5->_topLevelRegion,
        v5->_topLevelRegion = (CRDocumentOutputRegion *)v6,
        topLevelRegion,
        !v5->_topLevelRegion))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNDocumentObservation;
  id v4 = a3;
  [(VNDetectedObjectObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_topLevelRegion, @"topLevelRegion", v5.receiver, v5.super_class);
}

- (id)vn_cloneObject
{
  v9.receiver = self;
  v9.super_class = (Class)VNDocumentObservation;
  v3 = [(VNDetectedObjectObservation *)&v9 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(CRDocumentOutputRegion *)self->_topLevelRegion copy];
    objc_super v5 = (void *)v3[20];
    v3[20] = v4;

    uint64_t v6 = [(NSArray *)self->_blocks copy];
    v7 = (void *)v3[21];
    v3[21] = v6;
  }

  return v3;
}

- (id)getDataDetectorResults:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v16 = [(CRDocumentOutputRegion *)self->_topLevelRegion contentsWithTypes:2048];
  if ([v16 count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v16;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          objc_super v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_super v10 = [VNDataDetectorResult alloc];
          v11 = [v9 ddResult];
          v12 = [(VNDataDetectorResult *)v10 initWithDDScannerResult:v11 observation:self];

          uint64_t v13 = [v9 dataType];
          if ((unint64_t)(v13 - 1) >= 9) {
            uint64_t v14 = 0;
          }
          else {
            uint64_t v14 = v13;
          }
          [(VNDataDetectorResult *)v12 setType:v14];
          [v4 addObject:v12];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  kdebug_trace();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNDocumentObservation *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VNDocumentObservation;
    if ([(VNDetectedObjectObservation *)&v8 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v5 = v4;
      if ([(CRDocumentOutputRegion *)self->_topLevelRegion isEqual:v5->_topLevelRegion]) {
        char v6 = [(NSArray *)self->_blocks isEqual:v5->_blocks];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNDocumentObservation;
  return [(NSArray *)self->_blocks hash] ^ __ROR8__([(CRDocumentOutputRegion *)self->_topLevelRegion hash] ^ __ROR8__([(VNDetectedObjectObservation *)&v3 hash], 51), 51);
}

- (BOOL)shouldReprocessDocument
{
  v2 = [(VNDocumentObservation *)self getCRDocumentOutputRegion];
  char v3 = [v2 shouldReprocessDocument];

  return v3;
}

- (id)getCRDocumentOutputRegion
{
  return self->_topLevelRegion;
}

- (id)closestTextBlockOfTypes:(unint64_t)a3 toPoint:(CGPoint)a4 maximumPixelDistance:(int64_t)a5
{
  char v6 = -[CRDocumentOutputRegion closestContentRegionOfType:toNormalizedPoint:maxPixelDistance:](self->_topLevelRegion, "closestContentRegionOfType:toNormalizedPoint:maxPixelDistance:", a3, a5, a4.x, 1.0 - a4.y);
  if (v6) {
    uint64_t v7 = [[VNRecognizedTextBlockObservation alloc] initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)textBlockWithCharacterRange:(_NSRange)a3
{
  uint64_t v4 = -[CRDocumentOutputRegion outputRegionWithContentsOfCharacterRange:](self->_topLevelRegion, "outputRegionWithContentsOfCharacterRange:", a3.location, a3.length);
  if (v4) {
    id v5 = [[VNRecognizedTextBlockObservation alloc] initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NSArray)getBlocks
{
  return (NSArray *)-[VNDocumentObservation blocksWithTypes:inRegion:](self, "blocksWithTypes:inRegion:", 4159, 0.0, 0.0, 1.0, 1.0);
}

- (id)textBlockOfTypes:(unint64_t)a3 containingTextAtIndex:(int64_t)a4
{
  id v5 = [(CRDocumentOutputRegion *)self->_topLevelRegion contentRegionOfType:a3 containingTextAtIndex:a4];
  char v6 = [[VNRecognizedTextBlock alloc] initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:v5];

  return v6;
}

- (_NSRange)rangeOfTextBlockObservation:(id)a3
{
  uint64_t v4 = [a3 getCROutputRegion];
  uint64_t v5 = [(CRDocumentOutputRegion *)self->_topLevelRegion rangeOfContentRegion:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)rangeOfTextBlock:(id)a3
{
  uint64_t v4 = [a3 getCROutputRegion];
  uint64_t v5 = [(CRDocumentOutputRegion *)self->_topLevelRegion rangeOfContentRegion:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)boundingBoxForTextRange:(_NSRange)a3 error:(id *)a4
{
  uint64_t v5 = -[CRDocumentOutputRegion quadForTextInCharacterRange:](self->_topLevelRegion, "quadForTextInCharacterRange:", a3.location, a3.length, a4);
  NSUInteger v6 = [VNRectangleObservation alloc];
  unint64_t v7 = [(VNObservation *)self requestRevision];
  [v5 topLeft];
  double v9 = v8;
  double v11 = 1.0 - v10;
  [v5 topRight];
  double v13 = v12;
  double v15 = 1.0 - v14;
  [v5 bottomRight];
  double v17 = v16;
  double v19 = 1.0 - v18;
  [v5 bottomLeft];
  uint64_t v22 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](v6, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", v7, v9, v11, v13, v15, v17, v19, v21, 1.0 - v20);

  return v22;
}

- (id)blocksWithTypes:(unint64_t)a3 inRegion:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  __int16 v8 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((v8 & 0x1000) != 0)
  {
    double v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self isKindOfClass: %@", objc_opt_class()];
    double v12 = [(NSArray *)self->_blocks filteredArrayUsingPredicate:v11];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke;
    v30[3] = &__block_descriptor_64_e47_B24__0__VNBarcodeObservation_8__NSDictionary_16l;
    *(CGFloat *)&v30[4] = x;
    *(CGFloat *)&v30[5] = y;
    *(CGFloat *)&v30[6] = width;
    *(CGFloat *)&v30[7] = height;
    double v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:v30];
    double v14 = [v12 filteredArrayUsingPredicate:v13];

    [v10 addObjectsFromArray:v14];
  }
  if ((v8 & 0x3E) != 0)
  {
    double v15 = [(CRDocumentOutputRegion *)self->_topLevelRegion contentsWithTypes:v8 & 0xFFF];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke_2;
    v29[3] = &__block_descriptor_64_e41_B24__0__CROutputRegion_8__NSDictionary_16l;
    *(CGFloat *)&v29[4] = x;
    *(CGFloat *)&v29[5] = y;
    *(CGFloat *)&v29[6] = width;
    *(CGFloat *)&v29[7] = height;
    double v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:v29];
    double v17 = [v15 filteredArrayUsingPredicate:v16];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[VNRecognizedTextBlockObservation alloc] initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:*(void *)(*((void *)&v25 + 1) + 8 * i)];
          if (v23) {
            [v10 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v20);
    }
  }

  return v10;
}

BOOL __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke(void *a1, void *a2)
{
  [a2 boundingBox];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = a1[4];
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[6];
  uint64_t v14 = a1[7];

  return CGRectIntersectsRect(*(CGRect *)&v11, *(CGRect *)&v4);
}

BOOL __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = [a2 boundingQuad];
  [v3 boundingBox];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  double v9 = v8;
  double v11 = 1.0 - v10 - v8;

  uint64_t v12 = a1[4];
  uint64_t v13 = a1[5];
  uint64_t v14 = a1[6];
  uint64_t v15 = a1[7];
  uint64_t v16 = v5;
  double v17 = v11;
  uint64_t v18 = v7;
  double v19 = v9;

  return CGRectIntersectsRect(*(CGRect *)&v12, *(CGRect *)&v16);
}

- (VNRecognizedTextBlockObservation)getTitle
{
  uint64_t v3 = [(CRDocumentOutputRegion *)self->_topLevelRegion title];
  if (v3) {
    uint64_t v4 = [[VNRecognizedTextBlockObservation alloc] initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSString)getTranscript
{
  return (NSString *)[(CRDocumentOutputRegion *)self->_topLevelRegion text];
}

- (id)_textBlockObservationsFromRegion:(id)a3 requestRevision:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 contentsWithTypes:2];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (void)v19) == 2
          || [v13 type] == 4
          || [v13 type] == 8
          || [v13 type] == 2048)
        {
          uint64_t v14 = [[VNRecognizedTextBlockObservation alloc] initWithRequestRevision:a4 crOutputRegion:v13];
          if (!v14)
          {

            id v17 = 0;
            goto LABEL_16;
          }
          uint64_t v15 = v14;
          uint64_t v16 = [v5 title];
          [(VNRecognizedTextObservation *)v15 setIsTitle:v13 == v16];

          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = v7;
LABEL_16:

  return v17;
}

- (VNDocumentObservation)initWithTopLevelRegion:(id)a3 requestRevision:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 boundingQuad];
  [v7 boundingBox];
  v18.receiver = self;
  v18.super_class = (Class)VNDocumentObservation;
  id v8 = -[VNDetectedObjectObservation initWithRequestRevision:boundingBox:](&v18, sel_initWithRequestRevision_boundingBox_, a4);

  if (v8)
  {
    uint64_t v9 = [v6 copy];
    topLevelRegion = v8->_topLevelRegion;
    v8->_topLevelRegion = (CRDocumentOutputRegion *)v9;

    uint64_t v11 = [(VNDocumentObservation *)v8 _textBlockObservationsFromRegion:v8->_topLevelRegion requestRevision:a4];
    uint64_t v12 = [v11 copy];
    blocks = v8->_blocks;
    v8->_blocks = (NSArray *)v12;

    uint64_t v14 = [(CRDocumentOutputRegion *)v8->_topLevelRegion trackingID];

    uint64_t v15 = v8->_topLevelRegion;
    if (v14) {
      [(CRDocumentOutputRegion *)v15 trackingID];
    }
    else {
    uint64_t v16 = [(CRDocumentOutputRegion *)v15 uuid];
    }
    [(VNObservation *)v8 setUUID:v16];
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end