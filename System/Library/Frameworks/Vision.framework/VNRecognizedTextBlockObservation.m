@interface VNRecognizedTextBlockObservation
- (BOOL)shouldBeWrappedWithNextLine;
- (NSArray)getChildren;
- (NSArray)getLines;
- (NSArray)getRecognizedLanguages;
- (NSString)getTranscript;
- (VNRecognizedTextBlockObservation)initWithRequestRevision:(unint64_t)a3 crOutputRegion:(id)a4;
- (id)boundingBoxForRange:(_NSRange)a3 error:(id *)a4;
- (id)debugDescription;
- (id)getCROutputRegion;
- (id)getDataDetectorResults:(id *)a3;
- (id)topCandidates:(unint64_t)a3;
@end

@implementation VNRecognizedTextBlockObservation

- (void).cxx_destruct
{
}

- (id)getDataDetectorResults:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v16 = [(CROutputRegion *)self->_crOutputRegion contentsWithTypes:2048];
  if ([v16 count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
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
          v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v10 = [VNDataDetectorResult alloc];
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
    v4 = 0;
  }

  kdebug_trace();

  return v4;
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)VNRecognizedTextBlockObservation;
  v3 = [(VNRecognizedTextBlockObservation *)&v7 debugDescription];
  v4 = [(VNRecognizedTextBlockObservation *)self getTranscript];
  id v5 = [v3 stringByAppendingFormat:@" transcript=\"%@\"", v4];

  return v5;
}

- (NSArray)getRecognizedLanguages
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(VNRecognizedTextBlockObservation *)self getCROutputRegion];
  v3 = [v2 recognizedLocale];

  if (v3)
  {
    v4 = [v2 recognizedLocale];
    id v5 = (void *)[v4 copy];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

- (BOOL)shouldBeWrappedWithNextLine
{
  v2 = [(VNRecognizedTextBlockObservation *)self getCROutputRegion];
  if ([v2 type] == 8) {
    char v3 = [v2 shouldWrapToNextLine];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)getCROutputRegion
{
  return self->_crOutputRegion;
}

- (NSArray)getLines
{
  char v3 = [(CROutputRegion *)self->_crOutputRegion contentsWithTypes:8];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __44__VNRecognizedTextBlockObservation_getLines__block_invoke;
  v8[3] = &unk_1E5B1F590;
  id v5 = v4;
  id v9 = v5;
  v10 = self;
  [v3 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = (NSArray *)v5;

  return v6;
}

void __44__VNRecognizedTextBlockObservation_getLines__block_invoke(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", [*(id *)(a1 + 40) requestRevision], v4);

  [v3 addObject:v5];
}

- (NSString)getTranscript
{
  v2 = [(VNRecognizedTextBlockObservation *)self topCandidates:1];
  char v3 = [v2 firstObject];

  id v4 = [v3 string];

  return (NSString *)v4;
}

- (id)boundingBoxForRange:(_NSRange)a3 error:(id *)a4
{
  id v5 = -[CROutputRegion quadForTextInCharacterRange:](self->_crOutputRegion, "quadForTextInCharacterRange:", a3.location, a3.length, a4);
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 topLeft];
    double v8 = v7;
    double v10 = 1.0 - v9;
    [v6 topRight];
    double v12 = v11;
    double v14 = 1.0 - v13;
    [v6 bottomLeft];
    double v16 = v15;
    double v18 = 1.0 - v17;
    [v6 bottomRight];
    v21 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:]([VNRectangleObservation alloc], "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", [(VNObservation *)self requestRevision], v8, v10, v12, v14, v20, 1.0 - v19, v16, v18);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)topCandidates:(unint64_t)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(CROutputRegion *)self->_crOutputRegion candidates];
  if (!v6)
  {
    v24[0] = self->_crOutputRegion;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  }
  unint64_t v7 = [v6 count];
  if (v7 >= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  double v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        double v16 = [VNRecognizedTextBlock alloc];
        double v17 = [(VNRecognizedTextBlock *)v16 initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:v15];
        if (v17) {
          [v5 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v5;
}

- (NSArray)getChildren
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(CROutputRegion *)self->_crOutputRegion children];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [[VNRecognizedTextBlock alloc] initWithRequestRevision:[(VNObservation *)self requestRevision] crOutputRegion:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (VNRecognizedTextBlockObservation)initWithRequestRevision:(unint64_t)a3 crOutputRegion:(id)a4
{
  id v7 = a4;
  unint64_t v8 = [v7 boundingQuad];
  [v8 topLeft];
  double v10 = v9;
  double v12 = 1.0 - v11;
  long long v13 = [v7 boundingQuad];
  [v13 topRight];
  double v15 = v14;
  double v17 = 1.0 - v16;
  double v18 = [v7 boundingQuad];
  [v18 bottomRight];
  double v20 = v19;
  double v22 = 1.0 - v21;
  v23 = [v7 boundingQuad];
  [v23 bottomLeft];
  v32.receiver = self;
  v32.super_class = (Class)VNRecognizedTextBlockObservation;
  v26 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](&v32, sel_initWithRequestRevision_topLeft_topRight_bottomRight_bottomLeft_, a3, v10, v12, v15, v17, v20, v22, v25, 1.0 - v24);

  if (v26)
  {
    objc_storeStrong((id *)&v26->_crOutputRegion, a4);
    [(CROutputRegion *)v26->_crOutputRegion rawConfidence];
    -[VNObservation setConfidence:](v26, "setConfidence:");
    v27 = [(CROutputRegion *)v26->_crOutputRegion trackingID];

    crOutputRegion = v26->_crOutputRegion;
    if (v27) {
      [(CROutputRegion *)crOutputRegion trackingID];
    }
    else {
    v29 = [(CROutputRegion *)crOutputRegion uuid];
    }
    [(VNObservation *)v26 setUUID:v29];

    v30 = v26;
  }

  return v26;
}

@end