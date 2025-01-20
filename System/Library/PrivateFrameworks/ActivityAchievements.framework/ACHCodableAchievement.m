@interface ACHCodableAchievement
+ (Class)badgeModelFilenamesType;
+ (Class)customPlaceholderValuesType;
+ (Class)earnedInstancesType;
+ (Class)textureFilenamesType;
- (ACHCodableAchievement)initWithSerializedData:(id)a3 error:(id *)a4;
- (ACHCodableColor)badgeEnamelColor;
- (ACHCodableColor)badgeMetalColor;
- (ACHCodableColor)enamelTriColor1;
- (ACHCodableColor)enamelTriColor2;
- (ACHCodableColor)enamelTriColor3;
- (ACHCodableEarnedInstance)relevantEarnedInstance;
- (ACHCodableSyncIdentity)syncIdentity;
- (ACHCodableTemplate)achievementTemplate;
- (BOOL)badgeUsesFullColorEnamel;
- (BOOL)badgeUsesTriColorEnamel;
- (BOOL)faceHasMetalInlay;
- (BOOL)hasAchievementTemplate;
- (BOOL)hasBadgeEnamelColor;
- (BOOL)hasBadgeMetalColor;
- (BOOL)hasBadgeModelVersion;
- (BOOL)hasBadgeShapeName;
- (BOOL)hasBadgeUsesFullColorEnamel;
- (BOOL)hasBadgeUsesTriColorEnamel;
- (BOOL)hasEarnedInstanceCount;
- (BOOL)hasEnamelTriColor1;
- (BOOL)hasEnamelTriColor2;
- (BOOL)hasEnamelTriColor3;
- (BOOL)hasFaceHasMetalInlay;
- (BOOL)hasGlyphPositionOffsetX;
- (BOOL)hasGlyphPositionOffsetY;
- (BOOL)hasGlyphTextureFilename;
- (BOOL)hasGlyphTextureScale;
- (BOOL)hasGoalUnitString;
- (BOOL)hasGoalValue;
- (BOOL)hasLocalizationBundleURL;
- (BOOL)hasPrerequisiteMet;
- (BOOL)hasProgressUnitString;
- (BOOL)hasProgressValue;
- (BOOL)hasPropertyListBundleURL;
- (BOOL)hasRelevantEarnedInstance;
- (BOOL)hasResourceBundleURL;
- (BOOL)hasSection;
- (BOOL)hasStickerBundleURL;
- (BOOL)hasSyncIdentity;
- (BOOL)hasUnearnedUsesTwoToneEnamel;
- (BOOL)isEqual:(id)a3;
- (BOOL)prerequisiteMet;
- (BOOL)readFrom:(id)a3;
- (BOOL)unearnedUsesTwoToneEnamel;
- (NSMutableArray)badgeModelFilenames;
- (NSMutableArray)customPlaceholderValues;
- (NSMutableArray)earnedInstances;
- (NSMutableArray)textureFilenames;
- (NSString)badgeShapeName;
- (NSString)glyphTextureFilename;
- (NSString)goalUnitString;
- (NSString)localizationBundleURL;
- (NSString)progressUnitString;
- (NSString)propertyListBundleURL;
- (NSString)resourceBundleURL;
- (NSString)section;
- (NSString)stickerBundleURL;
- (double)glyphPositionOffsetX;
- (double)glyphPositionOffsetY;
- (double)glyphTextureScale;
- (double)goalValue;
- (double)progressValue;
- (id)badgeModelFilenamesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customPlaceholderValuesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)earnedInstancesAtIndex:(unint64_t)a3;
- (id)textureFilenamesAtIndex:(unint64_t)a3;
- (int64_t)badgeModelVersion;
- (int64_t)earnedInstanceCount;
- (unint64_t)badgeModelFilenamesCount;
- (unint64_t)customPlaceholderValuesCount;
- (unint64_t)earnedInstancesCount;
- (unint64_t)hash;
- (unint64_t)textureFilenamesCount;
- (void)addBadgeModelFilenames:(id)a3;
- (void)addCustomPlaceholderValues:(id)a3;
- (void)addEarnedInstances:(id)a3;
- (void)addTextureFilenames:(id)a3;
- (void)clearBadgeModelFilenames;
- (void)clearCustomPlaceholderValues;
- (void)clearEarnedInstances;
- (void)clearTextureFilenames;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAchievementTemplate:(id)a3;
- (void)setBadgeEnamelColor:(id)a3;
- (void)setBadgeMetalColor:(id)a3;
- (void)setBadgeModelFilenames:(id)a3;
- (void)setBadgeModelVersion:(int64_t)a3;
- (void)setBadgeShapeName:(id)a3;
- (void)setBadgeUsesFullColorEnamel:(BOOL)a3;
- (void)setBadgeUsesTriColorEnamel:(BOOL)a3;
- (void)setCustomPlaceholderValues:(id)a3;
- (void)setEarnedInstanceCount:(int64_t)a3;
- (void)setEarnedInstances:(id)a3;
- (void)setEnamelTriColor1:(id)a3;
- (void)setEnamelTriColor2:(id)a3;
- (void)setEnamelTriColor3:(id)a3;
- (void)setFaceHasMetalInlay:(BOOL)a3;
- (void)setGlyphPositionOffsetX:(double)a3;
- (void)setGlyphPositionOffsetY:(double)a3;
- (void)setGlyphTextureFilename:(id)a3;
- (void)setGlyphTextureScale:(double)a3;
- (void)setGoalUnitString:(id)a3;
- (void)setGoalValue:(double)a3;
- (void)setHasBadgeModelVersion:(BOOL)a3;
- (void)setHasBadgeUsesFullColorEnamel:(BOOL)a3;
- (void)setHasBadgeUsesTriColorEnamel:(BOOL)a3;
- (void)setHasEarnedInstanceCount:(BOOL)a3;
- (void)setHasFaceHasMetalInlay:(BOOL)a3;
- (void)setHasGlyphPositionOffsetX:(BOOL)a3;
- (void)setHasGlyphPositionOffsetY:(BOOL)a3;
- (void)setHasGlyphTextureScale:(BOOL)a3;
- (void)setHasGoalValue:(BOOL)a3;
- (void)setHasPrerequisiteMet:(BOOL)a3;
- (void)setHasProgressValue:(BOOL)a3;
- (void)setHasUnearnedUsesTwoToneEnamel:(BOOL)a3;
- (void)setLocalizationBundleURL:(id)a3;
- (void)setPrerequisiteMet:(BOOL)a3;
- (void)setProgressUnitString:(id)a3;
- (void)setProgressValue:(double)a3;
- (void)setPropertyListBundleURL:(id)a3;
- (void)setRelevantEarnedInstance:(id)a3;
- (void)setResourceBundleURL:(id)a3;
- (void)setSection:(id)a3;
- (void)setStickerBundleURL:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTextureFilenames:(id)a3;
- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ACHCodableAchievement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureFilenames, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_stickerBundleURL, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_resourceBundleURL, 0);
  objc_storeStrong((id *)&self->_relevantEarnedInstance, 0);
  objc_storeStrong((id *)&self->_propertyListBundleURL, 0);
  objc_storeStrong((id *)&self->_progressUnitString, 0);
  objc_storeStrong((id *)&self->_localizationBundleURL, 0);
  objc_storeStrong((id *)&self->_goalUnitString, 0);
  objc_storeStrong((id *)&self->_glyphTextureFilename, 0);
  objc_storeStrong((id *)&self->_enamelTriColor3, 0);
  objc_storeStrong((id *)&self->_enamelTriColor2, 0);
  objc_storeStrong((id *)&self->_enamelTriColor1, 0);
  objc_storeStrong((id *)&self->_earnedInstances, 0);
  objc_storeStrong((id *)&self->_customPlaceholderValues, 0);
  objc_storeStrong((id *)&self->_badgeShapeName, 0);
  objc_storeStrong((id *)&self->_badgeModelFilenames, 0);
  objc_storeStrong((id *)&self->_badgeMetalColor, 0);
  objc_storeStrong((id *)&self->_badgeEnamelColor, 0);

  objc_storeStrong((id *)&self->_achievementTemplate, 0);
}

- (BOOL)badgeUsesTriColorEnamel
{
  return self->_badgeUsesTriColorEnamel;
}

- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unearnedUsesTwoToneEnamel = a3;
}

- (void)setTextureFilenames:(id)a3
{
}

- (void)setStickerBundleURL:(id)a3
{
}

- (void)setSection:(id)a3
{
}

- (void)setResourceBundleURL:(id)a3
{
}

- (void)setPropertyListBundleURL:(id)a3
{
}

- (void)setPrerequisiteMet:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_prerequisiteMet = a3;
}

- (void)setLocalizationBundleURL:(id)a3
{
}

- (void)setGlyphTextureScale:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_glyphTextureScale = a3;
}

- (void)setGlyphTextureFilename:(id)a3
{
}

- (void)setGlyphPositionOffsetY:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_glyphPositionOffsetY = a3;
}

- (void)setGlyphPositionOffsetX:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_glyphPositionOffsetX = a3;
}

- (void)setFaceHasMetalInlay:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_faceHasMetalInlay = a3;
}

- (void)setEarnedInstances:(id)a3
{
}

- (void)setEarnedInstanceCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_earnedInstanceCount = a3;
}

- (void)setBadgeUsesTriColorEnamel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_badgeUsesTriColorEnamel = a3;
}

- (void)setBadgeUsesFullColorEnamel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_badgeUsesFullColorEnamel = a3;
}

- (void)setBadgeShapeName:(id)a3
{
}

- (void)setBadgeModelVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_badgeModelVersion = a3;
}

- (void)setBadgeModelFilenames:(id)a3
{
}

- (void)setBadgeMetalColor:(id)a3
{
}

- (void)setBadgeEnamelColor:(id)a3
{
}

- (void)setAchievementTemplate:(id)a3
{
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_achievementTemplate) {
    PBDataWriterWriteSubmessage();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v5 = self->_earnedInstances;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v7);
  }

  if (self->_localizationBundleURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_resourceBundleURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_stickerBundleURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_badgeShapeName) {
    PBDataWriterWriteStringField();
  }
  if (self->_badgeMetalColor) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_badgeEnamelColor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_propertyListBundleURL) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_progressUnitString) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_goalUnitString) {
    PBDataWriterWriteStringField();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v10 = self->_customPlaceholderValues;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v12);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v15 = self->_textureFilenames;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_section) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_enamelTriColor1) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_enamelTriColor2) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_enamelTriColor3) {
    PBDataWriterWriteSubmessage();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_relevantEarnedInstance) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v21 = self->_badgeModelFilenames;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v23);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_glyphTextureFilename) {
    PBDataWriterWriteStringField();
  }
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v26 = (__int16)self->_has;
  }
  if ((v26 & 8) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)unearnedUsesTwoToneEnamel
{
  return self->_unearnedUsesTwoToneEnamel;
}

- (NSMutableArray)textureFilenames
{
  return self->_textureFilenames;
}

- (NSString)section
{
  return self->_section;
}

- (NSString)resourceBundleURL
{
  return self->_resourceBundleURL;
}

- (NSString)propertyListBundleURL
{
  return self->_propertyListBundleURL;
}

- (BOOL)prerequisiteMet
{
  return self->_prerequisiteMet;
}

- (NSString)localizationBundleURL
{
  return self->_localizationBundleURL;
}

- (BOOL)hasStickerBundleURL
{
  return self->_stickerBundleURL != 0;
}

- (BOOL)hasResourceBundleURL
{
  return self->_resourceBundleURL != 0;
}

- (BOOL)hasRelevantEarnedInstance
{
  return self->_relevantEarnedInstance != 0;
}

- (BOOL)hasPropertyListBundleURL
{
  return self->_propertyListBundleURL != 0;
}

- (BOOL)hasProgressValue
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasLocalizationBundleURL
{
  return self->_localizationBundleURL != 0;
}

- (BOOL)hasGoalValue
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasEarnedInstanceCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasBadgeModelVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasBadgeMetalColor
{
  return self->_badgeMetalColor != 0;
}

- (double)glyphTextureScale
{
  return self->_glyphTextureScale;
}

- (NSString)glyphTextureFilename
{
  return self->_glyphTextureFilename;
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

- (NSMutableArray)earnedInstances
{
  return self->_earnedInstances;
}

- (int64_t)earnedInstanceCount
{
  return self->_earnedInstanceCount;
}

- (unint64_t)customPlaceholderValuesCount
{
  return [(NSMutableArray *)self->_customPlaceholderValues count];
}

- (BOOL)badgeUsesFullColorEnamel
{
  return self->_badgeUsesFullColorEnamel;
}

- (NSString)badgeShapeName
{
  return self->_badgeShapeName;
}

- (int64_t)badgeModelVersion
{
  return self->_badgeModelVersion;
}

- (NSMutableArray)badgeModelFilenames
{
  return self->_badgeModelFilenames;
}

- (ACHCodableColor)badgeMetalColor
{
  return self->_badgeMetalColor;
}

- (ACHCodableColor)badgeEnamelColor
{
  return self->_badgeEnamelColor;
}

- (ACHCodableTemplate)achievementTemplate
{
  return self->_achievementTemplate;
}

- (BOOL)hasBadgeEnamelColor
{
  return self->_badgeEnamelColor != 0;
}

- (void)setProgressValue:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_progressValue = a3;
}

- (void)setProgressUnitString:(id)a3
{
}

- (void)setGoalValue:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_goalValue = a3;
}

- (void)setGoalUnitString:(id)a3
{
}

- (double)progressValue
{
  return self->_progressValue;
}

- (NSString)progressUnitString
{
  return self->_progressUnitString;
}

- (BOOL)hasProgressUnitString
{
  return self->_progressUnitString != 0;
}

- (BOOL)hasGoalUnitString
{
  return self->_goalUnitString != 0;
}

- (double)goalValue
{
  return self->_goalValue;
}

- (NSString)goalUnitString
{
  return self->_goalUnitString;
}

- (void)setEnamelTriColor3:(id)a3
{
}

- (void)setEnamelTriColor2:(id)a3
{
}

- (void)setEnamelTriColor1:(id)a3
{
}

- (BOOL)hasEnamelTriColor3
{
  return self->_enamelTriColor3 != 0;
}

- (BOOL)hasEnamelTriColor2
{
  return self->_enamelTriColor2 != 0;
}

- (BOOL)hasEnamelTriColor1
{
  return self->_enamelTriColor1 != 0;
}

- (ACHCodableColor)enamelTriColor3
{
  return self->_enamelTriColor3;
}

- (ACHCodableColor)enamelTriColor2
{
  return self->_enamelTriColor2;
}

- (ACHCodableColor)enamelTriColor1
{
  return self->_enamelTriColor1;
}

- (void)setCustomPlaceholderValues:(id)a3
{
}

- (void)addBadgeModelFilenames:(id)a3
{
  id v4 = a3;
  badgeModelFilenames = self->_badgeModelFilenames;
  id v8 = v4;
  if (!badgeModelFilenames)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_badgeModelFilenames;
    self->_badgeModelFilenames = v6;

    id v4 = v8;
    badgeModelFilenames = self->_badgeModelFilenames;
  }
  [(NSMutableArray *)badgeModelFilenames addObject:v4];
}

- (void)addTextureFilenames:(id)a3
{
  id v4 = a3;
  textureFilenames = self->_textureFilenames;
  id v8 = v4;
  if (!textureFilenames)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_textureFilenames;
    self->_textureFilenames = v6;

    id v4 = v8;
    textureFilenames = self->_textureFilenames;
  }
  [(NSMutableArray *)textureFilenames addObject:v4];
}

- (BOOL)hasAchievementTemplate
{
  return self->_achievementTemplate != 0;
}

- (void)clearEarnedInstances
{
}

- (void)addEarnedInstances:(id)a3
{
  id v4 = a3;
  earnedInstances = self->_earnedInstances;
  id v8 = v4;
  if (!earnedInstances)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_earnedInstances;
    self->_earnedInstances = v6;

    id v4 = v8;
    earnedInstances = self->_earnedInstances;
  }
  [(NSMutableArray *)earnedInstances addObject:v4];
}

- (unint64_t)earnedInstancesCount
{
  return [(NSMutableArray *)self->_earnedInstances count];
}

- (id)earnedInstancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_earnedInstances objectAtIndex:a3];
}

+ (Class)earnedInstancesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBadgeShapeName
{
  return self->_badgeShapeName != 0;
}

- (void)setHasBadgeUsesFullColorEnamel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasBadgeUsesFullColorEnamel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasProgressValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setHasGoalValue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)clearCustomPlaceholderValues
{
}

- (void)addCustomPlaceholderValues:(id)a3
{
  id v4 = a3;
  customPlaceholderValues = self->_customPlaceholderValues;
  id v8 = v4;
  if (!customPlaceholderValues)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_customPlaceholderValues;
    self->_customPlaceholderValues = v6;

    id v4 = v8;
    customPlaceholderValues = self->_customPlaceholderValues;
  }
  [(NSMutableArray *)customPlaceholderValues addObject:v4];
}

- (id)customPlaceholderValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_customPlaceholderValues objectAtIndex:a3];
}

+ (Class)customPlaceholderValuesType
{
  return (Class)objc_opt_class();
}

- (void)clearTextureFilenames
{
}

- (unint64_t)textureFilenamesCount
{
  return [(NSMutableArray *)self->_textureFilenames count];
}

- (id)textureFilenamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_textureFilenames objectAtIndex:a3];
}

+ (Class)textureFilenamesType
{
  return (Class)objc_opt_class();
}

- (void)setHasUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUnearnedUsesTwoToneEnamel
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasSection
{
  return self->_section != 0;
}

- (void)setHasFaceHasMetalInlay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasFaceHasMetalInlay
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasBadgeUsesTriColorEnamel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasBadgeUsesTriColorEnamel
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setHasBadgeModelVersion:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setHasEarnedInstanceCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)clearBadgeModelFilenames
{
}

- (unint64_t)badgeModelFilenamesCount
{
  return [(NSMutableArray *)self->_badgeModelFilenames count];
}

- (id)badgeModelFilenamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_badgeModelFilenames objectAtIndex:a3];
}

+ (Class)badgeModelFilenamesType
{
  return (Class)objc_opt_class();
}

- (void)setHasGlyphTextureScale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGlyphTextureScale
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasGlyphTextureFilename
{
  return self->_glyphTextureFilename != 0;
}

- (void)setHasGlyphPositionOffsetX:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGlyphPositionOffsetX
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasGlyphPositionOffsetY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGlyphPositionOffsetY
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (void)setHasPrerequisiteMet:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasPrerequisiteMet
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ACHCodableAchievement;
  id v4 = [(ACHCodableAchievement *)&v8 description];
  v5 = [(ACHCodableAchievement *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  achievementTemplate = self->_achievementTemplate;
  if (achievementTemplate)
  {
    v5 = [(ACHCodableTemplate *)achievementTemplate dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"achievementTemplate"];
  }
  if ([(NSMutableArray *)self->_earnedInstances count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_earnedInstances, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v7 = self->_earnedInstances;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v66 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v65 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"earnedInstances"];
  }
  localizationBundleURL = self->_localizationBundleURL;
  if (localizationBundleURL) {
    [v3 setObject:localizationBundleURL forKey:@"localizationBundleURL"];
  }
  resourceBundleURL = self->_resourceBundleURL;
  if (resourceBundleURL) {
    [v3 setObject:resourceBundleURL forKey:@"resourceBundleURL"];
  }
  stickerBundleURL = self->_stickerBundleURL;
  if (stickerBundleURL) {
    [v3 setObject:stickerBundleURL forKey:@"stickerBundleURL"];
  }
  badgeShapeName = self->_badgeShapeName;
  if (badgeShapeName) {
    [v3 setObject:badgeShapeName forKey:@"badgeShapeName"];
  }
  badgeMetalColor = self->_badgeMetalColor;
  if (badgeMetalColor)
  {
    uint64_t v18 = [(ACHCodableColor *)badgeMetalColor dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"badgeMetalColor"];
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_badgeUsesFullColorEnamel];
    [v3 setObject:v19 forKey:@"badgeUsesFullColorEnamel"];
  }
  badgeEnamelColor = self->_badgeEnamelColor;
  if (badgeEnamelColor)
  {
    v21 = [(ACHCodableColor *)badgeEnamelColor dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"badgeEnamelColor"];
  }
  propertyListBundleURL = self->_propertyListBundleURL;
  if (propertyListBundleURL) {
    [v3 setObject:propertyListBundleURL forKey:@"propertyListBundleURL"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    uint64_t v23 = [NSNumber numberWithDouble:self->_progressValue];
    [v3 setObject:v23 forKey:@"progressValue"];
  }
  progressUnitString = self->_progressUnitString;
  if (progressUnitString) {
    [v3 setObject:progressUnitString forKey:@"progressUnitString"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v25 = [NSNumber numberWithDouble:self->_goalValue];
    [v3 setObject:v25 forKey:@"goalValue"];
  }
  goalUnitString = self->_goalUnitString;
  if (goalUnitString) {
    [v3 setObject:goalUnitString forKey:@"goalUnitString"];
  }
  if ([(NSMutableArray *)self->_customPlaceholderValues count])
  {
    long long v27 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_customPlaceholderValues, "count"));
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v28 = self->_customPlaceholderValues;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v62 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * j), "dictionaryRepresentation", (void)v61);
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"customPlaceholderValues"];
  }
  textureFilenames = self->_textureFilenames;
  if (textureFilenames) {
    [v3 setObject:textureFilenames forKey:@"textureFilenames"];
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    long long v35 = [NSNumber numberWithBool:self->_unearnedUsesTwoToneEnamel];
    [v3 setObject:v35 forKey:@"unearnedUsesTwoToneEnamel"];
  }
  section = self->_section;
  if (section) {
    [v3 setObject:section forKey:@"section"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    long long v38 = [NSNumber numberWithBool:self->_faceHasMetalInlay];
    [v3 setObject:v38 forKey:@"faceHasMetalInlay"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    long long v39 = [NSNumber numberWithBool:self->_badgeUsesTriColorEnamel];
    [v3 setObject:v39 forKey:@"badgeUsesTriColorEnamel"];
  }
  enamelTriColor1 = self->_enamelTriColor1;
  if (enamelTriColor1)
  {
    long long v41 = [(ACHCodableColor *)enamelTriColor1 dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"enamelTriColor1"];
  }
  enamelTriColor2 = self->_enamelTriColor2;
  if (enamelTriColor2)
  {
    v43 = [(ACHCodableColor *)enamelTriColor2 dictionaryRepresentation];
    [v3 setObject:v43 forKey:@"enamelTriColor2"];
  }
  enamelTriColor3 = self->_enamelTriColor3;
  if (enamelTriColor3)
  {
    v45 = [(ACHCodableColor *)enamelTriColor3 dictionaryRepresentation];
    [v3 setObject:v45 forKey:@"enamelTriColor3"];
  }
  if (*(_WORD *)&self->_has)
  {
    v46 = [NSNumber numberWithLongLong:self->_badgeModelVersion];
    [v3 setObject:v46 forKey:@"badgeModelVersion"];
  }
  relevantEarnedInstance = self->_relevantEarnedInstance;
  if (relevantEarnedInstance)
  {
    v48 = [(ACHCodableEarnedInstance *)relevantEarnedInstance dictionaryRepresentation];
    [v3 setObject:v48 forKey:@"relevantEarnedInstance"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v49 = [NSNumber numberWithLongLong:self->_earnedInstanceCount];
    [v3 setObject:v49 forKey:@"earnedInstanceCount"];
  }
  badgeModelFilenames = self->_badgeModelFilenames;
  if (badgeModelFilenames) {
    [v3 setObject:badgeModelFilenames forKey:@"badgeModelFilenames"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v51 = [NSNumber numberWithDouble:self->_glyphTextureScale];
    [v3 setObject:v51 forKey:@"glyphTextureScale"];
  }
  glyphTextureFilename = self->_glyphTextureFilename;
  if (glyphTextureFilename) {
    [v3 setObject:glyphTextureFilename forKey:@"glyphTextureFilename"];
  }
  __int16 v53 = (__int16)self->_has;
  if ((v53 & 4) != 0)
  {
    v54 = [NSNumber numberWithDouble:self->_glyphPositionOffsetX];
    [v3 setObject:v54 forKey:@"glyphPositionOffsetX"];

    __int16 v53 = (__int16)self->_has;
  }
  if ((v53 & 8) != 0)
  {
    v55 = [NSNumber numberWithDouble:self->_glyphPositionOffsetY];
    [v3 setObject:v55 forKey:@"glyphPositionOffsetY"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v57 = [(ACHCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v3 setObject:v57 forKey:@"syncIdentity"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v58 = [NSNumber numberWithBool:self->_prerequisiteMet];
    [v3 setObject:v58 forKey:@"prerequisiteMet"];
  }
  id v59 = v3;

  return v59;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableAchievementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v25 = a3;
  if (self->_achievementTemplate) {
    objc_msgSend(v25, "setAchievementTemplate:");
  }
  if ([(ACHCodableAchievement *)self earnedInstancesCount])
  {
    [v25 clearEarnedInstances];
    unint64_t v4 = [(ACHCodableAchievement *)self earnedInstancesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ACHCodableAchievement *)self earnedInstancesAtIndex:i];
        [v25 addEarnedInstances:v7];
      }
    }
  }
  if (self->_localizationBundleURL) {
    objc_msgSend(v25, "setLocalizationBundleURL:");
  }
  uint64_t v8 = v25;
  if (self->_resourceBundleURL)
  {
    objc_msgSend(v25, "setResourceBundleURL:");
    uint64_t v8 = v25;
  }
  if (self->_stickerBundleURL)
  {
    objc_msgSend(v25, "setStickerBundleURL:");
    uint64_t v8 = v25;
  }
  if (self->_badgeShapeName)
  {
    objc_msgSend(v25, "setBadgeShapeName:");
    uint64_t v8 = v25;
  }
  if (self->_badgeMetalColor)
  {
    objc_msgSend(v25, "setBadgeMetalColor:");
    uint64_t v8 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v8[232] = self->_badgeUsesFullColorEnamel;
    *((_WORD *)v8 + 120) |= 0x80u;
  }
  if (self->_badgeEnamelColor)
  {
    objc_msgSend(v25, "setBadgeEnamelColor:");
    uint64_t v8 = v25;
  }
  if (self->_propertyListBundleURL)
  {
    objc_msgSend(v25, "setPropertyListBundleURL:");
    uint64_t v8 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *((void *)v8 + 7) = *(void *)&self->_progressValue;
    *((_WORD *)v8 + 120) |= 0x40u;
  }
  if (self->_progressUnitString)
  {
    objc_msgSend(v25, "setProgressUnitString:");
    uint64_t v8 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((void *)v8 + 6) = *(void *)&self->_goalValue;
    *((_WORD *)v8 + 120) |= 0x20u;
  }
  if (self->_goalUnitString) {
    objc_msgSend(v25, "setGoalUnitString:");
  }
  if ([(ACHCodableAchievement *)self customPlaceholderValuesCount])
  {
    [v25 clearCustomPlaceholderValues];
    unint64_t v9 = [(ACHCodableAchievement *)self customPlaceholderValuesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(ACHCodableAchievement *)self customPlaceholderValuesAtIndex:j];
        [v25 addCustomPlaceholderValues:v12];
      }
    }
  }
  if ([(ACHCodableAchievement *)self textureFilenamesCount])
  {
    [v25 clearTextureFilenames];
    unint64_t v13 = [(ACHCodableAchievement *)self textureFilenamesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(ACHCodableAchievement *)self textureFilenamesAtIndex:k];
        [v25 addTextureFilenames:v16];
      }
    }
  }
  uint64_t v17 = v25;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((unsigned char *)v25 + 236) = self->_unearnedUsesTwoToneEnamel;
    *((_WORD *)v25 + 120) |= 0x800u;
  }
  if (self->_section)
  {
    objc_msgSend(v25, "setSection:");
    uint64_t v17 = v25;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v17[234] = self->_faceHasMetalInlay;
    *((_WORD *)v17 + 120) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    v17[233] = self->_badgeUsesTriColorEnamel;
    *((_WORD *)v17 + 120) |= 0x100u;
  }
  if (self->_enamelTriColor1)
  {
    objc_msgSend(v25, "setEnamelTriColor1:");
    uint64_t v17 = v25;
  }
  if (self->_enamelTriColor2)
  {
    objc_msgSend(v25, "setEnamelTriColor2:");
    uint64_t v17 = v25;
  }
  if (self->_enamelTriColor3)
  {
    objc_msgSend(v25, "setEnamelTriColor3:");
    uint64_t v17 = v25;
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)v17 + 1) = self->_badgeModelVersion;
    *((_WORD *)v17 + 120) |= 1u;
  }
  if (self->_relevantEarnedInstance)
  {
    objc_msgSend(v25, "setRelevantEarnedInstance:");
    uint64_t v17 = v25;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((void *)v17 + 2) = self->_earnedInstanceCount;
    *((_WORD *)v17 + 120) |= 2u;
  }
  if ([(ACHCodableAchievement *)self badgeModelFilenamesCount])
  {
    [v25 clearBadgeModelFilenames];
    unint64_t v19 = [(ACHCodableAchievement *)self badgeModelFilenamesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        uint64_t v22 = [(ACHCodableAchievement *)self badgeModelFilenamesAtIndex:m];
        [v25 addBadgeModelFilenames:v22];
      }
    }
  }
  uint64_t v23 = v25;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((void *)v25 + 5) = *(void *)&self->_glyphTextureScale;
    *((_WORD *)v25 + 120) |= 0x10u;
  }
  if (self->_glyphTextureFilename)
  {
    objc_msgSend(v25, "setGlyphTextureFilename:");
    uint64_t v23 = v25;
  }
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 4) != 0)
  {
    v23[3] = *(void *)&self->_glyphPositionOffsetX;
    *((_WORD *)v23 + 120) |= 4u;
    __int16 v24 = (__int16)self->_has;
  }
  if ((v24 & 8) != 0)
  {
    v23[4] = *(void *)&self->_glyphPositionOffsetY;
    *((_WORD *)v23 + 120) |= 8u;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v25, "setSyncIdentity:");
    uint64_t v23 = v25;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *((unsigned char *)v23 + 235) = self->_prerequisiteMet;
    *((_WORD *)v23 + 120) |= 0x400u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ACHCodableTemplate *)self->_achievementTemplate copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v8 = self->_earnedInstances;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v79 objects:v86 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v80 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v79 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEarnedInstances:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v79 objects:v86 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_localizationBundleURL copyWithZone:a3];
  v15 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v14;

  uint64_t v16 = [(NSString *)self->_resourceBundleURL copyWithZone:a3];
  uint64_t v17 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v16;

  uint64_t v18 = [(NSString *)self->_stickerBundleURL copyWithZone:a3];
  unint64_t v19 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v18;

  uint64_t v20 = [(NSString *)self->_badgeShapeName copyWithZone:a3];
  v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  id v22 = [(ACHCodableColor *)self->_badgeMetalColor copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v22;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 232) = self->_badgeUsesFullColorEnamel;
    *(_WORD *)(v5 + 240) |= 0x80u;
  }
  id v24 = [(ACHCodableColor *)self->_badgeEnamelColor copyWithZone:a3];
  id v25 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v24;

  uint64_t v26 = [(NSString *)self->_propertyListBundleURL copyWithZone:a3];
  long long v27 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v26;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_progressValue;
    *(_WORD *)(v5 + 240) |= 0x40u;
  }
  uint64_t v28 = [(NSString *)self->_progressUnitString copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v28;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_goalValue;
    *(_WORD *)(v5 + 240) |= 0x20u;
  }
  uint64_t v30 = [(NSString *)self->_goalUnitString copyWithZone:a3];
  uint64_t v31 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v30;

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v32 = self->_customPlaceholderValues;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v76 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v75 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addCustomPlaceholderValues:v37];
      }
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v34);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v38 = self->_textureFilenames;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v71 objects:v84 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v40; ++k)
      {
        if (*(void *)v72 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = (void *)[*(id *)(*((void *)&v71 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addTextureFilenames:v43];
      }
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v71 objects:v84 count:16];
    }
    while (v40);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(unsigned char *)(v5 + 236) = self->_unearnedUsesTwoToneEnamel;
    *(_WORD *)(v5 + 240) |= 0x800u;
  }
  uint64_t v44 = [(NSString *)self->_section copyWithZone:a3];
  v45 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v44;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 234) = self->_faceHasMetalInlay;
    *(_WORD *)(v5 + 240) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 233) = self->_badgeUsesTriColorEnamel;
    *(_WORD *)(v5 + 240) |= 0x100u;
  }
  id v47 = [(ACHCodableColor *)self->_enamelTriColor1 copyWithZone:a3];
  v48 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v47;

  id v49 = [(ACHCodableColor *)self->_enamelTriColor2 copyWithZone:a3];
  v50 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v49;

  id v51 = [(ACHCodableColor *)self->_enamelTriColor3 copyWithZone:a3];
  v52 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v51;

  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_badgeModelVersion;
    *(_WORD *)(v5 + 240) |= 1u;
  }
  id v53 = [(ACHCodableEarnedInstance *)self->_relevantEarnedInstance copyWithZone:a3];
  v54 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v53;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_earnedInstanceCount;
    *(_WORD *)(v5 + 240) |= 2u;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v55 = self->_badgeModelFilenames;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v68;
    do
    {
      for (uint64_t m = 0; m != v57; ++m)
      {
        if (*(void *)v68 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * m), "copyWithZone:", a3, (void)v67);
        [(id)v5 addBadgeModelFilenames:v60];
      }
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
    }
    while (v57);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_glyphTextureScale;
    *(_WORD *)(v5 + 240) |= 0x10u;
  }
  uint64_t v61 = -[NSString copyWithZone:](self->_glyphTextureFilename, "copyWithZone:", a3, (void)v67);
  long long v62 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v61;

  __int16 v63 = (__int16)self->_has;
  if ((v63 & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_glyphPositionOffsetX;
    *(_WORD *)(v5 + 240) |= 4u;
    __int16 v63 = (__int16)self->_has;
  }
  if ((v63 & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_glyphPositionOffsetY;
    *(_WORD *)(v5 + 240) |= 8u;
  }
  id v64 = [(ACHCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  long long v65 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v64;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 235) = self->_prerequisiteMet;
    *(_WORD *)(v5 + 240) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_120;
  }
  achievementTemplate = self->_achievementTemplate;
  if ((unint64_t)achievementTemplate | *((void *)v4 + 8))
  {
    if (!-[ACHCodableTemplate isEqual:](achievementTemplate, "isEqual:")) {
      goto LABEL_120;
    }
  }
  earnedInstances = self->_earnedInstances;
  if ((unint64_t)earnedInstances | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](earnedInstances, "isEqual:")) {
      goto LABEL_120;
    }
  }
  localizationBundleURL = self->_localizationBundleURL;
  if ((unint64_t)localizationBundleURL | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](localizationBundleURL, "isEqual:")) {
      goto LABEL_120;
    }
  }
  resourceBundleURL = self->_resourceBundleURL;
  if ((unint64_t)resourceBundleURL | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](resourceBundleURL, "isEqual:")) {
      goto LABEL_120;
    }
  }
  stickerBundleURL = self->_stickerBundleURL;
  if ((unint64_t)stickerBundleURL | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](stickerBundleURL, "isEqual:")) {
      goto LABEL_120;
    }
  }
  badgeShapeName = self->_badgeShapeName;
  if ((unint64_t)badgeShapeName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](badgeShapeName, "isEqual:")) {
      goto LABEL_120;
    }
  }
  badgeMetalColor = self->_badgeMetalColor;
  if ((unint64_t)badgeMetalColor | *((void *)v4 + 10))
  {
    if (!-[ACHCodableColor isEqual:](badgeMetalColor, "isEqual:")) {
      goto LABEL_120;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 120);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0) {
      goto LABEL_120;
    }
    if (self->_badgeUsesFullColorEnamel)
    {
      if (!*((unsigned char *)v4 + 232)) {
        goto LABEL_120;
      }
    }
    else if (*((unsigned char *)v4 + 232))
    {
      goto LABEL_120;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_120;
  }
  badgeEnamelColor = self->_badgeEnamelColor;
  if ((unint64_t)badgeEnamelColor | *((void *)v4 + 9)
    && !-[ACHCodableColor isEqual:](badgeEnamelColor, "isEqual:"))
  {
    goto LABEL_120;
  }
  propertyListBundleURL = self->_propertyListBundleURL;
  if ((unint64_t)propertyListBundleURL | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](propertyListBundleURL, "isEqual:")) {
      goto LABEL_120;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v16 = *((_WORD *)v4 + 120);
  if ((has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_progressValue != *((double *)v4 + 7)) {
      goto LABEL_120;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_120;
  }
  progressUnitString = self->_progressUnitString;
  if ((unint64_t)progressUnitString | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](progressUnitString, "isEqual:")) {
      goto LABEL_120;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v18 = *((_WORD *)v4 + 120);
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_goalValue != *((double *)v4 + 6)) {
      goto LABEL_120;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_120;
  }
  goalUnitString = self->_goalUnitString;
  if ((unint64_t)goalUnitString | *((void *)v4 + 19)
    && !-[NSString isEqual:](goalUnitString, "isEqual:"))
  {
    goto LABEL_120;
  }
  customPlaceholderValues = self->_customPlaceholderValues;
  if ((unint64_t)customPlaceholderValues | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](customPlaceholderValues, "isEqual:")) {
      goto LABEL_120;
    }
  }
  textureFilenames = self->_textureFilenames;
  if ((unint64_t)textureFilenames | *((void *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](textureFilenames, "isEqual:")) {
      goto LABEL_120;
    }
  }
  __int16 v22 = (__int16)self->_has;
  if ((v22 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x800) == 0) {
      goto LABEL_120;
    }
    if (self->_unearnedUsesTwoToneEnamel)
    {
      if (!*((unsigned char *)v4 + 236)) {
        goto LABEL_120;
      }
    }
    else if (*((unsigned char *)v4 + 236))
    {
      goto LABEL_120;
    }
  }
  else if ((*((_WORD *)v4 + 120) & 0x800) != 0)
  {
    goto LABEL_120;
  }
  section = self->_section;
  if ((unint64_t)section | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](section, "isEqual:")) {
      goto LABEL_120;
    }
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x200) == 0) {
      goto LABEL_120;
    }
    if (self->_faceHasMetalInlay)
    {
      if (!*((unsigned char *)v4 + 234)) {
        goto LABEL_120;
      }
    }
    else if (*((unsigned char *)v4 + 234))
    {
      goto LABEL_120;
    }
  }
  else if ((*((_WORD *)v4 + 120) & 0x200) != 0)
  {
    goto LABEL_120;
  }
  if ((v22 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x100) == 0) {
      goto LABEL_120;
    }
    if (self->_badgeUsesTriColorEnamel)
    {
      if (!*((unsigned char *)v4 + 233)) {
        goto LABEL_120;
      }
    }
    else if (*((unsigned char *)v4 + 233))
    {
      goto LABEL_120;
    }
  }
  else if ((*((_WORD *)v4 + 120) & 0x100) != 0)
  {
    goto LABEL_120;
  }
  enamelTriColor1 = self->_enamelTriColor1;
  if ((unint64_t)enamelTriColor1 | *((void *)v4 + 15)
    && !-[ACHCodableColor isEqual:](enamelTriColor1, "isEqual:"))
  {
    goto LABEL_120;
  }
  enamelTriColor2 = self->_enamelTriColor2;
  if ((unint64_t)enamelTriColor2 | *((void *)v4 + 16))
  {
    if (!-[ACHCodableColor isEqual:](enamelTriColor2, "isEqual:")) {
      goto LABEL_120;
    }
  }
  enamelTriColor3 = self->_enamelTriColor3;
  if ((unint64_t)enamelTriColor3 | *((void *)v4 + 17))
  {
    if (!-[ACHCodableColor isEqual:](enamelTriColor3, "isEqual:")) {
      goto LABEL_120;
    }
  }
  __int16 v27 = (__int16)self->_has;
  __int16 v28 = *((_WORD *)v4 + 120);
  if (v27)
  {
    if ((v28 & 1) == 0 || self->_badgeModelVersion != *((void *)v4 + 1)) {
      goto LABEL_120;
    }
  }
  else if (v28)
  {
    goto LABEL_120;
  }
  relevantEarnedInstance = self->_relevantEarnedInstance;
  if ((unint64_t)relevantEarnedInstance | *((void *)v4 + 23))
  {
    if (!-[ACHCodableEarnedInstance isEqual:](relevantEarnedInstance, "isEqual:")) {
      goto LABEL_120;
    }
    __int16 v27 = (__int16)self->_has;
  }
  __int16 v30 = *((_WORD *)v4 + 120);
  if ((v27 & 2) != 0)
  {
    if ((v30 & 2) == 0 || self->_earnedInstanceCount != *((void *)v4 + 2)) {
      goto LABEL_120;
    }
  }
  else if ((v30 & 2) != 0)
  {
    goto LABEL_120;
  }
  badgeModelFilenames = self->_badgeModelFilenames;
  if ((unint64_t)badgeModelFilenames | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](badgeModelFilenames, "isEqual:")) {
      goto LABEL_120;
    }
    __int16 v27 = (__int16)self->_has;
  }
  __int16 v32 = *((_WORD *)v4 + 120);
  if ((v27 & 0x10) != 0)
  {
    if ((v32 & 0x10) == 0 || self->_glyphTextureScale != *((double *)v4 + 5)) {
      goto LABEL_120;
    }
  }
  else if ((v32 & 0x10) != 0)
  {
    goto LABEL_120;
  }
  glyphTextureFilename = self->_glyphTextureFilename;
  if ((unint64_t)glyphTextureFilename | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](glyphTextureFilename, "isEqual:")) {
      goto LABEL_120;
    }
    __int16 v27 = (__int16)self->_has;
  }
  __int16 v34 = *((_WORD *)v4 + 120);
  if ((v27 & 4) != 0)
  {
    if ((v34 & 4) == 0 || self->_glyphPositionOffsetX != *((double *)v4 + 3)) {
      goto LABEL_120;
    }
  }
  else if ((v34 & 4) != 0)
  {
    goto LABEL_120;
  }
  if ((v27 & 8) != 0)
  {
    if ((v34 & 8) == 0 || self->_glyphPositionOffsetY != *((double *)v4 + 4)) {
      goto LABEL_120;
    }
  }
  else if ((v34 & 8) != 0)
  {
    goto LABEL_120;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 27))
  {
    if (!-[ACHCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_120;
    }
    __int16 v27 = (__int16)self->_has;
  }
  if ((v27 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 120) & 0x400) != 0)
    {
      if (self->_prerequisiteMet)
      {
        if (!*((unsigned char *)v4 + 235)) {
          goto LABEL_120;
        }
      }
      else if (*((unsigned char *)v4 + 235))
      {
        goto LABEL_120;
      }
      BOOL v36 = 1;
      goto LABEL_121;
    }
LABEL_120:
    BOOL v36 = 0;
    goto LABEL_121;
  }
  BOOL v36 = (*((_WORD *)v4 + 120) & 0x400) == 0;
LABEL_121:

  return v36;
}

- (unint64_t)hash
{
  unint64_t v65 = [(ACHCodableTemplate *)self->_achievementTemplate hash];
  uint64_t v64 = [(NSMutableArray *)self->_earnedInstances hash];
  NSUInteger v63 = [(NSString *)self->_localizationBundleURL hash];
  NSUInteger v62 = [(NSString *)self->_resourceBundleURL hash];
  NSUInteger v61 = [(NSString *)self->_stickerBundleURL hash];
  NSUInteger v60 = [(NSString *)self->_badgeShapeName hash];
  unint64_t v59 = [(ACHCodableColor *)self->_badgeMetalColor hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v58 = 2654435761 * self->_badgeUsesFullColorEnamel;
  }
  else {
    uint64_t v58 = 0;
  }
  unint64_t v57 = [(ACHCodableColor *)self->_badgeEnamelColor hash];
  NSUInteger v56 = [(NSString *)self->_propertyListBundleURL hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    double progressValue = self->_progressValue;
    double v4 = -progressValue;
    if (progressValue >= 0.0) {
      double v4 = self->_progressValue;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v55 = v10;
  }
  else
  {
    unint64_t v55 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_progressUnitString hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    double goalValue = self->_goalValue;
    double v12 = -goalValue;
    if (goalValue >= 0.0) {
      double v12 = self->_goalValue;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    double v15 = fmod(v13, 1.84467441e19);
    unint64_t v16 = 2654435761u * (unint64_t)v15;
    unint64_t v17 = v16 + (unint64_t)v14;
    if (v14 <= 0.0) {
      unint64_t v17 = 2654435761u * (unint64_t)v15;
    }
    unint64_t v18 = v16 - (unint64_t)fabs(v14);
    if (v14 >= 0.0) {
      unint64_t v18 = v17;
    }
    unint64_t v53 = v18;
  }
  else
  {
    unint64_t v53 = 0;
  }
  NSUInteger v52 = [(NSString *)self->_goalUnitString hash];
  uint64_t v51 = [(NSMutableArray *)self->_customPlaceholderValues hash];
  uint64_t v50 = [(NSMutableArray *)self->_textureFilenames hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    uint64_t v49 = 2654435761 * self->_unearnedUsesTwoToneEnamel;
  }
  else {
    uint64_t v49 = 0;
  }
  NSUInteger v48 = [(NSString *)self->_section hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v47 = 2654435761 * self->_faceHasMetalInlay;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_27:
      uint64_t v46 = 2654435761 * self->_badgeUsesTriColorEnamel;
      goto LABEL_30;
    }
  }
  uint64_t v46 = 0;
LABEL_30:
  unint64_t v45 = [(ACHCodableColor *)self->_enamelTriColor1 hash];
  unint64_t v44 = [(ACHCodableColor *)self->_enamelTriColor2 hash];
  unint64_t v43 = [(ACHCodableColor *)self->_enamelTriColor3 hash];
  if (*(_WORD *)&self->_has) {
    uint64_t v42 = 2654435761 * self->_badgeModelVersion;
  }
  else {
    uint64_t v42 = 0;
  }
  unint64_t v19 = [(ACHCodableEarnedInstance *)self->_relevantEarnedInstance hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v20 = 2654435761 * self->_earnedInstanceCount;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = [(NSMutableArray *)self->_badgeModelFilenames hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    double glyphTextureScale = self->_glyphTextureScale;
    double v24 = -glyphTextureScale;
    if (glyphTextureScale >= 0.0) {
      double v24 = self->_glyphTextureScale;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_glyphTextureFilename hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    double glyphPositionOffsetX = self->_glyphPositionOffsetX;
    double v31 = -glyphPositionOffsetX;
    if (glyphPositionOffsetX >= 0.0) {
      double v31 = self->_glyphPositionOffsetX;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 8) != 0)
  {
    double glyphPositionOffsetY = self->_glyphPositionOffsetY;
    double v36 = -glyphPositionOffsetY;
    if (glyphPositionOffsetY >= 0.0) {
      double v36 = self->_glyphPositionOffsetY;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v39 = [(ACHCodableSyncIdentity *)self->_syncIdentity hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v40 = 2654435761 * self->_prerequisiteMet;
  }
  else {
    uint64_t v40 = 0;
  }
  return v64 ^ v65 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v19 ^ v20 ^ v21 ^ v22 ^ v27 ^ v29 ^ v34 ^ v39 ^ v40;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  achievementTemplate = self->_achievementTemplate;
  uint64_t v6 = *((void *)v4 + 8);
  if (achievementTemplate)
  {
    if (v6) {
      -[ACHCodableTemplate mergeFrom:](achievementTemplate, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ACHCodableAchievement setAchievementTemplate:](self, "setAchievementTemplate:");
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = *((id *)v4 + 14);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v56 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ACHCodableAchievement *)self addEarnedInstances:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 20)) {
    -[ACHCodableAchievement setLocalizationBundleURL:](self, "setLocalizationBundleURL:");
  }
  if (*((void *)v4 + 24)) {
    -[ACHCodableAchievement setResourceBundleURL:](self, "setResourceBundleURL:");
  }
  if (*((void *)v4 + 26)) {
    -[ACHCodableAchievement setStickerBundleURL:](self, "setStickerBundleURL:");
  }
  if (*((void *)v4 + 12)) {
    -[ACHCodableAchievement setBadgeShapeName:](self, "setBadgeShapeName:");
  }
  badgeMetalColor = self->_badgeMetalColor;
  uint64_t v13 = *((void *)v4 + 10);
  if (badgeMetalColor)
  {
    if (v13) {
      -[ACHCodableColor mergeFrom:](badgeMetalColor, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[ACHCodableAchievement setBadgeMetalColor:](self, "setBadgeMetalColor:");
  }
  if ((*((_WORD *)v4 + 120) & 0x80) != 0)
  {
    self->_badgeUsesFullColorEnamel = *((unsigned char *)v4 + 232);
    *(_WORD *)&self->_has |= 0x80u;
  }
  badgeEnamelColor = self->_badgeEnamelColor;
  uint64_t v15 = *((void *)v4 + 9);
  if (badgeEnamelColor)
  {
    if (v15) {
      -[ACHCodableColor mergeFrom:](badgeEnamelColor, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[ACHCodableAchievement setBadgeEnamelColor:](self, "setBadgeEnamelColor:");
  }
  if (*((void *)v4 + 22)) {
    -[ACHCodableAchievement setPropertyListBundleURL:](self, "setPropertyListBundleURL:");
  }
  if ((*((_WORD *)v4 + 120) & 0x40) != 0)
  {
    self->_double progressValue = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 21)) {
    -[ACHCodableAchievement setProgressUnitString:](self, "setProgressUnitString:");
  }
  if ((*((_WORD *)v4 + 120) & 0x20) != 0)
  {
    self->_double goalValue = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 19)) {
    -[ACHCodableAchievement setGoalUnitString:](self, "setGoalUnitString:");
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v16 = *((id *)v4 + 13);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v52 != v19) {
          objc_enumerationMutation(v16);
        }
        [(ACHCodableAchievement *)self addCustomPlaceholderValues:*(void *)(*((void *)&v51 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v18);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v21 = *((id *)v4 + 28);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        [(ACHCodableAchievement *)self addTextureFilenames:*(void *)(*((void *)&v47 + 1) + 8 * k)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v23);
  }

  if ((*((_WORD *)v4 + 120) & 0x800) != 0)
  {
    self->_unearnedUsesTwoToneEnamel = *((unsigned char *)v4 + 236);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((void *)v4 + 25)) {
    -[ACHCodableAchievement setSection:](self, "setSection:");
  }
  __int16 v26 = *((_WORD *)v4 + 120);
  if ((v26 & 0x200) != 0)
  {
    self->_faceHasMetalInlay = *((unsigned char *)v4 + 234);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v26 = *((_WORD *)v4 + 120);
  }
  if ((v26 & 0x100) != 0)
  {
    self->_badgeUsesTriColorEnamel = *((unsigned char *)v4 + 233);
    *(_WORD *)&self->_has |= 0x100u;
  }
  enamelTriColor1 = self->_enamelTriColor1;
  uint64_t v28 = *((void *)v4 + 15);
  if (enamelTriColor1)
  {
    if (v28) {
      -[ACHCodableColor mergeFrom:](enamelTriColor1, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[ACHCodableAchievement setEnamelTriColor1:](self, "setEnamelTriColor1:");
  }
  enamelTriColor2 = self->_enamelTriColor2;
  uint64_t v30 = *((void *)v4 + 16);
  if (enamelTriColor2)
  {
    if (v30) {
      -[ACHCodableColor mergeFrom:](enamelTriColor2, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[ACHCodableAchievement setEnamelTriColor2:](self, "setEnamelTriColor2:");
  }
  enamelTriColor3 = self->_enamelTriColor3;
  uint64_t v32 = *((void *)v4 + 17);
  if (enamelTriColor3)
  {
    if (v32) {
      -[ACHCodableColor mergeFrom:](enamelTriColor3, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[ACHCodableAchievement setEnamelTriColor3:](self, "setEnamelTriColor3:");
  }
  if (*((_WORD *)v4 + 120))
  {
    self->_badgeModelVersion = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  relevantEarnedInstance = self->_relevantEarnedInstance;
  uint64_t v34 = *((void *)v4 + 23);
  if (relevantEarnedInstance)
  {
    if (v34) {
      -[ACHCodableEarnedInstance mergeFrom:](relevantEarnedInstance, "mergeFrom:");
    }
  }
  else if (v34)
  {
    -[ACHCodableAchievement setRelevantEarnedInstance:](self, "setRelevantEarnedInstance:");
  }
  if ((*((_WORD *)v4 + 120) & 2) != 0)
  {
    self->_earnedInstanceCount = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v35 = *((id *)v4 + 11);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v59 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(v35);
        }
        -[ACHCodableAchievement addBadgeModelFilenames:](self, "addBadgeModelFilenames:", *(void *)(*((void *)&v43 + 1) + 8 * m), (void)v43);
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v59 count:16];
    }
    while (v37);
  }

  if ((*((_WORD *)v4 + 120) & 0x10) != 0)
  {
    self->_double glyphTextureScale = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 18)) {
    -[ACHCodableAchievement setGlyphTextureFilename:](self, "setGlyphTextureFilename:");
  }
  __int16 v40 = *((_WORD *)v4 + 120);
  if ((v40 & 4) != 0)
  {
    self->_double glyphPositionOffsetX = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v40 = *((_WORD *)v4 + 120);
  }
  if ((v40 & 8) != 0)
  {
    self->_double glyphPositionOffsetY = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  syncIdentity = self->_syncIdentity;
  uint64_t v42 = *((void *)v4 + 27);
  if (syncIdentity)
  {
    if (v42) {
      -[ACHCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v42)
  {
    -[ACHCodableAchievement setSyncIdentity:](self, "setSyncIdentity:");
  }
  if ((*((_WORD *)v4 + 120) & 0x400) != 0)
  {
    self->_prerequisiteMet = *((unsigned char *)v4 + 235);
    *(_WORD *)&self->_has |= 0x400u;
  }
}

- (NSString)stickerBundleURL
{
  return self->_stickerBundleURL;
}

- (NSMutableArray)customPlaceholderValues
{
  return self->_customPlaceholderValues;
}

- (ACHCodableEarnedInstance)relevantEarnedInstance
{
  return self->_relevantEarnedInstance;
}

- (void)setRelevantEarnedInstance:(id)a3
{
}

- (ACHCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (ACHCodableAchievement)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [[ACHCodableAchievement alloc] initWithData:v5];

  return v6;
}

@end