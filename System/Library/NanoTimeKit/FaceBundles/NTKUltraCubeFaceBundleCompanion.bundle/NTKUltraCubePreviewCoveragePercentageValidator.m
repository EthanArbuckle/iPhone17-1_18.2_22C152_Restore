@interface NTKUltraCubePreviewCoveragePercentageValidator
- (NTKUltraCubePreviewCoveragePercentageValidator)initWithMaskImage:(CGImage *)a3 orientation:(unsigned int)a4;
- (double)coverageOfTimeLabel:(CGRect)a3;
- (void)dealloc;
- (void)validateTimeLabel:(CGRect)a3 completion:(id)a4;
@end

@implementation NTKUltraCubePreviewCoveragePercentageValidator

- (NTKUltraCubePreviewCoveragePercentageValidator)initWithMaskImage:(CGImage *)a3 orientation:(unsigned int)a4
{
  v16.receiver = self;
  v16.super_class = (Class)NTKUltraCubePreviewCoveragePercentageValidator;
  v5 = [(NTKUltraCubePreviewCoveragePercentageValidator *)&v16 init];
  if (v5)
  {
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    NTKCGImagePropertyOrientationToUIImageOrientation();
    NTKImagePresentationTransform();
    memset(&buf, 0, sizeof(buf));
    NTKImagePresentationSize();
    uint64_t v8 = (uint64_t)rint(v7 * 0.25);
    uint64_t v10 = (uint64_t)rint(v9 * 0.25);
    v5->_width = v8;
    v5->_height = v10;
    v11 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.a) = 134218240;
      *(void *)((char *)&buf.a + 4) = v8;
      WORD2(buf.b) = 2048;
      *(void *)((char *)&buf.b + 6) = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "createScaledInputData: scale input data to == %ldx%ld", (uint8_t *)&buf, 0x16u);
    }

    v12 = +[NSMutableData dataWithLength:(v10 + 1) * (v8 + 1)];
    v13 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
    v14 = sub_1B7C8(v8 + 1, v10 + 1, v13, 0, v12);
    CGColorSpaceRelease(v13);
    memset(&buf, 0, sizeof(buf));
    memset(&v18, 0, sizeof(v18));
    sub_1B6B0(a3, &v18, (uint64_t)&buf);
    CGAffineTransform transform = buf;
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformInvert(&v18, &transform);
    CGAffineTransform transform = buf;
    CGContextConcatCTM(v14, &transform);
    CGAffineTransform transform = v18;
    v20.origin.x = 1.0;
    v20.origin.y = 0.0;
    v20.size.width = (double)(unint64_t)v8;
    v20.size.height = (double)(unint64_t)v10;
    CGRect v21 = CGRectApplyAffineTransform(v20, &transform);
    CGContextDrawImage(v14, v21, a3);
    CGContextRelease(v14);
    v5->_cumulativeData = (unsigned int *)createCumulativeData(v12, v5->_width, v5->_height);
  }
  return v5;
}

- (void)dealloc
{
  cumulativeData = self->_cumulativeData;
  if (cumulativeData) {
    free(cumulativeData);
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKUltraCubePreviewCoveragePercentageValidator;
  [(NTKUltraCubePreviewCoveragePercentageValidator *)&v4 dealloc];
}

- (double)coverageOfTimeLabel:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v8 = self->_width;
  double v9 = (double)v8;
  double v10 = (double)self->_height;
  CGAffineTransformMakeScale(&v17, (double)v8, v10);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = CGRectApplyAffineTransform(v18, &v17);
  if (v19.origin.x < 0.0) {
    v19.origin.CGFloat x = 0.0;
  }
  if (v19.origin.y < 0.0) {
    v19.origin.CGFloat y = 0.0;
  }
  if (v19.size.width > v9 - v19.origin.x) {
    v19.size.CGFloat width = v9 - v19.origin.x;
  }
  uint64_t v11 = (uint64_t)rint(v19.origin.x + 1.0);
  if (v19.size.height > v10 - v19.origin.y) {
    v19.size.CGFloat height = v10 - v19.origin.y;
  }
  uint64_t v12 = (uint64_t)rint(v19.origin.x + v19.size.width + -1.0 + 1.0);
  uint64_t v13 = (uint64_t)rint(v19.origin.y + 1.0);
  double v14 = rint(v19.origin.y + v19.size.height + -1.0 + 1.0);
  cumulativeData = self->_cumulativeData;
  return (double)(cumulativeData[(uint64_t)v14 * (v8 + 1) + v12]
                - (cumulativeData[(uint64_t)v14 * (v8 + 1) - 1 + v11]
                 + cumulativeData[v12 + (v13 - 1) * (v8 + 1)])
                + cumulativeData[(v13 - 1) * (v8 + 1) - 1 + v11])
       / (v19.size.width
        * v19.size.height
        * 255.0);
}

- (void)validateTimeLabel:(CGRect)a3 completion:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = (void (**)(id, BOOL))a4;
  -[NTKUltraCubePreviewCoveragePercentageValidator coverageOfTimeLabel:](self, "coverageOfTimeLabel:", x, y, width, height);
  v10[2](v10, v9 <= 0.2);
}

@end