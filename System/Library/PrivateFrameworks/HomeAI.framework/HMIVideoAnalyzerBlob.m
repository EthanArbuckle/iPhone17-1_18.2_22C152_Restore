@interface HMIVideoAnalyzerBlob
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp;
- (CGRect)boundingBox;
- (HMIVideoAnalyzerBlob)initWithBoundingBox:(CGRect)a3 timeStamp:(id *)a4 blobArea:(float)a5 blobID:(unsigned __int16)a6;
- (float)blobArea;
- (unsigned)blobID;
@end

@implementation HMIVideoAnalyzerBlob

- (HMIVideoAnalyzerBlob)initWithBoundingBox:(CGRect)a3 timeStamp:(id *)a4 blobArea:(float)a5 blobID:(unsigned __int16)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)HMIVideoAnalyzerBlob;
  result = [(HMIVideoAnalyzerBlob *)&v15 init];
  if (result)
  {
    result->_boundingBox.origin.CGFloat x = x;
    result->_boundingBox.origin.CGFloat y = y;
    result->_boundingBox.size.CGFloat width = width;
    result->_boundingBox.size.CGFloat height = height;
    long long v14 = *(_OWORD *)&a4->var0;
    result->_timeStamp.epoch = a4->var3;
    *(_OWORD *)&result->_timeStamp.value = v14;
    result->_blobArea = a5;
    result->_blobID = a6;
  }
  return result;
}

- (CGRect)boundingBox
{
  objc_copyStruct(v6, &self->_boundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (float)blobArea
{
  return self->_blobArea;
}

- (unsigned)blobID
{
  return self->_blobID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp
{
  objc_copyStruct(retstr, &self->_timeStamp, 24, 1, 0);
  return result;
}

@end