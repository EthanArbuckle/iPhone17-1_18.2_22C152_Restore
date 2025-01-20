@interface BMMomentsEventDataEventBundleClusterMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundleClusterMetadata)initWithIsFiltered:(id)a3 isTopLevelActivityTypePhenotypeDetected:(id)a4 isSecondLevelActivityTypePhenotypeDetected:(id)a5 isWeekendPhenotypeDetected:(id)a6 isTimeTagPhenotypeDetected:(id)a7 isDayOfWeekPhenotypeDetected:(id)a8 isPlaceNamePhenotypeDetected:(id)a9 isCombinedPlacePhenotypeDetected:(id)a10 isEnclosingAreaNamePhenotypeDetected:(id)a11 isPersonsPhenotypeDetected:(id)a12 isPersonRelationshipPhenotypeDetected:(id)a13 isActivityTypeFromPhotoTraitsPhenotypeDetected:(id)a14 isTimeContextFromPhotoTraitsPhenotypeDetected:(id)a15 isLocationContextFromPhotoTraitsPhenotypeDetected:(id)a16 isSocialContextFromPhotoTraitsPhenotypeDetected:(id)a17 isExtraContextFromPhotoTraitsPhenotypeDetected:(id)a18 isOtherSubjectFromPhotoTraitsPhenotypeDetected:(id)a19;
- (BMMomentsEventDataEventBundleClusterMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIsActivityTypeFromPhotoTraitsPhenotypeDetected;
- (BOOL)hasIsCombinedPlacePhenotypeDetected;
- (BOOL)hasIsDayOfWeekPhenotypeDetected;
- (BOOL)hasIsEnclosingAreaNamePhenotypeDetected;
- (BOOL)hasIsExtraContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)hasIsFiltered;
- (BOOL)hasIsLocationContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected;
- (BOOL)hasIsPersonRelationshipPhenotypeDetected;
- (BOOL)hasIsPersonsPhenotypeDetected;
- (BOOL)hasIsPlaceNamePhenotypeDetected;
- (BOOL)hasIsSecondLevelActivityTypePhenotypeDetected;
- (BOOL)hasIsSocialContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)hasIsTimeContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)hasIsTimeTagPhenotypeDetected;
- (BOOL)hasIsTopLevelActivityTypePhenotypeDetected;
- (BOOL)hasIsWeekendPhenotypeDetected;
- (BOOL)isActivityTypeFromPhotoTraitsPhenotypeDetected;
- (BOOL)isCombinedPlacePhenotypeDetected;
- (BOOL)isDayOfWeekPhenotypeDetected;
- (BOOL)isEnclosingAreaNamePhenotypeDetected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtraContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)isFiltered;
- (BOOL)isLocationContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)isOtherSubjectFromPhotoTraitsPhenotypeDetected;
- (BOOL)isPersonRelationshipPhenotypeDetected;
- (BOOL)isPersonsPhenotypeDetected;
- (BOOL)isPlaceNamePhenotypeDetected;
- (BOOL)isSecondLevelActivityTypePhenotypeDetected;
- (BOOL)isSocialContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)isTimeContextFromPhotoTraitsPhenotypeDetected;
- (BOOL)isTimeTagPhenotypeDetected;
- (BOOL)isTopLevelActivityTypePhenotypeDetected;
- (BOOL)isWeekendPhenotypeDetected;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasIsActivityTypeFromPhotoTraitsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsCombinedPlacePhenotypeDetected:(BOOL)a3;
- (void)setHasIsDayOfWeekPhenotypeDetected:(BOOL)a3;
- (void)setHasIsEnclosingAreaNamePhenotypeDetected:(BOOL)a3;
- (void)setHasIsExtraContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsFiltered:(BOOL)a3;
- (void)setHasIsLocationContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsOtherSubjectFromPhotoTraitsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsPersonRelationshipPhenotypeDetected:(BOOL)a3;
- (void)setHasIsPersonsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsPlaceNamePhenotypeDetected:(BOOL)a3;
- (void)setHasIsSecondLevelActivityTypePhenotypeDetected:(BOOL)a3;
- (void)setHasIsSocialContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsTimeContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3;
- (void)setHasIsTimeTagPhenotypeDetected:(BOOL)a3;
- (void)setHasIsTopLevelActivityTypePhenotypeDetected:(BOOL)a3;
- (void)setHasIsWeekendPhenotypeDetected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundleClusterMetadata

- (void)setHasIsOtherSubjectFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)isOtherSubjectFromPhotoTraitsPhenotypeDetected
{
  return self->_isOtherSubjectFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsExtraContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)hasIsExtraContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)isExtraContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isExtraContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsSocialContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)hasIsSocialContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)isSocialContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isSocialContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsLocationContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)hasIsLocationContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)isLocationContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isLocationContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsTimeContextFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)hasIsTimeContextFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)isTimeContextFromPhotoTraitsPhenotypeDetected
{
  return self->_isTimeContextFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsActivityTypeFromPhotoTraitsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = a3;
}

- (BOOL)hasIsActivityTypeFromPhotoTraitsPhenotypeDetected
{
  return self->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected;
}

- (BOOL)isActivityTypeFromPhotoTraitsPhenotypeDetected
{
  return self->_isActivityTypeFromPhotoTraitsPhenotypeDetected;
}

- (void)setHasIsPersonRelationshipPhenotypeDetected:(BOOL)a3
{
  self->_hasIsPersonRelationshipPhenotypeDetected = a3;
}

- (BOOL)hasIsPersonRelationshipPhenotypeDetected
{
  return self->_hasIsPersonRelationshipPhenotypeDetected;
}

- (BOOL)isPersonRelationshipPhenotypeDetected
{
  return self->_isPersonRelationshipPhenotypeDetected;
}

- (void)setHasIsPersonsPhenotypeDetected:(BOOL)a3
{
  self->_hasIsPersonsPhenotypeDetected = a3;
}

- (BOOL)hasIsPersonsPhenotypeDetected
{
  return self->_hasIsPersonsPhenotypeDetected;
}

- (BOOL)isPersonsPhenotypeDetected
{
  return self->_isPersonsPhenotypeDetected;
}

- (void)setHasIsEnclosingAreaNamePhenotypeDetected:(BOOL)a3
{
  self->_hasIsEnclosingAreaNamePhenotypeDetected = a3;
}

- (BOOL)hasIsEnclosingAreaNamePhenotypeDetected
{
  return self->_hasIsEnclosingAreaNamePhenotypeDetected;
}

- (BOOL)isEnclosingAreaNamePhenotypeDetected
{
  return self->_isEnclosingAreaNamePhenotypeDetected;
}

- (void)setHasIsCombinedPlacePhenotypeDetected:(BOOL)a3
{
  self->_hasIsCombinedPlacePhenotypeDetected = a3;
}

- (BOOL)hasIsCombinedPlacePhenotypeDetected
{
  return self->_hasIsCombinedPlacePhenotypeDetected;
}

- (BOOL)isCombinedPlacePhenotypeDetected
{
  return self->_isCombinedPlacePhenotypeDetected;
}

- (void)setHasIsPlaceNamePhenotypeDetected:(BOOL)a3
{
  self->_hasIsPlaceNamePhenotypeDetected = a3;
}

- (BOOL)hasIsPlaceNamePhenotypeDetected
{
  return self->_hasIsPlaceNamePhenotypeDetected;
}

- (BOOL)isPlaceNamePhenotypeDetected
{
  return self->_isPlaceNamePhenotypeDetected;
}

- (void)setHasIsDayOfWeekPhenotypeDetected:(BOOL)a3
{
  self->_hasIsDayOfWeekPhenotypeDetected = a3;
}

- (BOOL)hasIsDayOfWeekPhenotypeDetected
{
  return self->_hasIsDayOfWeekPhenotypeDetected;
}

- (BOOL)isDayOfWeekPhenotypeDetected
{
  return self->_isDayOfWeekPhenotypeDetected;
}

- (void)setHasIsTimeTagPhenotypeDetected:(BOOL)a3
{
  self->_hasIsTimeTagPhenotypeDetected = a3;
}

- (BOOL)hasIsTimeTagPhenotypeDetected
{
  return self->_hasIsTimeTagPhenotypeDetected;
}

- (BOOL)isTimeTagPhenotypeDetected
{
  return self->_isTimeTagPhenotypeDetected;
}

- (void)setHasIsWeekendPhenotypeDetected:(BOOL)a3
{
  self->_hasIsWeekendPhenotypeDetected = a3;
}

- (BOOL)hasIsWeekendPhenotypeDetected
{
  return self->_hasIsWeekendPhenotypeDetected;
}

- (BOOL)isWeekendPhenotypeDetected
{
  return self->_isWeekendPhenotypeDetected;
}

- (void)setHasIsSecondLevelActivityTypePhenotypeDetected:(BOOL)a3
{
  self->_hasIsSecondLevelActivityTypePhenotypeDetected = a3;
}

- (BOOL)hasIsSecondLevelActivityTypePhenotypeDetected
{
  return self->_hasIsSecondLevelActivityTypePhenotypeDetected;
}

- (BOOL)isSecondLevelActivityTypePhenotypeDetected
{
  return self->_isSecondLevelActivityTypePhenotypeDetected;
}

- (void)setHasIsTopLevelActivityTypePhenotypeDetected:(BOOL)a3
{
  self->_hasIsTopLevelActivityTypePhenotypeDetected = a3;
}

- (BOOL)hasIsTopLevelActivityTypePhenotypeDetected
{
  return self->_hasIsTopLevelActivityTypePhenotypeDetected;
}

- (BOOL)isTopLevelActivityTypePhenotypeDetected
{
  return self->_isTopLevelActivityTypePhenotypeDetected;
}

- (void)setHasIsFiltered:(BOOL)a3
{
  self->_hasIsFiltered = a3;
}

- (BOOL)hasIsFiltered
{
  return self->_hasIsFiltered;
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsFiltered]
      || [v5 hasIsFiltered])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsFiltered]) {
        goto LABEL_88;
      }
      if (![v5 hasIsFiltered]) {
        goto LABEL_88;
      }
      int v6 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isFiltered];
      if (v6 != [v5 isFiltered]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTopLevelActivityTypePhenotypeDetected](self, "hasIsTopLevelActivityTypePhenotypeDetected")|| [v5 hasIsTopLevelActivityTypePhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsTopLevelActivityTypePhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsTopLevelActivityTypePhenotypeDetected])
      }
        goto LABEL_88;
      int v7 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isTopLevelActivityTypePhenotypeDetected];
      if (v7 != [v5 isTopLevelActivityTypePhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsSecondLevelActivityTypePhenotypeDetected](self, "hasIsSecondLevelActivityTypePhenotypeDetected")|| [v5 hasIsSecondLevelActivityTypePhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsSecondLevelActivityTypePhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsSecondLevelActivityTypePhenotypeDetected])
      }
        goto LABEL_88;
      int v8 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isSecondLevelActivityTypePhenotypeDetected];
      if (v8 != [v5 isSecondLevelActivityTypePhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsWeekendPhenotypeDetected](self, "hasIsWeekendPhenotypeDetected")|| [v5 hasIsWeekendPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsWeekendPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsWeekendPhenotypeDetected])
      }
        goto LABEL_88;
      int v9 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isWeekendPhenotypeDetected];
      if (v9 != [v5 isWeekendPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeTagPhenotypeDetected](self, "hasIsTimeTagPhenotypeDetected")|| [v5 hasIsTimeTagPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsTimeTagPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsTimeTagPhenotypeDetected])
      }
        goto LABEL_88;
      int v10 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isTimeTagPhenotypeDetected];
      if (v10 != [v5 isTimeTagPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsDayOfWeekPhenotypeDetected](self, "hasIsDayOfWeekPhenotypeDetected")|| [v5 hasIsDayOfWeekPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsDayOfWeekPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsDayOfWeekPhenotypeDetected])
      }
        goto LABEL_88;
      int v11 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isDayOfWeekPhenotypeDetected];
      if (v11 != [v5 isDayOfWeekPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPlaceNamePhenotypeDetected](self, "hasIsPlaceNamePhenotypeDetected")|| [v5 hasIsPlaceNamePhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsPlaceNamePhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsPlaceNamePhenotypeDetected])
      }
        goto LABEL_88;
      int v12 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isPlaceNamePhenotypeDetected];
      if (v12 != [v5 isPlaceNamePhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsCombinedPlacePhenotypeDetected](self, "hasIsCombinedPlacePhenotypeDetected")|| [v5 hasIsCombinedPlacePhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsCombinedPlacePhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsCombinedPlacePhenotypeDetected])
      }
        goto LABEL_88;
      int v13 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isCombinedPlacePhenotypeDetected];
      if (v13 != [v5 isCombinedPlacePhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsEnclosingAreaNamePhenotypeDetected](self, "hasIsEnclosingAreaNamePhenotypeDetected")|| [v5 hasIsEnclosingAreaNamePhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsEnclosingAreaNamePhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsEnclosingAreaNamePhenotypeDetected])
      }
        goto LABEL_88;
      int v14 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isEnclosingAreaNamePhenotypeDetected];
      if (v14 != [v5 isEnclosingAreaNamePhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonsPhenotypeDetected](self, "hasIsPersonsPhenotypeDetected")|| [v5 hasIsPersonsPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsPersonsPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsPersonsPhenotypeDetected])
      }
        goto LABEL_88;
      int v15 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isPersonsPhenotypeDetected];
      if (v15 != [v5 isPersonsPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsPersonRelationshipPhenotypeDetected](self, "hasIsPersonRelationshipPhenotypeDetected")|| [v5 hasIsPersonRelationshipPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsPersonRelationshipPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsPersonRelationshipPhenotypeDetected])
      }
        goto LABEL_88;
      int v16 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isPersonRelationshipPhenotypeDetected];
      if (v16 != [v5 isPersonRelationshipPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsActivityTypeFromPhotoTraitsPhenotypeDetected](self, "hasIsActivityTypeFromPhotoTraitsPhenotypeDetected")|| [v5 hasIsActivityTypeFromPhotoTraitsPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsActivityTypeFromPhotoTraitsPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsActivityTypeFromPhotoTraitsPhenotypeDetected])
      }
        goto LABEL_88;
      int v17 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isActivityTypeFromPhotoTraitsPhenotypeDetected];
      if (v17 != [v5 isActivityTypeFromPhotoTraitsPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsTimeContextFromPhotoTraitsPhenotypeDetected](self, "hasIsTimeContextFromPhotoTraitsPhenotypeDetected")|| [v5 hasIsTimeContextFromPhotoTraitsPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsTimeContextFromPhotoTraitsPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsTimeContextFromPhotoTraitsPhenotypeDetected])
      }
        goto LABEL_88;
      int v18 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isTimeContextFromPhotoTraitsPhenotypeDetected];
      if (v18 != [v5 isTimeContextFromPhotoTraitsPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsLocationContextFromPhotoTraitsPhenotypeDetected](self, "hasIsLocationContextFromPhotoTraitsPhenotypeDetected")|| [v5 hasIsLocationContextFromPhotoTraitsPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsLocationContextFromPhotoTraitsPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsLocationContextFromPhotoTraitsPhenotypeDetected])
      }
        goto LABEL_88;
      int v19 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isLocationContextFromPhotoTraitsPhenotypeDetected];
      if (v19 != [v5 isLocationContextFromPhotoTraitsPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsSocialContextFromPhotoTraitsPhenotypeDetected](self, "hasIsSocialContextFromPhotoTraitsPhenotypeDetected")|| [v5 hasIsSocialContextFromPhotoTraitsPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsSocialContextFromPhotoTraitsPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsSocialContextFromPhotoTraitsPhenotypeDetected])
      }
        goto LABEL_88;
      int v20 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isSocialContextFromPhotoTraitsPhenotypeDetected];
      if (v20 != [v5 isSocialContextFromPhotoTraitsPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsExtraContextFromPhotoTraitsPhenotypeDetected](self, "hasIsExtraContextFromPhotoTraitsPhenotypeDetected")|| [v5 hasIsExtraContextFromPhotoTraitsPhenotypeDetected])
    {
      if (![(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsExtraContextFromPhotoTraitsPhenotypeDetected])goto LABEL_88; {
      if (![v5 hasIsExtraContextFromPhotoTraitsPhenotypeDetected])
      }
        goto LABEL_88;
      int v21 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isExtraContextFromPhotoTraitsPhenotypeDetected];
      if (v21 != [v5 isExtraContextFromPhotoTraitsPhenotypeDetected]) {
        goto LABEL_88;
      }
    }
    if (!-[BMMomentsEventDataEventBundleClusterMetadata hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected")&& ![v5 hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected])
    {
      LOBYTE(v23) = 1;
      goto LABEL_89;
    }
    if (-[BMMomentsEventDataEventBundleClusterMetadata hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected")&& [v5 hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected])
    {
      BOOL v22 = [(BMMomentsEventDataEventBundleClusterMetadata *)self isOtherSubjectFromPhotoTraitsPhenotypeDetected];
      int v23 = v22 ^ [v5 isOtherSubjectFromPhotoTraitsPhenotypeDetected] ^ 1;
    }
    else
    {
LABEL_88:
      LOBYTE(v23) = 0;
    }
LABEL_89:

    goto LABEL_90;
  }
  LOBYTE(v23) = 0;
LABEL_90:

  return v23;
}

- (id)jsonDictionary
{
  v59[17] = *MEMORY[0x1E4F143B8];
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsFiltered])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isFiltered](self, "isFiltered"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsTopLevelActivityTypePhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTopLevelActivityTypePhenotypeDetected](self, "isTopLevelActivityTypePhenotypeDetected"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsSecondLevelActivityTypePhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSecondLevelActivityTypePhenotypeDetected](self, "isSecondLevelActivityTypePhenotypeDetected"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsWeekendPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isWeekendPhenotypeDetected](self, "isWeekendPhenotypeDetected"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsTimeTagPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeTagPhenotypeDetected](self, "isTimeTagPhenotypeDetected"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsDayOfWeekPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isDayOfWeekPhenotypeDetected](self, "isDayOfWeekPhenotypeDetected"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsPlaceNamePhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPlaceNamePhenotypeDetected](self, "isPlaceNamePhenotypeDetected"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsCombinedPlacePhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isCombinedPlacePhenotypeDetected](self, "isCombinedPlacePhenotypeDetected"));
    id v57 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v57 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsEnclosingAreaNamePhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isEnclosingAreaNamePhenotypeDetected](self, "isEnclosingAreaNamePhenotypeDetected"));
    id v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v56 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsPersonsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonsPhenotypeDetected](self, "isPersonsPhenotypeDetected"));
    id v55 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v55 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsPersonRelationshipPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonRelationshipPhenotypeDetected](self, "isPersonRelationshipPhenotypeDetected"));
    id v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v54 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsActivityTypeFromPhotoTraitsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isActivityTypeFromPhotoTraitsPhenotypeDetected](self, "isActivityTypeFromPhotoTraitsPhenotypeDetected"));
    id v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v53 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsTimeContextFromPhotoTraitsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeContextFromPhotoTraitsPhenotypeDetected](self, "isTimeContextFromPhotoTraitsPhenotypeDetected"));
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsLocationContextFromPhotoTraitsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isLocationContextFromPhotoTraitsPhenotypeDetected](self, "isLocationContextFromPhotoTraitsPhenotypeDetected"));
    id v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v51 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsSocialContextFromPhotoTraitsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSocialContextFromPhotoTraitsPhenotypeDetected](self, "isSocialContextFromPhotoTraitsPhenotypeDetected"));
    id v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v50 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsExtraContextFromPhotoTraitsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isExtraContextFromPhotoTraitsPhenotypeDetected](self, "isExtraContextFromPhotoTraitsPhenotypeDetected"));
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v49 = 0;
  }
  if ([(BMMomentsEventDataEventBundleClusterMetadata *)self hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "isOtherSubjectFromPhotoTraitsPhenotypeDetected"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v58[0] = @"isFiltered";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v11;
  v59[0] = v11;
  v58[1] = @"isTopLevelActivityTypePhenotypeDetected";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v12;
  v59[1] = v12;
  v58[2] = @"isSecondLevelActivityTypePhenotypeDetected";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v13;
  v59[2] = v13;
  v58[3] = @"isWeekendPhenotypeDetected";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v14;
  v59[3] = v14;
  v58[4] = @"isTimeTagPhenotypeDetected";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v15;
  v59[4] = v15;
  v58[5] = @"isDayOfWeekPhenotypeDetected";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v16;
  v59[5] = v16;
  v58[6] = @"isPlaceNamePhenotypeDetected";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v17;
  v59[6] = v17;
  v58[7] = @"isCombinedPlacePhenotypeDetected";
  uint64_t v18 = (uint64_t)v57;
  if (!v57)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v59[7] = v18;
  v58[8] = @"isEnclosingAreaNamePhenotypeDetected";
  uint64_t v19 = (uint64_t)v56;
  if (!v56)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = v3;
  v59[8] = v19;
  v58[9] = @"isPersonsPhenotypeDetected";
  uint64_t v20 = (uint64_t)v55;
  if (!v55)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = v9;
  v59[9] = v20;
  v58[10] = @"isPersonRelationshipPhenotypeDetected";
  uint64_t v21 = (uint64_t)v54;
  if (!v54)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = v4;
  uint64_t v32 = v21;
  v59[10] = v21;
  v58[11] = @"isActivityTypeFromPhotoTraitsPhenotypeDetected";
  BOOL v22 = v53;
  if (!v53)
  {
    BOOL v22 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v21);
  }
  v35 = (void *)v19;
  v36 = (void *)v18;
  v46 = v7;
  v59[11] = v22;
  v58[12] = @"isTimeContextFromPhotoTraitsPhenotypeDetected";
  int v23 = v52;
  if (!v52)
  {
    int v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = v8;
  v25 = v5;
  v59[12] = v23;
  v58[13] = @"isLocationContextFromPhotoTraitsPhenotypeDetected";
  v26 = v51;
  if (!v51)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = v6;
  v59[13] = v26;
  v58[14] = @"isSocialContextFromPhotoTraitsPhenotypeDetected";
  v28 = v50;
  if (!v50)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v20;
  v59[14] = v28;
  v58[15] = @"isExtraContextFromPhotoTraitsPhenotypeDetected";
  v29 = v49;
  if (!v49)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v59[15] = v29;
  v58[16] = @"isOtherSubjectFromPhotoTraitsPhenotypeDetected";
  v30 = v10;
  if (!v10)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v59[16] = v30;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v59, v58, 17, v32);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10) {

  }
  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (!v54)
  }

  if (!v55) {
  if (!v56)
  }

  if (v57)
  {
    if (v45) {
      goto LABEL_106;
    }
  }
  else
  {

    if (v45)
    {
LABEL_106:
      if (v24) {
        goto LABEL_107;
      }
      goto LABEL_117;
    }
  }

  if (v24)
  {
LABEL_107:
    if (v46) {
      goto LABEL_108;
    }
    goto LABEL_118;
  }
LABEL_117:

  if (v46)
  {
LABEL_108:
    if (v27) {
      goto LABEL_109;
    }
    goto LABEL_119;
  }
LABEL_118:

  if (v27)
  {
LABEL_109:
    if (v25) {
      goto LABEL_110;
    }
    goto LABEL_120;
  }
LABEL_119:

  if (v25)
  {
LABEL_110:
    if (v47) {
      goto LABEL_111;
    }
LABEL_121:

    if (v48) {
      goto LABEL_112;
    }
    goto LABEL_122;
  }
LABEL_120:

  if (!v47) {
    goto LABEL_121;
  }
LABEL_111:
  if (v48) {
    goto LABEL_112;
  }
LABEL_122:

LABEL_112:

  return v44;
}

- (BMMomentsEventDataEventBundleClusterMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v176[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v142 = [v4 objectForKeyedSubscript:@"isFiltered"];
  if (!v142 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v139 = 0;
LABEL_4:
    id v5 = [v4 objectForKeyedSubscript:@"isTopLevelActivityTypePhenotypeDetected"];
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v138 = 0;
          v37 = 0;
          goto LABEL_68;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v173 = *MEMORY[0x1E4F28568];
        id v137 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isTopLevelActivityTypePhenotypeDetected"];
        id v174 = v137;
        id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
        v37 = 0;
        id v138 = 0;
        *a4 = (id)[v43 initWithDomain:v44 code:2 userInfo:v6];
        goto LABEL_67;
      }
      id v138 = v5;
    }
    else
    {
      id v138 = 0;
    }
    id v6 = [v4 objectForKeyedSubscript:@"isSecondLevelActivityTypePhenotypeDetected"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v137 = 0;
          v37 = 0;
          goto LABEL_67;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v171 = *MEMORY[0x1E4F28568];
        uint64_t v47 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSecondLevelActivityTypePhenotypeDetected"];
        uint64_t v172 = v47;
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
        uint64_t v14 = (void *)v47;
        v37 = 0;
        id v137 = 0;
        *a4 = (id)[v45 initWithDomain:v46 code:2 userInfo:v7];
LABEL_66:

LABEL_67:
        goto LABEL_68;
      }
      id v137 = v6;
    }
    else
    {
      id v137 = 0;
    }
    id v7 = [v4 objectForKeyedSubscript:@"isWeekendPhenotypeDetected"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v14 = 0;
          v37 = 0;
          goto LABEL_66;
        }
        id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v169 = *MEMORY[0x1E4F28568];
        id v135 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isWeekendPhenotypeDetected"];
        id v170 = v135;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
        v37 = 0;
        uint64_t v14 = 0;
        *a4 = (id)[v48 initWithDomain:v49 code:2 userInfo:v39];
        goto LABEL_65;
      }
      id v8 = v7;
    }
    else
    {
      id v8 = 0;
    }
    id v9 = [v4 objectForKeyedSubscript:@"isTimeTagPhenotypeDetected"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v135 = 0;
          v37 = 0;
          v39 = v9;
          uint64_t v14 = v8;
          goto LABEL_65;
        }
        id v136 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v133 = *MEMORY[0x1E4F502C8];
        uint64_t v167 = *MEMORY[0x1E4F28568];
        v39 = v9;
        uint64_t v14 = v8;
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isTimeTagPhenotypeDetected"];
        id v168 = v11;
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
        id v50 = (id)[v136 initWithDomain:v133 code:2 userInfo:v10];
        v37 = 0;
        id v135 = 0;
        *a4 = v50;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      v131 = v9;
      id v135 = v9;
    }
    else
    {
      v131 = v9;
      id v135 = 0;
    }
    id v10 = [v4 objectForKeyedSubscript:@"isDayOfWeekPhenotypeDetected"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v14 = v8;
        if (!a4)
        {
          id v11 = 0;
          v37 = 0;
          v39 = v131;
          goto LABEL_64;
        }
        id v130 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v128 = *MEMORY[0x1E4F502C8];
        uint64_t v165 = *MEMORY[0x1E4F28568];
        id v132 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isDayOfWeekPhenotypeDetected"];
        id v166 = v132;
        uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
        id v52 = v130;
        v129 = (void *)v51;
        v37 = 0;
        id v11 = 0;
        *a4 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v128, 2);
        v39 = v131;
        goto LABEL_63;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"isPlaceNamePhenotypeDetected"];
    id v127 = v11;
    v129 = (void *)v12;
    if (v12 && (uint64_t v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v132 = 0;
          v37 = 0;
          v39 = v131;
          uint64_t v14 = v8;
          goto LABEL_63;
        }
        id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v123 = *MEMORY[0x1E4F502C8];
        uint64_t v163 = *MEMORY[0x1E4F28568];
        id v53 = [NSString alloc];
        uint64_t v88 = objc_opt_class();
        id v54 = v53;
        id v11 = v127;
        uint64_t v14 = v8;
        id v125 = (id)[v54 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v88, @"isPlaceNamePhenotypeDetected"];
        id v164 = v125;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
        id v55 = (id)[v134 initWithDomain:v123 code:2 userInfo:v15];
        v37 = 0;
        id v132 = 0;
        *a4 = v55;
        goto LABEL_138;
      }
      id v132 = v13;
    }
    else
    {
      id v132 = 0;
    }
    [v4 objectForKeyedSubscript:@"isCombinedPlacePhenotypeDetected"];
    v15 = uint64_t v14 = v8;
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v125 = 0;
      goto LABEL_25;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v125 = v15;
LABEL_25:
      uint64_t v16 = [v4 objectForKeyedSubscript:@"isEnclosingAreaNamePhenotypeDetected"];
      v113 = v15;
      v120 = (void *)v16;
      if (!v16 || (uint64_t v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v122 = 0;
        goto LABEL_28;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v122 = v17;
LABEL_28:
        uint64_t v18 = [v4 objectForKeyedSubscript:@"isPersonsPhenotypeDetected"];
        v116 = (void *)v18;
        if (!v18 || (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v118 = 0;
          goto LABEL_31;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v118 = v19;
LABEL_31:
          uint64_t v20 = [v4 objectForKeyedSubscript:@"isPersonRelationshipPhenotypeDetected"];
          v111 = (void *)v20;
          if (!v20 || (uint64_t v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v114 = 0;
            goto LABEL_34;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v114 = v21;
LABEL_34:
            uint64_t v22 = [v4 objectForKeyedSubscript:@"isActivityTypeFromPhotoTraitsPhenotypeDetected"];
            v107 = (void *)v22;
            if (!v22 || (int v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v109 = 0;
              goto LABEL_37;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v109 = v23;
LABEL_37:
              uint64_t v24 = [v4 objectForKeyedSubscript:@"isTimeContextFromPhotoTraitsPhenotypeDetected"];
              v103 = (void *)v24;
              if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v105 = 0;
                goto LABEL_40;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v105 = v25;
LABEL_40:
                uint64_t v26 = [v4 objectForKeyedSubscript:@"isLocationContextFromPhotoTraitsPhenotypeDetected"];
                v99 = (void *)v26;
                if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v101 = 0;
                  goto LABEL_43;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v101 = v27;
LABEL_43:
                  uint64_t v28 = [v4 objectForKeyedSubscript:@"isSocialContextFromPhotoTraitsPhenotypeDetected"];
                  v96 = (void *)v28;
                  v98 = v10;
                  if (!v28 || (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v91 = 0;
LABEL_46:
                    uint64_t v30 = [v4 objectForKeyedSubscript:@"isExtraContextFromPhotoTraitsPhenotypeDetected"];
                    v93 = (void *)v30;
                    v95 = v14;
                    if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        if (!a4)
                        {
                          v36 = 0;
                          v37 = 0;
                          v34 = v91;
                          v38 = v93;
                          goto LABEL_54;
                        }
                        id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
                        v89 = v5;
                        v78 = v7;
                        uint64_t v79 = *MEMORY[0x1E4F502C8];
                        uint64_t v145 = *MEMORY[0x1E4F28568];
                        id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isExtraContextFromPhotoTraitsPhenotypeDetected"];
                        id v146 = v35;
                        v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
                        uint64_t v80 = v79;
                        id v7 = v78;
                        id v5 = v89;
                        id v81 = (id)[v77 initWithDomain:v80 code:2 userInfo:v33];
                        v37 = 0;
                        v36 = 0;
                        *a4 = v81;
                        v34 = v91;
                        goto LABEL_53;
                      }
                      id v32 = v31;
                    }
                    else
                    {
                      id v32 = 0;
                    }
                    v33 = [v4 objectForKeyedSubscript:@"isOtherSubjectFromPhotoTraitsPhenotypeDetected"];
                    v34 = v91;
                    if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v36 = v32;
                        if (a4)
                        {
                          id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
                          v90 = v5;
                          v83 = v7;
                          uint64_t v84 = *MEMORY[0x1E4F502C8];
                          uint64_t v143 = *MEMORY[0x1E4F28568];
                          v85 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isOtherSubjectFromPhotoTraitsPhenotypeDetected"];
                          v144 = v85;
                          v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                          uint64_t v87 = v84;
                          id v7 = v83;
                          id v5 = v90;
                          *a4 = (id)[v82 initWithDomain:v87 code:2 userInfo:v86];
                        }
                        id v35 = 0;
                        v37 = 0;
                        goto LABEL_53;
                      }
                      id v35 = v33;
                    }
                    else
                    {
                      id v35 = 0;
                    }
                    v36 = v32;
                    v37 = objc_retain(-[BMMomentsEventDataEventBundleClusterMetadata initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:](self, "initWithIsFiltered:isTopLevelActivityTypePhenotypeDetected:isSecondLevelActivityTypePhenotypeDetected:isWeekendPhenotypeDetected:isTimeTagPhenotypeDetected:isDayOfWeekPhenotypeDetected:isPlaceNamePhenotypeDetected:isCombinedPlacePhenotypeDetected:isEnclosingAreaNamePhenotypeDetected:isPersonsPhenotypeDetected:isPersonRelationshipPhenotypeDetected:isActivityTypeFromPhotoTraitsPhenotypeDetected:isTimeContextFromPhotoTraitsPhenotypeDetected:isLocationContextFromPhotoTraitsPhenotypeDetected:isSocialContextFromPhotoTraitsPhenotypeDetected:isExtraContextFromPhotoTraitsPhenotypeDetected:isOtherSubjectFromPhotoTraitsPhenotypeDetected:", v139, v138, v137, v95, v135, v127, v132, v125, v122, v118,
                              v114,
                              v109,
                              v105,
                              v101,
                              v91,
                              v32,
                              v35));
                    self = v37;
LABEL_53:

                    v38 = v93;
                    uint64_t v14 = v95;
                    id v10 = v98;
LABEL_54:

                    v39 = v131;
                    uint64_t v15 = v113;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
LABEL_59:

LABEL_60:
LABEL_61:

                    id v11 = v127;
LABEL_62:

LABEL_63:
                    goto LABEL_64;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v91 = v29;
                    goto LABEL_46;
                  }
                  if (a4)
                  {
                    id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v92 = *MEMORY[0x1E4F502C8];
                    uint64_t v147 = *MEMORY[0x1E4F28568];
                    v36 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isSocialContextFromPhotoTraitsPhenotypeDetected"];
                    v148 = v36;
                    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
                    v37 = 0;
                    v34 = 0;
                    *a4 = (id)[v94 initWithDomain:v92 code:2 userInfo:v38];
                    goto LABEL_54;
                  }
                  v34 = 0;
                  v37 = 0;
LABEL_160:
                  v39 = v131;
                  goto LABEL_55;
                }
                if (a4)
                {
                  id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v97 = *MEMORY[0x1E4F502C8];
                  uint64_t v149 = *MEMORY[0x1E4F28568];
                  v34 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isLocationContextFromPhotoTraitsPhenotypeDetected"];
                  v150 = v34;
                  uint64_t v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
                  uint64_t v75 = v97;
                  v96 = (void *)v74;
                  id v76 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v75, 2);
                  v37 = 0;
                  id v101 = 0;
                  *a4 = v76;
                  goto LABEL_160;
                }
                id v101 = 0;
                v37 = 0;
LABEL_158:
                v39 = v131;
                goto LABEL_56;
              }
              if (a4)
              {
                id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v100 = *MEMORY[0x1E4F502C8];
                uint64_t v151 = *MEMORY[0x1E4F28568];
                id v101 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isTimeContextFromPhotoTraitsPhenotypeDetected"];
                id v152 = v101;
                uint64_t v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
                uint64_t v72 = v100;
                v99 = (void *)v71;
                id v73 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v72, 2);
                v37 = 0;
                id v105 = 0;
                *a4 = v73;
                goto LABEL_158;
              }
              id v105 = 0;
              v37 = 0;
LABEL_156:
              v39 = v131;
              goto LABEL_57;
            }
            if (a4)
            {
              id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v104 = *MEMORY[0x1E4F502C8];
              uint64_t v153 = *MEMORY[0x1E4F28568];
              id v105 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isActivityTypeFromPhotoTraitsPhenotypeDetected"];
              id v154 = v105;
              uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
              uint64_t v69 = v104;
              v103 = (void *)v68;
              id v70 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v69, 2);
              v37 = 0;
              id v109 = 0;
              *a4 = v70;
              goto LABEL_156;
            }
            id v109 = 0;
            v37 = 0;
LABEL_154:
            v39 = v131;
            goto LABEL_58;
          }
          if (a4)
          {
            id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v108 = *MEMORY[0x1E4F502C8];
            uint64_t v155 = *MEMORY[0x1E4F28568];
            id v109 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isPersonRelationshipPhenotypeDetected"];
            id v156 = v109;
            uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
            uint64_t v66 = v108;
            v107 = (void *)v65;
            id v67 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v66, 2);
            v37 = 0;
            id v114 = 0;
            *a4 = v67;
            goto LABEL_154;
          }
          id v114 = 0;
          v37 = 0;
LABEL_150:
          v39 = v131;
          goto LABEL_59;
        }
        if (a4)
        {
          id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v112 = *MEMORY[0x1E4F502C8];
          uint64_t v157 = *MEMORY[0x1E4F28568];
          id v114 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isPersonsPhenotypeDetected"];
          id v158 = v114;
          uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
          uint64_t v63 = v112;
          v111 = (void *)v62;
          id v64 = (id)objc_msgSend(v119, "initWithDomain:code:userInfo:", v63, 2);
          v37 = 0;
          id v118 = 0;
          *a4 = v64;
          goto LABEL_150;
        }
        id v118 = 0;
        v37 = 0;
LABEL_146:
        v39 = v131;
        goto LABEL_60;
      }
      if (a4)
      {
        id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v117 = *MEMORY[0x1E4F502C8];
        uint64_t v159 = *MEMORY[0x1E4F28568];
        id v118 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isEnclosingAreaNamePhenotypeDetected"];
        id v160 = v118;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
        uint64_t v60 = v117;
        v116 = (void *)v59;
        id v61 = (id)objc_msgSend(v124, "initWithDomain:code:userInfo:", v60, 2);
        v37 = 0;
        id v122 = 0;
        *a4 = v61;
        goto LABEL_146;
      }
      id v122 = 0;
      v37 = 0;
LABEL_142:
      v39 = v131;
      goto LABEL_61;
    }
    if (a4)
    {
      id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v121 = *MEMORY[0x1E4F502C8];
      uint64_t v161 = *MEMORY[0x1E4F28568];
      id v122 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isCombinedPlacePhenotypeDetected"];
      id v162 = v122;
      uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
      uint64_t v57 = v121;
      v120 = (void *)v56;
      id v58 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v57, 2);
      v37 = 0;
      id v125 = 0;
      *a4 = v58;
      goto LABEL_142;
    }
    id v125 = 0;
    v37 = 0;
LABEL_138:
    v39 = v131;
    goto LABEL_62;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v139 = v142;
    goto LABEL_4;
  }
  if (!a4)
  {
    v37 = 0;
    id v139 = 0;
    goto LABEL_69;
  }
  id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v42 = *MEMORY[0x1E4F502C8];
  uint64_t v175 = *MEMORY[0x1E4F28568];
  id v138 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFiltered"];
  v176[0] = v138;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v176 forKeys:&v175 count:1];
  v37 = 0;
  id v139 = 0;
  *a4 = (id)[v41 initWithDomain:v42 code:2 userInfo:v5];
LABEL_68:

LABEL_69:
  return v37;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundleClusterMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasIsFiltered)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsTopLevelActivityTypePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsSecondLevelActivityTypePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsWeekendPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsTimeTagPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsDayOfWeekPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsPlaceNamePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsCombinedPlacePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsEnclosingAreaNamePhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsPersonsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsPersonRelationshipPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v141.receiver = self;
  v141.super_class = (Class)BMMomentsEventDataEventBundleClusterMetadata;
  id v5 = [(BMEventBase *)&v141 init];
  if (!v5) {
    goto LABEL_184;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    unint64_t v9 = 0x1E9CB3000uLL;
    id v10 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isFiltered;
    id v11 = (int *)MEMORY[0x1E4F940B8];
    unint64_t v12 = 0x1E9CB3000uLL;
    uint64_t v13 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTopLevelActivityTypePhenotypeDetected;
    unint64_t v14 = 0x1E9CB3000uLL;
    unint64_t v15 = 0x1E9CB3000uLL;
    unint64_t v16 = 0x1E9CB3000uLL;
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v17 = 0;
      unsigned int v18 = 0;
      unint64_t v19 = 0;
      while (1)
      {
        uint64_t v20 = *v6;
        uint64_t v21 = *(void *)&v4[v20];
        unint64_t v22 = v21 + 1;
        if (v21 == -1 || v22 > *(void *)&v4[*v7]) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)&v4[*v11] + v21);
        *(void *)&v4[v20] = v22;
        v19 |= (unint64_t)(v23 & 0x7F) << v17;
        if ((v23 & 0x80) == 0) {
          goto LABEL_13;
        }
        v17 += 7;
        if (v18++ >= 9)
        {
          unint64_t v19 = 0;
          int v25 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v25 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v19 = 0;
      }
LABEL_15:
      if (v25 || (v19 & 7) == 4) {
        break;
      }
      switch((v19 >> 3))
      {
        case 1u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + *(int *)(v9 + 2240)) = 1;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7])
            {
              id v35 = v10;
              goto LABEL_158;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v11] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              break;
            }
            uint64_t v34 = 0;
            v27 += 7;
            id v35 = v10;
            BOOL v36 = v28++ > 8;
            if (v36) {
              goto LABEL_162;
            }
          }
          id v35 = v10;
          goto LABEL_159;
        case 2u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + *(int *)(v12 + 2248)) = 1;
          while (2)
          {
            uint64_t v45 = *v6;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v7])
            {
              id v35 = v13;
              goto LABEL_158;
            }
            char v48 = *(unsigned char *)(*(void *)&v4[*v11] + v46);
            *(void *)&v4[v45] = v47;
            v29 |= (unint64_t)(v48 & 0x7F) << v43;
            if (v48 < 0)
            {
              uint64_t v34 = 0;
              v43 += 7;
              id v35 = v13;
              BOOL v36 = v44++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = v13;
          goto LABEL_159;
        case 3u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + *(int *)(v14 + 2256)) = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSecondLevelActivityTypePhenotypeDetected;
              goto LABEL_158;
            }
            char v54 = *(unsigned char *)(*(void *)&v4[*v11] + v52);
            *(void *)&v4[v51] = v53;
            v29 |= (unint64_t)(v54 & 0x7F) << v49;
            if (v54 < 0)
            {
              uint64_t v34 = 0;
              v49 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSecondLevelActivityTypePhenotypeDetected;
              BOOL v36 = v50++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSecondLevelActivityTypePhenotypeDetected;
          goto LABEL_159;
        case 4u:
          char v55 = 0;
          unsigned int v56 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + *(int *)(v15 + 2264)) = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isWeekendPhenotypeDetected;
              goto LABEL_158;
            }
            char v60 = *(unsigned char *)(*(void *)&v4[*v11] + v58);
            *(void *)&v4[v57] = v59;
            v29 |= (unint64_t)(v60 & 0x7F) << v55;
            if (v60 < 0)
            {
              uint64_t v34 = 0;
              v55 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isWeekendPhenotypeDetected;
              BOOL v36 = v56++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isWeekendPhenotypeDetected;
          goto LABEL_159;
        case 5u:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v29 = 0;
          *((unsigned char *)&v5->super.super.isa + *(int *)(v16 + 2272)) = 1;
          while (2)
          {
            uint64_t v63 = *v6;
            uint64_t v64 = *(void *)&v4[v63];
            unint64_t v65 = v64 + 1;
            if (v64 == -1 || v65 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeTagPhenotypeDetected;
              goto LABEL_158;
            }
            char v66 = *(unsigned char *)(*(void *)&v4[*v11] + v64);
            *(void *)&v4[v63] = v65;
            v29 |= (unint64_t)(v66 & 0x7F) << v61;
            if (v66 < 0)
            {
              uint64_t v34 = 0;
              v61 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeTagPhenotypeDetected;
              BOOL v36 = v62++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeTagPhenotypeDetected;
          goto LABEL_159;
        case 6u:
          char v67 = 0;
          unsigned int v68 = 0;
          uint64_t v29 = 0;
          v5->_hasIsDayOfWeekPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v69 = *v6;
            uint64_t v70 = *(void *)&v4[v69];
            unint64_t v71 = v70 + 1;
            if (v70 == -1 || v71 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isDayOfWeekPhenotypeDetected;
              goto LABEL_158;
            }
            char v72 = *(unsigned char *)(*(void *)&v4[*v11] + v70);
            *(void *)&v4[v69] = v71;
            v29 |= (unint64_t)(v72 & 0x7F) << v67;
            if (v72 < 0)
            {
              uint64_t v34 = 0;
              v67 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isDayOfWeekPhenotypeDetected;
              BOOL v36 = v68++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isDayOfWeekPhenotypeDetected;
          goto LABEL_159;
        case 7u:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v29 = 0;
          v5->_hasIsPlaceNamePhenotypeDetected = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPlaceNamePhenotypeDetected;
              goto LABEL_158;
            }
            char v78 = *(unsigned char *)(*(void *)&v4[*v11] + v76);
            *(void *)&v4[v75] = v77;
            v29 |= (unint64_t)(v78 & 0x7F) << v73;
            if (v78 < 0)
            {
              uint64_t v34 = 0;
              v73 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPlaceNamePhenotypeDetected;
              BOOL v36 = v74++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPlaceNamePhenotypeDetected;
          goto LABEL_159;
        case 8u:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v29 = 0;
          v5->_hasIsCombinedPlacePhenotypeDetected = 1;
          while (2)
          {
            uint64_t v81 = *v6;
            uint64_t v82 = *(void *)&v4[v81];
            unint64_t v83 = v82 + 1;
            if (v82 == -1 || v83 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isCombinedPlacePhenotypeDetected;
              goto LABEL_158;
            }
            char v84 = *(unsigned char *)(*(void *)&v4[*v11] + v82);
            *(void *)&v4[v81] = v83;
            v29 |= (unint64_t)(v84 & 0x7F) << v79;
            if (v84 < 0)
            {
              uint64_t v34 = 0;
              v79 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isCombinedPlacePhenotypeDetected;
              BOOL v36 = v80++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isCombinedPlacePhenotypeDetected;
          goto LABEL_159;
        case 9u:
          char v85 = 0;
          unsigned int v86 = 0;
          uint64_t v29 = 0;
          v5->_hasIsEnclosingAreaNamePhenotypeDetected = 1;
          while (2)
          {
            uint64_t v87 = *v6;
            uint64_t v88 = *(void *)&v4[v87];
            unint64_t v89 = v88 + 1;
            if (v88 == -1 || v89 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isEnclosingAreaNamePhenotypeDetected;
              goto LABEL_158;
            }
            char v90 = *(unsigned char *)(*(void *)&v4[*v11] + v88);
            *(void *)&v4[v87] = v89;
            v29 |= (unint64_t)(v90 & 0x7F) << v85;
            if (v90 < 0)
            {
              uint64_t v34 = 0;
              v85 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isEnclosingAreaNamePhenotypeDetected;
              BOOL v36 = v86++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isEnclosingAreaNamePhenotypeDetected;
          goto LABEL_159;
        case 0xAu:
          char v91 = 0;
          unsigned int v92 = 0;
          uint64_t v29 = 0;
          v5->_hasIsPersonsPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v93 = *v6;
            uint64_t v94 = *(void *)&v4[v93];
            unint64_t v95 = v94 + 1;
            if (v94 == -1 || v95 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonsPhenotypeDetected;
              goto LABEL_158;
            }
            char v96 = *(unsigned char *)(*(void *)&v4[*v11] + v94);
            *(void *)&v4[v93] = v95;
            v29 |= (unint64_t)(v96 & 0x7F) << v91;
            if (v96 < 0)
            {
              uint64_t v34 = 0;
              v91 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonsPhenotypeDetected;
              BOOL v36 = v92++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonsPhenotypeDetected;
          goto LABEL_159;
        case 0xBu:
          char v97 = 0;
          unsigned int v98 = 0;
          uint64_t v29 = 0;
          v5->_hasIsPersonRelationshipPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v99 = *v6;
            uint64_t v100 = *(void *)&v4[v99];
            unint64_t v101 = v100 + 1;
            if (v100 == -1 || v101 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonRelationshipPhenotypeDetected;
              goto LABEL_158;
            }
            char v102 = *(unsigned char *)(*(void *)&v4[*v11] + v100);
            *(void *)&v4[v99] = v101;
            v29 |= (unint64_t)(v102 & 0x7F) << v97;
            if (v102 < 0)
            {
              uint64_t v34 = 0;
              v97 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonRelationshipPhenotypeDetected;
              BOOL v36 = v98++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isPersonRelationshipPhenotypeDetected;
          goto LABEL_159;
        case 0xCu:
          char v103 = 0;
          unsigned int v104 = 0;
          uint64_t v29 = 0;
          v5->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v105 = *v6;
            uint64_t v106 = *(void *)&v4[v105];
            unint64_t v107 = v106 + 1;
            if (v106 == -1 || v107 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isActivityTypeFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            char v108 = *(unsigned char *)(*(void *)&v4[*v11] + v106);
            *(void *)&v4[v105] = v107;
            v29 |= (unint64_t)(v108 & 0x7F) << v103;
            if (v108 < 0)
            {
              uint64_t v34 = 0;
              v103 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isActivityTypeFromPhotoTraitsPhenotypeDetected;
              BOOL v36 = v104++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isActivityTypeFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0xDu:
          char v109 = 0;
          unsigned int v110 = 0;
          uint64_t v29 = 0;
          v5->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v111 = *v6;
            uint64_t v112 = *(void *)&v4[v111];
            unint64_t v113 = v112 + 1;
            if (v112 == -1 || v113 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            char v114 = *(unsigned char *)(*(void *)&v4[*v11] + v112);
            *(void *)&v4[v111] = v113;
            v29 |= (unint64_t)(v114 & 0x7F) << v109;
            if (v114 < 0)
            {
              uint64_t v34 = 0;
              v109 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeContextFromPhotoTraitsPhenotypeDetected;
              BOOL v36 = v110++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isTimeContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0xEu:
          char v115 = 0;
          unsigned int v116 = 0;
          uint64_t v29 = 0;
          v5->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v117 = *v6;
            uint64_t v118 = *(void *)&v4[v117];
            unint64_t v119 = v118 + 1;
            if (v118 == -1 || v119 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isLocationContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            char v120 = *(unsigned char *)(*(void *)&v4[*v11] + v118);
            *(void *)&v4[v117] = v119;
            v29 |= (unint64_t)(v120 & 0x7F) << v115;
            if (v120 < 0)
            {
              uint64_t v34 = 0;
              v115 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isLocationContextFromPhotoTraitsPhenotypeDetected;
              BOOL v36 = v116++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isLocationContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0xFu:
          char v121 = 0;
          unsigned int v122 = 0;
          uint64_t v29 = 0;
          v5->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v123 = *v6;
            uint64_t v124 = *(void *)&v4[v123];
            unint64_t v125 = v124 + 1;
            if (v124 == -1 || v125 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSocialContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            char v126 = *(unsigned char *)(*(void *)&v4[*v11] + v124);
            *(void *)&v4[v123] = v125;
            v29 |= (unint64_t)(v126 & 0x7F) << v121;
            if (v126 < 0)
            {
              uint64_t v34 = 0;
              v121 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSocialContextFromPhotoTraitsPhenotypeDetected;
              BOOL v36 = v122++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isSocialContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0x10u:
          char v127 = 0;
          unsigned int v128 = 0;
          uint64_t v29 = 0;
          v5->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = 1;
          while (2)
          {
            uint64_t v129 = *v6;
            uint64_t v130 = *(void *)&v4[v129];
            unint64_t v131 = v130 + 1;
            if (v130 == -1 || v131 > *(void *)&v4[*v7])
            {
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isExtraContextFromPhotoTraitsPhenotypeDetected;
              goto LABEL_158;
            }
            char v132 = *(unsigned char *)(*(void *)&v4[*v11] + v130);
            *(void *)&v4[v129] = v131;
            v29 |= (unint64_t)(v132 & 0x7F) << v127;
            if (v132 < 0)
            {
              uint64_t v34 = 0;
              v127 += 7;
              id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isExtraContextFromPhotoTraitsPhenotypeDetected;
              BOOL v36 = v128++ > 8;
              if (v36) {
                goto LABEL_162;
              }
              continue;
            }
            break;
          }
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isExtraContextFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        case 0x11u:
          char v133 = 0;
          unsigned int v134 = 0;
          uint64_t v29 = 0;
          v5->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = 1;
          break;
        default:
          unint64_t v37 = v9;
          v38 = v10;
          unint64_t v39 = v12;
          v40 = v13;
          unint64_t v41 = v14;
          char v42 = PBReaderSkipValueWithTag();
          unint64_t v14 = v41;
          id v8 = (int *)MEMORY[0x1E4F940C8];
          uint64_t v13 = v40;
          unint64_t v12 = v39;
          unint64_t v15 = 0x1E9CB3000;
          id v10 = v38;
          unint64_t v9 = v37;
          unint64_t v16 = 0x1E9CB3000;
          if ((v42 & 1) == 0) {
            goto LABEL_183;
          }
          continue;
      }
      while (1)
      {
        uint64_t v135 = *v6;
        uint64_t v136 = *(void *)&v4[v135];
        unint64_t v137 = v136 + 1;
        if (v136 == -1 || v137 > *(void *)&v4[*v7]) {
          break;
        }
        char v138 = *(unsigned char *)(*(void *)&v4[*v11] + v136);
        *(void *)&v4[v135] = v137;
        v29 |= (unint64_t)(v138 & 0x7F) << v133;
        if ((v138 & 0x80) == 0)
        {
          id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isOtherSubjectFromPhotoTraitsPhenotypeDetected;
          goto LABEL_159;
        }
        uint64_t v34 = 0;
        v133 += 7;
        id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isOtherSubjectFromPhotoTraitsPhenotypeDetected;
        BOOL v36 = v134++ > 8;
        if (v36) {
          goto LABEL_162;
        }
      }
      id v35 = &OBJC_IVAR___BMMomentsEventDataEventBundleClusterMetadata__isOtherSubjectFromPhotoTraitsPhenotypeDetected;
LABEL_158:
      v4[*v8] = 1;
LABEL_159:
      uint64_t v34 = v4[*v8] ? 0 : v29;
LABEL_162:
      *((unsigned char *)&v5->super.super.isa + *v35) = v34 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_183:
  }
    id v139 = 0;
  else {
LABEL_184:
  }
    id v139 = v5;

  return v139;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  unint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isFiltered](self, "isFiltered"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTopLevelActivityTypePhenotypeDetected](self, "isTopLevelActivityTypePhenotypeDetected"));
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSecondLevelActivityTypePhenotypeDetected](self, "isSecondLevelActivityTypePhenotypeDetected"));
  unint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isWeekendPhenotypeDetected](self, "isWeekendPhenotypeDetected"));
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeTagPhenotypeDetected](self, "isTimeTagPhenotypeDetected"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isDayOfWeekPhenotypeDetected](self, "isDayOfWeekPhenotypeDetected"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPlaceNamePhenotypeDetected](self, "isPlaceNamePhenotypeDetected"));
  unint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isCombinedPlacePhenotypeDetected](self, "isCombinedPlacePhenotypeDetected"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isEnclosingAreaNamePhenotypeDetected](self, "isEnclosingAreaNamePhenotypeDetected"));
  id v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonsPhenotypeDetected](self, "isPersonsPhenotypeDetected"));
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isPersonRelationshipPhenotypeDetected](self, "isPersonRelationshipPhenotypeDetected"));
  unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isActivityTypeFromPhotoTraitsPhenotypeDetected](self, "isActivityTypeFromPhotoTraitsPhenotypeDetected"));
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isTimeContextFromPhotoTraitsPhenotypeDetected](self, "isTimeContextFromPhotoTraitsPhenotypeDetected"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isLocationContextFromPhotoTraitsPhenotypeDetected](self, "isLocationContextFromPhotoTraitsPhenotypeDetected"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isSocialContextFromPhotoTraitsPhenotypeDetected](self, "isSocialContextFromPhotoTraitsPhenotypeDetected"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isExtraContextFromPhotoTraitsPhenotypeDetected](self, "isExtraContextFromPhotoTraitsPhenotypeDetected"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleClusterMetadata isOtherSubjectFromPhotoTraitsPhenotypeDetected](self, "isOtherSubjectFromPhotoTraitsPhenotypeDetected"));
  unsigned int v18 = objc_msgSend(v17, "initWithFormat:", @"BMMomentsEventDataEventBundleClusterMetadata with isFiltered: %@, isTopLevelActivityTypePhenotypeDetected: %@, isSecondLevelActivityTypePhenotypeDetected: %@, isWeekendPhenotypeDetected: %@, isTimeTagPhenotypeDetected: %@, isDayOfWeekPhenotypeDetected: %@, isPlaceNamePhenotypeDetected: %@, isCombinedPlacePhenotypeDetected: %@, isEnclosingAreaNamePhenotypeDetected: %@, isPersonsPhenotypeDetected: %@, isPersonRelationshipPhenotypeDetected: %@, isActivityTypeFromPhotoTraitsPhenotypeDetected: %@, isTimeContextFromPhotoTraitsPhenotypeDetected: %@, isLocationContextFromPhotoTraitsPhenotypeDetected: %@, isSocialContextFromPhotoTraitsPhenotypeDetected: %@, isExtraContextFromPhotoTraitsPhenotypeDetected: %@, isOtherSubjectFromPhotoTraitsPhenotypeDetected: %@", v22, v21, v20, v16, v15, v14, v13, v19, v12, v11, v10, v9, v3, v4, v5, v6,
                  v7);

  return (NSString *)v18;
}

- (BMMomentsEventDataEventBundleClusterMetadata)initWithIsFiltered:(id)a3 isTopLevelActivityTypePhenotypeDetected:(id)a4 isSecondLevelActivityTypePhenotypeDetected:(id)a5 isWeekendPhenotypeDetected:(id)a6 isTimeTagPhenotypeDetected:(id)a7 isDayOfWeekPhenotypeDetected:(id)a8 isPlaceNamePhenotypeDetected:(id)a9 isCombinedPlacePhenotypeDetected:(id)a10 isEnclosingAreaNamePhenotypeDetected:(id)a11 isPersonsPhenotypeDetected:(id)a12 isPersonRelationshipPhenotypeDetected:(id)a13 isActivityTypeFromPhotoTraitsPhenotypeDetected:(id)a14 isTimeContextFromPhotoTraitsPhenotypeDetected:(id)a15 isLocationContextFromPhotoTraitsPhenotypeDetected:(id)a16 isSocialContextFromPhotoTraitsPhenotypeDetected:(id)a17 isExtraContextFromPhotoTraitsPhenotypeDetected:(id)a18 isOtherSubjectFromPhotoTraitsPhenotypeDetected:(id)a19
{
  id v43 = a3;
  id v42 = a4;
  id v41 = a5;
  id v40 = a6;
  id v39 = a7;
  id v38 = a8;
  id v37 = a9;
  id v36 = a10;
  id v35 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  v44.receiver = self;
  v44.super_class = (Class)BMMomentsEventDataEventBundleClusterMetadata;
  char v33 = [(BMEventBase *)&v44 init];
  if (v33)
  {
    v33->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v43)
    {
      v33->_hasIsFiltered = 1;
      v33->_isFiltered = [v43 BOOLValue];
    }
    else
    {
      v33->_hasIsFiltered = 0;
      v33->_isFiltered = 0;
    }
    if (v42)
    {
      v33->_hasIsTopLevelActivityTypePhenotypeDetected = 1;
      v33->_isTopLevelActivityTypePhenotypeDetected = [v42 BOOLValue];
    }
    else
    {
      v33->_hasIsTopLevelActivityTypePhenotypeDetected = 0;
      v33->_isTopLevelActivityTypePhenotypeDetected = 0;
    }
    if (v41)
    {
      v33->_hasIsSecondLevelActivityTypePhenotypeDetected = 1;
      v33->_isSecondLevelActivityTypePhenotypeDetected = [v41 BOOLValue];
    }
    else
    {
      v33->_hasIsSecondLevelActivityTypePhenotypeDetected = 0;
      v33->_isSecondLevelActivityTypePhenotypeDetected = 0;
    }
    if (v40)
    {
      v33->_hasIsWeekendPhenotypeDetected = 1;
      v33->_isWeekendPhenotypeDetected = [v40 BOOLValue];
    }
    else
    {
      v33->_hasIsWeekendPhenotypeDetected = 0;
      v33->_isWeekendPhenotypeDetected = 0;
    }
    if (v39)
    {
      v33->_hasIsTimeTagPhenotypeDetected = 1;
      v33->_isTimeTagPhenotypeDetected = [v39 BOOLValue];
    }
    else
    {
      v33->_hasIsTimeTagPhenotypeDetected = 0;
      v33->_isTimeTagPhenotypeDetected = 0;
    }
    if (v38)
    {
      v33->_hasIsDayOfWeekPhenotypeDetected = 1;
      v33->_isDayOfWeekPhenotypeDetected = [v38 BOOLValue];
    }
    else
    {
      v33->_hasIsDayOfWeekPhenotypeDetected = 0;
      v33->_isDayOfWeekPhenotypeDetected = 0;
    }
    if (v37)
    {
      v33->_hasIsPlaceNamePhenotypeDetected = 1;
      v33->_isPlaceNamePhenotypeDetected = [v37 BOOLValue];
    }
    else
    {
      v33->_hasIsPlaceNamePhenotypeDetected = 0;
      v33->_isPlaceNamePhenotypeDetected = 0;
    }
    if (v36)
    {
      v33->_hasIsCombinedPlacePhenotypeDetected = 1;
      v33->_isCombinedPlacePhenotypeDetected = [v36 BOOLValue];
    }
    else
    {
      v33->_hasIsCombinedPlacePhenotypeDetected = 0;
      v33->_isCombinedPlacePhenotypeDetected = 0;
    }
    if (v35)
    {
      v33->_hasIsEnclosingAreaNamePhenotypeDetected = 1;
      v33->_isEnclosingAreaNamePhenotypeDetected = [v35 BOOLValue];
    }
    else
    {
      v33->_hasIsEnclosingAreaNamePhenotypeDetected = 0;
      v33->_isEnclosingAreaNamePhenotypeDetected = 0;
    }
    if (v25)
    {
      v33->_hasIsPersonsPhenotypeDetected = 1;
      v33->_isPersonsPhenotypeDetected = [v25 BOOLValue];
    }
    else
    {
      v33->_hasIsPersonsPhenotypeDetected = 0;
      v33->_isPersonsPhenotypeDetected = 0;
    }
    if (v26)
    {
      v33->_hasIsPersonRelationshipPhenotypeDetected = 1;
      v33->_isPersonRelationshipPhenotypeDetected = [v26 BOOLValue];
    }
    else
    {
      v33->_hasIsPersonRelationshipPhenotypeDetected = 0;
      v33->_isPersonRelationshipPhenotypeDetected = 0;
    }
    if (v27)
    {
      v33->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isActivityTypeFromPhotoTraitsPhenotypeDetected = [v27 BOOLValue];
    }
    else
    {
      v33->_hasIsActivityTypeFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isActivityTypeFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v28)
    {
      v33->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isTimeContextFromPhotoTraitsPhenotypeDetected = [v28 BOOLValue];
    }
    else
    {
      v33->_hasIsTimeContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isTimeContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v29)
    {
      v33->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isLocationContextFromPhotoTraitsPhenotypeDetected = [v29 BOOLValue];
    }
    else
    {
      v33->_hasIsLocationContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isLocationContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v30)
    {
      v33->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isSocialContextFromPhotoTraitsPhenotypeDetected = [v30 BOOLValue];
    }
    else
    {
      v33->_hasIsSocialContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isSocialContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v31)
    {
      v33->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isExtraContextFromPhotoTraitsPhenotypeDetected = [v31 BOOLValue];
    }
    else
    {
      v33->_hasIsExtraContextFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isExtraContextFromPhotoTraitsPhenotypeDetected = 0;
    }
    if (v32)
    {
      v33->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = 1;
      v33->_isOtherSubjectFromPhotoTraitsPhenotypeDetected = [v32 BOOLValue];
    }
    else
    {
      v33->_hasIsOtherSubjectFromPhotoTraitsPhenotypeDetected = 0;
      v33->_isOtherSubjectFromPhotoTraitsPhenotypeDetected = 0;
    }
  }

  return v33;
}

+ (id)protoFields
{
  v21[17] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFiltered" number:1 type:12 subMessageClass:0];
  v21[0] = v20;
  unint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTopLevelActivityTypePhenotypeDetected" number:2 type:12 subMessageClass:0];
  v21[1] = v19;
  unsigned int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSecondLevelActivityTypePhenotypeDetected" number:3 type:12 subMessageClass:0];
  v21[2] = v18;
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isWeekendPhenotypeDetected" number:4 type:12 subMessageClass:0];
  v21[3] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTimeTagPhenotypeDetected" number:5 type:12 subMessageClass:0];
  v21[4] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isDayOfWeekPhenotypeDetected" number:6 type:12 subMessageClass:0];
  v21[5] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPlaceNamePhenotypeDetected" number:7 type:12 subMessageClass:0];
  v21[6] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCombinedPlacePhenotypeDetected" number:8 type:12 subMessageClass:0];
  v21[7] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isEnclosingAreaNamePhenotypeDetected" number:9 type:12 subMessageClass:0];
  v21[8] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPersonsPhenotypeDetected" number:10 type:12 subMessageClass:0];
  v21[9] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPersonRelationshipPhenotypeDetected" number:11 type:12 subMessageClass:0];
  v21[10] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActivityTypeFromPhotoTraitsPhenotypeDetected" number:12 type:12 subMessageClass:0];
  v21[11] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isTimeContextFromPhotoTraitsPhenotypeDetected" number:13 type:12 subMessageClass:0];
  v21[12] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isLocationContextFromPhotoTraitsPhenotypeDetected" number:14 type:12 subMessageClass:0];
  v21[13] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSocialContextFromPhotoTraitsPhenotypeDetected" number:15 type:12 subMessageClass:0];
  v21[14] = v8;
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isExtraContextFromPhotoTraitsPhenotypeDetected" number:16 type:12 subMessageClass:0];
  v21[15] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isOtherSubjectFromPhotoTraitsPhenotypeDetected" number:17 type:12 subMessageClass:0];
  v21[16] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:17];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3318;
}

+ (id)columns
{
  v21[17] = *MEMORY[0x1E4F143B8];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFiltered" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  unint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTopLevelActivityTypePhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  unsigned int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSecondLevelActivityTypePhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isWeekendPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTimeTagPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isDayOfWeekPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPlaceNamePhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCombinedPlacePhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isEnclosingAreaNamePhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPersonsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPersonRelationshipPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActivityTypeFromPhotoTraitsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isTimeContextFromPhotoTraitsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isLocationContextFromPhotoTraitsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSocialContextFromPhotoTraitsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isExtraContextFromPhotoTraitsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isOtherSubjectFromPhotoTraitsPhenotypeDetected" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  v21[0] = v20;
  v21[1] = v19;
  v21[2] = v18;
  v21[3] = v17;
  v21[4] = v16;
  v21[5] = v15;
  v21[6] = v14;
  v21[7] = v2;
  v21[8] = v3;
  v21[9] = v4;
  v21[10] = v5;
  v21[11] = v13;
  v21[12] = v6;
  v21[13] = v7;
  v21[14] = v12;
  v21[15] = v8;
  v21[16] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:17];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEventDataEventBundleClusterMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end