@interface _HDSortedSampleIteratorInternalPager
+ (void)getSamplesWithQueryDescriptor:(id)a3 sortDescriptors:(id)a4 anchor:(id)a5 limit:(unint64_t)a6 includeDeletedObjects:(BOOL)a7 profile:(id)a8 resultsHandler:(id)a9;
- (_HDSortedSampleIteratorInternalPager)init;
@end

@implementation _HDSortedSampleIteratorInternalPager

- (_HDSortedSampleIteratorInternalPager)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = NSStringFromSelector(a2);
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

+ (void)getSamplesWithQueryDescriptor:(id)a3 sortDescriptors:(id)a4 anchor:(id)a5 limit:(unint64_t)a6 includeDeletedObjects:(BOOL)a7 profile:(id)a8 resultsHandler:(id)a9
{
  id v71 = a3;
  id v72 = a4;
  id v13 = a5;
  id v70 = a8;
  id v14 = a9;
  if (a6 - 101 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, a1, @"_HDSortedSampleIteratorInternalPager.mm", 94, @"Invalid parameter not satisfying: %@", @"limit > 0 && limit <= 100" object file lineNumber description];
  }
  v67 = (void (**)(void, void, void, void, void, void, void))v14;
  unint64_t v74 = a6;
  v65 = v13;
  if (v13)
  {
    v15 = (void *)[v13 copy];
  }
  else
  {
    if (v72) {
      id v16 = v72;
    }
    else {
      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
    v15 = [MEMORY[0x1E4F2B558] sortedQueryAnchorWithSortDescriptors:v16];
  }
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x4812000000;
  v114 = __Block_byref_object_copy__109;
  v115 = __Block_byref_object_dispose__109;
  v116 = &unk_1BD44B655;
  memset(v117, 0, sizeof(v117));
  v104 = 0;
  v105 = &v104;
  uint64_t v106 = 0x4812000000;
  v107 = __Block_byref_object_copy__295;
  v108 = __Block_byref_object_dispose__296;
  v109 = &unk_1BD44B655;
  memset(v110, 0, sizeof(v110));
  v98 = 0;
  v99 = &v98;
  uint64_t v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__298;
  v102 = __Block_byref_object_dispose__299;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  id v103 = v15;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x2020000000;
  uint64_t v97 = 0;
  id v66 = v103;
  v21 = (void **)v103;
  while (1)
  {
    id v93 = 0;
    id v22 = v70;
    id v23 = v71;
    v24 = v21;
    self;
    v25 = [v23 sampleTypes];
    v26 = +[HDSampleEntity entityEnumeratorWithTypes:v25 profile:v22 error:&v93];

    if (v26)
    {
      v27 = [v24 querySortDescriptors];
      [v26 setSortDescriptors:v27];

      uint64_t v28 = [v23 encodingOptions];
      v29 = (void *)v28;
      if (v28) {
        uint64_t v30 = v28;
      }
      else {
        uint64_t v30 = MEMORY[0x1E4F1CC08];
      }
      [v26 addEncodingOptionsFromDictionary:v30];

      v31 = [v23 restrictedSourceEntities];
      [v26 setRestrictedSourceEntities:v31];

      [v26 setLimitCount:v74 - ((((char *)v18 - (char *)v17) >> 4) + (((char *)v20 - (char *)v19) >> 4))];
      v32 = [v23 authorizationFilter];
      [v26 setAuthorizationFilter:v32];

      v33 = [v23 samplePredicate];
      [v26 setPredicate:v33];

      v34 = [v23 deletedObjectsPredicate];
      [v26 setDeletedObjectsPredicate:v34];

      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v36 = [v24 predicate];

      if (v36)
      {
        v37 = [v24 predicate];
        [v35 addObject:v37];
      }
      v38 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v35];
      v39 = [v23 sampleTypes];
      v40 = objc_msgSend(v38, "hk_filterRepresentationForDataTypes:", v39);

      v41 = [v23 filter];

      if (v41)
      {
        v42 = (void *)MEMORY[0x1E4F2B878];
        v43 = [v23 filter];
        uint64_t v44 = [v42 compoundFilterWithFilter:v40 otherFilter:v43];

        v40 = (void *)v44;
      }
      [v26 setFilter:v40];
      v45 = [v24 objectID];
      [v26 setAnchor:v45];

      id v46 = v26;
    }

    id v47 = v93;
    id v48 = v47;
    if (!v26)
    {
      memset(v92, 0, sizeof(v92));
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v92, (uint64_t *)v112[6], (uint64_t *)v112[7], (v112[7] - v112[6]) >> 4);
      memset(v91, 0, sizeof(v91));
      v63 = v67;
      std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v91, (uint64_t *)v105[6], (uint64_t *)v105[7], ((char *)v105[7] - (char *)v105[6]) >> 4);
      ((void (**)(void, void, void *, void *, void, void, id))v63)[2](v63, 0, v92, v91, 0, 0, v48);
      v118[0] = (void **)v91;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
      v118[0] = (void **)v92;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
LABEL_34:

      v56 = v66;
      goto LABEL_50;
    }

    id v90 = 0;
    v81[3] = MEMORY[0x1E4F143A8];
    v81[4] = 3221225472;
    v81[5] = __144___HDSortedSampleIteratorInternalPager_getSamplesWithQueryDescriptor_sortDescriptors_anchor_limit_includeDeletedObjects_profile_resultsHandler___block_invoke;
    v81[6] = &unk_1E63022D8;
    SEL v87 = a2;
    id v88 = a1;
    v83 = &v111;
    v84 = &v98;
    id v49 = v72;
    BOOL v89 = a7;
    id v82 = v49;
    v85 = &v104;
    v86 = &v94;
    char v50 = objc_msgSend(v26, "enumerateIncludingDeletedObjects:error:handler:");
    id v48 = v90;
    if ((v50 & 1) == 0)
    {
      memset(v81, 0, 24);
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v81, (uint64_t *)v112[6], (uint64_t *)v112[7], (v112[7] - v112[6]) >> 4);
      memset(v80, 0, sizeof(v80));
      v63 = v67;
      std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v80, (uint64_t *)v105[6], (uint64_t *)v105[7], ((char *)v105[7] - (char *)v105[6]) >> 4);
      ((void (**)(void, void, void *, void *, void, void, id))v63)[2](v63, 0, v81, v80, 0, 0, v48);
      v118[0] = (void **)v80;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
      v118[0] = (void **)v81;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
      goto LABEL_33;
    }
    unint64_t v51 = v74;
    if ((((char *)v105[7] - (char *)v105[6]) >> 4) + ((v112[7] - v112[6]) >> 4) < v74)
    {
      if (a7 || ![v99[5] canRelax])
      {
        v54 = v99[5];
        v99[5] = 0;
      }
      else
      {
        v52 = v99[5];
        id v79 = 0;
        uint64_t v53 = [MEMORY[0x1E4F2B558] sortedQueryAnchorRelaxingConstraintsWithAnchor:v52 error:&v79];
        v54 = (void **)v79;
        v55 = v99[5];
        v99[5] = (void **)v53;

        if (!v99[5])
        {
          memset(v78, 0, sizeof(v78));
          std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v78, (uint64_t *)v112[6], (uint64_t *)v112[7], (v112[7] - v112[6]) >> 4);
          memset(v77, 0, sizeof(v77));
          v63 = v67;
          std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v77, (uint64_t *)v105[6], (uint64_t *)v105[7], ((char *)v105[7] - (char *)v105[6]) >> 4);
          ((void (**)(void, void, void *, void *, void, void, void **))v63)[2](v63, 0, v78, v77, 0, 0, v54);
          v118[0] = (void **)v77;
          std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
          v118[0] = (void **)v78;
          std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);

LABEL_33:
          goto LABEL_34;
        }
      }

      unint64_t v51 = v74;
    }

    v19 = (uint64_t *)v112[6];
    v20 = (uint64_t *)v112[7];
    v17 = v105[6];
    v18 = v105[7];
    v21 = v99[5];
    if ((((char *)v18 - (char *)v17) >> 4) + (((char *)v20 - (char *)v19) >> 4) >= v51) {
      break;
    }
    if (!v21) {
      goto LABEL_37;
    }
  }
  if (v21)
  {
    uint64_t v57 = 0;
    unint64_t v58 = ((char *)v20 - (char *)v19) >> 4;
    v56 = v66;
    v63 = v67;
  }
  else
  {
LABEL_37:
    if (v20 == v19)
    {
      v56 = v66;
      if (v18 == v17)
      {
        v63 = v67;
        uint64_t v60 = [v66 copy];
      }
      else
      {
        if (v49) {
          id v61 = v49;
        }
        else {
          id v61 = (id)MEMORY[0x1E4F1CBF0];
        }
        v63 = v67;
        uint64_t v60 = [MEMORY[0x1E4F2B558] sortedQueryAnchorWithSortDescriptors:v61 objectID:v95[3]];
      }
    }
    else
    {
      if (v49) {
        id v59 = v49;
      }
      else {
        id v59 = (id)MEMORY[0x1E4F1CBF0];
      }
      v56 = v66;
      v63 = v67;
      uint64_t v60 = [MEMORY[0x1E4F2B558] sortedQueryAnchorWithSortDescriptors:v59 followingSample:*(v20 - 1) objectID:v95[3]];
    }
    v62 = v99[5];
    v99[5] = (void **)v60;

    v19 = (uint64_t *)v112[6];
    v20 = (uint64_t *)v112[7];
    unint64_t v58 = ((char *)v20 - (char *)v19) >> 4;
    uint64_t v57 = 1;
  }
  memset(v76, 0, sizeof(v76));
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(v76, v19, v20, v58);
  memset(v75, 0, sizeof(v75));
  std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(v75, (uint64_t *)v105[6], (uint64_t *)v105[7], ((char *)v105[7] - (char *)v105[6]) >> 4);
  ((void (**)(void, uint64_t, void *, void *, void **, uint64_t, void))v63)[2](v63, 1, v76, v75, v99[5], v57, 0);
  v118[0] = (void **)v75;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
  v118[0] = (void **)v76;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](v118);
LABEL_50:
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  v98 = (void **)v110;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v98);
  _Block_object_dispose(&v111, 8);
  v104 = (void **)v117;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v104);
}

@end