@interface MUPDFUtilities
+ (CGAffineTransform)flattenRotationTransformForPage:(SEL)a3 outMediaBox:(CGPDFPage *)a4 outCropBox:(CGRect *)a5;
+ (id)createDictionaryFromPDFDictionary:(CGPDFDictionary *)a3;
+ (id)createPDFDateString:(id)a3;
+ (int64_t)exifOrientationOfPage:(CGPDFPage *)a3;
+ (unint64_t)indexOfDictionary:(CGPDFDictionary *)a3 inArray:(CGPDFArray *)a4;
+ (unint64_t)normalizedRotationAngleOfPage:(CGPDFPage *)a3;
@end

@implementation MUPDFUtilities

+ (id)createPDFDateString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"yyyyMMddHHmm"];
  v6 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  [v5 setCalendar:v6];

  v7 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
  [v5 setTimeZone:v7];

  v8 = [v5 stringFromDate:v4];

  v9 = [NSString stringWithFormat:@"D:%@Z00'00'", v8];

  return v9;
}

+ (id)createDictionaryFromPDFDictionary:(CGPDFDictionary *)a3
{
  CFSetCallBacks v6 = *(CFSetCallBacks *)byte_26E180E78;
  seenObjects = (uint64_t)CFSetCreateMutable(0, 0, &v6);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  CGPDFDictionaryApplyFunction(a3, (CGPDFDictionaryApplierFunction)_dictionaryApplierFunction, v4);
  CFRelease((CFTypeRef)seenObjects);
  return v4;
}

+ (unint64_t)indexOfDictionary:(CGPDFDictionary *)a3 inArray:(CGPDFArray *)a4
{
  size_t Count = CGPDFArrayGetCount(a4);
  if (!Count) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  size_t v7 = Count;
  size_t v8 = 0;
  while (1)
  {
    CGPDFDictionaryRef value = 0;
    if (CGPDFArrayGetDictionary(a4, v8, &value) && value == a3) {
      break;
    }
    if (v7 == ++v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8;
}

+ (unint64_t)normalizedRotationAngleOfPage:(CGPDFPage *)a3
{
  int v3 = CGPDFPageGetRotationAngle(a3) % 360;
  if (v3 >= 0) {
    return v3;
  }
  else {
    return v3 + 360;
  }
}

+ (int64_t)exifOrientationOfPage:(CGPDFPage *)a3
{
  uint64_t v3 = [a1 normalizedRotationAngleOfPage:a3];
  int64_t v4 = 1;
  if (v3 == 90) {
    int64_t v4 = 6;
  }
  if (v3 == 180) {
    int64_t v4 = 3;
  }
  if (v3 == 270) {
    return 8;
  }
  else {
    return v4;
  }
}

+ (CGAffineTransform)flattenRotationTransformForPage:(SEL)a3 outMediaBox:(CGPDFPage *)a4 outCropBox:(CGRect *)a5
{
  int RotationAngle = CGPDFPageGetRotationAngle(a4);
  CGRect BoxRect = CGPDFPageGetBoxRect(a4, kCGPDFMediaBox);
  double x = BoxRect.origin.x;
  double y = BoxRect.origin.y;
  CGFloat width = BoxRect.size.width;
  CGFloat height = BoxRect.size.height;
  CGRect v31 = CGPDFPageGetBoxRect(a4, kCGPDFCropBox);
  CGFloat v15 = v31.size.width;
  CGFloat v16 = v31.size.height;
  double v17 = v31.origin.x - x;
  unsigned int v18 = RotationAngle
      + 360
      * (((RotationAngle & ~(RotationAngle >> 31)) - (RotationAngle + (RotationAngle >> 31))) / 0x168
       + (RotationAngle >> 31));
  unsigned int v19 = v18 - 360;
  if (v18 < 0x168) {
    unsigned int v19 = 0;
  }
  double v20 = v31.origin.y - y;
  uint64_t v21 = v18 - 360 * ((v19 + 359) / 0x168);
  if ((int)v21 > 179)
  {
    if (v21 == 180)
    {
      v36.origin.double x = 0.0;
      v36.origin.double y = 0.0;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      double v26 = CGRectGetWidth(v36);
      v37.origin.double x = v17;
      v37.origin.double y = v20;
      v37.size.CGFloat width = v15;
      v37.size.CGFloat height = v16;
      double v23 = v26 - (v17 + CGRectGetWidth(v37));
      v38.origin.double x = 0.0;
      v38.origin.double y = 0.0;
      v38.size.CGFloat width = width;
      v38.size.CGFloat height = height;
      double v27 = CGRectGetHeight(v38);
      v39.origin.double x = v23;
      v39.origin.double y = v20;
      v39.size.CGFloat width = v15;
      v39.size.CGFloat height = v16;
      double v20 = v27 - (v20 + CGRectGetHeight(v39));
      CGFloat v22 = height;
      goto LABEL_14;
    }
    if (v21 == 270)
    {
      v34.origin.double x = 0.0;
      v34.origin.double y = 0.0;
      v34.size.CGFloat width = height;
      v34.size.CGFloat height = width;
      double v24 = CGRectGetWidth(v34);
      v35.origin.double x = v17;
      v35.origin.double y = v20;
      v35.size.CGFloat width = v16;
      v35.size.CGFloat height = v15;
      CGFloat v22 = width;
      double v23 = v24 - (v20 + CGRectGetWidth(v35));
      double v20 = v17;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v21)
  {
    if (v21 == 90)
    {
      v32.origin.double x = 0.0;
      v32.origin.double y = 0.0;
      v32.size.CGFloat width = height;
      v32.size.CGFloat height = width;
      double v29 = CGRectGetHeight(v32);
      v33.origin.double x = v20;
      v33.origin.double y = v20;
      v33.size.CGFloat width = v16;
      v33.size.CGFloat height = v15;
      CGFloat v22 = width;
      double v23 = v20;
      double v20 = v29 - (v17 + CGRectGetHeight(v33));
LABEL_10:
      CGFloat v25 = v16;
      CGFloat v16 = v15;
      CGFloat width = height;
      goto LABEL_15;
    }
LABEL_11:
    NSLog(&cfstr_SUnexpectedPag.isa, "+[MUPDFUtilities flattenRotationTransformForPage:outMediaBox:outCropBox:]", v21);
  }
  CGFloat v22 = height;
  double v23 = v17;
LABEL_14:
  CGFloat v25 = v15;
LABEL_15:
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v40.origin.double x = v23;
  v40.origin.double y = v20;
  v40.size.CGFloat width = v25;
  v40.size.CGFloat height = v16;
  result = CGPDFPageGetDrawingTransform(retstr, a4, kCGPDFCropBox, v40, 0, 1);
  if (a5)
  {
    a5->origin.double x = 0.0;
    a5->origin.double y = 0.0;
    a5->size.CGFloat width = width;
    a5->size.CGFloat height = v22;
  }
  if (a6)
  {
    a6->origin.double x = v23;
    a6->origin.double y = v20;
    a6->size.CGFloat width = v25;
    a6->size.CGFloat height = v16;
  }
  return result;
}

@end