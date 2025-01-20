@interface BMOasisAnalyticsGazeSample
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsGazeSample)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsGazeSample)initWithUserProfileId:(id)a3 eyeSide:(int)a4 pupilSizeCategory:(int)a5 offsetWithinEyeboxX:(id)a6 offsetWithinEyeboxY:(id)a7 offsetWithinEyeboxZ:(id)a8 totalEyeRelief:(id)a9 nearEyeRelief:(id)a10 pupil2dVisibleRatioNecam:(id)a11 pupil2dVisibleRatioBecam:(id)a12 pupilIrisContrastNecam:(id)a13 pupilIrisContrastBecam:(id)a14 countOfVisibleGlintsNecam:(id)a15 countOfVisibleGlintsBecam:(id)a16 temperatureCelsiusNecam:(id)a17 temperatureCelsiusBecam:(id)a18;
- (BOOL)hasCountOfVisibleGlintsBecam;
- (BOOL)hasCountOfVisibleGlintsNecam;
- (BOOL)hasNearEyeRelief;
- (BOOL)hasOffsetWithinEyeboxX;
- (BOOL)hasOffsetWithinEyeboxY;
- (BOOL)hasOffsetWithinEyeboxZ;
- (BOOL)hasPupil2dVisibleRatioBecam;
- (BOOL)hasPupil2dVisibleRatioNecam;
- (BOOL)hasPupilIrisContrastBecam;
- (BOOL)hasPupilIrisContrastNecam;
- (BOOL)hasTemperatureCelsiusBecam;
- (BOOL)hasTemperatureCelsiusNecam;
- (BOOL)hasTotalEyeRelief;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)userProfileId;
- (float)nearEyeRelief;
- (float)offsetWithinEyeboxX;
- (float)offsetWithinEyeboxY;
- (float)offsetWithinEyeboxZ;
- (float)pupil2dVisibleRatioBecam;
- (float)pupil2dVisibleRatioNecam;
- (float)pupilIrisContrastBecam;
- (float)pupilIrisContrastNecam;
- (float)temperatureCelsiusBecam;
- (float)temperatureCelsiusNecam;
- (float)totalEyeRelief;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)eyeSide;
- (int)pupilSizeCategory;
- (unsigned)countOfVisibleGlintsBecam;
- (unsigned)countOfVisibleGlintsNecam;
- (unsigned)dataVersion;
- (void)setHasCountOfVisibleGlintsBecam:(BOOL)a3;
- (void)setHasCountOfVisibleGlintsNecam:(BOOL)a3;
- (void)setHasNearEyeRelief:(BOOL)a3;
- (void)setHasOffsetWithinEyeboxX:(BOOL)a3;
- (void)setHasOffsetWithinEyeboxY:(BOOL)a3;
- (void)setHasOffsetWithinEyeboxZ:(BOOL)a3;
- (void)setHasPupil2dVisibleRatioBecam:(BOOL)a3;
- (void)setHasPupil2dVisibleRatioNecam:(BOOL)a3;
- (void)setHasPupilIrisContrastBecam:(BOOL)a3;
- (void)setHasPupilIrisContrastNecam:(BOOL)a3;
- (void)setHasTemperatureCelsiusBecam:(BOOL)a3;
- (void)setHasTemperatureCelsiusNecam:(BOOL)a3;
- (void)setHasTotalEyeRelief:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsGazeSample

- (void).cxx_destruct
{
}

- (void)setHasTemperatureCelsiusBecam:(BOOL)a3
{
  self->_hasTemperatureCelsiusBecam = a3;
}

- (BOOL)hasTemperatureCelsiusBecam
{
  return self->_hasTemperatureCelsiusBecam;
}

- (float)temperatureCelsiusBecam
{
  return self->_temperatureCelsiusBecam;
}

- (void)setHasTemperatureCelsiusNecam:(BOOL)a3
{
  self->_hasTemperatureCelsiusNecam = a3;
}

- (BOOL)hasTemperatureCelsiusNecam
{
  return self->_hasTemperatureCelsiusNecam;
}

- (float)temperatureCelsiusNecam
{
  return self->_temperatureCelsiusNecam;
}

- (void)setHasCountOfVisibleGlintsBecam:(BOOL)a3
{
  self->_hasCountOfVisibleGlintsBecam = a3;
}

- (BOOL)hasCountOfVisibleGlintsBecam
{
  return self->_hasCountOfVisibleGlintsBecam;
}

- (unsigned)countOfVisibleGlintsBecam
{
  return self->_countOfVisibleGlintsBecam;
}

- (void)setHasCountOfVisibleGlintsNecam:(BOOL)a3
{
  self->_hasCountOfVisibleGlintsNecam = a3;
}

- (BOOL)hasCountOfVisibleGlintsNecam
{
  return self->_hasCountOfVisibleGlintsNecam;
}

- (unsigned)countOfVisibleGlintsNecam
{
  return self->_countOfVisibleGlintsNecam;
}

- (void)setHasPupilIrisContrastBecam:(BOOL)a3
{
  self->_hasPupilIrisContrastBecam = a3;
}

- (BOOL)hasPupilIrisContrastBecam
{
  return self->_hasPupilIrisContrastBecam;
}

- (float)pupilIrisContrastBecam
{
  return self->_pupilIrisContrastBecam;
}

- (void)setHasPupilIrisContrastNecam:(BOOL)a3
{
  self->_hasPupilIrisContrastNecam = a3;
}

- (BOOL)hasPupilIrisContrastNecam
{
  return self->_hasPupilIrisContrastNecam;
}

- (float)pupilIrisContrastNecam
{
  return self->_pupilIrisContrastNecam;
}

- (void)setHasPupil2dVisibleRatioBecam:(BOOL)a3
{
  self->_hasPupil2dVisibleRatioBecam = a3;
}

- (BOOL)hasPupil2dVisibleRatioBecam
{
  return self->_hasPupil2dVisibleRatioBecam;
}

- (float)pupil2dVisibleRatioBecam
{
  return self->_pupil2dVisibleRatioBecam;
}

- (void)setHasPupil2dVisibleRatioNecam:(BOOL)a3
{
  self->_hasPupil2dVisibleRatioNecam = a3;
}

- (BOOL)hasPupil2dVisibleRatioNecam
{
  return self->_hasPupil2dVisibleRatioNecam;
}

- (float)pupil2dVisibleRatioNecam
{
  return self->_pupil2dVisibleRatioNecam;
}

- (void)setHasNearEyeRelief:(BOOL)a3
{
  self->_hasNearEyeRelief = a3;
}

- (BOOL)hasNearEyeRelief
{
  return self->_hasNearEyeRelief;
}

- (float)nearEyeRelief
{
  return self->_nearEyeRelief;
}

- (void)setHasTotalEyeRelief:(BOOL)a3
{
  self->_hasTotalEyeRelief = a3;
}

- (BOOL)hasTotalEyeRelief
{
  return self->_hasTotalEyeRelief;
}

- (float)totalEyeRelief
{
  return self->_totalEyeRelief;
}

- (void)setHasOffsetWithinEyeboxZ:(BOOL)a3
{
  self->_hasOffsetWithinEyeboxZ = a3;
}

- (BOOL)hasOffsetWithinEyeboxZ
{
  return self->_hasOffsetWithinEyeboxZ;
}

- (float)offsetWithinEyeboxZ
{
  return self->_offsetWithinEyeboxZ;
}

- (void)setHasOffsetWithinEyeboxY:(BOOL)a3
{
  self->_hasOffsetWithinEyeboxY = a3;
}

- (BOOL)hasOffsetWithinEyeboxY
{
  return self->_hasOffsetWithinEyeboxY;
}

- (float)offsetWithinEyeboxY
{
  return self->_offsetWithinEyeboxY;
}

- (void)setHasOffsetWithinEyeboxX:(BOOL)a3
{
  self->_hasOffsetWithinEyeboxX = a3;
}

- (BOOL)hasOffsetWithinEyeboxX
{
  return self->_hasOffsetWithinEyeboxX;
}

- (float)offsetWithinEyeboxX
{
  return self->_offsetWithinEyeboxX;
}

- (int)pupilSizeCategory
{
  return self->_pupilSizeCategory;
}

- (int)eyeSide
{
  return self->_eyeSide;
}

- (NSString)userProfileId
{
  return self->_userProfileId;
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
    v6 = [(BMOasisAnalyticsGazeSample *)self userProfileId];
    uint64_t v7 = [v5 userProfileId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMOasisAnalyticsGazeSample *)self userProfileId];
      v10 = [v5 userProfileId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_74;
      }
    }
    int v13 = [(BMOasisAnalyticsGazeSample *)self eyeSide];
    if (v13 == [v5 eyeSide])
    {
      int v14 = [(BMOasisAnalyticsGazeSample *)self pupilSizeCategory];
      if (v14 == [v5 pupilSizeCategory])
      {
        if (![(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxX]
          && ![v5 hasOffsetWithinEyeboxX]
          || [(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxX]
          && [v5 hasOffsetWithinEyeboxX]
          && ([(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxX],
              float v16 = v15,
              [v5 offsetWithinEyeboxX],
              v16 == v17))
        {
          if (![(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxY]
            && ![v5 hasOffsetWithinEyeboxY]
            || [(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxY]
            && [v5 hasOffsetWithinEyeboxY]
            && ([(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxY],
                float v19 = v18,
                [v5 offsetWithinEyeboxY],
                v19 == v20))
          {
            if (![(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxZ]
              && ![v5 hasOffsetWithinEyeboxZ]
              || [(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxZ]
              && [v5 hasOffsetWithinEyeboxZ]
              && ([(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxZ],
                  float v22 = v21,
                  [v5 offsetWithinEyeboxZ],
                  v22 == v23))
            {
              if (![(BMOasisAnalyticsGazeSample *)self hasTotalEyeRelief]
                && ![v5 hasTotalEyeRelief]
                || [(BMOasisAnalyticsGazeSample *)self hasTotalEyeRelief]
                && [v5 hasTotalEyeRelief]
                && ([(BMOasisAnalyticsGazeSample *)self totalEyeRelief],
                    float v25 = v24,
                    [v5 totalEyeRelief],
                    v25 == v26))
              {
                if (![(BMOasisAnalyticsGazeSample *)self hasNearEyeRelief]
                  && ![v5 hasNearEyeRelief]
                  || [(BMOasisAnalyticsGazeSample *)self hasNearEyeRelief]
                  && [v5 hasNearEyeRelief]
                  && ([(BMOasisAnalyticsGazeSample *)self nearEyeRelief],
                      float v28 = v27,
                      [v5 nearEyeRelief],
                      v28 == v29))
                {
                  if (![(BMOasisAnalyticsGazeSample *)self hasPupil2dVisibleRatioNecam]
                    && ![v5 hasPupil2dVisibleRatioNecam]
                    || [(BMOasisAnalyticsGazeSample *)self hasPupil2dVisibleRatioNecam]
                    && [v5 hasPupil2dVisibleRatioNecam]
                    && ([(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioNecam],
                        float v31 = v30,
                        [v5 pupil2dVisibleRatioNecam],
                        v31 == v32))
                  {
                    if (![(BMOasisAnalyticsGazeSample *)self hasPupil2dVisibleRatioBecam]
                      && ![v5 hasPupil2dVisibleRatioBecam]
                      || [(BMOasisAnalyticsGazeSample *)self hasPupil2dVisibleRatioBecam]
                      && [v5 hasPupil2dVisibleRatioBecam]
                      && ([(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioBecam],
                          float v34 = v33,
                          [v5 pupil2dVisibleRatioBecam],
                          v34 == v35))
                    {
                      if (![(BMOasisAnalyticsGazeSample *)self hasPupilIrisContrastNecam]
                        && ![v5 hasPupilIrisContrastNecam]
                        || [(BMOasisAnalyticsGazeSample *)self hasPupilIrisContrastNecam]
                        && [v5 hasPupilIrisContrastNecam]
                        && ([(BMOasisAnalyticsGazeSample *)self pupilIrisContrastNecam],
                            float v37 = v36,
                            [v5 pupilIrisContrastNecam],
                            v37 == v38))
                      {
                        if (![(BMOasisAnalyticsGazeSample *)self hasPupilIrisContrastBecam]
                          && ![v5 hasPupilIrisContrastBecam]
                          || [(BMOasisAnalyticsGazeSample *)self hasPupilIrisContrastBecam]
                          && [v5 hasPupilIrisContrastBecam]
                          && ([(BMOasisAnalyticsGazeSample *)self pupilIrisContrastBecam],
                              float v40 = v39,
                              [v5 pupilIrisContrastBecam],
                              v40 == v41))
                        {
                          if (!-[BMOasisAnalyticsGazeSample hasCountOfVisibleGlintsNecam](self, "hasCountOfVisibleGlintsNecam")&& ![v5 hasCountOfVisibleGlintsNecam]|| -[BMOasisAnalyticsGazeSample hasCountOfVisibleGlintsNecam](self, "hasCountOfVisibleGlintsNecam")&& objc_msgSend(v5, "hasCountOfVisibleGlintsNecam")&& (unsigned int v42 = -[BMOasisAnalyticsGazeSample countOfVisibleGlintsNecam](self, "countOfVisibleGlintsNecam"), v42 == objc_msgSend(v5, "countOfVisibleGlintsNecam")))
                          {
                            if (!-[BMOasisAnalyticsGazeSample hasCountOfVisibleGlintsBecam](self, "hasCountOfVisibleGlintsBecam")&& ![v5 hasCountOfVisibleGlintsBecam]|| -[BMOasisAnalyticsGazeSample hasCountOfVisibleGlintsBecam](self, "hasCountOfVisibleGlintsBecam")&& objc_msgSend(v5, "hasCountOfVisibleGlintsBecam")&& (unsigned int v43 = -[BMOasisAnalyticsGazeSample countOfVisibleGlintsBecam](self, "countOfVisibleGlintsBecam"), v43 == objc_msgSend(v5, "countOfVisibleGlintsBecam")))
                            {
                              if (!-[BMOasisAnalyticsGazeSample hasTemperatureCelsiusNecam](self, "hasTemperatureCelsiusNecam")&& ![v5 hasTemperatureCelsiusNecam]|| -[BMOasisAnalyticsGazeSample hasTemperatureCelsiusNecam](self, "hasTemperatureCelsiusNecam")&& objc_msgSend(v5, "hasTemperatureCelsiusNecam")&& (-[BMOasisAnalyticsGazeSample temperatureCelsiusNecam](self, "temperatureCelsiusNecam"), float v45 = v44, objc_msgSend(v5, "temperatureCelsiusNecam"), v45 == v46))
                              {
                                if (!-[BMOasisAnalyticsGazeSample hasTemperatureCelsiusBecam](self, "hasTemperatureCelsiusBecam")&& ![v5 hasTemperatureCelsiusBecam])
                                {
                                  BOOL v12 = 1;
                                  goto LABEL_75;
                                }
                                if (-[BMOasisAnalyticsGazeSample hasTemperatureCelsiusBecam](self, "hasTemperatureCelsiusBecam")&& [v5 hasTemperatureCelsiusBecam])
                                {
                                  [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusBecam];
                                  float v48 = v47;
                                  [v5 temperatureCelsiusBecam];
                                  BOOL v12 = v48 == v49;
LABEL_75:

                                  goto LABEL_76;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_74:
    BOOL v12 = 0;
    goto LABEL_75;
  }
  BOOL v12 = 0;
LABEL_76:

  return v12;
}

- (id)jsonDictionary
{
  v78[16] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMOasisAnalyticsGazeSample *)self userProfileId];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMOasisAnalyticsGazeSample eyeSide](self, "eyeSide"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMOasisAnalyticsGazeSample pupilSizeCategory](self, "pupilSizeCategory"));
  if (![(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxX]
    || ([(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxX], fabsf(v6) == INFINITY))
  {
    id v8 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxX];
    uint64_t v7 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxX];
    objc_msgSend(v7, "numberWithFloat:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxY]
    || ([(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxY], fabsf(v9) == INFINITY))
  {
    id v11 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxY];
    v10 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxY];
    objc_msgSend(v10, "numberWithFloat:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasOffsetWithinEyeboxZ]
    || ([(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxZ], fabsf(v12) == INFINITY))
  {
    id v14 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxZ];
    int v13 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxZ];
    objc_msgSend(v13, "numberWithFloat:");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasTotalEyeRelief]
    || ([(BMOasisAnalyticsGazeSample *)self totalEyeRelief], fabsf(v15) == INFINITY))
  {
    id v17 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self totalEyeRelief];
    float v16 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self totalEyeRelief];
    objc_msgSend(v16, "numberWithFloat:");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasNearEyeRelief]
    || ([(BMOasisAnalyticsGazeSample *)self nearEyeRelief], fabsf(v18) == INFINITY))
  {
    id v76 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self nearEyeRelief];
    float v19 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self nearEyeRelief];
    objc_msgSend(v19, "numberWithFloat:");
    id v76 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasPupil2dVisibleRatioNecam]
    || ([(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioNecam], fabsf(v20) == INFINITY))
  {
    id v75 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioNecam];
    float v21 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioNecam];
    objc_msgSend(v21, "numberWithFloat:");
    id v75 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasPupil2dVisibleRatioBecam]
    || ([(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioBecam], fabsf(v22) == INFINITY))
  {
    id v74 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioBecam];
    float v23 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioBecam];
    objc_msgSend(v23, "numberWithFloat:");
    id v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasPupilIrisContrastNecam]
    || ([(BMOasisAnalyticsGazeSample *)self pupilIrisContrastNecam], fabsf(v24) == INFINITY))
  {
    id v73 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self pupilIrisContrastNecam];
    float v25 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self pupilIrisContrastNecam];
    objc_msgSend(v25, "numberWithFloat:");
    id v73 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasPupilIrisContrastBecam]
    || ([(BMOasisAnalyticsGazeSample *)self pupilIrisContrastBecam], fabsf(v26) == INFINITY))
  {
    id v72 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self pupilIrisContrastBecam];
    float v27 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self pupilIrisContrastBecam];
    objc_msgSend(v27, "numberWithFloat:");
    id v72 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMOasisAnalyticsGazeSample *)self hasCountOfVisibleGlintsNecam])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsGazeSample countOfVisibleGlintsNecam](self, "countOfVisibleGlintsNecam"));
    id v71 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v71 = 0;
  }
  if ([(BMOasisAnalyticsGazeSample *)self hasCountOfVisibleGlintsBecam])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsGazeSample countOfVisibleGlintsBecam](self, "countOfVisibleGlintsBecam"));
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v70 = 0;
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasTemperatureCelsiusNecam]
    || ([(BMOasisAnalyticsGazeSample *)self temperatureCelsiusNecam], fabsf(v28) == INFINITY))
  {
    id v69 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusNecam];
    float v29 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusNecam];
    objc_msgSend(v29, "numberWithFloat:");
    id v69 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMOasisAnalyticsGazeSample *)self hasTemperatureCelsiusBecam]
    || ([(BMOasisAnalyticsGazeSample *)self temperatureCelsiusBecam], fabsf(v30) == INFINITY))
  {
    id v32 = 0;
  }
  else
  {
    [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusBecam];
    float v31 = NSNumber;
    [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusBecam];
    objc_msgSend(v31, "numberWithFloat:");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v77[0] = @"userProfileId";
  uint64_t v33 = v3;
  if (!v3)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v33;
  v78[0] = v33;
  v77[1] = @"eyeSide";
  uint64_t v34 = v4;
  if (!v4)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = (void *)v34;
  v78[1] = v34;
  v77[2] = @"pupilSizeCategory";
  uint64_t v35 = v5;
  if (!v5)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v35;
  v78[2] = v35;
  v77[3] = @"offsetWithinEyeboxX";
  uint64_t v36 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v36;
  v78[3] = v36;
  v77[4] = @"offsetWithinEyeboxY";
  uint64_t v37 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v37;
  v78[4] = v37;
  v77[5] = @"offsetWithinEyeboxZ";
  uint64_t v38 = (uint64_t)v14;
  if (!v14)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v38;
  v78[5] = v38;
  v77[6] = @"totalEyeRelief";
  uint64_t v39 = (uint64_t)v17;
  if (!v17)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v67 = v8;
  v57 = (void *)v39;
  v78[6] = v39;
  v77[7] = @"nearEyeRelief";
  uint64_t v40 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[7] = v40;
  v77[8] = @"pupil2dVisibleRatioNecam";
  uint64_t v41 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v3;
  v78[8] = v41;
  v77[9] = @"pupil2dVisibleRatioBecam";
  uint64_t v42 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v65 = v17;
  uint64_t v53 = v42;
  v78[9] = v42;
  v77[10] = @"pupilIrisContrastNecam";
  unsigned int v43 = v73;
  if (!v73)
  {
    unsigned int v43 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v42);
  }
  v55 = (void *)v41;
  v56 = (void *)v40;
  v66 = (void *)v4;
  v78[10] = v43;
  v77[11] = @"pupilIrisContrastBecam";
  float v44 = v72;
  if (!v72)
  {
    float v44 = [MEMORY[0x1E4F1CA98] null];
  }
  float v45 = v14;
  float v46 = v11;
  v78[11] = v44;
  v77[12] = @"countOfVisibleGlintsNecam";
  float v47 = v71;
  if (!v71)
  {
    float v47 = [MEMORY[0x1E4F1CA98] null];
  }
  float v48 = (void *)v5;
  v78[12] = v47;
  v77[13] = @"countOfVisibleGlintsBecam";
  float v49 = v70;
  if (!v70)
  {
    float v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[13] = v49;
  v77[14] = @"temperatureCelsiusNecam";
  v50 = v69;
  if (!v69)
  {
    v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[14] = v50;
  v77[15] = @"temperatureCelsiusBecam";
  v51 = v32;
  if (!v32)
  {
    v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[15] = v51;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v78, v77, 16, v53);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  if (!v32) {

  }
  if (!v69) {
  if (!v70)
  }

  if (!v71) {
  if (!v72)
  }

  if (!v73) {
  if (!v74)
  }

  if (!v75) {
  if (!v76)
  }

  if (v65)
  {
    if (v45) {
      goto LABEL_103;
    }
  }
  else
  {

    if (v45)
    {
LABEL_103:
      if (v46) {
        goto LABEL_104;
      }
      goto LABEL_113;
    }
  }

  if (v46)
  {
LABEL_104:
    if (v67) {
      goto LABEL_105;
    }
    goto LABEL_114;
  }
LABEL_113:

  if (v67)
  {
LABEL_105:
    if (v48) {
      goto LABEL_106;
    }
    goto LABEL_115;
  }
LABEL_114:

  if (v48)
  {
LABEL_106:
    if (v66) {
      goto LABEL_107;
    }
LABEL_116:

    if (v68) {
      goto LABEL_108;
    }
    goto LABEL_117;
  }
LABEL_115:

  if (!v66) {
    goto LABEL_116;
  }
LABEL_107:
  if (v68) {
    goto LABEL_108;
  }
LABEL_117:

LABEL_108:

  return v64;
}

- (BMOasisAnalyticsGazeSample)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v164[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  float v6 = [v5 objectForKeyedSubscript:@"userProfileId"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    id v8 = [v5 objectForKeyedSubscript:@"eyeSide"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v131 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
LABEL_15:
      v131 = v9;
LABEL_16:
      id v14 = [v5 objectForKeyedSubscript:@"pupilSizeCategory"];
      if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        float v15 = a4;
        float v16 = 0;
        goto LABEL_24;
      }
      float v15 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v14;
LABEL_23:
        float v16 = v17;
LABEL_24:
        uint64_t v18 = [v5 objectForKeyedSubscript:@"offsetWithinEyeboxX"];
        id v129 = v7;
        v130 = (void *)v18;
        if (!v18 || (float v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v126 = 0;
          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v126 = v19;
LABEL_27:
          float v20 = [v5 objectForKeyedSubscript:@"offsetWithinEyeboxY"];
          if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v121 = 0;
            v122 = v20;
            goto LABEL_30;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v122 = v20;
            v121 = v20;
LABEL_30:
            uint64_t v21 = [v5 objectForKeyedSubscript:@"offsetWithinEyeboxZ"];
            v125 = (void *)v21;
            if (!v21 || (float v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v127 = 0;
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v127 = v22;
LABEL_33:
              uint64_t v23 = [v5 objectForKeyedSubscript:@"totalEyeRelief"];
              v120 = (void *)v23;
              if (!v23 || (float v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v123 = 0;
                goto LABEL_36;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v123 = v24;
LABEL_36:
                uint64_t v25 = [v5 objectForKeyedSubscript:@"nearEyeRelief"];
                v115 = (void *)v25;
                if (!v25 || (float v26 = (void *)v25, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v116 = 0;
                  goto LABEL_39;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v116 = v26;
LABEL_39:
                  uint64_t v27 = [v5 objectForKeyedSubscript:@"pupil2dVisibleRatioNecam"];
                  v112 = (void *)v27;
                  if (!v27 || (float v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v113 = 0;
                    goto LABEL_42;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v113 = v28;
LABEL_42:
                    uint64_t v29 = [v5 objectForKeyedSubscript:@"pupil2dVisibleRatioBecam"];
                    v109 = (void *)v29;
                    if (!v29 || (float v30 = (void *)v29, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v110 = 0;
                      goto LABEL_45;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v110 = v30;
LABEL_45:
                      uint64_t v31 = [v5 objectForKeyedSubscript:@"pupilIrisContrastNecam"];
                      v106 = (void *)v31;
                      if (!v31 || (id v32 = (void *)v31, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v107 = 0;
                        goto LABEL_48;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v107 = v32;
LABEL_48:
                        uint64_t v33 = [v5 objectForKeyedSubscript:@"pupilIrisContrastBecam"];
                        v101 = (void *)v33;
                        if (!v33 || (uint64_t v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v104 = 0;
LABEL_51:
                          id v35 = [v5 objectForKeyedSubscript:@"countOfVisibleGlintsNecam"];
                          v98 = v35;
                          if (!v35)
                          {
                            v102 = v16;
                            goto LABEL_90;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v102 = v16;
                            id v35 = 0;
LABEL_90:
                            uint64_t v66 = [v5 objectForKeyedSubscript:@"countOfVisibleGlintsBecam"];
                            v97 = v35;
                            v95 = (void *)v66;
                            if (v66 && (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (!v15)
                                {
                                  id v99 = 0;
                                  int v13 = 0;
                                  uint64_t v41 = self;
                                  uint64_t v40 = v126;
                                  float v15 = v121;
                                  float v20 = v122;
                                  float v16 = v102;
                                  goto LABEL_142;
                                }
                                id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v100 = *MEMORY[0x1E4F502C8];
                                uint64_t v137 = *MEMORY[0x1E4F28568];
                                float v16 = v102;
                                uint64_t v41 = self;
                                id v96 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"countOfVisibleGlintsBecam"];
                                id v138 = v96;
                                v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
                                id v85 = (id)objc_msgSend(v84, "initWithDomain:code:userInfo:", v100, 2);
                                int v13 = 0;
                                id v99 = 0;
                                *float v15 = v85;
                                goto LABEL_164;
                              }
                              id v99 = v67;
                            }
                            else
                            {
                              id v99 = 0;
                            }
                            uint64_t v68 = [v5 objectForKeyedSubscript:@"temperatureCelsiusNecam"];
                            float v16 = v102;
                            v94 = (void *)v68;
                            if (!v68 || (id v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v96 = 0;
                              goto LABEL_96;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v96 = v69;
LABEL_96:
                              id v70 = [v5 objectForKeyedSubscript:@"temperatureCelsiusBecam"];
                              if (!v70 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v71 = 0;
LABEL_99:
                                uint64_t v72 = [v131 intValue];
                                uint64_t v73 = [v102 intValue];
                                uint64_t v74 = v72;
                                uint64_t v40 = v126;
                                float v15 = v121;
                                int v13 = objc_retain(-[BMOasisAnalyticsGazeSample initWithUserProfileId:eyeSide:pupilSizeCategory:offsetWithinEyeboxX:offsetWithinEyeboxY:offsetWithinEyeboxZ:totalEyeRelief:nearEyeRelief:pupil2dVisibleRatioNecam:pupil2dVisibleRatioBecam:pupilIrisContrastNecam:pupilIrisContrastBecam:countOfVisibleGlintsNecam:countOfVisibleGlintsBecam:temperatureCelsiusNecam:temperatureCelsiusBecam:](self, "initWithUserProfileId:eyeSide:pupilSizeCategory:offsetWithinEyeboxX:offsetWithinEyeboxY:offsetWithinEyeboxZ:totalEyeRelief:nearEyeRelief:pupil2dVisibleRatioNecam:pupil2dVisibleRatioBecam:pupilIrisContrastNecam:pupilIrisContrastBecam:countOfVisibleGlintsNecam:countOfVisibleGlintsBecam:temperatureCelsiusNecam:temperatureCelsiusBecam:", v129, v74, v73, v126, v121, v127, v123, v116, v113, v110, v107, v104,
                                          v35,
                                          v99,
                                          v96,
                                          v71));
                                self = v13;
                                float v20 = v122;
LABEL_140:

                                uint64_t v41 = self;
                                float v16 = v102;
LABEL_141:

                                goto LABEL_142;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v71 = v70;
                                goto LABEL_99;
                              }
                              if (v15)
                              {
                                id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v90 = *MEMORY[0x1E4F502C8];
                                uint64_t v133 = *MEMORY[0x1E4F28568];
                                v91 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"temperatureCelsiusBecam"];
                                v134 = v91;
                                v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                                *float v15 = (id)[v89 initWithDomain:v90 code:2 userInfo:v92];
                              }
                              id v71 = 0;
                              int v13 = 0;
LABEL_139:
                              uint64_t v40 = v126;
                              float v15 = v121;
                              float v20 = v122;
                              goto LABEL_140;
                            }
                            if (v15)
                            {
                              id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v87 = *MEMORY[0x1E4F502C8];
                              uint64_t v135 = *MEMORY[0x1E4F28568];
                              id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"temperatureCelsiusNecam"];
                              id v136 = v71;
                              id v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
                              id v88 = (id)[v86 initWithDomain:v87 code:2 userInfo:v70];
                              int v13 = 0;
                              id v96 = 0;
                              *float v15 = v88;
                              goto LABEL_139;
                            }
                            id v96 = 0;
                            int v13 = 0;
                            uint64_t v41 = self;
LABEL_164:
                            uint64_t v40 = v126;
                            float v15 = v121;
                            float v20 = v122;
                            goto LABEL_141;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v102 = v16;
                            id v35 = v35;
                            goto LABEL_90;
                          }
                          if (v15)
                          {
                            id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v103 = *MEMORY[0x1E4F502C8];
                            uint64_t v139 = *MEMORY[0x1E4F28568];
                            uint64_t v41 = self;
                            id v99 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"countOfVisibleGlintsNecam"];
                            id v140 = v99;
                            v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                            int v13 = 0;
                            v97 = 0;
                            *float v15 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v103, 2);
                            uint64_t v40 = v126;
                            float v15 = v121;
                            float v20 = v122;
LABEL_142:

LABEL_143:
LABEL_144:

LABEL_145:
                            goto LABEL_146;
                          }
                          v97 = 0;
                          int v13 = 0;
                          uint64_t v41 = self;
LABEL_161:
                          uint64_t v40 = v126;
                          float v15 = v121;
                          float v20 = v122;
                          goto LABEL_143;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v104 = v34;
                          goto LABEL_51;
                        }
                        if (v15)
                        {
                          id v81 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v105 = *MEMORY[0x1E4F502C8];
                          uint64_t v141 = *MEMORY[0x1E4F28568];
                          uint64_t v41 = self;
                          v97 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pupilIrisContrastBecam"];
                          v142 = v97;
                          v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
                          id v82 = (id)objc_msgSend(v81, "initWithDomain:code:userInfo:", v105, 2);
                          int v13 = 0;
                          id v104 = 0;
                          *float v15 = v82;
                          goto LABEL_161;
                        }
                        id v104 = 0;
                        int v13 = 0;
                        uint64_t v41 = self;
LABEL_159:
                        uint64_t v40 = v126;
                        float v15 = v121;
                        float v20 = v122;
                        goto LABEL_144;
                      }
                      if (v15)
                      {
                        id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v108 = *MEMORY[0x1E4F502C8];
                        uint64_t v143 = *MEMORY[0x1E4F28568];
                        uint64_t v41 = self;
                        id v104 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pupilIrisContrastNecam"];
                        id v144 = v104;
                        v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                        id v80 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v108, 2);
                        int v13 = 0;
                        id v107 = 0;
                        *float v15 = v80;
                        goto LABEL_159;
                      }
                      id v107 = 0;
                      int v13 = 0;
                      uint64_t v41 = self;
LABEL_157:
                      uint64_t v40 = v126;
                      float v15 = v121;
                      float v20 = v122;
                      goto LABEL_145;
                    }
                    if (v15)
                    {
                      id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v111 = *MEMORY[0x1E4F502C8];
                      uint64_t v145 = *MEMORY[0x1E4F28568];
                      uint64_t v41 = self;
                      id v107 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pupil2dVisibleRatioBecam"];
                      id v146 = v107;
                      v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
                      id v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v111, 2);
                      int v13 = 0;
                      id v110 = 0;
                      *float v15 = v78;
                      goto LABEL_157;
                    }
                    id v110 = 0;
                    int v13 = 0;
                    uint64_t v41 = self;
LABEL_135:
                    uint64_t v40 = v126;
                    float v15 = v121;
                    float v20 = v122;
LABEL_146:

                    goto LABEL_147;
                  }
                  if (v15)
                  {
                    id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v114 = *MEMORY[0x1E4F502C8];
                    uint64_t v147 = *MEMORY[0x1E4F28568];
                    uint64_t v41 = self;
                    id v110 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pupil2dVisibleRatioNecam"];
                    id v148 = v110;
                    v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
                    id v76 = (id)objc_msgSend(v75, "initWithDomain:code:userInfo:", v114, 2);
                    int v13 = 0;
                    id v113 = 0;
                    *float v15 = v76;
                    goto LABEL_135;
                  }
                  id v113 = 0;
                  int v13 = 0;
                  uint64_t v41 = self;
LABEL_131:
                  uint64_t v40 = v126;
                  float v15 = v121;
                  float v20 = v122;
LABEL_147:

                  goto LABEL_148;
                }
                if (v15)
                {
                  id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v119 = *MEMORY[0x1E4F502C8];
                  uint64_t v149 = *MEMORY[0x1E4F28568];
                  uint64_t v41 = self;
                  id v113 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nearEyeRelief"];
                  id v150 = v113;
                  v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
                  id v65 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v119, 2);
                  int v13 = 0;
                  id v116 = 0;
                  *float v15 = v65;
                  goto LABEL_131;
                }
                id v116 = 0;
                int v13 = 0;
                uint64_t v41 = self;
LABEL_127:
                uint64_t v40 = v126;
                float v15 = v121;
                float v20 = v122;
LABEL_148:

                goto LABEL_149;
              }
              if (v15)
              {
                id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v124 = *MEMORY[0x1E4F502C8];
                uint64_t v151 = *MEMORY[0x1E4F28568];
                uint64_t v41 = self;
                id v116 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalEyeRelief"];
                id v152 = v116;
                v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
                id v53 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v124, 2);
                int v13 = 0;
                id v123 = 0;
                *float v15 = v53;
                goto LABEL_127;
              }
              id v123 = 0;
              int v13 = 0;
              uint64_t v41 = self;
LABEL_119:
              uint64_t v40 = v126;
              float v15 = v121;
              float v20 = v122;
LABEL_149:

              goto LABEL_150;
            }
            if (v15)
            {
              id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
              v118 = v6;
              uint64_t v48 = *MEMORY[0x1E4F502C8];
              uint64_t v153 = *MEMORY[0x1E4F28568];
              id v123 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"offsetWithinEyeboxZ"];
              id v154 = v123;
              uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
              uint64_t v50 = v48;
              uint64_t v41 = self;
              float v6 = v118;
              v120 = (void *)v49;
              id v51 = (id)objc_msgSend(v47, "initWithDomain:code:userInfo:", v50, 2);
              int v13 = 0;
              id v127 = 0;
              *float v15 = v51;
              goto LABEL_119;
            }
            id v127 = 0;
            int v13 = 0;
            uint64_t v41 = self;
            uint64_t v40 = v126;
            float v15 = v121;
            float v20 = v122;
LABEL_150:

            goto LABEL_151;
          }
          if (v15)
          {
            id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
            v117 = v6;
            uint64_t v43 = *MEMORY[0x1E4F502C8];
            uint64_t v155 = *MEMORY[0x1E4F28568];
            id v127 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"offsetWithinEyeboxY"];
            id v156 = v127;
            uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
            uint64_t v45 = v43;
            uint64_t v41 = self;
            float v6 = v117;
            v125 = (void *)v44;
            id v46 = (id)objc_msgSend(v42, "initWithDomain:code:userInfo:", v45, 2);
            int v13 = 0;
            *float v15 = v46;
            float v15 = 0;
            uint64_t v40 = v126;
            goto LABEL_150;
          }
          int v13 = 0;
          uint64_t v41 = self;
          uint64_t v40 = v126;
LABEL_151:

          id v7 = v129;
          goto LABEL_152;
        }
        if (v15)
        {
          id v128 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v157 = *MEMORY[0x1E4F28568];
          uint64_t v37 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"offsetWithinEyeboxX"];
          uint64_t v158 = v37;
          uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
          id v39 = (id)[v128 initWithDomain:v36 code:2 userInfo:v38];
          int v13 = 0;
          uint64_t v40 = 0;
          *float v15 = v39;
          float v15 = (id *)v37;
          float v20 = (void *)v38;
          uint64_t v41 = self;
          goto LABEL_151;
        }
        uint64_t v40 = 0;
        int v13 = 0;
LABEL_103:
        uint64_t v41 = self;
LABEL_152:

        goto LABEL_153;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = [NSNumber numberWithInt:BMOasisAnalyticsGazeSamplePupilSizeCategoryFromString(v14)];
        goto LABEL_23;
      }
      if (a4)
      {
        id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v59 = *MEMORY[0x1E4F502C8];
        uint64_t v159 = *MEMORY[0x1E4F28568];
        uint64_t v60 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"pupilSizeCategory"];
        uint64_t v160 = v60;
        uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
        v62 = v58;
        uint64_t v40 = (void *)v60;
        v130 = (void *)v61;
        id v63 = (id)objc_msgSend(v62, "initWithDomain:code:userInfo:", v59, 2);
        int v13 = 0;
        *a4 = v63;
        float v16 = 0;
        goto LABEL_103;
      }
      int v13 = 0;
      float v16 = 0;
LABEL_125:
      uint64_t v41 = self;
LABEL_153:

      goto LABEL_154;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [NSNumber numberWithInt:BMOasisAnalyticsGazeSampleEyeSideFromString(v8)];
      goto LABEL_15;
    }
    if (a4)
    {
      id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v55 = *MEMORY[0x1E4F502C8];
      uint64_t v161 = *MEMORY[0x1E4F28568];
      v56 = a4;
      float v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"eyeSide"];
      v162 = v16;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
      id v57 = (id)[v54 initWithDomain:v55 code:2 userInfo:v14];
      v131 = 0;
      int v13 = 0;
      id *v56 = v57;
      goto LABEL_125;
    }
    v131 = 0;
    int v13 = 0;
LABEL_121:
    uint64_t v41 = self;
LABEL_154:

    goto LABEL_155;
  }
  if (a4)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F502C8];
    uint64_t v163 = *MEMORY[0x1E4F28568];
    v131 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userProfileId"];
    v164[0] = v131;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:&v163 count:1];
    id v12 = (id)[v10 initWithDomain:v11 code:2 userInfo:v8];
    id v7 = 0;
    int v13 = 0;
    *a4 = v12;
    goto LABEL_121;
  }
  id v7 = 0;
  int v13 = 0;
  uint64_t v41 = self;
LABEL_155:

  return v13;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMOasisAnalyticsGazeSample *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_userProfileId) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasOffsetWithinEyeboxX) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasOffsetWithinEyeboxY) {
    PBDataWriterWriteFloatField();
  }
  uint64_t v4 = v5;
  if (self->_hasOffsetWithinEyeboxZ)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasTotalEyeRelief)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasNearEyeRelief)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasPupil2dVisibleRatioNecam)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasPupil2dVisibleRatioBecam)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasPupilIrisContrastNecam)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasPupilIrisContrastBecam)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasCountOfVisibleGlintsNecam)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasCountOfVisibleGlintsBecam)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v4 = v5;
  }
  if (self->_hasTemperatureCelsiusNecam)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
  if (self->_hasTemperatureCelsiusBecam)
  {
    PBDataWriterWriteFloatField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BMOasisAnalyticsGazeSample;
  id v5 = [(BMEventBase *)&v76 init];
  if (!v5) {
    goto LABEL_132;
  }
  float v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          userProfileId = v5->_userProfileId;
          v5->_userProfileId = (NSString *)v20;

          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
              break;
            }
            char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
            *(void *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0) {
              goto LABEL_85;
            }
            v22 += 7;
            BOOL v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_87;
            }
          }
          v4[*v8] = 1;
LABEL_85:
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_87:
          if (v24 >= 5) {
            LODWORD(v24) = 0;
          }
          uint64_t v71 = 36;
          goto LABEL_96;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v33;
              v24 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_93;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_93:
          if (v24 >= 7) {
            LODWORD(v24) = 0;
          }
          uint64_t v71 = 40;
LABEL_96:
          *(_DWORD *)((char *)&v5->super.super.isa + v71) = v24;
          continue;
        case 4u:
          v5->_hasOffsetWithinEyeboxX = 1;
          uint64_t v35 = *v6;
          unint64_t v36 = *(void *)&v4[v35];
          if (v36 <= 0xFFFFFFFFFFFFFFFBLL && v36 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v36);
            *(void *)&v4[v35] = v36 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 44;
          goto LABEL_128;
        case 5u:
          v5->_hasOffsetWithinEyeboxY = 1;
          uint64_t v38 = *v6;
          unint64_t v39 = *(void *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v39);
            *(void *)&v4[v38] = v39 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 48;
          goto LABEL_128;
        case 6u:
          v5->_hasOffsetWithinEyeboxZ = 1;
          uint64_t v40 = *v6;
          unint64_t v41 = *(void *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFFBLL && v41 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 52;
          goto LABEL_128;
        case 7u:
          v5->_hasTotalEyeRelief = 1;
          uint64_t v42 = *v6;
          unint64_t v43 = *(void *)&v4[v42];
          if (v43 <= 0xFFFFFFFFFFFFFFFBLL && v43 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v43);
            *(void *)&v4[v42] = v43 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 56;
          goto LABEL_128;
        case 8u:
          v5->_hasNearEyeRelief = 1;
          uint64_t v44 = *v6;
          unint64_t v45 = *(void *)&v4[v44];
          if (v45 <= 0xFFFFFFFFFFFFFFFBLL && v45 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v45);
            *(void *)&v4[v44] = v45 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 60;
          goto LABEL_128;
        case 9u:
          v5->_hasPupil2dVisibleRatioNecam = 1;
          uint64_t v46 = *v6;
          unint64_t v47 = *(void *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFFBLL && v47 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v47);
            *(void *)&v4[v46] = v47 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 64;
          goto LABEL_128;
        case 0xAu:
          v5->_hasPupil2dVisibleRatioBecam = 1;
          uint64_t v48 = *v6;
          unint64_t v49 = *(void *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFFBLL && v49 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v49);
            *(void *)&v4[v48] = v49 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 68;
          goto LABEL_128;
        case 0xBu:
          v5->_hasPupilIrisContrastNecam = 1;
          uint64_t v50 = *v6;
          unint64_t v51 = *(void *)&v4[v50];
          if (v51 <= 0xFFFFFFFFFFFFFFFBLL && v51 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v51);
            *(void *)&v4[v50] = v51 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 72;
          goto LABEL_128;
        case 0xCu:
          v5->_hasPupilIrisContrastBecam = 1;
          uint64_t v52 = *v6;
          unint64_t v53 = *(void *)&v4[v52];
          if (v53 <= 0xFFFFFFFFFFFFFFFBLL && v53 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v53);
            *(void *)&v4[v52] = v53 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 76;
          goto LABEL_128;
        case 0xDu:
          char v54 = 0;
          unsigned int v55 = 0;
          uint64_t v56 = 0;
          v5->_hasCountOfVisibleGlintsNecam = 1;
          while (2)
          {
            uint64_t v57 = *v6;
            uint64_t v58 = *(void *)&v4[v57];
            unint64_t v59 = v58 + 1;
            if (v58 == -1 || v59 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v60 = *(unsigned char *)(*(void *)&v4[*v9] + v58);
              *(void *)&v4[v57] = v59;
              v56 |= (unint64_t)(v60 & 0x7F) << v54;
              if (v60 < 0)
              {
                v54 += 7;
                BOOL v17 = v55++ >= 9;
                if (v17)
                {
                  LODWORD(v56) = 0;
                  goto LABEL_100;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v56) = 0;
          }
LABEL_100:
          uint64_t v72 = 80;
          goto LABEL_105;
        case 0xEu:
          char v61 = 0;
          unsigned int v62 = 0;
          uint64_t v56 = 0;
          v5->_hasCountOfVisibleGlintsBecam = 1;
          break;
        case 0xFu:
          v5->_hasTemperatureCelsiusNecam = 1;
          uint64_t v67 = *v6;
          unint64_t v68 = *(void *)&v4[v67];
          if (v68 <= 0xFFFFFFFFFFFFFFFBLL && v68 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v68);
            *(void *)&v4[v67] = v68 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 88;
          goto LABEL_128;
        case 0x10u:
          v5->_hasTemperatureCelsiusBecam = 1;
          uint64_t v69 = *v6;
          unint64_t v70 = *(void *)&v4[v69];
          if (v70 <= 0xFFFFFFFFFFFFFFFBLL && v70 + 4 <= *(void *)&v4[*v7])
          {
            int v37 = *(_DWORD *)(*(void *)&v4[*v9] + v70);
            *(void *)&v4[v69] = v70 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v37 = 0;
          }
          uint64_t v73 = 92;
LABEL_128:
          *(_DWORD *)((char *)&v5->super.super.isa + v73) = v37;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_131;
          }
          continue;
      }
      while (1)
      {
        uint64_t v63 = *v6;
        uint64_t v64 = *(void *)&v4[v63];
        unint64_t v65 = v64 + 1;
        if (v64 == -1 || v65 > *(void *)&v4[*v7]) {
          break;
        }
        char v66 = *(unsigned char *)(*(void *)&v4[*v9] + v64);
        *(void *)&v4[v63] = v65;
        v56 |= (unint64_t)(v66 & 0x7F) << v61;
        if ((v66 & 0x80) == 0) {
          goto LABEL_102;
        }
        v61 += 7;
        BOOL v17 = v62++ >= 9;
        if (v17)
        {
          LODWORD(v56) = 0;
          goto LABEL_104;
        }
      }
      v4[*v8] = 1;
LABEL_102:
      if (v4[*v8]) {
        LODWORD(v56) = 0;
      }
LABEL_104:
      uint64_t v72 = 84;
LABEL_105:
      *(_DWORD *)((char *)&v5->super.super.isa + v72) = v56;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_131:
  }
    uint64_t v74 = 0;
  else {
LABEL_132:
  }
    uint64_t v74 = v5;

  return v74;
}

- (NSString)description
{
  id v29 = [NSString alloc];
  uint64_t v32 = [(BMOasisAnalyticsGazeSample *)self userProfileId];
  char v28 = BMOasisAnalyticsGazeSampleEyeSideAsString([(BMOasisAnalyticsGazeSample *)self eyeSide]);
  uint64_t v31 = BMOasisAnalyticsGazeSamplePupilSizeCategoryAsString([(BMOasisAnalyticsGazeSample *)self pupilSizeCategory]);
  uint64_t v3 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxX];
  unint64_t v27 = objc_msgSend(v3, "numberWithFloat:");
  uint64_t v4 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxY];
  uint64_t v26 = objc_msgSend(v4, "numberWithFloat:");
  id v5 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self offsetWithinEyeboxZ];
  uint64_t v25 = objc_msgSend(v5, "numberWithFloat:");
  float v6 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self totalEyeRelief];
  uint64_t v24 = objc_msgSend(v6, "numberWithFloat:");
  id v7 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self nearEyeRelief];
  unsigned int v23 = objc_msgSend(v7, "numberWithFloat:");
  id v8 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioNecam];
  char v22 = objc_msgSend(v8, "numberWithFloat:");
  id v9 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self pupil2dVisibleRatioBecam];
  uint64_t v21 = objc_msgSend(v9, "numberWithFloat:");
  char v10 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self pupilIrisContrastNecam];
  uint64_t v20 = objc_msgSend(v10, "numberWithFloat:");
  unsigned int v11 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self pupilIrisContrastBecam];
  float v19 = objc_msgSend(v11, "numberWithFloat:");
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsGazeSample countOfVisibleGlintsNecam](self, "countOfVisibleGlintsNecam"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsGazeSample countOfVisibleGlintsBecam](self, "countOfVisibleGlintsBecam"));
  uint64_t v14 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusNecam];
  unint64_t v15 = objc_msgSend(v14, "numberWithFloat:");
  char v16 = NSNumber;
  [(BMOasisAnalyticsGazeSample *)self temperatureCelsiusBecam];
  BOOL v17 = objc_msgSend(v16, "numberWithFloat:");
  unsigned int v30 = (void *)[v29 initWithFormat:@"BMOasisAnalyticsGazeSample with userProfileId: %@, eyeSide: %@, pupilSizeCategory: %@, offsetWithinEyeboxX: %@, offsetWithinEyeboxY: %@, offsetWithinEyeboxZ: %@, totalEyeRelief: %@, nearEyeRelief: %@, pupil2dVisibleRatioNecam: %@, pupil2dVisibleRatioBecam: %@, pupilIrisContrastNecam: %@, pupilIrisContrastBecam: %@, countOfVisibleGlintsNecam: %@, countOfVisibleGlintsBecam: %@, temperatureCelsiusNecam: %@, temperatureCelsiusBecam: %@", v32, v28, v31, v27, v26, v25, v24, v23, v22, v21, v20, v19, v12, v13, v15, v17];

  return (NSString *)v30;
}

- (BMOasisAnalyticsGazeSample)initWithUserProfileId:(id)a3 eyeSide:(int)a4 pupilSizeCategory:(int)a5 offsetWithinEyeboxX:(id)a6 offsetWithinEyeboxY:(id)a7 offsetWithinEyeboxZ:(id)a8 totalEyeRelief:(id)a9 nearEyeRelief:(id)a10 pupil2dVisibleRatioNecam:(id)a11 pupil2dVisibleRatioBecam:(id)a12 pupilIrisContrastNecam:(id)a13 pupilIrisContrastBecam:(id)a14 countOfVisibleGlintsNecam:(id)a15 countOfVisibleGlintsBecam:(id)a16 temperatureCelsiusNecam:(id)a17 temperatureCelsiusBecam:(id)a18
{
  id v52 = a3;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v56 = a10;
  id v55 = a11;
  uint64_t v25 = v23;
  id v54 = a12;
  id v53 = a13;
  uint64_t v26 = v22;
  id v27 = a14;
  char v28 = v21;
  id v29 = a15;
  id v30 = a16;
  id v31 = a17;
  id v32 = a18;
  v57.receiver = self;
  v57.super_class = (Class)BMOasisAnalyticsGazeSample;
  unint64_t v33 = [(BMEventBase *)&v57 init];
  if (v33)
  {
    v33->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v33->_userProfileId, a3);
    v33->_eyeSide = a4;
    v33->_pupilSizeCategory = a5;
    if (v28)
    {
      v33->_hasOffsetWithinEyeboxX = 1;
      [v28 floatValue];
    }
    else
    {
      v33->_hasOffsetWithinEyeboxX = 0;
      float v34 = -1.0;
    }
    v33->_offsetWithinEyeboxX = v34;
    if (v26)
    {
      v33->_hasOffsetWithinEyeboxY = 1;
      [v26 floatValue];
    }
    else
    {
      v33->_hasOffsetWithinEyeboxY = 0;
      float v35 = -1.0;
    }
    v33->_offsetWithinEyeboxY = v35;
    if (v25)
    {
      v33->_hasOffsetWithinEyeboxZ = 1;
      [v25 floatValue];
    }
    else
    {
      v33->_hasOffsetWithinEyeboxZ = 0;
      float v36 = -1.0;
    }
    v33->_offsetWithinEyeboxZ = v36;
    if (v24)
    {
      v33->_hasTotalEyeRelief = 1;
      [v24 floatValue];
    }
    else
    {
      v33->_hasTotalEyeRelief = 0;
      float v37 = -1.0;
    }
    v33->_totalEyeRelief = v37;
    if (v56)
    {
      v33->_hasNearEyeRelief = 1;
      [v56 floatValue];
    }
    else
    {
      v33->_hasNearEyeRelief = 0;
      float v38 = -1.0;
    }
    v33->_nearEyeRelief = v38;
    if (v55)
    {
      v33->_hasPupil2dVisibleRatioNecam = 1;
      [v55 floatValue];
    }
    else
    {
      v33->_hasPupil2dVisibleRatioNecam = 0;
      float v39 = -1.0;
    }
    v33->_pupil2dVisibleRatioNecam = v39;
    if (v54)
    {
      v33->_hasPupil2dVisibleRatioBecam = 1;
      [v54 floatValue];
    }
    else
    {
      v33->_hasPupil2dVisibleRatioBecam = 0;
      float v40 = -1.0;
    }
    v33->_pupil2dVisibleRatioBecam = v40;
    if (v53)
    {
      v33->_hasPupilIrisContrastNecam = 1;
      [v53 floatValue];
    }
    else
    {
      v33->_hasPupilIrisContrastNecam = 0;
      float v41 = -1.0;
    }
    v33->_pupilIrisContrastNecam = v41;
    if (v27)
    {
      v33->_hasPupilIrisContrastBecam = 1;
      [v27 floatValue];
    }
    else
    {
      v33->_hasPupilIrisContrastBecam = 0;
      float v42 = -1.0;
    }
    v33->_pupilIrisContrastBecam = v42;
    if (v29)
    {
      v33->_hasCountOfVisibleGlintsNecam = 1;
      unsigned int v43 = [v29 unsignedIntValue];
    }
    else
    {
      unsigned int v43 = 0;
      v33->_hasCountOfVisibleGlintsNecam = 0;
    }
    v33->_countOfVisibleGlintsNecam = v43;
    if (v30)
    {
      v33->_hasCountOfVisibleGlintsBecam = 1;
      unsigned int v44 = [v30 unsignedIntValue];
    }
    else
    {
      unsigned int v44 = 0;
      v33->_hasCountOfVisibleGlintsBecam = 0;
    }
    v33->_countOfVisibleGlintsBecam = v44;
    if (v31)
    {
      v33->_hasTemperatureCelsiusNecam = 1;
      [v31 floatValue];
    }
    else
    {
      v33->_hasTemperatureCelsiusNecam = 0;
      float v45 = -1.0;
    }
    v33->_temperatureCelsiusNecam = v45;
    if (v32)
    {
      v33->_hasTemperatureCelsiusBecam = 1;
      [v32 floatValue];
    }
    else
    {
      v33->_hasTemperatureCelsiusBecam = 0;
      float v46 = -1.0;
    }
    v33->_temperatureCelsiusBecam = v46;
  }

  return v33;
}

+ (id)protoFields
{
  v20[16] = *MEMORY[0x1E4F143B8];
  float v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userProfileId" number:1 type:13 subMessageClass:0];
  v20[0] = v19;
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eyeSide" number:2 type:4 subMessageClass:0];
  v20[1] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pupilSizeCategory" number:3 type:4 subMessageClass:0];
  v20[2] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"offsetWithinEyeboxX" number:4 type:1 subMessageClass:0];
  v20[3] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"offsetWithinEyeboxY" number:5 type:1 subMessageClass:0];
  v20[4] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"offsetWithinEyeboxZ" number:6 type:1 subMessageClass:0];
  v20[5] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalEyeRelief" number:7 type:1 subMessageClass:0];
  v20[6] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nearEyeRelief" number:8 type:1 subMessageClass:0];
  v20[7] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pupil2dVisibleRatioNecam" number:9 type:1 subMessageClass:0];
  v20[8] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pupil2dVisibleRatioBecam" number:10 type:1 subMessageClass:0];
  v20[9] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pupilIrisContrastNecam" number:11 type:1 subMessageClass:0];
  v20[10] = v5;
  float v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pupilIrisContrastBecam" number:12 type:1 subMessageClass:0];
  v20[11] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countOfVisibleGlintsNecam" number:13 type:4 subMessageClass:0];
  v20[12] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"countOfVisibleGlintsBecam" number:14 type:4 subMessageClass:0];
  v20[13] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"temperatureCelsiusNecam" number:15 type:1 subMessageClass:0];
  v20[14] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"temperatureCelsiusBecam" number:16 type:1 subMessageClass:0];
  v20[15] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF76F8;
}

+ (id)columns
{
  v20[16] = *MEMORY[0x1E4F143B8];
  float v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userProfileId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eyeSide" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pupilSizeCategory" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"offsetWithinEyeboxX" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:1 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"offsetWithinEyeboxY" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"offsetWithinEyeboxZ" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:1 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalEyeRelief" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:1 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nearEyeRelief" dataType:1 requestOnly:0 fieldNumber:8 protoDataType:1 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pupil2dVisibleRatioNecam" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:1 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pupil2dVisibleRatioBecam" dataType:1 requestOnly:0 fieldNumber:10 protoDataType:1 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pupilIrisContrastNecam" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:1 convertedType:0];
  float v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pupilIrisContrastBecam" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:1 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countOfVisibleGlintsNecam" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"countOfVisibleGlintsBecam" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:4 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"temperatureCelsiusNecam" dataType:1 requestOnly:0 fieldNumber:15 protoDataType:1 convertedType:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"temperatureCelsiusBecam" dataType:1 requestOnly:0 fieldNumber:16 protoDataType:1 convertedType:0];
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  v20[4] = v15;
  v20[5] = v14;
  v20[6] = v2;
  v20[7] = v3;
  v20[8] = v4;
  v20[9] = v5;
  v20[10] = v13;
  v20[11] = v6;
  v20[12] = v7;
  v20[13] = v12;
  v20[14] = v8;
  v20[15] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMOasisAnalyticsGazeSample alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
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

@end