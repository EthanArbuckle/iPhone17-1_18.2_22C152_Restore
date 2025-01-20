@interface AXMVisionAnalysisOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
+ (id)voiceOverOptions;
- (AXMBrailleEdgeDetectorOptions)brailleEdgeOptions;
- (AXMTextDetectionOptions)textDetectionOptions;
- (AXMVisionAnalysisOptions)initWithCoder:(id)a3;
- (BOOL)detectAXElements;
- (BOOL)detectAesthetics;
- (BOOL)detectBrailleEdges;
- (BOOL)detectCaptions;
- (BOOL)detectFaceAttributes;
- (BOOL)detectFaceExpressions;
- (BOOL)detectFaceLandmarks;
- (BOOL)detectFaceNames;
- (BOOL)detectFacePose;
- (BOOL)detectFaceRectangles;
- (BOOL)detectFaces;
- (BOOL)detectHorizon;
- (BOOL)detectIconClass;
- (BOOL)detectMADCaptions;
- (BOOL)detectMADFace;
- (BOOL)detectMADScenes;
- (BOOL)detectMADScenesNSFW;
- (BOOL)detectMADScenesSignificantEvents;
- (BOOL)detectMADText;
- (BOOL)detectModelClassifications;
- (BOOL)detectNSFW;
- (BOOL)detectObjects;
- (BOOL)detectProminentObjects;
- (BOOL)detectRectangles;
- (BOOL)detectScenes;
- (BOOL)detectSignificantEvents;
- (BOOL)detectText;
- (BOOL)detectTraits;
- (BOOL)hasDetectionsEnabled;
- (BOOL)includeImageInResult;
- (BOOL)preserveInputImageSize;
- (NSArray)ignoredLayerContextIDs;
- (NSArray)includedLayerContextIDs;
- (NSData)equivalenceToken;
- (NSLocale)preferredOutputLocale;
- (NSNumber)snapshotContextID;
- (NSNumber)snapshotLayerID;
- (id)description;
- (int64_t)clientID;
- (void)disableAllDetectors;
- (void)encodeWithCoder:(id)a3;
- (void)setBrailleEdgeOptions:(id)a3;
- (void)setClientID:(int64_t)a3;
- (void)setDetectAXElements:(BOOL)a3;
- (void)setDetectAesthetics:(BOOL)a3;
- (void)setDetectBrailleEdges:(BOOL)a3;
- (void)setDetectCaptions:(BOOL)a3;
- (void)setDetectFaceAttributes:(BOOL)a3;
- (void)setDetectFaceExpressions:(BOOL)a3;
- (void)setDetectFaceLandmarks:(BOOL)a3;
- (void)setDetectFaceNames:(BOOL)a3;
- (void)setDetectFacePose:(BOOL)a3;
- (void)setDetectFaceRectangles:(BOOL)a3;
- (void)setDetectHorizon:(BOOL)a3;
- (void)setDetectIconClass:(BOOL)a3;
- (void)setDetectMADCaptions:(BOOL)a3;
- (void)setDetectMADFace:(BOOL)a3;
- (void)setDetectMADScenes:(BOOL)a3;
- (void)setDetectMADScenesNSFW:(BOOL)a3;
- (void)setDetectMADScenesSignificantEvents:(BOOL)a3;
- (void)setDetectMADText:(BOOL)a3;
- (void)setDetectModelClassifications:(BOOL)a3;
- (void)setDetectNSFW:(BOOL)a3;
- (void)setDetectObjects:(BOOL)a3;
- (void)setDetectProminentObjects:(BOOL)a3;
- (void)setDetectRectangles:(BOOL)a3;
- (void)setDetectScenes:(BOOL)a3;
- (void)setDetectSignificantEvents:(BOOL)a3;
- (void)setDetectText:(BOOL)a3;
- (void)setDetectTraits:(BOOL)a3;
- (void)setEquivalenceToken:(id)a3;
- (void)setIgnoredLayerContextIDs:(id)a3;
- (void)setIncludeImageInResult:(BOOL)a3;
- (void)setIncludedLayerContextIDs:(id)a3;
- (void)setPreferredOutputLocale:(id)a3;
- (void)setPreserveInputImageSize:(BOOL)a3;
- (void)setSnapshotContextID:(id)a3;
- (void)setSnapshotLayerID:(id)a3;
- (void)setTextDetectionOptions:(id)a3;
@end

@implementation AXMVisionAnalysisOptions

+ (id)defaultOptions
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  [v2 setClientID:0];
  [v2 setIncludeImageInResult:0];
  v3 = +[AXMTextDetectionOptions defaultOptions];
  [v2 setTextDetectionOptions:v3];

  int v4 = AXRuntimeCheck_MediaAnalysisSupport();
  if (v4)
  {
    [v2 setDetectMADCaptions:1];
    [v2 setDetectMADScenes:1];
    [v2 setDetectMADScenesNSFW:1];
    [v2 setDetectMADScenesSignificantEvents:1];
  }
  else
  {
    [v2 setDetectMADCaptions:0];
    [v2 setDetectMADScenes:0];
  }
  uint64_t v5 = v4 ^ 1u;
  [v2 setDetectMADFace:0];
  [v2 setDetectCaptions:v5];
  [v2 setDetectScenes:v5];
  [v2 setDetectObjects:v5];
  [v2 setDetectNSFW:v5];
  [v2 setDetectSignificantEvents:v5];
  [v2 setDetectProminentObjects:0];
  [v2 setDetectMADText:0];
  [v2 setDetectText:1];
  [v2 setDetectTraits:1];
  [v2 setDetectFaceRectangles:0];
  [v2 setDetectFaceNames:0];
  [v2 setDetectFaceAttributes:0];
  [v2 setDetectFaceExpressions:0];
  [v2 setDetectFaceLandmarks:0];
  [v2 setDetectFacePose:0];
  [v2 setDetectProminentObjects:1];
  [v2 setDetectHorizon:1];
  [v2 setDetectRectangles:1];
  [v2 setDetectIconClass:0];
  [v2 setDetectAXElements:0];

  return v2;
}

+ (id)voiceOverOptions
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  [v2 setClientID:1];
  [v2 setIncludeImageInResult:0];
  v3 = +[AXMTextDetectionOptions defaultOptions];
  [v2 setTextDetectionOptions:v3];

  uint64_t v4 = AXRuntimeCheck_MediaAnalysisSupport();
  [v2 setDetectMADCaptions:0];
  [v2 setDetectMADScenes:v4];
  [v2 setDetectMADFace:v4];
  [v2 setDetectCaptions:0];
  [v2 setDetectScenes:v4 ^ 1];
  [v2 setDetectObjects:v4 ^ 1];
  [v2 setDetectFaceRectangles:v4 ^ 1];
  [v2 setDetectFaceNames:v4 ^ 1];
  [v2 setDetectFaceAttributes:v4 ^ 1];
  [v2 setDetectMADText:0];
  [v2 setDetectMADScenesNSFW:0];
  [v2 setDetectMADScenesSignificantEvents:0];
  [v2 setDetectText:1];
  [v2 setDetectModelClassifications:0];
  [v2 setDetectTraits:0];
  [v2 setDetectFaceExpressions:0];
  [v2 setDetectFaceLandmarks:0];
  [v2 setDetectFacePose:0];
  [v2 setDetectProminentObjects:0];
  [v2 setDetectHorizon:0];
  [v2 setDetectRectangles:0];
  [v2 setDetectIconClass:1];

  return v2;
}

- (BOOL)detectFaces
{
  if ([(AXMVisionAnalysisOptions *)self detectFaceRectangles]
    || [(AXMVisionAnalysisOptions *)self detectFaceNames]
    || [(AXMVisionAnalysisOptions *)self detectFaceAttributes]
    || [(AXMVisionAnalysisOptions *)self detectFaceExpressions]
    || [(AXMVisionAnalysisOptions *)self detectFaceLandmarks])
  {
    return 1;
  }

  return [(AXMVisionAnalysisOptions *)self detectFacePose];
}

- (BOOL)hasDetectionsEnabled
{
  if ([(AXMVisionAnalysisOptions *)self detectText]
    || [(AXMVisionAnalysisOptions *)self detectFaceRectangles]
    || [(AXMVisionAnalysisOptions *)self detectFaceNames]
    || [(AXMVisionAnalysisOptions *)self detectFaceAttributes]
    || [(AXMVisionAnalysisOptions *)self detectFaceExpressions]
    || [(AXMVisionAnalysisOptions *)self detectFaceLandmarks]
    || [(AXMVisionAnalysisOptions *)self detectFacePose]
    || [(AXMVisionAnalysisOptions *)self detectScenes]
    || [(AXMVisionAnalysisOptions *)self detectObjects]
    || [(AXMVisionAnalysisOptions *)self detectModelClassifications]
    || [(AXMVisionAnalysisOptions *)self detectCaptions]
    || [(AXMVisionAnalysisOptions *)self detectTraits]
    || [(AXMVisionAnalysisOptions *)self detectRectangles]
    || [(AXMVisionAnalysisOptions *)self detectHorizon]
    || [(AXMVisionAnalysisOptions *)self detectProminentObjects]
    || [(AXMVisionAnalysisOptions *)self detectAesthetics]
    || [(AXMVisionAnalysisOptions *)self detectIconClass]
    || [(AXMVisionAnalysisOptions *)self detectBrailleEdges]
    || [(AXMVisionAnalysisOptions *)self detectAXElements]
    || [(AXMVisionAnalysisOptions *)self detectMADCaptions]
    || [(AXMVisionAnalysisOptions *)self detectMADScenes]
    || [(AXMVisionAnalysisOptions *)self detectMADFace])
  {
    return 1;
  }

  return [(AXMVisionAnalysisOptions *)self detectMADText];
}

- (void)disableAllDetectors
{
  [(AXMVisionAnalysisOptions *)self setDetectText:0];
  [(AXMVisionAnalysisOptions *)self setDetectFaceRectangles:0];
  [(AXMVisionAnalysisOptions *)self setDetectFaceNames:0];
  [(AXMVisionAnalysisOptions *)self setDetectFaceAttributes:0];
  [(AXMVisionAnalysisOptions *)self setDetectFaceExpressions:0];
  [(AXMVisionAnalysisOptions *)self setDetectFaceLandmarks:0];
  [(AXMVisionAnalysisOptions *)self setDetectFacePose:0];
  [(AXMVisionAnalysisOptions *)self setDetectScenes:0];
  [(AXMVisionAnalysisOptions *)self setDetectObjects:0];
  [(AXMVisionAnalysisOptions *)self setDetectModelClassifications:0];
  [(AXMVisionAnalysisOptions *)self setDetectCaptions:0];
  [(AXMVisionAnalysisOptions *)self setDetectTraits:0];
  [(AXMVisionAnalysisOptions *)self setDetectRectangles:0];
  [(AXMVisionAnalysisOptions *)self setDetectHorizon:0];
  [(AXMVisionAnalysisOptions *)self setDetectProminentObjects:0];
  [(AXMVisionAnalysisOptions *)self setDetectAesthetics:0];
  [(AXMVisionAnalysisOptions *)self setDetectIconClass:0];
  [(AXMVisionAnalysisOptions *)self setDetectBrailleEdges:0];
  [(AXMVisionAnalysisOptions *)self setDetectAXElements:0];
  [(AXMVisionAnalysisOptions *)self setPreserveInputImageSize:0];
  [(AXMVisionAnalysisOptions *)self setDetectMADCaptions:0];
  [(AXMVisionAnalysisOptions *)self setDetectMADScenes:0];
  [(AXMVisionAnalysisOptions *)self setDetectMADFace:0];

  [(AXMVisionAnalysisOptions *)self setDetectMADText:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionAnalysisOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AXMVisionAnalysisOptions;
  uint64_t v5 = [(AXMVisionAnalysisOptions *)&v19 init];
  if (v5)
  {
    -[AXMVisionAnalysisOptions setClientID:](v5, "setClientID:", [v4 decodeIntegerForKey:@"clientID"]);
    -[AXMVisionAnalysisOptions setIncludeImageInResult:](v5, "setIncludeImageInResult:", [v4 decodeBoolForKey:@"includeImageInResult"]);
    -[AXMVisionAnalysisOptions setDetectText:](v5, "setDetectText:", [v4 decodeBoolForKey:@"detectText"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textDetectionOptions"];
    [(AXMVisionAnalysisOptions *)v5 setTextDetectionOptions:v6];

    -[AXMVisionAnalysisOptions setDetectScenes:](v5, "setDetectScenes:", [v4 decodeBoolForKey:@"detectScenes"]);
    -[AXMVisionAnalysisOptions setDetectObjects:](v5, "setDetectObjects:", [v4 decodeBoolForKey:@"detectObjects"]);
    -[AXMVisionAnalysisOptions setDetectNSFW:](v5, "setDetectNSFW:", [v4 decodeBoolForKey:@"detectNSFW"]);
    -[AXMVisionAnalysisOptions setDetectSignificantEvents:](v5, "setDetectSignificantEvents:", [v4 decodeBoolForKey:@"detectSignificantEvents"]);
    -[AXMVisionAnalysisOptions setDetectModelClassifications:](v5, "setDetectModelClassifications:", [v4 decodeBoolForKey:@"detectModelClassifications"]);
    -[AXMVisionAnalysisOptions setDetectCaptions:](v5, "setDetectCaptions:", [v4 decodeBoolForKey:@"detectCaptions"]);
    -[AXMVisionAnalysisOptions setDetectTraits:](v5, "setDetectTraits:", [v4 decodeBoolForKey:@"detectTraits"]);
    -[AXMVisionAnalysisOptions setDetectFaceRectangles:](v5, "setDetectFaceRectangles:", [v4 decodeBoolForKey:@"detectFaceRectangles"]);
    -[AXMVisionAnalysisOptions setDetectFaceNames:](v5, "setDetectFaceNames:", [v4 decodeBoolForKey:@"detectFaceNames"]);
    -[AXMVisionAnalysisOptions setDetectFaceAttributes:](v5, "setDetectFaceAttributes:", [v4 decodeBoolForKey:@"detectFaceAttributes"]);
    -[AXMVisionAnalysisOptions setDetectFaceExpressions:](v5, "setDetectFaceExpressions:", [v4 decodeBoolForKey:@"detectFaceExpressions"]);
    -[AXMVisionAnalysisOptions setDetectFaceLandmarks:](v5, "setDetectFaceLandmarks:", [v4 decodeBoolForKey:@"detectFaceLandmarks"]);
    -[AXMVisionAnalysisOptions setDetectFacePose:](v5, "setDetectFacePose:", [v4 decodeBoolForKey:@"detectFacePose"]);
    -[AXMVisionAnalysisOptions setDetectHorizon:](v5, "setDetectHorizon:", [v4 decodeBoolForKey:@"detectHorizon"]);
    -[AXMVisionAnalysisOptions setDetectRectangles:](v5, "setDetectRectangles:", [v4 decodeBoolForKey:@"detectRectangles"]);
    -[AXMVisionAnalysisOptions setDetectProminentObjects:](v5, "setDetectProminentObjects:", [v4 decodeBoolForKey:@"detectProminentObjects"]);
    -[AXMVisionAnalysisOptions setDetectAesthetics:](v5, "setDetectAesthetics:", [v4 decodeBoolForKey:@"detectAesthetics"]);
    -[AXMVisionAnalysisOptions setDetectIconClass:](v5, "setDetectIconClass:", [v4 decodeBoolForKey:@"detectIconClass"]);
    -[AXMVisionAnalysisOptions setDetectBrailleEdges:](v5, "setDetectBrailleEdges:", [v4 decodeBoolForKey:@"detectBrailleEdges"]);
    v7 = AXMSecureCodingClasses();
    v8 = [v4 decodeObjectOfClasses:v7 forKey:@"brailleEdgeOptions"];
    [(AXMVisionAnalysisOptions *)v5 setBrailleEdgeOptions:v8];

    -[AXMVisionAnalysisOptions setDetectAXElements:](v5, "setDetectAXElements:", [v4 decodeBoolForKey:@"detectAXElements"]);
    v9 = AXMSecureCodingClasses();
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"equivalenceToken"];
    [(AXMVisionAnalysisOptions *)v5 setEquivalenceToken:v10];

    v11 = AXMSecureCodingClasses();
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"ignoredLayerContextIDs"];
    [(AXMVisionAnalysisOptions *)v5 setIgnoredLayerContextIDs:v12];

    v13 = AXMSecureCodingClasses();
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"includedLayerContextIDs"];
    [(AXMVisionAnalysisOptions *)v5 setIncludedLayerContextIDs:v14];

    -[AXMVisionAnalysisOptions setPreserveInputImageSize:](v5, "setPreserveInputImageSize:", [v4 decodeBoolForKey:@"preserveInputImageSize"]);
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredOutputLocale"];
    [(AXMVisionAnalysisOptions *)v5 setPreferredOutputLocale:v15];

    -[AXMVisionAnalysisOptions setDetectMADCaptions:](v5, "setDetectMADCaptions:", [v4 decodeBoolForKey:@"detectMADCaptions"]);
    -[AXMVisionAnalysisOptions setDetectMADScenes:](v5, "setDetectMADScenes:", [v4 decodeBoolForKey:@"detectMADScenes"]);
    -[AXMVisionAnalysisOptions setDetectMADFace:](v5, "setDetectMADFace:", [v4 decodeBoolForKey:@"detectMADFace"]);
    -[AXMVisionAnalysisOptions setDetectMADText:](v5, "setDetectMADText:", [v4 decodeBoolForKey:@"detectMADText"]);
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snapshotLayerID"];
    [(AXMVisionAnalysisOptions *)v5 setSnapshotLayerID:v16];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snapshotContextID"];
    [(AXMVisionAnalysisOptions *)v5 setSnapshotContextID:v17];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXMVisionAnalysisOptions clientID](self, "clientID"), @"clientID");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions includeImageInResult](self, "includeImageInResult"), @"includeImageInResult");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectText](self, "detectText"), @"detectText");
  uint64_t v5 = [(AXMVisionAnalysisOptions *)self textDetectionOptions];
  [v4 encodeObject:v5 forKey:@"textDetectionOptions"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectScenes](self, "detectScenes"), @"detectScenes");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectObjects](self, "detectObjects"), @"detectObjects");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectNSFW](self, "detectNSFW"), @"detectNSFW");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectSignificantEvents](self, "detectSignificantEvents"), @"detectSignificantEvents");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectModelClassifications](self, "detectModelClassifications"), @"detectModelClassifications");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectCaptions](self, "detectCaptions"), @"detectCaptions");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectTraits](self, "detectTraits"), @"detectTraits");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceRectangles](self, "detectFaceRectangles"), @"detectFaceRectangles");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceNames](self, "detectFaceNames"), @"detectFaceNames");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceAttributes](self, "detectFaceAttributes"), @"detectFaceAttributes");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceExpressions](self, "detectFaceExpressions"), @"detectFaceExpressions");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFaceLandmarks](self, "detectFaceLandmarks"), @"detectFaceLandmarks");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectFacePose](self, "detectFacePose"), @"detectFacePose");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectHorizon](self, "detectHorizon"), @"detectHorizon");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectRectangles](self, "detectRectangles"), @"detectRectangles");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectProminentObjects](self, "detectProminentObjects"), @"detectProminentObjects");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectAesthetics](self, "detectAesthetics"), @"detectAesthetics");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectIconClass](self, "detectIconClass"), @"detectIconClass");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectBrailleEdges](self, "detectBrailleEdges"), @"detectBrailleEdges");
  v6 = [(AXMVisionAnalysisOptions *)self brailleEdgeOptions];
  [v4 encodeObject:v6 forKey:@"brailleEdgeOptions"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectAXElements](self, "detectAXElements"), @"detectAXElements");
  v7 = [(AXMVisionAnalysisOptions *)self equivalenceToken];
  [v4 encodeObject:v7 forKey:@"equivalenceToken"];

  v8 = [(AXMVisionAnalysisOptions *)self ignoredLayerContextIDs];
  [v4 encodeObject:v8 forKey:@"ignoredLayerContextIDs"];

  v9 = [(AXMVisionAnalysisOptions *)self includedLayerContextIDs];
  [v4 encodeObject:v9 forKey:@"includedLayerContextIDs"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions preserveInputImageSize](self, "preserveInputImageSize"), @"preserveInputImageSize");
  v10 = [(AXMVisionAnalysisOptions *)self preferredOutputLocale];
  [v4 encodeObject:v10 forKey:@"preferredOutputLocale"];

  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADCaptions](self, "detectMADCaptions"), @"detectMADCaptions");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADScenes](self, "detectMADScenes"), @"detectMADScenes");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADFace](self, "detectMADFace"), @"detectMADFace");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXMVisionAnalysisOptions detectMADText](self, "detectMADText"), @"detectMADText");
  v11 = [(AXMVisionAnalysisOptions *)self snapshotLayerID];
  [v4 encodeObject:v11 forKey:@"snapshotLayerID"];

  id v12 = [(AXMVisionAnalysisOptions *)self snapshotContextID];
  [v4 encodeObject:v12 forKey:@"snapshotContextID"];
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMVisionAnalysisOptions<%p>. Client: %ld\n", self, -[AXMVisionAnalysisOptions clientID](self, "clientID"));
  [v3 appendString:@"  Detectors:\n"];
  objc_msgSend(v3, "appendFormat:", @"    Traits: %ld\n", -[AXMVisionAnalysisOptions detectTraits](self, "detectTraits"));
  objc_msgSend(v3, "appendFormat:", @"    Faces: %ld\n", -[AXMVisionAnalysisOptions detectFaces](self, "detectFaces"));
  objc_msgSend(v3, "appendFormat:", @"    Text: %ld\n", -[AXMVisionAnalysisOptions detectText](self, "detectText"));
  objc_msgSend(v3, "appendFormat:", @"    Scenes: %ld\n", -[AXMVisionAnalysisOptions detectScenes](self, "detectScenes"));
  objc_msgSend(v3, "appendFormat:", @"    Objects: %ld\n", -[AXMVisionAnalysisOptions detectObjects](self, "detectObjects"));
  objc_msgSend(v3, "appendFormat:", @"    NSFW: %ld\n", -[AXMVisionAnalysisOptions detectNSFW](self, "detectNSFW"));
  objc_msgSend(v3, "appendFormat:", @"    Significant Events: %ld\n", -[AXMVisionAnalysisOptions detectSignificantEvents](self, "detectSignificantEvents"));
  objc_msgSend(v3, "appendFormat:", @"    Model Classifications: %ld\n", -[AXMVisionAnalysisOptions detectModelClassifications](self, "detectModelClassifications"));
  objc_msgSend(v3, "appendFormat:", @"    Captions: %ld\n", -[AXMVisionAnalysisOptions detectCaptions](self, "detectCaptions"));
  objc_msgSend(v3, "appendFormat:", @"    Prominent Objects: %ld\n", -[AXMVisionAnalysisOptions detectProminentObjects](self, "detectProminentObjects"));
  objc_msgSend(v3, "appendFormat:", @"    Aesthetics: %ld\n", -[AXMVisionAnalysisOptions detectAesthetics](self, "detectAesthetics"));
  objc_msgSend(v3, "appendFormat:", @"    Face names: %ld\n", -[AXMVisionAnalysisOptions detectFaceNames](self, "detectFaceNames"));
  objc_msgSend(v3, "appendFormat:", @"    Face rectangles : %ld\n", -[AXMVisionAnalysisOptions detectFaceRectangles](self, "detectFaceRectangles"));
  objc_msgSend(v3, "appendFormat:", @"    Face attributes : %ld\n", -[AXMVisionAnalysisOptions detectFaceAttributes](self, "detectFaceAttributes"));
  objc_msgSend(v3, "appendFormat:", @"    Icon Classifications: %ld\n", -[AXMVisionAnalysisOptions detectIconClass](self, "detectIconClass"));
  objc_msgSend(v3, "appendFormat:", @"    Braille Edges: %ld\n", -[AXMVisionAnalysisOptions detectBrailleEdges](self, "detectBrailleEdges"));
  objc_msgSend(v3, "appendFormat:", @"    AXElement Detection: %ld\n", -[AXMVisionAnalysisOptions detectAXElements](self, "detectAXElements"));
  objc_msgSend(v3, "appendFormat:", @"  Preserve Input Image Size: %ld\n", -[AXMVisionAnalysisOptions preserveInputImageSize](self, "preserveInputImageSize"));
  id v4 = [(AXMVisionAnalysisOptions *)self preferredOutputLocale];
  uint64_t v5 = [v4 localeIdentifier];
  [v3 appendFormat:@"  Preferred Output Locale: %@\n", v5];

  objc_msgSend(v3, "appendFormat:", @"  (MAD) Captions: %ld\n", -[AXMVisionAnalysisOptions detectMADCaptions](self, "detectMADCaptions"));
  objc_msgSend(v3, "appendFormat:", @"  (MAD) Scenes: %ld\n", -[AXMVisionAnalysisOptions detectMADScenes](self, "detectMADScenes"));
  objc_msgSend(v3, "appendFormat:", @"  (MAD) Faces: %ld\n", -[AXMVisionAnalysisOptions detectMADFace](self, "detectMADFace"));
  objc_msgSend(v3, "appendFormat:", @"  (MAD) OCR: %ld\n", -[AXMVisionAnalysisOptions detectMADText](self, "detectMADText"));
  v6 = [(AXMVisionAnalysisOptions *)self textDetectionOptions];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 description];
    [v3 appendString:v8];
  }

  return v3;
}

- (int64_t)clientID
{
  return self->_clientID;
}

- (void)setClientID:(int64_t)a3
{
  self->_clientID = a3;
}

- (BOOL)detectFaceRectangles
{
  return self->_detectFaceRectangles;
}

- (void)setDetectFaceRectangles:(BOOL)a3
{
  self->_detectFaceRectangles = a3;
}

- (BOOL)detectFaceNames
{
  return self->_detectFaceNames;
}

- (void)setDetectFaceNames:(BOOL)a3
{
  self->_detectFaceNames = a3;
}

- (BOOL)detectFaceAttributes
{
  return self->_detectFaceAttributes;
}

- (void)setDetectFaceAttributes:(BOOL)a3
{
  self->_detectFaceAttributes = a3;
}

- (BOOL)detectFaceExpressions
{
  return self->_detectFaceExpressions;
}

- (void)setDetectFaceExpressions:(BOOL)a3
{
  self->_detectFaceExpressions = a3;
}

- (BOOL)detectFaceLandmarks
{
  return self->_detectFaceLandmarks;
}

- (void)setDetectFaceLandmarks:(BOOL)a3
{
  self->_detectFaceLandmarks = a3;
}

- (BOOL)detectFacePose
{
  return self->_detectFacePose;
}

- (void)setDetectFacePose:(BOOL)a3
{
  self->_detectFacePose = a3;
}

- (BOOL)detectScenes
{
  return self->_detectScenes;
}

- (void)setDetectScenes:(BOOL)a3
{
  self->_detectScenes = a3;
}

- (BOOL)detectObjects
{
  return self->_detectObjects;
}

- (void)setDetectObjects:(BOOL)a3
{
  self->_detectObjects = a3;
}

- (BOOL)detectNSFW
{
  return self->_detectNSFW;
}

- (void)setDetectNSFW:(BOOL)a3
{
  self->_detectNSFW = a3;
}

- (BOOL)detectSignificantEvents
{
  return self->_detectSignificantEvents;
}

- (void)setDetectSignificantEvents:(BOOL)a3
{
  self->_detectSignificantEvents = a3;
}

- (BOOL)detectModelClassifications
{
  return self->_detectModelClassifications;
}

- (void)setDetectModelClassifications:(BOOL)a3
{
  self->_detectModelClassifications = a3;
}

- (BOOL)detectCaptions
{
  return self->_detectCaptions;
}

- (void)setDetectCaptions:(BOOL)a3
{
  self->_detectCaptions = a3;
}

- (BOOL)detectTraits
{
  return self->_detectTraits;
}

- (void)setDetectTraits:(BOOL)a3
{
  self->_detectTraits = a3;
}

- (BOOL)detectRectangles
{
  return self->_detectRectangles;
}

- (void)setDetectRectangles:(BOOL)a3
{
  self->_detectRectangles = a3;
}

- (BOOL)detectHorizon
{
  return self->_detectHorizon;
}

- (void)setDetectHorizon:(BOOL)a3
{
  self->_detectHorizon = a3;
}

- (BOOL)detectProminentObjects
{
  return self->_detectProminentObjects;
}

- (void)setDetectProminentObjects:(BOOL)a3
{
  self->_detectProminentObjects = a3;
}

- (BOOL)detectAesthetics
{
  return self->_detectAesthetics;
}

- (void)setDetectAesthetics:(BOOL)a3
{
  self->_detectAesthetics = a3;
}

- (BOOL)detectIconClass
{
  return self->_detectIconClass;
}

- (void)setDetectIconClass:(BOOL)a3
{
  self->_detectIconClass = a3;
}

- (BOOL)detectBrailleEdges
{
  return self->_detectBrailleEdges;
}

- (void)setDetectBrailleEdges:(BOOL)a3
{
  self->_detectBrailleEdges = a3;
}

- (AXMBrailleEdgeDetectorOptions)brailleEdgeOptions
{
  return self->_brailleEdgeOptions;
}

- (void)setBrailleEdgeOptions:(id)a3
{
}

- (BOOL)detectAXElements
{
  return self->_detectAXElements;
}

- (void)setDetectAXElements:(BOOL)a3
{
  self->_detectAXElements = a3;
}

- (NSData)equivalenceToken
{
  return self->_equivalenceToken;
}

- (void)setEquivalenceToken:(id)a3
{
}

- (BOOL)detectMADCaptions
{
  return self->_detectMADCaptions;
}

- (void)setDetectMADCaptions:(BOOL)a3
{
  self->_detectMADCaptions = a3;
}

- (BOOL)detectMADScenes
{
  return self->_detectMADScenes;
}

- (void)setDetectMADScenes:(BOOL)a3
{
  self->_detectMADScenes = a3;
}

- (BOOL)detectMADScenesNSFW
{
  return self->_detectMADScenesNSFW;
}

- (void)setDetectMADScenesNSFW:(BOOL)a3
{
  self->_detectMADScenesNSFW = a3;
}

- (BOOL)detectMADScenesSignificantEvents
{
  return self->_detectMADScenesSignificantEvents;
}

- (void)setDetectMADScenesSignificantEvents:(BOOL)a3
{
  self->_detectMADScenesSignificantEvents = a3;
}

- (BOOL)detectMADFace
{
  return self->_detectMADFace;
}

- (void)setDetectMADFace:(BOOL)a3
{
  self->_detectMADFace = a3;
}

- (BOOL)detectMADText
{
  return self->_detectMADText;
}

- (void)setDetectMADText:(BOOL)a3
{
  self->_detectMADText = a3;
}

- (BOOL)detectText
{
  return self->_detectText;
}

- (void)setDetectText:(BOOL)a3
{
  self->_detectText = a3;
}

- (AXMTextDetectionOptions)textDetectionOptions
{
  return self->_textDetectionOptions;
}

- (void)setTextDetectionOptions:(id)a3
{
}

- (BOOL)includeImageInResult
{
  return self->_includeImageInResult;
}

- (void)setIncludeImageInResult:(BOOL)a3
{
  self->_includeImageInResult = a3;
}

- (NSLocale)preferredOutputLocale
{
  return self->_preferredOutputLocale;
}

- (void)setPreferredOutputLocale:(id)a3
{
}

- (NSArray)ignoredLayerContextIDs
{
  return self->_ignoredLayerContextIDs;
}

- (void)setIgnoredLayerContextIDs:(id)a3
{
}

- (NSArray)includedLayerContextIDs
{
  return self->_includedLayerContextIDs;
}

- (void)setIncludedLayerContextIDs:(id)a3
{
}

- (NSNumber)snapshotLayerID
{
  return self->_snapshotLayerID;
}

- (void)setSnapshotLayerID:(id)a3
{
}

- (NSNumber)snapshotContextID
{
  return self->_snapshotContextID;
}

- (void)setSnapshotContextID:(id)a3
{
}

- (BOOL)preserveInputImageSize
{
  return self->_preserveInputImageSize;
}

- (void)setPreserveInputImageSize:(BOOL)a3
{
  self->_preserveInputImageSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotContextID, 0);
  objc_storeStrong((id *)&self->_snapshotLayerID, 0);
  objc_storeStrong((id *)&self->_includedLayerContextIDs, 0);
  objc_storeStrong((id *)&self->_ignoredLayerContextIDs, 0);
  objc_storeStrong((id *)&self->_preferredOutputLocale, 0);
  objc_storeStrong((id *)&self->_textDetectionOptions, 0);
  objc_storeStrong((id *)&self->_equivalenceToken, 0);

  objc_storeStrong((id *)&self->_brailleEdgeOptions, 0);
}

@end