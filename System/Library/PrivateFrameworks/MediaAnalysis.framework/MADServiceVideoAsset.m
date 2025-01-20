@interface MADServiceVideoAsset
+ (MADServiceVideoAsset)assetWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5;
+ (MADServiceVideoAsset)assetWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime;
- ($D854FC4CDD8DDEA9B2859E823A7C8A75)trimTimeRange;
- (BOOL)userSafetyEligible;
- (MADServiceVideoAsset)initWithClientBundleID:(id)a3 clientTeamID:(id)a4;
- (NSDictionary)scoresForLabels;
- (NSNumber)animatedStickerScore;
- (NSNumber)isSensitive;
- (NSString)clientBundleID;
- (NSString)clientTeamID;
- (NSString)identifier;
- (NSURL)url;
- (unint64_t)assetType;
- (void)setUserSafetyEligible:(BOOL)a3;
@end

@implementation MADServiceVideoAsset

- (MADServiceVideoAsset)initWithClientBundleID:(id)a3 clientTeamID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADServiceVideoAsset;
  v9 = [(MADServiceVideoAsset *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientBundleID, a3);
    objc_storeStrong((id *)&v10->_clientTeamID, a4);
  }

  return v10;
}

- ($D854FC4CDD8DDEA9B2859E823A7C8A75)trimTimeRange
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- (NSDictionary)scoresForLabels
{
  return 0;
}

- (NSNumber)isSensitive
{
  return 0;
}

+ (MADServiceVideoAsset)assetWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[MADServiceURLVideoAsset alloc] initWithURL:v12 identifier:v11 clientBundleID:v10 clientTeamID:v9];

  return (MADServiceVideoAsset *)v13;
}

+ (MADServiceVideoAsset)assetWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[MADServicePhotosVideoAsset alloc] initWithPhotosAsset:v9 clientBundleID:v8 clientTeamID:v7];

  return (MADServiceVideoAsset *)v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientTeamID
{
  return self->_clientTeamID;
}

- (NSURL)url
{
  return self->_url;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (BOOL)userSafetyEligible
{
  return self->_userSafetyEligible;
}

- (void)setUserSafetyEligible:(BOOL)a3
{
  self->_userSafetyEligible = a3;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end