@interface VNImageAestheticsObservation
+ (BOOL)supportsSecureCoding;
+ (id)allScorePropertyNames;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)observationForOriginatingRequestSpecifier:(id)a3 overallAestheticScore:(float)a4 wellFramedSubjectScore:(float)a5 wellChosenBackgroundScore:(float)a6 tastefullyBlurredScore:(float)a7 sharplyFocusedSubjectScore:(float)a8 wellTimedShotScore:(float)a9 pleasantLightingScore:(float)a10 pleasantReflectionsScore:(float)a11 harmoniousColorScore:(float)a12 livelyColorScore:(float)a13 pleasantSymmetryScore:(float)a14 pleasantPatternScore:(float)a15 immersivenessScore:(float)a16 pleasantPerspectiveScore:(float)a17 pleasantPostProcessingScore:(float)a18 noiseScore:(float)a19 failureScore:(float)a20 pleasantCompositionScore:(float)a21 interestingSubjectScore:(float)a22 intrusiveObjectPresenceScore:(float)a23 pleasantCameraTiltScore:(float)a24 lowKeyLightingScore:(float)a25 error:(id *)a26;
- (VNImageAestheticsObservation)initWithCoder:(id)a3;
- (float)aestheticScore;
- (float)failureScore;
- (float)harmoniousColorScore;
- (float)immersivenessScore;
- (float)interestingSubjectScore;
- (float)intrusiveObjectPresenceScore;
- (float)livelyColorScore;
- (float)lowKeyLightingScore;
- (float)noiseScore;
- (float)pleasantCameraTiltScore;
- (float)pleasantCompositionScore;
- (float)pleasantLightingScore;
- (float)pleasantPatternScore;
- (float)pleasantPerspectiveScore;
- (float)pleasantPostProcessingScore;
- (float)pleasantReflectionsScore;
- (float)pleasantSymmetryScore;
- (float)sharplyFocusedSubjectScore;
- (float)tastefullyBlurredScore;
- (float)wellChosenBackgroundScore;
- (float)wellFramedSubjectScore;
- (float)wellTimedShotScore;
- (id)_initWithOriginatingRequestSpecifier:(id)a3 overallAestheticScore:(float)a4 wellFramedSubjectScore:(float)a5 wellChosenBackgroundScore:(float)a6 tastefullyBlurredScore:(float)a7 sharplyFocusedSubjectScore:(float)a8 wellTimedShotScore:(float)a9 pleasantLightingScore:(float)a10 pleasantReflectionsScore:(float)a11 harmoniousColorScore:(float)a12 livelyColorScore:(float)a13 pleasantSymmetryScore:(float)a14 pleasantPatternScore:(float)a15 immersivenessScore:(float)a16 pleasantPerspectiveScore:(float)a17 pleasantPostProcessingScore:(float)a18 noiseScore:(float)a19 failureScore:(float)a20 pleasantCompositionScore:(float)a21 interestingSubjectScore:(float)a22 intrusiveObjectPresenceScore:(float)a23 pleasantCameraTiltScore:(float)a24 lowKeyLightingScore:(float)a25;
- (id)_scoresDictionary;
- (id)description;
- (id)vn_cloneObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNImageAestheticsObservation

- (float)lowKeyLightingScore
{
  return self->_lowKeyLightingScore;
}

- (float)pleasantCameraTiltScore
{
  return self->_pleasantCameraTiltScore;
}

- (float)intrusiveObjectPresenceScore
{
  return self->_intrusiveObjectPresenceScore;
}

- (float)interestingSubjectScore
{
  return self->_interestingSubjectScore;
}

- (float)pleasantCompositionScore
{
  return self->_pleasantCompositionScore;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (float)noiseScore
{
  return self->_noiseScore;
}

- (float)pleasantPostProcessingScore
{
  return self->_pleasantPostProcessingScore;
}

- (float)pleasantPerspectiveScore
{
  return self->_pleasantPerspectiveScore;
}

- (float)immersivenessScore
{
  return self->_immersivenessScore;
}

- (float)pleasantPatternScore
{
  return self->_pleasantPatternScore;
}

- (float)pleasantSymmetryScore
{
  return self->_pleasantSymmetryScore;
}

- (float)livelyColorScore
{
  return self->_livelyColorScore;
}

- (float)harmoniousColorScore
{
  return self->_harmoniousColorScore;
}

- (float)pleasantReflectionsScore
{
  return self->_pleasantReflectionsScore;
}

- (float)pleasantLightingScore
{
  return self->_pleasantLightingScore;
}

- (float)wellTimedShotScore
{
  return self->_wellTimedShotScore;
}

- (float)sharplyFocusedSubjectScore
{
  return self->_sharplyFocusedSubjectScore;
}

- (float)tastefullyBlurredScore
{
  return self->_tastefullyBlurredScore;
}

- (float)wellChosenBackgroundScore
{
  return self->_wellChosenBackgroundScore;
}

- (float)wellFramedSubjectScore
{
  return self->_wellFramedSubjectScore;
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v20.receiver = self;
  v20.super_class = (Class)VNImageAestheticsObservation;
  v4 = [(VNObservation *)&v20 description];
  [v3 appendString:v4];

  v5 = (void *)MEMORY[0x1A6257080]();
  v6 = [(VNImageAestheticsObservation *)self _scoresDictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = [v6 allKeys];
  v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v14 = [v6 objectForKeyedSubscript:v13];
        [v3 appendFormat:@"\n  %@=%@", v13, v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  return v3;
}

- (id)_scoresDictionary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() allScorePropertyNames];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)MEMORY[0x1A6257080]();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v12 = -[VNImageAestheticsObservation valueForKey:](self, "valueForKey:", v11, (void)v14);
        [v4 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)vn_cloneObject
{
  v5.receiver = self;
  v5.super_class = (Class)VNImageAestheticsObservation;
  id v3 = [(VNObservation *)&v5 vn_cloneObject];
  if (v3)
  {
    v3[24] = self->_aestheticScore;
    v3[25] = self->_wellFramedSubjectScore;
    v3[26] = self->_wellChosenBackgroundScore;
    v3[27] = self->_tastefullyBlurredScore;
    v3[28] = self->_sharplyFocusedSubjectScore;
    v3[29] = self->_wellTimedShotScore;
    v3[30] = self->_pleasantLightingScore;
    v3[31] = self->_pleasantReflectionsScore;
    v3[32] = self->_harmoniousColorScore;
    v3[33] = self->_livelyColorScore;
    v3[34] = self->_pleasantSymmetryScore;
    v3[35] = self->_pleasantPatternScore;
    v3[36] = self->_immersivenessScore;
    v3[37] = self->_pleasantPerspectiveScore;
    v3[38] = self->_pleasantPostProcessingScore;
    v3[39] = self->_noiseScore;
    v3[40] = self->_failureScore;
    v3[41] = self->_pleasantCompositionScore;
    v3[42] = self->_interestingSubjectScore;
    v3[43] = self->_intrusiveObjectPresenceScore;
    v3[44] = self->_pleasantCameraTiltScore;
    v3[45] = self->_lowKeyLightingScore;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)VNImageAestheticsObservation;
  id v4 = a3;
  [(VNObservation *)&v27 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", &unk_1EF7A7220, @"VNImageAestheticsObservation", v27.receiver, v27.super_class);
  *(float *)&double v5 = self->_aestheticScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"OAES", v5);
  *(float *)&double v6 = self->_wellFramedSubjectScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"WFS", v6);
  *(float *)&double v7 = self->_wellChosenBackgroundScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"WCS", v7);
  *(float *)&double v8 = self->_tastefullyBlurredScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"TBC", v8);
  *(float *)&double v9 = self->_sharplyFocusedSubjectScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"SFS", v9);
  *(float *)&double v10 = self->_pleasantLightingScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PLHT", v10);
  *(float *)&double v11 = self->_pleasantReflectionsScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PREF", v11);
  *(float *)&double v12 = self->_livelyColorScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"LCOL", v12);
  *(float *)&double v13 = self->_pleasantSymmetryScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PSYM", v13);
  *(float *)&double v14 = self->_pleasantPatternScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PPAT", v14);
  *(float *)&double v15 = self->_immersivenessScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"IMM", v15);
  *(float *)&double v16 = self->_pleasantPerspectiveScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PPERS", v16);
  *(float *)&double v17 = self->_pleasantPostProcessingScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PPOST", v17);
  *(float *)&double v18 = self->_noiseScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"NOISE", v18);
  *(float *)&double v19 = self->_failureScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"FAIL", v19);
  *(float *)&double v20 = self->_pleasantCompositionScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PCOMP", v20);
  *(float *)&double v21 = self->_interestingSubjectScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"INTREST", v21);
  *(float *)&double v22 = self->_intrusiveObjectPresenceScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"INTRUSIVE", v22);
  *(float *)&double v23 = self->_pleasantCameraTiltScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"CTILT", v23);
  *(float *)&double v24 = self->_wellTimedShotScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"WTS", v24);
  *(float *)&double v25 = self->_harmoniousColorScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"HCOL", v25);
  *(float *)&double v26 = self->_lowKeyLightingScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"LOWKEY", v26);
}

- (VNImageAestheticsObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VNImageAestheticsObservation;
  double v5 = [(VNObservation *)&v31 initWithCoder:v4];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNImageAestheticsObservation"];
    if ([v6 intValue] != 1)
    {

      v29 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"OAES");
    v5->_aestheticScore = v7;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"WFS");
    v5->_wellFramedSubjectScore = v8;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"WCS");
    v5->_wellChosenBackgroundScore = v9;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"TBC");
    v5->_tastefullyBlurredScore = v10;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"SFS");
    v5->_sharplyFocusedSubjectScore = v11;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PLHT");
    v5->_pleasantLightingScore = v12;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PREF");
    v5->_pleasantReflectionsScore = v13;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"LCOL");
    v5->_livelyColorScore = v14;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PSYM");
    v5->_pleasantSymmetryScore = v15;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PPAT");
    v5->_pleasantPatternScore = v16;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"IMM");
    v5->_immersivenessScore = v17;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PPERS");
    v5->_pleasantPerspectiveScore = v18;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PPOST");
    v5->_pleasantPostProcessingScore = v19;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"NOISE");
    v5->_noiseScore = v20;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"FAIL");
    v5->_failureScore = v21;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PCOMP");
    v5->_pleasantCompositionScore = v22;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"INTREST");
    v5->_interestingSubjectScore = v23;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"INTRUSIVE");
    v5->_intrusiveObjectPresenceScore = v24;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"CTILT");
    v5->_pleasantCameraTiltScore = v25;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"WTS");
    v5->_wellTimedShotScore = v26;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"HCOL");
    v5->_harmoniousColorScore = v27;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"LOWKEY");
    v5->_lowKeyLightingScore = v28;
  }
  v29 = v5;
LABEL_6:

  return v29;
}

- (id)_initWithOriginatingRequestSpecifier:(id)a3 overallAestheticScore:(float)a4 wellFramedSubjectScore:(float)a5 wellChosenBackgroundScore:(float)a6 tastefullyBlurredScore:(float)a7 sharplyFocusedSubjectScore:(float)a8 wellTimedShotScore:(float)a9 pleasantLightingScore:(float)a10 pleasantReflectionsScore:(float)a11 harmoniousColorScore:(float)a12 livelyColorScore:(float)a13 pleasantSymmetryScore:(float)a14 pleasantPatternScore:(float)a15 immersivenessScore:(float)a16 pleasantPerspectiveScore:(float)a17 pleasantPostProcessingScore:(float)a18 noiseScore:(float)a19 failureScore:(float)a20 pleasantCompositionScore:(float)a21 interestingSubjectScore:(float)a22 intrusiveObjectPresenceScore:(float)a23 pleasantCameraTiltScore:(float)a24 lowKeyLightingScore:(float)a25
{
  v34.receiver = self;
  v34.super_class = (Class)VNImageAestheticsObservation;
  id result = [(VNObservation *)&v34 initWithOriginatingRequestSpecifier:a3];
  if (result)
  {
    *((float *)result + 24) = a4;
    *((float *)result + 25) = a5;
    *((float *)result + 26) = a6;
    *((float *)result + 27) = a7;
    *((float *)result + 28) = a8;
    *((float *)result + 29) = a9;
    *((float *)result + 30) = a10;
    *((float *)result + 31) = a11;
    *((float *)result + 32) = a12;
    *((float *)result + 33) = a13;
    *((float *)result + 34) = a14;
    *((float *)result + 35) = a15;
    *((float *)result + 36) = a16;
    *((float *)result + 37) = a17;
    *((float *)result + 38) = a18;
    *((float *)result + 39) = a19;
    *((float *)result + 40) = a20;
    *((float *)result + 41) = a21;
    *((float *)result + 42) = a22;
    *((float *)result + 43) = a23;
    *((float *)result + 44) = a24;
    *((float *)result + 45) = a25;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNClassifyImageAestheticsRequest";
}

+ (id)observationForOriginatingRequestSpecifier:(id)a3 overallAestheticScore:(float)a4 wellFramedSubjectScore:(float)a5 wellChosenBackgroundScore:(float)a6 tastefullyBlurredScore:(float)a7 sharplyFocusedSubjectScore:(float)a8 wellTimedShotScore:(float)a9 pleasantLightingScore:(float)a10 pleasantReflectionsScore:(float)a11 harmoniousColorScore:(float)a12 livelyColorScore:(float)a13 pleasantSymmetryScore:(float)a14 pleasantPatternScore:(float)a15 immersivenessScore:(float)a16 pleasantPerspectiveScore:(float)a17 pleasantPostProcessingScore:(float)a18 noiseScore:(float)a19 failureScore:(float)a20 pleasantCompositionScore:(float)a21 interestingSubjectScore:(float)a22 intrusiveObjectPresenceScore:(float)a23 pleasantCameraTiltScore:(float)a24 lowKeyLightingScore:(float)a25 error:(id *)a26
{
  id v32 = a3;
  *(float *)&double v33 = a4;
  if (!+[VNValidationUtilities validateScoreRange:@"overall aesthetics" named:a26 error:v33])goto LABEL_24; {
  *(float *)&double v34 = a5;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"well-framed subject" named:a26 error:v34])goto LABEL_24; {
  *(float *)&double v35 = a6;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"well-chosen background" named:a26 error:v35])goto LABEL_24; {
  *(float *)&double v36 = a7;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"tastefully blurred" named:a26 error:v36])goto LABEL_24; {
  *(float *)&double v37 = a8;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"sharply focused" named:a26 error:v37])goto LABEL_24; {
  *(float *)&double v38 = a9;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"well-timed shot" named:a26 error:v38])goto LABEL_24; {
  *(float *)&double v39 = a10;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"pleasant lighting" named:a26 error:v39])goto LABEL_24; {
  *(float *)&double v40 = a11;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"pleasant reflections" named:a26 error:v40])goto LABEL_24; {
  *(float *)&double v41 = a12;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"harmonious color" named:a26 error:v41])goto LABEL_24; {
  *(float *)&double v42 = a13;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"lively color" named:a26 error:v42])goto LABEL_24; {
  *(float *)&double v43 = a14;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"pleasant symmetry" named:a26 error:v43])goto LABEL_24; {
  *(float *)&double v44 = a15;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"pleasant pattern" named:a26 error:v44])goto LABEL_24; {
  *(float *)&double v45 = a16;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"immersiveness" named:a26 error:v45])goto LABEL_24; {
  *(float *)&double v46 = a17;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"pleasant perspective" named:a26 error:v46])goto LABEL_24; {
  *(float *)&double v47 = a18;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"pleasant post-processing" named:a26 error:v47])goto LABEL_24; {
  *(float *)&double v48 = a19;
  }
  if (+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"noise", a26, v48)&& (*(float *)&double v49 = a20, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"failure", a26, v49))&& (*(float *)&v50 = a21, +[VNValidationUtilities validateScoreRange:@"pleasant composition" named:a26 error:v50])
    && (*(float *)&double v51 = a22,
        +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"interesting subject", a26, v51))&& (*(float *)&double v52 = a23, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"intrusive object", a26, v52))&& (*(float *)&v53 = a24, +[VNValidationUtilities validateScoreRange:@"pleasant camera tilt" named:a26 error:v53])
    && (*(float *)&double v54 = a25,
        +[VNValidationUtilities validateScoreRange:@"low key lighting" named:a26 error:v54]))
  {
    id v55 = objc_alloc((Class)a1);
    *(float *)&double v56 = a11;
    *(float *)&double v57 = a4;
    *(float *)&double v58 = a5;
    *(float *)&double v59 = a6;
    *(float *)&double v60 = a7;
    *(float *)&double v62 = a9;
    *(float *)&double v61 = a8;
    *(float *)&double v63 = a10;
    v64 = objc_msgSend(v55, "_initWithOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:", v32, v57, v58, v59, v60, v61, v62, v63, v56, __PAIR64__(LODWORD(a13), LODWORD(a12)), __PAIR64__(LODWORD(a15), LODWORD(a14)), __PAIR64__(LODWORD(a17), LODWORD(a16)),
                    __PAIR64__(LODWORD(a19), LODWORD(a18)),
                    __PAIR64__(LODWORD(a21), LODWORD(a20)),
                    __PAIR64__(LODWORD(a23), LODWORD(a22)),
                    __PAIR64__(LODWORD(a25), LODWORD(a24)));
  }
  else
  {
LABEL_24:
    v64 = 0;
  }

  return v64;
}

+ (id)allScorePropertyNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__VNImageAestheticsObservation_allScorePropertyNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allScorePropertyNames_onceToken != -1) {
    dispatch_once(&allScorePropertyNames_onceToken, block);
  }
  v2 = (void *)allScorePropertyNames_allScorePropertyNames;

  return v2;
}

void __53__VNImageAestheticsObservation_allScorePropertyNames__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A6257080]();
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [*(id *)(a1 + 32) superclass];
  uint64_t v5 = objc_opt_class();
  if (v5) {
    BOOL v6 = v5 == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    float v7 = (objc_class *)v5;
    do
    {
      unsigned int outCount = 0;
      float v8 = class_copyPropertyList(v7, &outCount);
      if (v8)
      {
        float v9 = v8;
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            float v11 = (void *)[[NSString alloc] initWithUTF8String:property_getName(v9[i])];
            if ([v11 hasSuffix:@"Score"]) {
              [v3 addObject:v11];
            }
          }
        }
        free(v9);
      }
      uint64_t v12 = [(objc_class *)v7 superclass];
      if (!v12) {
        break;
      }
      float v7 = (objc_class *)v12;
    }
    while (v12 != v4);
  }
  id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
  float v14 = [v3 allObjects];
  float v15 = (void *)[v13 initWithArray:v14];

  uint64_t v16 = [v15 indexOfObject:@"aestheticScore"];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v15 sortUsingSelector:sel_compare_];
  }
  else
  {
    [v15 removeObjectAtIndex:v16];
    [v15 sortUsingSelector:sel_compare_];
    [v15 insertObject:@"aestheticScore" atIndex:0];
  }
  uint64_t v17 = [v15 copy];
  float v18 = (void *)allScorePropertyNames_allScorePropertyNames;
  allScorePropertyNames_allScorePropertyNames = v17;
}

@end