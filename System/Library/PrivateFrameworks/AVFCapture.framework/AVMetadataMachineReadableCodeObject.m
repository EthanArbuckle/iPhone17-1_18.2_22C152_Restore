@interface AVMetadataMachineReadableCodeObject
+ (AVMetadataMachineReadableCodeObject)machineReadableCodeObjectWithAppClipCodeDictionary:(id)a3 input:(id)a4;
+ (AVMetadataMachineReadableCodeObject)machineReadableCodeObjectWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:(id)a3 input:(id)a4;
- (AVMetadataMachineReadableCodeObject)initWithAppClipCodeDictionary:(id)a3 input:(id)a4;
- (AVMetadataMachineReadableCodeObject)initWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:(id)a3 input:(id)a4;
- (CIBarcodeDescriptor)descriptor;
- (NSArray)corners;
- (NSString)stringValue;
- (id)basicDescriptor;
- (id)description;
- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6;
- (void)dealloc;
@end

@implementation AVMetadataMachineReadableCodeObject

+ (AVMetadataMachineReadableCodeObject)machineReadableCodeObjectWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:(id)a3 input:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:a3 input:a4];

  return (AVMetadataMachineReadableCodeObject *)v4;
}

+ (AVMetadataMachineReadableCodeObject)machineReadableCodeObjectWithAppClipCodeDictionary:(id)a3 input:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAppClipCodeDictionary:a3 input:a4];

  return (AVMetadataMachineReadableCodeObject *)v4;
}

- (AVMetadataMachineReadableCodeObject)initWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:(id)a3 input:(id)a4
{
  long long v38 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v43.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v43.epoch = v7;
  v8 = (double *)MEMORY[0x1E4F1DB28];
  CFDictionaryRef v9 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51220]];
  if (v9) {
    CMTimeMakeFromDictionary(&v43, v9);
  }
  double x = *v8;
  double y = v8[1];
  double width = v8[2];
  double height = v8[3];
  CFDictionaryRef v14 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F511C8]];
  if (v14)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v14, &rect))
    {
      double x = rect.origin.x;
      double y = rect.origin.y;
      double width = rect.size.width;
      double height = rect.size.height;
    }
  }
  v15 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F511B8]];
  v16 = v15;
  if (v15)
  {
    v17 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F511D0]];
    if (v17)
    {
      if (figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypesToken != -1) {
        dispatch_once(&figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypesToken, &__block_literal_global_12);
      }
      v17 = (void *)[(id)figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypes objectForKeyedSubscript:v17];
    }
  }
  else
  {
    v17 = 0;
  }
  v41.receiver = self;
  v41.super_class = (Class)AVMetadataMachineReadableCodeObject;
  rect.origin = *(CGPoint *)&v43.value;
  *(void *)&rect.size.double width = v43.epoch;
  long long v39 = v38;
  CMTimeEpoch v40 = v7;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v41, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, v17, &rect, &v39, 0, 0, a4, x, y, width, height);
  if (v18)
  {
    v19 = objc_alloc_init(AVMetadataMachineReadableCodeObjectInternal);
    v18->_internal = v19;
    if (v19)
    {
      uint64_t v20 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F511B0]];
      if (v20) {
        [(AVMetadataMachineReadableCodeObjectInternal *)v18->_internal setCorners:v20];
      }
      if (v16) {
        [(AVMetadataMachineReadableCodeObjectInternal *)v18->_internal setBasicDescriptor:v16];
      }
      uint64_t v21 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F511C0]];
      if (v21)
      {
        uint64_t v22 = v21;
        if (([v17 isEqualToString:@"org.iso.QRCode"] & 1) == 0
          && ![v17 isEqualToString:@"org.iso.MicroPDF417"])
        {
          if ([v17 isEqualToString:@"org.iso.Aztec"])
          {
            v28 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511A8]];
            v29 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511A0]];
            v30 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F51198]];
            uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1DFF0], "descriptorWithPayload:isCompact:layerCount:dataCodewordCount:", v22, objc_msgSend(v28, "BOOLValue"), objc_msgSend(v29, "integerValue"), objc_msgSend(v30, "integerValue"));
          }
          else if (([v17 isEqualToString:@"org.iso.PDF417"] & 1) != 0 {
                 || [v17 isEqualToString:@"org.iso.MicroPDF417"])
          }
          {
            v31 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F51200]];
            v32 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511F8]];
            v33 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511F0]];
            uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1E060], "descriptorWithPayload:isCompact:rowCount:columnCount:", v22, objc_msgSend(v31, "BOOLValue"), objc_msgSend(v33, "integerValue"), objc_msgSend(v32, "integerValue"));
          }
          else
          {
            if (![v17 isEqualToString:@"org.iso.DataMatrix"]) {
              return v18;
            }
            v35 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511D8]];
            v36 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511E8]];
            v37 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F511E0]];
            uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1E028], "descriptorWithPayload:rowCount:columnCount:eccVersion:", v22, objc_msgSend(v37, "integerValue"), objc_msgSend(v36, "integerValue"), objc_msgSend(v35, "integerValue"));
          }
          goto LABEL_29;
        }
        v23 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F51208]];
        v24 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F51210]];
        v25 = (void *)[v16 objectForKeyedSubscript:*MEMORY[0x1E4F51218]];
        unint64_t v26 = [v23 integerValue];
        if (v26 <= 3)
        {
          uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1E068], "descriptorWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v22, (int)objc_msgSend(v25, "charValue"), objc_msgSend(v24, "charValue"), qword_1A16368D0[v26]);
LABEL_29:
          [(AVMetadataMachineReadableCodeObjectInternal *)v18->_internal setDescriptor:v27];
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v18;
}

- (AVMetadataMachineReadableCodeObject)initWithAppClipCodeDictionary:(id)a3 input:(id)a4
{
  long long v24 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v29.value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v29.epoch = v7;
  v8 = (double *)MEMORY[0x1E4F1DB28];
  CFDictionaryRef v9 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51288]];
  if (v9) {
    CMTimeMakeFromDictionary(&v29, v9);
  }
  double x = *v8;
  double y = v8[1];
  double width = v8[2];
  double height = v8[3];
  CFDictionaryRef v14 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51270]];
  if (v14)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v14, &rect))
    {
      double x = rect.origin.x;
      double y = rect.origin.y;
      double width = rect.size.width;
      double height = rect.size.height;
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)AVMetadataMachineReadableCodeObject;
  rect.origin = *(CGPoint *)&v29.value;
  *(void *)&rect.size.double width = v29.epoch;
  long long v25 = v24;
  CMTimeEpoch v26 = v7;
  v15 = [(AVMetadataObject *)&v27 initWithType:@"com.apple.AppClipCode", &rect, &v25, 0, 0, a4, x, y, width, height time duration bounds optionalInfoDict originalMetadataObject sourceCaptureInput];
  if (v15)
  {
    v16 = objc_alloc_init(AVMetadataMachineReadableCodeObjectInternal);
    v15->_internal = v16;
    if (v16)
    {
      uint64_t v17 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51278]];
      if (v17) {
        [(AVMetadataMachineReadableCodeObjectInternal *)v15->_internal setCorners:v17];
      }
      v18 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v19 = *MEMORY[0x1E4F51280];
      uint64_t v20 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51280]];
      if (v20) {
        [v18 setObject:v20 forKeyedSubscript:v19];
      }
      uint64_t v21 = *MEMORY[0x1E4F51290];
      uint64_t v22 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51290]];
      if (v22) {
        [v18 setObject:v22 forKeyedSubscript:v21];
      }
      [v18 setObject:@"com.apple.AppClipCode" forKeyedSubscript:*MEMORY[0x1E4F511D0]];
      -[AVMetadataMachineReadableCodeObjectInternal setBasicDescriptor:](v15->_internal, "setBasicDescriptor:", [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v18]);
    }
    else
    {

      return 0;
    }
  }
  return v15;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend(a3, "type", a6);
  CGPoint v43 = (CGPoint)0;
  uint64_t v44 = 0;
  if (a3)
  {
    [a3 time];
    long long v41 = 0uLL;
    uint64_t v42 = 0;
    [a3 duration];
  }
  else
  {
    long long v41 = 0uLL;
    uint64_t v42 = 0;
  }
  CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v40.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v40.size = v10;
  [a3 bounds];
  long long v11 = *(_OWORD *)&a4->c;
  CGPoint point = *(CGPoint *)&a4->a;
  long long v38 = v11;
  long long v39 = *(_OWORD *)&a4->tx;
  if (!AVMetadataObjectAdjustBaseClassProperties((uint64_t)&point, &v40, v12, v13, v14, v15))
  {

    return 0;
  }
  uint64_t v16 = [a3 input];
  v36.receiver = self;
  v36.super_class = (Class)AVMetadataMachineReadableCodeObject;
  CGPoint point = v43;
  *(void *)&long long v38 = v44;
  long long v34 = v41;
  uint64_t v35 = v42;
  uint64_t v17 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v36, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, v9, &point, &v34, 0, a3, v16, *(_OWORD *)&v40.origin, *(_OWORD *)&v40.size);
  if (!v17) {
    return v17;
  }
  v18 = objc_alloc_init(AVMetadataMachineReadableCodeObjectInternal);
  v17->_internal = v18;
  if (!v18)
  {

    return 0;
  }
  uint64_t v19 = (void *)[a3 corners];
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v45 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v19);
        }
        CFDictionaryRef v25 = *(const __CFDictionary **)(*((void *)&v30 + 1) + 8 * v24);
        point.double x = 0.0;
        point.CGFloat y = 0.0;
        if (CGPointMakeWithDictionaryRepresentation(v25, &point))
        {
          CGPoint v26 = (CGPoint)vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, point.y), *(float64x2_t *)&a4->a, point.x));
          CGFloat y = v26.y;
          CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v26);
          [v20 addObject:DictionaryRepresentation];
          CFRelease(DictionaryRepresentation);
        }
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v19 countByEnumeratingWithState:&v30 objects:v45 count:16];
    }
    while (v22);
  }
  [(AVMetadataMachineReadableCodeObjectInternal *)v17->_internal setCorners:v20];
  -[AVMetadataMachineReadableCodeObjectInternal setBasicDescriptor:](v17->_internal, "setBasicDescriptor:", [*((id *)a3 + 2) basicDescriptor]);
  -[AVMetadataMachineReadableCodeObjectInternal setStringValue:](v17->_internal, "setStringValue:", [*((id *)a3 + 2) stringValue]);
  -[AVMetadataMachineReadableCodeObjectInternal setDecoded:](v17->_internal, "setDecoded:", [*((id *)a3 + 2) decoded]);
  -[AVMetadataMachineReadableCodeObjectInternal setDescriptor:](v17->_internal, "setDescriptor:", [*((id *)a3 + 2) descriptor]);
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetadataMachineReadableCodeObject;
  [(AVMetadataObject *)&v3 dealloc];
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(AVMetadataObject *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  long long v11 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:100];
  double v12 = (objc_class *)objc_opt_class();
  [v11 appendFormat:@"<%@: %p, type=\"%@\", bounds={ %.1f,%.1f %.1fx%.1f }>", NSStringFromClass(v12), self, -[AVMetadataObject type](self, "type"), v4, v6, v8, v10];
  double v13 = [(AVMetadataMachineReadableCodeObject *)self corners];
  [v11 appendString:@"corners { "];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        CFDictionaryRef v18 = *(const __CFDictionary **)(*((void *)&v23 + 1) + 8 * i);
        point.double x = 0.0;
        point.CGFloat y = 0.0;
        if (CGPointMakeWithDictionaryRepresentation(v18, &point)) {
          objc_msgSend(v11, "appendFormat:", @"%.1f,%.1f ", *(void *)&point.x, *(void *)&point.y);
        }
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }
  if (self)
  {
    [(AVMetadataObject *)self time];
    uint64_t v19 = v21;
  }
  else
  {
    uint64_t v19 = 0;
  }
  [v11 appendFormat:@"}, time %lld, stringValue \"%@\", v19, -[AVMetadataMachineReadableCodeObject stringValue](self, "stringValue"")];
  return v11;
}

- (NSArray)corners
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v3 = [(AVMetadataMachineReadableCodeObjectInternal *)self->_internal corners];

  return (NSArray *)[v2 arrayWithArray:v3];
}

- (NSString)stringValue
{
  internal = self->_internal;
  objc_sync_enter(internal);
  uint64_t v4 = [(AVMetadataMachineReadableCodeObjectInternal *)self->_internal stringValue];
  if (!v4)
  {
    if ([(AVMetadataMachineReadableCodeObjectInternal *)self->_internal decoded])
    {
      uint64_t v4 = 0;
    }
    else
    {
      if ([(AVMetadataMachineReadableCodeObjectInternal *)self->_internal basicDescriptor])
      {
        uint64_t v5 = (const void *)MRCDescriptorCreateWithAttributes();
        uint64_t v4 = (NSString *)(id)MRCDescriptorDecodePayload();
        if (v5) {
          CFRelease(v5);
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
      [(AVMetadataMachineReadableCodeObjectInternal *)self->_internal setStringValue:v4];
      [(AVMetadataMachineReadableCodeObjectInternal *)self->_internal setDecoded:1];
    }
  }
  objc_sync_exit(internal);
  return v4;
}

- (id)basicDescriptor
{
  return [(AVMetadataMachineReadableCodeObjectInternal *)self->_internal basicDescriptor];
}

- (CIBarcodeDescriptor)descriptor
{
  return [(AVMetadataMachineReadableCodeObjectInternal *)self->_internal descriptor];
}

@end