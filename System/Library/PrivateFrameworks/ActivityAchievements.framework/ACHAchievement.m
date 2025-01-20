@interface ACHAchievement
+ (BOOL)supportsSecureCoding;
- ($E2C29196C7A5C696474C6955C5A9CE06)badgeEnamelColor;
- ($E2C29196C7A5C696474C6955C5A9CE06)badgeMetalColor;
- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor1;
- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor2;
- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor3;
- (ACHAchievement)initWithCodable:(id)a3;
- (ACHAchievement)initWithCoder:(id)a3;
- (ACHAchievement)initWithTemplate:(id)a3 earnedInstances:(id)a4;
- (ACHAchievement)initWithTemplate:(id)a3 relevantEarnedInstance:(id)a4 earnedInstanceCount:(unint64_t)a5;
- (ACHEarnedInstance)relevantEarnedInstance;
- (ACHTemplate)template;
- (BOOL)badgeUsesFullColorEnamel;
- (BOOL)badgeUsesTriColorEnamel;
- (BOOL)faceHasMetalInlay;
- (BOOL)hasClientRequiredURLs;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRingsBased;
- (BOOL)prerequisiteMet;
- (BOOL)unearned;
- (BOOL)unearnedUsesTwoToneEnamel;
- (HKQuantity)goal;
- (HKQuantity)progress;
- (NSArray)badgeModelFilenames;
- (NSArray)earnedInstances;
- (NSArray)textureFilenames;
- (NSDictionary)customPlaceholderValues;
- (NSString)badgeShapeName;
- (NSString)glyphTextureFilename;
- (NSString)localizationBundleURLString;
- (NSString)propertyListBundleURLString;
- (NSString)resourceBundleURLString;
- (NSString)section;
- (NSString)stickerBundleURLString;
- (NSURL)localizationBundleURL;
- (NSURL)propertyListBundleURL;
- (NSURL)resourceBundleURL;
- (NSURL)stickerBundleURL;
- (double)glyphPositionOffsetX;
- (double)glyphPositionOffsetY;
- (double)glyphTextureScale;
- (id)description;
- (id)shallowCopyReplacingEarnedInstances:(id)a3;
- (id)shallowCopyWithRelevantEarnedInstance:(id)a3;
- (int64_t)badgeModelVersion;
- (unint64_t)earnedInstanceCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBadgeEnamelColor:(id)a3;
- (void)setBadgeMetalColor:(id)a3;
- (void)setBadgeModelFilenames:(id)a3;
- (void)setBadgeModelVersion:(int64_t)a3;
- (void)setBadgeShapeName:(id)a3;
- (void)setBadgeUsesFullColorEnamel:(BOOL)a3;
- (void)setBadgeUsesTriColorEnamel:(BOOL)a3;
- (void)setCustomPlaceholderValues:(id)a3;
- (void)setEarnedInstanceCount:(unint64_t)a3;
- (void)setEnamelTriColor1:(id)a3;
- (void)setEnamelTriColor2:(id)a3;
- (void)setEnamelTriColor3:(id)a3;
- (void)setFaceHasMetalInlay:(BOOL)a3;
- (void)setGlyphPositionOffsetX:(double)a3;
- (void)setGlyphPositionOffsetY:(double)a3;
- (void)setGlyphTextureFilename:(id)a3;
- (void)setGlyphTextureScale:(double)a3;
- (void)setGoal:(id)a3;
- (void)setLocalizationBundleURL:(id)a3;
- (void)setLocalizationBundleURLString:(id)a3;
- (void)setPrerequisiteMet:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setPropertyListBundleURL:(id)a3;
- (void)setPropertyListBundleURLString:(id)a3;
- (void)setRelevantEarnedInstance:(id)a3;
- (void)setResourceBundleURL:(id)a3;
- (void)setResourceBundleURLString:(id)a3;
- (void)setSection:(id)a3;
- (void)setStickerBundleURL:(id)a3;
- (void)setStickerBundleURLString:(id)a3;
- (void)setTextureFilenames:(id)a3;
- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3;
@end

@implementation ACHAchievement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerBundleURLString, 0);
  objc_storeStrong((id *)&self->_propertyListBundleURLString, 0);
  objc_storeStrong((id *)&self->_resourceBundleURLString, 0);
  objc_storeStrong((id *)&self->_localizationBundleURLString, 0);
  objc_storeStrong((id *)&self->_customPlaceholderValues, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_badgeShapeName, 0);
  objc_storeStrong((id *)&self->_glyphTextureFilename, 0);
  objc_storeStrong((id *)&self->_textureFilenames, 0);
  objc_storeStrong((id *)&self->_badgeModelFilenames, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_earnedInstances, 0);
  objc_storeStrong((id *)&self->_relevantEarnedInstance, 0);

  objc_storeStrong((id *)&self->_template, 0);
}

- (id)description
{
  v3 = [(ACHAchievement *)self relevantEarnedInstance];

  if (v3)
  {
    uint64_t v4 = [(ACHAchievement *)self earnedInstanceCount];
  }
  else
  {
    v5 = [(ACHAchievement *)self earnedInstances];
    uint64_t v4 = [v5 count];
  }
  v6 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)ACHAchievement;
  v7 = [(ACHAchievement *)&v13 description];
  v8 = [(ACHAchievement *)self template];
  v9 = [v8 uniqueName];
  v10 = [NSNumber numberWithUnsignedInteger:v4];
  v11 = [v6 stringWithFormat:@"%@: %@, %@ earned instances", v7, v9, v10];

  return v11;
}

- (id)shallowCopyWithRelevantEarnedInstance:(id)a3
{
  id v4 = a3;
  v5 = [ACHAchievement alloc];
  v6 = [(ACHAchievement *)self template];
  v7 = [(ACHAchievement *)v5 initWithTemplate:v6 relevantEarnedInstance:v4 earnedInstanceCount:[(ACHAchievement *)self earnedInstanceCount]];

  v8 = [(ACHAchievement *)self localizationBundleURLString];
  [(ACHAchievement *)v7 setLocalizationBundleURLString:v8];

  v9 = [(ACHAchievement *)self resourceBundleURLString];
  [(ACHAchievement *)v7 setResourceBundleURLString:v9];

  v10 = [(ACHAchievement *)self resourceBundleURLString];
  [(ACHAchievement *)v7 setResourceBundleURLString:v10];

  v11 = [(ACHAchievement *)self propertyListBundleURLString];
  [(ACHAchievement *)v7 setPropertyListBundleURLString:v11];

  v12 = [(ACHAchievement *)self stickerBundleURL];
  [(ACHAchievement *)v7 setStickerBundleURL:v12];

  objc_super v13 = [(ACHAchievement *)self textureFilenames];
  [(ACHAchievement *)v7 setTextureFilenames:v13];

  v14 = [(ACHAchievement *)self glyphTextureFilename];
  [(ACHAchievement *)v7 setGlyphTextureFilename:v14];

  [(ACHAchievement *)self glyphPositionOffsetX];
  -[ACHAchievement setGlyphPositionOffsetX:](v7, "setGlyphPositionOffsetX:");
  [(ACHAchievement *)self glyphPositionOffsetY];
  -[ACHAchievement setGlyphPositionOffsetY:](v7, "setGlyphPositionOffsetY:");
  v15 = [(ACHAchievement *)self badgeModelFilenames];
  [(ACHAchievement *)v7 setBadgeModelFilenames:v15];

  [(ACHAchievement *)self glyphTextureScale];
  -[ACHAchievement setGlyphTextureScale:](v7, "setGlyphTextureScale:");
  v16 = [(ACHAchievement *)self badgeShapeName];
  [(ACHAchievement *)v7 setBadgeShapeName:v16];

  [(ACHAchievement *)v7 setBadgeUsesFullColorEnamel:[(ACHAchievement *)self badgeUsesFullColorEnamel]];
  [(ACHAchievement *)v7 setUnearnedUsesTwoToneEnamel:[(ACHAchievement *)self unearnedUsesTwoToneEnamel]];
  [(ACHAchievement *)v7 setFaceHasMetalInlay:[(ACHAchievement *)self faceHasMetalInlay]];
  [(ACHAchievement *)self badgeEnamelColor];
  -[ACHAchievement setBadgeEnamelColor:](v7, "setBadgeEnamelColor:");
  [(ACHAchievement *)self badgeMetalColor];
  -[ACHAchievement setBadgeMetalColor:](v7, "setBadgeMetalColor:");
  [(ACHAchievement *)v7 setBadgeUsesTriColorEnamel:[(ACHAchievement *)self badgeUsesTriColorEnamel]];
  [(ACHAchievement *)self enamelTriColor1];
  -[ACHAchievement setEnamelTriColor1:](v7, "setEnamelTriColor1:");
  [(ACHAchievement *)self enamelTriColor2];
  -[ACHAchievement setEnamelTriColor2:](v7, "setEnamelTriColor2:");
  [(ACHAchievement *)self enamelTriColor3];
  -[ACHAchievement setEnamelTriColor3:](v7, "setEnamelTriColor3:");
  v17 = [(ACHAchievement *)self progress];
  [(ACHAchievement *)v7 setProgress:v17];

  v18 = [(ACHAchievement *)self goal];
  [(ACHAchievement *)v7 setGoal:v18];

  v19 = [(ACHAchievement *)self customPlaceholderValues];
  [(ACHAchievement *)v7 setCustomPlaceholderValues:v19];

  v20 = [(ACHAchievement *)self section];
  [(ACHAchievement *)v7 setSection:v20];

  [(ACHAchievement *)v7 setBadgeModelVersion:[(ACHAchievement *)self badgeModelVersion]];
  [(ACHAchievement *)v7 setPrerequisiteMet:[(ACHAchievement *)self prerequisiteMet]];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(ACHAchievement *)self template];
    v7 = [v5 template];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_10;
    }
    v9 = [(ACHAchievement *)self section];
    uint64_t v10 = [v5 section];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_10;
      }
    }
    v14 = [(ACHAchievement *)self progress];
    [v14 _value];
    v15 = [v5 progress];
    [v15 _value];
    uint64_t v16 = HKCompareDoubles();

    if (v16) {
      goto LABEL_10;
    }
    v17 = [(ACHAchievement *)self goal];
    [v17 _value];
    v18 = [v5 goal];
    [v18 _value];
    uint64_t v19 = HKCompareDoubles();

    if (v19) {
      goto LABEL_10;
    }
    v21 = [(ACHAchievement *)self earnedInstances];
    v22 = [v5 earnedInstances];
    if ([v21 isEqual:v22])
    {
    }
    else
    {
      v23 = [(ACHAchievement *)self relevantEarnedInstance];
      v24 = [v5 relevantEarnedInstance];
      if (![v23 isEqual:v24])
      {

        char v13 = 0;
        goto LABEL_22;
      }
      unint64_t v25 = [(ACHAchievement *)self earnedInstanceCount];
      uint64_t v26 = [v5 earnedInstanceCount];

      if (v25 != v26) {
        goto LABEL_10;
      }
    }
    int v27 = [(ACHAchievement *)self prerequisiteMet];
    if (v27 == [v5 prerequisiteMet])
    {
      v28 = [(ACHAchievement *)self localizationBundleURLString];
      uint64_t v29 = [v5 localizationBundleURLString];
      if (v28 == (void *)v29)
      {
      }
      else
      {
        v30 = (void *)v29;
        int v31 = [v28 isEqualToString:v29];

        if (!v31) {
          goto LABEL_10;
        }
      }
      v32 = [(ACHAchievement *)self resourceBundleURLString];
      uint64_t v33 = [v5 resourceBundleURLString];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        int v35 = [v32 isEqualToString:v33];

        if (!v35) {
          goto LABEL_10;
        }
      }
      v36 = [(ACHAchievement *)self propertyListBundleURLString];
      uint64_t v37 = [v5 propertyListBundleURLString];
      if (v36 == (void *)v37)
      {
      }
      else
      {
        v38 = (void *)v37;
        int v39 = [v36 isEqualToString:v37];

        if (!v39) {
          goto LABEL_10;
        }
      }
      v40 = [(ACHAchievement *)self stickerBundleURLString];
      uint64_t v41 = [v5 stickerBundleURLString];
      if (v40 == (void *)v41)
      {
      }
      else
      {
        v42 = (void *)v41;
        int v43 = [v40 isEqualToString:v41];

        if (!v43) {
          goto LABEL_10;
        }
      }
      v44 = [(ACHAchievement *)self textureFilenames];
      uint64_t v45 = [v5 textureFilenames];
      if (v44 == (void *)v45)
      {
      }
      else
      {
        v46 = (void *)v45;
        int v47 = [v44 isEqual:v45];

        if (!v47) {
          goto LABEL_10;
        }
      }
      v48 = [(ACHAchievement *)self badgeModelFilenames];
      uint64_t v49 = [v5 badgeModelFilenames];
      if (v48 == (void *)v49)
      {
      }
      else
      {
        v50 = (void *)v49;
        int v51 = [v48 isEqual:v49];

        if (!v51) {
          goto LABEL_10;
        }
      }
      v52 = [(ACHAchievement *)self glyphTextureFilename];
      uint64_t v53 = [v5 glyphTextureFilename];
      if (v52 == (void *)v53)
      {
      }
      else
      {
        v54 = (void *)v53;
        int v55 = [v52 isEqual:v53];

        if (!v55) {
          goto LABEL_10;
        }
      }
      [(ACHAchievement *)self glyphPositionOffsetX];
      [v5 glyphPositionOffsetX];
      if (HKCompareDoubles()) {
        goto LABEL_10;
      }
      [(ACHAchievement *)self glyphPositionOffsetY];
      [v5 glyphPositionOffsetY];
      if (HKCompareDoubles()) {
        goto LABEL_10;
      }
      [(ACHAchievement *)self glyphTextureScale];
      [v5 glyphTextureScale];
      if (HKCompareDoubles()) {
        goto LABEL_10;
      }
      v56 = [(ACHAchievement *)self badgeShapeName];
      uint64_t v57 = [v5 badgeShapeName];
      if (v56 == (void *)v57)
      {

        goto LABEL_55;
      }
      v58 = (void *)v57;
      int v59 = [v56 isEqual:v57];

      if (v59)
      {
LABEL_55:
        [(ACHAchievement *)self badgeMetalColor];
        float v61 = v60;
        float v63 = v62;
        float v65 = v64;
        [v5 badgeMetalColor];
        if (!ACHAchievementColorsAreEqual(v61, v63, v65, v66, v67, v68)) {
          goto LABEL_10;
        }
        int v69 = [(ACHAchievement *)self badgeUsesFullColorEnamel];
        if (v69 != [v5 badgeUsesFullColorEnamel]) {
          goto LABEL_10;
        }
        int v70 = [(ACHAchievement *)self unearnedUsesTwoToneEnamel];
        if (v70 != [v5 unearnedUsesTwoToneEnamel]) {
          goto LABEL_10;
        }
        int v71 = [(ACHAchievement *)self faceHasMetalInlay];
        if (v71 != [v5 faceHasMetalInlay]) {
          goto LABEL_10;
        }
        [(ACHAchievement *)self badgeEnamelColor];
        float v73 = v72;
        float v75 = v74;
        float v77 = v76;
        [v5 badgeEnamelColor];
        if (!ACHAchievementColorsAreEqual(v73, v75, v77, v78, v79, v80)) {
          goto LABEL_10;
        }
        int v81 = [(ACHAchievement *)self badgeUsesTriColorEnamel];
        if (v81 != [v5 badgeUsesTriColorEnamel]) {
          goto LABEL_10;
        }
        [(ACHAchievement *)self enamelTriColor1];
        float v83 = v82;
        float v85 = v84;
        float v87 = v86;
        [v5 enamelTriColor1];
        if (!ACHAchievementColorsAreEqual(v83, v85, v87, v88, v89, v90)) {
          goto LABEL_10;
        }
        [(ACHAchievement *)self enamelTriColor2];
        float v92 = v91;
        float v94 = v93;
        float v96 = v95;
        [v5 enamelTriColor2];
        if (!ACHAchievementColorsAreEqual(v92, v94, v96, v97, v98, v99)) {
          goto LABEL_10;
        }
        [(ACHAchievement *)self enamelTriColor3];
        float v101 = v100;
        float v103 = v102;
        float v105 = v104;
        [v5 enamelTriColor3];
        if (!ACHAchievementColorsAreEqual(v101, v103, v105, v106, v107, v108)) {
          goto LABEL_10;
        }
        int64_t v109 = [(ACHAchievement *)self badgeModelVersion];
        if (v109 != [v5 badgeModelVersion]) {
          goto LABEL_10;
        }
        v21 = [(ACHAchievement *)self customPlaceholderValues];
        v22 = [v5 customPlaceholderValues];
        if (v21 == v22) {
          char v13 = 1;
        }
        else {
          char v13 = [v21 isEqual:v22];
        }
LABEL_22:

        goto LABEL_11;
      }
    }
LABEL_10:
    char v13 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)hasClientRequiredURLs
{
  v3 = [(ACHAchievement *)self localizationBundleURL];
  if (v3)
  {
    id v4 = [(ACHAchievement *)self resourceBundleURL];
    if (v4)
    {
      id v5 = [(ACHAchievement *)self propertyListBundleURL];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSURL)localizationBundleURL
{
  v2 = NSURL;
  v3 = [(ACHAchievement *)self localizationBundleURLString];
  id v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (NSURL)resourceBundleURL
{
  v2 = NSURL;
  v3 = [(ACHAchievement *)self resourceBundleURLString];
  id v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (ACHAchievement)initWithCodable:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [ACHTemplate alloc];
  BOOL v6 = [v4 achievementTemplate];
  v7 = [(ACHTemplate *)v5 initWithCodable:v6];

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v9 = [v4 earnedInstances];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v70 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [[ACHEarnedInstance alloc] initWithCodable:*(void *)(*((void *)&v69 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];
  uint64_t v16 = [(ACHAchievement *)self initWithTemplate:v7 earnedInstances:v15];

  if ([v4 hasRelevantEarnedInstance])
  {
    v17 = [ACHEarnedInstance alloc];
    v18 = [v4 relevantEarnedInstance];
    uint64_t v19 = [(ACHEarnedInstance *)v17 initWithCodable:v18];
    [(ACHAchievement *)v16 setRelevantEarnedInstance:v19];
  }
  if ([v4 hasEarnedInstanceCount]) {
    uint64_t v20 = [v4 earnedInstanceCount];
  }
  else {
    uint64_t v20 = [v8 count];
  }
  [(ACHAchievement *)v16 setEarnedInstanceCount:v20];
  if ([v4 hasResourceBundleURL])
  {
    v21 = [v4 resourceBundleURL];
    [(ACHAchievement *)v16 setResourceBundleURLString:v21];
  }
  if ([v4 hasPropertyListBundleURL])
  {
    v22 = [v4 propertyListBundleURL];
    [(ACHAchievement *)v16 setPropertyListBundleURLString:v22];
  }
  if ([v4 hasLocalizationBundleURL])
  {
    v23 = [v4 localizationBundleURL];
    [(ACHAchievement *)v16 setLocalizationBundleURLString:v23];
  }
  if ([v4 hasStickerBundleURL])
  {
    v24 = [v4 stickerBundleURL];
    [(ACHAchievement *)v16 setStickerBundleURLString:v24];
  }
  unint64_t v25 = [v4 textureFilenames];
  [(ACHAchievement *)v16 setTextureFilenames:v25];

  uint64_t v26 = [v4 badgeModelFilenames];
  [(ACHAchievement *)v16 setBadgeModelFilenames:v26];

  [v4 glyphTextureScale];
  -[ACHAchievement setGlyphTextureScale:](v16, "setGlyphTextureScale:");
  int v27 = [v4 glyphTextureFilename];
  [(ACHAchievement *)v16 setGlyphTextureFilename:v27];

  [v4 glyphPositionOffsetX];
  -[ACHAchievement setGlyphPositionOffsetX:](v16, "setGlyphPositionOffsetX:");
  [v4 glyphPositionOffsetY];
  -[ACHAchievement setGlyphPositionOffsetY:](v16, "setGlyphPositionOffsetY:");
  v28 = [v4 badgeShapeName];
  [(ACHAchievement *)v16 setBadgeShapeName:v28];

  if ([v4 hasBadgeMetalColor])
  {
    uint64_t v29 = [v4 badgeMetalColor];
    *(float *)&double v30 = ACHAchievementColorFromACHCodableColor(v29);
    [(ACHAchievement *)v16 setBadgeMetalColor:v30];
  }
  -[ACHAchievement setBadgeUsesFullColorEnamel:](v16, "setBadgeUsesFullColorEnamel:", [v4 badgeUsesFullColorEnamel]);
  -[ACHAchievement setUnearnedUsesTwoToneEnamel:](v16, "setUnearnedUsesTwoToneEnamel:", [v4 unearnedUsesTwoToneEnamel]);
  -[ACHAchievement setFaceHasMetalInlay:](v16, "setFaceHasMetalInlay:", [v4 faceHasMetalInlay]);
  if ([v4 hasBadgeEnamelColor])
  {
    int v31 = [v4 badgeEnamelColor];
    *(float *)&double v32 = ACHAchievementColorFromACHCodableColor(v31);
    [(ACHAchievement *)v16 setBadgeEnamelColor:v32];
  }
  -[ACHAchievement setBadgeUsesTriColorEnamel:](v16, "setBadgeUsesTriColorEnamel:", [v4 badgeUsesTriColorEnamel]);
  if ([v4 badgeUsesTriColorEnamel])
  {
    if ([v4 hasEnamelTriColor1])
    {
      uint64_t v33 = [v4 enamelTriColor1];
      *(float *)&double v34 = ACHAchievementColorFromACHCodableColor(v33);
      [(ACHAchievement *)v16 setEnamelTriColor1:v34];
    }
    if ([v4 hasEnamelTriColor2])
    {
      int v35 = [v4 enamelTriColor2];
      *(float *)&double v36 = ACHAchievementColorFromACHCodableColor(v35);
      [(ACHAchievement *)v16 setEnamelTriColor2:v36];
    }
    if ([v4 hasEnamelTriColor3])
    {
      uint64_t v37 = [v4 enamelTriColor3];
      *(float *)&double v38 = ACHAchievementColorFromACHCodableColor(v37);
      [(ACHAchievement *)v16 setEnamelTriColor3:v38];
    }
  }
  if ([v4 hasProgressValue] && objc_msgSend(v4, "hasProgressUnitString"))
  {
    int v39 = (void *)MEMORY[0x263F0A630];
    v40 = (void *)MEMORY[0x263F0A830];
    uint64_t v41 = [v4 progressUnitString];
    v42 = [v40 unitFromString:v41];
    [v4 progressValue];
    int v43 = objc_msgSend(v39, "quantityWithUnit:doubleValue:", v42);
    [(ACHAchievement *)v16 setProgress:v43];
  }
  if ([v4 hasGoalValue] && objc_msgSend(v4, "hasGoalUnitString"))
  {
    v44 = (void *)MEMORY[0x263F0A630];
    uint64_t v45 = (void *)MEMORY[0x263F0A830];
    v46 = [v4 goalUnitString];
    int v47 = [v45 unitFromString:v46];
    [v4 goalValue];
    v48 = objc_msgSend(v44, "quantityWithUnit:doubleValue:", v47);
    [(ACHAchievement *)v16 setGoal:v48];
  }
  if ([v4 customPlaceholderValuesCount])
  {
    id v62 = v8;
    float v63 = v7;
    id v64 = v4;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v49 = [v4 customPlaceholderValues];
    uint64_t v50 = [v49 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v66;
      uint64_t v53 = (void *)MEMORY[0x263EFFA78];
      do
      {
        uint64_t v54 = 0;
        int v55 = v53;
        do
        {
          if (*(void *)v66 != v52) {
            objc_enumerationMutation(v49);
          }
          v56 = *(void **)(*((void *)&v65 + 1) + 8 * v54);
          uint64_t v57 = [v56 placeholder];
          float v73 = v57;
          v58 = [v56 value];
          float v74 = v58;
          int v59 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
          uint64_t v53 = objc_msgSend(v55, "hk_dictionaryByAddingEntriesFromDictionary:", v59);

          ++v54;
          int v55 = v53;
        }
        while (v51 != v54);
        uint64_t v51 = [v49 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v51);
    }
    else
    {
      uint64_t v53 = (void *)MEMORY[0x263EFFA78];
    }

    [(ACHAchievement *)v16 setCustomPlaceholderValues:v53];
    v7 = v63;
    id v4 = v64;
    id v8 = v62;
  }
  float v60 = [v4 section];
  [(ACHAchievement *)v16 setSection:v60];

  if ([v4 hasBadgeModelVersion]) {
    -[ACHAchievement setBadgeModelVersion:](v16, "setBadgeModelVersion:", [v4 badgeModelVersion]);
  }
  -[ACHAchievement setPrerequisiteMet:](v16, "setPrerequisiteMet:", [v4 prerequisiteMet]);

  return v16;
}

- (BOOL)unearned
{
  v3 = [(ACHAchievement *)self earnedInstances];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(ACHAchievement *)self relevantEarnedInstance];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (ACHEarnedInstance)relevantEarnedInstance
{
  return (ACHEarnedInstance *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)earnedInstances
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)section
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HKQuantity)goal
{
  return (HKQuantity *)objc_getProperty(self, a2, 128, 1);
}

- (unint64_t)earnedInstanceCount
{
  return self->_earnedInstanceCount;
}

- (BOOL)badgeUsesTriColorEnamel
{
  return self->_badgeUsesTriColorEnamel;
}

- (NSString)resourceBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)localizationBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)propertyListBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)prerequisiteMet
{
  return self->_prerequisiteMet;
}

- (HKQuantity)progress
{
  return (HKQuantity *)objc_getProperty(self, a2, 120, 1);
}

- (NSDictionary)customPlaceholderValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)badgeShapeName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSArray)badgeModelFilenames
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)unearnedUsesTwoToneEnamel
{
  return self->_unearnedUsesTwoToneEnamel;
}

- (NSArray)textureFilenames
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (double)glyphTextureScale
{
  return self->_glyphTextureScale;
}

- (NSString)glyphTextureFilename
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (double)glyphPositionOffsetY
{
  return self->_glyphPositionOffsetY;
}

- (double)glyphPositionOffsetX
{
  return self->_glyphPositionOffsetX;
}

- (BOOL)faceHasMetalInlay
{
  return self->_faceHasMetalInlay;
}

- (BOOL)badgeUsesFullColorEnamel
{
  return self->_badgeUsesFullColorEnamel;
}

- (int64_t)badgeModelVersion
{
  return self->_badgeModelVersion;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)badgeMetalColor
{
  objc_copyStruct(dest, &self->_badgeMetalColor, 12, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  float v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)badgeEnamelColor
{
  objc_copyStruct(dest, &self->_badgeEnamelColor, 12, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  float v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)stickerBundleURLString
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResourceBundleURLString:(id)a3
{
}

- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  self->_unearnedUsesTwoToneEnamel = a3;
}

- (void)setTextureFilenames:(id)a3
{
}

- (void)setSection:(id)a3
{
}

- (void)setPrerequisiteMet:(BOOL)a3
{
  self->_prerequisiteMet = a3;
}

- (void)setGlyphTextureScale:(double)a3
{
  self->_glyphTextureScale = a3;
}

- (void)setGlyphTextureFilename:(id)a3
{
}

- (void)setGlyphPositionOffsetY:(double)a3
{
  self->_glyphPositionOffsetY = a3;
}

- (void)setGlyphPositionOffsetX:(double)a3
{
  self->_glyphPositionOffsetX = a3;
}

- (void)setFaceHasMetalInlay:(BOOL)a3
{
  self->_faceHasMetalInlay = a3;
}

- (void)setBadgeUsesTriColorEnamel:(BOOL)a3
{
  self->_badgeUsesTriColorEnamel = a3;
}

- (void)setBadgeUsesFullColorEnamel:(BOOL)a3
{
  self->_badgeUsesFullColorEnamel = a3;
}

- (void)setBadgeShapeName:(id)a3
{
}

- (void)setBadgeModelVersion:(int64_t)a3
{
  self->_badgeModelVersion = a3;
}

- (void)setBadgeModelFilenames:(id)a3
{
}

- (void)setBadgeMetalColor:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src = a3;
  objc_copyStruct(&self->_badgeMetalColor, &src, 12, 1, 0);
}

- (void)setBadgeEnamelColor:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src = a3;
  objc_copyStruct(&self->_badgeEnamelColor, &src, 12, 1, 0);
}

- (void)setLocalizationBundleURLString:(id)a3
{
}

- (void)setPropertyListBundleURLString:(id)a3
{
}

- (void)setEarnedInstanceCount:(unint64_t)a3
{
  self->_earnedInstanceCount = a3;
}

- (ACHAchievement)initWithTemplate:(id)a3 earnedInstances:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ACHAchievement;
  v9 = [(ACHAchievement *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_template, a3);
    v10->_prerequisiteMet = 1;
    if (v8)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke;
      v15[3] = &unk_264512868;
      uint64_t v16 = (NSArray *)v7;
      uint64_t v11 = objc_msgSend(v8, "hk_filter:", v15);
      earnedInstances = v10->_earnedInstances;
      v10->_earnedInstances = (NSArray *)v11;

      char v13 = v16;
    }
    else
    {
      char v13 = v10->_earnedInstances;
      v10->_earnedInstances = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  return v10;
}

- (NSURL)propertyListBundleURL
{
  float v2 = NSURL;
  float v3 = [(ACHAchievement *)self propertyListBundleURLString];
  float v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (unint64_t)hash
{
  float v2 = [(ACHAchievement *)self template];
  unint64_t v3 = [v2 key];

  return v3;
}

- (ACHTemplate)template
{
  return (ACHTemplate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProgress:(id)a3
{
}

- (void)setGoal:(id)a3
{
}

- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor3
{
  objc_copyStruct(dest, &self->_enamelTriColor3, 12, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  float v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor2
{
  objc_copyStruct(dest, &self->_enamelTriColor2, 12, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  float v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)enamelTriColor1
{
  objc_copyStruct(dest, &self->_enamelTriColor1, 12, 1, 0);
  float v2 = *(float *)dest;
  float v3 = *(float *)&dest[1];
  float v4 = *(float *)&dest[2];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setEnamelTriColor3:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src = a3;
  objc_copyStruct(&self->_enamelTriColor3, &src, 12, 1, 0);
}

- (void)setEnamelTriColor2:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src = a3;
  objc_copyStruct(&self->_enamelTriColor2, &src, 12, 1, 0);
}

- (void)setEnamelTriColor1:(id)a3
{
  $E2C29196C7A5C696474C6955C5A9CE06 src = a3;
  objc_copyStruct(&self->_enamelTriColor1, &src, 12, 1, 0);
}

- (NSURL)stickerBundleURL
{
  float v2 = NSURL;
  float v3 = [(ACHAchievement *)self stickerBundleURLString];
  float v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

- (void)setStickerBundleURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(ACHAchievement *)self setStickerBundleURLString:v4];
}

- (void)setStickerBundleURLString:(id)a3
{
}

- (void)setCustomPlaceholderValues:(id)a3
{
}

- (ACHAchievement)initWithTemplate:(id)a3 relevantEarnedInstance:(id)a4 earnedInstanceCount:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ACHAchievement;
  uint64_t v11 = [(ACHAchievement *)&v19 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_template, a3);
    if (v10
      && ([v10 templateUniqueName],
          char v13 = objc_claimAutoreleasedReturnValue(),
          [v9 uniqueName],
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v13 isEqual:v14],
          v14,
          v13,
          (v15 & 1) == 0))
    {
      p_super = ACHLogDefault();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[ACHAchievement initWithTemplate:relevantEarnedInstance:earnedInstanceCount:](v9, p_super);
      }
    }
    else
    {
      uint64_t v16 = (ACHEarnedInstance *)v10;
      p_super = &v12->_relevantEarnedInstance->super;
      v12->_relevantEarnedInstance = v16;
    }

    v12->_earnedInstanceCount = a5;
  }

  return v12;
}

uint64_t __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 templateUniqueName];
  BOOL v6 = *(void **)(a1 + 32);
  id v5 = (id *)(a1 + 32);
  id v7 = [v6 uniqueName];
  uint64_t v8 = [v4 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = ACHLogDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke_cold_1(v5, (uint64_t)v3, v9);
    }
  }
  return v8;
}

- (id)shallowCopyReplacingEarnedInstances:(id)a3
{
  id v4 = a3;
  id v5 = [ACHAchievement alloc];
  BOOL v6 = [(ACHAchievement *)self template];
  id v7 = [(ACHAchievement *)v5 initWithTemplate:v6 earnedInstances:v4];

  uint64_t v8 = [(ACHAchievement *)self localizationBundleURLString];
  [(ACHAchievement *)v7 setLocalizationBundleURLString:v8];

  id v9 = [(ACHAchievement *)self resourceBundleURLString];
  [(ACHAchievement *)v7 setResourceBundleURLString:v9];

  id v10 = [(ACHAchievement *)self resourceBundleURLString];
  [(ACHAchievement *)v7 setResourceBundleURLString:v10];

  uint64_t v11 = [(ACHAchievement *)self propertyListBundleURLString];
  [(ACHAchievement *)v7 setPropertyListBundleURLString:v11];

  uint64_t v12 = [(ACHAchievement *)self stickerBundleURL];
  [(ACHAchievement *)v7 setStickerBundleURL:v12];

  char v13 = [(ACHAchievement *)self textureFilenames];
  [(ACHAchievement *)v7 setTextureFilenames:v13];

  v14 = [(ACHAchievement *)self glyphTextureFilename];
  [(ACHAchievement *)v7 setGlyphTextureFilename:v14];

  [(ACHAchievement *)self glyphPositionOffsetX];
  -[ACHAchievement setGlyphPositionOffsetX:](v7, "setGlyphPositionOffsetX:");
  [(ACHAchievement *)self glyphPositionOffsetY];
  -[ACHAchievement setGlyphPositionOffsetY:](v7, "setGlyphPositionOffsetY:");
  char v15 = [(ACHAchievement *)self badgeModelFilenames];
  [(ACHAchievement *)v7 setBadgeModelFilenames:v15];

  [(ACHAchievement *)self glyphTextureScale];
  -[ACHAchievement setGlyphTextureScale:](v7, "setGlyphTextureScale:");
  uint64_t v16 = [(ACHAchievement *)self badgeShapeName];
  [(ACHAchievement *)v7 setBadgeShapeName:v16];

  [(ACHAchievement *)v7 setBadgeUsesFullColorEnamel:[(ACHAchievement *)self badgeUsesFullColorEnamel]];
  [(ACHAchievement *)v7 setUnearnedUsesTwoToneEnamel:[(ACHAchievement *)self unearnedUsesTwoToneEnamel]];
  [(ACHAchievement *)v7 setFaceHasMetalInlay:[(ACHAchievement *)self faceHasMetalInlay]];
  [(ACHAchievement *)self badgeEnamelColor];
  -[ACHAchievement setBadgeEnamelColor:](v7, "setBadgeEnamelColor:");
  [(ACHAchievement *)self badgeMetalColor];
  -[ACHAchievement setBadgeMetalColor:](v7, "setBadgeMetalColor:");
  [(ACHAchievement *)v7 setBadgeUsesTriColorEnamel:[(ACHAchievement *)self badgeUsesTriColorEnamel]];
  [(ACHAchievement *)self enamelTriColor1];
  -[ACHAchievement setEnamelTriColor1:](v7, "setEnamelTriColor1:");
  [(ACHAchievement *)self enamelTriColor2];
  -[ACHAchievement setEnamelTriColor2:](v7, "setEnamelTriColor2:");
  [(ACHAchievement *)self enamelTriColor3];
  -[ACHAchievement setEnamelTriColor3:](v7, "setEnamelTriColor3:");
  objc_super v17 = [(ACHAchievement *)self progress];
  [(ACHAchievement *)v7 setProgress:v17];

  v18 = [(ACHAchievement *)self goal];
  [(ACHAchievement *)v7 setGoal:v18];

  objc_super v19 = [(ACHAchievement *)self customPlaceholderValues];
  [(ACHAchievement *)v7 setCustomPlaceholderValues:v19];

  uint64_t v20 = [(ACHAchievement *)self section];
  [(ACHAchievement *)v7 setSection:v20];

  [(ACHAchievement *)v7 setBadgeModelVersion:[(ACHAchievement *)self badgeModelVersion]];
  [(ACHAchievement *)v7 setPrerequisiteMet:[(ACHAchievement *)self prerequisiteMet]];

  return v7;
}

- (BOOL)isRingsBased
{
  uint64_t v3 = [(ACHAchievement *)self section];
  char v4 = [(id)v3 isEqualToString:@"ACTIVITY"];

  id v5 = [(ACHAchievement *)self template];
  LOWORD(v3) = [v5 triggers];

  if ((v3 & 0x3FC) != 0) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHAchievement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 decodeObjectOfClass:v5 forKey:v7];

  if ([v8 length])
  {
    id v9 = [[ACHCodableAchievement alloc] initWithData:v8];
    if (v9)
    {
      self = [(ACHAchievement *)self initWithCodable:v9];

      id v9 = (ACHCodableAchievement *)self;
    }
  }
  else
  {
    id v9 = 0;
  }

  return (ACHAchievement *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = ACHCodableFromAchievement(self);
  uint64_t v5 = [v4 data];
  if ([v5 length])
  {
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    [v8 encodeObject:v5 forKey:v7];
  }
}

- (void)setLocalizationBundleURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(ACHAchievement *)self setLocalizationBundleURLString:v4];
}

- (void)setResourceBundleURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(ACHAchievement *)self setResourceBundleURLString:v4];
}

- (void)setPropertyListBundleURL:(id)a3
{
  id v4 = [a3 absoluteString];
  [(ACHAchievement *)self setPropertyListBundleURLString:v4];
}

- (void)setRelevantEarnedInstance:(id)a3
{
}

- (void)initWithTemplate:(void *)a1 relevantEarnedInstance:(NSObject *)a2 earnedInstanceCount:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 uniqueName];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_21F582000, a2, OS_LOG_TYPE_ERROR, "Earned instance isn't associated with this template %@", (uint8_t *)&v4, 0xCu);
}

void __51__ACHAchievement_initWithTemplate_earnedInstances___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 uniqueName];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21F582000, a3, OS_LOG_TYPE_ERROR, "Earned instance not added to achievement for template %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end