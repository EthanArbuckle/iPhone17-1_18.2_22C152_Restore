@interface HWEncoding
+ (id)decodeHandwritingFromData:(id)a3;
+ (id)decodedBrushStrokesWithData:(id)a3 inCanvasBounds:(CGRect)a4 inStrokesFrame:(CGRect)a5 strokeDataFieldCount:(unsigned int)a6 count:(unint64_t)a7;
+ (id)encodeBrushStrokesAsData:(id)a3 inCanvasBounds:(CGRect)a4 inStrokesFrame:(CGRect)a5;
+ (id)encodeHandwriting:(id)a3 compress:(BOOL)a4;
+ (id)protoDrawingFromDrawing:(id)a3 compress:(BOOL)a4;
+ (id)protoMessageFromHandwriting:(id)a3;
+ (void)writeDataToDisk:(id)a3 withName:(id)a4;
@end

@implementation HWEncoding

+ (id)encodeHandwriting:(id)a3 compress:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_opt_class();
  v7 = [v5 drawing];
  v8 = [v6 protoDrawingFromDrawing:v7 compress:v4];

  v9 = [(id)objc_opt_class() protoMessageFromHandwriting:v5];

  v10 = [v8 data];
  [v9 setDrawing:v10];

  v11 = [v9 data];

  return v11;
}

+ (id)decodeHandwritingFromData:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v10 = 0;
    goto LABEL_32;
  }
  BOOL v4 = [[HWPMessage alloc] initWithData:v3];
  if (!v4)
  {
    NSLog(&cfstr_UnableToUnarch_0.isa);
LABEL_30:
    v10 = 0;
    goto LABEL_31;
  }
  id v5 = [HWPDrawing alloc];
  v6 = [(HWPMessage *)v4 drawing];
  v7 = [(HWPDrawing *)v5 initWithData:v6];

  if (v7)
  {
    if ([(HWPDrawing *)v7 compressionAlgorithm] < 2)
    {
      v11 = [(HWPDrawing *)v7 strokes];
      if (!v11)
      {
LABEL_28:
        NSLog(&cfstr_NoArchivedstro.isa);
        goto LABEL_29;
      }
    }
    else
    {
      unsigned int v8 = [(HWPDrawing *)v7 compressionAlgorithm] - 2;
      if (v8 > 4) {
        compression_algorithm v9 = -1;
      }
      else {
        compression_algorithm v9 = dword_22AF746E4[v8];
      }
      uint64_t v34 = [(HWPDrawing *)v7 compressionAlgorithm];
      if (v34 >= 7)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v34);
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = off_264885748[(int)v34];
      }
      v36 = [(HWPDrawing *)v7 strokes];
      size_t v37 = [v36 length];

      size_t v38 = [(HWPDrawing *)v7 decompressedLength];
      id v39 = [(HWPDrawing *)v7 strokes];
      v40 = (const uint8_t *)[v39 bytes];

      v41 = (uint8_t *)malloc_type_calloc(v38, 1uLL, 0x6EAD4234uLL);
      if (v41)
      {
        v42 = v41;
        size_t v43 = compression_decode_buffer(v41, v38, v40, v37, 0, v9);
        if (v43)
        {
          v11 = [MEMORY[0x263EFF8F8] dataWithBytes:v42 length:v43];
        }
        else
        {
          NSLog(&cfstr_DecodingZuByte.isa, v37, v35);
          v11 = 0;
        }
        free(v42);
      }
      else
      {
        v11 = 0;
      }

      if (!v11) {
        goto LABEL_28;
      }
    }
    v12 = [(HWPDrawing *)v7 encodedCanvasSize];
    double v13 = HW_CGSizeFromIntegralData(v12);
    double v15 = v14;

    v16 = [(HWPDrawing *)v7 encodedStrokesFrame];
    double v17 = HW_CGRectFromIntegralData(v16);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    unsigned int v24 = [(HWPDrawing *)v7 strokesCount];
    uint64_t v25 = [(HWPDrawing *)v7 strokeDataFieldCount];
    if (v25 < 4)
    {
      NSLog(&cfstr_InvalidStroked.isa);
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v26 = v25;
    v27 = objc_alloc_init(DKDrawing);
    -[DKDrawing setStrokesFrame:](v27, "setStrokesFrame:", v17, v19, v21, v23);
    -[DKDrawing setCanvasBounds:](v27, "setCanvasBounds:", 0.0, 0.0, v13, v15);
    v28 = +[HWEncoding decodedBrushStrokesWithData:inCanvasBounds:inStrokesFrame:strokeDataFieldCount:count:](HWEncoding, "decodedBrushStrokesWithData:inCanvasBounds:inStrokesFrame:strokeDataFieldCount:count:", v11, v26, v24, 0.0, 0.0, v13, v15, v17, v19, v21, v23);
    if (!v28)
    {
      NSLog(&cfstr_FailedToUnarch.isa);

      goto LABEL_29;
    }
    [(DKDrawing *)v27 setStrokes:v28];
    double v29 = (double)[(HWPMessage *)v4 creationDate] / 1000.0;
    v10 = [[HWHandwritingItem alloc] initWithDrawing:v27];
    id v30 = objc_alloc(MEMORY[0x263F08C38]);
    v31 = [(HWPMessage *)v4 identifier];
    v32 = (void *)[v30 initWithUUIDString:v31];
    [(HWHandwritingItem *)v10 setUuid:v32];

    v33 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v29];
    [(HWHandwritingItem *)v10 setCreationDate:v33];
  }
  else
  {
    NSLog(&cfstr_UnableToUnarch.isa);
    v10 = 0;
  }

LABEL_31:
LABEL_32:

  return v10;
}

+ (id)protoMessageFromHandwriting:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    BOOL v4 = objc_alloc_init(HWPMessage);
    id v5 = [v3 creationDate];
    [v5 timeIntervalSinceReferenceDate];
    [(HWPMessage *)v4 setCreationDate:(uint64_t)(v6 * 1000.0)];

    v7 = [v3 uuid];

    unsigned int v8 = [v7 UUIDString];
    [(HWPMessage *)v4 setIdentifier:v8];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

+ (id)encodeBrushStrokesAsData:(id)a3 inCanvasBounds:(CGRect)a4 inStrokesFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.origin.y;
  double v10 = a4.origin.x;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a3;
  v48 = [v11 strokes];
  uint64_t v12 = [v48 count];
  uint64_t v13 = [v11 totalPoints];
  id v46 = [MEMORY[0x263EFF990] dataWithLength:8 * v13 + 2 * v12];
  uint64_t v47 = [v46 mutableBytes];
  memset(&v56, 0, sizeof(v56));
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v55.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v55.c = v14;
  *(_OWORD *)&v55.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformTranslate(&v56, &v55, v10 - x, v9 - y);
  if (v12)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    do
    {
      uint64_t v50 = v16;
      double v17 = objc_msgSend(v48, "objectAtIndex:");
      double v18 = [v17 strokePoints];
      __int16 v19 = [v18 count];

      *(_WORD *)(v47 + 2 * v15++) = v19;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v49 = v17;
      double v20 = [v17 strokePoints];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v52;
        do
        {
          uint64_t v24 = 0;
          uint64_t v25 = v47 + 4 + 2 * v15;
          v15 += 4 * v22;
          do
          {
            if (*(void *)v52 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v26 = *(void **)(*((void *)&v51 + 1) + 8 * v24);
            [v26 location];
            objc_msgSend(v26, "setLocation:", vaddq_f64(*(float64x2_t *)&v56.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v56.c, v27), *(float64x2_t *)&v56.a, v28)));
            if (v26)
            {
              id v29 = v26;
              [v29 location];
              double v31 = v30;
              double v33 = v32;
              v60.origin.double x = 0.0;
              v60.origin.double y = 0.0;
              v60.size.CGFloat width = width;
              v60.size.CGFloat height = height;
              float v34 = v31 / CGRectGetWidth(v60);
              v61.origin.double x = 0.0;
              v61.origin.double y = 0.0;
              v61.size.CGFloat width = width;
              v61.size.CGFloat height = height;
              *(float *)&double v33 = v33 / CGRectGetHeight(v61);
              [v29 force];
              *(float *)&double v35 = v35;
              float v36 = *(float *)&v35 / *(float *)&MaxForceValue;
              [v29 velocity];
              double v38 = v37;

              float v39 = v38;
              LODWORD(v40) = llroundf((float)(v34 + 1.0) * 32767.0);
              LODWORD(v41) = llroundf((float)(*(float *)&v33 + 1.0) * 32767.0);
              LODWORD(v42) = llroundf((float)((float)(v39 / *(float *)&MaxVelocityValue) + 1.0) * 32767.0);
              LODWORD(v43) = llroundf((float)(v36 + 1.0) * 32767.0);
              uint64_t v44 = (v43 << 48) | (v42 << 32) | (v41 << 16) | v40;
            }
            else
            {
              uint64_t v44 = 0;
            }
            *(void *)(v25 - 4) = v44;
            ++v24;
            v25 += 8;
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v51 objects:v57 count:16];
        }
        while (v22);
      }

      uint64_t v16 = v50 + 1;
    }
    while (v50 + 1 != v12);
  }

  return v46;
}

+ (id)decodedBrushStrokesWithData:(id)a3 inCanvasBounds:(CGRect)a4 inStrokesFrame:(CGRect)a5 strokeDataFieldCount:(unsigned int)a6 count:(unint64_t)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v15 = a3;
  uint64_t v16 = v15;
  if (a6 > 3)
  {
    uint64_t v18 = [v15 length];
    double v17 = 0;
    if (a7 && v18)
    {
      double v17 = [MEMORY[0x263EFF980] arrayWithCapacity:a7];
      memset(&v52, 0, sizeof(v52));
      long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v51.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v51.c = v19;
      *(_OWORD *)&v51.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      CGAffineTransformTranslate(&v52, &v51, -(v14 - x), -(v13 - y));
      uint64_t v42 = v16;
      id v20 = v16;
      uint64_t v45 = [v20 bytes];
      unint64_t v21 = [v20 length];
      if (v21 >= 2)
      {
        uint64_t v22 = 0;
        unint64_t v23 = 0;
        unint64_t v50 = v21 >> 1;
        uint64_t v24 = a6;
        uint64_t v47 = 2 * a6;
        uint64_t v48 = a6 - 1;
        uint64_t v43 = v17;
        unint64_t v44 = a7;
        do
        {
          uint64_t v46 = v22;
          uint64_t v25 = objc_alloc_init(DKDrawingStroke);
          uint64_t v49 = *(unsigned __int16 *)(v45 + 2 * v23);
          if (*(_WORD *)(v45 + 2 * v23))
          {
            uint64_t v26 = 0;
            uint64_t v27 = v45 + 2 + 2 * v23++;
            do
            {
              if (v48 + v23 >= v50) {
                break;
              }
              uint64_t v28 = 0;
              unsigned __int16 v29 = 0;
              unsigned __int16 v30 = 0;
              unsigned __int16 v31 = 0;
              unsigned __int16 v32 = 0;
              do
              {
                switch(v28)
                {
                  case 0:
                    unsigned __int16 v32 = *(_WORD *)(v27 + 2 * v28);
                    break;
                  case 1:
                    unsigned __int16 v31 = *(_WORD *)(v27 + 2 * v28);
                    break;
                  case 2:
                    unsigned __int16 v30 = *(_WORD *)(v27 + 2 * v28);
                    break;
                  case 3:
                    unsigned __int16 v29 = *(_WORD *)(v27 + 2 * v28);
                    break;
                  default:
                    break;
                }
                ++v28;
              }
              while (v24 != v28);
              v23 += v24;
              double v33 = objc_alloc_init(DKDrawingStrokePoint);
              v54.origin.double x = 0.0;
              v54.origin.double y = 0.0;
              v54.size.CGFloat width = width;
              v54.size.CGFloat height = height;
              CGFloat v34 = CGRectGetWidth(v54) * (float)((float)((float)v32 / 32767.0) + -1.0);
              v55.origin.double x = 0.0;
              v55.origin.double y = 0.0;
              v55.size.CGFloat width = width;
              v55.size.CGFloat height = height;
              CGFloat v35 = CGRectGetHeight(v55);
              float v36 = (float)((float)((float)v30 / 32767.0) + -1.0) * *(float *)&MaxVelocityValue;
              float v37 = (float)((float)((float)v29 / 32767.0) + -1.0) * *(float *)&MaxForceValue;
              -[DKDrawingStrokePoint setLocation:](v33, "setLocation:", v34, v35 * (float)((float)((float)v31 / 32767.0) + -1.0));
              [(DKDrawingStrokePoint *)v33 setForce:v37];
              [(DKDrawingStrokePoint *)v33 setVelocity:v36];
              [(DKDrawingStrokePoint *)v33 location];
              [(DKDrawingStrokePoint *)v33 setLocation:vaddq_f64(*(float64x2_t *)&v52.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v52.c, v38), *(float64x2_t *)&v52.a, v39))];
              uint64_t v40 = [(DKDrawingStroke *)v25 strokePoints];
              [v40 addObject:v33];

              ++v26;
              v27 += v47;
            }
            while (v26 != v49);
          }
          else
          {
            ++v23;
          }
          double v17 = v43;
          objc_msgSend(v43, "addObject:", v25, v42);

          uint64_t v22 = v46 + 1;
        }
        while (v46 + 1 < v44 && v23 < v50);
      }
      uint64_t v16 = v42;
    }
  }
  else
  {
    NSLog(&cfstr_UnexpecedStrok.isa);
    double v17 = 0;
  }

  return v17;
}

+ (void)writeDataToDisk:(id)a3 withName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = NSTemporaryDirectory();
  unsigned int v8 = [NSURL fileURLWithPath:v7];
  if ([v5 length])
  {
    id v9 = v5;
  }
  else
  {
    double v10 = NSString;
    id v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v11 UUIDString];
    id v9 = [v10 stringWithFormat:@"handwriting_%@.data", v12];
  }
  double v13 = [v8 URLByAppendingPathComponent:v9];

  id v16 = 0;
  [v6 writeToURL:v13 options:1 error:&v16];

  id v14 = v16;
  id v15 = v14;
  if (v14) {
    NSLog(&stru_26DE41510.isa, v14);
  }
  else {
    NSLog(&cfstr_WrotePayloadTo.isa, v13);
  }
}

+ (id)protoDrawingFromDrawing:(id)a3 compress:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v5 = (void *)[a3 copy];
    id v6 = objc_alloc_init(HWPDrawing);
    [v5 canvasBounds];
    id v9 = HW_DataFromIntegralCGSize(v7, v8);
    [v5 strokesFrame];
    id v14 = HW_DataFromIntegralCGRect(v10, v11, v12, v13);
    [v5 canvasBounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    [v5 strokesFrame];
    uint64_t v27 = +[HWEncoding encodeBrushStrokesAsData:inCanvasBounds:inStrokesFrame:](HWEncoding, "encodeBrushStrokesAsData:inCanvasBounds:inStrokesFrame:", v5, v16, v18, v20, v22, v23, v24, v25, v26);
    id v28 = v27;
    if (v4)
    {
      size_t v29 = [v27 length];
      unsigned __int16 v30 = (uint8_t *)malloc_type_calloc(v29, 1uLL, 0x100004077774924uLL);
      if (v30)
      {
        unsigned __int16 v31 = v30;
        id v28 = v28;
        size_t v32 = compression_encode_buffer(v31, v29, (const uint8_t *)[v28 bytes], v29, 0, COMPRESSION_LZMA);
        if (v32)
        {
          uint64_t v33 = [MEMORY[0x263EFF8F8] dataWithBytes:v31 length:v32];

          [(HWPDrawing *)v6 setCompressionAlgorithm:4];
          [(HWPDrawing *)v6 setDecompressedLength:v29];
          id v28 = (id)v33;
        }
        else
        {
          [(HWPDrawing *)v6 setCompressionAlgorithm:1];
        }
        free(v31);
      }
    }
    [(HWPDrawing *)v6 setEncodedCanvasSize:v9];
    [(HWPDrawing *)v6 setEncodedStrokesFrame:v14];
    [(HWPDrawing *)v6 setStrokes:v28];
    CGFloat v34 = [v5 strokes];
    -[HWPDrawing setStrokesCount:](v6, "setStrokesCount:", [v34 count]);

    [(HWPDrawing *)v6 setStrokeDataFieldCount:4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

@end