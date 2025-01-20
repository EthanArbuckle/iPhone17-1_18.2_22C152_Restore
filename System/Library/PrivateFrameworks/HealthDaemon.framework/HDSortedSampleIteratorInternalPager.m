@interface HDSortedSampleIteratorInternalPager
@end

@implementation HDSortedSampleIteratorInternalPager

uint64_t __144___HDSortedSampleIteratorInternalPager_getSamplesWithQueryDescriptor_sortDescriptors_anchor_limit_includeDeletedObjects_profile_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v7 = a2;
  unint64_t v8 = a3;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7)
    {
      v10 = *(void **)(*(void *)(a1 + 40) + 8);
      v11 = (uint64_t *)v10[7];
      unint64_t v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        uint64_t v18 = v10[6];
        uint64_t v19 = ((uint64_t)v11 - v18) >> 4;
        if ((unint64_t)(v19 + 1) >> 60) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v20 = v12 - v18;
        unint64_t v21 = (uint64_t)(v12 - v18) >> 3;
        if (v21 <= v19 + 1) {
          unint64_t v21 = v19 + 1;
        }
        if (v20 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v22 = v21;
        }
        v61 = v10 + 8;
        if (v22)
        {
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)(v10 + 8), v22);
          uint64_t v25 = v24;
        }
        else
        {
          v23 = 0;
          uint64_t v25 = 0;
        }
        v26 = &v23[16 * v19];
        *(void *)v26 = a4;
        *((void *)v26 + 1) = (id)v7;
        uint64_t v28 = v10[6];
        uint64_t v27 = v10[7];
        v29 = v26;
        if (v27 != v28)
        {
          uint64_t v30 = v10[7];
          do
          {
            uint64_t v31 = *(void *)(v30 - 16);
            v30 -= 16;
            *((void *)v29 - 2) = v31;
            v29 -= 16;
            uint64_t v32 = *(void *)(v30 + 8);
            *(void *)(v30 + 8) = 0;
            *((void *)v29 + 1) = v32;
          }
          while (v30 != v28);
        }
        v13 = v26 + 16;
        v10[6] = v29;
        v10[7] = v13;
        uint64_t v33 = v10[8];
        v10[8] = &v23[16 * v25];
        uint64_t v59 = v27;
        uint64_t v60 = v33;
        uint64_t v57 = v28;
        uint64_t v58 = v28;
        std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v57);
      }
      else
      {
        uint64_t *v11 = a4;
        v11[1] = (uint64_t)(id)v7;
        v13 = v11 + 2;
      }
      v10[7] = v13;
      uint64_t v34 = [MEMORY[0x1E4F2B558] sortedQueryAnchorWithSortDescriptors:*(void *)(a1 + 32) followingSample:v7 objectID:a4];
LABEL_40:
      uint64_t v52 = *(void *)(*(void *)(a1 + 48) + 8);
      v53 = *(void **)(v52 + 40);
      *(void *)(v52 + 40) = v34;

      goto LABEL_41;
    }
    if (v8 && *(unsigned char *)(a1 + 88))
    {
      v14 = *(void **)(*(void *)(a1 + 56) + 8);
      v15 = (uint64_t *)v14[7];
      unint64_t v16 = v14[8];
      if ((unint64_t)v15 >= v16)
      {
        uint64_t v35 = v14[6];
        uint64_t v36 = ((uint64_t)v15 - v35) >> 4;
        if ((unint64_t)(v36 + 1) >> 60) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v37 = v16 - v35;
        unint64_t v38 = (uint64_t)(v16 - v35) >> 3;
        if (v38 <= v36 + 1) {
          unint64_t v38 = v36 + 1;
        }
        if (v37 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v39 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v39 = v38;
        }
        v61 = v14 + 8;
        if (v39)
        {
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)(v14 + 8), v39);
          uint64_t v42 = v41;
        }
        else
        {
          v40 = 0;
          uint64_t v42 = 0;
        }
        v43 = &v40[16 * v36];
        *(void *)v43 = a4;
        *((void *)v43 + 1) = v9;
        uint64_t v45 = v14[6];
        uint64_t v44 = v14[7];
        v46 = v43;
        if (v44 != v45)
        {
          uint64_t v47 = v14[7];
          do
          {
            uint64_t v48 = *(void *)(v47 - 16);
            v47 -= 16;
            *((void *)v46 - 2) = v48;
            v46 -= 16;
            uint64_t v49 = *(void *)(v47 + 8);
            *(void *)(v47 + 8) = 0;
            *((void *)v46 + 1) = v49;
          }
          while (v47 != v45);
        }
        v17 = v43 + 16;
        v14[6] = v46;
        v14[7] = v17;
        uint64_t v50 = v14[8];
        v14[8] = &v40[16 * v42];
        uint64_t v59 = v44;
        uint64_t v60 = v50;
        uint64_t v57 = v45;
        uint64_t v58 = v45;
        std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v57);
      }
      else
      {
        uint64_t *v15 = a4;
        v15[1] = (uint64_t)(id)v8;
        v17 = v15 + 2;
      }
      v14[7] = v17;
      if (*(void *)(a1 + 32)) {
        uint64_t v51 = *(void *)(a1 + 32);
      }
      else {
        uint64_t v51 = MEMORY[0x1E4F1CBF0];
      }
      uint64_t v34 = [MEMORY[0x1E4F2B558] sortedQueryAnchorWithSortDescriptors:v51 objectID:a4];
      goto LABEL_40;
    }
  }
  else
  {
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 80), @"_HDSortedSampleIteratorInternalPager.mm", 125, @"Invalid parameter not satisfying: %@", @"sample != nil || deletedObject != nil" object file lineNumber description];
  }
LABEL_41:
  uint64_t v54 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(void *)(v54 + 24) < a4) {
    *(void *)(v54 + 24) = a4;
  }

  return 1;
}

@end