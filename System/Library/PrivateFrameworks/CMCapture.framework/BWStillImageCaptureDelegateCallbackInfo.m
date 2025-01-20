@interface BWStillImageCaptureDelegateCallbackInfo
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts;
- (BOOL)isPreBracketFrame;
- (BWStillImageCaptureDelegateCallbackInfo)initWithFlag:(unsigned int)a3;
- (BWStillImageCaptureDelegateCallbackInfo)initWithFlag:(unsigned int)a3 pts:(id *)a4 isPreBracketFrame:(BOOL)a5;
- (unsigned)flag;
@end

@implementation BWStillImageCaptureDelegateCallbackInfo

- (BWStillImageCaptureDelegateCallbackInfo)initWithFlag:(unsigned int)a3 pts:(id *)a4 isPreBracketFrame:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWStillImageCaptureDelegateCallbackInfo;
  result = [(BWStillImageCaptureDelegateCallbackInfo *)&v10 init];
  if (result)
  {
    result->_flag = a3;
    long long v9 = *(_OWORD *)&a4->var0;
    *(void *)&result->_pts.flags = a4->var3;
    *(_OWORD *)(&result->_flag + 1) = v9;
    BYTE4(result->_pts.epoch) = a5;
    if ((a3 & (a3 - 1)) != 0) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"BWStillImageCaptureDelegateCallbackInfo can only be instantiated with one flag set" userInfo:0]);
    }
  }
  return result;
}

- (BWStillImageCaptureDelegateCallbackInfo)initWithFlag:(unsigned int)a3
{
  long long v4 = *MEMORY[0x1E4F1F9F8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [(BWStillImageCaptureDelegateCallbackInfo *)self initWithFlag:*(void *)&a3 pts:&v4 isPreBracketFrame:0];
}

- (unsigned)flag
{
  return self->_flag;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2;
  retstr->var3 = *(int64_t *)((char *)&self[1].var0 + 4);
  return self;
}

- (BOOL)isPreBracketFrame
{
  return BYTE4(self->_pts.epoch);
}

@end