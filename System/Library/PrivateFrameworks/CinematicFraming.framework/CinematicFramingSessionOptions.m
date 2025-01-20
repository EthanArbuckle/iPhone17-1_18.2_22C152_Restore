@interface CinematicFramingSessionOptions
- (BOOL)inferSubjectBodyFromFaceLocation;
- (BOOL)recenterAfterDriftEnabled;
- (BOOL)shouldDisableTransitions;
- (CinematicFramingSessionFramingParameters)multiPersonFramingParameters;
- (CinematicFramingSessionFramingParameters)singlePersonFramingParameters;
- (CinematicFramingSessionOptions)initWithPlist:(id)a3;
- (CinematicFramingSessionOptions)initWithPlistPath:(id)a3;
- (double)defaultViewportRotation;
- (float)deadbandRecenteringDurationSec;
- (float)deadbandRecenteringIdleDurationSec;
- (float)deadbandRecenteringInitialDelaySec;
- (float)horizontalAccelerationMultiplier;
- (float)horizontalSpeedMultiplier;
- (float)noPeopleDelayBeforeReturningHomeSec;
- (float)noPeopleReturningHomeDurationSec;
- (float)recenterAfterDriftDurationThreshold;
- (float)recenterAfterDriftOffsetThreshold;
- (float)subjectMovementTolerance;
- (float)tinyHeadMaxValue;
- (float)tinyHeadMinValue;
- (float)verticalAccelerationMultiplier;
- (float)verticalSpeedMultiplier;
- (float)viewportDefaultFOV;
- (float)viewportMinimumFOV;
- (float)xEaseInCurveA;
- (float)xEaseInCurveB;
- (float)yEaseInCurveA;
- (float)yEaseInCurveB;
- (float)zoomAccelerationMultiplier;
- (float)zoomEaseInCurveA;
- (float)zoomEaseInCurveB;
- (float)zoomInSpeedMultiplier;
- (float)zoomOutSpeedMultiplier;
- (id)asDictionary;
- (id)optionsForFramingStyle:(int)a3;
- (void)loadFramingStyleSpecificOptions:(id)a3;
- (void)setDeadbandRecenteringDurationSec:(float)a3;
- (void)setDeadbandRecenteringIdleDurationSec:(float)a3;
- (void)setDeadbandRecenteringInitialDelaySec:(float)a3;
- (void)setDefaultViewportRotation:(CinematicFramingSessionOptions *)self;
- (void)setHorizontalAccelerationMultiplier:(float)a3;
- (void)setHorizontalSpeedMultiplier:(float)a3;
- (void)setInferSubjectBodyFromFaceLocation:(BOOL)a3;
- (void)setMultiPersonFramingParameters:(id)a3;
- (void)setNoPeopleDelayBeforeReturningHomeSec:(float)a3;
- (void)setNoPeopleReturningHomeDurationSec:(float)a3;
- (void)setRecenterAfterDriftDurationThreshold:(float)a3;
- (void)setRecenterAfterDriftEnabled:(BOOL)a3;
- (void)setRecenterAfterDriftOffsetThreshold:(float)a3;
- (void)setShouldDisableTransitions:(BOOL)a3;
- (void)setSinglePersonFramingParameters:(id)a3;
- (void)setSubjectMovementTolerance:(float)a3;
- (void)setTinyHeadMaxValue:(float)a3;
- (void)setTinyHeadMinValue:(float)a3;
- (void)setVerticalAccelerationMultiplier:(float)a3;
- (void)setVerticalSpeedMultiplier:(float)a3;
- (void)setViewportDefaultFOV:(float)a3;
- (void)setViewportMinimumFOV:(float)a3;
- (void)setXEaseInCurveA:(float)a3;
- (void)setXEaseInCurveB:(float)a3;
- (void)setYEaseInCurveA:(float)a3;
- (void)setYEaseInCurveB:(float)a3;
- (void)setZoomAccelerationMultiplier:(float)a3;
- (void)setZoomEaseInCurveA:(float)a3;
- (void)setZoomEaseInCurveB:(float)a3;
- (void)setZoomInSpeedMultiplier:(float)a3;
- (void)setZoomOutSpeedMultiplier:(float)a3;
@end

@implementation CinematicFramingSessionOptions

- (CinematicFramingSessionOptions)initWithPlistPath:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CinematicFramingSessionOptions;
  v5 = [(CinematicFramingSessionOptions *)&v8 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
    v5 = [(CinematicFramingSessionOptions *)v5 initWithPlist:v6];
  }
  return v5;
}

- (CinematicFramingSessionOptions)initWithPlist:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)CinematicFramingSessionOptions;
  v5 = [(CinematicFramingSessionOptions *)&v70 init];
  if (v5)
  {
    v6 = [CinematicFramingSessionFramingParameters alloc];
    v7 = [v4 objectForKeyedSubscript:@"singlePersonFramingParameters"];
    objc_super v8 = [(CinematicFramingSessionFramingParameters *)v6 initWithPlist:v7];
    [(CinematicFramingSessionOptions *)v5 setSinglePersonFramingParameters:v8];

    v9 = [CinematicFramingSessionFramingParameters alloc];
    v10 = [v4 objectForKeyedSubscript:@"multiPersonFramingParameters"];
    v11 = [(CinematicFramingSessionFramingParameters *)v9 initWithPlist:v10];
    [(CinematicFramingSessionOptions *)v5 setMultiPersonFramingParameters:v11];

    v12 = [v4 objectForKeyedSubscript:@"horizontalSpeedMultiplier"];
    [v12 floatValue];
    -[CinematicFramingSessionOptions setHorizontalSpeedMultiplier:](v5, "setHorizontalSpeedMultiplier:");

    v13 = [v4 objectForKeyedSubscript:@"horizontalAccelerationMultiplier"];
    [v13 floatValue];
    -[CinematicFramingSessionOptions setHorizontalAccelerationMultiplier:](v5, "setHorizontalAccelerationMultiplier:");

    v14 = [v4 objectForKeyedSubscript:@"verticalSpeedMultiplier"];
    [v14 floatValue];
    -[CinematicFramingSessionOptions setVerticalSpeedMultiplier:](v5, "setVerticalSpeedMultiplier:");

    v15 = [v4 objectForKeyedSubscript:@"verticalAccelerationMultiplier"];
    [v15 floatValue];
    -[CinematicFramingSessionOptions setVerticalAccelerationMultiplier:](v5, "setVerticalAccelerationMultiplier:");

    v16 = [v4 objectForKeyedSubscript:@"zoomInSpeedMultiplier"];
    [v16 floatValue];
    -[CinematicFramingSessionOptions setZoomInSpeedMultiplier:](v5, "setZoomInSpeedMultiplier:");

    v17 = [v4 objectForKeyedSubscript:@"zoomOutSpeedMultiplier"];
    [v17 floatValue];
    -[CinematicFramingSessionOptions setZoomOutSpeedMultiplier:](v5, "setZoomOutSpeedMultiplier:");

    v18 = [v4 objectForKeyedSubscript:@"zoomAccelerationMultiplier"];
    [v18 floatValue];
    -[CinematicFramingSessionOptions setZoomAccelerationMultiplier:](v5, "setZoomAccelerationMultiplier:");

    v19 = [v4 objectForKeyedSubscript:@"shouldDisableTransitions"];
    -[CinematicFramingSessionOptions setShouldDisableTransitions:](v5, "setShouldDisableTransitions:", [v19 BOOLValue]);

    v20 = [v4 objectForKeyedSubscript:@"zoomEaseInCurve"];
    v21 = [v20 objectForKeyedSubscript:@"A"];
    v22 = v21;
    if (!v21) {
      v21 = @"1.0";
    }
    [(__CFString *)v21 floatValue];
    -[CinematicFramingSessionOptions setZoomEaseInCurveA:](v5, "setZoomEaseInCurveA:");

    v23 = [v4 objectForKeyedSubscript:@"zoomEaseInCurve"];
    v24 = [v23 objectForKeyedSubscript:@"B"];
    v25 = v24;
    if (!v24) {
      v24 = @"0.2";
    }
    [(__CFString *)v24 floatValue];
    -[CinematicFramingSessionOptions setZoomEaseInCurveB:](v5, "setZoomEaseInCurveB:");

    v26 = [v4 objectForKeyedSubscript:@"xEaseInCurve"];
    v27 = [v26 objectForKeyedSubscript:@"A"];
    v28 = v27;
    if (!v27) {
      v27 = @"4.0";
    }
    [(__CFString *)v27 floatValue];
    -[CinematicFramingSessionOptions setXEaseInCurveA:](v5, "setXEaseInCurveA:");

    v29 = [v4 objectForKeyedSubscript:@"xEaseInCurve"];
    v30 = [v29 objectForKeyedSubscript:@"B"];
    v31 = v30;
    if (!v30) {
      v30 = @"0.2";
    }
    [(__CFString *)v30 floatValue];
    -[CinematicFramingSessionOptions setXEaseInCurveB:](v5, "setXEaseInCurveB:");

    v32 = [v4 objectForKeyedSubscript:@"yEaseInCurve"];
    v33 = [v32 objectForKeyedSubscript:@"A"];
    v34 = v33;
    if (!v33) {
      v33 = @"2.5";
    }
    [(__CFString *)v33 floatValue];
    -[CinematicFramingSessionOptions setYEaseInCurveA:](v5, "setYEaseInCurveA:");

    v35 = [v4 objectForKeyedSubscript:@"yEaseInCurve"];
    v36 = [v35 objectForKeyedSubscript:@"B"];
    v37 = v36;
    if (!v36) {
      v36 = @"0.2";
    }
    [(__CFString *)v36 floatValue];
    -[CinematicFramingSessionOptions setYEaseInCurveB:](v5, "setYEaseInCurveB:");

    v38 = [v4 objectForKeyedSubscript:@"viewportDefaultFOV"];
    v39 = v38;
    if (!v38) {
      v38 = @"0.68";
    }
    [(__CFString *)v38 floatValue];
    -[CinematicFramingSessionOptions setViewportDefaultFOV:](v5, "setViewportDefaultFOV:");

    v40 = [v4 objectForKeyedSubscript:@"viewportMinimumFOV"];
    v41 = v40;
    if (!v40) {
      v40 = @"0.34";
    }
    [(__CFString *)v40 floatValue];
    -[CinematicFramingSessionOptions setViewportMinimumFOV:](v5, "setViewportMinimumFOV:");

    v42 = [v4 objectForKeyedSubscript:@"deadbandRecenteringInitialDelaySec"];
    v43 = v42;
    if (!v42) {
      v42 = @"3.0";
    }
    [(__CFString *)v42 floatValue];
    -[CinematicFramingSessionOptions setDeadbandRecenteringInitialDelaySec:](v5, "setDeadbandRecenteringInitialDelaySec:");

    v44 = [v4 objectForKeyedSubscript:@"deadbandRecenteringDurationSec"];
    v45 = v44;
    if (!v44) {
      v44 = @"1.5";
    }
    [(__CFString *)v44 floatValue];
    -[CinematicFramingSessionOptions setDeadbandRecenteringDurationSec:](v5, "setDeadbandRecenteringDurationSec:");

    v46 = [v4 objectForKeyedSubscript:@"deadbandRecenteringIdleDurationSec"];
    v47 = v46;
    if (!v46) {
      v46 = @"5.0";
    }
    [(__CFString *)v46 floatValue];
    -[CinematicFramingSessionOptions setDeadbandRecenteringIdleDurationSec:](v5, "setDeadbandRecenteringIdleDurationSec:");

    v48 = [v4 objectForKeyedSubscript:@"noPeopleDelayBeforeReturningHomeSec"];
    v49 = v48;
    if (!v48) {
      v48 = @"5.0";
    }
    [(__CFString *)v48 floatValue];
    -[CinematicFramingSessionOptions setNoPeopleDelayBeforeReturningHomeSec:](v5, "setNoPeopleDelayBeforeReturningHomeSec:");

    v50 = [v4 objectForKeyedSubscript:@"noPeopleReturningHomeDurationSec"];
    v51 = v50;
    if (!v50) {
      v50 = @"5.0";
    }
    [(__CFString *)v50 floatValue];
    -[CinematicFramingSessionOptions setNoPeopleReturningHomeDurationSec:](v5, "setNoPeopleReturningHomeDurationSec:");

    v52 = [v4 objectForKeyedSubscript:@"tinyHeadMinValue"];
    v53 = v52;
    if (!v52) {
      v52 = @"0.0";
    }
    [(__CFString *)v52 floatValue];
    -[CinematicFramingSessionOptions setTinyHeadMinValue:](v5, "setTinyHeadMinValue:");

    v54 = [v4 objectForKeyedSubscript:@"tinyHeadMaxValue"];
    v55 = v54;
    if (!v54) {
      v54 = @"0.0";
    }
    [(__CFString *)v54 floatValue];
    -[CinematicFramingSessionOptions setTinyHeadMaxValue:](v5, "setTinyHeadMaxValue:");

    v56 = [v4 objectForKeyedSubscript:@"subjectMovementTolerance"];
    v57 = v56;
    if (!v56) {
      v56 = @"0.2";
    }
    [(__CFString *)v56 floatValue];
    -[CinematicFramingSessionOptions setSubjectMovementTolerance:](v5, "setSubjectMovementTolerance:");

    v58 = [v4 objectForKeyedSubscript:@"recenterAfterDriftEnabled"];
    v59 = v58;
    if (!v58) {
      v58 = @"true";
    }
    [(CinematicFramingSessionOptions *)v5 setRecenterAfterDriftEnabled:[(__CFString *)v58 BOOLValue]];

    v60 = [v4 objectForKeyedSubscript:@"recenterAfterDriftDurationThreshold"];
    v61 = v60;
    if (!v60) {
      v60 = @"1.0";
    }
    *(float *)&double v62 = (float)[(__CFString *)v60 BOOLValue];
    [(CinematicFramingSessionOptions *)v5 setRecenterAfterDriftDurationThreshold:v62];

    v63 = [v4 objectForKeyedSubscript:@"recenterAfterDriftOffsetThreshold"];
    v64 = v63;
    if (!v63) {
      v63 = @"0.25";
    }
    *(float *)&double v65 = (float)[(__CFString *)v63 BOOLValue];
    [(CinematicFramingSessionOptions *)v5 setRecenterAfterDriftOffsetThreshold:v65];

    v66 = [v4 objectForKeyedSubscript:@"inferSubjectBodyFromFaceLocation"];
    v67 = v66;
    if (!v66) {
      v66 = @"true";
    }
    [(CinematicFramingSessionOptions *)v5 setInferSubjectBodyFromFaceLocation:[(__CFString *)v66 BOOLValue]];

    [(CinematicFramingSessionOptions *)v5 loadFramingStyleSpecificOptions:v4];
    v68 = v5;
  }

  return v5;
}

- (id)asDictionary
{
  v72[27] = *MEMORY[0x1E4F143B8];
  v71[0] = @"singlePersonFramingParameters";
  v64 = [(CinematicFramingSessionOptions *)self singlePersonFramingParameters];
  v63 = [v64 asDictionary];
  v72[0] = v63;
  v71[1] = @"multiPersonFramingParameters";
  double v62 = [(CinematicFramingSessionOptions *)self multiPersonFramingParameters];
  v61 = [v62 asDictionary];
  v72[1] = v61;
  v71[2] = @"horizontalSpeedMultiplier";
  v3 = NSNumber;
  [(CinematicFramingSessionOptions *)self horizontalSpeedMultiplier];
  v60 = objc_msgSend(v3, "numberWithFloat:");
  v72[2] = v60;
  v71[3] = @"horizontalAccelerationMultiplier";
  id v4 = NSNumber;
  [(CinematicFramingSessionOptions *)self horizontalAccelerationMultiplier];
  v59 = objc_msgSend(v4, "numberWithFloat:");
  v72[3] = v59;
  v71[4] = @"verticalSpeedMultiplier";
  v5 = NSNumber;
  [(CinematicFramingSessionOptions *)self verticalSpeedMultiplier];
  v58 = objc_msgSend(v5, "numberWithFloat:");
  v72[4] = v58;
  v71[5] = @"verticalAccelerationMultiplier";
  v6 = NSNumber;
  [(CinematicFramingSessionOptions *)self verticalAccelerationMultiplier];
  v57 = objc_msgSend(v6, "numberWithFloat:");
  v72[5] = v57;
  v71[6] = @"zoomInSpeedMultiplier";
  v7 = NSNumber;
  [(CinematicFramingSessionOptions *)self zoomInSpeedMultiplier];
  v56 = objc_msgSend(v7, "numberWithFloat:");
  v72[6] = v56;
  v71[7] = @"zoomOutSpeedMultiplier";
  objc_super v8 = NSNumber;
  [(CinematicFramingSessionOptions *)self zoomOutSpeedMultiplier];
  v55 = objc_msgSend(v8, "numberWithFloat:");
  v72[7] = v55;
  v71[8] = @"zoomAccelerationMultiplier";
  v9 = NSNumber;
  [(CinematicFramingSessionOptions *)self zoomAccelerationMultiplier];
  v54 = objc_msgSend(v9, "numberWithFloat:");
  v72[8] = v54;
  v71[9] = @"shouldDisableTransitions";
  v53 = objc_msgSend(NSNumber, "numberWithBool:", -[CinematicFramingSessionOptions shouldDisableTransitions](self, "shouldDisableTransitions"));
  v72[9] = v53;
  v71[10] = @"zoomEaseInCurve";
  v69[0] = @"A";
  v10 = NSNumber;
  [(CinematicFramingSessionOptions *)self zoomEaseInCurveA];
  v52 = objc_msgSend(v10, "numberWithFloat:");
  v69[1] = @"B";
  v70[0] = v52;
  v11 = NSNumber;
  [(CinematicFramingSessionOptions *)self zoomEaseInCurveB];
  v51 = objc_msgSend(v11, "numberWithFloat:");
  v70[1] = v51;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
  v72[10] = v50;
  v71[11] = @"xEaseInCurve";
  v67[0] = @"A";
  v12 = NSNumber;
  [(CinematicFramingSessionOptions *)self xEaseInCurveA];
  v49 = objc_msgSend(v12, "numberWithFloat:");
  v67[1] = @"B";
  v68[0] = v49;
  v13 = NSNumber;
  [(CinematicFramingSessionOptions *)self xEaseInCurveB];
  v48 = objc_msgSend(v13, "numberWithFloat:");
  v68[1] = v48;
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
  v72[11] = v47;
  v71[12] = @"yEaseInCurve";
  v65[0] = @"A";
  v14 = NSNumber;
  [(CinematicFramingSessionOptions *)self yEaseInCurveA];
  v46 = objc_msgSend(v14, "numberWithFloat:");
  v65[1] = @"B";
  v66[0] = v46;
  v15 = NSNumber;
  [(CinematicFramingSessionOptions *)self yEaseInCurveB];
  v45 = objc_msgSend(v15, "numberWithFloat:");
  v66[1] = v45;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:2];
  v72[12] = v44;
  v71[13] = @"viewportDefaultFOV";
  v16 = NSNumber;
  [(CinematicFramingSessionOptions *)self viewportDefaultFOV];
  v43 = objc_msgSend(v16, "numberWithFloat:");
  v72[13] = v43;
  v71[14] = @"viewportMinimumFOV";
  v17 = NSNumber;
  [(CinematicFramingSessionOptions *)self viewportMinimumFOV];
  v42 = objc_msgSend(v17, "numberWithFloat:");
  v72[14] = v42;
  v71[15] = @"deadbandRecenteringInitialDelaySec";
  v18 = NSNumber;
  [(CinematicFramingSessionOptions *)self deadbandRecenteringInitialDelaySec];
  v41 = objc_msgSend(v18, "numberWithFloat:");
  v72[15] = v41;
  v71[16] = @"deadbandRecenteringDurationSec";
  v19 = NSNumber;
  [(CinematicFramingSessionOptions *)self deadbandRecenteringDurationSec];
  v40 = objc_msgSend(v19, "numberWithFloat:");
  v72[16] = v40;
  v71[17] = @"deadbandRecenteringIdleDurationSec";
  v20 = NSNumber;
  [(CinematicFramingSessionOptions *)self deadbandRecenteringIdleDurationSec];
  v39 = objc_msgSend(v20, "numberWithFloat:");
  v72[17] = v39;
  v71[18] = @"noPeopleDelayBeforeReturningHomeSec";
  v21 = NSNumber;
  [(CinematicFramingSessionOptions *)self noPeopleDelayBeforeReturningHomeSec];
  v22 = objc_msgSend(v21, "numberWithFloat:");
  v72[18] = v22;
  v71[19] = @"noPeopleReturningHomeDurationSec";
  v23 = NSNumber;
  [(CinematicFramingSessionOptions *)self noPeopleReturningHomeDurationSec];
  v24 = objc_msgSend(v23, "numberWithFloat:");
  v72[19] = v24;
  v71[20] = @"tinyHeadMinValue";
  v25 = NSNumber;
  [(CinematicFramingSessionOptions *)self tinyHeadMinValue];
  v26 = objc_msgSend(v25, "numberWithFloat:");
  v72[20] = v26;
  v71[21] = @"tinyHeadMaxValue";
  v27 = NSNumber;
  [(CinematicFramingSessionOptions *)self tinyHeadMaxValue];
  v28 = objc_msgSend(v27, "numberWithFloat:");
  v72[21] = v28;
  v71[22] = @"subjectMovementTolerance";
  v29 = NSNumber;
  [(CinematicFramingSessionOptions *)self subjectMovementTolerance];
  v30 = objc_msgSend(v29, "numberWithFloat:");
  v72[22] = v30;
  v71[23] = @"recenterAfterDriftEnabled";
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[CinematicFramingSessionOptions recenterAfterDriftEnabled](self, "recenterAfterDriftEnabled"));
  v72[23] = v31;
  v71[24] = @"recenterAfterDriftDurationThreshold";
  v32 = NSNumber;
  [(CinematicFramingSessionOptions *)self recenterAfterDriftDurationThreshold];
  v33 = objc_msgSend(v32, "numberWithFloat:");
  v72[24] = v33;
  v71[25] = @"recenterAfterDriftOffsetThreshold";
  v34 = NSNumber;
  [(CinematicFramingSessionOptions *)self recenterAfterDriftOffsetThreshold];
  v35 = objc_msgSend(v34, "numberWithFloat:");
  v72[25] = v35;
  v71[26] = @"inferSubjectBodyFromFaceLocation";
  v36 = objc_msgSend(NSNumber, "numberWithBool:", -[CinematicFramingSessionOptions inferSubjectBodyFromFaceLocation](self, "inferSubjectBodyFromFaceLocation"));
  v72[26] = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:27];

  return v37;
}

- (void)loadFramingStyleSpecificOptions:(id)a3
{
  id v13 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  framingStyleSpecificOptions = self->_framingStyleSpecificOptions;
  self->_framingStyleSpecificOptions = v4;

  v6 = [v13 objectForKeyedSubscript:@"framingStyleOverrides"];
  if (v6)
  {
    for (uint64_t i = 0; i <= 2; ++i)
    {
      objc_super v8 = off_1E6CCF8B0[i];
      v9 = [(NSMutableDictionary *)self->_framingStyleSpecificOptions objectForKeyedSubscript:v8];

      if (!v9)
      {
        v10 = (void *)[v13 mutableCopy];
        [v10 removeObjectForKey:@"framingStyleOverrides"];
        v11 = [v6 objectForKeyedSubscript:v8];
        [v10 setValuesForKeysWithDictionary:v11];
        v12 = [[CinematicFramingSessionOptions alloc] initWithPlist:v10];
        [(NSMutableDictionary *)self->_framingStyleSpecificOptions setObject:v12 forKeyedSubscript:v8];
      }
    }
  }
}

- (id)optionsForFramingStyle:(int)a3
{
  if ((a3 - 2) < 2)
  {
    id v4 = @"Newsroom";
LABEL_7:
    v3 = [(NSMutableDictionary *)self->_framingStyleSpecificOptions objectForKeyedSubscript:v4];
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    id v4 = @"Floating";
    goto LABEL_7;
  }
  if (a3) {
    v3 = 0;
  }
  else {
    v3 = self;
  }
LABEL_9:

  return v3;
}

- (CinematicFramingSessionFramingParameters)singlePersonFramingParameters
{
  return self->singlePersonFramingParameters;
}

- (void)setSinglePersonFramingParameters:(id)a3
{
}

- (CinematicFramingSessionFramingParameters)multiPersonFramingParameters
{
  return self->multiPersonFramingParameters;
}

- (void)setMultiPersonFramingParameters:(id)a3
{
}

- (float)horizontalSpeedMultiplier
{
  return self->horizontalSpeedMultiplier;
}

- (void)setHorizontalSpeedMultiplier:(float)a3
{
  self->horizontalSpeedMultiplier = a3;
}

- (float)horizontalAccelerationMultiplier
{
  return self->horizontalAccelerationMultiplier;
}

- (void)setHorizontalAccelerationMultiplier:(float)a3
{
  self->horizontalAccelerationMultiplier = a3;
}

- (float)verticalSpeedMultiplier
{
  return self->verticalSpeedMultiplier;
}

- (void)setVerticalSpeedMultiplier:(float)a3
{
  self->verticalSpeedMultiplier = a3;
}

- (float)verticalAccelerationMultiplier
{
  return self->verticalAccelerationMultiplier;
}

- (void)setVerticalAccelerationMultiplier:(float)a3
{
  self->verticalAccelerationMultiplier = a3;
}

- (float)zoomInSpeedMultiplier
{
  return self->zoomInSpeedMultiplier;
}

- (void)setZoomInSpeedMultiplier:(float)a3
{
  self->zoomInSpeedMultiplier = a3;
}

- (float)zoomOutSpeedMultiplier
{
  return self->zoomOutSpeedMultiplier;
}

- (void)setZoomOutSpeedMultiplier:(float)a3
{
  self->zoomOutSpeedMultiplier = a3;
}

- (float)zoomAccelerationMultiplier
{
  return self->zoomAccelerationMultiplier;
}

- (void)setZoomAccelerationMultiplier:(float)a3
{
  self->zoomAccelerationMultiplier = a3;
}

- (BOOL)shouldDisableTransitions
{
  return self->shouldDisableTransitions;
}

- (void)setShouldDisableTransitions:(BOOL)a3
{
  self->shouldDisableTransitions = a3;
}

- (float)zoomEaseInCurveA
{
  return self->zoomEaseInCurveA;
}

- (void)setZoomEaseInCurveA:(float)a3
{
  self->zoomEaseInCurveA = a3;
}

- (float)zoomEaseInCurveB
{
  return self->zoomEaseInCurveB;
}

- (void)setZoomEaseInCurveB:(float)a3
{
  self->zoomEaseInCurveB = a3;
}

- (float)xEaseInCurveA
{
  return self->xEaseInCurveA;
}

- (void)setXEaseInCurveA:(float)a3
{
  self->xEaseInCurveA = a3;
}

- (float)xEaseInCurveB
{
  return self->xEaseInCurveB;
}

- (void)setXEaseInCurveB:(float)a3
{
  self->xEaseInCurveB = a3;
}

- (float)yEaseInCurveA
{
  return self->yEaseInCurveA;
}

- (void)setYEaseInCurveA:(float)a3
{
  self->yEaseInCurveA = a3;
}

- (float)yEaseInCurveB
{
  return self->yEaseInCurveB;
}

- (void)setYEaseInCurveB:(float)a3
{
  self->yEaseInCurveB = a3;
}

- (float)viewportDefaultFOV
{
  return self->viewportDefaultFOV;
}

- (void)setViewportDefaultFOV:(float)a3
{
  self->viewportDefaultFOV = a3;
}

- (float)viewportMinimumFOV
{
  return self->viewportMinimumFOV;
}

- (void)setViewportMinimumFOV:(float)a3
{
  self->viewportMinimumFOV = a3;
}

- (float)deadbandRecenteringInitialDelaySec
{
  return self->deadbandRecenteringInitialDelaySec;
}

- (void)setDeadbandRecenteringInitialDelaySec:(float)a3
{
  self->deadbandRecenteringInitialDelaySec = a3;
}

- (float)deadbandRecenteringDurationSec
{
  return self->deadbandRecenteringDurationSec;
}

- (void)setDeadbandRecenteringDurationSec:(float)a3
{
  self->deadbandRecenteringDurationSec = a3;
}

- (float)deadbandRecenteringIdleDurationSec
{
  return self->deadbandRecenteringIdleDurationSec;
}

- (void)setDeadbandRecenteringIdleDurationSec:(float)a3
{
  self->deadbandRecenteringIdleDurationSec = a3;
}

- (float)noPeopleDelayBeforeReturningHomeSec
{
  return self->noPeopleDelayBeforeReturningHomeSec;
}

- (void)setNoPeopleDelayBeforeReturningHomeSec:(float)a3
{
  self->noPeopleDelayBeforeReturningHomeSec = a3;
}

- (float)noPeopleReturningHomeDurationSec
{
  return self->noPeopleReturningHomeDurationSec;
}

- (void)setNoPeopleReturningHomeDurationSec:(float)a3
{
  self->noPeopleReturningHomeDurationSec = a3;
}

- (float)tinyHeadMinValue
{
  return self->tinyHeadMinValue;
}

- (void)setTinyHeadMinValue:(float)a3
{
  self->tinyHeadMinValue = a3;
}

- (float)tinyHeadMaxValue
{
  return self->tinyHeadMaxValue;
}

- (void)setTinyHeadMaxValue:(float)a3
{
  self->tinyHeadMaxValue = a3;
}

- (float)subjectMovementTolerance
{
  return self->subjectMovementTolerance;
}

- (void)setSubjectMovementTolerance:(float)a3
{
  self->subjectMovementTolerance = a3;
}

- (BOOL)recenterAfterDriftEnabled
{
  return self->recenterAfterDriftEnabled;
}

- (void)setRecenterAfterDriftEnabled:(BOOL)a3
{
  self->recenterAfterDriftEnabled = a3;
}

- (float)recenterAfterDriftDurationThreshold
{
  return self->recenterAfterDriftDurationThreshold;
}

- (void)setRecenterAfterDriftDurationThreshold:(float)a3
{
  self->recenterAfterDriftDurationThreshold = a3;
}

- (float)recenterAfterDriftOffsetThreshold
{
  return self->recenterAfterDriftOffsetThreshold;
}

- (void)setRecenterAfterDriftOffsetThreshold:(float)a3
{
  self->recenterAfterDriftOffsetThreshold = a3;
}

- (BOOL)inferSubjectBodyFromFaceLocation
{
  return self->inferSubjectBodyFromFaceLocation;
}

- (void)setInferSubjectBodyFromFaceLocation:(BOOL)a3
{
  self->inferSubjectBodyFromFaceLocation = a3;
}

- (double)defaultViewportRotation
{
  return *(double *)(a1 + 136);
}

- (void)setDefaultViewportRotation:(CinematicFramingSessionOptions *)self
{
  *(void *)self->_defaultViewportRotation = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->multiPersonFramingParameters, 0);
  objc_storeStrong((id *)&self->singlePersonFramingParameters, 0);

  objc_storeStrong((id *)&self->_framingStyleSpecificOptions, 0);
}

@end