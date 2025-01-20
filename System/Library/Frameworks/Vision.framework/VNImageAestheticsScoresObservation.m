@interface VNImageAestheticsScoresObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (id)observationForOriginatingRequestSpecifier:(id)a3 isUtility:(BOOL)a4 overallScore:(float)a5 aestheticScore:(float)a6 failureScore:(float)a7 junkNegativeScore:(float)a8 junkTragicFailureScore:(float)a9 poorQualityScore:(float)a10 nonMemorableScore:(float)a11 screenShotScore:(float)a12 receiptOrDocumentScore:(float)a13 textDocumentScore:(float)a14 error:(id *)a15;
- (BOOL)isUtility;
- (VNImageAestheticsScoresObservation)initWithCoder:(id)a3;
- (float)aestheticScore;
- (float)failureScore;
- (float)junkNegativeScore;
- (float)junkTragicFailureScore;
- (float)nonMemorableScore;
- (float)overallScore;
- (float)poorQualityScore;
- (float)receiptOrDocumentScore;
- (float)screenShotScore;
- (float)textDocumentScore;
- (id)_initWithOriginatingRequestSpecifier:(id)a3 isUtility:(BOOL)a4 overallScore:(float)a5 aestheticScore:(float)a6 failureScore:(float)a7 junkNegativeScore:(float)a8 junkTragicFailureScore:(float)a9 poorQualityScore:(float)a10 nonMemorableScore:(float)a11 screenShotScore:(float)a12 receiptOrDocumentScore:(float)a13 textDocumentScore:(float)a14;
- (id)vn_cloneObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNImageAestheticsScoresObservation

- (float)textDocumentScore
{
  return self->_textDocumentScore;
}

- (float)receiptOrDocumentScore
{
  return self->_receiptOrDocumentScore;
}

- (float)screenShotScore
{
  return self->_screenShotScore;
}

- (float)nonMemorableScore
{
  return self->_nonMemorableScore;
}

- (float)poorQualityScore
{
  return self->_poorQualityScore;
}

- (float)junkTragicFailureScore
{
  return self->_junkTragicFailureScore;
}

- (float)junkNegativeScore
{
  return self->_junkNegativeScore;
}

- (float)failureScore
{
  return self->_failureScore;
}

- (float)aestheticScore
{
  return self->_aestheticScore;
}

- (float)overallScore
{
  return self->_overallScore;
}

- (BOOL)isUtility
{
  return self->_isUtility;
}

- (id)vn_cloneObject
{
  v5.receiver = self;
  v5.super_class = (Class)VNImageAestheticsScoresObservation;
  uint64_t v3 = [(VNObservation *)&v5 vn_cloneObject];
  if (v3)
  {
    *(unsigned char *)(v3 + 96) = self->_isUtility;
    *(float *)(v3 + 100) = self->_overallScore;
    *(float *)(v3 + 104) = self->_aestheticScore;
    *(float *)(v3 + 108) = self->_failureScore;
    *(float *)(v3 + 112) = self->_junkNegativeScore;
    *(float *)(v3 + 116) = self->_junkTragicFailureScore;
    *(float *)(v3 + 120) = self->_poorQualityScore;
    *(float *)(v3 + 124) = self->_nonMemorableScore;
    *(float *)(v3 + 128) = self->_screenShotScore;
    *(float *)(v3 + 132) = self->_receiptOrDocumentScore;
    *(float *)(v3 + 136) = self->_textDocumentScore;
  }

  return (id)v3;
}

- (id)_initWithOriginatingRequestSpecifier:(id)a3 isUtility:(BOOL)a4 overallScore:(float)a5 aestheticScore:(float)a6 failureScore:(float)a7 junkNegativeScore:(float)a8 junkTragicFailureScore:(float)a9 poorQualityScore:(float)a10 nonMemorableScore:(float)a11 screenShotScore:(float)a12 receiptOrDocumentScore:(float)a13 textDocumentScore:(float)a14
{
  v24.receiver = self;
  v24.super_class = (Class)VNImageAestheticsScoresObservation;
  id result = [(VNObservation *)&v24 initWithOriginatingRequestSpecifier:a3];
  if (result)
  {
    *((unsigned char *)result + 96) = a4;
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
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VNImageAestheticsScoresObservation;
  id v4 = a3;
  [(VNObservation *)&v16 encodeWithCoder:v4];
  double v5 = 0.0;
  if (self->_isUtility) {
    *(float *)&double v5 = 1.0;
  }
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"isUtility", v5, v16.receiver, v16.super_class);
  *(float *)&double v6 = self->_overallScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"OverallScore", v6);
  *(float *)&double v7 = self->_aestheticScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"AestheticsScore", v7);
  *(float *)&double v8 = self->_failureScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"FailureScore", v8);
  *(float *)&double v9 = self->_junkNegativeScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"JunkNegative", v9);
  *(float *)&double v10 = self->_junkTragicFailureScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"JunkTragicFailure", v10);
  *(float *)&double v11 = self->_poorQualityScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"PoorQuality", v11);
  *(float *)&double v12 = self->_nonMemorableScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"NonMemorable", v12);
  *(float *)&double v13 = self->_screenShotScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"ScreenShot", v13);
  *(float *)&double v14 = self->_receiptOrDocumentScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"ReceiptOrDocument", v14);
  *(float *)&double v15 = self->_textDocumentScore;
  objc_msgSend(v4, "vn_encodeValidatedScore:forKey:", @"TextDocument", v15);
}

- (VNImageAestheticsScoresObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VNImageAestheticsScoresObservation;
  double v5 = [(VNObservation *)&v18 initWithCoder:v4];
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"isUtility");
    v5->_isUtility = v6 != 0.0;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"OverallScore");
    v5->_overallScore = v7;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"AestheticsScore");
    v5->_aestheticScore = v8;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"FailureScore");
    v5->_failureScore = v9;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"JunkNegative");
    v5->_junkNegativeScore = v10;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"JunkTragicFailure");
    v5->_junkTragicFailureScore = v11;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"PoorQuality");
    v5->_poorQualityScore = v12;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"NonMemorable");
    v5->_nonMemorableScore = v13;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"ScreenShot");
    v5->_screenShotScore = v14;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"ReceiptOrDocument");
    v5->_receiptOrDocumentScore = v15;
    objc_msgSend(v4, "vn_decodeValidatedScoreForKey:", @"TextDocument");
    v5->_textDocumentScore = v16;
  }

  return v5;
}

+ (id)observationForOriginatingRequestSpecifier:(id)a3 isUtility:(BOOL)a4 overallScore:(float)a5 aestheticScore:(float)a6 failureScore:(float)a7 junkNegativeScore:(float)a8 junkTragicFailureScore:(float)a9 poorQualityScore:(float)a10 nonMemorableScore:(float)a11 screenShotScore:(float)a12 receiptOrDocumentScore:(float)a13 textDocumentScore:(float)a14 error:(id *)a15
{
  BOOL v22 = a4;
  id v24 = a3;
  *(float *)&double v25 = (float)v22;
  if (!+[VNValidationUtilities validateScoreRange:@"is utility" named:a15 error:v25])goto LABEL_13; {
  *(float *)&double v26 = a5;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"overall score" named:a15 error:v26])goto LABEL_13; {
  *(float *)&double v27 = a6;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"aesthetic score" named:a15 error:v27])goto LABEL_13; {
  *(float *)&double v28 = a7;
  }
  if (!+[VNValidationUtilities validateScoreRange:@"failure" named:a15 error:v28])goto LABEL_13; {
  *(float *)&double v29 = a8;
  }
  if (+[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"junk negative", a15, v29)&& (*(float *)&double v30 = a9, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"junk tragic failure", a15, v30))&& (*(float *)&v31 = a10, +[VNValidationUtilities validateScoreRange:@"poor quality" named:a15 error:v31])
    && (*(float *)&double v32 = a11,
        +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"non memorable", a15, v32))&& (*(float *)&double v33 = a12, +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", @"screen shot", a15, v33))&& (*(float *)&v34 = a13, +[VNValidationUtilities validateScoreRange:@"receipt or document" named:a15 error:v34])
    && (*(float *)&double v35 = a14,
        +[VNValidationUtilities validateScoreRange:@"text document" named:a15 error:v35]))
  {
    id v36 = objc_alloc((Class)a1);
    *(float *)&double v37 = a5;
    *(float *)&double v38 = a6;
    *(float *)&double v39 = a7;
    *(float *)&double v40 = a8;
    *(float *)&double v41 = a9;
    *(float *)&double v42 = a10;
    *(float *)&double v44 = a12;
    *(float *)&double v43 = a11;
    v45 = (void *)[v36 _initWithOriginatingRequestSpecifier:v24 isUtility:v22 overallScore:v37 aestheticScore:v38 failureScore:v39 junkNegativeScore:v40 junkTragicFailureScore:v41 poorQualityScore:v42 nonMemorableScore:v43 screenShotScore:v44 receiptOrDocumentScore:__PAIR64__(LODWORD(a14) textDocumentScore:LODWORD(a13))];
  }
  else
  {
LABEL_13:
    v45 = 0;
  }

  return v45;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNCalculateImageAestheticsScoresRequest";
}

@end