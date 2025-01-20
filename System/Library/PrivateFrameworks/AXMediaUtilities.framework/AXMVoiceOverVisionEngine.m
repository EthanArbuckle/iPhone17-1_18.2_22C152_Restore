@interface AXMVoiceOverVisionEngine
- (AXMCaptionDetectorNode)captionDetector;
- (AXMFaceDetectorNode)faceDetector;
- (AXMMediaAnalysisCaptionDetectorNode)madCaptionDetector;
- (AXMMediaAnalysisFaceDetectorNode)madFaceDetector;
- (AXMMediaAnalysisSceneDetectorNode)madSceneDetector;
- (AXMMediaAnalysisTextDetectorNode)madTextDetector;
- (AXMNSFWDetectorNode)nsfwDetector;
- (AXMObjectDetectorNode)objectDetector;
- (AXMProminentObjectsDetectorNode)prominentObjectsDetector;
- (AXMSceneDetectorNode)sceneDetector;
- (AXMSignificantEventDetectorNode)significantEventDetector;
- (AXMTraitDetectorNode)traitDetector;
- (AXMVoiceOverVisionEngine)init;
- (AXMVoiceOverVisionEngine)initWithIdentifier:(id)a3;
- (id)configuredOptionsDisableAllDetectors:(id)a3 elementOptions:(unsigned int)a4 textRecognitionLevel:(id)a5 textDetectionLocales:(id)a6 preferringFullCaptions:(BOOL)a7;
- (unint64_t)genderStrategy;
- (void)setCaptionDetector:(id)a3;
- (void)setFaceDetector:(id)a3;
- (void)setGenderStrategy:(unint64_t)a3;
- (void)setMadCaptionDetector:(id)a3;
- (void)setMadFaceDetector:(id)a3;
- (void)setMadSceneDetector:(id)a3;
- (void)setMadTextDetector:(id)a3;
- (void)setNsfwDetector:(id)a3;
- (void)setObjectDetector:(id)a3;
- (void)setProminentObjectsDetector:(id)a3;
- (void)setSceneDetector:(id)a3;
- (void)setSignificantEventDetector:(id)a3;
- (void)setTraitDetector:(id)a3;
@end

@implementation AXMVoiceOverVisionEngine

- (AXMVoiceOverVisionEngine)init
{
  v17.receiver = self;
  v17.super_class = (Class)AXMVoiceOverVisionEngine;
  v2 = [(AXMAXElementVisionEngine *)&v17 initWithIdentifier:@"VoiceOver"];
  v3 = v2;
  if (v2)
  {
    [(AXMVisionEngine *)v2 enableResultCachingWithCacheSize:10];
    [(AXMVisionEngine *)v3 setMaximumQueueSize:1];
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v4 = [(AXMVisionEngineNode *)[AXMSceneDetectorNode alloc] initWithIdentifier:@"scene"];
      [(AXMSceneDetectorNode *)v4 setTaxonomyOptions:7];
      [(AXMVisionEngine *)v3 addEvaluationNode:v4];
      [(AXMVoiceOverVisionEngine *)v3 setSceneDetector:v4];
    }
    else
    {
      v4 = 0;
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v5 = [(AXMVisionEngineNode *)[AXMObjectDetectorNode alloc] initWithIdentifier:@"object"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v5];
      [(AXMVoiceOverVisionEngine *)v3 setObjectDetector:v5];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v6 = [(AXMVisionEngineNode *)[AXMFaceDetectorNode alloc] initWithIdentifier:@"face"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v6];
      [(AXMVoiceOverVisionEngine *)v3 setFaceDetector:v6];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v7 = [(AXMVisionEngineNode *)[AXMTraitDetectorNode alloc] initWithIdentifier:@"trait"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v7];
      [(AXMVoiceOverVisionEngine *)v3 setTraitDetector:v7];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v8 = [(AXMVisionEngineNode *)[AXMProminentObjectsDetectorNode alloc] initWithIdentifier:@"prominentObjects"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v8];
      [(AXMVoiceOverVisionEngine *)v3 setProminentObjectsDetector:v8];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v9 = [(AXMVisionEngineNode *)[AXMNSFWDetectorNode alloc] initWithIdentifier:@"NSFW"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v9];
      [(AXMVoiceOverVisionEngine *)v3 setNsfwDetector:v9];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v10 = [(AXMVisionEngineNode *)[AXMSignificantEventDetectorNode alloc] initWithIdentifier:@"SignificantEvent"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v10];
      [(AXMVoiceOverVisionEngine *)v3 setSignificantEventDetector:v10];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v11 = [(AXMVisionEngineNode *)[AXMCaptionDetectorNode alloc] initWithIdentifier:@"captions"];
      [(AXMCaptionDetectorNode *)v11 setGenderStrategy:0];
      [(AXMCaptionDetectorNode *)v11 setSceneDetector:v4];
      [(AXMVisionEngine *)v3 addEvaluationNode:v11];
      [(AXMVoiceOverVisionEngine *)v3 setCaptionDetector:v11];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v12 = [(AXMVisionEngineNode *)[AXMMediaAnalysisSceneDetectorNode alloc] initWithIdentifier:@"mad-scene"];
      [(AXMMediaAnalysisSceneDetectorNode *)v12 setTaxonomyOptions:7];
      [(AXMVisionEngine *)v3 addEvaluationNode:v12];
      [(AXMVoiceOverVisionEngine *)v3 setMadSceneDetector:v12];
    }
    else
    {
      v12 = 0;
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v13 = [(AXMVisionEngineNode *)[AXMMediaAnalysisFaceDetectorNode alloc] initWithIdentifier:@"mad-face"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v13];
      [(AXMVoiceOverVisionEngine *)v3 setMadFaceDetector:v13];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v14 = [(AXMVisionEngineNode *)[AXMMediaAnalysisCaptionDetectorNode alloc] initWithIdentifier:@"mad-captions"];
      [(AXMMediaAnalysisCaptionDetectorNode *)v14 setSceneDetector:v12];
      [(AXMVisionEngine *)v3 addEvaluationNode:v14];
      [(AXMVoiceOverVisionEngine *)v3 setMadCaptionDetector:v14];
    }
    if ([(AXMVisionEngine *)v3 canAddEvaluationNodeClass:objc_opt_class()])
    {
      v15 = [(AXMVisionEngineNode *)[AXMMediaAnalysisTextDetectorNode alloc] initWithIdentifier:@"mad-text"];
      [(AXMVisionEngine *)v3 addEvaluationNode:v15];
      [(AXMVoiceOverVisionEngine *)v3 setMadTextDetector:v15];
    }
  }
  return v3;
}

- (AXMVoiceOverVisionEngine)initWithIdentifier:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"use init()"];

  return [(AXMVoiceOverVisionEngine *)self init];
}

- (unint64_t)genderStrategy
{
  v2 = [(AXMVoiceOverVisionEngine *)self captionDetector];
  unint64_t v3 = [v2 genderStrategy];

  return v3;
}

- (void)setGenderStrategy:(unint64_t)a3
{
  id v4 = [(AXMVoiceOverVisionEngine *)self captionDetector];
  [v4 setGenderStrategy:a3];
}

- (id)configuredOptionsDisableAllDetectors:(id)a3 elementOptions:(unsigned int)a4 textRecognitionLevel:(id)a5 textDetectionLocales:(id)a6 preferringFullCaptions:(BOOL)a7
{
  BOOL v7 = a7;
  v11 = (unsigned int (**)(void))a3;
  v12 = (uint64_t (**)(void))a5;
  v13 = (void (**)(void))a6;
  v14 = +[AXMVisionAnalysisOptions voiceOverOptions];
  if (v11 && v11[2](v11))
  {
    [v14 disableAllDetectors];
  }
  else
  {
    [v14 setDetectScenes:1];
    if (v7)
    {
      [v14 setDetectCaptions:1];
      if (AXRuntimeCheck_MediaAnalysisSupport())
      {
        [v14 setDetectMADScenes:1];
        [v14 setDetectMADCaptions:1];
        [v14 setDetectCaptions:0];
        [v14 setDetectScenes:0];
      }
      else
      {
        [v14 setDetectMADCaptions:0];
        [v14 setDetectMADScenes:0];
      }
    }
    else
    {
      [v14 setDetectCaptions:0];
      if (AXRuntimeCheck_MediaAnalysisSupport())
      {
        [v14 setDetectMADScenes:1];
        [v14 setDetectScenes:0];
      }
      else
      {
        [v14 setDetectMADScenes:0];
      }
      [v14 setDetectMADCaptions:0];
    }
    objc_msgSend(v14, "setDetectFaceRectangles:", objc_msgSend(v14, "detectFaceRectangles") & (a4 >> 1));
    objc_msgSend(v14, "setDetectFaceNames:", objc_msgSend(v14, "detectFaceNames") & (a4 >> 2));
    objc_msgSend(v14, "setDetectFaceAttributes:", objc_msgSend(v14, "detectFaceAttributes") & (a4 >> 3));
    objc_msgSend(v14, "setDetectFaceExpressions:", objc_msgSend(v14, "detectFaceExpressions") & (a4 >> 4));
    objc_msgSend(v14, "setDetectFaceLandmarks:", objc_msgSend(v14, "detectFaceLandmarks") & (a4 >> 5));
    objc_msgSend(v14, "setDetectFacePose:", objc_msgSend(v14, "detectFacePose") & (a4 >> 6));
    objc_msgSend(v14, "setDetectText:", a4 & objc_msgSend(v14, "detectText"));
    objc_msgSend(v14, "setDetectTraits:", objc_msgSend(v14, "detectTraits") & (a4 >> 7));
    objc_msgSend(v14, "setDetectScenes:", objc_msgSend(v14, "detectScenes") & (a4 >> 8));
    objc_msgSend(v14, "setDetectObjects:", objc_msgSend(v14, "detectObjects") & (a4 >> 12));
    objc_msgSend(v14, "setDetectCaptions:", objc_msgSend(v14, "detectCaptions") & (a4 >> 11));
    objc_msgSend(v14, "setDetectProminentObjects:", objc_msgSend(v14, "detectProminentObjects") & (a4 >> 10));
    if ([v14 detectText])
    {
      v15 = [v14 textDetectionOptions];
      if (v12) {
        [v15 setRecognitionLevel:v12[2](v12)];
      }
      if (v13)
      {
        v16 = v13[2](v13);
        [v15 setTextDetectionLocales:v16];
      }
    }
  }

  return v14;
}

- (AXMSceneDetectorNode)sceneDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDetector);

  return (AXMSceneDetectorNode *)WeakRetained;
}

- (void)setSceneDetector:(id)a3
{
}

- (AXMObjectDetectorNode)objectDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectDetector);

  return (AXMObjectDetectorNode *)WeakRetained;
}

- (void)setObjectDetector:(id)a3
{
}

- (AXMFaceDetectorNode)faceDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceDetector);

  return (AXMFaceDetectorNode *)WeakRetained;
}

- (void)setFaceDetector:(id)a3
{
}

- (AXMTraitDetectorNode)traitDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_traitDetector);

  return (AXMTraitDetectorNode *)WeakRetained;
}

- (void)setTraitDetector:(id)a3
{
}

- (AXMProminentObjectsDetectorNode)prominentObjectsDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prominentObjectsDetector);

  return (AXMProminentObjectsDetectorNode *)WeakRetained;
}

- (void)setProminentObjectsDetector:(id)a3
{
}

- (AXMCaptionDetectorNode)captionDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captionDetector);

  return (AXMCaptionDetectorNode *)WeakRetained;
}

- (void)setCaptionDetector:(id)a3
{
}

- (AXMNSFWDetectorNode)nsfwDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nsfwDetector);

  return (AXMNSFWDetectorNode *)WeakRetained;
}

- (void)setNsfwDetector:(id)a3
{
}

- (AXMSignificantEventDetectorNode)significantEventDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_significantEventDetector);

  return (AXMSignificantEventDetectorNode *)WeakRetained;
}

- (void)setSignificantEventDetector:(id)a3
{
}

- (AXMMediaAnalysisSceneDetectorNode)madSceneDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_madSceneDetector);

  return (AXMMediaAnalysisSceneDetectorNode *)WeakRetained;
}

- (void)setMadSceneDetector:(id)a3
{
}

- (AXMMediaAnalysisFaceDetectorNode)madFaceDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_madFaceDetector);

  return (AXMMediaAnalysisFaceDetectorNode *)WeakRetained;
}

- (void)setMadFaceDetector:(id)a3
{
}

- (AXMMediaAnalysisTextDetectorNode)madTextDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_madTextDetector);

  return (AXMMediaAnalysisTextDetectorNode *)WeakRetained;
}

- (void)setMadTextDetector:(id)a3
{
}

- (AXMMediaAnalysisCaptionDetectorNode)madCaptionDetector
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_madCaptionDetector);

  return (AXMMediaAnalysisCaptionDetectorNode *)WeakRetained;
}

- (void)setMadCaptionDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_madCaptionDetector);
  objc_destroyWeak((id *)&self->_madTextDetector);
  objc_destroyWeak((id *)&self->_madFaceDetector);
  objc_destroyWeak((id *)&self->_madSceneDetector);
  objc_destroyWeak((id *)&self->_significantEventDetector);
  objc_destroyWeak((id *)&self->_nsfwDetector);
  objc_destroyWeak((id *)&self->_captionDetector);
  objc_destroyWeak((id *)&self->_prominentObjectsDetector);
  objc_destroyWeak((id *)&self->_traitDetector);
  objc_destroyWeak((id *)&self->_faceDetector);
  objc_destroyWeak((id *)&self->_objectDetector);

  objc_destroyWeak((id *)&self->_sceneDetector);
}

@end