@interface VCPVideoKeyFrameResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp;
- (VCPVideoKeyFrameResult)initWithTime:(id *)a3 andScore:(float)a4;
- (float)score;
@end

@implementation VCPVideoKeyFrameResult

- (VCPVideoKeyFrameResult)initWithTime:(id *)a3 andScore:(float)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VCPVideoKeyFrameResult;
  result = [(VCPVideoKeyFrameResult *)&v8 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->var0;
    *(void *)&result->_timeStamp.flags = a3->var3;
    *(_OWORD *)(&result->_score + 1) = v7;
    result->_score = a4;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeStamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (float)score
{
  return self->_score;
}

@end