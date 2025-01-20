@interface AXMVisionFeature
+ (AXMVisionFeature)featureWithAssetMetadata:(id)a3;
+ (AXMVisionFeature)featureWithCameraType:(int64_t)a3;
+ (AXMVisionFeature)featureWithCaptionResult:(id)a3 confidence:(double)a4 translatedCaption:(id)a5 modelIdentifier:(id)a6 canvasSize:(CGSize)a7 isLowConfidence:(BOOL)a8;
+ (AXMVisionFeature)featureWithColorInfo:(id)a3 canvasSize:(CGSize)a4;
+ (AXMVisionFeature)featureWithDeviceMotion:(id)a3 orientation:(int64_t)a4;
+ (AXMVisionFeature)featureWithFaceDetectionResult:(id)a3 canvasSize:(CGSize)a4;
+ (AXMVisionFeature)featureWithIconClass:(id)a3 confidence:(double)a4;
+ (AXMVisionFeature)featureWithImageAestheticsObservation:(id)a3;
+ (AXMVisionFeature)featureWithMediaAnalysisFaceDetectionResult:(id)a3 canvasSize:(CGSize)a4;
+ (AXMVisionFeature)featureWithMediaAnalysisImageCaptionResult:(id)a3 confidence:(double)a4 translatedCaption:(id)a5;
+ (AXMVisionFeature)featureWithMediaAnalysisTaxonomyNode:(id)a3 canvasSize:(CGSize)a4;
+ (AXMVisionFeature)featureWithMediaLegibility:(id)a3;
+ (AXMVisionFeature)featureWithMetadata:(id)a3 interfaceOrientation:(int64_t)a4 isMirrored:(BOOL)a5 canvasSize:(CGSize)a6;
+ (AXMVisionFeature)featureWithTaxonomyNode:(id)a3 canvasSize:(CGSize)a4;
+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 axElementRect:(CGRect)a4 confidence:(double)a5 uiClass:(int64_t)a6 label:(id)a7 canvasSize:(CGSize)a8;
+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 blurValue:(float)a4 canvasSize:(CGSize)a5;
+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 brightnessValue:(float)a4 canvasSize:(CGSize)a5;
+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 horizonResult:(id)a4 canvasSize:(CGSize)a5;
+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 modelClassificationResult:(id)a4 modelIdentifier:(id)a5 canvasSize:(CGSize)a6;
+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 rectangleResult:(id)a4 canvasSize:(CGSize)a5;
+ (BOOL)supportsSecureCoding;
+ (CGRect)_aspectFaceRectFromSquareFaceRect:(CGRect)a3 sizeInPixels:(CGSize)a4;
+ (id)envelopeRegion:(id)a3 boundingBox:(CGRect)a4 confidence:(double)a5 canvasSize:(CGSize)a6;
+ (id)envelopeWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7;
+ (id)filterFeatureList:(id)a3 basedOnSceneClassIdsForFeature:(id)a4;
+ (id)flattenedFeatureList:(id)a3;
+ (id)groupedFeatureWithElementRect:(CGRect)a3 uiClass:(int64_t)a4 confidence:(double)a5 label:(id)a6 canvasSize:(CGSize)a7 subElements:(id)a8;
+ (id)localizedStringForLocation:(int64_t)a3 isSubjectImplicit:(BOOL)a4;
+ (id)mediaAnalysisNSFWClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5;
+ (id)mediaAnalysisObjectClassificationWithLabel:(id)a3 localizedValue:(id)a4 boundingBox:(CGRect)a5 confidence:(float)a6 canvasSize:(CGSize)a7 sceneClassId:(id)a8;
+ (id)mediaAnalysisProminentObjectWithBoundingBox:(CGRect)a3 canvasSize:(CGSize)a4 confidence:(double)a5;
+ (id)mediaAnalysisSceneClassificationWithLabel:(id)a3 localizedValue:(id)a4 confidence:(float)a5 canvasSize:(CGSize)a6;
+ (id)mediaAnalysisSignificantEventClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5;
+ (id)nameForFeatureType:(unint64_t)a3;
+ (id)nameForLocation:(int64_t)a3;
+ (id)nameForOCRType:(int64_t)a3;
+ (id)nameForUIClass:(int64_t)a3;
+ (id)nsfwClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5;
+ (id)nutritionLabelWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 rows:(id)a6 canvasSize:(CGSize)a7;
+ (id)objectClassificationWithLabel:(id)a3 localizedValue:(id)a4 boundingBox:(CGRect)a5 confidence:(float)a6 canvasSize:(CGSize)a7 sceneClassId:(id)a8;
+ (id)personWithBoundingBox:(CGRect)a3 confidence:(double)a4 canvasSize:(CGSize)a5;
+ (id)prominentObjectWithBoundingBox:(CGRect)a3 canvasSize:(CGSize)a4 confidence:(double)a5;
+ (id)receiptWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7;
+ (id)sceneClassificationWithLabel:(id)a3 localizedValue:(id)a4 confidence:(float)a5 canvasSize:(CGSize)a6;
+ (id)significantEventClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5;
+ (id)tableCellWithText:(id)a3 boundingBox:(CGRect)a4 confidence:(double)a5 recognizedTextFeatures:(id)a6 canvasSize:(CGSize)a7 isHeader:(BOOL)a8;
+ (id)tableColumnWithText:(id)a3 boundingBox:(CGRect)a4 cells:(id)a5 canvasSize:(CGSize)a6;
+ (id)tableRowWithText:(id)a3 boundingBox:(CGRect)a4 cells:(id)a5 canvasSize:(CGSize)a6;
+ (id)tableWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 rows:(id)a6 columns:(id)a7 canvasSize:(CGSize)a8 isIncomplete:(BOOL)a9;
+ (id)textDocumentWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7;
+ (id)textLineWithText:(id)a3 boundingBox:(CGRect)a4 recognizedTextFeatures:(id)a5 canvasSize:(CGSize)a6;
+ (id)textRegionWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 lines:(id)a6 canvasSize:(CGSize)a7;
+ (id)textSequence:(id)a3 boundingBox:(CGRect)a4 recognizedTextFeatures:(id)a5 confidence:(double)a6 canvasSize:(CGSize)a7;
+ (id)unitTestingFaceFeature;
+ (id)unitTestingFaceFeatureWithSize:(CGSize)a3 faceFrame:(CGRect)a4;
+ (id)unitTestingFeature;
+ (id)unitTestingFeatureWithType:(unint64_t)a3 canvasSize:(CGSize)a4 frame:(CGRect)a5 value:(id)a6 barcodeType:(id)a7 ocrFeatureType:(int64_t)a8 subFeatures:(id)a9;
+ (id)unitTestingFeatureWithType:(unint64_t)a3 canvasSize:(CGSize)a4 frame:(CGRect)a5 value:(id)a6 valueIsSpeakable:(BOOL)a7 barcodeType:(id)a8 ocrFeatureType:(int64_t)a9 subFeatures:(id)a10;
+ (id)unitTestingHorizonFeature;
+ (id)unitTestingProminentObjectFeature;
+ (id)unitTestingTeatureWithType:(unint64_t)a3 axElementRect:(CGRect)a4 confidence:(double)a5 uiClass:(int64_t)a6 label:(id)a7 canvasSize:(CGSize)a8;
+ (int64_t)locationForNormalizedFrame:(CGRect)a3 previousLocation:(int64_t)a4 usingThirds:(BOOL)a5;
+ (int64_t)uiClassForName:(id)a3;
+ (void)_append:(id)a3 toList:(id)a4;
- (AXMTranslatedText)mediaAnalysisTranslatedImageCaption;
- (AXMTranslatedText)translatedCaption;
- (AXMVisionFeature)initWithCoder:(id)a3;
- (AXMVisionFeatureAestheticsResult)aestheticsResult;
- (AXMVisionFeatureAssetMetadata)assetMetadata;
- (AXMVisionFeatureColorInfo)colorInfo;
- (AXMVisionFeatureFaceDetectionResult)faceDetectionResult;
- (AXMVisionFeatureFaceDetectionResult)mediaAnalysisFaceDetectionResult;
- (BOOL)captionMayContainSensitiveContent;
- (BOOL)isAssetMetadata;
- (BOOL)isBarcode;
- (BOOL)isBlur;
- (BOOL)isBrightness;
- (BOOL)isCameraMetadata;
- (BOOL)isCaption;
- (BOOL)isColor;
- (BOOL)isEnvelope;
- (BOOL)isEnvelopeRegion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAXMVisionFeature:(id)a3;
- (BOOL)isFace;
- (BOOL)isHorizon;
- (BOOL)isIconClass;
- (BOOL)isImageAesthetics;
- (BOOL)isLowConfidence;
- (BOOL)isMediaAnalysisFace;
- (BOOL)isMediaAnalysisImageCaption;
- (BOOL)isMediaAnalysisNSFWClassification;
- (BOOL)isMediaAnalysisObjectClassification;
- (BOOL)isMediaAnalysisProminentObject;
- (BOOL)isMediaAnalysisSceneClassification;
- (BOOL)isMediaAnalysisSignificantEventClassification;
- (BOOL)isMediaAnalysisSignificantEventlassification;
- (BOOL)isMediaLegibility;
- (BOOL)isModelClassification;
- (BOOL)isMotion;
- (BOOL)isNSFWClassification;
- (BOOL)isNutritionLabel;
- (BOOL)isOCR;
- (BOOL)isObjectClassification;
- (BOOL)isPerson;
- (BOOL)isProminentObject;
- (BOOL)isRealtimeFace;
- (BOOL)isReceipt;
- (BOOL)isRectangle;
- (BOOL)isSceneClassification;
- (BOOL)isSignificantEventClassification;
- (BOOL)isTable;
- (BOOL)isTableCell;
- (BOOL)isTableColumn;
- (BOOL)isTableRow;
- (BOOL)isTextCharacter;
- (BOOL)isTextDiacritic;
- (BOOL)isTextDocument;
- (BOOL)isTextLine;
- (BOOL)isTextRegion;
- (BOOL)isTextSequence;
- (BOOL)isValueSpeakable;
- (CGAffineTransform)horizonTransform;
- (CGPoint)activationPoint;
- (CGRect)boundingBoxForRange:(_NSRange)a3;
- (CGRect)frame;
- (CGRect)normalizedFrame;
- (CGRect)unpaddedDetectedFaceRect;
- (CGSize)canvasSize;
- (CMDeviceMotion)deviceMotion;
- (NSArray)recognizedTextFeatures;
- (NSArray)subfeatures;
- (NSArray)values;
- (NSDictionary)debugRectangles;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)featureGates;
- (NSSecureCoding)userContext;
- (NSSet)detectorSceneClassIds;
- (NSString)barcodeType;
- (NSString)caption;
- (NSString)classificationLabel;
- (NSString)classificationLocalizedValue;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)mediaAnalysisImageCaption;
- (NSString)overrideLabel;
- (NSString)sceneClassId;
- (NSString)value;
- (__n128)facePose;
- (double)blur;
- (double)brightness;
- (double)confidence;
- (double)creationDate;
- (double)mediaAnalysisImageCaptionConfidence;
- (float)horizonAngle;
- (id)_init;
- (id)_nameForOCRFeatureType:(int64_t)a3;
- (id)effectiveTextDetectionLocales;
- (int64_t)cameraType;
- (int64_t)deviceOrientation;
- (int64_t)locationUsingThirds:(BOOL)a3 withFlippedYAxis:(BOOL)a4;
- (int64_t)ocrFeatureType;
- (int64_t)uiClass;
- (unint64_t)faceId;
- (unint64_t)featureType;
- (unint64_t)hash;
- (unint64_t)mediaAnalysisFaceId;
- (void)_serializeWithCoder:(id)a3 orDictionary:(id)a4;
- (void)addFeatureGate:(id)a3 userInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationPoint:(CGPoint)a3;
- (void)setCaptionMayContainSensitiveContent:(BOOL)a3;
- (void)setDebugRectangles:(id)a3;
- (void)setOverrideLabel:(id)a3;
- (void)setUiClass:(int64_t)a3;
- (void)setUserContext:(id)a3;
@end

@implementation AXMVisionFeature

+ (AXMVisionFeature)featureWithMetadata:(id)a3 interfaceOrientation:(int64_t)a4 isMirrored:(BOOL)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  BOOL v8 = a5;
  id v10 = a3;
  [v10 bounds];
  double v15 = AXMTransformedNormalizedFrame(a4, v8, v11, v12, v13, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v10;
    +[AXMVisionFeature _aspectFaceRectFromSquareFaceRect:sizeInPixels:](AXMVisionFeature, "_aspectFaceRectFromSquareFaceRect:sizeInPixels:", v15, v17, v19, v21, width, height);
    double v45 = v24;
    double v46 = v23;
    double v43 = v26;
    double v44 = v25;
    uint64_t v27 = [v22 faceID];
    v28 = [[AXMVisionFeatureFaceAttributes alloc] initWithAVMetadataFaceObject:v22];
    if (v28)
    {
      v29 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
      [(AXMVisionFeatureFaceDetectionResult *)v29 setAttributes:v28];
    }
    else
    {
      v29 = 0;
    }

    v33 = 0;
    v32 = 0;
    uint64_t v34 = 6;
    uint64_t v47 = *(void *)&v19;
    uint64_t v48 = *(void *)&v21;
    double v30 = v17;
    double v31 = v15;
    double v21 = v43;
    double v19 = v44;
    double v17 = v45;
    double v15 = v46;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v30 = *((double *)&AXMRectNotApplicable + 1);
    double v31 = *(double *)&AXMRectNotApplicable;
    uint64_t v47 = qword_1E9D62AF0;
    uint64_t v48 = qword_1E9D62AF8;
    v32 = [v10 stringValue];
    v33 = [v10 type];
    v29 = 0;
    uint64_t v27 = 0;
    uint64_t v34 = 11;
LABEL_11:
    v35 = [[AXMVisionFeature alloc] _init];
    v35[1] = v34;
    v36 = (void *)v35[15];
    v35[15] = v32;
    v37 = v32;

    *((double *)v35 + 42) = width;
    *((double *)v35 + 43) = height;
    *((double *)v35 + 7) = width * v15;
    *((double *)v35 + 8) = height * v17;
    *((double *)v35 + 9) = width * v19;
    *((double *)v35 + 10) = height * v21;
    *((double *)v35 + 11) = v15;
    *((double *)v35 + 12) = v17;
    *((double *)v35 + 13) = v19;
    *((double *)v35 + 14) = v21;
    *((double *)v35 + 68) = v31;
    *((double *)v35 + 69) = v30;
    v35[70] = v47;
    v35[71] = v48;
    v38 = (void *)v35[3];
    v35[3] = v33;
    id v39 = v33;

    v40 = (void *)v35[32];
    v35[32] = v29;
    v35[33] = v27;
    v41 = v29;

    goto LABEL_12;
  }
  NSClassFromString(&cfstr_Avmetadatavide.isa);
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v35 = 0;
    goto LABEL_13;
  }
  v37 = AXMediaLogCommon();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    +[AXMVisionFeature featureWithMetadata:interfaceOrientation:isMirrored:canvasSize:]();
  }
  v35 = 0;
LABEL_12:

LABEL_13:

  return (AXMVisionFeature *)v35;
}

+ (AXMVisionFeature)featureWithFaceDetectionResult:(id)a3 canvasSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 frame];
  uint64_t v26 = v8;
  uint64_t v27 = v7;
  double v10 = v9;
  double v12 = 1.0 - v11 - v9;
  +[AXMVisionFeature _aspectFaceRectFromSquareFaceRect:sizeInPixels:](AXMVisionFeature, "_aspectFaceRectFromSquareFaceRect:sizeInPixels:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [[AXMVisionFeature alloc] _init];
  v21[1] = 5;
  *((double *)v21 + 42) = width;
  *((double *)v21 + 43) = height;
  *((double *)v21 + 7) = width * v14;
  *((double *)v21 + 8) = height * v16;
  *((double *)v21 + 9) = width * v18;
  *((double *)v21 + 10) = height * v20;
  *((double *)v21 + 11) = v14;
  *((double *)v21 + 12) = v16;
  *((double *)v21 + 13) = v18;
  *((double *)v21 + 14) = v20;
  v21[68] = v27;
  *((double *)v21 + 69) = v12;
  v21[70] = v26;
  *((double *)v21 + 71) = v10;
  id v22 = (void *)v21[32];
  v21[32] = v6;
  id v23 = v6;

  uint64_t v24 = [v23 faceId];
  v21[33] = v24;

  return (AXMVisionFeature *)v21;
}

+ (id)prominentObjectWithBoundingBox:(CGRect)a3 canvasSize:(CGSize)a4 confidence:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [[AXMVisionFeature alloc] _init];
  v12[1] = 19;
  *((double *)v12 + 42) = width;
  *((double *)v12 + 43) = height;
  *((double *)v12 + 11) = x;
  *((double *)v12 + 12) = y;
  *((double *)v12 + 13) = v9;
  *((double *)v12 + 14) = v8;
  *((double *)v12 + 7) = x * width;
  *((double *)v12 + 8) = y * height;
  *((double *)v12 + 9) = v9 * width;
  *((double *)v12 + 10) = v8 * height;
  *((double *)v12 + 23) = a5;

  return v12;
}

+ (id)personWithBoundingBox:(CGRect)a3 confidence:(double)a4 canvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [[AXMVisionFeature alloc] _init];
  v12[1] = 7;
  *((double *)v12 + 23) = a4;
  *((double *)v12 + 42) = width;
  *((double *)v12 + 43) = height;
  *((double *)v12 + 7) = x * width;
  *((double *)v12 + 8) = y * height;
  *((double *)v12 + 9) = v9 * width;
  *((double *)v12 + 10) = v8 * height;
  *((double *)v12 + 11) = x;
  *((double *)v12 + 12) = y;
  *((double *)v12 + 13) = v9;
  *((double *)v12 + 14) = v8;

  return v12;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 blurValue:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  float v7 = fminf(fmaxf(a4, 0.0), 1.0);
  double v8 = [[AXMVisionFeature alloc] _init];
  *((void *)v8 + 1) = 2;
  *((void *)v8 + 23) = 0x3FF0000000000000;
  *((CGFloat *)v8 + 42) = width;
  *((CGFloat *)v8 + 43) = height;
  long long v9 = AXMRectNotApplicable;
  long long v10 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v8 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v8 + 72) = v10;
  *(_OWORD *)(v8 + 88) = v9;
  *(_OWORD *)(v8 + 104) = v10;
  *((double *)v8 + 21) = v7;

  return (AXMVisionFeature *)v8;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 brightnessValue:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v8 = [[AXMVisionFeature alloc] _init];
  *((void *)v8 + 1) = 1;
  *((void *)v8 + 23) = 0x3FF0000000000000;
  *((CGFloat *)v8 + 42) = width;
  *((CGFloat *)v8 + 43) = height;
  long long v9 = AXMRectNotApplicable;
  long long v10 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v8 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v8 + 72) = v10;
  *(_OWORD *)(v8 + 88) = v9;
  *(_OWORD *)(v8 + 104) = v10;
  *((double *)v8 + 22) = a4;

  return (AXMVisionFeature *)v8;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 horizonResult:(id)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v7 = a4;
  double v8 = [[AXMVisionFeature alloc] _init];
  *((void *)v8 + 1) = 3;
  [v7 confidence];
  *((double *)v8 + 23) = v9;
  *((CGFloat *)v8 + 42) = width;
  *((CGFloat *)v8 + 43) = height;
  long long v10 = AXMRectNotApplicable;
  long long v11 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v8 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v8 + 72) = v11;
  *(_OWORD *)(v8 + 88) = v10;
  *(_OWORD *)(v8 + 104) = v11;
  if (v7)
  {
    [v7 transform];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  *(_OWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 216) = v15;
  *(_OWORD *)(v8 + 232) = v16;
  objc_msgSend(v7, "angle", v14, v15, v16);
  *(float *)&double v12 = v12;
  *((_DWORD *)v8 + 62) = LODWORD(v12);

  return (AXMVisionFeature *)v8;
}

+ (id)objectClassificationWithLabel:(id)a3 localizedValue:(id)a4 boundingBox:(CGRect)a5 confidence:(float)a6 canvasSize:(CGSize)a7 sceneClassId:(id)a8
{
  double height = a7.height;
  double width = a7.width;
  double v12 = a5.size.height;
  double v13 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  double v20 = [[AXMVisionFeature alloc] _init];
  v20[1] = 10;
  double v21 = (void *)v20[45];
  v20[45] = v17;
  id v22 = v17;

  id v23 = (void *)v20[46];
  v20[46] = v18;
  id v24 = v18;

  *((double *)v20 + 23) = a6;
  *((double *)v20 + 42) = width;
  *((double *)v20 + 43) = height;
  *((double *)v20 + 11) = x;
  *((double *)v20 + 12) = y;
  *((double *)v20 + 13) = v13;
  *((double *)v20 + 14) = v12;
  *((double *)v20 + 7) = x * width;
  *((double *)v20 + 8) = y * height;
  *((double *)v20 + 9) = v13 * width;
  *((double *)v20 + 10) = v12 * height;
  double v25 = (void *)v20[51];
  v20[51] = v19;

  return v20;
}

+ (id)sceneClassificationWithLabel:(id)a3 localizedValue:(id)a4 confidence:(float)a5 canvasSize:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v10 = a3;
  id v11 = a4;
  double v12 = [[AXMVisionFeature alloc] _init];
  *((void *)v12 + 1) = 9;
  double v13 = (void *)*((void *)v12 + 45);
  *((void *)v12 + 45) = v10;
  id v14 = v10;

  long long v15 = (void *)*((void *)v12 + 46);
  *((void *)v12 + 46) = v11;

  *((double *)v12 + 23) = a5;
  *((CGFloat *)v12 + 42) = width;
  *((CGFloat *)v12 + 43) = height;
  long long v16 = AXMRectNotApplicable;
  long long v17 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v12 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v12 + 104) = v17;
  *(_OWORD *)(v12 + 56) = v16;
  *(_OWORD *)(v12 + 72) = v17;

  return v12;
}

+ (id)nsfwClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a3;
  float v9 = [[AXMVisionFeature alloc] _init];
  *((void *)v9 + 1) = 23;
  id v10 = (void *)*((void *)v9 + 45);
  *((void *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  long long v11 = AXMRectNotApplicable;
  long long v12 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;

  return v9;
}

+ (id)significantEventClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a3;
  float v9 = [[AXMVisionFeature alloc] _init];
  *((void *)v9 + 1) = 24;
  id v10 = (void *)*((void *)v9 + 45);
  *((void *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  long long v11 = AXMRectNotApplicable;
  long long v12 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;

  return v9;
}

+ (AXMVisionFeature)featureWithTaxonomyNode:(id)a3 canvasSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  id v7 = [[AXMVisionFeature alloc] _init];
  *((void *)v7 + 1) = 9;
  uint64_t v8 = [v6 label];
  float v9 = (void *)*((void *)v7 + 45);
  *((void *)v7 + 45) = v8;

  uint64_t v10 = [v6 localizedName];
  long long v11 = (void *)*((void *)v7 + 46);
  *((void *)v7 + 46) = v10;

  [v6 confidence];
  *((void *)v7 + 23) = v12;
  *((CGFloat *)v7 + 42) = width;
  *((CGFloat *)v7 + 43) = height;
  long long v13 = AXMRectNotApplicable;
  long long v14 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v7 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v7 + 72) = v14;
  *(_OWORD *)(v7 + 88) = v13;
  *(_OWORD *)(v7 + 104) = v14;
  uint64_t v15 = [v6 detectorSceneClassIds];
  long long v16 = (void *)*((void *)v7 + 50);
  *((void *)v7 + 50) = v15;

  long long v17 = NSNumber;
  uint64_t v18 = [v6 sceneClassId];

  id v19 = [v17 numberWithUnsignedInt:v18];
  uint64_t v20 = [v19 stringValue];
  double v21 = (void *)*((void *)v7 + 51);
  *((void *)v7 + 51) = v20;

  return (AXMVisionFeature *)v7;
}

+ (AXMVisionFeature)featureWithImageAestheticsObservation:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [[AXMVisionFeature alloc] _init];
    *((void *)v4 + 1) = 21;
    v5 = [[AXMVisionFeatureAestheticsResult alloc] initWithVisionAestheticsObservation:v3];

    id v6 = (void *)*((void *)v4 + 59);
    *((void *)v4 + 59) = v5;

    *((void *)v4 + 23) = AXMConfidenceNotApplicable;
    long long v7 = AXMRectNotApplicable;
    long long v8 = *(_OWORD *)&qword_1E9D62AF0;
    *(_OWORD *)(v4 + 56) = AXMRectNotApplicable;
    *(_OWORD *)(v4 + 72) = v8;
    *(_OWORD *)(v4 + 88) = v7;
    *(_OWORD *)(v4 + 104) = v8;
  }
  else
  {
    v4 = 0;
  }

  return (AXMVisionFeature *)v4;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 modelClassificationResult:(id)a4 modelIdentifier:(id)a5 canvasSize:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v9 = a5;
  id v10 = a4;
  long long v11 = [[AXMVisionFeature alloc] _init];
  *((void *)v11 + 1) = 15;
  uint64_t v12 = [v10 identifier];
  long long v13 = (void *)*((void *)v11 + 45);
  *((void *)v11 + 45) = v12;

  [v10 confidence];
  float v15 = v14;

  *((double *)v11 + 23) = v15;
  *((CGFloat *)v11 + 42) = width;
  *((CGFloat *)v11 + 43) = height;
  long long v16 = AXMRectNotApplicable;
  long long v17 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v11 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v11 + 72) = v17;
  *(_OWORD *)(v11 + 88) = v16;
  *(_OWORD *)(v11 + 104) = v17;
  uint64_t v18 = (void *)*((void *)v11 + 44);
  *((void *)v11 + 44) = v9;

  return (AXMVisionFeature *)v11;
}

+ (AXMVisionFeature)featureWithCaptionResult:(id)a3 confidence:(double)a4 translatedCaption:(id)a5 modelIdentifier:(id)a6 canvasSize:(CGSize)a7 isLowConfidence:(BOOL)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  long long v17 = [[AXMVisionFeature alloc] _init];
  *((void *)v17 + 1) = 16;
  uint64_t v18 = (void *)*((void *)v17 + 47);
  *((void *)v17 + 47) = v14;
  id v19 = v14;

  uint64_t v20 = (void *)*((void *)v17 + 48);
  *((void *)v17 + 48) = v15;
  id v21 = v15;

  *((double *)v17 + 23) = a4;
  *((CGFloat *)v17 + 42) = width;
  *((CGFloat *)v17 + 43) = height;
  long long v22 = AXMRectNotApplicable;
  long long v23 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v17 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v17 + 72) = v23;
  *(_OWORD *)(v17 + 88) = v22;
  *(_OWORD *)(v17 + 104) = v23;
  id v24 = (void *)*((void *)v17 + 44);
  *((void *)v17 + 44) = v16;

  v17[192] = a8;

  return (AXMVisionFeature *)v17;
}

+ (AXMVisionFeature)featureWithMediaAnalysisImageCaptionResult:(id)a3 confidence:(double)a4 translatedCaption:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [[AXMVisionFeature alloc] _init];
  *((void *)v9 + 1) = 25;
  id v10 = (void *)*((void *)v9 + 52);
  *((void *)v9 + 52) = v7;
  id v11 = v7;

  *((double *)v9 + 53) = a4;
  uint64_t v12 = (void *)*((void *)v9 + 54);
  *((void *)v9 + 54) = v8;

  long long v13 = AXMRectNotApplicable;
  long long v14 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v9 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 72) = v14;
  *(_OWORD *)(v9 + 88) = v13;
  *(_OWORD *)(v9 + 104) = v14;
  *((_OWORD *)v9 + 21) = *MEMORY[0x1E4F1DB30];

  return (AXMVisionFeature *)v9;
}

+ (AXMVisionFeature)featureWithMediaAnalysisTaxonomyNode:(id)a3 canvasSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  id v7 = [[AXMVisionFeature alloc] _init];
  *((void *)v7 + 1) = 26;
  uint64_t v8 = [v6 label];
  id v9 = (void *)*((void *)v7 + 45);
  *((void *)v7 + 45) = v8;

  uint64_t v10 = [v6 localizedName];
  id v11 = (void *)*((void *)v7 + 46);
  *((void *)v7 + 46) = v10;

  [v6 confidence];
  *((void *)v7 + 23) = v12;
  *((CGFloat *)v7 + 42) = width;
  *((CGFloat *)v7 + 43) = height;
  long long v13 = AXMRectNotApplicable;
  long long v14 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v7 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v7 + 72) = v14;
  *(_OWORD *)(v7 + 88) = v13;
  *(_OWORD *)(v7 + 104) = v14;
  uint64_t v15 = [v6 detectorSceneClassIds];
  id v16 = (void *)*((void *)v7 + 50);
  *((void *)v7 + 50) = v15;

  long long v17 = NSNumber;
  uint64_t v18 = [v6 sceneClassId];

  id v19 = [v17 numberWithUnsignedInt:v18];
  uint64_t v20 = [v19 stringValue];
  id v21 = (void *)*((void *)v7 + 51);
  *((void *)v7 + 51) = v20;

  return (AXMVisionFeature *)v7;
}

+ (id)mediaAnalysisSceneClassificationWithLabel:(id)a3 localizedValue:(id)a4 confidence:(float)a5 canvasSize:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [[AXMVisionFeature alloc] _init];
  *((void *)v12 + 1) = 26;
  long long v13 = (void *)*((void *)v12 + 45);
  *((void *)v12 + 45) = v10;
  id v14 = v10;

  uint64_t v15 = (void *)*((void *)v12 + 46);
  *((void *)v12 + 46) = v11;

  *((double *)v12 + 23) = a5;
  *((CGFloat *)v12 + 42) = width;
  *((CGFloat *)v12 + 43) = height;
  long long v16 = AXMRectNotApplicable;
  long long v17 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v12 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v12 + 104) = v17;
  *(_OWORD *)(v12 + 56) = v16;
  *(_OWORD *)(v12 + 72) = v17;

  return v12;
}

+ (id)mediaAnalysisNSFWClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a3;
  id v9 = [[AXMVisionFeature alloc] _init];
  *((void *)v9 + 1) = 29;
  id v10 = (void *)*((void *)v9 + 45);
  *((void *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  long long v11 = AXMRectNotApplicable;
  long long v12 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;

  return v9;
}

+ (id)mediaAnalysisSignificantEventClassificationWithCategory:(id)a3 confidence:(float)a4 canvasSize:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a3;
  id v9 = [[AXMVisionFeature alloc] _init];
  *((void *)v9 + 1) = 30;
  id v10 = (void *)*((void *)v9 + 45);
  *((void *)v9 + 45) = v8;

  *((double *)v9 + 23) = a4;
  *((CGFloat *)v9 + 42) = width;
  *((CGFloat *)v9 + 43) = height;
  long long v11 = AXMRectNotApplicable;
  long long v12 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v9 + 88) = AXMRectNotApplicable;
  *(_OWORD *)(v9 + 104) = v12;
  *(_OWORD *)(v9 + 56) = v11;
  *(_OWORD *)(v9 + 72) = v12;

  return v9;
}

+ (id)mediaAnalysisObjectClassificationWithLabel:(id)a3 localizedValue:(id)a4 boundingBox:(CGRect)a5 confidence:(float)a6 canvasSize:(CGSize)a7 sceneClassId:(id)a8
{
  double height = a7.height;
  double width = a7.width;
  double v12 = a5.size.height;
  double v13 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  uint64_t v20 = [[AXMVisionFeature alloc] _init];
  v20[1] = 27;
  id v21 = (void *)v20[45];
  v20[45] = v17;
  id v22 = v17;

  long long v23 = (void *)v20[46];
  v20[46] = v18;
  id v24 = v18;

  *((double *)v20 + 23) = a6;
  *((double *)v20 + 42) = width;
  *((double *)v20 + 43) = height;
  *((double *)v20 + 11) = x;
  *((double *)v20 + 12) = y;
  *((double *)v20 + 13) = v13;
  *((double *)v20 + 14) = v12;
  *((double *)v20 + 7) = x * width;
  *((double *)v20 + 8) = y * height;
  *((double *)v20 + 9) = v13 * width;
  *((double *)v20 + 10) = v12 * height;
  double v25 = (void *)v20[51];
  v20[51] = v19;

  return v20;
}

+ (id)mediaAnalysisProminentObjectWithBoundingBox:(CGRect)a3 canvasSize:(CGSize)a4 confidence:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [[AXMVisionFeature alloc] _init];
  v12[1] = 28;
  *((double *)v12 + 42) = width;
  *((double *)v12 + 43) = height;
  *((double *)v12 + 11) = x;
  *((double *)v12 + 12) = y;
  *((double *)v12 + 13) = v9;
  *((double *)v12 + 14) = v8;
  *((double *)v12 + 7) = x * width;
  *((double *)v12 + 8) = y * height;
  *((double *)v12 + 9) = v9 * width;
  *((double *)v12 + 10) = v8 * height;
  *((double *)v12 + 23) = a5;

  return v12;
}

+ (AXMVisionFeature)featureWithMediaAnalysisFaceDetectionResult:(id)a3 canvasSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  [v6 frame];
  uint64_t v26 = v8;
  uint64_t v27 = v7;
  double v10 = v9;
  double v12 = 1.0 - v11 - v9;
  +[AXMVisionFeature _aspectFaceRectFromSquareFaceRect:sizeInPixels:](AXMVisionFeature, "_aspectFaceRectFromSquareFaceRect:sizeInPixels:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [[AXMVisionFeature alloc] _init];
  v21[1] = 31;
  *((double *)v21 + 42) = width;
  *((double *)v21 + 43) = height;
  *((double *)v21 + 7) = width * v14;
  *((double *)v21 + 8) = height * v16;
  *((double *)v21 + 9) = width * v18;
  *((double *)v21 + 10) = height * v20;
  *((double *)v21 + 11) = v14;
  *((double *)v21 + 12) = v16;
  *((double *)v21 + 13) = v18;
  *((double *)v21 + 14) = v20;
  v21[68] = v27;
  *((double *)v21 + 69) = v12;
  v21[70] = v26;
  *((double *)v21 + 71) = v10;
  id v22 = (void *)v21[55];
  v21[55] = v6;
  id v23 = v6;

  uint64_t v24 = [v23 faceId];
  v21[56] = v24;

  return (AXMVisionFeature *)v21;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 rectangleResult:(id)a4 canvasSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v7 = a4;
  uint64_t v8 = [[AXMVisionFeature alloc] _init];
  v8[1] = 14;
  [v7 confidence];
  *((double *)v8 + 23) = v9;
  *((double *)v8 + 42) = width;
  *((double *)v8 + 43) = height;
  [v7 boundingBox];
  *((double *)v8 + 7) = width * v12;
  *((double *)v8 + 8) = height * (1.0 - v10 - v11);
  *((double *)v8 + 9) = width * v13;
  *((double *)v8 + 10) = height * v11;
  [v7 boundingBox];
  uint64_t v15 = v14;
  double v17 = v16;
  uint64_t v19 = v18;
  double v21 = v20;

  v8[11] = v15;
  *((double *)v8 + 12) = 1.0 - v17 - v21;
  v8[13] = v19;
  *((double *)v8 + 14) = v21;

  return (AXMVisionFeature *)v8;
}

+ (AXMVisionFeature)featureWithVisionRequest:(id)a3 axElementRect:(CGRect)a4 confidence:(double)a5 uiClass:(int64_t)a6 label:(id)a7 canvasSize:(CGSize)a8
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  CGFloat v12 = a4.size.height;
  CGFloat v13 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a7;
  double v17 = [[AXMVisionFeature alloc] _init];
  v17[1] = 22;
  *((double *)v17 + 23) = a5;
  *((CGFloat *)v17 + 42) = width;
  *((CGFloat *)v17 + 43) = height;
  *((CGFloat *)v17 + 7) = x;
  *((CGFloat *)v17 + 8) = y;
  *((CGFloat *)v17 + 9) = v13;
  *((CGFloat *)v17 + 10) = v12;
  uint64_t v18 = (void *)v17[15];
  v17[15] = v16;

  v17[58] = a6;

  return (AXMVisionFeature *)v17;
}

+ (id)groupedFeatureWithElementRect:(CGRect)a3 uiClass:(int64_t)a4 confidence:(double)a5 label:(id)a6 canvasSize:(CGSize)a7 subElements:(id)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat v13 = a3.size.height;
  CGFloat v14 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = [[AXMVisionFeature alloc] _init];
  v19[1] = 22;
  *((CGFloat *)v19 + 42) = width;
  *((CGFloat *)v19 + 43) = height;
  *((CGFloat *)v19 + 7) = x;
  *((CGFloat *)v19 + 8) = y;
  *((CGFloat *)v19 + 9) = v14;
  *((CGFloat *)v19 + 10) = v13;
  double v20 = (void *)v19[15];
  v19[15] = v17;
  id v21 = v17;

  v19[58] = a4;
  *((double *)v19 + 23) = a5;
  uint64_t v22 = [v18 copy];

  id v23 = (void *)v19[2];
  v19[2] = v22;

  return v19;
}

+ (id)textDocumentWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a6;
  id v17 = [[AXMVisionFeature alloc] _init];
  v17[4] = 1;
  id v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  id v19 = v16;

  double v20 = (void *)v17[15];
  v17[15] = v15;

  *((unsigned char *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;

  return v17;
}

+ (id)textRegionWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 lines:(id)a6 canvasSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a6;
  id v17 = [[AXMVisionFeature alloc] _init];
  v17[1] = 8;
  v17[4] = 2;
  id v18 = (void *)v17[15];
  v17[15] = v15;
  id v19 = v15;

  *((unsigned char *)v17 + 136) = a4;
  double v20 = (void *)v17[2];
  v17[2] = v16;

  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;

  return v17;
}

+ (id)textLineWithText:(id)a3 boundingBox:(CGRect)a4 recognizedTextFeatures:(id)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = [[AXMVisionFeature alloc] _init];
  v15[1] = 8;
  v15[4] = 3;
  id v16 = (void *)v15[15];
  v15[15] = v13;
  id v17 = v13;

  id v18 = (void *)v15[18];
  v15[18] = v14;

  *((double *)v15 + 42) = width;
  *((double *)v15 + 43) = height;
  *((double *)v15 + 7) = x * width;
  *((double *)v15 + 8) = y * height;
  *((double *)v15 + 9) = (x + v10) * width - x * width;
  *((double *)v15 + 10) = (y + v9) * height - y * height;
  *((double *)v15 + 11) = x;
  *((double *)v15 + 12) = y;
  *((double *)v15 + 13) = v10;
  *((double *)v15 + 14) = v9;

  return v15;
}

+ (id)textSequence:(id)a3 boundingBox:(CGRect)a4 recognizedTextFeatures:(id)a5 confidence:(double)a6 canvasSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  id v16 = a5;
  id v17 = [[AXMVisionFeature alloc] _init];
  v17[1] = 8;
  v17[4] = 4;
  id v18 = (void *)v17[15];
  v17[15] = v15;
  id v19 = v15;

  double v20 = (void *)v17[18];
  v17[18] = v16;

  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  double v21 = 1.0 - y - v11;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = v21 * height;
  *((double *)v17 + 9) = v12 * width;
  *((double *)v17 + 10) = v11 * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = v21;
  *((double *)v17 + 13) = v12;
  *((double *)v17 + 14) = v11;
  *((double *)v17 + 23) = a6;

  return v17;
}

+ (id)nutritionLabelWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 rows:(id)a6 canvasSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a6;
  id v17 = [[AXMVisionFeature alloc] _init];
  v17[4] = 13;
  id v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  id v19 = v16;

  double v20 = (void *)v17[15];
  v17[15] = v15;

  *((unsigned char *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;

  return v17;
}

+ (id)envelopeWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a6;
  id v17 = [[AXMVisionFeature alloc] _init];
  v17[4] = 14;
  id v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  id v19 = v16;

  double v20 = (void *)v17[16];
  v17[16] = v15;

  *((unsigned char *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;

  return v17;
}

+ (id)envelopeRegion:(id)a3 boundingBox:(CGRect)a4 confidence:(double)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = [[AXMVisionFeature alloc] _init];
  v14[1] = 8;
  v14[4] = 15;
  id v15 = (void *)v14[15];
  v14[15] = v13;

  *((double *)v14 + 42) = width;
  *((double *)v14 + 43) = height;
  *((double *)v14 + 7) = x * width;
  *((double *)v14 + 8) = y * height;
  *((double *)v14 + 9) = (x + v10) * width - x * width;
  *((double *)v14 + 10) = (y + v9) * height - y * height;
  *((double *)v14 + 11) = x;
  *((double *)v14 + 12) = y;
  *((double *)v14 + 13) = v10;
  *((double *)v14 + 14) = v9;
  *((double *)v14 + 23) = a5;

  return v14;
}

+ (id)receiptWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 regions:(id)a6 canvasSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v10 = a5.size.height;
  double v11 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v15 = a3;
  id v16 = a6;
  id v17 = [[AXMVisionFeature alloc] _init];
  v17[4] = 16;
  id v18 = (void *)v17[2];
  v17[1] = 8;
  v17[2] = v16;
  id v19 = v16;

  double v20 = (void *)v17[15];
  v17[15] = v15;

  *((unsigned char *)v17 + 136) = a4;
  *((double *)v17 + 42) = width;
  *((double *)v17 + 43) = height;
  *((double *)v17 + 7) = x * width;
  *((double *)v17 + 8) = y * height;
  *((double *)v17 + 9) = (x + v11) * width - x * width;
  *((double *)v17 + 10) = (y + v10) * height - y * height;
  *((double *)v17 + 11) = x;
  *((double *)v17 + 12) = y;
  *((double *)v17 + 13) = v11;
  *((double *)v17 + 14) = v10;

  return v17;
}

+ (id)tableWithText:(id)a3 isSpeakable:(BOOL)a4 boundingBox:(CGRect)a5 rows:(id)a6 columns:(id)a7 canvasSize:(CGSize)a8 isIncomplete:(BOOL)a9
{
  BOOL v9 = a9;
  double height = a8.height;
  double width = a8.width;
  double v14 = a5.size.height;
  double v15 = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v19 = a3;
  id v20 = a7;
  id v21 = a6;
  uint64_t v22 = [[AXMVisionFeature alloc] _init];
  id v23 = v22;
  v22[1] = 8;
  uint64_t v24 = 7;
  if (v9) {
    uint64_t v24 = 8;
  }
  v22[4] = v24;
  uint64_t v25 = [v21 arrayByAddingObjectsFromArray:v20];

  uint64_t v26 = (void *)v23[2];
  v23[2] = v25;

  uint64_t v27 = (void *)v23[15];
  v23[15] = v19;

  *((unsigned char *)v23 + 136) = a4;
  *((double *)v23 + 42) = width;
  *((double *)v23 + 43) = height;
  *((double *)v23 + 7) = x * width;
  *((double *)v23 + 8) = y * height;
  *((double *)v23 + 9) = (x + v15) * width - x * width;
  *((double *)v23 + 10) = (y + v14) * height - y * height;
  *((double *)v23 + 11) = x;
  *((double *)v23 + 12) = y;
  *((double *)v23 + 13) = v15;
  *((double *)v23 + 14) = v14;

  return v23;
}

+ (id)tableRowWithText:(id)a3 boundingBox:(CGRect)a4 cells:(id)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  double v15 = [[AXMVisionFeature alloc] _init];
  v15[4] = 9;
  id v16 = (void *)v15[2];
  v15[1] = 8;
  v15[2] = v14;
  id v17 = v14;

  id v18 = (void *)v15[15];
  v15[15] = v13;

  *((double *)v15 + 42) = width;
  *((double *)v15 + 43) = height;
  *((double *)v15 + 7) = x * width;
  *((double *)v15 + 8) = y * height;
  *((double *)v15 + 9) = (x + v10) * width - x * width;
  *((double *)v15 + 10) = (y + v9) * height - y * height;
  *((double *)v15 + 11) = x;
  *((double *)v15 + 12) = y;
  *((double *)v15 + 13) = v10;
  *((double *)v15 + 14) = v9;

  return v15;
}

+ (id)tableColumnWithText:(id)a3 boundingBox:(CGRect)a4 cells:(id)a5 canvasSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  double v15 = [[AXMVisionFeature alloc] _init];
  v15[4] = 10;
  id v16 = (void *)v15[2];
  v15[1] = 8;
  v15[2] = v14;
  id v17 = v14;

  id v18 = (void *)v15[15];
  v15[15] = v13;

  *((double *)v15 + 42) = width;
  *((double *)v15 + 43) = height;
  *((double *)v15 + 7) = x * width;
  *((double *)v15 + 8) = y * height;
  *((double *)v15 + 9) = (x + v10) * width - x * width;
  *((double *)v15 + 10) = (y + v9) * height - y * height;
  *((double *)v15 + 11) = x;
  *((double *)v15 + 12) = y;
  *((double *)v15 + 13) = v10;
  *((double *)v15 + 14) = v9;

  return v15;
}

+ (id)tableCellWithText:(id)a3 boundingBox:(CGRect)a4 confidence:(double)a5 recognizedTextFeatures:(id)a6 canvasSize:(CGSize)a7 isHeader:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a7.height;
  double width = a7.width;
  double v13 = a4.size.height;
  double v14 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a3;
  id v18 = a6;
  id v19 = [[AXMVisionFeature alloc] _init];
  id v20 = (double *)v19;
  v19[1] = 8;
  uint64_t v21 = 11;
  if (v8) {
    uint64_t v21 = 12;
  }
  v19[4] = v21;
  uint64_t v22 = (void *)v19[15];
  v19[15] = v17;
  id v23 = v17;

  v20[42] = width;
  v20[43] = height;
  uint64_t v24 = (void *)*((void *)v20 + 18);
  *((void *)v20 + 18) = v18;

  double v25 = 1.0 - y - v13;
  v20[7] = x * width;
  v20[8] = v25 * height;
  v20[9] = v14 * width;
  v20[10] = v13 * height;
  v20[11] = x;
  v20[12] = v25;
  v20[13] = v14;
  v20[14] = v13;
  v20[23] = a5;

  return v20;
}

+ (AXMVisionFeature)featureWithIconClass:(id)a3 confidence:(double)a4
{
  id v5 = a3;
  id v6 = [[AXMVisionFeature alloc] _init];
  *((void *)v6 + 1) = 20;
  id v7 = (void *)*((void *)v6 + 15);
  *((void *)v6 + 15) = v5;

  long long v9 = AXMRectNotApplicable;
  long long v8 = *(_OWORD *)&qword_1E9D62AF0;
  *((_OWORD *)v6 + 21) = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v6 + 56) = v9;
  *(_OWORD *)(v6 + 72) = v8;
  *(_OWORD *)(v6 + 88) = v9;
  *(_OWORD *)(v6 + 104) = v8;
  *((double *)v6 + 23) = a4;

  return (AXMVisionFeature *)v6;
}

+ (AXMVisionFeature)featureWithMediaLegibility:(id)a3
{
  id v3 = a3;
  v4 = [[AXMVisionFeature alloc] _init];
  *((void *)v4 + 1) = 12;
  uint64_t v5 = [v3 string];

  id v6 = (void *)*((void *)v4 + 15);
  *((void *)v4 + 15) = v5;

  *((void *)v4 + 23) = AXMConfidenceNotApplicable;
  long long v8 = AXMRectNotApplicable;
  long long v7 = *(_OWORD *)&qword_1E9D62AF0;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v4 + 56) = v8;
  *(_OWORD *)(v4 + 72) = v7;
  *(_OWORD *)(v4 + 88) = v8;
  *(_OWORD *)(v4 + 104) = v7;

  return (AXMVisionFeature *)v4;
}

+ (AXMVisionFeature)featureWithColorInfo:(id)a3 canvasSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = a3;
  long long v7 = [[AXMVisionFeature alloc] _init];
  *((void *)v7 + 1) = 4;
  *((void *)v7 + 23) = AXMConfidenceNotApplicable;
  *((CGFloat *)v7 + 42) = width;
  *((CGFloat *)v7 + 43) = height;
  long long v8 = AXMRectNotApplicable;
  long long v9 = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v7 + 56) = AXMRectNotApplicable;
  *(_OWORD *)(v7 + 72) = v9;
  *(_OWORD *)(v7 + 88) = v8;
  *(_OWORD *)(v7 + 104) = v9;
  double v10 = (void *)*((void *)v7 + 19);
  *((void *)v7 + 19) = v6;

  return (AXMVisionFeature *)v7;
}

+ (AXMVisionFeature)featureWithAssetMetadata:(id)a3
{
  id v3 = a3;
  v4 = [[AXMVisionFeature alloc] _init];
  *((void *)v4 + 1) = 13;
  *((void *)v4 + 23) = AXMConfidenceNotApplicable;
  long long v6 = AXMRectNotApplicable;
  long long v5 = *(_OWORD *)&qword_1E9D62AF0;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v4 + 56) = v6;
  *(_OWORD *)(v4 + 72) = v5;
  *(_OWORD *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 104) = v5;
  long long v7 = (void *)*((void *)v4 + 20);
  *((void *)v4 + 20) = v3;

  return (AXMVisionFeature *)v4;
}

+ (AXMVisionFeature)featureWithDeviceMotion:(id)a3 orientation:(int64_t)a4
{
  id v5 = a3;
  long long v6 = [[AXMVisionFeature alloc] _init];
  *((void *)v6 + 1) = 17;
  *((void *)v6 + 23) = AXMConfidenceNotApplicable;
  long long v8 = AXMRectNotApplicable;
  long long v7 = *(_OWORD *)&qword_1E9D62AF0;
  *((_OWORD *)v6 + 21) = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v6 + 56) = v8;
  *(_OWORD *)(v6 + 72) = v7;
  *(_OWORD *)(v6 + 88) = v8;
  *(_OWORD *)(v6 + 104) = v7;
  long long v9 = (void *)*((void *)v6 + 60);
  *((void *)v6 + 60) = v5;

  *((void *)v6 + 61) = a4;

  return (AXMVisionFeature *)v6;
}

+ (AXMVisionFeature)featureWithCameraType:(int64_t)a3
{
  v4 = [[AXMVisionFeature alloc] _init];
  *((void *)v4 + 1) = 18;
  *((void *)v4 + 23) = AXMConfidenceNotApplicable;
  long long v6 = AXMRectNotApplicable;
  long long v5 = *(_OWORD *)&qword_1E9D62AF0;
  *((_OWORD *)v4 + 21) = *(_OWORD *)&qword_1E9D62AF0;
  *(_OWORD *)(v4 + 56) = v6;
  *(_OWORD *)(v4 + 72) = v5;
  *(_OWORD *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 104) = v5;
  *((void *)v4 + 62) = a3;

  return (AXMVisionFeature *)v4;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)AXMVisionFeature;
  v2 = [(AXMVisionFeature *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    *((void *)v2 + 1) = 0;
    *((void *)v2 + 23) = AXMConfidenceNotApplicable;
    long long v4 = AXMRectNotApplicable;
    long long v5 = *(_OWORD *)&qword_1E9D62AF0;
    *(_OWORD *)(v2 + 56) = AXMRectNotApplicable;
    *(_OWORD *)(v2 + 72) = v5;
    *(_OWORD *)(v2 + 88) = v4;
    *(_OWORD *)(v2 + 104) = v5;
    *((_OWORD *)v2 + 21) = v5;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v3[6] = v6;
    v3[4] = 0;
  }
  return v3;
}

+ (CGRect)_aspectFaceRectFromSquareFaceRect:(CGRect)a3 sizeInPixels:(CGSize)a4
{
  CGFloat v4 = a3.size.height * a4.height;
  CGFloat v5 = v4 * 1.6 * 0.8;
  double v6 = (a3.origin.x * a4.width + (v5 - a3.size.width * a4.width) * -0.5) / a4.width;
  double v7 = (a3.origin.y * a4.height - (v4 * 1.6 - v4) / 1.6) / a4.height;
  double v8 = v5 / a4.width;
  double v9 = v4 * 1.6 / a4.height;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionFeature)initWithCoder:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = [(AXMVisionFeature *)self _init];
  if (v5)
  {
    *((void *)v5 + 1) = [v4 decodeIntegerForKey:AXMVisionFeatureCodingKeyFeatureType];
    [v4 axmDecodeSizeForKey:AXMVisionFeatureCodingKeyCanvasSize];
    *((void *)v5 + 42) = v6;
    *((void *)v5 + 43) = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyBarcodeType];
    double v9 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v8;

    *((void *)v5 + 4) = [v4 decodeIntegerForKey:AXMVisionFeatureCodingKeyOCRFeatureType];
    double v10 = AXMSecureCodingClasses();
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"effectiveTextDetectionLocales"];
    double v12 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v11;

    [v4 axmDecodeRectForKey:AXMVisionFeatureCodingKeyFrame];
    *((void *)v5 + 7) = v13;
    *((void *)v5 + 8) = v14;
    *((void *)v5 + 9) = v15;
    *((void *)v5 + 10) = v16;
    [v4 axmDecodeRectForKey:AXMVisionFeatureCodingKeyNormalizedFrame];
    *((void *)v5 + 11) = v17;
    *((void *)v5 + 12) = v18;
    *((void *)v5 + 13) = v19;
    *((void *)v5 + 14) = v20;
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyValue];
    uint64_t v22 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classificationLocalizedValue"];
    uint64_t v24 = (void *)*((void *)v5 + 46);
    *((void *)v5 + 46) = v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classificationLabel"];
    uint64_t v26 = (void *)*((void *)v5 + 45);
    *((void *)v5 + 45) = v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"caption"];
    v28 = (void *)*((void *)v5 + 47);
    *((void *)v5 + 47) = v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"translatedCaption"];
    double v30 = (void *)*((void *)v5 + 48);
    *((void *)v5 + 48) = v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyColorInfo];
    v32 = (void *)*((void *)v5 + 19);
    *((void *)v5 + 19) = v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyAssetMetadata];
    uint64_t v34 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = v33;

    [v4 decodeFloatForKey:AXMVisionFeatureCodingKeyBlur];
    *((double *)v5 + 21) = v35;
    [v4 decodeFloatForKey:AXMVisionFeatureCodingKeyBrightness];
    *((double *)v5 + 22) = v36;
    [v4 decodeFloatForKey:AXMVisionFeatureCodingKeyConfidence];
    *((double *)v5 + 23) = v37;
    v5[192] = [v4 decodeBoolForKey:AXMVisionFeatureCodingKeyIsLowConfidence];
    [v4 decodeFloatForKey:AXMVisionFeatureCodingKeyHorizonAngle];
    *((_DWORD *)v5 + 62) = v38;
    uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyFaceDetectionResult];
    v40 = (void *)*((void *)v5 + 32);
    *((void *)v5 + 32) = v39;

    *((void *)v5 + 33) = [v4 decodeIntegerForKey:AXMVisionFeatureCodingKeyFaceID];
    uint64_t v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyModelID];
    v42 = (void *)*((void *)v5 + 44);
    *((void *)v5 + 44) = v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyAesthetics];
    double v44 = (void *)*((void *)v5 + 59);
    *((void *)v5 + 59) = v43;

    double v45 = AXMSecureCodingClasses();
    uint64_t v46 = [v4 decodeObjectOfClasses:v45 forKey:AXMVisionFeatureCodingKeyUserContext];
    uint64_t v47 = (void *)*((void *)v5 + 63);
    *((void *)v5 + 63) = v46;

    *((void *)v5 + 58) = [v4 decodeIntegerForKey:AXMVisionFeatureCodingKeyUIClass];
    v5[458] = [v4 decodeBoolForKey:AXMVisionFeatureCodingKeyCaptionMayContainSensitiveContent];
    uint64_t v48 = AXMSecureCodingClasses();
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:AXMVisionFeatureCodingKeyDetectorSceneClassIds];
    v50 = (void *)*((void *)v5 + 50);
    *((void *)v5 + 50) = v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeySceneClassId];
    v52 = (void *)*((void *)v5 + 51);
    *((void *)v5 + 51) = v51;

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subfeatures"];
    if (v53)
    {
      v54 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v55 = objc_opt_class();
      v56 = AXMSecureCodingClasses();
      id v84 = 0;
      v57 = [v54 axmSecurelyUnarchiveData:v53 withExpectedClass:v55 otherAllowedClasses:v56 error:&v84];
      id v58 = v84;

      if (v58)
      {
        v59 = AXMediaLogCommon();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v58;
          _os_log_impl(&dword_1B57D5000, v59, OS_LOG_TYPE_DEFAULT, "Error decoding subfeatures array: %@", buf, 0xCu);
        }
      }
      else
      {
        id v60 = v57;
        v59 = *((void *)v5 + 2);
        *((void *)v5 + 2) = v60;
      }
    }
    v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyRecognizedFeatures];
    if (v61)
    {
      v62 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v63 = objc_opt_class();
      v64 = AXMSecureCodingClasses();
      id v83 = 0;
      v65 = [v62 axmSecurelyUnarchiveData:v61 withExpectedClass:v63 otherAllowedClasses:v64 error:&v83];
      id v66 = v83;

      if (v66)
      {
        v67 = AXMediaLogCommon();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v66;
          _os_log_impl(&dword_1B57D5000, v67, OS_LOG_TYPE_DEFAULT, "Error decoding recognizedTextFeatures array: %@", buf, 0xCu);
        }
      }
      else
      {
        id v68 = v65;
        v67 = *((void *)v5 + 18);
        *((void *)v5 + 18) = v68;
      }
    }
    long long v86 = 0u;
    long long v87 = 0u;
    *(_OWORD *)buf = 0u;
    v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMVisionFeatureCodingKeyHorizonTransform];
    [v69 getBytes:buf length:48];
    long long v70 = v86;
    *(_OWORD *)(v5 + 200) = *(_OWORD *)buf;
    *(_OWORD *)(v5 + 216) = v70;
    *(_OWORD *)(v5 + 232) = v87;
    *((void *)v5 + 61) = [v4 decodeIntegerForKey:AXMVisionFeatureCodingKeyDeviceOrientation];
    *((void *)v5 + 62) = [v4 decodeIntegerForKey:AXMVisionFeatureCodingKeyCameraType];
    v71 = AXMSecureCodingClasses();
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:AXMVisionFeatureCodingKeyFeatureGates];
    v73 = (void *)*((void *)v5 + 49);
    *((void *)v5 + 49) = v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMMediaAnalysisFeatureCodingKeyImageCaption];
    v75 = (void *)*((void *)v5 + 52);
    *((void *)v5 + 52) = v74;

    [v4 decodeFloatForKey:AXMMediaAnalysisFeatureCodingKeyImageCaptionConfidence];
    *((double *)v5 + 53) = v76;
    uint64_t v77 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMMediaAnalysisFeatureCodingKeyTranslatedImageCaption];
    v78 = (void *)*((void *)v5 + 54);
    *((void *)v5 + 54) = v77;

    uint64_t v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMMediaAnalysisFeatureCodingKeyFaceDetectionResult];
    v80 = (void *)*((void *)v5 + 55);
    *((void *)v5 + 55) = v79;

    *((void *)v5 + 56) = [v4 decodeIntegerForKey:AXMMediaAnalysisFeatureCodingKeyFaceID];
    v81 = v5;
  }
  return (AXMVisionFeature *)v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)_serializeWithCoder:(id)a3 orDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  subfeatures = self->_subfeatures;
  if (subfeatures)
  {
    id v64 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:subfeatures requiringSecureCoding:1 error:&v64];
    id v10 = v64;
    if (v10)
    {
      uint64_t v11 = v10;
      double v12 = AXMediaLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXMVisionFeature _serializeWithCoder:orDictionary:]();
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  recognizedTextFeatures = self->_recognizedTextFeatures;
  if (recognizedTextFeatures)
  {
    id v63 = 0;
    uint64_t v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:recognizedTextFeatures requiringSecureCoding:1 error:&v63];
    id v15 = v63;
    id v60 = (void *)v14;
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = AXMediaLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AXMVisionFeature _serializeWithCoder:orDictionary:]();
      }
    }
  }
  else
  {
    id v60 = 0;
  }
  if (v6)
  {
    double confidence = self->_confidence;
    *(float *)&double confidence = confidence;
    [v6 encodeFloat:AXMVisionFeatureCodingKeyConfidence forKey:confidence];
    [v6 encodeBool:self->_isLowConfidence forKey:AXMVisionFeatureCodingKeyIsLowConfidence];
    [v6 encodeInteger:self->_featureType forKey:AXMVisionFeatureCodingKeyFeatureType];
    objc_msgSend(v6, "axmEncodeRect:forKey:", AXMVisionFeatureCodingKeyFrame, self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    objc_msgSend(v6, "axmEncodeRect:forKey:", AXMVisionFeatureCodingKeyNormalizedFrame, self->_normalizedFrame.origin.x, self->_normalizedFrame.origin.y, self->_normalizedFrame.size.width, self->_normalizedFrame.size.height);
    objc_msgSend(v6, "axmEncodeSize:forKey:", AXMVisionFeatureCodingKeyCanvasSize, self->_canvasSize.width, self->_canvasSize.height);
    [v6 encodeObject:self->_value forKey:AXMVisionFeatureCodingKeyValue];
    uint64_t v19 = (void *)v9;
    [v6 encodeObject:v9 forKey:@"subfeatures"];
    uint64_t v20 = v60;
    [v6 encodeObject:v60 forKey:AXMVisionFeatureCodingKeyRecognizedFeatures];
    uint64_t v21 = [(AXMVisionFeature *)self userContext];
    [v6 encodeObject:v21 forKey:AXMVisionFeatureCodingKeyUserContext];

    [v6 encodeInteger:self->_uiClass forKey:AXMVisionFeatureCodingKeyUIClass];
    [v6 encodeObject:self->_featureGates forKey:AXMVisionFeatureCodingKeyFeatureGates];
    [v6 encodeBool:self->_captionMayContainSensitiveContent forKey:AXMVisionFeatureCodingKeyCaptionMayContainSensitiveContent];
    [v6 encodeObject:self->_detectorSceneClassIds forKey:AXMVisionFeatureCodingKeyDetectorSceneClassIds];
    [v6 encodeObject:self->_sceneClassId forKey:AXMVisionFeatureCodingKeySceneClassId];
  }
  else
  {
    uint64_t v22 = [NSNumber numberWithDouble:self->_confidence];
    [v7 setObject:v22 forKeyedSubscript:AXMVisionFeatureCodingKeyConfidence];

    uint64_t v23 = [NSNumber numberWithBool:self->_isLowConfidence];
    [v7 setObject:v23 forKeyedSubscript:AXMVisionFeatureCodingKeyIsLowConfidence];

    uint64_t v24 = +[AXMVisionFeature nameForFeatureType:self->_featureType];
    [v7 setObject:v24 forKeyedSubscript:AXMVisionFeatureCodingKeyFeatureType];

    uint64_t v25 = AXMStringFromCGRect(self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    [v7 setObject:v25 forKeyedSubscript:AXMVisionFeatureCodingKeyFrame];

    uint64_t v26 = AXMStringFromCGRect(self->_normalizedFrame.origin.x, self->_normalizedFrame.origin.y, self->_normalizedFrame.size.width, self->_normalizedFrame.size.height);
    [v7 setObject:v26 forKeyedSubscript:AXMVisionFeatureCodingKeyNormalizedFrame];

    uint64_t v27 = AXMStringFromCGSize(self->_canvasSize.width, self->_canvasSize.height);
    [v7 setObject:v27 forKeyedSubscript:AXMVisionFeatureCodingKeyCanvasSize];

    [v7 setObject:self->_value forKeyedSubscript:AXMVisionFeatureCodingKeyValue];
    [v7 setObject:self->_subfeatures forKeyedSubscript:@"subfeatures"];
    v28 = [(AXMVisionFeature *)self userContext];
    [v7 setObject:v28 forKeyedSubscript:AXMVisionFeatureCodingKeyUserContext];

    uint64_t v29 = [NSNumber numberWithInteger:self->_uiClass];
    [v7 setObject:v29 forKeyedSubscript:AXMVisionFeatureCodingKeyUIClass];

    [v7 setObject:self->_featureGates forKeyedSubscript:AXMVisionFeatureCodingKeyFeatureGates];
    double v30 = [NSNumber numberWithBool:self->_captionMayContainSensitiveContent];
    [v7 setObject:v30 forKeyedSubscript:AXMVisionFeatureCodingKeyCaptionMayContainSensitiveContent];

    [v7 setObject:self->_detectorSceneClassIds forKeyedSubscript:AXMVisionFeatureCodingKeyDetectorSceneClassIds];
    [v7 setObject:self->_sceneClassId forKeyedSubscript:AXMVisionFeatureCodingKeySceneClassId];
    uint64_t v19 = (void *)v9;
    uint64_t v20 = v60;
  }
  switch([(AXMVisionFeature *)self featureType])
  {
    case 1uLL:
      if (v6)
      {
        double brightness = self->_brightness;
        *(float *)&double brightness = brightness;
        uint64_t v35 = AXMVisionFeatureCodingKeyBrightness;
        goto LABEL_24;
      }
      v52 = [NSNumber numberWithDouble:self->_brightness];
      uint64_t v53 = AXMVisionFeatureCodingKeyBrightness;
      goto LABEL_74;
    case 2uLL:
      if (!v6)
      {
        v52 = [NSNumber numberWithDouble:self->_blur];
        uint64_t v53 = AXMVisionFeatureCodingKeyBlur;
        goto LABEL_74;
      }
      double brightness = self->_blur;
      *(float *)&double brightness = brightness;
      uint64_t v35 = AXMVisionFeatureCodingKeyBlur;
LABEL_24:
      [v6 encodeFloat:v35 forKey:brightness];
      goto LABEL_75;
    case 3uLL:
      long long v36 = *(_OWORD *)&self->_horizonTransform.c;
      v62[0] = *(_OWORD *)&self->_horizonTransform.a;
      v62[1] = v36;
      v62[2] = *(_OWORD *)&self->_horizonTransform.tx;
      float v37 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v62 length:48];
      if (v6)
      {
        [v6 encodeObject:v37 forKey:AXMVisionFeatureCodingKeyHorizonTransform];
        *(float *)&double v38 = self->_horizonAngle;
        [v6 encodeFloat:AXMVisionFeatureCodingKeyHorizonAngle forKey:v38];
      }
      else
      {
        [v7 setObject:v37 forKeyedSubscript:AXMVisionFeatureCodingKeyHorizonTransform];
        *(float *)&double v54 = self->_horizonAngle;
        uint64_t v55 = [NSNumber numberWithFloat:v54];
        [v7 setObject:v55 forKeyedSubscript:AXMVisionFeatureCodingKeyHorizonAngle];
      }
      goto LABEL_75;
    case 4uLL:
      if (v6)
      {
        colorInfo = (__CFString *)self->_colorInfo;
        uint64_t v33 = (__CFString *)AXMVisionFeatureCodingKeyColorInfo;
        goto LABEL_54;
      }
      uint64_t v33 = (__CFString *)AXMVisionFeatureCodingKeyColorInfo;
      colorInfo = @"color info";
      goto LABEL_72;
    case 5uLL:
      faceDetectionResult = self->_faceDetectionResult;
      if (v6)
      {
        [v6 encodeObject:faceDetectionResult forKey:AXMVisionFeatureCodingKeyFaceDetectionResult];
        unint64_t faceId = self->_faceId;
        uint64_t v41 = AXMVisionFeatureCodingKeyFaceID;
        goto LABEL_57;
      }
      [v7 setObject:faceDetectionResult forKeyedSubscript:AXMVisionFeatureCodingKeyFaceDetectionResult];
      v52 = [NSNumber numberWithUnsignedInteger:self->_faceId];
      uint64_t v53 = AXMVisionFeatureCodingKeyFaceID;
      goto LABEL_74;
    case 8uLL:
      int64_t ocrFeatureType = self->_ocrFeatureType;
      if (v6)
      {
        [v6 encodeInteger:ocrFeatureType forKey:AXMVisionFeatureCodingKeyOCRFeatureType];
        colorInfo = (__CFString *)self->_effectiveTextDetectionLocales;
        uint64_t v33 = @"effectiveTextDetectionLocales";
        goto LABEL_54;
      }
      v56 = [(AXMVisionFeature *)self _nameForOCRFeatureType:ocrFeatureType];
      [v7 setObject:v56 forKeyedSubscript:AXMVisionFeatureCodingKeyOCRFeatureType];

      colorInfo = (__CFString *)self->_effectiveTextDetectionLocales;
      uint64_t v33 = @"effectiveTextDetectionLocales";
      goto LABEL_72;
    case 9uLL:
    case 10uLL:
    case 23uLL:
    case 24uLL:
    case 26uLL:
    case 27uLL:
    case 29uLL:
    case 30uLL:
      classificationLocalizedValue = self->_classificationLocalizedValue;
      if (v6)
      {
        [v6 encodeObject:classificationLocalizedValue forKey:@"classificationLocalizedValue"];
        colorInfo = (__CFString *)self->_classificationLabel;
        uint64_t v33 = @"classificationLabel";
        goto LABEL_54;
      }
      [v7 setObject:classificationLocalizedValue forKeyedSubscript:@"classificationLocalizedValue"];
      colorInfo = (__CFString *)self->_classificationLabel;
      uint64_t v33 = @"classificationLabel";
      goto LABEL_72;
    case 11uLL:
      colorInfo = (__CFString *)self->_barcodeType;
      uint64_t v33 = (__CFString *)AXMVisionFeatureCodingKeyBarcodeType;
      if (!v6) {
        goto LABEL_72;
      }
      goto LABEL_54;
    case 13uLL:
      if (v6)
      {
        colorInfo = (__CFString *)self->_assetMetadata;
        uint64_t v33 = (__CFString *)AXMVisionFeatureCodingKeyAssetMetadata;
        goto LABEL_54;
      }
      uint64_t v33 = (__CFString *)AXMVisionFeatureCodingKeyAssetMetadata;
      colorInfo = @"asset metadata";
      goto LABEL_72;
    case 15uLL:
      colorInfo = (__CFString *)self->_modelID;
      uint64_t v33 = (__CFString *)AXMVisionFeatureCodingKeyModelID;
      if (!v6) {
        goto LABEL_72;
      }
      goto LABEL_54;
    case 16uLL:
      if (!v6) {
        goto LABEL_70;
      }
      goto LABEL_51;
    case 17uLL:
      uint64_t v43 = (void *)MEMORY[0x1E4F28DB0];
      double v44 = [(AXMVisionFeature *)self deviceMotion];
      id v61 = 0;
      double v45 = [v43 archivedDataWithRootObject:v44 requiringSecureCoding:1 error:&v61];
      id v46 = v61;

      if (v46)
      {
        uint64_t v47 = AXMediaLogCommon();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[AXMVisionFeature _serializeWithCoder:orDictionary:]();
        }
      }
      if (v6)
      {
        [v6 encodeObject:v45 forKey:AXMVisionFeatureCodingKeyDeviceMotion];
        [v6 encodeInteger:self->_deviceOrientation forKey:AXMVisionFeatureCodingKeyDeviceOrientation];
        [v6 encodeInteger:self->_cameraType forKey:AXMVisionFeatureCodingKeyCameraType];
      }
      else
      {
        [v7 setObject:v45 forKeyedSubscript:AXMVisionFeatureCodingKeyDeviceMotion];
        v57 = [NSNumber numberWithInteger:self->_deviceOrientation];
        [v7 setObject:v57 forKeyedSubscript:AXMVisionFeatureCodingKeyDeviceOrientation];

        id v58 = [NSNumber numberWithInteger:self->_cameraType];
        [v7 setObject:v58 forKeyedSubscript:AXMVisionFeatureCodingKeyCameraType];
      }
      goto LABEL_75;
    case 18uLL:
      if (v6)
      {
        unint64_t faceId = self->_cameraType;
        uint64_t v41 = AXMVisionFeatureCodingKeyCameraType;
        goto LABEL_57;
      }
      v52 = [NSNumber numberWithInteger:self->_cameraType];
      uint64_t v53 = AXMVisionFeatureCodingKeyCameraType;
      goto LABEL_74;
    case 21uLL:
      aestheticsResult = self->_aestheticsResult;
      if (v6)
      {
        [v6 encodeObject:aestheticsResult forKey:AXMVisionFeatureCodingKeyAesthetics];
LABEL_51:
        [v6 encodeObject:self->_caption forKey:@"caption"];
        colorInfo = (__CFString *)self->_translatedCaption;
        uint64_t v33 = @"translatedCaption";
        goto LABEL_54;
      }
      [v7 setObject:aestheticsResult forKeyedSubscript:AXMVisionFeatureCodingKeyAesthetics];
LABEL_70:
      [v7 setObject:self->_caption forKeyedSubscript:@"caption"];
      colorInfo = (__CFString *)self->_translatedCaption;
      uint64_t v33 = @"translatedCaption";
      goto LABEL_72;
    case 25uLL:
      mediaAnalysisImageCaption = self->_mediaAnalysisImageCaption;
      if (v6)
      {
        [v6 encodeObject:mediaAnalysisImageCaption forKey:AXMMediaAnalysisFeatureCodingKeyImageCaption];
        double mediaAnalysisImageCaptionConfidence = self->_mediaAnalysisImageCaptionConfidence;
        *(float *)&double mediaAnalysisImageCaptionConfidence = mediaAnalysisImageCaptionConfidence;
        [v6 encodeFloat:AXMMediaAnalysisFeatureCodingKeyImageCaptionConfidence forKey:mediaAnalysisImageCaptionConfidence];
        colorInfo = (__CFString *)self->_mediaAnalysisTranslatedImageCaption;
        uint64_t v33 = (__CFString *)AXMMediaAnalysisFeatureCodingKeyTranslatedImageCaption;
LABEL_54:
        [v6 encodeObject:colorInfo forKey:v33];
      }
      else
      {
        [v7 setObject:mediaAnalysisImageCaption forKeyedSubscript:AXMMediaAnalysisFeatureCodingKeyImageCaption];
        v59 = [NSNumber numberWithDouble:self->_mediaAnalysisImageCaptionConfidence];
        [v7 setObject:v59 forKeyedSubscript:AXMMediaAnalysisFeatureCodingKeyImageCaptionConfidence];

        colorInfo = (__CFString *)self->_mediaAnalysisTranslatedImageCaption;
        uint64_t v33 = (__CFString *)AXMMediaAnalysisFeatureCodingKeyTranslatedImageCaption;
LABEL_72:
        [v7 setObject:colorInfo forKeyedSubscript:v33];
      }
LABEL_75:

      return;
    case 31uLL:
      mediaAnalysisFaceDetectionResult = self->_mediaAnalysisFaceDetectionResult;
      if (v6)
      {
        [v6 encodeObject:mediaAnalysisFaceDetectionResult forKey:AXMMediaAnalysisFeatureCodingKeyFaceDetectionResult];
        unint64_t faceId = self->_mediaAnalysisFaceId;
        uint64_t v41 = AXMMediaAnalysisFeatureCodingKeyFaceID;
LABEL_57:
        [v6 encodeInteger:faceId forKey:v41];
      }
      else
      {
        [v7 setObject:mediaAnalysisFaceDetectionResult forKeyedSubscript:AXMMediaAnalysisFeatureCodingKeyFaceDetectionResult];
        v52 = [NSNumber numberWithUnsignedInteger:self->_mediaAnalysisFaceId];
        uint64_t v53 = AXMMediaAnalysisFeatureCodingKeyFaceID;
LABEL_74:
        [v7 setObject:v52 forKeyedSubscript:v53];
      }
      goto LABEL_75;
    default:
      goto LABEL_75;
  }
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(AXMVisionFeature *)self _serializeWithCoder:0 orDictionary:v3];

  return (NSDictionary *)v3;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (NSArray)subfeatures
{
  return self->_subfeatures;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (CGSize)canvasSize
{
  double width = self->_canvasSize.width;
  double height = self->_canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)normalizedFrame
{
  double x = self->_normalizedFrame.origin.x;
  double y = self->_normalizedFrame.origin.y;
  double width = self->_normalizedFrame.size.width;
  double height = self->_normalizedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (NSString)barcodeType
{
  return self->_barcodeType;
}

- (int64_t)ocrFeatureType
{
  return self->_ocrFeatureType;
}

- (id)effectiveTextDetectionLocales
{
  return self->_effectiveTextDetectionLocales;
}

- (AXMVisionFeatureColorInfo)colorInfo
{
  return self->_colorInfo;
}

- (AXMVisionFeatureAssetMetadata)assetMetadata
{
  return self->_assetMetadata;
}

- (double)blur
{
  return self->_blur;
}

- (double)brightness
{
  return self->_brightness;
}

- (AXMVisionFeatureFaceDetectionResult)faceDetectionResult
{
  return self->_faceDetectionResult;
}

- (unint64_t)faceId
{
  return self->_faceId;
}

- (__n128)facePose
{
  return a1[17];
}

- (CGAffineTransform)horizonTransform
{
  long long v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[4].ty;
  return self;
}

- (float)horizonAngle
{
  return self->_horizonAngle;
}

- (NSString)classificationLabel
{
  return self->_classificationLabel;
}

- (NSString)classificationLocalizedValue
{
  return self->_classificationLocalizedValue;
}

- (NSString)caption
{
  return self->_caption;
}

- (AXMTranslatedText)translatedCaption
{
  return self->_translatedCaption;
}

- (NSDictionary)featureGates
{
  return (NSDictionary *)self->_featureGates;
}

- (NSSet)detectorSceneClassIds
{
  return (NSSet *)self->_detectorSceneClassIds;
}

- (NSString)sceneClassId
{
  return self->_sceneClassId;
}

- (NSString)mediaAnalysisImageCaption
{
  return self->_mediaAnalysisImageCaption;
}

- (double)mediaAnalysisImageCaptionConfidence
{
  return self->_mediaAnalysisImageCaptionConfidence;
}

- (AXMTranslatedText)mediaAnalysisTranslatedImageCaption
{
  return self->_mediaAnalysisTranslatedImageCaption;
}

- (AXMVisionFeatureFaceDetectionResult)mediaAnalysisFaceDetectionResult
{
  return self->_mediaAnalysisFaceDetectionResult;
}

- (unint64_t)mediaAnalysisFaceId
{
  return self->_mediaAnalysisFaceId;
}

+ (id)nameForLocation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10) {
    return @"Unknown";
  }
  else {
    return *(&off_1E61189A0 + a3 - 1);
  }
}

+ (id)localizedStringForLocation:(int64_t)a3 isSubjectImplicit:(BOOL)a4
{
  int64_t v4 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 0x10)
  {
    id v7 = 0;
  }
  else
  {
    CGFloat v5 = *(&off_1E6118A28 + v4);
    if (a4)
    {
      CGFloat v5 = [(__CFString *)*(&off_1E6118A28 + v4) stringByAppendingString:@".implicit-subject"];
    }
    id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    id v7 = [v6 localizedStringForKey:v5 value:&stru_1F0E72D10 table:@"Accessibility"];
  }

  return v7;
}

- (int64_t)locationUsingThirds:(BOOL)a3 withFlippedYAxis:(BOOL)a4
{
  BOOL v4 = a3;
  [(AXMVisionFeature *)self normalizedFrame];

  return +[AXMVisionFeature locationForNormalizedFrame:previousLocation:usingThirds:](AXMVisionFeature, "locationForNormalizedFrame:previousLocation:usingThirds:", 0, v4);
}

+ (int64_t)locationForNormalizedFrame:(CGRect)a3 previousLocation:(int64_t)a4 usingThirds:(BOOL)a5
{
  int64_t result = 0;
  if (a3.size.width <= 0.0) {
    return result;
  }
  CGFloat height = a3.size.height;
  if (a3.size.height <= 0.0) {
    return result;
  }
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v10 = 0;
  double v11 = 1.0;
  *(double *)&uint64_t v12 = 0.0;
  double v13 = 0.0;
  double v14 = 1.0;
  int v15 = 0;
  int v16 = 0;
  int v17 = 0;
  switch(a4)
  {
    case 1:
      int v15 = 0;
      int v17 = 0;
      int v10 = 1;
      goto LABEL_7;
    case 2:
      int v10 = 0;
      int v15 = 0;
      int v17 = 0;
      goto LABEL_7;
    case 3:
      int v10 = 0;
      int v17 = 0;
      int v15 = 1;
LABEL_7:
      int v16 = 1;
      break;
    case 4:
      int v10 = 0;
      int v16 = 0;
      int v17 = 0;
      int v15 = 1;
      break;
    case 6:
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v10 = 1;
      break;
    case 7:
      int v15 = 0;
      int v16 = 0;
      int v10 = 1;
      goto LABEL_13;
    case 8:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      goto LABEL_13;
    case 9:
      int v10 = 0;
      int v16 = 0;
      int v15 = 1;
LABEL_13:
      int v17 = 1;
      break;
    case 10:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      double v13 = 0.05;
      *(double *)&uint64_t v12 = 0.05;
      break;
    case 11:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      *(double *)&uint64_t v12 = 0.05;
      break;
    case 12:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      *(double *)&uint64_t v12 = 0.05;
      goto LABEL_18;
    case 13:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
LABEL_18:
      double v14 = 0.95;
      break;
    case 14:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      goto LABEL_21;
    case 15:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      double v11 = 0.95;
LABEL_21:
      double v13 = 0.05;
      break;
    case 16:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      double v11 = 0.95;
      break;
    case 17:
      int v10 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      double v14 = 0.95;
      double v11 = 0.95;
      break;
    default:
      break;
  }
  double v39 = v14;
  double v40 = v11;
  double v41 = *(double *)&v12;
  if (a5) {
    double v18 = 0.333333333;
  }
  else {
    double v18 = 0.4;
  }
  if (a5) {
    double v19 = 0.333333333;
  }
  else {
    double v19 = 0.2;
  }
  CGFloat v20 = x;
  CGFloat v21 = y;
  CGFloat v22 = height;
  double MidX = CGRectGetMidX(a3);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v42);
  v43.origin.CGFloat x = v18;
  v43.origin.CGFloat y = v18;
  v43.size.CGFloat width = v19;
  v43.size.CGFloat height = v19;
  double MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = v18;
  v44.origin.CGFloat y = v18;
  v44.size.CGFloat width = v19;
  v44.size.CGFloat height = v19;
  double MaxX = CGRectGetMaxX(v44);
  v45.origin.CGFloat x = v18;
  v45.origin.CGFloat y = v18;
  v45.size.CGFloat width = v19;
  v45.size.CGFloat height = v19;
  double MinY = CGRectGetMinY(v45);
  v46.origin.CGFloat x = v18;
  v46.origin.CGFloat y = v18;
  v46.size.CGFloat width = v19;
  v46.size.CGFloat height = v19;
  double MaxY = CGRectGetMaxY(v46);
  double v29 = MinX + 0.05;
  if (!v10) {
    double v29 = MinX;
  }
  double v30 = MaxX + -0.05;
  if (!v15) {
    double v30 = MaxX;
  }
  double v31 = MinY + 0.05;
  if (!v16) {
    double v31 = MinY;
  }
  if (v17) {
    double MaxY = MaxY + -0.05;
  }
  if (MidX < v13)
  {
    int64_t v32 = 10;
    BOOL v33 = MidY <= v40;
    int64_t v34 = 14;
    uint64_t v35 = 15;
LABEL_42:
    if (!v33) {
      int64_t v34 = v35;
    }
    if (MidY >= v41) {
      return v34;
    }
    else {
      return v32;
    }
  }
  if (MidX > v39)
  {
    int64_t v32 = 12;
    BOOL v33 = MidY <= v40;
    int64_t v34 = 13;
    uint64_t v35 = 17;
    goto LABEL_42;
  }
  if (MidY >= v41) {
    int64_t result = 16;
  }
  else {
    int64_t result = 11;
  }
  if (MidY >= v41 && MidY <= v40)
  {
    if (MidX >= v29)
    {
      if (MidX >= v30)
      {
        if (MidY <= v31) {
          return 3;
        }
        BOOL v36 = MidY < MaxY;
        int64_t v37 = 9;
        int64_t v38 = 4;
      }
      else
      {
        if (MidY <= v31) {
          return 2;
        }
        BOOL v36 = MidY < MaxY;
        int64_t v37 = 8;
        int64_t v38 = 5;
      }
    }
    else
    {
      if (MidY < v31) {
        return 1;
      }
      BOOL v36 = MidY < MaxY;
      int64_t v37 = 7;
      int64_t v38 = 6;
    }
    if (v36) {
      return v38;
    }
    else {
      return v37;
    }
  }
  return result;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isValueSpeakable
{
  return self->_isValueSpeakable;
}

- (BOOL)isBarcode
{
  return self->_featureType == 11;
}

- (BOOL)isFace
{
  return self->_featureType == 5;
}

- (BOOL)isRealtimeFace
{
  return self->_featureType == 6;
}

- (BOOL)isPerson
{
  return self->_featureType == 7;
}

- (BOOL)isSceneClassification
{
  return self->_featureType == 9;
}

- (BOOL)isObjectClassification
{
  return self->_featureType == 10;
}

- (BOOL)isNSFWClassification
{
  return self->_featureType == 23;
}

- (BOOL)isSignificantEventClassification
{
  return self->_featureType == 24;
}

- (BOOL)isModelClassification
{
  return self->_featureType == 15;
}

- (BOOL)isCaption
{
  return self->_featureType == 16;
}

- (BOOL)isColor
{
  return self->_featureType == 4;
}

- (BOOL)isBrightness
{
  return self->_featureType == 1;
}

- (BOOL)isBlur
{
  return self->_featureType == 2;
}

- (BOOL)isHorizon
{
  return self->_featureType == 3;
}

- (BOOL)isMediaLegibility
{
  return self->_featureType == 12;
}

- (BOOL)isAssetMetadata
{
  return self->_featureType == 13;
}

- (BOOL)isRectangle
{
  return self->_featureType == 14;
}

- (BOOL)isOCR
{
  return self->_featureType == 8;
}

- (BOOL)isTextDocument
{
  return self->_featureType == 8 && self->_ocrFeatureType == 1;
}

- (BOOL)isTextRegion
{
  return self->_featureType == 8 && self->_ocrFeatureType == 2;
}

- (BOOL)isTextLine
{
  return self->_featureType == 8 && self->_ocrFeatureType == 3;
}

- (BOOL)isTextSequence
{
  return self->_featureType == 8 && self->_ocrFeatureType == 4;
}

- (BOOL)isTable
{
  return self->_featureType == 8 && (unint64_t)(self->_ocrFeatureType - 7) < 2;
}

- (BOOL)isTableRow
{
  return self->_featureType == 8 && self->_ocrFeatureType == 9;
}

- (BOOL)isTableColumn
{
  return self->_featureType == 8 && self->_ocrFeatureType == 10;
}

- (BOOL)isTableCell
{
  return self->_featureType == 8 && self->_ocrFeatureType == 11;
}

- (BOOL)isNutritionLabel
{
  return self->_featureType == 8 && self->_ocrFeatureType == 13;
}

- (BOOL)isEnvelope
{
  return self->_featureType == 8 && self->_ocrFeatureType == 14;
}

- (BOOL)isEnvelopeRegion
{
  return self->_featureType == 8 && self->_ocrFeatureType == 15;
}

- (BOOL)isReceipt
{
  return self->_featureType == 8 && self->_ocrFeatureType == 16;
}

- (BOOL)isTextCharacter
{
  return self->_featureType == 8 && self->_ocrFeatureType == 5;
}

- (BOOL)isTextDiacritic
{
  return self->_featureType == 8 && self->_ocrFeatureType == 6;
}

- (BOOL)isMotion
{
  return self->_featureType == 17;
}

- (BOOL)isCameraMetadata
{
  return self->_featureType == 18;
}

- (BOOL)isProminentObject
{
  return self->_featureType == 19;
}

- (BOOL)isIconClass
{
  return self->_featureType == 20;
}

- (BOOL)isImageAesthetics
{
  return self->_featureType == 21;
}

- (BOOL)isMediaAnalysisImageCaption
{
  return self->_featureType == 25;
}

- (BOOL)isMediaAnalysisSceneClassification
{
  return self->_featureType == 26;
}

- (BOOL)isMediaAnalysisObjectClassification
{
  return self->_featureType == 27;
}

- (BOOL)isMediaAnalysisNSFWClassification
{
  return self->_featureType == 29;
}

- (BOOL)isMediaAnalysisSignificantEventlassification
{
  return self->_featureType == 30;
}

- (BOOL)isMediaAnalysisFace
{
  return self->_featureType == 31;
}

- (id)_nameForOCRFeatureType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10) {
    return @"unknown";
  }
  else {
    return *(&off_1E6118AB0 + a3);
  }
}

+ (id)nameForUIClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x13)
  {
    long long v3 = [a1 nameForUIClass:19];
  }
  else
  {
    long long v3 = *(&off_1E6118B38 + a3 - 1);
  }

  return v3;
}

+ (int64_t)uiClassForName:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AXMVisionFeature_uiClassForName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (uiClassForName__onceToken != -1) {
    dispatch_once(&uiClassForName__onceToken, block);
  }
  CGFloat v5 = [(id)uiClassForName___reverseLookup objectForKey:v4];
  id v6 = v5;
  if (v5) {
    int64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    int64_t v7 = 19;
  }

  return v7;
}

void __35__AXMVisionFeature_uiClassForName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v3 = (void *)uiClassForName___reverseLookup;
  uiClassForName___reverseLookup = v2;

  for (uint64_t i = 5; i != 19; ++i)
  {
    CGFloat v5 = (void *)uiClassForName___reverseLookup;
    id v6 = [NSNumber numberWithInteger:i];
    int64_t v7 = [*(id *)(a1 + 32) nameForUIClass:i];
    [v5 setObject:v6 forKey:v7];
  }
}

+ (id)nameForFeatureType:(unint64_t)a3
{
  if (a3 > 0x1F) {
    return 0;
  }
  else {
    return *(&off_1E6118BD0 + a3);
  }
}

+ (id)nameForOCRType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10) {
    return 0;
  }
  else {
    return *(&off_1E6118CD0 + a3);
  }
}

+ (void)_append:(id)a3 toList:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 addObject:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v7 = objc_msgSend(v5, "subfeatures", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        +[AXMVisionFeature _append:*(void *)(*((void *)&v12 + 1) + 8 * v11++) toList:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (id)flattenedFeatureList:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        +[AXMVisionFeature _append:toList:](AXMVisionFeature, "_append:toList:", *(void *)(*((void *)&v11 + 1) + 8 * i), v4, (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CGRect)boundingBoxForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = self;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if ([(AXMVisionFeature *)self featureType] == 8)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obj = v5->_recognizedTextFeatures;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v38 = *(void *)v41;
      *(void *)&long long v11 = 138412546;
      long long v35 = v11;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v38) {
            objc_enumerationMutation(obj);
          }
          long long v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          v50.NSUInteger location = objc_msgSend(v14, "textRange", v35);
          NSUInteger v15 = v50.location;
          v52.NSUInteger location = location;
          v52.NSUInteger length = length;
          if (NSIntersectionRange(v50, v52).length)
          {
            uint64_t v16 = v5;
            uint64_t v17 = [(AXMVisionFeature *)v5 value];
            double v18 = objc_msgSend(v17, "substringWithRange:", location, length);
            unsigned int v19 = [v18 hasSuffix:@","];
            if (length == 1) {
              uint64_t v20 = 0;
            }
            else {
              uint64_t v20 = v19;
            }

            length -= v20;
            if (location) {
              location -= v15;
            }
            else {
              NSUInteger location = 0;
            }
            CGFloat v21 = [v14 text];
            id v39 = 0;
            CGFloat v22 = objc_msgSend(v21, "boundingBoxForRange:error:", location, length, &v39);
            id v23 = v39;

            if (v23)
            {
              uint64_t v24 = AXMediaLogCommon();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                BOOL v36 = [v14 text];
                double v29 = [v36 string];
                v51.NSUInteger location = [v14 textRange];
                double v30 = NSStringFromRange(v51);
                *(_DWORD *)buf = v35;
                CGRect v45 = v29;
                __int16 v46 = 2112;
                uint64_t v47 = v30;
                _os_log_error_impl(&dword_1B57D5000, v24, OS_LOG_TYPE_ERROR, "Failed to find bounding box for text: %@ and range: %@", buf, 0x16u);
              }
            }
            else
            {
              [v22 boundingBox];
              double v6 = v25;
              double v7 = v26;
              double v8 = v27;
              double v9 = v28;
            }
            id v5 = v16;
          }
        }
        uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v12);
    }
  }
  double v31 = v6;
  double v32 = v7;
  double v33 = v8;
  double v34 = v9;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)addFeatureGate:(id)a3 userInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  featureGates = self->_featureGates;
  if (!featureGates)
  {
    double v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = self->_featureGates;
    self->_featureGates = v8;

    featureGates = self->_featureGates;
  }
  if (v6) {
    id v10 = v6;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }
  [(NSMutableDictionary *)featureGates setObject:v10 forKeyedSubscript:v11];
}

- (NSString)debugDescription
{
  id v3 = NSString;
  id v4 = [(AXMVisionFeature *)self description];
  id v5 = [v3 stringWithFormat:@"AXMVisionFeature<%p> %@", self, v4];

  return (NSString *)v5;
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = +[AXMVisionFeature nameForFeatureType:[(AXMVisionFeature *)self featureType]];
  id v5 = [v3 stringWithFormat:@"%@ ", v4];

  switch(self->_featureType)
  {
    case 1uLL:
      [(AXMVisionFeature *)self brightness];
      goto LABEL_9;
    case 2uLL:
      [(AXMVisionFeature *)self blur];
LABEL_9:
      [v5 appendFormat:@"value:'%.2f' ", v18];
      break;
    case 3uLL:
      [(AXMVisionFeature *)self horizonAngle];
      objc_msgSend(v5, "appendFormat:", @"horizon transform. angle: %f ", v19);
      break;
    case 5uLL:
    case 6uLL:
      id v61 = [(AXMVisionFeature *)self faceDetectionResult];
      uint64_t v54 = [v61 faceId];
      v59 = [(AXMVisionFeature *)self faceDetectionResult];
      uint64_t v53 = [v59 name];
      v57 = [(AXMVisionFeature *)self faceDetectionResult];
      uint64_t v48 = [v57 landmarks];
      v56 = [(AXMVisionFeature *)self faceDetectionResult];
      NSRange v50 = [v56 landmarks3d];
      uint64_t v55 = [(AXMVisionFeature *)self faceDetectionResult];
      uint64_t v47 = [v55 expressionsAndConfidence];
      NSRange v51 = [(AXMVisionFeature *)self faceDetectionResult];
      NSRange v52 = [(AXMVisionFeature *)self faceDetectionResult];
      id v6 = objc_msgSend(v51, "descriptionForExpression:", objc_msgSend(v52, "likelyExpression"));
      uint64_t v49 = [(AXMVisionFeature *)self faceDetectionResult];
      double v7 = [(AXMVisionFeature *)self faceDetectionResult];
      objc_msgSend(v49, "confidenceForExpression:", objc_msgSend(v7, "likelyExpression"));
      uint64_t v9 = v8;
      id v10 = [(AXMVisionFeature *)self faceDetectionResult];
      id v11 = [v10 attributes];
      uint64_t v12 = [v11 accessibilityLabelForAttributes];
      long long v13 = +[AXMVisionFeature nameForLocation:[(AXMVisionFeature *)self locationUsingThirds:0 withFlippedYAxis:0]];
      [v5 appendFormat:@"face id: %lu \nName: %@ \n[faceLandmarks: %@ faceLandmarks3d: %@ faceExpressions: %@ likelyExpression: %@ likelyConfidence: %f] \nFace Attributes : %@\nFace location: %@\n", v54, v53, v48, v50, v47, v6, v9, v12, v13];

      break;
    case 8uLL:
      long long v14 = [(AXMVisionFeature *)self value];
      uint64_t v20 = [(AXMVisionFeature *)self _nameForOCRFeatureType:[(AXMVisionFeature *)self ocrFeatureType]];
      goto LABEL_23;
    case 9uLL:
    case 0xAuLL:
      long long v14 = [(AXMVisionFeature *)self classificationLabel];
      NSUInteger v15 = [(AXMVisionFeature *)self classificationLocalizedValue];
      uint64_t v16 = [(AXMVisionFeature *)self sceneClassId];
      uint64_t v17 = [(AXMVisionFeature *)self detectorSceneClassIds];
      [v5 appendFormat:@"classificationLabel:'%@' localizedName:'%@' sceneClassID:'%@' detectorSceneClassIds:'%@' ", v14, v15, v16, v17];

      goto LABEL_24;
    case 0xBuLL:
      long long v14 = [(AXMVisionFeature *)self value];
      uint64_t v20 = [(AXMVisionFeature *)self barcodeType];
LABEL_23:
      NSUInteger v15 = (void *)v20;
      [v5 appendFormat:@"value:'%@' type:%@ ", v14, v20];
      goto LABEL_24;
    case 0xCuLL:
      long long v14 = [(AXMVisionFeature *)self value];
      [v5 appendFormat:@"value:'%@' ", v14, v46];
      goto LABEL_29;
    case 0xDuLL:
      long long v14 = [(AXMVisionFeature *)self assetMetadata];
      [v5 appendFormat:@"asset info [%@] ", v14, v46];
      goto LABEL_29;
    case 0xFuLL:
      modelID = self->_modelID;
      long long v14 = [(AXMVisionFeature *)self classificationLabel];
      [v5 appendFormat:@"ModelID: '%@' classificationLabel: '%@' ", modelID, v14];
      goto LABEL_29;
    case 0x10uLL:
      long long v14 = [(AXMVisionFeature *)self caption];
      NSUInteger v15 = [(AXMVisionFeature *)self translatedCaption];
      [v5 appendFormat:@"caption: '%@' translated: '%@' ", v14, v15];
      goto LABEL_24;
    case 0x11uLL:
      long long v14 = [(AXMVisionFeature *)self deviceMotion];
      [v5 appendFormat:@"deviceMotion: %@", v14, v46];
      goto LABEL_29;
    case 0x12uLL:
      unint64_t v22 = [(AXMVisionFeature *)self cameraType];
      if (v22 > 2) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = (uint64_t)*(&off_1E6118D58 + v22);
      }
      [v5 appendFormat:@"camera: %@", v23];
      break;
    case 0x13uLL:
      long long v14 = +[AXMVisionFeature nameForLocation:[(AXMVisionFeature *)self locationUsingThirds:0 withFlippedYAxis:0]];
      [v5 appendFormat:@"location : %@", v14, v46];
      goto LABEL_29;
    case 0x16uLL:
      double v32 = +[AXMVisionFeature nameForUIClass:[(AXMVisionFeature *)self uiClass]];
      [v5 appendFormat:@"uiClass:%@ ", v32];

      uint64_t v33 = [(AXMVisionFeature *)self value];
      long long v14 = (void *)v33;
      if (v33) {
        [v5 appendFormat:@"value:%@ ", v33, v46];
      }
      goto LABEL_29;
    case 0x17uLL:
    case 0x18uLL:
      long long v14 = [(AXMVisionFeature *)self classificationLabel];
      [v5 appendFormat:@"classificationLabel:'%@' ", v14, v46];
      goto LABEL_29;
    case 0x19uLL:
      if (self->_mediaAnalysisImageCaption)
      {
        [v5 appendFormat:@"\nimage caption : %@", self->_mediaAnalysisImageCaption];
        [v5 appendFormat:@"\nimage caption translated : %@", self->_mediaAnalysisTranslatedImageCaption];
        [v5 appendFormat:@"\nimage caption confidence : %.2f\n", *(void *)&self->_mediaAnalysisImageCaptionConfidence];
      }
      break;
    case 0x1AuLL:
    case 0x1BuLL:
      long long v14 = [(AXMVisionFeature *)self classificationLabel];
      NSUInteger v15 = [(AXMVisionFeature *)self classificationLocalizedValue];
      [v5 appendFormat:@"classificationLabel:'%@' localizedName:'%@'", v14, v15];
LABEL_24:

      goto LABEL_29;
    case 0x1CuLL:
      long long v14 = +[AXMVisionFeature nameForLocation:[(AXMVisionFeature *)self locationUsingThirds:0 withFlippedYAxis:0]];
      [v5 appendFormat:@"media analysis location : %@", v14, v46];
      goto LABEL_29;
    case 0x1DuLL:
    case 0x1EuLL:
      long long v14 = [(AXMVisionFeature *)self classificationLabel];
      [v5 appendFormat:@"classificationLabel:'%@'", v14, v46];
      goto LABEL_29;
    case 0x1FuLL:
      long long v14 = [(AXMVisionFeature *)self mediaAnalysisFaceDetectionResult];
      uint64_t v62 = [v14 faceId];
      id v60 = [v14 name];
      id v58 = [v14 landmarks];
      uint64_t v24 = [v14 landmarks3d];
      double v25 = [v14 expressionsAndConfidence];
      double v26 = objc_msgSend(v14, "descriptionForExpression:", objc_msgSend(v14, "likelyExpression"));
      objc_msgSend(v14, "confidenceForExpression:", objc_msgSend(v14, "likelyExpression"));
      uint64_t v28 = v27;
      double v29 = [v14 attributes];
      double v30 = [v29 accessibilityLabelForAttributes];
      double v31 = +[AXMVisionFeature nameForLocation:[(AXMVisionFeature *)self locationUsingThirds:0 withFlippedYAxis:0]];
      [v5 appendFormat:@"face id: %lu \nName: %@ \n[faceLandmarks: %@ faceLandmarks3d: %@ faceExpressions: %@ likelyExpression: %@ likelyConfidence: %f] \nFace Attributes : %@\nFace location: %@\n", v62, v60, v58, v24, v25, v26, v28, v30, v31];

LABEL_29:
      break;
    default:
      break;
  }
  [(AXMVisionFeature *)self frame];
  if (!CGRectIsEmpty(v64))
  {
    [(AXMVisionFeature *)self frame];
    uint64_t v38 = AXMStringFromCGRect(v34, v35, v36, v37);
    [(AXMVisionFeature *)self normalizedFrame];
    long long v43 = AXMStringFromNormalizedCGRect(v39, v40, v41, v42);
    [v5 appendFormat:@"frame:%@ (normalized:%@) ", v38, v43];
  }
  [(AXMVisionFeature *)self confidence];
  [v5 appendFormat:@"confidence:%.2f lowConfidence:%ld ", v44, -[AXMVisionFeature isLowConfidence](self, "isLowConfidence")];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AXMVisionFeature *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(AXMVisionFeature *)self isEqualToAXMVisionFeature:v4];
  }

  return v5;
}

- (BOOL)isEqualToAXMVisionFeature:(id)a3
{
  id v4 = (char *)a3;
  BOOL v5 = v4;
  if (v4 && self->_featureType == *((void *)v4 + 1) && CGRectEqualToRect(self->_frame, *(CGRect *)(v4 + 56)))
  {
    switch(self->_featureType)
    {
      case 0uLL:
      case 4uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xEuLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
        id v6 = [(AXMVisionFeature *)self value];
        double v7 = [v5 value];
        LOBYTE(self) = [v6 isEqualToString:v7];

        goto LABEL_11;
      case 1uLL:
        double brightness = self->_brightness;
        [v5 brightness];
        goto LABEL_15;
      case 2uLL:
        double brightness = self->_blur;
        [v5 blur];
LABEL_15:
        BOOL v26 = brightness == v25;
        goto LABEL_17;
      case 3uLL:
        float horizonAngle = self->_horizonAngle;
        [v5 horizonAngle];
        BOOL v26 = horizonAngle == v28;
LABEL_17:
        LOBYTE(self) = v26;
        break;
      case 5uLL:
      case 0x1CuLL:
      case 0x1FuLL:
        [(AXMVisionFeature *)self frame];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        [v5 frame];
        LOBYTE(self) = AXMRectApproxEqual(v13, v15, v17, v19, v20, v21, v22, v23);
        break;
      case 9uLL:
      case 0xAuLL:
      case 0xFuLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1DuLL:
      case 0x1EuLL:
        classificationLabel = self->_classificationLabel;
        uint64_t v10 = [v5 classificationLabel];
        goto LABEL_9;
      case 0xDuLL:
        assetMetadata = self->_assetMetadata;
        id v6 = [v5 assetMetadata];
        BOOL v11 = [(AXMVisionFeatureAssetMetadata *)assetMetadata isEqual:v6];
        goto LABEL_10;
      case 0x10uLL:
        classificationLabel = self->_caption;
        uint64_t v10 = [v5 caption];
        goto LABEL_9;
      case 0x19uLL:
        classificationLabel = self->_mediaAnalysisImageCaption;
        uint64_t v10 = [v5 mediaAnalysisImageCaption];
LABEL_9:
        id v6 = (void *)v10;
        BOOL v11 = [(NSString *)classificationLabel isEqualToString:v10];
LABEL_10:
        LOBYTE(self) = v11;
LABEL_11:

        break;
      default:
        break;
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return self & 1;
}

- (unint64_t)hash
{
  unint64_t featureType = self->_featureType;
  NSUInteger v4 = [(NSString *)self->_value hash];
  NSUInteger v5 = [(NSString *)self->_classificationLabel hash];
  NSUInteger v6 = [(NSString *)self->_caption hash];
  int8x16_t v10 = (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_frame.origin);
  int8x16_t v11 = (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_frame.size);
  NSUInteger v7 = [(NSString *)self->_mediaAnalysisImageCaption hash];
  int8x16_t v8 = veorq_s8(v10, v11);
  return *(void *)&veor_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)) ^ v7 ^ v6 ^ v5 ^ v4 ^ featureType;
}

+ (id)filterFeatureList:(id)a3 basedOnSceneClassIdsForFeature:(id)a4
{
  id v5 = a4;
  NSUInteger v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  int8x16_t v8 = [v6 set];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__AXMVisionFeature_filterFeatureList_basedOnSceneClassIdsForFeature___block_invoke;
  v14[3] = &unk_1E6118980;
  id v15 = v5;
  id v9 = v8;
  id v16 = v9;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  int8x16_t v11 = v16;
  id v12 = v9;

  return v12;
}

void __69__AXMVisionFeature_filterFeatureList_basedOnSceneClassIdsForFeature___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 detectorSceneClassIds];
  NSUInteger v4 = [*(id *)(a1 + 32) sceneClassId];
  int v5 = [v3 containsObject:v4];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (BOOL)isMediaAnalysisProminentObject
{
  return self->_isMediaAnalysisProminentObject;
}

- (BOOL)isMediaAnalysisSignificantEventClassification
{
  return self->_isMediaAnalysisSignificantEventClassification;
}

- (NSArray)recognizedTextFeatures
{
  return self->_recognizedTextFeatures;
}

- (NSArray)values
{
  return self->_values;
}

- (int64_t)uiClass
{
  return self->_uiClass;
}

- (void)setUiClass:(int64_t)a3
{
  self->_uiClass = a3;
}

- (CGRect)unpaddedDetectedFaceRect
{
  double x = self->_unpaddedDetectedFaceRect.origin.x;
  double y = self->_unpaddedDetectedFaceRect.origin.y;
  double width = self->_unpaddedDetectedFaceRect.size.width;
  double height = self->_unpaddedDetectedFaceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AXMVisionFeatureAestheticsResult)aestheticsResult
{
  return self->_aestheticsResult;
}

- (CMDeviceMotion)deviceMotion
{
  return self->_deviceMotion;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)cameraType
{
  return self->_cameraType;
}

- (NSSecureCoding)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
}

- (BOOL)captionMayContainSensitiveContent
{
  return self->_captionMayContainSensitiveContent;
}

- (void)setCaptionMayContainSensitiveContent:(BOOL)a3
{
  self->_captionMayContainSensitiveContent = a3;
}

- (CGPoint)activationPoint
{
  double x = self->_activationPoint.x;
  double y = self->_activationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setActivationPoint:(CGPoint)a3
{
  self->_activationPoint = a3;
}

- (NSDictionary)debugRectangles
{
  return self->_debugRectangles;
}

- (void)setDebugRectangles:(id)a3
{
}

- (NSString)overrideLabel
{
  return self->_overrideLabel;
}

- (void)setOverrideLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideLabel, 0);
  objc_storeStrong((id *)&self->_debugRectangles, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
  objc_storeStrong((id *)&self->_deviceMotion, 0);
  objc_storeStrong((id *)&self->_aestheticsResult, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisFaceDetectionResult, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisTranslatedImageCaption, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisImageCaption, 0);
  objc_storeStrong((id *)&self->_sceneClassId, 0);
  objc_storeStrong((id *)&self->_detectorSceneClassIds, 0);
  objc_storeStrong((id *)&self->_featureGates, 0);
  objc_storeStrong((id *)&self->_translatedCaption, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_classificationLocalizedValue, 0);
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_faceDetectionResult, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_colorInfo, 0);
  objc_storeStrong((id *)&self->_recognizedTextFeatures, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_effectiveTextDetectionLocales, 0);
  objc_storeStrong((id *)&self->_barcodeType, 0);

  objc_storeStrong((id *)&self->_subfeatures, 0);
}

+ (id)unitTestingFeatureWithType:(unint64_t)a3 canvasSize:(CGSize)a4 frame:(CGRect)a5 value:(id)a6 barcodeType:(id)a7 ocrFeatureType:(int64_t)a8 subFeatures:(id)a9
{
  return (id)objc_msgSend(a1, "unitTestingFeatureWithType:canvasSize:frame:value:valueIsSpeakable:barcodeType:ocrFeatureType:subFeatures:", a3, a6, 0, a7, a8, a9, a4.width, a4.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (id)unitTestingTeatureWithType:(unint64_t)a3 axElementRect:(CGRect)a4 confidence:(double)a5 uiClass:(int64_t)a6 label:(id)a7 canvasSize:(CGSize)a8
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  CGFloat v12 = a4.size.height;
  CGFloat v13 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v17 = a7;
  double v18 = [[AXMVisionFeature alloc] _init];
  v18[1] = a3;
  *((CGFloat *)v18 + 42) = width;
  *((CGFloat *)v18 + 43) = height;
  *((CGFloat *)v18 + 7) = x;
  *((CGFloat *)v18 + 8) = y;
  *((CGFloat *)v18 + 9) = v13;
  *((CGFloat *)v18 + 10) = v12;
  double v19 = (void *)v18[15];
  v18[15] = v17;

  *((double *)v18 + 23) = a5;
  v18[58] = a6;

  return v18;
}

+ (id)unitTestingFeatureWithType:(unint64_t)a3 canvasSize:(CGSize)a4 frame:(CGRect)a5 value:(id)a6 valueIsSpeakable:(BOOL)a7 barcodeType:(id)a8 ocrFeatureType:(int64_t)a9 subFeatures:(id)a10
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v18 = a4.height;
  CGFloat v19 = a4.width;
  id v21 = a6;
  id v22 = a8;
  id v23 = a10;
  uint64_t v24 = [[AXMVisionFeature alloc] _init];
  v24[1] = a3;
  *((CGFloat *)v24 + 42) = v19;
  *((CGFloat *)v24 + 43) = v18;
  *((CGFloat *)v24 + 7) = x;
  *((CGFloat *)v24 + 8) = y;
  *((CGFloat *)v24 + 9) = width;
  *((CGFloat *)v24 + 10) = height;
  double v25 = (void *)v24[15];
  v24[15] = v21;
  id v26 = v21;

  *((unsigned char *)v24 + 136) = a7;
  uint64_t v27 = (void *)v24[3];
  v24[3] = v22;
  id v28 = v22;

  v24[4] = a9;
  double v29 = (void *)v24[2];
  v24[2] = v23;

  return v24;
}

+ (id)unitTestingFeature
{
  uint64_t v2 = [[AXMVisionFeature alloc] _init];
  int64x2_t v3 = vdupq_n_s64(0x406F400000000000uLL);
  *((void *)v2 + 1) = 0;
  *((int64x2_t *)v2 + 21) = v3;
  *((void *)v2 + 7) = 0;
  *((void *)v2 + 8) = 0;
  *(int64x2_t *)(v2 + 72) = v3;

  return v2;
}

+ (id)unitTestingFaceFeature
{
  return (id)objc_msgSend(a1, "unitTestingFaceFeatureWithSize:faceFrame:", 250.0, 250.0, 0.0, 0.0, 250.0, 250.0);
}

+ (id)unitTestingProminentObjectFeature
{
  uint64_t v2 = [[AXMVisionFeature alloc] _init];
  *((void *)v2 + 1) = 19;
  *((int64x2_t *)v2 + 21) = vdupq_n_s64(0x406F400000000000uLL);
  int64x2_t v3 = vdupq_n_s64(0x3FA47AE147AE147BuLL);
  *(int64x2_t *)(v2 + 56) = v3;
  int64x2_t v4 = vdupq_n_s64(0x3FBEB851EB851EB8uLL);
  *(int64x2_t *)(v2 + 72) = v4;
  *(int64x2_t *)(v2 + 88) = v3;
  *(int64x2_t *)(v2 + 104) = v4;

  return v2;
}

+ (id)unitTestingFaceFeatureWithSize:(CGSize)a3 faceFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  id v10 = [[AXMVisionFeature alloc] _init];
  v10[1] = 5;
  *((double *)v10 + 42) = v9;
  *((double *)v10 + 43) = v8;
  double v11 = x / v9;
  double v12 = y / v8;
  double v13 = width / v9;
  double v14 = height / v8;
  id v15 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
  *((double *)v10 + 7) = v11;
  *((double *)v10 + 8) = v12;
  *((double *)v10 + 9) = v13;
  *((double *)v10 + 10) = v14;
  *((double *)v10 + 11) = v11;
  *((double *)v10 + 12) = v12;
  *((double *)v10 + 13) = v13;
  *((double *)v10 + 14) = v14;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:&unk_1F0E940C0 forKeyedSubscript:@"Smile"];
  [v16 setObject:&unk_1F0E940D0 forKeyedSubscript:@"Disgust"];
  [v16 setObject:&unk_1F0E940E0 forKeyedSubscript:@"Surprise"];
  [v16 setObject:&unk_1F0E940F0 forKeyedSubscript:@"Scream"];
  [v16 setObject:&unk_1F0E94100 forKeyedSubscript:@"Neutral"];
  [v16 setObject:&unk_1F0E940D0 forKeyedSubscript:@"Suspicious"];
  [(AXMVisionFeatureFaceDetectionResult *)v15 setExpressionsAndConfidence:v16];
  id v17 = +[AXMVisionFeatureFaceLandmarks unitTestingFaceLandmarksIs3D:0];
  [(AXMVisionFeatureFaceDetectionResult *)v15 setLandmarks:v17];

  CGFloat v18 = +[AXMVisionFeatureFaceLandmarks unitTestingFaceLandmarksIs3D:1];
  [(AXMVisionFeatureFaceDetectionResult *)v15 setLandmarks3d:v18];

  +[AXMVisionFeatureFaceAttributes unitTestingFaceAttributesForAge:gender:eyes:smiling:facialHair:hairColor:baldness:glasses:eyeMakeup:lipMakeup:faceMask:ethnicity:expression:facialHairV2:hairType:headGear:pose:skinTone:excludeOptions:](AXMVisionFeatureFaceAttributes, "unitTestingFaceAttributesForAge:gender:eyes:smiling:facialHair:hairColor:baldness:glasses:eyeMakeup:lipMakeup:faceMask:ethnicity:expression:facialHairV2:hairType:headGear:pose:skinTone:excludeOptions:", 3, 1, 0, 0, 0, 3, 1, 1, 0, 0, 2, 5, 5, 3, 2, 0,
    2,
    3,
  CGFloat v19 = 1);
  [(AXMVisionFeatureFaceDetectionResult *)v15 setAttributes:v19];

  [(AXMVisionFeatureFaceDetectionResult *)v15 setName:@"Alex"];
  double v20 = (void *)v10[32];
  v10[32] = v15;

  return v10;
}

+ (id)unitTestingHorizonFeature
{
  uint64_t v2 = [[AXMVisionFeature alloc] _init];
  int64x2_t v3 = vdupq_n_s64(0x406F400000000000uLL);
  *((void *)v2 + 1) = 3;
  *((int64x2_t *)v2 + 21) = v3;
  *((void *)v2 + 7) = 0;
  *((void *)v2 + 8) = 0;
  *(int64x2_t *)(v2 + 72) = v3;
  *((_DWORD *)v2 + 62) = 1056964608;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v2 + 200) = _Q0;
  *(_OWORD *)(v2 + 216) = _Q0;
  *(_OWORD *)(v2 + 232) = _Q0;

  return v2;
}

+ (void)featureWithMetadata:interfaceOrientation:isMirrored:canvasSize:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Error: unhandled AVMetadataObject %@", v2, v3, v4, v5, v6);
}

- (void)_serializeWithCoder:orDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Error: %@", v2, v3, v4, v5, v6);
}

- (void)_serializeWithCoder:orDictionary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to archive text recognition data: %@", v2, v3, v4, v5, v6);
}

- (void)_serializeWithCoder:orDictionary:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, v0, v1, "Failed to archive subfeature data: %@", v2, v3, v4, v5, v6);
}

@end