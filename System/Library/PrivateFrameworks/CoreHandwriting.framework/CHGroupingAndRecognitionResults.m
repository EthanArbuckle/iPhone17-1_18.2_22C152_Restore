@interface CHGroupingAndRecognitionResults
- (CHGroupingAndRecognitionResults)initWithGroupingResult:(id)a3 recognitionResultsByGroupID:(id)a4 strokeClassificationResult:(id)a5 previousProcessedStrokeGroupingResult:(id)a6 previousProcessedRecognizedResultsByGroupID:(id)a7 strokeGroupReplacements:(id)a8 cachedRecognitionResultsFromPostProcessing:(id)a9;
- (CHStrokeClassificationResult)strokeClassificationResult;
- (CHStrokeGroupingResult)previousProcessedStrokeGroupingResult;
- (CHStrokeGroupingResult)strokeGroupingResult;
- (NSDictionary)cachedRecognitionResultsFromPostProcessing;
- (NSDictionary)previousProcessedRecognizedResultsByGroupID;
- (NSDictionary)recognitionResultsByGroupID;
- (NSSet)strokeGroupReplacements;
- (id)refreshedCachedResultsFromPostProcessing;
@end

@implementation CHGroupingAndRecognitionResults

- (CHGroupingAndRecognitionResults)initWithGroupingResult:(id)a3 recognitionResultsByGroupID:(id)a4 strokeClassificationResult:(id)a5 previousProcessedStrokeGroupingResult:(id)a6 previousProcessedRecognizedResultsByGroupID:(id)a7 strokeGroupReplacements:(id)a8 cachedRecognitionResultsFromPostProcessing:(id)a9
{
  id v60 = a3;
  id v16 = a4;
  id v59 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  id v17 = a9;
  v61.receiver = self;
  v61.super_class = (Class)CHGroupingAndRecognitionResults;
  v18 = [(CHGroupingAndRecognitionResults *)&v61 init];
  p_isa = (id *)&v18->super.isa;
  v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_strokeGroupingResult, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 6, a6);
    objc_storeStrong(p_isa + 7, a7);
    objc_storeStrong(p_isa + 5, a5);
    objc_storeStrong(p_isa + 8, a8);
    v26 = objc_msgSend_strokeGroups(v60, v21, v22, v23, v24, v25);
    uint64_t v32 = objc_msgSend_mutableCopy(v26, v27, v28, v29, v30, v31);
    intermediateStrokeGroups = v20->__intermediateStrokeGroups;
    v20->__intermediateStrokeGroups = (NSMutableSet *)v32;

    uint64_t v39 = objc_msgSend_mutableCopy(v16, v34, v35, v36, v37, v38);
    intermediateRecognitionResults = v20->__intermediateRecognitionResults;
    v20->__intermediateRecognitionResults = (NSMutableDictionary *)v39;

    if (v17)
    {
      uint64_t v46 = objc_msgSend_mutableCopy(v17, v41, v42, v43, v44, v45);
    }
    else
    {
      uint64_t v46 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v41, v42, v43, v44, v45);
    }
    intermediateCachedRecognitionResults = v20->_intermediateCachedRecognitionResults;
    v20->_intermediateCachedRecognitionResults = (NSMutableDictionary *)v46;

    uint64_t v53 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v48, v49, v50, v51, v52);
    refreshedCachedResultsFromPostProcessing = v20->_refreshedCachedResultsFromPostProcessing;
    v20->_refreshedCachedResultsFromPostProcessing = (NSMutableDictionary *)v53;
  }
  return v20;
}

- (NSDictionary)cachedRecognitionResultsFromPostProcessing
{
  v6 = objc_msgSend_copy(self->_intermediateCachedRecognitionResults, a2, v2, v3, v4, v5);
  return (NSDictionary *)v6;
}

- (id)refreshedCachedResultsFromPostProcessing
{
  v6 = objc_msgSend_copy(self->_refreshedCachedResultsFromPostProcessing, a2, v2, v3, v4, v5);
  return v6;
}

- (CHStrokeGroupingResult)strokeGroupingResult
{
  return self->_strokeGroupingResult;
}

- (NSDictionary)recognitionResultsByGroupID
{
  return self->_recognitionResultsByGroupID;
}

- (CHStrokeClassificationResult)strokeClassificationResult
{
  return self->_strokeClassificationResult;
}

- (CHStrokeGroupingResult)previousProcessedStrokeGroupingResult
{
  return self->_previousProcessedStrokeGroupingResult;
}

- (NSDictionary)previousProcessedRecognizedResultsByGroupID
{
  return self->_previousProcessedRecognizedResultsByGroupID;
}

- (NSSet)strokeGroupReplacements
{
  return self->_strokeGroupReplacements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__intermediateRecognitionResults, 0);
  objc_storeStrong((id *)&self->__intermediateStrokeGroups, 0);
  objc_storeStrong((id *)&self->_strokeGroupReplacements, 0);
  objc_storeStrong((id *)&self->_previousProcessedRecognizedResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_previousProcessedStrokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_recognitionResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_strokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_refreshedCachedResultsFromPostProcessing, 0);
  objc_storeStrong((id *)&self->_intermediateCachedRecognitionResults, 0);
}

@end