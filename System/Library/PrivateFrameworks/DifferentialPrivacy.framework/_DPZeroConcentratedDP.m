@interface _DPZeroConcentratedDP
- (_DPZeroConcentratedDP)initWithRho:(double)a3 error:(id *)a4;
- (double)rho;
- (id)approximateDPForEpsilon:(double)a3 error:(id *)a4;
@end

@implementation _DPZeroConcentratedDP

- (_DPZeroConcentratedDP)initWithRho:(double)a3 error:(id *)a4
{
  v5 = self;
  BOOL v7 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v8 = a3 < 0.0 && ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (a3 >= 0.0) {
    BOOL v7 = 0;
  }
  int v9 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v7;
  if ((v9 | v8) == 1)
  {
    v10 = _DPPrivacyBudgetError(1, @"Zero Concentrated-DP rho must be finite, and not NAN, and at least 0.");
    v11 = +[_DPLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_DPSemanticVersion initWithString:error:]((uint64_t)v10, v11);
    }

    if (a4) {
      *a4 = v10;
    }

    v12 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_DPZeroConcentratedDP;
    v13 = [(_DPZeroConcentratedDP *)&v15 init];
    if (v13) {
      v13->_rho = a3;
    }
    v5 = v13;
    v12 = v5;
  }

  return v12;
}

- (id)approximateDPForEpsilon:(double)a3 error:(id *)a4
{
  if (+[_DPApproximateDP isValidEpsilon:error:](_DPApproximateDP, "isValidEpsilon:error:"))
  {
    [(_DPZeroConcentratedDP *)self rho];
    double v7 = 0.0;
    if (v8 != 0.0)
    {
      [(_DPZeroConcentratedDP *)self rho];
      double v10 = (a3 + 1.0) / (v9 + v9) + 2.0;
      double v22 = a3;
      double v11 = -a3;
      double v12 = 1.01;
      uint64_t v13 = 1000;
      do
      {
        double v14 = v12 + (v10 - v12) * 0.5;
        [(_DPZeroConcentratedDP *)self rho];
        double v16 = v11 + (v14 * 2.0 + -1.0) * v15;
        double v17 = log1p(-1.0 / v14);
        if (v16 + v17 >= 0.0) {
          double v10 = v12 + (v10 - v12) * 0.5;
        }
        else {
          double v12 = v12 + (v10 - v12) * 0.5;
        }
        --v13;
      }
      while (v13);
      [(_DPZeroConcentratedDP *)self rho];
      double v19 = exp(v14 * v17 + (v14 + -1.0) * (v11 + v14 * v18)) / (v14 + -1.0);
      if (v19 <= 1.0) {
        double v7 = v19;
      }
      else {
        double v7 = 1.0;
      }
      a3 = v22;
    }
    v20 = [[_DPApproximateDP alloc] initWithEpsilon:a4 delta:a3 error:v7];
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (double)rho
{
  return self->_rho;
}

@end