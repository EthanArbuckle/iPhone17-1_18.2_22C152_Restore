@interface CSUSceneNetV5NetworkOutput
- (CSUBuffer)aestheticsAttributeScores;
- (CSUBuffer)aestheticsGlobalScores;
- (CSUBuffer)detectionCoordinateOffsetMap;
- (CSUBuffer)detectionScoreHeatMap;
- (CSUBuffer)entityNetClassificationLikelihoods;
- (CSUBuffer)fingerprintEmbedding;
- (CSUBuffer)saliencyAttentionMap;
- (CSUBuffer)saliencyObjectnessMap;
- (CSUBuffer)sceneClassificationLikelihoods;
- (CSUBuffer)scenePrint;
- (CSUSceneNetV5NetworkOutput)initWithScenePrint:(id)a3 sceneClassificationLikelihoods:(id)a4 aestheticsAttributeScores:(id)a5 aestheticsGlobalScores:(id)a6 detectionScoreHeatMap:(id)a7 detectionCoordinateOffsetMap:(id)a8 saliencyAttentionMap:(id)a9 saliencyObjectnessMap:(id)a10 fingerprintEmbedding:(id)a11 entityNetClassificationLikelihoods:(id)a12;
@end

@implementation CSUSceneNetV5NetworkOutput

- (CSUSceneNetV5NetworkOutput)initWithScenePrint:(id)a3 sceneClassificationLikelihoods:(id)a4 aestheticsAttributeScores:(id)a5 aestheticsGlobalScores:(id)a6 detectionScoreHeatMap:(id)a7 detectionCoordinateOffsetMap:(id)a8 saliencyAttentionMap:(id)a9 saliencyObjectnessMap:(id)a10 fingerprintEmbedding:(id)a11 entityNetClassificationLikelihoods:(id)a12
{
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v25 = a6;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a12;
  v33.receiver = self;
  v33.super_class = (Class)CSUSceneNetV5NetworkOutput;
  v21 = [(CSUSceneNetV5NetworkOutput *)&v33 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_scenePrint, a3);
    objc_storeStrong((id *)&v22->_sceneClassificationLikelihoods, a4);
    objc_storeStrong((id *)&v22->_aestheticsAttributeScores, a5);
    objc_storeStrong((id *)&v22->_aestheticsGlobalScores, v25);
    objc_storeStrong((id *)&v22->_detectionScoreHeatMap, a7);
    objc_storeStrong((id *)&v22->_detectionCoordinateOffsetMap, a8);
    objc_storeStrong((id *)&v22->_saliencyAttentionMap, a9);
    objc_storeStrong((id *)&v22->_saliencyObjectnessMap, a10);
    objc_storeStrong((id *)&v22->_fingerprintEmbedding, a11);
    objc_storeStrong((id *)&v22->_entityNetClassificationLikelihoods, a12);
  }

  return v22;
}

- (CSUBuffer)scenePrint
{
  return (CSUBuffer *)objc_getProperty(self, a2, 8, 1);
}

- (CSUBuffer)sceneClassificationLikelihoods
{
  return (CSUBuffer *)objc_getProperty(self, a2, 16, 1);
}

- (CSUBuffer)aestheticsAttributeScores
{
  return (CSUBuffer *)objc_getProperty(self, a2, 24, 1);
}

- (CSUBuffer)aestheticsGlobalScores
{
  return (CSUBuffer *)objc_getProperty(self, a2, 32, 1);
}

- (CSUBuffer)detectionScoreHeatMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 40, 1);
}

- (CSUBuffer)detectionCoordinateOffsetMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 48, 1);
}

- (CSUBuffer)saliencyAttentionMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 56, 1);
}

- (CSUBuffer)saliencyObjectnessMap
{
  return (CSUBuffer *)objc_getProperty(self, a2, 64, 1);
}

- (CSUBuffer)fingerprintEmbedding
{
  return (CSUBuffer *)objc_getProperty(self, a2, 72, 1);
}

- (CSUBuffer)entityNetClassificationLikelihoods
{
  return (CSUBuffer *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityNetClassificationLikelihoods, 0);
  objc_storeStrong((id *)&self->_fingerprintEmbedding, 0);
  objc_storeStrong((id *)&self->_saliencyObjectnessMap, 0);
  objc_storeStrong((id *)&self->_saliencyAttentionMap, 0);
  objc_storeStrong((id *)&self->_detectionCoordinateOffsetMap, 0);
  objc_storeStrong((id *)&self->_detectionScoreHeatMap, 0);
  objc_storeStrong((id *)&self->_aestheticsGlobalScores, 0);
  objc_storeStrong((id *)&self->_aestheticsAttributeScores, 0);
  objc_storeStrong((id *)&self->_sceneClassificationLikelihoods, 0);
  objc_storeStrong((id *)&self->_scenePrint, 0);
}

@end