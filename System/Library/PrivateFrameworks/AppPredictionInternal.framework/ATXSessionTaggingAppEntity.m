@interface ATXSessionTaggingAppEntity
+ (id)genreIdForBundleId:(id)a3;
+ (id)keyForBundleId:(id)a3;
- (ATXModeEntityAffinityVector)affinityVector;
- (ATXModeEntityAffinityVector)affinityVector_v2;
- (ATXModeMetadataConstants)modeMetadataConstants;
- (ATXSessionTaggingAppEntity)initWithBundleId:(id)a3 modeMetadataConstants:(id)a4;
- (NSString)bundleId;
- (id)entityKey;
- (void)_resetAffinityVectorToDefault;
- (void)_resetAffinityVectorToDefault_v2;
@end

@implementation ATXSessionTaggingAppEntity

- (id)entityKey
{
  v3 = objc_opt_class();
  bundleId = self->_bundleId;
  return (id)[v3 keyForBundleId:bundleId];
}

+ (id)keyForBundleId:(id)a3
{
  return (id)[NSString stringWithFormat:@"ATXModeAppEntity_%@", a3];
}

+ (id)genreIdForBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"com.apple.calculator"]) {
    goto LABEL_2;
  }
  if ([v3 isEqual:@"com.apple.camera"]) {
    goto LABEL_4;
  }
  if ([v3 isEqual:@"com.apple.compass"]) {
    goto LABEL_6;
  }
  if ([v3 isEqual:@"com.apple.DocumentsApp"]) {
    goto LABEL_2;
  }
  if ([v3 isEqual:@"com.apple.facetime"])
  {
LABEL_12:
    v4 = &unk_1F27F1C50;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.Maps"])
  {
LABEL_6:
    v4 = &unk_1F27F1C38;
    goto LABEL_7;
  }
  if (([v3 isEqual:@"com.apple.mobilecal"] & 1) != 0
    || ([v3 isEqual:@"com.apple.mobilemail"] & 1) != 0
    || ([v3 isEqual:@"com.apple.mobilenotes"] & 1) != 0)
  {
    goto LABEL_2;
  }
  if ([v3 isEqual:@"com.apple.mobileslideshow"])
  {
LABEL_4:
    v4 = &unk_1F27F1C20;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.Music"])
  {
    v4 = &unk_1F27F1C68;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.NanoAlarm"])
  {
    v4 = &unk_1F27F1C80;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.news"])
  {
    v4 = &unk_1F27F1C98;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.podcasts"]) {
    goto LABEL_25;
  }
  if ([v3 isEqual:@"com.apple.reminders"])
  {
LABEL_2:
    v4 = &unk_1F27F1C08;
    goto LABEL_7;
  }
  if ([v3 isEqual:@"com.apple.stocks"])
  {
    v4 = &unk_1F27F1CC8;
  }
  else
  {
    if ([v3 isEqual:@"com.apple.tv"])
    {
LABEL_25:
      v4 = &unk_1F27F1CB0;
      goto LABEL_7;
    }
    if ([v3 isEqual:@"com.apple.weather"])
    {
      v4 = &unk_1F27F1CE0;
    }
    else
    {
      if ([v3 isEqual:@"com.apple.MobileSMS"]) {
        goto LABEL_12;
      }
      v6 = +[_ATXAppInfoManager sharedInstance];
      v4 = [v6 genreIdForBundleId:v3];
    }
  }
LABEL_7:

  return v4;
}

- (void)_resetAffinityVectorToDefault
{
  id v7 = [(id)objc_opt_class() genreIdForBundleId:self->_bundleId];
  if (v7)
  {
    id v3 = [(ATXModeMetadataConstants *)self->_modeMetadataConstants defaultAppGenreModeAffinities];
    v4 = [v3 objectForKeyedSubscript:v7];

    if (v4)
    {
      v5 = [[ATXModeEntityAffinityVector alloc] initWithAffinities:v4 shouldResize:1];
      affinityVector = self->_affinityVector;
      self->_affinityVector = v5;
    }
    else
    {
      affinityVector = self->_affinityVector;
      self->_affinityVector = 0;
    }
  }
  else
  {
    v4 = self->_affinityVector;
    self->_affinityVector = 0;
  }
}

- (void)_resetAffinityVectorToDefault_v2
{
  id v7 = [(id)objc_opt_class() genreIdForBundleId:self->_bundleId];
  if (v7)
  {
    id v3 = [(ATXModeMetadataConstants *)self->_modeMetadataConstants defaultAppGenreModeAffinities_v2];
    affinityVector = [v3 objectForKeyedSubscript:v7];

    if (affinityVector)
    {
      v5 = [[ATXModeEntityAffinityVector alloc] initWithAffinities:affinityVector shouldResize:0];
      affinityVector_v2 = self->_affinityVector_v2;
      self->_affinityVector_v2 = v5;
    }
    else
    {
      affinityVector_v2 = self->_affinityVector_v2;
      self->_affinityVector_v2 = 0;
    }
  }
  else
  {
    affinityVector = self->_affinityVector;
    self->_affinityVector = 0;
  }
}

- (ATXSessionTaggingAppEntity)initWithBundleId:(id)a3 modeMetadataConstants:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXSessionTaggingAppEntity;
  v9 = [(ATXSessionTaggingAppEntity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_modeMetadataConstants, a4);
    [(ATXSessionTaggingAppEntity *)v10 _resetAffinityVectorToDefault];
    [(ATXSessionTaggingAppEntity *)v10 _resetAffinityVectorToDefault_v2];
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (ATXModeMetadataConstants)modeMetadataConstants
{
  return self->_modeMetadataConstants;
}

- (ATXModeEntityAffinityVector)affinityVector
{
  return self->_affinityVector;
}

- (ATXModeEntityAffinityVector)affinityVector_v2
{
  return self->_affinityVector_v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affinityVector_v2, 0);
  objc_storeStrong((id *)&self->_affinityVector, 0);
  objc_storeStrong((id *)&self->_modeMetadataConstants, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end