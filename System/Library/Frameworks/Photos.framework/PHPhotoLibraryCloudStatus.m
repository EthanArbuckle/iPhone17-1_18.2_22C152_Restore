@interface PHPhotoLibraryCloudStatus
- (BOOL)isCloudSyncEnabled;
- (BOOL)isEqual:(id)a3;
- (NSDate)firstSyncDate;
- (NSDate)lastSyncDate;
- (PHPhotoLibraryCloudStatus)initWithCPLStatus:(id)a3;
- (id)cplStatus;
- (id)description;
@end

@implementation PHPhotoLibraryCloudStatus

- (void).cxx_destruct
{
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PHPhotoLibraryCloudStatus;
  v3 = [(PHPhotoLibraryCloudStatus *)&v9 description];
  if ([(PHPhotoLibraryCloudStatus *)self isCloudSyncEnabled]) {
    v4 = @"ENABLED";
  }
  else {
    v4 = @"DISABLED";
  }
  v5 = [(PHPhotoLibraryCloudStatus *)self lastSyncDate];
  v6 = [(PHPhotoLibraryCloudStatus *)self firstSyncDate];
  v7 = [v3 stringByAppendingFormat:@": %@ [last:%@ first:%@]", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PHPhotoLibraryCloudStatus *)a3;
  if (self == v4)
  {
    char IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(PHPhotoLibraryCloudStatus *)self isCloudSyncEnabled];
      if (v6 == [(PHPhotoLibraryCloudStatus *)v5 isCloudSyncEnabled]
        && ([(PHPhotoLibraryCloudStatus *)self lastSyncDate],
            v7 = objc_claimAutoreleasedReturnValue(),
            [(PHPhotoLibraryCloudStatus *)v5 lastSyncDate],
            v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = PLObjectIsEqual(),
            v8,
            v7,
            v9))
      {
        v10 = [(PHPhotoLibraryCloudStatus *)self firstSyncDate];
        v11 = [(PHPhotoLibraryCloudStatus *)v5 firstSyncDate];
        char IsEqual = PLObjectIsEqual();
      }
      else
      {
        char IsEqual = 0;
      }
    }
    else
    {
      char IsEqual = 0;
    }
  }

  return IsEqual;
}

- (NSDate)firstSyncDate
{
  v2 = [(PHPhotoLibraryCloudStatus *)self cplStatus];
  v3 = [v2 initialSyncDate];

  return (NSDate *)v3;
}

- (NSDate)lastSyncDate
{
  v2 = [(PHPhotoLibraryCloudStatus *)self cplStatus];
  v3 = [v2 lastSuccessfulSyncDate];

  return (NSDate *)v3;
}

- (BOOL)isCloudSyncEnabled
{
  return self->_cplStatus != 0;
}

- (id)cplStatus
{
  return self->_cplStatus;
}

- (PHPhotoLibraryCloudStatus)initWithCPLStatus:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHPhotoLibraryCloudStatus;
  BOOL v6 = [(PHPhotoLibraryCloudStatus *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cplStatus, a3);
  }

  return v7;
}

@end