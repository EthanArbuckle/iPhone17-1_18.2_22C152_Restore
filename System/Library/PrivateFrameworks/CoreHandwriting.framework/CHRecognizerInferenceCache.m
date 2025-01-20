@interface CHRecognizerInferenceCache
- (CHRecognizerInferenceCache)init;
- (id)debugDescription;
- (id)description;
- (id)retrieveActivationMatrixForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 outStrokeIndexMapping:(id *)a5 outStrokeEndings:(id *)a6;
- (void)cacheActivationMatrix:(id)a3 strokeIndexMapping:(id)a4 strokeEndings:(id)a5 drawing:(id)a6 recognitionEngineCachingKey:(id)a7;
- (void)clearCache;
@end

@implementation CHRecognizerInferenceCache

- (CHRecognizerInferenceCache)init
{
  v12.receiver = self;
  v12.super_class = (Class)CHRecognizerInferenceCache;
  v2 = [(CHRecognizerInferenceCache *)&v12 init];
  v3 = v2;
  if (v2)
  {
    lastDrawing = v2->_lastDrawing;
    v2->_lastDrawing = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedActivationMatrices = v3->_cachedActivationMatrices;
    v3->_cachedActivationMatrices = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedStrokeIndexMappings = v3->_cachedStrokeIndexMappings;
    v3->_cachedStrokeIndexMappings = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedStrokeEndings = v3->_cachedStrokeEndings;
    v3->_cachedStrokeEndings = v9;
  }
  return v3;
}

- (void)cacheActivationMatrix:(id)a3 strokeIndexMapping:(id)a4 strokeEndings:(id)a5 drawing:(id)a6 recognitionEngineCachingKey:(id)a7
{
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (CHDrawing *)a6;
  id v18 = a7;
  if (v26 && v13)
  {
    objc_msgSend_setObject_forKeyedSubscript_(self->_cachedActivationMatrices, v15, (uint64_t)v26, (uint64_t)v18, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(self->_cachedStrokeIndexMappings, v19, (uint64_t)v12, (uint64_t)v18, v20, v21);
    objc_msgSend_setObject_forKeyedSubscript_(self->_cachedStrokeEndings, v22, (uint64_t)v13, (uint64_t)v18, v23, v24);
  }
  lastDrawing = self->_lastDrawing;
  self->_lastDrawing = v14;
}

- (id)retrieveActivationMatrixForDrawing:(id)a3 recognitionEngineCachingKey:(id)a4 outStrokeIndexMapping:(id *)a5 outStrokeEndings:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!objc_msgSend_isEqualToDrawing_(v10, v12, (uint64_t)self->_lastDrawing, v13, v14, v15))
  {
    objc_msgSend_clearCache(self, v16, v17, v18, v19, v20);
    v31 = 0;
    id v26 = 0;
    uint64_t v21 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v11)
  {
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(self->_cachedActivationMatrices, v16, (uint64_t)v11, v18, v19, v20);
    id v26 = objc_msgSend_objectForKeyedSubscript_(self->_cachedStrokeIndexMappings, v22, (uint64_t)v11, v23, v24, v25);
    v31 = objc_msgSend_objectForKeyedSubscript_(self->_cachedStrokeEndings, v27, (uint64_t)v11, v28, v29, v30);
    if (!a5) {
      goto LABEL_7;
    }
LABEL_6:
    *a5 = v26;
    goto LABEL_7;
  }
  v31 = 0;
  id v26 = 0;
  uint64_t v21 = 0;
  if (a5) {
    goto LABEL_6;
  }
LABEL_7:
  if (a6) {
    *a6 = v31;
  }
  id v32 = v21;

  return v32;
}

- (void)clearCache
{
  lastDrawing = self->_lastDrawing;
  self->_lastDrawing = 0;

  objc_msgSend_removeAllObjects(self->_cachedActivationMatrices, v4, v5, v6, v7, v8);
  objc_msgSend_removeAllObjects(self->_cachedStrokeIndexMappings, v9, v10, v11, v12, v13);
  cachedStrokeEndings = self->_cachedStrokeEndings;
  objc_msgSend_removeAllObjects(cachedStrokeEndings, v14, v15, v16, v17, v18);
}

- (id)description
{
  uint64_t v7 = objc_msgSend_allKeys(self->_cachedActivationMatrices, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_componentsJoinedByString_(v7, v8, @", ", v9, v10, v11);

  uint64_t v13 = NSString;
  uint64_t v19 = objc_msgSend_description(self->_lastDrawing, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_allKeys(self->_cachedActivationMatrices, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
  v36 = objc_msgSend_stringWithFormat_(v13, v32, @"Inference cache size for drawing [%@]: %lu (%@)", v33, v34, v35, v19, v31, v12);

  return v36;
}

- (id)debugDescription
{
  uint64_t v7 = objc_msgSend_allKeys(self->_cachedActivationMatrices, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_componentsJoinedByString_(v7, v8, @", ", v9, v10, v11);

  uint64_t v13 = NSString;
  uint64_t v19 = objc_msgSend_debugDescription(self->_lastDrawing, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_allKeys(self->_cachedActivationMatrices, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_count(v25, v26, v27, v28, v29, v30);
  v36 = objc_msgSend_stringWithFormat_(v13, v32, @"Inference cache size for drawing [%@]: %lu (%@)", v33, v34, v35, v19, v31, v12);

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStrokeEndings, 0);
  objc_storeStrong((id *)&self->_cachedStrokeIndexMappings, 0);
  objc_storeStrong((id *)&self->_cachedActivationMatrices, 0);
  objc_storeStrong((id *)&self->_lastDrawing, 0);
}

@end