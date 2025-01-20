@interface CLLocation(CPLArchiver)
- (BOOL)cplSpecialIsEqual:()CPLArchiver;
- (id)plistArchiveWithCPLArchiver:()CPLArchiver;
- (uint64_t)initWithCPLArchiver:()CPLArchiver;
- (unint64_t)cplSpecialHash;
@end

@implementation CLLocation(CPLArchiver)

- (unint64_t)cplSpecialHash
{
  [a1 coordinate];
  return (unint64_t)(v2 * v1);
}

- (BOOL)cplSpecialIsEqual:()CPLArchiver
{
  id v4 = a3;
  if (v4 == a1)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a1 coordinate];
      double v6 = v5;
      double v8 = v7;
      [v4 coordinate];
      BOOL v10 = 0;
      if (v6 == v11)
      {
        BOOL v10 = 0;
        if (v8 == v9)
        {
          [a1 altitude];
          double v13 = v12;
          [v4 altitude];
          BOOL v10 = 0;
          if (v13 == v14)
          {
            [a1 horizontalAccuracy];
            double v16 = v15;
            [v4 horizontalAccuracy];
            BOOL v10 = 0;
            if (v16 == v17)
            {
              [a1 verticalAccuracy];
              double v19 = v18;
              [v4 verticalAccuracy];
              BOOL v10 = 0;
              if (v19 == v20)
              {
                [a1 course];
                double v22 = v21;
                [v4 course];
                BOOL v10 = 0;
                if (v22 == v23)
                {
                  [a1 speed];
                  double v25 = v24;
                  [v4 speed];
                  BOOL v10 = v25 == v26;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (uint64_t)initWithCPLArchiver:()CPLArchiver
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      double v8 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        double v9 = objc_opt_class();
        uint64_t v10 = v5[2];
        *(_DWORD *)buf = 138412546;
        double v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        id v11 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Incorrect string for CLLocation. Found %@: '%@'", buf, 0x16u);
      }
    }
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    [v12 handleFailureInMethod:a2, a1, v13, 1198, @"Incorrect string for CLLocation. Found %@: '%@'", objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  uint64_t v6 = [a1 initWithCoder:v5];

  return v6;
}

- (id)plistArchiveWithCPLArchiver:()CPLArchiver
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = [v5 archiveCursor];
  [v5 setArchiveCursor:v6];
  [a1 encodeWithCoder:v5];
  [v5 setArchiveCursor:v7];

  return v6;
}

@end