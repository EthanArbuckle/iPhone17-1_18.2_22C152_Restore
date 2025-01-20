@interface AVCaptureSystemPressureState
+ (void)initialize;
- (AVCaptureSystemPressureFactors)factors;
- (AVCaptureSystemPressureLevel)level;
- (AVCaptureSystemPressureState)init;
- (AVCaptureSystemPressureState)initWithFigLevel:(int)a3 factors:(unint64_t)a4 recommendedFrameRateRangeForPortrait:(id)a5;
- (BOOL)isEqual:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)recommendedFrameRateRangeForPortrait;
- (id)spiDebugDescription;
- (int)figLevel;
- (void)dealloc;
@end

@implementation AVCaptureSystemPressureState

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      int v5 = objc_msgSend((id)objc_msgSend(a3, "level"), "isEqual:", -[AVCaptureSystemPressureState level](self, "level"));
      if (v5)
      {
        uint64_t v6 = [a3 factors];
        if (v6 == [(AVCaptureSystemPressureState *)self factors])
        {
          v7 = (void *)[a3 recommendedFrameRateRangeForPortrait];
          if (v7 == -[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait")|| (int v5 = objc_msgSend((id)objc_msgSend(a3, "recommendedFrameRateRangeForPortrait"), "isEqual:", -[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait"))) != 0)
          {
            LOBYTE(v5) = 1;
          }
        }
        else
        {
          LOBYTE(v5) = 0;
        }
      }
    }
  }
  return v5;
}

- (id)recommendedFrameRateRangeForPortrait
{
  return [(AVCaptureSystemPressureStateInternal *)self->_internal recommendedFrameRateRangeForPortrait];
}

- (AVCaptureSystemPressureFactors)factors
{
  return [(AVCaptureSystemPressureStateInternal *)self->_internal factors];
}

- (AVCaptureSystemPressureLevel)level
{
  unsigned int v2 = [(AVCaptureSystemPressureStateInternal *)self->_internal figLevel] - 1;
  if (v2 > 3) {
    return (AVCaptureSystemPressureLevel)@"AVCaptureSystemPressureLevelNominal";
  }
  else {
    return &off_1E5A73008[v2]->isa;
  }
}

- (int)figLevel
{
  return [(AVCaptureSystemPressureStateInternal *)self->_internal figLevel];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureSystemPressureState;
  [(AVCaptureSystemPressureState *)&v3 dealloc];
}

- (AVCaptureSystemPressureState)initWithFigLevel:(int)a3 factors:(unint64_t)a4 recommendedFrameRateRangeForPortrait:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)AVCaptureSystemPressureState;
  v8 = [(AVCaptureSystemPressureState *)&v11 init];
  if (v8)
  {
    v9 = [[AVCaptureSystemPressureStateInternal alloc] initWithFigLevel:v7 factors:a4 recommendedFrameRateRangeForPortrait:a5];
    v8->_internal = v9;
    if (!v9)
    {

      return 0;
    }
  }
  return v8;
}

+ (void)initialize
{
}

- (AVCaptureSystemPressureState)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureSystemPressureState;
  unsigned int v2 = [(AVCaptureSystemPressureState *)&v5 init];
  if (v2)
  {
    objc_super v3 = v2;
    NSLog(&cfstr_Avcapturesyste_5.isa);
  }
  return 0;
}

- (id)debugDescription
{
  if ([(NSString *)[(AVCaptureSystemPressureState *)self level] isEqual:@"AVCaptureSystemPressureLevelNominal"])
  {
    objc_super v3 = @"Nominal";
  }
  else if ([(NSString *)[(AVCaptureSystemPressureState *)self level] isEqual:@"AVCaptureSystemPressureLevelFair"])
  {
    objc_super v3 = @"Fair";
  }
  else if ([(NSString *)[(AVCaptureSystemPressureState *)self level] isEqual:@"AVCaptureSystemPressureLevelSerious"])
  {
    objc_super v3 = @"Serious";
  }
  else if ([(NSString *)[(AVCaptureSystemPressureState *)self level] isEqual:@"AVCaptureSystemPressureLevelCritical"])
  {
    objc_super v3 = @"Critical";
  }
  else if ([(NSString *)[(AVCaptureSystemPressureState *)self level] isEqual:@"AVCaptureSystemPressureLevelShutdown"])
  {
    objc_super v3 = @"Shutdown";
  }
  else
  {
    objc_super v3 = 0;
  }
  if ([(AVCaptureSystemPressureState *)self factors])
  {
    v4 = (void *)[MEMORY[0x1E4F28E78] string];
    if ([(AVCaptureSystemPressureState *)self factors]) {
      [v4 appendString:@"System Temp, "];
    }
    if (([(AVCaptureSystemPressureState *)self factors] & 4) != 0) {
      [v4 appendString:@"Depth Module Temp, "];
    }
    if (([(AVCaptureSystemPressureState *)self factors] & 2) != 0) {
      [v4 appendString:@"Peak Power, "];
    }
    if (([(AVCaptureSystemPressureState *)self factors] & 8) != 0) {
      [v4 appendString:@"Camera Temp, "];
    }
    objc_super v5 = (__CFString *)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 2);
  }
  else
  {
    objc_super v5 = @"None";
  }
  return (id)[NSString stringWithFormat:@"Level:%@ Factors:%@", v3, v5];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureSystemPressureState debugDescription](self, "debugDescription")];
}

- (id)spiDebugDescription
{
  objc_super v3 = NSString;
  id v4 = [(AVCaptureSystemPressureState *)self debugDescription];
  objc_msgSend(-[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait"), "minFrameRate");
  uint64_t v6 = v5;
  objc_msgSend(-[AVCaptureSystemPressureState recommendedFrameRateRangeForPortrait](self, "recommendedFrameRateRangeForPortrait"), "maxFrameRate");
  return (id)[v3 stringWithFormat:@"%@ Recommended:%.0f-%.0f", v4, v6, v7];
}

@end