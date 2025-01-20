@interface _ATXAppInfo
- (BOOL)isEnterpriseApp;
- (BOOL)isExtension;
- (NSArray)subGenreIds;
- (NSDate)installDate;
- (NSDate)lastLaunch;
- (NSDate)lastSpotlightLaunch;
- (NSNumber)app2VecCluster;
- (NSNumber)averageSecondsBetweenLaunches;
- (NSNumber)genreId;
- (NSNumber)medianSecondsBetweenLaunches;
- (NSString)bundleId;
- (_ATXAppInfo)initWithBundleId:(id)a3 isExtension:(BOOL)a4 isEnterpriseApp:(BOOL)a5 installDate:(id)a6 lastLaunch:(id)a7 lastSpotlightLaunch:(id)a8 averageSecondsBetweenLaunches:(id)a9 medianSecondsBetweenLaunches:(id)a10 genreId:(id)a11 subGenreIds:(id)a12 app2VecCluster:(id)a13;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setApp2VecCluster:(id)a3;
- (void)setAverageSecondsBetweenLaunches:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setGenreId:(id)a3;
- (void)setInstallDate:(id)a3;
- (void)setIsEnterpriseApp:(BOOL)a3;
- (void)setIsExtension:(BOOL)a3;
- (void)setLastLaunch:(id)a3;
- (void)setLastSpotlightLaunch:(id)a3;
- (void)setMedianSecondsBetweenLaunches:(id)a3;
- (void)setSubGenreIds:(id)a3;
@end

@implementation _ATXAppInfo

- (_ATXAppInfo)initWithBundleId:(id)a3 isExtension:(BOOL)a4 isEnterpriseApp:(BOOL)a5 installDate:(id)a6 lastLaunch:(id)a7 lastSpotlightLaunch:(id)a8 averageSecondsBetweenLaunches:(id)a9 medianSecondsBetweenLaunches:(id)a10 genreId:(id)a11 subGenreIds:(id)a12 app2VecCluster:(id)a13
{
  id v17 = a3;
  id v51 = a6;
  id v50 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = self;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  v25 = v17;
  if (!v17)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, v20, @"_ATXAppInfo.m", 25, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  v52.receiver = v20;
  v52.super_class = (Class)_ATXAppInfo;
  v26 = [(_ATXAppInfo *)&v52 init];
  if (v26)
  {
    uint64_t v27 = [v25 copy];
    bundleId = v26->_bundleId;
    v26->_bundleId = (NSString *)v27;

    v26->_isExtension = a4;
    v26->_isEnterpriseApp = a5;
    uint64_t v29 = [v51 copy];
    installDate = v26->_installDate;
    v26->_installDate = (NSDate *)v29;

    uint64_t v31 = [v50 copy];
    lastLaunch = v26->_lastLaunch;
    v26->_lastLaunch = (NSDate *)v31;

    uint64_t v33 = [v18 copy];
    lastSpotlightLaunch = v26->_lastSpotlightLaunch;
    v26->_lastSpotlightLaunch = (NSDate *)v33;

    uint64_t v35 = [v19 copy];
    averageSecondsBetweenLaunches = v26->_averageSecondsBetweenLaunches;
    v26->_averageSecondsBetweenLaunches = (NSNumber *)v35;

    uint64_t v37 = [v21 copy];
    medianSecondsBetweenLaunches = v26->_medianSecondsBetweenLaunches;
    v26->_medianSecondsBetweenLaunches = (NSNumber *)v37;

    uint64_t v39 = [v22 copy];
    genreId = v26->_genreId;
    v26->_genreId = (NSNumber *)v39;

    if ([v23 count])
    {
      uint64_t v41 = [v23 copy];
      subGenreIds = v26->_subGenreIds;
      v26->_subGenreIds = (NSArray *)v41;
    }
    else
    {
      subGenreIds = v26->_subGenreIds;
      v26->_subGenreIds = 0;
    }

    uint64_t v43 = [v24 copy];
    app2VecCluster = v26->_app2VecCluster;
    v26->_app2VecCluster = (NSNumber *)v43;
  }
  return v26;
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app2VecCluster, 0);
  objc_storeStrong((id *)&self->_subGenreIds, 0);
  objc_storeStrong((id *)&self->_genreId, 0);
  objc_storeStrong((id *)&self->_medianSecondsBetweenLaunches, 0);
  objc_storeStrong((id *)&self->_averageSecondsBetweenLaunches, 0);
  objc_storeStrong((id *)&self->_lastSpotlightLaunch, 0);
  objc_storeStrong((id *)&self->_lastLaunch, 0);
  objc_storeStrong((id *)&self->_installDate, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [[_ATXAppInfo alloc] initWithBundleId:self->_bundleId isExtension:self->_isExtension isEnterpriseApp:self->_isEnterpriseApp installDate:self->_installDate lastLaunch:self->_lastLaunch lastSpotlightLaunch:self->_lastSpotlightLaunch averageSecondsBetweenLaunches:self->_averageSecondsBetweenLaunches medianSecondsBetweenLaunches:self->_medianSecondsBetweenLaunches genreId:self->_genreId subGenreIds:self->_subGenreIds app2VecCluster:self->_app2VecCluster];
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (void)setIsExtension:(BOOL)a3
{
  self->_isExtension = a3;
}

- (BOOL)isEnterpriseApp
{
  return self->_isEnterpriseApp;
}

- (void)setIsEnterpriseApp:(BOOL)a3
{
  self->_isEnterpriseApp = a3;
}

- (void)setInstallDate:(id)a3
{
}

- (NSDate)lastLaunch
{
  return self->_lastLaunch;
}

- (void)setLastLaunch:(id)a3
{
}

- (NSDate)lastSpotlightLaunch
{
  return self->_lastSpotlightLaunch;
}

- (void)setLastSpotlightLaunch:(id)a3
{
}

- (NSNumber)averageSecondsBetweenLaunches
{
  return self->_averageSecondsBetweenLaunches;
}

- (void)setAverageSecondsBetweenLaunches:(id)a3
{
}

- (NSNumber)medianSecondsBetweenLaunches
{
  return self->_medianSecondsBetweenLaunches;
}

- (void)setMedianSecondsBetweenLaunches:(id)a3
{
}

- (NSNumber)genreId
{
  return self->_genreId;
}

- (void)setGenreId:(id)a3
{
}

- (NSArray)subGenreIds
{
  return self->_subGenreIds;
}

- (void)setSubGenreIds:(id)a3
{
}

- (NSNumber)app2VecCluster
{
  return self->_app2VecCluster;
}

- (void)setApp2VecCluster:(id)a3
{
}

@end