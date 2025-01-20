@interface VNCoreSceneUnderstandingDetectorTaxonomy
+ (id)taxonomyForCSUTaxonomy:(id)a3 vocabularyNames:(id)a4 error:(id *)a5;
- (NSArray)labels;
- (id)_initWithLabels:(id)a3 classificationMetricsForLabelDictionary:(id)a4;
- (id)classificationMetricsForLabel:(id)a3;
- (id)labelsFilteredByDisallowedList:(id)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorTaxonomy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationMetricsForLabelDictionary, 0);

  objc_storeStrong((id *)&self->_labels, 0);
}

- (NSArray)labels
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)classificationMetricsForLabel:(id)a3
{
  v3 = [(NSDictionary *)self->_classificationMetricsForLabelDictionary objectForKey:a3];

  return v3;
}

- (id)labelsFilteredByDisallowedList:(id)a3
{
  id v4 = a3;
  v5 = [(VNCoreSceneUnderstandingDetectorTaxonomy *)self labels];
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__VNCoreSceneUnderstandingDetectorTaxonomy_labelsFilteredByDisallowedList___block_invoke;
    v10[3] = &unk_1E5B1E7D8;
    id v11 = v4;
    v6 = [v5 indexesOfObjectsPassingTest:v10];
    if ([v6 count])
    {
      v7 = (void *)[v5 mutableCopy];
      [v7 removeObjectsAtIndexes:v6];
      uint64_t v8 = [v7 copy];

      v5 = (void *)v8;
    }
  }

  return v5;
}

uint64_t __75__VNCoreSceneUnderstandingDetectorTaxonomy_labelsFilteredByDisallowedList___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsIdentifier:a2];
}

- (id)_initWithLabels:(id)a3 classificationMetricsForLabelDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNCoreSceneUnderstandingDetectorTaxonomy;
  uint64_t v8 = [(VNCoreSceneUnderstandingDetectorTaxonomy *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    labels = v8->_labels;
    v8->_labels = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    classificationMetricsForLabelDictionary = v8->_classificationMetricsForLabelDictionary;
    v8->_classificationMetricsForLabelDictionary = (NSDictionary *)v11;
  }
  return v8;
}

+ (id)taxonomyForCSUTaxonomy:(id)a3 vocabularyNames:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__39_26522;
  v40 = __Block_byref_object_dispose__40_26523;
  id v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__VNCoreSceneUnderstandingDetectorTaxonomy_taxonomyForCSUTaxonomy_vocabularyNames_error___block_invoke;
  aBlock[3] = &unk_1E5B1E7B0;
  id v9 = v19;
  id v27 = v9;
  id v10 = v20;
  id v28 = v10;
  v30 = &v36;
  v31 = &v32;
  id v11 = v8;
  id v29 = v11;
  v12 = _Block_copy(aBlock);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v21;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        [v10 enumerateLabelsInVocabularyNamed:*(void *)(*((void *)&v22 + 1) + 8 * i) usingBlock:v12];
        if (!*((unsigned char *)v33 + 24))
        {
          if (a5) {
            *a5 = (id) v37[5];
          }

          v17 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v42 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  [v9 sortUsingSelector:sel_compare_];
  v17 = (void *)[objc_alloc((Class)a1) _initWithLabels:v9 classificationMetricsForLabelDictionary:v11];
LABEL_13:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v17;
}

void __89__VNCoreSceneUnderstandingDetectorTaxonomy_taxonomyForCSUTaxonomy_vocabularyNames_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) addObject:v5];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  id v11 = 0;
  char v8 = [v6 VNGetClassificationMetrics:&v11 forLabel:v5 error:&obj];
  id v9 = v11;
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    if (v9) {
      [*(id *)(a1 + 48) setObject:v9 forKey:v5];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a3 = 1;
  }
}

@end