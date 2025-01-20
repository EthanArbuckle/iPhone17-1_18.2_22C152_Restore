@interface CIFaceFeature
- (BOOL)hasFaceAngle;
- (BOOL)hasLeftEyePosition;
- (BOOL)hasMouthPosition;
- (BOOL)hasRightEyePosition;
- (BOOL)hasSmile;
- (BOOL)hasTrackingFrameCount;
- (BOOL)hasTrackingID;
- (BOOL)leftEyeClosed;
- (BOOL)rightEyeClosed;
- (CGPoint)leftEyePosition;
- (CGPoint)mouthPosition;
- (CGPoint)rightEyePosition;
- (CGRect)bounds;
- (CIFaceFeature)initWithBounds:(CGRect)a3 hasLeftEyePosition:(BOOL)a4 leftEyePosition:(CGPoint)a5 hasRightEyePosition:(BOOL)a6 rightEyePosition:(CGPoint)a7 hasMouthPosition:(BOOL)a8 mouthPosition:(CGPoint)a9 hasFaceAngle:(BOOL)a10 faceAngle:(float)a11 hasTrackingID:(BOOL)a12 trackingID:(int)a13 hasTrackingFrameCount:(BOOL)a14 trackingFrameCount:(int)a15 hasSmile:(BOOL)a16 leftEyeClosed:(BOOL)a17 rightEyeClosed:(BOOL)a18 landmarks:(id)a19;
- (NSDictionary)landmarks;
- (float)faceAngle;
- (id)debugDescription;
- (id)type;
- (int)trackingFrameCount;
- (int)trackingID;
- (void)dealloc;
@end

@implementation CIFaceFeature

- (id)type
{
  return @"Face";
}

- (CIFaceFeature)initWithBounds:(CGRect)a3 hasLeftEyePosition:(BOOL)a4 leftEyePosition:(CGPoint)a5 hasRightEyePosition:(BOOL)a6 rightEyePosition:(CGPoint)a7 hasMouthPosition:(BOOL)a8 mouthPosition:(CGPoint)a9 hasFaceAngle:(BOOL)a10 faceAngle:(float)a11 hasTrackingID:(BOOL)a12 trackingID:(int)a13 hasTrackingFrameCount:(BOOL)a14 trackingFrameCount:(int)a15 hasSmile:(BOOL)a16 leftEyeClosed:(BOOL)a17 rightEyeClosed:(BOOL)a18 landmarks:(id)a19
{
  BOOL v19 = a10;
  char y_low = LOBYTE(a9.y);
  char x_low = LOBYTE(a9.x);
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  CGFloat v26 = a5.y;
  CGFloat v27 = a5.x;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat v31 = a3.origin.y;
  CGFloat v32 = a3.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)CIFaceFeature;
  v33 = [(CIFeature *)&v36 init];
  v34 = v33;
  if (v33)
  {
    v33->bounds.origin.CGFloat x = v32;
    v33->bounds.origin.CGFloat y = v31;
    v33->bounds.size.CGFloat width = width;
    v33->bounds.size.CGFloat height = height;
    v33->hasLeftEyePosition = a4;
    v33->leftEyePosition.CGFloat x = v27;
    v33->leftEyePosition.CGFloat y = v26;
    v33->hasRightEyePosition = a6;
    v33->rightEyePosition.CGFloat x = x;
    v33->rightEyePosition.CGFloat y = y;
    v33->hasMouthPosition = a8;
    v33->mouthPosition.CGFloat x = *(CGFloat *)&a11;
    v33->mouthPosition.CGFloat y = *(CGFloat *)&a13;
    v33->hasFaceAngle = x_low;
    LODWORD(v33->faceAngle) = a15;
    v33->hasTrackingID = y_low;
    v33->trackingID = v19;
    v33->hasTrackingFrameCount = a16;
    v33->trackingFrameCount = (int)a19;
    *(_WORD *)&v33->hasSmile = WORD2(a19);
    v33->rightEyeClosed = BYTE6(a19);
    v33->landmarks = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v37 copyItems:1];
  }
  return v34;
}

- (id)debugDescription
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CIFaceFeature_debugDescription__block_invoke;
  v3[3] = &unk_1E5771158;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __33__CIFaceFeature_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p ", v4, *(const void **)(a1 + 32));
  [*(id *)(a1 + 32) bounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  if (CGRectIsInfinite(v14))
  {
    v9 = "[infinite]";
    size_t v10 = 10;
LABEL_5:
    fwrite(v9, v10, 1uLL, a2);
    goto LABEL_7;
  }
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  if (CGRectIsEmpty(v15))
  {
    v9 = "[empty]";
    size_t v10 = 7;
    goto LABEL_5;
  }
  fprintf(a2, "[%g %g %g %g]", x, y, width, height);
LABEL_7:
  fwrite(">\n", 2uLL, 1uLL, a2);
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v11 + 40))
  {
    fprintf(a2, "    leftEye: (%g,%g)\n", *(double *)(v11 + 48), *(double *)(v11 + 56));
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v11 + 64))
  {
    fprintf(a2, "    leftEye: (%g,%g)\n", *(double *)(v11 + 72), *(double *)(v11 + 80));
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v11 + 88))
  {
    fprintf(a2, "    mouth: (%g,%g)\n", *(double *)(v11 + 96), *(double *)(v11 + 104));
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v11 + 128))
  {
    fprintf(a2, "    faceAngle: %g\n", *(float *)(v11 + 132));
    uint64_t v11 = *(void *)(a1 + 32);
  }
  fprintf(a2, "    hasSmile: %d\n", *(unsigned __int8 *)(v11 + 136));
  fprintf(a2, "    leftEyeClosed: %d\n", *(unsigned __int8 *)(*(void *)(a1 + 32) + 137));
  uint64_t result = fprintf(a2, "    rightEyeClosed: %d\n", *(unsigned __int8 *)(*(void *)(a1 + 32) + 138));
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v13 + 112))
  {
    uint64_t result = fprintf(a2, "    trackingID: %d\n", *(_DWORD *)(v13 + 116));
    uint64_t v13 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v13 + 120)) {
    return fprintf(a2, "    trackingFrameCount: %d\n", *(_DWORD *)(v13 + 124));
  }
  return result;
}

- (void)dealloc
{
  self->landmarks = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIFaceFeature;
  [(CIFaceFeature *)&v3 dealloc];
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)hasLeftEyePosition
{
  return self->hasLeftEyePosition;
}

- (CGPoint)leftEyePosition
{
  objc_copyStruct(v4, &self->leftEyePosition, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)hasRightEyePosition
{
  return self->hasRightEyePosition;
}

- (CGPoint)rightEyePosition
{
  objc_copyStruct(v4, &self->rightEyePosition, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)hasMouthPosition
{
  return self->hasMouthPosition;
}

- (CGPoint)mouthPosition
{
  objc_copyStruct(v4, &self->mouthPosition, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)hasTrackingID
{
  return self->hasTrackingID;
}

- (int)trackingID
{
  return self->trackingID;
}

- (BOOL)hasTrackingFrameCount
{
  return self->hasTrackingFrameCount;
}

- (int)trackingFrameCount
{
  return self->trackingFrameCount;
}

- (BOOL)hasFaceAngle
{
  return self->hasFaceAngle;
}

- (float)faceAngle
{
  return self->faceAngle;
}

- (BOOL)hasSmile
{
  return self->hasSmile;
}

- (BOOL)leftEyeClosed
{
  return self->leftEyeClosed;
}

- (BOOL)rightEyeClosed
{
  return self->rightEyeClosed;
}

- (NSDictionary)landmarks
{
  return self->landmarks;
}

@end