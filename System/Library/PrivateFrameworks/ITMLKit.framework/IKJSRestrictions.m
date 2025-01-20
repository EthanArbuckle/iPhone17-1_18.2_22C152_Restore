@interface IKJSRestrictions
+ (id)restrictionsDidChangeNotificationName;
- (BOOL)allowArtistActivity;
- (BOOL)allowsErotica;
- (BOOL)allowsExplicit;
- (BOOL)allowsITunes;
- (BOOL)allowsMusicVideos;
- (BOOL)allowsShowingUndownloadedMovies;
- (BOOL)allowsShowingUndownloadedTVShows;
- (BOOL)appAnalyticsAllowed;
- (BOOL)appInstallationAllowed;
- (NSString)maxAppRating;
- (id)_contentRestrictionsCountryCode;
- (id)_ratingForSetting:(id)a3 domain:(id)a4 countryCode:(id)a5;
- (id)asPrivateIKJSRestrictions;
- (id)maxMovieRatingForCountry:(id)a3;
- (id)maxTVShowRatingForCountry:(id)a3;
- (int64_t)maxAppRank;
- (int64_t)maxMovieRank;
- (int64_t)maxTVShowRank;
@end

@implementation IKJSRestrictions

- (id)asPrivateIKJSRestrictions
{
  if ([(IKJSRestrictions *)self conformsToProtocol:&unk_1F3E45470]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (id)restrictionsDidChangeNotificationName
{
  return (id)*MEMORY[0x1E4F73EC0];
}

- (int64_t)maxAppRank
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  v3 = [v2 effectiveValueForSetting:*MEMORY[0x1E4F740B0]];

  int64_t v4 = [v3 integerValue];
  return v4;
}

- (int64_t)maxMovieRank
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  v3 = [v2 effectiveValueForSetting:*MEMORY[0x1E4F740C0]];

  uint64_t v4 = [v3 integerValue];
  if (v4) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (int64_t)maxTVShowRank
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  v3 = [v2 effectiveValueForSetting:*MEMORY[0x1E4F740C8]];

  uint64_t v4 = [v3 integerValue];
  if (v4) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (NSString)maxAppRating
{
  return (NSString *)[(IKJSRestrictions *)self _ratingForSetting:*MEMORY[0x1E4F740B0] domain:@"ratingApps" countryCode:0];
}

- (BOOL)appInstallationAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isOnDeviceAppInstallationAllowed];

  return v3;
}

- (BOOL)appAnalyticsAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isAppAnalyticsAllowed];

  return v3;
}

- (id)maxMovieRatingForCountry:(id)a3
{
  return [(IKJSRestrictions *)self _ratingForSetting:*MEMORY[0x1E4F740C0] domain:@"ratingMovies" countryCode:a3];
}

- (id)maxTVShowRatingForCountry:(id)a3
{
  return [(IKJSRestrictions *)self _ratingForSetting:*MEMORY[0x1E4F740C8] domain:@"ratingTVShows" countryCode:a3];
}

- (BOOL)allowArtistActivity
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F740D8]];

  return v3 != 2;
}

- (BOOL)allowsErotica
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F78]];

  return v3 != 2;
}

- (BOOL)allowsExplicit
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE8]];

  return v3 != 2;
}

- (BOOL)allowsMusicVideos
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F740E8]];

  return v3 != 2;
}

- (BOOL)allowsITunes
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74078]];

  return v3 != 2;
}

- (BOOL)allowsShowingUndownloadedTVShows
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74178]];

  return v3 != 2;
}

- (BOOL)allowsShowingUndownloadedMovies
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74170]];

  return v3 != 2;
}

- (id)_ratingForSetting:(id)a3 domain:(id)a4 countryCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F74230];
  id v11 = a3;
  v12 = [v10 sharedConnection];
  v13 = [v12 effectiveValueForSetting:v11];

  if ([v9 isUndefined] & 1) != 0 || (objc_msgSend(v9, "isNull"))
  {
    v14 = 0;
  }
  else
  {
    v14 = [v9 toString];
  }
  if (![v14 length])
  {
    v15 = [(IKJSRestrictions *)self _contentRestrictionsCountryCode];
    if ([v15 length]) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    v14 = v17;
  }
  v18 = +[IKRestrictionsUtilities ratingForRestrictionRanking:v13 inDomain:v8 countryCode:v14];

  return v18;
}

- (id)_contentRestrictionsCountryCode
{
  v2 = (void *)CRCopyCountryCode();
  return v2;
}

@end