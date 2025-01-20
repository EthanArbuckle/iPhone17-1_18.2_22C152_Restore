@interface _DPRenyiDP
+ (BOOL)isValidAlpha:(double)a3 error:(id *)a4;
+ (id)defaultAlphas;
- (_DPRenyiDP)initWithAlpha:(double)a3 tau:(double)a4 error:(id *)a5;
- (double)alpha;
- (double)tau;
- (id)approximateDPForDelta:(double)a3 error:(id *)a4;
@end

@implementation _DPRenyiDP

- (_DPRenyiDP)initWithAlpha:(double)a3 tau:(double)a4 error:(id *)a5
{
  if (!+[_DPRenyiDP isValidAlpha:error:](_DPRenyiDP, "isValidAlpha:error:"))
  {
LABEL_9:
    v12 = 0;
    goto LABEL_13;
  }
  double v9 = fabs(a4);
  if (v9 >= INFINITY && v9 <= INFINITY)
  {
    v10 = _DPPrivacyBudgetError(1, @"Renyi-DP tau must be finite, and not NAN.");
    v11 = +[_DPLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
    }

    if (a5) {
      *a5 = v10;
    }

    goto LABEL_9;
  }
  v15.receiver = self;
  v15.super_class = (Class)_DPRenyiDP;
  v13 = [(_DPRenyiDP *)&v15 init];
  if (v13)
  {
    v13->_alpha = a3;
    v13->_tau = a4;
  }
  self = v13;
  v12 = self;
LABEL_13:

  return v12;
}

- (id)approximateDPForDelta:(double)a3 error:(id *)a4
{
  if (+[_DPApproximateDP isValidDelta:error:](_DPApproximateDP, "isValidDelta:error:"))
  {
    if (a3 == 0.0)
    {
      _DPPrivacyBudgetError(1, @"Approximate-DP delta cannot be 0 when converting Renyi-DP to approximate-DP.");
      v7 = (_DPApproximateDP *)objc_claimAutoreleasedReturnValue();
      v8 = +[_DPLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
      }

      if (a4)
      {
        v7 = v7;
        double v9 = 0;
        *a4 = v7;
      }
      else
      {
        double v9 = 0;
      }
    }
    else
    {
      [(_DPRenyiDP *)self tau];
      double v11 = v10;
      double v12 = log(1.0 / a3);
      [(_DPRenyiDP *)self alpha];
      double v14 = v13 + -1.0;
      [(_DPRenyiDP *)self alpha];
      long double v16 = v12 + v14 * log(-1.0 / v15 + 1.0);
      [(_DPRenyiDP *)self alpha];
      long double v18 = v16 - log(v17);
      [(_DPRenyiDP *)self alpha];
      v20 = [[_DPApproximateDP alloc] initWithEpsilon:a4 delta:(double)(v11 + v18 / (v19 + -1.0)) error:a3];
      v7 = v20;
      if (v20)
      {
        v7 = v20;
        double v9 = v7;
      }
      else
      {
        v21 = _DPPrivacyBudgetError(3, @"Failed to convert Renyi-DP to approximate-DP. The converted epsilon is not a valid value.");
        v22 = +[_DPLog framework];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
        }

        if (a4) {
          *a4 = v21;
        }

        double v9 = 0;
      }
    }
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

+ (BOOL)isValidAlpha:(double)a3 error:(id *)a4
{
  double v4 = fabs(a3);
  if (a3 > 1.0 && v4 != INFINITY) {
    return 1;
  }
  v7 = _DPPrivacyBudgetError(1, @"Renyi-DP alpha must be finite, not NAN, and greater than 1.0.");
  v8 = +[_DPLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:isInternalBuild:error:]();
  }

  if (a4) {
    *a4 = v7;
  }

  return 0;
}

+ (id)defaultAlphas
{
  if (defaultAlphas_onceToken != -1) {
    dispatch_once(&defaultAlphas_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)kDefaultAlphas;
  return v2;
}

- (double)alpha
{
  return self->_alpha;
}

- (double)tau
{
  return self->_tau;
}

@end