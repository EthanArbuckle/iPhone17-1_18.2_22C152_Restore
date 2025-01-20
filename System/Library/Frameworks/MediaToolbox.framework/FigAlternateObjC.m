@interface FigAlternateObjC
+ (id)dummy;
- (FigAlternateObjC)initWithFigAlternate:(OpaqueFigAlternate *)a3;
- (FigAlternateObjCAudioAttributes)audioAttributes;
- (FigAlternateObjCVideoAttributes)videoAttributes;
- (OpaqueFigAlternate)figAlternate;
- (double)averageBitRate;
- (double)peakBitRate;
- (void)dealloc;
@end

@implementation FigAlternateObjC

- (FigAlternateObjC)initWithFigAlternate:(OpaqueFigAlternate *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FigAlternateObjC;
  v4 = [(FigAlternateObjC *)&v10 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueFigAlternate *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_alternate = v5;
    int IsPeakBitRateDeclared = FigAlternateIsPeakBitRateDeclared((uint64_t)a3);
    double AverageBitRate = -1.0;
    double DeclaredPeakBitRate = -1.0;
    if (IsPeakBitRateDeclared) {
      double DeclaredPeakBitRate = (double)(int)FigAlternateGetDeclaredPeakBitRate((uint64_t)a3);
    }
    v4->_peakBitRate = DeclaredPeakBitRate;
    if (FigAlternateIsAverageBitRateDeclared((BOOL)a3)) {
      double AverageBitRate = (double)(int)FigAlternateGetAverageBitRate((uint64_t)a3);
    }
    v4->_averageBitRate = AverageBitRate;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

- (FigAlternateObjCVideoAttributes)videoAttributes
{
  MEMORY[0x19970E910](self->_mutex, a2);
  if (!self->_videoAttributes && FigAlternateHasVideo((uint64_t)self->_alternate)) {
    self->_videoAttributes = [[FigAlternateObjCVideoAttributes alloc] initWithFigAlternate:self->_alternate];
  }
  MEMORY[0x19970E930](self->_mutex);
  v3 = self->_videoAttributes;

  return v3;
}

- (FigAlternateObjCAudioAttributes)audioAttributes
{
  MEMORY[0x19970E910](self->_mutex, a2);
  if (!self->_audioAttributes && FigAlternateHasAudio(self->_alternate)) {
    self->_audioAttributes = [[FigAlternateObjCAudioAttributes alloc] initWithFigAlternate:self->_alternate];
  }
  MEMORY[0x19970E930](self->_mutex);
  v3 = self->_audioAttributes;

  return v3;
}

- (void)dealloc
{
  alternate = self->_alternate;
  if (alternate) {
    CFRelease(alternate);
  }

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjC;
  [(FigAlternateObjC *)&v4 dealloc];
}

- (double)peakBitRate
{
  return self->_peakBitRate;
}

- (double)averageBitRate
{
  return self->_averageBitRate;
}

- (OpaqueFigAlternate)figAlternate
{
  return self->_alternate;
}

+ (id)dummy
{
  v2 = objc_alloc_init(FigAlternateObjCDummy);

  return v2;
}

@end