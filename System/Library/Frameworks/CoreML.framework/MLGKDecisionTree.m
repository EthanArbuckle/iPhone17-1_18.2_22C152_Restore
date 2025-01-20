@interface MLGKDecisionTree
- (BOOL)_saveModelAssetWithModelToPath:(id)a3 withError:(id)a4;
- (NSMutableArray)_attributes;
- (NSMutableOrderedSet)_objectStore;
- (id)_init;
- (id)_initWithFlattenedTree:(id)a3;
- (id)_makeInferenceFromAnswers:(id)a3 withError:(id)a4;
- (void)_loadModelAssetWithModelAtPath:(id)a3 withError:(id)a4;
- (void)dealloc;
- (void)set_attributes:(id)a3;
- (void)set_objectStore:(id)a3;
@end

@implementation MLGKDecisionTree

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__objectStore, 0);
  objc_storeStrong((id *)&self->__attributes, 0);

  objc_storeStrong((id *)&self->_treeClassifier, 0);
}

- (void)set_objectStore:(id)a3
{
}

- (NSMutableOrderedSet)_objectStore
{
  return self->__objectStore;
}

- (void)set_attributes:(id)a3
{
}

- (NSMutableArray)_attributes
{
  return self->__attributes;
}

- (void)dealloc
{
  trc = self->_trc;
  if (trc) {
    (*(void (**)(void *, SEL))(*(void *)trc + 8))(trc, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)MLGKDecisionTree;
  [(MLGKDecisionTree *)&v4 dealloc];
}

- (id)_makeInferenceFromAnswers:(id)a3 withError:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a4;
  v36 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v6 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        v11 = [v6 objectForKeyedSubscript:v10];
        v12 = [v6 objectForKeyedSubscript:v10];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v14 = v11;
          [v14 doubleValue];
          v15 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v36 setObject:v15 forKeyedSubscript:v10];
        }
        else
        {
          v16 = [(MLGKDecisionTree *)self _objectStore];
          [v16 addObject:v11];

          v17 = [(MLGKDecisionTree *)self _objectStore];
          uint64_t v18 = [v17 indexOfObject:v11];

          v19 = [NSNumber numberWithUnsignedInteger:v18];
          [v19 doubleValue];
          double v21 = v20;

          id v14 = [NSNumber numberWithDouble:v21];
          [v36 setObject:v14 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v7);
  }

  id v38 = v34;
  v22 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v36 error:&v38];
  id v23 = v38;

  treeClassifier = self->_treeClassifier;
  v25 = +[MLPredictionOptions defaultOptions];
  id v37 = v23;
  v26 = [(MLTreeEnsembleClassifier *)treeClassifier classify:v22 options:v25 error:&v37];
  id v27 = v37;

  v28 = NSNumber;
  v29 = [v26 predictedClass];
  v30 = objc_msgSend(v28, "numberWithLongLong:", objc_msgSend(v29, "int64Value"));

  v31 = [(MLGKDecisionTree *)self _objectStore];
  v32 = objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v30, "unsignedIntegerValue"));

  return v32;
}

- (void)_loadModelAssetWithModelAtPath:(id)a3 withError:(id)a4
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26 = [v6 URLByAppendingPathComponent:@"model.pb"];
  id v27 = [v6 URLByAppendingPathComponent:@"model.mlmodelc"];
  uint64_t v8 = +[MLCompilerOptions defaultOptions];
  id v32 = v7;
  v9 = +[MLCompiler compileSpecificationAtURL:v26 toURL:v6 options:v8 error:&v32];
  id v10 = v32;

  if (v9)
  {
    id v31 = v10;
    v11 = +[MLModelAsset modelAssetWithURL:v27 error:&v31];
    id v12 = v31;

    if (v11)
    {
      v13 = +[MLModelConfiguration defaultConfiguration];
      id v30 = v12;
      v25 = [v11 modelWithConfiguration:v13 error:&v30];
      id v10 = v30;

      if (v25)
      {
        v22 = [v25 classifier];
        objc_storeStrong((id *)&self->_treeClassifier, v22);
        v24 = [v6 URLByAppendingPathComponent:@"attributes.gk"];
        id v29 = v10;
        id v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v24 options:2 error:&v29];
        id v14 = v29;

        v15 = (void *)MEMORY[0x1E4F28DC0];
        v16 = (void *)MEMORY[0x1E4F1CAD0];
        v33[0] = objc_opt_class();
        v33[1] = objc_opt_class();
        v33[2] = objc_opt_class();
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
        uint64_t v18 = [v16 setWithArray:v17];
        id v28 = v14;
        v19 = [v15 unarchivedObjectOfClasses:v18 fromData:v23 error:&v28];
        id v10 = v28;

        double v20 = [v19 objectAtIndexedSubscript:0];
        [(MLGKDecisionTree *)self set_attributes:v20];

        double v21 = [v19 objectAtIndexedSubscript:1];
        [(MLGKDecisionTree *)self set_objectStore:v21];
      }
    }
    else
    {
      id v10 = v12;
    }
  }
}

- (BOOL)_saveModelAssetWithModelToPath:(id)a3 withError:(id)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v30 = v7;
  [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v9 = v30;

  id v10 = [v6 URLByAppendingPathComponent:@"model.pb"];
  trc = self->_trc;
  id v12 = v10;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 fileSystemRepresentation]);
  CoreML::Model::save((uint64_t)&v27, (uint64_t)trc);
  if (v26 < 0) {
    operator delete(__p);
  }
  v13 = [v6 URLByAppendingPathComponent:@"attributes.gk"];
  id v14 = (void *)MEMORY[0x1E4F28DB0];
  v15 = [(MLGKDecisionTree *)self _attributes];
  v31[0] = v15;
  v16 = [(MLGKDecisionTree *)self _objectStore];
  v31[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  id v24 = v9;
  uint64_t v18 = [v14 archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v24];
  id v19 = v24;

  id v23 = v19;
  [v18 writeToURL:v13 options:1 error:&v23];
  id v20 = v23;

  int v21 = v27;
  if (v29 < 0) {
    operator delete(v28);
  }

  return (v21 & 0xFFFFFFEF) == 0;
}

- (id)_initWithFlattenedTree:(id)a3
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v109 = a3;
  objc_super v4 = [(MLGKDecisionTree *)self _init];
  v124 = v4;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v4, "set_attributes:", v5);

    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v109, "count"));
    objc_msgSend(v4, "set_objectStore:", v6);

    uint64_t v7 = v4[1];
    std::string::basic_string[abi:ne180100]<0>(&v150, "action");
    CoreML::FeatureType::FeatureType(&v148, 1);
    (*(void (**)(void **__return_ptr, uint64_t, void **, CoreML::Specification::FeatureType **))(*(void *)v7 + 24))(v153, v7, &v150, &v148);
    if (v154 < 0) {
      operator delete(v153[1]);
    }
    if (v149) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v149);
    }
    if (v152 < 0) {
      operator delete(v150);
    }
    uint64_t v8 = v4[1];
    std::string::basic_string[abi:ne180100]<0>(&v150, "probabilities");
    CoreML::FeatureType::FeatureType(&v144, 6);
    id v9 = v144;
    if (*((_DWORD *)v144 + 9) != 6)
    {
      CoreML::Specification::FeatureType::clear_Type((uint64_t)v144);
      *((_DWORD *)v9 + 9) = 6;
      operator new();
    }
    uint64_t v10 = *((void *)v144 + 3);
    if (*(_DWORD *)(v10 + 28) != 1)
    {
      CoreML::Specification::MILSpec::Dimension::clear_dimension(v10);
      *(_DWORD *)(v10 + 28) = 1;
      operator new();
    }
    (*(void (**)(void **__return_ptr, uint64_t, void **, CoreML::Specification::FeatureType **))(*(void *)v8 + 24))(v146, v8, &v150, &v144);
    if (v147 < 0) {
      operator delete(v146[1]);
    }
    if (v145) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v145);
    }
    if (v152 < 0) {
      operator delete(v150);
    }
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id obj = v109;
    uint64_t v11 = [obj countByEnumeratingWithState:&v140 objects:v157 count:16];
    if (v11)
    {
      v119 = 0;
      unint64_t v120 = 0;
      v117 = 0;
      v118 = 0;
      v122 = 0;
      id v12 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v141;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v141 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v140 + 1) + 8 * i);
          v17 = [v16 objectForKeyedSubscript:@"attribute"];
          uint64_t v18 = [v16 objectForKeyedSubscript:@"children"];
          BOOL v19 = [v18 count] == 0;

          if (v19)
          {
            int v21 = [v124 _objectStore];
            char v22 = [v21 containsObject:v17];

            if ((v22 & 1) == 0)
            {
              id v23 = [v124 _objectStore];
              [v23 addObject:v17];

              if (v119 >= v122)
              {
                uint64_t v25 = (v119 - v118) >> 3;
                unint64_t v26 = v25 + 1;
                if ((unint64_t)(v25 + 1) >> 61) {
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                }
                if ((v122 - v118) >> 2 > v26) {
                  unint64_t v26 = (v122 - v118) >> 2;
                }
                if ((unint64_t)(v122 - v118) >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v27 = v26;
                }
                if (v27) {
                  unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v27);
                }
                else {
                  uint64_t v28 = 0;
                }
                char v29 = (char *)(v27 + 8 * v25);
                *(void *)char v29 = v13;
                id v24 = v29 + 8;
                if (v119 == v118)
                {
                  id v30 = v118;
                }
                else
                {
                  id v30 = v118;
                  id v31 = v119;
                  do
                  {
                    uint64_t v32 = *((void *)v31 - 1);
                    v31 -= 8;
                    *((void *)v29 - 1) = v32;
                    v29 -= 8;
                  }
                  while (v31 != v118);
                }
                v122 = (char *)(v27 + 8 * v28);
                if (v30) {
                  operator delete(v30);
                }
                v118 = v29;
              }
              else
              {
                *(void *)v119 = v13;
                id v24 = v119 + 8;
              }
              ++v13;
              if ((unint64_t)v12 >= v120)
              {
                uint64_t v33 = (v12 - v117) >> 3;
                unint64_t v34 = v33 + 1;
                if ((unint64_t)(v33 + 1) >> 61) {
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v120 - (void)v117) >> 2 > v34) {
                  unint64_t v34 = (uint64_t)(v120 - (void)v117) >> 2;
                }
                if (v120 - (unint64_t)v117 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v35 = v34;
                }
                if (v35) {
                  unint64_t v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v35);
                }
                else {
                  uint64_t v36 = 0;
                }
                id v37 = (char *)(v35 + 8 * v33);
                *(void *)id v37 = 0;
                id v38 = v37 + 8;
                if (v12 == v117)
                {
                  long long v39 = v117;
                }
                else
                {
                  long long v39 = v117;
                  do
                  {
                    uint64_t v40 = *((void *)v12 - 1);
                    v12 -= 8;
                    *((void *)v37 - 1) = v40;
                    v37 -= 8;
                  }
                  while (v12 != v117);
                }
                unint64_t v120 = v35 + 8 * v36;
                if (v39) {
                  operator delete(v39);
                }
                v119 = v24;
                id v12 = v38;
                v117 = v37;
              }
              else
              {
                *(void *)id v12 = 0;
                v12 += 8;
                v119 = v24;
              }
            }
          }
          else
          {
            id v20 = [v124 _attributes];
            [v20 addObject:v17];
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v140 objects:v157 count:16];
      }
      while (v11);
    }
    else
    {
      v118 = 0;
      v119 = 0;
      id v12 = 0;
      v117 = 0;
    }

    for (unint64_t j = 0; ; ++j)
    {
      long long v42 = [v124 _attributes];
      BOOL v43 = j < [v42 count];

      uint64_t v44 = v124;
      v45 = (void *)v124[1];
      if (!v43) {
        break;
      }
      v46 = [v124 _attributes];
      id v47 = [v46 objectAtIndexedSubscript:j];
      std::string::basic_string[abi:ne180100]<0>(&v150, (char *)[v47 UTF8String]);
      CoreML::FeatureType::FeatureType(&v136, 2);
      (*(void (**)(void **__return_ptr, void *, void **, CoreML::Specification::FeatureType **))(*v45 + 16))(v138, v45, &v150, &v136);
      if (v139 < 0) {
        operator delete(v138[1]);
      }
      if (v137) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v137);
      }
      if (v152 < 0) {
        operator delete(v150);
      }
    }
    uint64_t v48 = v45[6];
    *(_DWORD *)(v48 + 40) = 0;
    v49 = v117;
    if (v117 == v12)
    {
      v55 = v12;
    }
    else
    {
      do
      {
        uint64_t v50 = *(void *)v49;
        uint64_t v51 = v45[6];
        v53 = (unsigned int *)(v51 + 40);
        signed int v52 = *(_DWORD *)(v51 + 40);
        if (v52 == *(_DWORD *)(v51 + 44))
        {
          google::protobuf::RepeatedField<double>::Reserve(v53, v52 + 1);
          signed int v52 = *v53;
        }
        uint64_t v54 = *(void *)(v51 + 48);
        *(_DWORD *)(v51 + 40) = v52 + 1;
        *(void *)(v54 + 8 * v52 + 8) = v50;
        v49 += 8;
      }
      while (v49 != v12);
      uint64_t v48 = v45[6];
      v55 = v117;
    }
    *(void *)(v48 + 64) = (v12 - v55) >> 3;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    id obja = obj;
    uint64_t v56 = [obja countByEnumeratingWithState:&v132 objects:v156 count:16];
    if (v56)
    {
      unint64_t v113 = 0;
      uint64_t v110 = *(void *)v133;
      do
      {
        uint64_t v115 = 0;
        uint64_t v111 = v56;
        do
        {
          if (*(void *)v133 != v110) {
            objc_enumerationMutation(obja);
          }
          v114 = *(void **)(*((void *)&v132 + 1) + 8 * v115);
          v116 = [v114 objectForKeyedSubscript:@"attribute"];
          v57 = [v44 _attributes];
          uint64_t v112 = [v57 indexOfObject:v116];

          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v123 = [v114 objectForKeyedSubscript:@"children"];
          uint64_t v58 = [v123 countByEnumeratingWithState:&v128 objects:v155 count:16];
          if (!v58)
          {
            uint64_t v121 = 0;
            uint64_t v59 = 0;
            int v71 = 5;
            v61 = 0;
            goto LABEL_116;
          }
          uint64_t v121 = 0;
          uint64_t v59 = 0;
          uint64_t v60 = *(void *)v129;
          v61 = 0;
          do
          {
            uint64_t v62 = 0;
            do
            {
              if (*(void *)v129 != v60) {
                objc_enumerationMutation(v123);
              }
              v63 = *(void **)(*((void *)&v128 + 1) + 8 * v62);
              v64 = objc_msgSend(obja, "objectAtIndexedSubscript:", objc_msgSend(v63, "unsignedIntegerValue"));
              v65 = [v64 objectForKeyedSubscript:@"branch"];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                v67 = [v64 objectForKeyedSubscript:@"branch"];
                v68 = [v67 predicateFormat];
                if ([v68 characterAtIndex:5] == 60)
                {
                  uint64_t v59 = [v63 unsignedIntegerValue];
                  v69 = [v64 objectForKeyedSubscript:@"branchValue"];
                  [v69 doubleValue];
                  v61 = v70;
                  int v71 = 0;
LABEL_97:

                  goto LABEL_105;
                }
                if ([v68 characterAtIndex:5] == 62)
                {
                  uint64_t v121 = [v63 unsignedIntegerValue];
                  int v71 = 0;
                  goto LABEL_105;
                }
                if ([v68 characterAtIndex:5] != 33)
                {
                  uint64_t v59 = [v63 unsignedIntegerValue];
                  v69 = [v64 objectForKeyedSubscript:@"branchValue"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v64 objectForKeyedSubscript:@"branchValue"];
                  }
                  else
                  {
                    v77 = [v124 _objectStore];
                    [v77 addObject:v69];

                    v78 = [v124 _objectStore];
                    uint64_t v79 = [v78 indexOfObject:v69];

                    [NSNumber numberWithUnsignedInteger:v79];
                  v76 = };
                  [v76 doubleValue];
                  v61 = v80;

                  int v71 = 4;
                  goto LABEL_97;
                }
                uint64_t v121 = [v63 unsignedIntegerValue];
              }
              else
              {
                uint64_t v59 = [v63 unsignedIntegerValue];
                v67 = [v64 objectForKeyedSubscript:@"branchValue"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v64 objectForKeyedSubscript:@"branchValue"];
                }
                else
                {
                  v72 = [v124 _objectStore];
                  [v72 addObject:v67];

                  v73 = [v124 _objectStore];
                  uint64_t v74 = [v73 indexOfObject:v67];

                  [NSNumber numberWithUnsignedInteger:v74];
                v68 = };
                [v68 doubleValue];
                v61 = v75;
              }
              int v71 = 4;
LABEL_105:

              ++v62;
            }
            while (v58 != v62);
            uint64_t v81 = [v123 countByEnumeratingWithState:&v128 objects:v155 count:16];
            uint64_t v58 = v81;
          }
          while (v81);
LABEL_116:

          v82 = [v114 objectForKeyedSubscript:@"children"];
          BOOL v83 = [v82 count] == 0;

          if (v83)
          {
            v85 = [v124 _objectStore];
            uint64_t v86 = [v85 indexOfObject:v116];

            v87 = (CoreML::TreeEnsembleBase *)v124[1];
            v88 = (google::protobuf::Arena **)operator new(0x10uLL);
            *v88 = (google::protobuf::Arena *)v86;
            v88[1] = (google::protobuf::Arena *)0x3FF0000000000000;
            Node = CoreML::TreeEnsembleBase::_getNode(v87, v113);
            *((_DWORD *)Node + 14) = 6;
            uint64_t v90 = *((unsigned int *)Node + 6);
            if ((int)v90 >= 1)
            {
              v91 = (uint64_t *)((char *)Node[4] + 8);
              do
              {
                uint64_t v92 = *v91++;
                *(void *)(v92 + 16) = 0;
                *(void *)(v92 + 24) = 0;
                --v90;
              }
              while (v90);
              *((_DWORD *)Node + 6) = 0;
            }
            v93 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::TreeEnsembleParameters_TreeNode_EvaluationInfo>::TypeHandler>((google::protobuf::internal::RepeatedPtrFieldBase *)(Node + 2));
            v93[2] = *v88;
            v93[3] = v88[1];
            operator delete(v88);
          }
          else
          {
            v84 = CoreML::TreeEnsembleBase::_getNode((CoreML::TreeEnsembleBase *)v124[1], v113);
            v84[8] = (google::protobuf::Arena *)v112;
            *((_DWORD *)v84 + 14) = v71;
            v84[9] = v61;
            v84[10] = (google::protobuf::Arena *)v59;
            v84[11] = (google::protobuf::Arena *)v121;
          }

          ++v113;
          ++v115;
          uint64_t v44 = v124;
        }
        while (v115 != v111);
        uint64_t v56 = [obja countByEnumeratingWithState:&v132 objects:v156 count:16];
      }
      while (v56);
    }

    uint64_t v94 = v124[1];
    *(_DWORD *)(*(void *)(v94 + 56) + 24) = 0;
    uint64_t v95 = *(void *)(v94 + 8);
    if (*(_DWORD *)(v95 + 44) != 402)
    {
      CoreML::Specification::Model::clear_Type(*(void *)(v94 + 8));
      *(_DWORD *)(v95 + 44) = 402;
      operator new();
    }
    uint64_t v96 = *(void *)(v95 + 32);
    if (*(_DWORD *)(v96 + 44) != 101)
    {
      CoreML::Specification::TreeEnsembleClassifier::clear_ClassLabels(v96);
      *(_DWORD *)(v96 + 44) = 101;
      operator new();
    }
    *(_DWORD *)(*(void *)(v96 + 32) + 16) = 0;
    if (v119 != v118)
    {
      unint64_t v97 = 0;
      do
      {
        uint64_t v98 = *(void *)(v94 + 8);
        if (*(_DWORD *)(v98 + 44) != 402)
        {
          CoreML::Specification::Model::clear_Type(*(void *)(v94 + 8));
          *(_DWORD *)(v98 + 44) = 402;
          operator new();
        }
        uint64_t v99 = *(void *)(v98 + 32);
        if (*(_DWORD *)(v99 + 44) != 101)
        {
          CoreML::Specification::TreeEnsembleClassifier::clear_ClassLabels(v99);
          *(_DWORD *)(v99 + 44) = 101;
          operator new();
        }
        uint64_t v100 = *(void *)(v99 + 32);
        uint64_t v101 = *(void *)&v118[8 * v97];
        int v102 = *(_DWORD *)(v100 + 16);
        if (v102 == *(_DWORD *)(v100 + 20))
        {
          google::protobuf::RepeatedField<double>::Reserve((unsigned int *)(v100 + 16), v102 + 1);
          int v102 = *(_DWORD *)(v100 + 16);
        }
        uint64_t v103 = *(void *)(v100 + 24);
        *(_DWORD *)(v100 + 16) = v102 + 1;
        *(void *)(v103 + 8 * v102 + 8) = v101;
        ++v97;
      }
      while (v97 < (v119 - v118) >> 3);
    }
    CoreML::TreeEnsembles::constructAndValidateTreeEnsembleFromSpec((CoreML::TreeEnsembles *)&v150, *(const CoreML::Specification::Model **)(v124[1] + 8));
    if (v151) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v151);
    }
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)&v150, *(const CoreML::Specification::Model **)(v124[1] + 8));
    v104 = objc_opt_new();
    id v127 = 0;
    uint64_t v105 = +[MLTreeEnsembleClassifier loadModelFromSpecification:&v150 configuration:v104 error:&v127];
    id v106 = v127;

    v107 = (void *)v124[2];
    v124[2] = v105;

    if (v151) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v151);
    }
    if (v118) {
      operator delete(v118);
    }
    if (v117) {
      operator delete(v117);
    }
  }

  return v124;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MLGKDecisionTree;
  if ([(MLGKDecisionTree *)&v3 init]) {
    operator new();
  }
  return 0;
}

@end