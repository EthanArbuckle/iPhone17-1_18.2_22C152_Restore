@interface ADAdaptiveCorrectionPipelineParameters
- (BOOL)runAnalyticalPreconditioning;
- (double)epErrorLimitWidePix_FirstPass;
- (double)epErrorLimitWidePix_SecondPass;
- (double)errorVal_BetweenIntermediate_ExtremeMacro;
- (double)errorVal_GreaterThanInf;
- (double)errorVal_LessThanExtremeMacro;
- (double)extremeMacroDistMM;
- (double)intermediateMacroDistMM;
- (double)rangeOCxT;
- (double)rangeOCxW;
- (double)rangeOCyW;
- (double)rangePFL_T;
- (double)rangePFL_W;
- (double)spgEpsilon;
- (float)temporalFilteringStrength;
- (int)minPointsForAdjustment;
- (void)setEpErrorLimitWidePix_FirstPass:(double)a3;
- (void)setEpErrorLimitWidePix_SecondPass:(double)a3;
- (void)setErrorVal_BetweenIntermediate_ExtremeMacro:(double)a3;
- (void)setErrorVal_GreaterThanInf:(double)a3;
- (void)setErrorVal_LessThanExtremeMacro:(double)a3;
- (void)setExtremeMacroDistMM:(double)a3;
- (void)setIntermediateMacroDistMM:(double)a3;
- (void)setMinPointsForAdjustment:(int)a3;
- (void)setRangeOCxT:(double)a3;
- (void)setRangeOCxW:(double)a3;
- (void)setRangeOCyW:(double)a3;
- (void)setRangePFL_T:(double)a3;
- (void)setRangePFL_W:(double)a3;
- (void)setRunAnalyticalPreconditioning:(BOOL)a3;
- (void)setSpgEpsilon:(double)a3;
- (void)setTemporalFilteringStrength:(float)a3;
@end

@implementation ADAdaptiveCorrectionPipelineParameters

- (void)setTemporalFilteringStrength:(float)a3
{
  self->_temporalFilteringStrength = a3;
}

- (float)temporalFilteringStrength
{
  return self->_temporalFilteringStrength;
}

- (void)setSpgEpsilon:(double)a3
{
  self->_spgEpsilon = a3;
}

- (double)spgEpsilon
{
  return self->_spgEpsilon;
}

- (void)setRunAnalyticalPreconditioning:(BOOL)a3
{
  self->_runAnalyticalPreconditioning = a3;
}

- (BOOL)runAnalyticalPreconditioning
{
  return self->_runAnalyticalPreconditioning;
}

- (void)setErrorVal_BetweenIntermediate_ExtremeMacro:(double)a3
{
  self->_errorVal_BetweenIntermediate_ExtremeMacro = a3;
}

- (double)errorVal_BetweenIntermediate_ExtremeMacro
{
  return self->_errorVal_BetweenIntermediate_ExtremeMacro;
}

- (void)setErrorVal_LessThanExtremeMacro:(double)a3
{
  self->_errorVal_LessThanExtremeMacro = a3;
}

- (double)errorVal_LessThanExtremeMacro
{
  return self->_errorVal_LessThanExtremeMacro;
}

- (void)setErrorVal_GreaterThanInf:(double)a3
{
  self->_errorVal_GreaterThanInf = a3;
}

- (double)errorVal_GreaterThanInf
{
  return self->_errorVal_GreaterThanInf;
}

- (void)setMinPointsForAdjustment:(int)a3
{
  self->_minPointsForAdjustment = a3;
}

- (int)minPointsForAdjustment
{
  return self->_minPointsForAdjustment;
}

- (void)setExtremeMacroDistMM:(double)a3
{
  self->_extremeMacroDistMM = a3;
}

- (double)extremeMacroDistMM
{
  return self->_extremeMacroDistMM;
}

- (void)setIntermediateMacroDistMM:(double)a3
{
  self->_intermediateMacroDistMM = a3;
}

- (double)intermediateMacroDistMM
{
  return self->_intermediateMacroDistMM;
}

- (void)setRangeOCyW:(double)a3
{
  self->_rangeOCyW = a3;
}

- (double)rangeOCyW
{
  return self->_rangeOCyW;
}

- (void)setRangeOCxW:(double)a3
{
  self->_rangeOCxW = a3;
}

- (double)rangeOCxW
{
  return self->_rangeOCxW;
}

- (void)setRangeOCxT:(double)a3
{
  self->_rangeOCxT = a3;
}

- (double)rangeOCxT
{
  return self->_rangeOCxT;
}

- (void)setRangePFL_W:(double)a3
{
  self->_rangePFL_W = a3;
}

- (double)rangePFL_W
{
  return self->_rangePFL_W;
}

- (void)setRangePFL_T:(double)a3
{
  self->_rangePFL_T = a3;
}

- (double)rangePFL_T
{
  return self->_rangePFL_T;
}

- (void)setEpErrorLimitWidePix_SecondPass:(double)a3
{
  self->_epErrorLimitWidePix_SecondPass = a3;
}

- (double)epErrorLimitWidePix_SecondPass
{
  return self->_epErrorLimitWidePix_SecondPass;
}

- (void)setEpErrorLimitWidePix_FirstPass:(double)a3
{
  self->_epErrorLimitWidePix_FirstPass = a3;
}

- (double)epErrorLimitWidePix_FirstPass
{
  return self->_epErrorLimitWidePix_FirstPass;
}

@end