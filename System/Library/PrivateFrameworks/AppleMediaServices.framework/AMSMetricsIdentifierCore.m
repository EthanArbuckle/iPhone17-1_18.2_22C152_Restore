@interface AMSMetricsIdentifierCore
+ (BOOL)_shouldReplaceInfo:(id)a3 withInfo:(id)a4 isServerRecord:(BOOL)a5;
+ (BOOL)_shouldUpdateDatabaseFor:(id)a3 consumerIDResetInterval:(double)a4;
@end

@implementation AMSMetricsIdentifierCore

+ (BOOL)_shouldUpdateDatabaseFor:(id)a3 consumerIDResetInterval:(double)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 serverProvidedAt];

    if (v7)
    {
      v8 = [v6 expires];
      [v8 timeIntervalSinceReferenceDate];
      double v10 = v9;

      v7 = [v6 serverProvidedAt];
      v11 = [v7 dateByAddingTimeInterval:a4];
      [v11 timeIntervalSinceReferenceDate];
      double v13 = v12;

      LOBYTE(v7) = v10 != v13;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

+ (BOOL)_shouldReplaceInfo:(id)a3 withInfo:(id)a4 isServerRecord:(BOOL)a5
{
  LODWORD(v5) = a5;
  id v7 = a3;
  id v8 = a4;
  double v9 = [v7 serverProvidedAt];
  if (v9)
  {
  }
  else
  {
    double v10 = [v8 serverProvidedAt];

    if (!v10)
    {
      v28 = [v7 modified];
      [v28 timeIntervalSinceReferenceDate];
      double v30 = v29;
      v31 = [v8 modified];
      [v31 timeIntervalSinceReferenceDate];
      double v33 = v32;

      if (v30 > v33)
      {
        if (!v5) {
          goto LABEL_16;
        }
        if ([v7 deleted])
        {
          LOBYTE(v5) = 0;
          goto LABEL_16;
        }
      }
      goto LABEL_15;
    }
  }
  v11 = [v7 serverProvidedAt];

  if (!v11) {
    goto LABEL_15;
  }
  id v5 = [v8 serverProvidedAt];

  if (v5)
  {
    uint64_t v12 = [v7 value];
    if (!v12) {
      goto LABEL_10;
    }
    double v13 = (void *)v12;
    v14 = [v7 value];
    v15 = [v8 value];
    int v16 = [v14 isEqualToString:v15];

    if (!v16)
    {
LABEL_10:
      v23 = [v7 serverProvidedAt];
      [v23 timeIntervalSinceReferenceDate];
      double v25 = v24;
      v26 = [v8 serverProvidedAt];
      [v26 timeIntervalSinceReferenceDate];
      LOBYTE(v5) = v25 <= v27;

      goto LABEL_16;
    }
    v17 = [v7 serverProvidedAt];
    [v17 timeIntervalSinceReferenceDate];
    double v19 = v18;
    v20 = [v8 serverProvidedAt];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;

    if (v19 <= v22)
    {
      LOBYTE(v5) = [v7 isEqualIgnoringLastSync:v8];
      goto LABEL_16;
    }
LABEL_15:
    LOBYTE(v5) = 1;
  }
LABEL_16:

  return (char)v5;
}

@end