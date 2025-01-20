@interface CADIdleChangeTrackingCleanupInfo
+ (id)serverIdleChangeTrackingCleanupInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInfo:(id)a3;
- (CADIdleChangeTrackingCleanupInfo)initWithLanguishPeriod:(double)a3 numberOfChanges:(int)a4;
- (double)languishPeriod;
- (id)description;
- (int)numberOfChanges;
- (void)setLanguishPeriod:(double)a3;
- (void)setNumberOfChanges:(int)a3;
@end

@implementation CADIdleChangeTrackingCleanupInfo

- (CADIdleChangeTrackingCleanupInfo)initWithLanguishPeriod:(double)a3 numberOfChanges:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)CADIdleChangeTrackingCleanupInfo;
  v6 = [(CADIdleChangeTrackingCleanupInfo *)&v8 init];
  if (v6)
  {
    CADLogInitIfNeeded();
    [(CADIdleChangeTrackingCleanupInfo *)v6 setLanguishPeriod:a3];
    [(CADIdleChangeTrackingCleanupInfo *)v6 setNumberOfChanges:v4];
  }
  return v6;
}

+ (id)serverIdleChangeTrackingCleanupInfo
{
  v2 = [[CADIdleChangeTrackingCleanupInfo alloc] initWithLanguishPeriod:1000 numberOfChanges:2592000.0];
  return v2;
}

- (BOOL)isEqualToInfo:(id)a3
{
  uint64_t v4 = (CADIdleChangeTrackingCleanupInfo *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v10 = 1;
    goto LABEL_7;
  }
  [(CADIdleChangeTrackingCleanupInfo *)self languishPeriod];
  double v7 = v6;
  [(CADIdleChangeTrackingCleanupInfo *)v5 languishPeriod];
  if (vabdd_f64(v7, v8) < 2.22044605e-16)
  {
    int v9 = [(CADIdleChangeTrackingCleanupInfo *)self numberOfChanges];
    BOOL v10 = v9 == [(CADIdleChangeTrackingCleanupInfo *)v5 numberOfChanges];
  }
  else
  {
LABEL_5:
    BOOL v10 = 0;
  }
LABEL_7:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(CADIdleChangeTrackingCleanupInfo *)self isEqualToInfo:v4];
  }
  else
  {
    double v6 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      double v7 = v6;
      double v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      int v11 = 138412802;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v9;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_ERROR, "WARNING: Comparing %@ to object whose class is not: [%@]. Object: %@.", (uint8_t *)&v11, 0x20u);
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = (void *)MEMORY[0x1E4F28ED0];
  [(CADIdleChangeTrackingCleanupInfo *)self languishPeriod];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[CADIdleChangeTrackingCleanupInfo numberOfChanges](self, "numberOfChanges"));
  double v8 = [v3 stringWithFormat:@"%@ <%p> {\n    Languish Period = %@\n    Number of Changes = %@\n}", v4, self, v6, v7];

  return v8;
}

- (double)languishPeriod
{
  return self->_languishPeriod;
}

- (void)setLanguishPeriod:(double)a3
{
  self->_languishPeriod = a3;
}

- (int)numberOfChanges
{
  return self->_numberOfChanges;
}

- (void)setNumberOfChanges:(int)a3
{
  self->_numberOfChanges = a3;
}

@end