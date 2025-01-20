@interface MARelationCollectionFeatureExtractor
- (MAIndexCache)featureNameIndexCache;
- (MARelation)relation;
- (MARelationCollectionFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForEmptyRelation:(id)a6 labelForTargetBlock:(id)a7;
- (MARelationCollectionFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6;
- (NSString)labelForEmptyRelation;
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)labelForTargetBlock;
- (id)name;
@end

@implementation MARelationCollectionFeatureExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelForEmptyRelation, 0);
  objc_storeStrong(&self->_labelForTargetBlock, 0);
  objc_storeStrong((id *)&self->_relation, 0);
  objc_storeStrong((id *)&self->_featureNameIndexCache, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)labelForEmptyRelation
{
  return self->_labelForEmptyRelation;
}

- (id)labelForTargetBlock
{
  return self->_labelForTargetBlock;
}

- (MARelation)relation
{
  return self->_relation;
}

- (MAIndexCache)featureNameIndexCache
{
  return self->_featureNameIndexCache;
}

- (id)name
{
  return self->_name;
}

- (id)featureNames
{
  return [(MAIndexCache *)self->_featureNameIndexCache labels];
}

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v35 = a4;
  v33 = v8;
  if (![v35 isCancelledWithProgress:0.0])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(v11);
          }
          [v10 addObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v12);
    }

    uint64_t v38 = [v10 count];
    v15 = [(MARelationCollectionFeatureExtractor *)self featureNames];
    uint64_t v36 = [v15 count];

    id v16 = +[MAFloatMatrix zerosWithRows:v38 columns:v36];
    v17 = [v10 firstObject];
    v32 = [v17 graph];

    if (!v32)
    {
      id v16 = v16;
      v9 = v16;
LABEL_46:

      goto LABEL_47;
    }
    *(void *)buf = 0;
    *(void *)&long long v60 = buf;
    *((void *)&v60 + 1) = 0x2020000000;
    uint64_t v61 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v10;
    uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v18)
    {
      uint64_t v20 = 0;
      char v37 = 0;
      uint64_t v40 = *(void *)v47;
      v21 = MEMORY[0x1E4F14500];
      *(void *)&long long v19 = 67109378;
      long long v31 = v19;
LABEL_15:
      uint64_t v39 = v18;
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(obj);
        }
        v23 = +[MANodeCollection nodesRelatedToNodes:withRelation:](MANodeCollection, "nodesRelatedToNodes:withRelation:", *(void *)(*((void *)&v46 + 1) + 8 * v22), self->_relation, v31);
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __87__MARelationCollectionFeatureExtractor_floatMatrixWithEntities_progressReporter_error___block_invoke;
        v41[3] = &unk_1E68DACC8;
        v41[4] = self;
        v43 = buf;
        v44 = a5;
        id v16 = v16;
        id v42 = v16;
        uint64_t v45 = v20;
        [v23 enumerateNodesUsingBlock:v41];
        if (*a5)
        {
          uint64_t v24 = +[MAFloatMatrix zerosWithRows:v38 columns:v36];

          int v25 = 0;
          int v26 = 6;
          id v16 = (id)v24;
        }
        else
        {
          if (![v23 count])
          {
            if (self->_labelForEmptyRelation)
            {
              v27 = [(MARelationCollectionFeatureExtractor *)self featureNameIndexCache];
              uint64_t v28 = [v27 indexOfLabel:self->_labelForEmptyRelation];
              *(void *)(v60 + 24) = v28;

              v21 = MEMORY[0x1E4F14500];
              if (*(void *)(v60 + 24) != 0x7FFFFFFFFFFFFFFFLL)
              {
                LODWORD(v29) = 1.0;
                objc_msgSend(v16, "setFloat:atRow:column:", v20, v29);
              }
            }
          }
          ++v20;
          if ((v37 & 1) != 0 || [v35 isCancelledWithProgress:(double)v20 / (double)v38])
          {
            int v26 = 1;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v54 = v31;
              int v55 = 122;
              __int16 v56 = 2080;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/photoanalysis/PhotosGraph/Modules/Matisse/Fr"
                    "amework/Learning/Feature Extraction/MARelationFeatureExtractor.m";
              _os_log_impl(&dword_1D1654000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v54, 0x12u);
            }
            int v25 = 0;
            char v37 = 1;
          }
          else
          {
            int v26 = 0;
            char v37 = 0;
            int v25 = 1;
          }
        }

        if (!v25) {
          break;
        }
        ++v22;
        v21 = MEMORY[0x1E4F14500];
        if (v39 == v22)
        {
          uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
          if (v18) {
            goto LABEL_15;
          }

          goto LABEL_36;
        }
      }

      if (v26 != 6 && v26) {
        goto LABEL_43;
      }
LABEL_36:
      if ((v37 & 1) == 0) {
        goto LABEL_40;
      }
    }
    else
    {

LABEL_40:
      if (![v35 isCancelledWithProgress:1.0])
      {
        id v16 = v16;
        v9 = v16;
LABEL_45:
        _Block_object_dispose(buf, 8);
        goto LABEL_46;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v54 = 67109378;
      int v55 = 125;
      __int16 v56 = 2080;
      v57 = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/photoanalysis/PhotosGraph/Modules/Matisse/Framework/"
            "Learning/Feature Extraction/MARelationFeatureExtractor.m";
      _os_log_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v54, 0x12u);
    }
LABEL_43:
    v9 = 0;
    goto LABEL_45;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 66;
    LOWORD(v60) = 2080;
    *(void *)((char *)&v60 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/photoanalysis/PhotosGraph/Mo"
                                    "dules/Matisse/Framework/Learning/Feature Extraction/MARelationFeatureExtractor.m";
    _os_log_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v9 = 0;
LABEL_47:

  return v9;
}

void __87__MARelationCollectionFeatureExtractor_floatMatrixWithEntities_progressReporter_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 labelForTargetBlock];
  ((void (**)(void, id, void))v7)[2](v7, v6, *(void *)(a1 + 56));
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (**(void **)(a1 + 56))
  {
    *a3 = 1;
LABEL_3:
    id v8 = v11;
    goto LABEL_4;
  }
  id v8 = v11;
  if (v11)
  {
    v9 = [*(id *)(a1 + 32) featureNameIndexCache];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 indexOfLabel:v11];

    id v8 = v11;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      LODWORD(v10) = 1.0;
      objc_msgSend(*(id *)(a1 + 40), "setFloat:atRow:column:", *(void *)(a1 + 64), v10);
      goto LABEL_3;
    }
  }
LABEL_4:
}

- (MARelationCollectionFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForEmptyRelation:(id)a6 labelForTargetBlock:(id)a7
{
  id v13 = a6;
  v14 = [(MARelationCollectionFeatureExtractor *)self initWithName:a3 featureNames:a4 relation:a5 labelForTargetBlock:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_labelForEmptyRelation, a6);
  }

  return v15;
}

- (MARelationCollectionFeatureExtractor)initWithName:(id)a3 featureNames:(id)a4 relation:(id)a5 labelForTargetBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MARelationCollectionFeatureExtractor;
  v15 = [(MARelationCollectionFeatureExtractor *)&v23 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v17 = [[MAIndexCache alloc] initWithLabels:v12];
    featureNameIndexCache = v16->_featureNameIndexCache;
    v16->_featureNameIndexCache = v17;

    objc_storeStrong((id *)&v16->_relation, a5);
    long long v19 = _Block_copy(v14);
    id labelForTargetBlock = v16->_labelForTargetBlock;
    v16->_id labelForTargetBlock = v19;

    labelForEmptyRelation = v16->_labelForEmptyRelation;
    v16->_labelForEmptyRelation = 0;
  }
  return v16;
}

@end