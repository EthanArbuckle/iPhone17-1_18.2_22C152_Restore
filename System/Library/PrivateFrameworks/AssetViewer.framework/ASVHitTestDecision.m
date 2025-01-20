@interface ASVHitTestDecision
- (ASVHitTestDecision)initWithOriginalResult:(id)a3 interpolatedResult:(id)a4 finalResult:(id)a5;
- (ASVHitTestResult)finalResult;
- (ASVHitTestResult)interpolatedOrFinalResult;
- (ASVHitTestResult)interpolatedResult;
- (ASVRealHitTestResult)originalResult;
- (void)setFinalResult:(id)a3;
- (void)setInterpolatedOrFinalResult:(id)a3;
- (void)setInterpolatedResult:(id)a3;
- (void)setOriginalResult:(id)a3;
@end

@implementation ASVHitTestDecision

- (ASVHitTestDecision)initWithOriginalResult:(id)a3 interpolatedResult:(id)a4 finalResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASVHitTestDecision;
  v12 = [(ASVHitTestDecision *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_originalResult, a3);
    objc_storeStrong((id *)&v13->_interpolatedResult, a4);
    objc_storeStrong((id *)&v13->_finalResult, a5);
  }

  return v13;
}

- (ASVHitTestResult)interpolatedOrFinalResult
{
  interpolatedResult = self->_interpolatedResult;
  if (!interpolatedResult) {
    interpolatedResult = self->_finalResult;
  }
  v3 = interpolatedResult;
  return v3;
}

- (ASVRealHitTestResult)originalResult
{
  return self->_originalResult;
}

- (void)setOriginalResult:(id)a3
{
}

- (ASVHitTestResult)interpolatedResult
{
  return self->_interpolatedResult;
}

- (void)setInterpolatedResult:(id)a3
{
}

- (ASVHitTestResult)finalResult
{
  return self->_finalResult;
}

- (void)setFinalResult:(id)a3
{
}

- (void)setInterpolatedOrFinalResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatedOrFinalResult, 0);
  objc_storeStrong((id *)&self->_finalResult, 0);
  objc_storeStrong((id *)&self->_interpolatedResult, 0);
  objc_storeStrong((id *)&self->_originalResult, 0);
}

@end