@interface _DPHistogramWithAggregatorDiscreteGaussian
- (_DPHistogramWithAggregatorDiscreteGaussian)initWithSigma:(double)a3 rappor:(id)a4 error:(id *)a5;
- (_DPSymmetricRAPPORWithOHE)rappor;
- (double)sigma;
- (double)squaredL2Sensitivity;
- (id)exceedApproximateDPBudget:(id)a3 error:(id *)a4;
- (id)zeroConcentratedDPWithError:(id *)a3;
@end

@implementation _DPHistogramWithAggregatorDiscreteGaussian

- (_DPHistogramWithAggregatorDiscreteGaussian)initWithSigma:(double)a3 rappor:(id)a4 error:(id *)a5
{
  id v9 = a4;
  BOOL v10 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v11 = ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (a3 >= 0.0)
  {
    BOOL v11 = 0;
    BOOL v10 = 0;
  }
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
    BOOL v10 = 1;
  }
  int v12 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v10;
  if ((v12 | v11) == 1)
  {
    v13 = _DPPrivacyBudgetError(1, @"Gaussian sigma must be finite, not NAN, and greater than 0.0.");
    v14 = +[_DPLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_DPSemanticVersion initWithString:error:]((uint64_t)v13, v14);
    }

    if (a5) {
      *a5 = v13;
    }

    v15 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_DPHistogramWithAggregatorDiscreteGaussian;
    v16 = [(_DPHistogramWithAggregatorDiscreteGaussian *)&v19 init];
    v17 = v16;
    if (v16)
    {
      v16->_sigma = a3;
      objc_storeStrong((id *)&v16->_rappor, a4);
      v17->_squaredL2Sensitivity = 2.0;
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

- (id)exceedApproximateDPBudget:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(_DPHistogramWithAggregatorDiscreteGaussian *)self zeroConcentratedDPWithError:a4];
  if (v7)
  {
    [v6 epsilon];
    v8 = objc_msgSend(v7, "approximateDPForEpsilon:error:", a4);
    id v9 = v8;
    if (v8)
    {
      BOOL v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "exceed:", v6));
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)zeroConcentratedDPWithError:(id *)a3
{
  [(_DPHistogramWithAggregatorDiscreteGaussian *)self squaredL2Sensitivity];
  double v6 = v5;
  [(_DPHistogramWithAggregatorDiscreteGaussian *)self sigma];
  double v8 = v6 / v7;
  [(_DPHistogramWithAggregatorDiscreteGaussian *)self sigma];
  BOOL v10 = [[_DPZeroConcentratedDP alloc] initWithRho:a3 error:v8 / v9 * 0.5];
  return v10;
}

- (double)sigma
{
  return self->_sigma;
}

- (_DPSymmetricRAPPORWithOHE)rappor
{
  return self->_rappor;
}

- (double)squaredL2Sensitivity
{
  return self->_squaredL2Sensitivity;
}

- (void).cxx_destruct
{
}

@end