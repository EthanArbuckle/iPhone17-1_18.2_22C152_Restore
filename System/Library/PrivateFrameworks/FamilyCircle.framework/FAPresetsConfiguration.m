@interface FAPresetsConfiguration
- (BOOL)areMusicProfilesAllowed;
- (BOOL)areMusicVideosAllowed;
- (BOOL)isBooksAllowed;
- (BOOL)isDeletingAppsAllowed;
- (BOOL)isExplicitMediaAllowed;
- (BOOL)isSiriExplicitAllowed;
- (BOOL)isSiriWebSearchAllowed;
- (FAPresetsConfiguration)initWithSTPresetsConfiguration:(id)a3;
- (NSNumber)allowedAppStoreRating;
- (NSNumber)allowedMovieRating;
- (NSNumber)allowedTVRating;
- (STPresetsConfiguration)stPresetsConfiguration;
- (void)setStPresetsConfiguration:(id)a3;
@end

@implementation FAPresetsConfiguration

- (FAPresetsConfiguration)initWithSTPresetsConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAPresetsConfiguration;
  v6 = [(FAPresetsConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stPresetsConfiguration, a3);
  }

  return v7;
}

- (NSNumber)allowedAppStoreRating
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  v3 = [v2 allowedAppStoreRating];

  return (NSNumber *)v3;
}

- (BOOL)isBooksAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 isBooksAllowed];

  return v3;
}

- (NSNumber)allowedTVRating
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 allowedTVRating];

  return (NSNumber *)v3;
}

- (NSNumber)allowedMovieRating
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 allowedMovieRating];

  return (NSNumber *)v3;
}

- (BOOL)isExplicitMediaAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 isExplicitMediaAllowed];

  return v3;
}

- (BOOL)areMusicVideosAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 areMusicVideosAllowed];

  return v3;
}

- (BOOL)areMusicProfilesAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 areMusicProfilesAllowed];

  return v3;
}

- (BOOL)isSiriWebSearchAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 isSiriWebSearchAllowed];

  return v3;
}

- (BOOL)isSiriExplicitAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 isSiriExplicitAllowed];

  return v3;
}

- (BOOL)isDeletingAppsAllowed
{
  v2 = [(FAPresetsConfiguration *)self stPresetsConfiguration];
  unsigned __int8 v3 = [v2 isDeletingAppsAllowed];

  return v3;
}

- (STPresetsConfiguration)stPresetsConfiguration
{
  return self->_stPresetsConfiguration;
}

- (void)setStPresetsConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end