@interface BMPhotosStyle
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 faceSizeRatio:(id)a15 isSunsetSunrise:(id)a16 isOutdoor:(id)a17 isFood:(id)a18 isIndoor:(id)a19 salientScenes:(id)a20;
- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 faceSizeRatio:(id)a15 isSunsetSunrise:(id)a16 isOutdoor:(id)a17 isFood:(id)a18 isIndoor:(id)a19 salientScenes:(id)a20 version:(id)a21 sceneForAsset:(id)a22 subjectForAsset:(id)a23;
- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 version:(id)a15 sceneForAsset:(id)a16 subjectForAsset:(id)a17;
- (BMPhotosStyle)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasBrightnessValue;
- (BOOL)hasCamera;
- (BOOL)hasFaceCount;
- (BOOL)hasFaceSizeRatio;
- (BOOL)hasIsFood;
- (BOOL)hasIsIndoor;
- (BOOL)hasIsOutdoor;
- (BOOL)hasIsSunsetSunrise;
- (BOOL)hasPetCount;
- (BOOL)hasStillImageCaptureType;
- (BOOL)hasStillImageProcessingFlags;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFood;
- (BOOL)isIndoor;
- (BOOL)isOutdoor;
- (BOOL)isSunsetSunrise;
- (NSArray)salientScenes;
- (NSArray)sliderValues;
- (NSString)description;
- (NSString)identifier;
- (NSString)sceneForAsset;
- (NSString)styleChoice;
- (NSString)subjectForAsset;
- (double)brightnessValue;
- (double)faceSizeRatio;
- (id)_sliderValuesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)styleSelectionType;
- (int)userLibraryAgeInDays;
- (int)userLibrarySize;
- (unsigned)camera;
- (unsigned)dataVersion;
- (unsigned)faceCount;
- (unsigned)petCount;
- (unsigned)stillImageCaptureType;
- (unsigned)stillImageProcessingFlags;
- (unsigned)version;
- (void)setHasBrightnessValue:(BOOL)a3;
- (void)setHasCamera:(BOOL)a3;
- (void)setHasFaceCount:(BOOL)a3;
- (void)setHasFaceSizeRatio:(BOOL)a3;
- (void)setHasIsFood:(BOOL)a3;
- (void)setHasIsIndoor:(BOOL)a3;
- (void)setHasIsOutdoor:(BOOL)a3;
- (void)setHasIsSunsetSunrise:(BOOL)a3;
- (void)setHasPetCount:(BOOL)a3;
- (void)setHasStillImageCaptureType:(BOOL)a3;
- (void)setHasStillImageProcessingFlags:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPhotosStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_salientScenes, 0);
  objc_storeStrong((id *)&self->_subjectForAsset, 0);
  objc_storeStrong((id *)&self->_sceneForAsset, 0);
  objc_storeStrong((id *)&self->_sliderValues, 0);
  objc_storeStrong((id *)&self->_styleChoice, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)salientScenes
{
  return self->_salientScenes;
}

- (void)setHasIsIndoor:(BOOL)a3
{
  self->_hasIsIndoor = a3;
}

- (BOOL)hasIsIndoor
{
  return self->_hasIsIndoor;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (void)setHasIsFood:(BOOL)a3
{
  self->_hasIsFood = a3;
}

- (BOOL)hasIsFood
{
  return self->_hasIsFood;
}

- (BOOL)isFood
{
  return self->_isFood;
}

- (void)setHasIsOutdoor:(BOOL)a3
{
  self->_hasIsOutdoor = a3;
}

- (BOOL)hasIsOutdoor
{
  return self->_hasIsOutdoor;
}

- (BOOL)isOutdoor
{
  return self->_isOutdoor;
}

- (void)setHasIsSunsetSunrise:(BOOL)a3
{
  self->_hasIsSunsetSunrise = a3;
}

- (BOOL)hasIsSunsetSunrise
{
  return self->_hasIsSunsetSunrise;
}

- (BOOL)isSunsetSunrise
{
  return self->_isSunsetSunrise;
}

- (void)setHasFaceSizeRatio:(BOOL)a3
{
  self->_hasFaceSizeRatio = a3;
}

- (BOOL)hasFaceSizeRatio
{
  return self->_hasFaceSizeRatio;
}

- (double)faceSizeRatio
{
  return self->_faceSizeRatio;
}

- (NSString)subjectForAsset
{
  return self->_subjectForAsset;
}

- (NSString)sceneForAsset
{
  return self->_sceneForAsset;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setHasPetCount:(BOOL)a3
{
  self->_hasPetCount = a3;
}

- (BOOL)hasPetCount
{
  return self->_hasPetCount;
}

- (unsigned)petCount
{
  return self->_petCount;
}

- (void)setHasFaceCount:(BOOL)a3
{
  self->_hasFaceCount = a3;
}

- (BOOL)hasFaceCount
{
  return self->_hasFaceCount;
}

- (unsigned)faceCount
{
  return self->_faceCount;
}

- (void)setHasStillImageCaptureType:(BOOL)a3
{
  self->_hasStillImageCaptureType = a3;
}

- (BOOL)hasStillImageCaptureType
{
  return self->_hasStillImageCaptureType;
}

- (unsigned)stillImageCaptureType
{
  return self->_stillImageCaptureType;
}

- (void)setHasCamera:(BOOL)a3
{
  self->_hasCamera = a3;
}

- (BOOL)hasCamera
{
  return self->_hasCamera;
}

- (unsigned)camera
{
  return self->_camera;
}

- (void)setHasStillImageProcessingFlags:(BOOL)a3
{
  self->_hasStillImageProcessingFlags = a3;
}

- (BOOL)hasStillImageProcessingFlags
{
  return self->_hasStillImageProcessingFlags;
}

- (unsigned)stillImageProcessingFlags
{
  return self->_stillImageProcessingFlags;
}

- (void)setHasBrightnessValue:(BOOL)a3
{
  self->_hasBrightnessValue = a3;
}

- (BOOL)hasBrightnessValue
{
  return self->_hasBrightnessValue;
}

- (double)brightnessValue
{
  return self->_brightnessValue;
}

- (int)userLibraryAgeInDays
{
  return self->_userLibraryAgeInDays;
}

- (int)userLibrarySize
{
  return self->_userLibrarySize;
}

- (NSArray)sliderValues
{
  return self->_sliderValues;
}

- (int)styleSelectionType
{
  return self->_styleSelectionType;
}

- (NSString)styleChoice
{
  return self->_styleChoice;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMPhotosStyle *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPhotosStyle *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_55;
      }
    }
    v13 = [(BMPhotosStyle *)self styleChoice];
    uint64_t v14 = [v5 styleChoice];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMPhotosStyle *)self styleChoice];
      v17 = [v5 styleChoice];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_55;
      }
    }
    int v19 = [(BMPhotosStyle *)self styleSelectionType];
    if (v19 == [v5 styleSelectionType])
    {
      v20 = [(BMPhotosStyle *)self sliderValues];
      uint64_t v21 = [v5 sliderValues];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMPhotosStyle *)self sliderValues];
        v24 = [v5 sliderValues];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_55;
        }
      }
      int v26 = [(BMPhotosStyle *)self userLibrarySize];
      if (v26 != [v5 userLibrarySize]) {
        goto LABEL_55;
      }
      int v27 = [(BMPhotosStyle *)self userLibraryAgeInDays];
      if (v27 != [v5 userLibraryAgeInDays]) {
        goto LABEL_55;
      }
      if ([(BMPhotosStyle *)self hasBrightnessValue]
        || [v5 hasBrightnessValue])
      {
        if (![(BMPhotosStyle *)self hasBrightnessValue]) {
          goto LABEL_55;
        }
        if (![v5 hasBrightnessValue]) {
          goto LABEL_55;
        }
        [(BMPhotosStyle *)self brightnessValue];
        double v29 = v28;
        [v5 brightnessValue];
        if (v29 != v30) {
          goto LABEL_55;
        }
      }
      if ([(BMPhotosStyle *)self hasStillImageProcessingFlags]
        || [v5 hasStillImageProcessingFlags])
      {
        if (![(BMPhotosStyle *)self hasStillImageProcessingFlags]) {
          goto LABEL_55;
        }
        if (![v5 hasStillImageProcessingFlags]) {
          goto LABEL_55;
        }
        unsigned int v31 = [(BMPhotosStyle *)self stillImageProcessingFlags];
        if (v31 != [v5 stillImageProcessingFlags]) {
          goto LABEL_55;
        }
      }
      if (-[BMPhotosStyle hasCamera](self, "hasCamera") || [v5 hasCamera])
      {
        if (![(BMPhotosStyle *)self hasCamera]) {
          goto LABEL_55;
        }
        if (![v5 hasCamera]) {
          goto LABEL_55;
        }
        unsigned int v32 = [(BMPhotosStyle *)self camera];
        if (v32 != [v5 camera]) {
          goto LABEL_55;
        }
      }
      if ([(BMPhotosStyle *)self hasStillImageCaptureType]
        || [v5 hasStillImageCaptureType])
      {
        if (![(BMPhotosStyle *)self hasStillImageCaptureType]) {
          goto LABEL_55;
        }
        if (![v5 hasStillImageCaptureType]) {
          goto LABEL_55;
        }
        unsigned int v33 = [(BMPhotosStyle *)self stillImageCaptureType];
        if (v33 != [v5 stillImageCaptureType]) {
          goto LABEL_55;
        }
      }
      if (-[BMPhotosStyle hasFaceCount](self, "hasFaceCount") || [v5 hasFaceCount])
      {
        if (![(BMPhotosStyle *)self hasFaceCount]) {
          goto LABEL_55;
        }
        if (![v5 hasFaceCount]) {
          goto LABEL_55;
        }
        unsigned int v34 = [(BMPhotosStyle *)self faceCount];
        if (v34 != [v5 faceCount]) {
          goto LABEL_55;
        }
      }
      if (-[BMPhotosStyle hasPetCount](self, "hasPetCount") || [v5 hasPetCount])
      {
        if (![(BMPhotosStyle *)self hasPetCount]) {
          goto LABEL_55;
        }
        if (![v5 hasPetCount]) {
          goto LABEL_55;
        }
        unsigned int v35 = [(BMPhotosStyle *)self petCount];
        if (v35 != [v5 petCount]) {
          goto LABEL_55;
        }
      }
      if (-[BMPhotosStyle hasVersion](self, "hasVersion") || [v5 hasVersion])
      {
        if (![(BMPhotosStyle *)self hasVersion]) {
          goto LABEL_55;
        }
        if (![v5 hasVersion]) {
          goto LABEL_55;
        }
        unsigned int v36 = [(BMPhotosStyle *)self version];
        if (v36 != [v5 version]) {
          goto LABEL_55;
        }
      }
      v37 = [(BMPhotosStyle *)self sceneForAsset];
      uint64_t v38 = [v5 sceneForAsset];
      if (v37 == (void *)v38)
      {
      }
      else
      {
        v39 = (void *)v38;
        v40 = [(BMPhotosStyle *)self sceneForAsset];
        v41 = [v5 sceneForAsset];
        int v42 = [v40 isEqual:v41];

        if (!v42) {
          goto LABEL_55;
        }
      }
      v44 = [(BMPhotosStyle *)self subjectForAsset];
      v45 = [v5 subjectForAsset];
      if (v44 == v45)
      {
        char v12 = 1;
      }
      else
      {
        v46 = [(BMPhotosStyle *)self subjectForAsset];
        v47 = [v5 subjectForAsset];
        char v12 = [v46 isEqual:v47];
      }
      goto LABEL_56;
    }
LABEL_55:
    char v12 = 0;
LABEL_56:

    goto LABEL_57;
  }
  char v12 = 0;
LABEL_57:

  return v12;
}

- (id)jsonDictionary
{
  v54[15] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMPhotosStyle *)self identifier];
  uint64_t v4 = [(BMPhotosStyle *)self styleChoice];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosStyle styleSelectionType](self, "styleSelectionType"));
  uint64_t v6 = [(BMPhotosStyle *)self _sliderValuesJSONArray];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosStyle userLibrarySize](self, "userLibrarySize"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosStyle userLibraryAgeInDays](self, "userLibraryAgeInDays"));
  if (![(BMPhotosStyle *)self hasBrightnessValue]
    || ([(BMPhotosStyle *)self brightnessValue], fabs(v9) == INFINITY))
  {
    id v11 = 0;
  }
  else
  {
    [(BMPhotosStyle *)self brightnessValue];
    v10 = NSNumber;
    [(BMPhotosStyle *)self brightnessValue];
    objc_msgSend(v10, "numberWithDouble:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMPhotosStyle *)self hasStillImageProcessingFlags])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle stillImageProcessingFlags](self, "stillImageProcessingFlags"));
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = 0;
  }
  if ([(BMPhotosStyle *)self hasCamera])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle camera](self, "camera"));
    id v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v51 = 0;
  }
  if ([(BMPhotosStyle *)self hasStillImageCaptureType])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle stillImageCaptureType](self, "stillImageCaptureType"));
    id v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v50 = 0;
  }
  if ([(BMPhotosStyle *)self hasFaceCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle faceCount](self, "faceCount"));
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v49 = 0;
  }
  if ([(BMPhotosStyle *)self hasPetCount])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle petCount](self, "petCount"));
    id v48 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v48 = 0;
  }
  if ([(BMPhotosStyle *)self hasVersion])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle version](self, "version"));
    id v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v47 = 0;
  }
  v46 = [(BMPhotosStyle *)self sceneForAsset];
  char v12 = [(BMPhotosStyle *)self subjectForAsset];
  v53[0] = @"identifier";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v13;
  v54[0] = v13;
  v53[1] = @"styleChoice";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v14;
  v54[1] = v14;
  v53[2] = @"styleSelectionType";
  uint64_t v15 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v38 = (void *)v15;
  v54[2] = v15;
  v53[3] = @"sliderValues";
  uint64_t v16 = v6;
  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v16;
  v54[3] = v16;
  v53[4] = @"userLibrarySize";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v36 = (void *)v17;
  v54[4] = v17;
  v53[5] = @"userLibraryAgeInDays";
  uint64_t v18 = v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v35 = (void *)v18;
  v54[5] = v18;
  v53[6] = @"brightnessValue";
  uint64_t v19 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v8;
  v44 = (void *)v7;
  unsigned int v34 = (void *)v19;
  v54[6] = v19;
  v53[7] = @"stillImageProcessingFlags";
  uint64_t v20 = (uint64_t)v52;
  if (!v52)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v5;
  v54[7] = v20;
  v53[8] = @"camera";
  uint64_t v21 = (uint64_t)v51;
  if (!v51)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v33 = (void *)v20;
  v54[8] = v21;
  v53[9] = @"stillImageCaptureType";
  v22 = v50;
  if (!v50)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v31 = v21;
  v54[9] = v22;
  v53[10] = @"faceCount";
  v23 = v49;
  if (!v49)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v21, v33, v34, v35, v36, v37, v38, v39, v40);
  }
  int v42 = (void *)v6;
  v24 = (void *)v3;
  v54[10] = v23;
  v53[11] = @"petCount";
  int v25 = v48;
  if (!v48)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  int v26 = (void *)v4;
  v54[11] = v25;
  v53[12] = @"version";
  int v27 = v47;
  if (!v47)
  {
    int v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[12] = v27;
  v53[13] = @"sceneForAsset";
  double v28 = v46;
  if (!v46)
  {
    double v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[13] = v28;
  v53[14] = @"subjectForAsset";
  double v29 = v12;
  if (!v12)
  {
    double v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[14] = v29;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v54, v53, 15, v31);
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!v12) {

  }
  if (!v46) {
  if (!v47)
  }

  if (!v48) {
  if (!v49)
  }

  if (!v50) {
  if (!v51)
  }

  if (!v52) {
  if (v11)
  }
  {
    if (v43) {
      goto LABEL_71;
    }
  }
  else
  {

    if (v43)
    {
LABEL_71:
      if (v44) {
        goto LABEL_72;
      }
      goto LABEL_81;
    }
  }

  if (v44)
  {
LABEL_72:
    if (v42) {
      goto LABEL_73;
    }
    goto LABEL_82;
  }
LABEL_81:

  if (v42)
  {
LABEL_73:
    if (v45) {
      goto LABEL_74;
    }
    goto LABEL_83;
  }
LABEL_82:

  if (v45)
  {
LABEL_74:
    if (v26) {
      goto LABEL_75;
    }
LABEL_84:

    if (v24) {
      goto LABEL_76;
    }
    goto LABEL_85;
  }
LABEL_83:

  if (!v26) {
    goto LABEL_84;
  }
LABEL_75:
  if (v24) {
    goto LABEL_76;
  }
LABEL_85:

LABEL_76:

  return v41;
}

- (id)_sliderValuesJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(BMPhotosStyle *)self sliderValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          id v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMPhotosStyle)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v193[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"identifier"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v13 = *MEMORY[0x1E4F502C8];
        uint64_t v192 = *MEMORY[0x1E4F28568];
        long long v14 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
        v193[0] = v14;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:&v192 count:1];
        id v15 = (id)[v12 initWithDomain:v13 code:2 userInfo:v7];
        id v6 = 0;
        long long v16 = 0;
        *a4 = v15;
        goto LABEL_158;
      }
      id v6 = 0;
      long long v16 = 0;
      goto LABEL_159;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"styleChoice"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v190 = *MEMORY[0x1E4F28568];
        uint64_t v19 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"styleChoice"];
        uint64_t v191 = v19;
        v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
        id v20 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, 2);
        long long v14 = 0;
        long long v16 = 0;
        *a4 = v20;
        double v10 = (void *)v19;
        goto LABEL_157;
      }
      long long v14 = 0;
      long long v16 = 0;
      goto LABEL_158;
    }
    id v150 = v7;
  }
  else
  {
    id v150 = 0;
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"styleSelectionType"];
  v149 = v7;
  v151 = (void *)v8;
  if (v8 && (double v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v46 = *MEMORY[0x1E4F502C8];
          uint64_t v188 = *MEMORY[0x1E4F28568];
          id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"styleSelectionType"];
          id v189 = v21;
          v154 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v189 forKeys:&v188 count:1];
          id v47 = (id)objc_msgSend(v45, "initWithDomain:code:userInfo:", v46, 2);
          double v10 = 0;
          long long v16 = 0;
          *a4 = v47;
          long long v14 = v150;
          goto LABEL_155;
        }
        double v10 = 0;
        long long v16 = 0;
        long long v14 = v150;
        goto LABEL_157;
      }
      id v11 = [NSNumber numberWithInt:BMPhotosStyleStyleSelectionTypeFromString(v9)];
    }
    double v10 = v11;
  }
  else
  {
    double v10 = 0;
  }
  id v21 = [v4 objectForKeyedSubscript:@"sliderValues"];
  v22 = [MEMORY[0x1E4F1CA98] null];
  int v23 = [v21 isEqual:v22];

  id v147 = v6;
  v148 = v10;
  if (v23)
  {

    id v21 = 0;
  }
  else if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        long long v16 = 0;
        long long v14 = v150;
        goto LABEL_156;
      }
      id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v42 = *MEMORY[0x1E4F502C8];
      uint64_t v186 = *MEMORY[0x1E4F28568];
      v154 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"sliderValues"];
      v187 = v154;
      double v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v187 forKeys:&v186 count:1];
      id v43 = (id)[v41 initWithDomain:v42 code:2 userInfo:v30];
      long long v16 = 0;
      *a4 = v43;
LABEL_47:
      long long v14 = v150;
      goto LABEL_154;
    }
  }
  v154 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id v21 = v21;
  uint64_t v24 = [v21 countByEnumeratingWithState:&v155 objects:v185 count:16];
  if (!v24) {
    goto LABEL_36;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v156;
  while (2)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v156 != v26) {
        objc_enumerationMutation(v21);
      }
      uint64_t v28 = *(void *)(*((void *)&v155 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v31 = a4;
        if (a4)
        {
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v183 = *MEMORY[0x1E4F28568];
          uint64_t v34 = [[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"sliderValues"];
          uint64_t v184 = v34;
          uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
          unsigned int v36 = v32;
          uint64_t v37 = v33;
          double v29 = (void *)v34;
LABEL_43:
          v40 = (id *)v35;
          id v6 = v147;
          long long v14 = v150;
          long long v16 = 0;
          *uint64_t v31 = (id)objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, 2);
          double v30 = v21;
          goto LABEL_152;
        }
        goto LABEL_44;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v181 = *MEMORY[0x1E4F28568];
          uint64_t v31 = a4;
          double v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sliderValues"];
          v182 = v29;
          uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
          unsigned int v36 = v38;
          uint64_t v37 = v39;
          goto LABEL_43;
        }
LABEL_44:
        long long v16 = 0;
        double v30 = v21;
        id v6 = v147;
        goto LABEL_47;
      }
      [v154 addObject:v28];
    }
    uint64_t v25 = [v21 countByEnumeratingWithState:&v155 objects:v185 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_36:

  double v29 = [v4 objectForKeyedSubscript:@"userLibrarySize"];
  if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v30 = 0;
LABEL_58:
    id v6 = v147;
    uint64_t v48 = [v4 objectForKeyedSubscript:@"userLibraryAgeInDays"];
    v144 = (void *)v48;
    if (v48)
    {
      id v49 = (void *)v48;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v132 = v30;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v142 = v49;
          goto LABEL_65;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v142 = [NSNumber numberWithInt:BMPhotosStyleUserLibraryAgeInDaysTypeFromString(v49)];
          goto LABEL_65;
        }
        v40 = a4;
        if (a4)
        {
          id v91 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v92 = *MEMORY[0x1E4F502C8];
          uint64_t v177 = *MEMORY[0x1E4F28568];
          id v143 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userLibraryAgeInDays"];
          id v178 = v143;
          v146 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
          id v93 = (id)[v91 initWithDomain:v92 code:2 userInfo:v146];
          v40 = 0;
          long long v16 = 0;
          *a4 = v93;
          long long v14 = v150;
          double v30 = v132;
          goto LABEL_150;
        }
        long long v16 = 0;
        long long v14 = v150;
        goto LABEL_151;
      }
    }
    v142 = 0;
LABEL_65:
    v146 = [v4 objectForKeyedSubscript:@"brightnessValue"];
    if (v146 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v143 = v146;
        goto LABEL_68;
      }
      if (!a4)
      {
        id v143 = 0;
        long long v16 = 0;
        long long v14 = v150;
        v40 = v142;
        goto LABEL_150;
      }
      id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
      v133 = v30;
      v64 = v29;
      uint64_t v65 = *MEMORY[0x1E4F502C8];
      uint64_t v175 = *MEMORY[0x1E4F28568];
      id v141 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"brightnessValue"];
      id v176 = v141;
      uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
      uint64_t v67 = v65;
      double v29 = v64;
      double v30 = v133;
      v140 = (void *)v66;
      id v68 = (id)objc_msgSend(v63, "initWithDomain:code:userInfo:", v67, 2);
      long long v16 = 0;
      id v143 = 0;
      *a4 = v68;
      id v6 = v147;
    }
    else
    {
      id v143 = 0;
LABEL_68:
      uint64_t v50 = [v4 objectForKeyedSubscript:@"stillImageProcessingFlags"];
      v140 = (void *)v50;
      if (!v50 || (id v51 = (void *)v50, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v141 = 0;
LABEL_71:
        uint64_t v52 = [v4 objectForKeyedSubscript:@"camera"];
        v130 = (void *)v52;
        if (!v52 || (v53 = (void *)v52, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v131 = 0;
LABEL_74:
          uint64_t v54 = [v4 objectForKeyedSubscript:@"stillImageCaptureType"];
          v128 = (void *)v54;
          if (!v54 || (v55 = (void *)v54, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v129 = 0;
LABEL_77:
            uint64_t v56 = [v4 objectForKeyedSubscript:@"faceCount"];
            v126 = (void *)v56;
            if (!v56 || (v57 = (void *)v56, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v127 = 0;
LABEL_80:
              uint64_t v58 = [v4 objectForKeyedSubscript:@"petCount"];
              v122 = (void *)v58;
              if (!v58 || (v59 = (void *)v58, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v125 = 0;
LABEL_83:
                uint64_t v60 = [v4 objectForKeyedSubscript:@"version"];
                v124 = v29;
                v121 = (void *)v60;
                if (!v60 || (v61 = (void *)v60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v123 = 0;
                  goto LABEL_86;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v123 = v61;
LABEL_86:
                  id v62 = [v4 objectForKeyedSubscript:@"sceneForAsset"];
                  id v119 = v62;
                  if (v62)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v62 = 0;
                      goto LABEL_112;
                    }
                    v136 = v30;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v62 = v62;
                      goto LABEL_112;
                    }
                    if (a4)
                    {
                      id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v111 = *MEMORY[0x1E4F502C8];
                      uint64_t v161 = *MEMORY[0x1E4F28568];
                      id v82 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sceneForAsset"];
                      id v162 = v82;
                      v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
                      id v112 = (id)[v110 initWithDomain:v111 code:2 userInfo:v81];
                      long long v16 = 0;
                      v120 = 0;
                      *a4 = v112;
                      goto LABEL_140;
                    }
                    v120 = 0;
                    long long v16 = 0;
                    long long v14 = v150;
LABEL_142:
                    v40 = v142;
                    v108 = v119;
LABEL_143:

                    double v29 = v124;
LABEL_144:

LABEL_145:
LABEL_146:

LABEL_147:
LABEL_148:

LABEL_149:
LABEL_150:

LABEL_151:
LABEL_152:

                    goto LABEL_153;
                  }
LABEL_112:
                  v81 = [v4 objectForKeyedSubscript:@"subjectForAsset"];
                  v120 = v62;
                  if (!v81 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v82 = 0;
                    goto LABEL_115;
                  }
                  v136 = v30;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v82 = v81;
LABEL_115:
                    long long v16 = objc_retain(-[BMPhotosStyle initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:](self, "initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:", v147, v150, [v148 intValue], v154, objc_msgSend(v30, "intValue"), objc_msgSend(v142, "intValue"), v143, v141, v131, v129, v127, v125, v123, v62,
                              v82));
                    self = v16;
                  }
                  else
                  {
                    if (a4)
                    {
                      id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v114 = *MEMORY[0x1E4F502C8];
                      uint64_t v159 = *MEMORY[0x1E4F28568];
                      id v115 = v4;
                      v116 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subjectForAsset"];
                      v160 = v116;
                      v117 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
                      *a4 = (id)[v113 initWithDomain:v114 code:2 userInfo:v117];

                      id v4 = v115;
                    }
                    id v82 = 0;
                    long long v16 = 0;
LABEL_140:
                    double v30 = v136;
                  }

                  long long v14 = v150;
                  goto LABEL_142;
                }
                if (a4)
                {
                  id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v107 = *MEMORY[0x1E4F502C8];
                  uint64_t v163 = *MEMORY[0x1E4F28568];
                  v120 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"version"];
                  v164 = v120;
                  v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
                  id v109 = (id)[v106 initWithDomain:v107 code:2 userInfo:v108];
                  long long v16 = 0;
                  id v123 = 0;
                  *a4 = v109;
                  long long v14 = v150;
                  v40 = v142;
                  goto LABEL_143;
                }
                id v123 = 0;
                long long v16 = 0;
LABEL_169:
                long long v14 = v150;
                v40 = v142;
                goto LABEL_144;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v125 = v59;
                goto LABEL_83;
              }
              if (a4)
              {
                id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
                v139 = v30;
                v101 = v29;
                uint64_t v102 = *MEMORY[0x1E4F502C8];
                uint64_t v165 = *MEMORY[0x1E4F28568];
                id v123 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"petCount"];
                id v166 = v123;
                uint64_t v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
                uint64_t v104 = v102;
                double v29 = v101;
                double v30 = v139;
                v121 = (void *)v103;
                id v105 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v104, 2);
                long long v16 = 0;
                id v125 = 0;
                *a4 = v105;
                id v6 = v147;
                goto LABEL_169;
              }
              id v125 = 0;
              long long v16 = 0;
LABEL_167:
              long long v14 = v150;
              v40 = v142;
              goto LABEL_145;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v127 = v57;
              goto LABEL_80;
            }
            if (a4)
            {
              id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
              v138 = v30;
              v95 = v29;
              uint64_t v96 = *MEMORY[0x1E4F502C8];
              uint64_t v167 = *MEMORY[0x1E4F28568];
              id v125 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"faceCount"];
              id v168 = v125;
              uint64_t v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
              uint64_t v98 = v96;
              double v29 = v95;
              double v30 = v138;
              v122 = (void *)v97;
              id v99 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v98, 2);
              long long v16 = 0;
              id v127 = 0;
              *a4 = v99;
              id v6 = v147;
              goto LABEL_167;
            }
            id v127 = 0;
            long long v16 = 0;
LABEL_165:
            long long v14 = v150;
            v40 = v142;
            goto LABEL_146;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v129 = v55;
            goto LABEL_77;
          }
          if (a4)
          {
            id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
            v137 = v30;
            v84 = v29;
            uint64_t v85 = *MEMORY[0x1E4F502C8];
            uint64_t v169 = *MEMORY[0x1E4F28568];
            id v127 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stillImageCaptureType"];
            id v170 = v127;
            uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
            uint64_t v87 = v85;
            double v29 = v84;
            double v30 = v137;
            v126 = (void *)v86;
            id v88 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v87, 2);
            long long v16 = 0;
            id v129 = 0;
            *a4 = v88;
            id v6 = v147;
            goto LABEL_165;
          }
          id v129 = 0;
          long long v16 = 0;
LABEL_161:
          long long v14 = v150;
          v40 = v142;
          goto LABEL_147;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v131 = v53;
          goto LABEL_74;
        }
        if (a4)
        {
          id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
          v135 = v30;
          v76 = v29;
          uint64_t v77 = *MEMORY[0x1E4F502C8];
          uint64_t v171 = *MEMORY[0x1E4F28568];
          id v129 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"camera"];
          id v172 = v129;
          uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
          uint64_t v79 = v77;
          double v29 = v76;
          double v30 = v135;
          v128 = (void *)v78;
          id v80 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v79, 2);
          long long v16 = 0;
          id v131 = 0;
          *a4 = v80;
          id v6 = v147;
          goto LABEL_161;
        }
        id v131 = 0;
        long long v16 = 0;
LABEL_136:
        long long v14 = v150;
        v40 = v142;
        goto LABEL_148;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v141 = v51;
        goto LABEL_71;
      }
      if (a4)
      {
        id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
        v134 = v30;
        v70 = v29;
        uint64_t v71 = *MEMORY[0x1E4F502C8];
        uint64_t v173 = *MEMORY[0x1E4F28568];
        id v131 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stillImageProcessingFlags"];
        id v174 = v131;
        uint64_t v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
        uint64_t v73 = v71;
        double v29 = v70;
        double v30 = v134;
        v130 = (void *)v72;
        id v74 = (id)objc_msgSend(v69, "initWithDomain:code:userInfo:", v73, 2);
        long long v16 = 0;
        id v141 = 0;
        *a4 = v74;
        id v6 = v147;
        goto LABEL_136;
      }
      id v141 = 0;
      long long v16 = 0;
    }
    long long v14 = v150;
    v40 = v142;
    goto LABEL_149;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v29;
LABEL_57:
    double v30 = v44;
    goto LABEL_58;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = [NSNumber numberWithInt:BMPhotosStyleLibrarySizeTypeFromString(v29)];
    goto LABEL_57;
  }
  double v30 = a4;
  if (a4)
  {
    id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v90 = *MEMORY[0x1E4F502C8];
    uint64_t v179 = *MEMORY[0x1E4F28568];
    v40 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userLibrarySize"];
    v180 = v40;
    v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
    long long v16 = 0;
    *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 2);
    double v30 = 0;
    id v6 = v147;
    long long v14 = v150;

    goto LABEL_152;
  }
  long long v16 = 0;
  id v6 = v147;
  long long v14 = v150;
LABEL_153:

LABEL_154:
  double v10 = v148;
LABEL_155:

LABEL_156:
  uint64_t v7 = v149;
LABEL_157:

LABEL_158:
LABEL_159:

  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPhotosStyle *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_styleChoice) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_sliderValues;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "floatValue", (void)v10);
        PBDataWriterWriteFloatField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasBrightnessValue) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasStillImageProcessingFlags) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasCamera) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStillImageCaptureType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFaceCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasPetCount) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasVersion) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_sceneForAsset) {
    PBDataWriterWriteStringField();
  }
  if (self->_subjectForAsset) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)BMPhotosStyle;
  uint64_t v5 = [(BMEventBase *)&v96 init];
  if (!v5) {
    goto LABEL_149;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  long long v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          uint64_t v20 = *v10;
          int v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      uint64_t v20 = *v10;
      int v21 = v4[v20];
      if (v4[v20]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v21 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 72;
          goto LABEL_95;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 80;
          goto LABEL_95;
        case 3u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v28 = *v8;
            uint64_t v29 = *(void *)&v4[v28];
            unint64_t v30 = v29 + 1;
            if (v29 == -1 || v30 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v11] + v29);
              *(void *)&v4[v28] = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                BOOL v19 = v26++ >= 9;
                if (v19)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v27) = 0;
          }
LABEL_99:
          if (v27 >= 3) {
            LODWORD(v27) = 0;
          }
          uint64_t v87 = 36;
          goto LABEL_126;
        case 4u:
          v57 = NSNumber;
          uint64_t v58 = *v8;
          unint64_t v59 = *(void *)&v4[v58];
          if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(void *)&v4[*v9])
          {
            LODWORD(v7) = *(_DWORD *)(*(void *)&v4[*v11] + v59);
            *(void *)&v4[v58] = v59 + 4;
          }
          else
          {
            v4[v20] = 1;
            double v7 = 0.0;
          }
          uint64_t v89 = [v57 numberWithFloat:v7];
          if (!v89) {
            goto LABEL_151;
          }
          uint64_t v90 = (void *)v89;
          [v6 addObject:v89];

          continue;
        case 5u:
          char v60 = 0;
          unsigned int v61 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v62 = *v8;
            uint64_t v63 = *(void *)&v4[v62];
            unint64_t v64 = v63 + 1;
            if (v63 == -1 || v64 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v65 = *(unsigned char *)(*(void *)&v4[*v11] + v63);
              *(void *)&v4[v62] = v64;
              v27 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                BOOL v19 = v61++ >= 9;
                if (v19)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v27) = 0;
          }
LABEL_123:
          if (v27 >= 6) {
            LODWORD(v27) = 0;
          }
          uint64_t v87 = 40;
          goto LABEL_126;
        case 6u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v27 = 0;
          while (2)
          {
            uint64_t v34 = *v8;
            uint64_t v35 = *(void *)&v4[v34];
            unint64_t v36 = v35 + 1;
            if (v35 == -1 || v36 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)&v4[*v11] + v35);
              *(void *)&v4[v34] = v36;
              v27 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                BOOL v19 = v33++ >= 9;
                if (v19)
                {
                  LODWORD(v27) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v27) = 0;
          }
LABEL_105:
          if (v27 >= 6) {
            LODWORD(v27) = 0;
          }
          uint64_t v87 = 44;
LABEL_126:
          *(_DWORD *)((char *)&v5->super.super.isa + v87) = v27;
          continue;
        case 7u:
          v5->_hasBrightnessValue = 1;
          uint64_t v66 = *v8;
          unint64_t v67 = *(void *)&v4[v66];
          if (v67 <= 0xFFFFFFFFFFFFFFF7 && v67 + 8 <= *(void *)&v4[*v9])
          {
            double v7 = *(double *)(*(void *)&v4[*v11] + v67);
            *(void *)&v4[v66] = v67 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v7 = 0.0;
          }
          v5->_brightnessValue = v7;
          continue;
        case 8u:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v40 = 0;
          v5->_hasStillImageProcessingFlags = 1;
          while (2)
          {
            uint64_t v70 = *v8;
            uint64_t v71 = *(void *)&v4[v70];
            unint64_t v72 = v71 + 1;
            if (v71 == -1 || v72 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v73 = *(unsigned char *)(*(void *)&v4[*v11] + v71);
              *(void *)&v4[v70] = v72;
              v40 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                BOOL v19 = v69++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v40) = 0;
          }
LABEL_130:
          uint64_t v88 = 48;
          goto LABEL_139;
        case 9u:
          char v74 = 0;
          unsigned int v75 = 0;
          uint64_t v40 = 0;
          v5->_hasCamera = 1;
          while (2)
          {
            uint64_t v76 = *v8;
            uint64_t v77 = *(void *)&v4[v76];
            unint64_t v78 = v77 + 1;
            if (v77 == -1 || v78 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v79 = *(unsigned char *)(*(void *)&v4[*v11] + v77);
              *(void *)&v4[v76] = v78;
              v40 |= (unint64_t)(v79 & 0x7F) << v74;
              if (v79 < 0)
              {
                v74 += 7;
                BOOL v19 = v75++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_134;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v40) = 0;
          }
LABEL_134:
          uint64_t v88 = 52;
          goto LABEL_139;
        case 0xAu:
          char v80 = 0;
          unsigned int v81 = 0;
          uint64_t v40 = 0;
          v5->_hasStillImageCaptureType = 1;
          while (2)
          {
            uint64_t v82 = *v8;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v11] + v83);
              *(void *)&v4[v82] = v84;
              v40 |= (unint64_t)(v85 & 0x7F) << v80;
              if (v85 < 0)
              {
                v80 += 7;
                BOOL v19 = v81++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_138;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v40) = 0;
          }
LABEL_138:
          uint64_t v88 = 56;
          goto LABEL_139;
        case 0xBu:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v40 = 0;
          v5->_hasFaceCount = 1;
          while (2)
          {
            uint64_t v41 = *v8;
            uint64_t v42 = *(void *)&v4[v41];
            unint64_t v43 = v42 + 1;
            if (v42 == -1 || v43 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v11] + v42);
              *(void *)&v4[v41] = v43;
              v40 |= (unint64_t)(v44 & 0x7F) << v38;
              if (v44 < 0)
              {
                v38 += 7;
                BOOL v19 = v39++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v40) = 0;
          }
LABEL_111:
          uint64_t v88 = 60;
          goto LABEL_139;
        case 0xCu:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v40 = 0;
          v5->_hasPetCount = 1;
          while (2)
          {
            uint64_t v47 = *v8;
            uint64_t v48 = *(void *)&v4[v47];
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)&v4[*v11] + v48);
              *(void *)&v4[v47] = v49;
              v40 |= (unint64_t)(v50 & 0x7F) << v45;
              if (v50 < 0)
              {
                v45 += 7;
                BOOL v19 = v46++ >= 9;
                if (v19)
                {
                  LODWORD(v40) = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v40) = 0;
          }
LABEL_115:
          uint64_t v88 = 64;
          goto LABEL_139;
        case 0x13u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v40 = 0;
          v5->_hasVersion = 1;
          break;
        case 0x14u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 104;
          goto LABEL_95;
        case 0x15u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 112;
LABEL_95:
          uint64_t v86 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_151:

          goto LABEL_148;
      }
      while (1)
      {
        uint64_t v53 = *v8;
        uint64_t v54 = *(void *)&v4[v53];
        unint64_t v55 = v54 + 1;
        if (v54 == -1 || v55 > *(void *)&v4[*v9]) {
          break;
        }
        char v56 = *(unsigned char *)(*(void *)&v4[*v11] + v54);
        *(void *)&v4[v53] = v55;
        v40 |= (unint64_t)(v56 & 0x7F) << v51;
        if ((v56 & 0x80) == 0) {
          goto LABEL_117;
        }
        v51 += 7;
        BOOL v19 = v52++ >= 9;
        if (v19)
        {
          LODWORD(v40) = 0;
          goto LABEL_119;
        }
      }
      v4[*v10] = 1;
LABEL_117:
      if (v4[*v10]) {
        LODWORD(v40) = 0;
      }
LABEL_119:
      uint64_t v88 = 68;
LABEL_139:
      *(_DWORD *)((char *)&v5->super.super.isa + v88) = v40;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v91 = [v6 copy];
  sliderValues = v5->_sliderValues;
  v5->_sliderValues = (NSArray *)v91;

  int v93 = v4[*v10];
  if (v93) {
LABEL_148:
  }
    id v94 = 0;
  else {
LABEL_149:
  }
    id v94 = v5;

  return v94;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  unint64_t v17 = [(BMPhotosStyle *)self identifier];
  int v21 = [(BMPhotosStyle *)self styleChoice];
  uint64_t v20 = BMPhotosStyleStyleSelectionTypeAsString([(BMPhotosStyle *)self styleSelectionType]);
  unsigned int v13 = [(BMPhotosStyle *)self sliderValues];
  uint64_t v16 = BMPhotosStyleLibrarySizeTypeAsString([(BMPhotosStyle *)self userLibrarySize]);
  uint64_t v15 = BMPhotosStyleUserLibraryAgeInDaysTypeAsString([(BMPhotosStyle *)self userLibraryAgeInDays]);
  uint64_t v3 = NSNumber;
  [(BMPhotosStyle *)self brightnessValue];
  unint64_t v14 = objc_msgSend(v3, "numberWithDouble:");
  char v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle stillImageProcessingFlags](self, "stillImageProcessingFlags"));
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle camera](self, "camera"));
  long long v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle stillImageCaptureType](self, "stillImageCaptureType"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle faceCount](self, "faceCount"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle petCount](self, "petCount"));
  double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPhotosStyle version](self, "version"));
  uint64_t v8 = [(BMPhotosStyle *)self sceneForAsset];
  uint64_t v9 = [(BMPhotosStyle *)self subjectForAsset];
  BOOL v19 = (void *)[v18 initWithFormat:@"BMPhotosStyle with identifier: %@, styleChoice: %@, styleSelectionType: %@, sliderValues: %@, userLibrarySize: %@, userLibraryAgeInDays: %@, brightnessValue: %@, stillImageProcessingFlags: %@, camera: %@, stillImageCaptureType: %@, faceCount: %@, petCount: %@, version: %@, sceneForAsset: %@, subjectForAsset: %@", v17, v21, v20, v13, v16, v15, v14, v12, v4, v11, v5, v6, v7, v8, v9];

  return (NSString *)v19;
}

- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 version:(id)a15 sceneForAsset:(id)a16 subjectForAsset:(id)a17
{
  id v46 = a3;
  id v36 = a4;
  id v45 = a4;
  id v38 = a6;
  id v44 = a6;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v43 = a16;
  id v42 = a17;
  v47.receiver = self;
  v47.super_class = (Class)BMPhotosStyle;
  unsigned int v26 = [(BMEventBase *)&v47 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v26->_identifier, a3);
    objc_storeStrong((id *)&v26->_styleChoice, v36);
    v26->_styleSelectionType = a5;
    objc_storeStrong((id *)&v26->_sliderValues, v38);
    v26->_userLibrarySize = a7;
    v26->_userLibraryAgeInDays = a8;
    if (v19)
    {
      v26->_hasBrightnessValue = 1;
      [v19 doubleValue];
    }
    else
    {
      v26->_hasBrightnessValue = 0;
      double v27 = -1.0;
    }
    v26->_brightnessValue = v27;
    if (v20)
    {
      v26->_hasStillImageProcessingFlags = 1;
      unsigned int v28 = [v20 unsignedIntValue];
    }
    else
    {
      unsigned int v28 = 0;
      v26->_hasStillImageProcessingFlags = 0;
    }
    v26->_stillImageProcessingFlags = v28;
    if (v21)
    {
      v26->_hasCamera = 1;
      unsigned int v29 = [v21 unsignedIntValue];
    }
    else
    {
      unsigned int v29 = 0;
      v26->_hasCamera = 0;
    }
    v26->_camera = v29;
    if (v22)
    {
      v26->_hasStillImageCaptureType = 1;
      unsigned int v30 = [v22 unsignedIntValue];
    }
    else
    {
      unsigned int v30 = 0;
      v26->_hasStillImageCaptureType = 0;
    }
    v26->_stillImageCaptureType = v30;
    if (v23)
    {
      v26->_hasFaceCount = 1;
      unsigned int v31 = [v23 unsignedIntValue];
    }
    else
    {
      unsigned int v31 = 0;
      v26->_hasFaceCount = 0;
    }
    v26->_faceCount = v31;
    if (v24)
    {
      v26->_hasPetCount = 1;
      unsigned int v32 = [v24 unsignedIntValue];
    }
    else
    {
      unsigned int v32 = 0;
      v26->_hasPetCount = 0;
    }
    v26->_petCount = v32;
    if (v25)
    {
      v26->_hasVersion = 1;
      unsigned int v33 = [v25 unsignedIntValue];
    }
    else
    {
      unsigned int v33 = 0;
      v26->_hasVersion = 0;
    }
    v26->_version = v33;
    objc_storeStrong((id *)&v26->_sceneForAsset, a16);
    objc_storeStrong((id *)&v26->_subjectForAsset, a17);
  }

  return v26;
}

+ (id)protoFields
{
  v25[21] = *MEMORY[0x1E4F143B8];
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v25[0] = v24;
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"styleChoice" number:2 type:13 subMessageClass:0];
  v25[1] = v23;
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"styleSelectionType" number:3 type:4 subMessageClass:0];
  v25[2] = v22;
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sliderValues" number:4 type:1 subMessageClass:0];
  v25[3] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userLibrarySize" number:5 type:4 subMessageClass:0];
  v25[4] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userLibraryAgeInDays" number:6 type:4 subMessageClass:0];
  v25[5] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"brightnessValue" number:7 type:0 subMessageClass:0];
  v25[6] = v18;
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stillImageProcessingFlags" number:8 type:4 subMessageClass:0];
  v25[7] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"camera" number:9 type:4 subMessageClass:0];
  v25[8] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stillImageCaptureType" number:10 type:4 subMessageClass:0];
  v25[9] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"faceCount" number:11 type:4 subMessageClass:0];
  v25[10] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"petCount" number:12 type:4 subMessageClass:0];
  v25[11] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"faceSizeRatio" number:13 type:1 subMessageClass:0];
  v25[12] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSunsetSunrise" number:14 type:12 subMessageClass:0];
  v25[13] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isOutdoor" number:15 type:12 subMessageClass:0];
  v25[14] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFood" number:16 type:12 subMessageClass:0];
  v25[15] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isIndoor" number:17 type:12 subMessageClass:0];
  v25[16] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"salientScenes" number:18 type:4 subMessageClass:0];
  v25[17] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"version" number:19 type:4 subMessageClass:0];
  v25[18] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sceneForAsset" number:20 type:13 subMessageClass:0];
  v25[19] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subjectForAsset" number:21 type:13 subMessageClass:0];
  v25[20] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:21];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5748;
}

+ (id)columns
{
  v25[21] = *MEMORY[0x1E4F143B8];
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"styleChoice" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"styleSelectionType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"sliderValues_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_142];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userLibrarySize" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userLibraryAgeInDays" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"brightnessValue" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:0 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stillImageProcessingFlags" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"camera" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stillImageCaptureType" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"faceCount" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"petCount" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"faceSizeRatio" dataType:1 requestOnly:0 fieldNumber:13 protoDataType:1 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSunsetSunrise" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isOutdoor" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFood" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isIndoor" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:12 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"salientScenes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_144];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"version" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sceneForAsset" dataType:2 requestOnly:0 fieldNumber:20 protoDataType:13 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subjectForAsset" dataType:2 requestOnly:0 fieldNumber:21 protoDataType:13 convertedType:0];
  v25[0] = v24;
  v25[1] = v23;
  v25[2] = v22;
  v25[3] = v13;
  v25[4] = v21;
  v25[5] = v20;
  v25[6] = v19;
  v25[7] = v18;
  v25[8] = v17;
  v25[9] = v16;
  v25[10] = v15;
  v25[11] = v2;
  v25[12] = v3;
  v25[13] = v14;
  v25[14] = v4;
  v25[15] = v5;
  v25[16] = v6;
  v25[17] = v7;
  v25[18] = v12;
  v25[19] = v8;
  v25[20] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:21];

  return v11;
}

uint64_t __24__BMPhotosStyle_columns__block_invoke_2()
{
  return 0;
}

id __24__BMPhotosStyle_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _sliderValuesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMPhotosStyle alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 faceSizeRatio:(id)a15 isSunsetSunrise:(id)a16 isOutdoor:(id)a17 isFood:(id)a18 isIndoor:(id)a19 salientScenes:(id)a20 version:(id)a21 sceneForAsset:(id)a22 subjectForAsset:(id)a23
{
  return -[BMPhotosStyle initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:](self, "initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:", a3, a4, *(void *)&a5, a6, *(void *)&a7, *(void *)&a8);
}

- (BMPhotosStyle)initWithIdentifier:(id)a3 styleChoice:(id)a4 styleSelectionType:(int)a5 sliderValues:(id)a6 userLibrarySize:(int)a7 userLibraryAgeInDays:(int)a8 brightnessValue:(id)a9 stillImageProcessingFlags:(id)a10 camera:(id)a11 stillImageCaptureType:(id)a12 faceCount:(id)a13 petCount:(id)a14 faceSizeRatio:(id)a15 isSunsetSunrise:(id)a16 isOutdoor:(id)a17 isFood:(id)a18 isIndoor:(id)a19 salientScenes:(id)a20
{
  return -[BMPhotosStyle initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:](self, "initWithIdentifier:styleChoice:styleSelectionType:sliderValues:userLibrarySize:userLibraryAgeInDays:brightnessValue:stillImageProcessingFlags:camera:stillImageCaptureType:faceCount:petCount:version:sceneForAsset:subjectForAsset:", a3, a4, *(void *)&a5, a6, *(void *)&a7, *(void *)&a8);
}

@end