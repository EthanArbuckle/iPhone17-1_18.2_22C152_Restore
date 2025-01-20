@interface HDSortedSampleIterator
- (BOOL)advanceWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (HDSortedSampleIterator)init;
- (HDSortedSampleIterator)initWithQueryDescriptor:(id)a3 includeDeletedObjects:(BOOL)a4 sortDescriptors:(id)a5 anchor:(id)a6 bufferSize:(int64_t)a7 profile:(id)a8;
- (HKDeletedObject)deletedObject;
- (HKSample)sample;
- (HKSortedQueryAnchor)nextAnchor;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)object;
- (int64_t)objectID;
- (unint64_t)hash;
- (void)setHead:(uint64_t)a1;
@end

@implementation HDSortedSampleIterator

- (HDSortedSampleIterator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = NSStringFromSelector(a2);
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"The -%@ method is not available on %@", v4, objc_opt_class() format];

  return 0;
}

- (HDSortedSampleIterator)initWithQueryDescriptor:(id)a3 includeDeletedObjects:(BOOL)a4 sortDescriptors:(id)a5 anchor:(id)a6 bufferSize:(int64_t)a7 profile:(id)a8
{
  BOOL includeDeletedObjects = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v54.receiver = self;
  v54.super_class = (Class)HDSortedSampleIterator;
  v19 = [(HDSortedSampleIterator *)&v54 init];
  v20 = v19;
  if (v19)
  {
    uint64_t v21 = [v15 copy];
    queryDescriptor = v19->_queryDescriptor;
    v19->_queryDescriptor = (HDQueryDescriptor *)v21;

    if (includeDeletedObjects && [v16 count])
    {
      v53 = [MEMORY[0x1E4F28B00] currentHandler];
      [v53 handleFailureInMethod:a2, v19, @"HDSortedSampleIterator.mm", 64, @"Invalid parameter not satisfying: %@", @"includeDeletedObjects == NO || (includeDeletedObjects && sortDescriptors.count == 0)" object file lineNumber description];
    }
    v19->_BOOL includeDeletedObjects = includeDeletedObjects;
    uint64_t v23 = [v16 copy];
    sortDescriptors = v19->_sortDescriptors;
    v19->_sortDescriptors = (NSArray *)v23;

    uint64_t v25 = [v17 copy];
    anchor = v19->_anchor;
    v19->_anchor = (HKSortedQueryAnchor *)v25;

    v19->_bufferSize = a7;
    objc_storeWeak((id *)&v19->_profile, v18);
    value__2 = v19->_currentSample.__base_.__value__2;
    v19->_currentSample.__base_.__value_ = 0;
    v19->_currentSample.__base_.__value__2 = 0;

    v28 = v19->_currentDeletedObject.__base_.__value__2;
    v19->_currentDeletedObject.__base_.__value_ = 0;
    v19->_currentDeletedObject.__base_.__value__2 = 0;

    lastError = v19->_lastError;
    v19->_lastError = 0;

    begin = v19->_sampleBuffer.__begin_;
    v20->_isComplete = 0;
    v20->_BOOL includeDeletedObjects = includeDeletedObjects;
    if (a7 > (unint64_t)(((char *)v20->_sampleBuffer.__end_cap_.__value_ - (char *)begin) >> 4))
    {
      if ((unint64_t)a7 >> 60) {
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      }
      end = v20->_sampleBuffer.__end_;
      p_end_cap = &v20->_sampleBuffer.__end_cap_;
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)&v20->_sampleBuffer.__end_cap_, a7);
      v35 = (char *)v20->_sampleBuffer.__begin_;
      v34 = (char *)v20->_sampleBuffer.__end_;
      v36 = &v32[end - begin];
      if (v34 != v35)
      {
        v36 = &v32[end - begin];
        v37 = (char *)v20->_sampleBuffer.__end_;
        do
        {
          uint64_t v38 = *((void *)v37 - 2);
          v37 -= 16;
          *((void *)v36 - 2) = v38;
          v36 -= 16;
          uint64_t v39 = *((void *)v37 + 1);
          *((void *)v37 + 1) = 0;
          *((void *)v36 + 1) = v39;
        }
        while (v37 != v35);
      }
      v20->_sampleBuffer.__begin_ = v36;
      v20->_sampleBuffer.__end_ = &v32[end - begin];
      value = v20->_sampleBuffer.__end_cap_.__value_;
      v20->_sampleBuffer.__end_cap_.__value_ = &v32[16 * v33];
      v57 = v34;
      v58 = value;
      v55 = v35;
      v56 = v35;
      std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v55);
      BOOL includeDeletedObjects = v20->_includeDeletedObjects;
    }
    if (includeDeletedObjects)
    {
      v41 = v20->_deletedObjectsBuffer.__begin_;
      if (a7 > (unint64_t)(((char *)v20->_deletedObjectsBuffer.__end_cap_.__value_ - (char *)v41) >> 4))
      {
        if ((unint64_t)a7 >> 60) {
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        }
        v42 = v20->_deletedObjectsBuffer.__end_;
        p_end_cap = &v20->_deletedObjectsBuffer.__end_cap_;
        v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)&v20->_deletedObjectsBuffer.__end_cap_, a7);
        v46 = (char *)v20->_deletedObjectsBuffer.__begin_;
        v45 = (char *)v20->_deletedObjectsBuffer.__end_;
        v47 = &v43[v42 - v41];
        if (v45 != v46)
        {
          v47 = &v43[v42 - v41];
          v48 = (char *)v20->_deletedObjectsBuffer.__end_;
          do
          {
            uint64_t v49 = *((void *)v48 - 2);
            v48 -= 16;
            *((void *)v47 - 2) = v49;
            v47 -= 16;
            uint64_t v50 = *((void *)v48 + 1);
            *((void *)v48 + 1) = 0;
            *((void *)v47 + 1) = v50;
          }
          while (v48 != v46);
        }
        v20->_deletedObjectsBuffer.__begin_ = v47;
        v20->_deletedObjectsBuffer.__end_ = &v43[v42 - v41];
        v51 = v20->_deletedObjectsBuffer.__end_cap_.__value_;
        v20->_deletedObjectsBuffer.__end_cap_.__value_ = &v43[16 * v44];
        v57 = v45;
        v58 = v51;
        v55 = v46;
        v56 = v46;
        std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v55);
      }
    }
  }

  return v20;
}

- (BOOL)advanceWithError:(id *)a3
{
  if (!self) {
    return 0;
  }
  begin = self->_sampleBuffer.__begin_;
  end = self->_sampleBuffer.__end_;
  if (begin == end)
  {
    BOOL includeDeletedObjects = self->_includeDeletedObjects;
    if (!self->_includeDeletedObjects || self->_deletedObjectsBuffer.__begin_ == self->_deletedObjectsBuffer.__end_)
    {
      if (self->_isComplete) {
        goto LABEL_23;
      }
      v12 = (id *)self->_deletedObjectsBuffer.__begin_;
      v11 = (id *)self->_deletedObjectsBuffer.__end_;
      self->_sampleBuffer.__end_ = begin;
      if (v11 != v12)
      {
        do
        {
          v13 = v11 - 2;

          v11 = v13;
        }
        while (v13 != v12);
        BOOL includeDeletedObjects = self->_includeDeletedObjects;
      }
      self->_deletedObjectsBuffer.__end_ = v12;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__29;
      uint64_t v33 = __Block_byref_object_dispose__29;
      id v34 = 0;
      queryDescriptor = self->_queryDescriptor;
      sortDescriptors = self->_sortDescriptors;
      anchor = self->_anchor;
      int64_t bufferSize = self->_bufferSize;
      BOOL v18 = includeDeletedObjects;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __64__HDSortedSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke;
      v28[3] = &unk_1E62F6C48;
      v28[4] = self;
      v28[5] = &v29;
      v28[6] = &v35;
      +[_HDSortedSampleIteratorInternalPager getSamplesWithQueryDescriptor:queryDescriptor sortDescriptors:sortDescriptors anchor:anchor limit:bufferSize includeDeletedObjects:v18 profile:WeakRetained resultsHandler:v28];

      if (!*((unsigned char *)v36 + 24))
      {
        id v25 = (id)v30[5];
        v26 = v25;
        if (v25)
        {
          if (a3) {
            *a3 = v25;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_34;
      }
      if (self->_sampleBuffer.__begin_ == self->_sampleBuffer.__end_
        && (!self->_includeDeletedObjects || self->_deletedObjectsBuffer.__begin_ == self->_deletedObjectsBuffer.__end_)
        && self->_isComplete)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 900, @"Sorted sample iterator is exhausted");
LABEL_34:
        _Block_object_dispose(&v29, 8);

        _Block_object_dispose(&v35, 8);
        return 0;
      }
      _Block_object_dispose(&v29, 8);

      _Block_object_dispose(&v35, 8);
      begin = self->_sampleBuffer.__begin_;
      end = self->_sampleBuffer.__end_;
    }
  }
  if (begin != end)
  {
    if (!self->_includeDeletedObjects) {
      goto LABEL_19;
    }
    v9 = self->_deletedObjectsBuffer.__begin_;
    v8 = self->_deletedObjectsBuffer.__end_;
LABEL_17:
    if (v9 != v8)
    {
      self->_currentDeletedObject.__base_.__value_ = *(v8 - 2);
      objc_storeStrong((id *)&self->_currentDeletedObject.__base_.__value__2, (id)*(v8 - 1));
      -[HDSortedSampleIterator setHead:]((uint64_t)self, self->_currentDeletedObject.__base_.__value__2);
      v20 = (id *)self->_deletedObjectsBuffer.__end_;
      uint64_t v21 = v20 - 2;

      self->_deletedObjectsBuffer.__end_ = v21;
      return 1;
    }
LABEL_19:
    self->_currentSample.__base_.__value_ = *(end - 2);
    objc_storeStrong((id *)&self->_currentSample.__base_.__value__2, (id)*(end - 1));
    -[HDSortedSampleIterator setHead:]((uint64_t)self, self->_currentSample.__base_.__value__2);
    v22 = (id *)self->_sampleBuffer.__end_;
    uint64_t v23 = v22 - 2;

    self->_sampleBuffer.__end_ = v23;
    return 1;
  }
  if (self->_includeDeletedObjects)
  {
    v9 = self->_deletedObjectsBuffer.__begin_;
    v8 = self->_deletedObjectsBuffer.__end_;
    if (v9 != v8) {
      goto LABEL_17;
    }
  }
  if (!self->_isComplete)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"HDSortedSampleIterator.mm", 95, @"Invalid parameter not satisfying: %@", @"_isComplete" object file lineNumber description];
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 900, @"Sorted sample iterator is exhausted");
  return 0;
}

- (void)setHead:(uint64_t)a1
{
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 160), a2);
}

void __64__HDSortedSampleIterator__queryForNextPageIfNecessaryWithError___block_invoke(void *a1, char a2, void *a3, void *a4, void *a5, char a6, void *a7)
{
  id v14 = a5;
  id v15 = a7;
  if (a2)
  {
    char v31 = a6;
    BOOL v18 = a3;
    uint64_t v16 = *a3;
    uint64_t v17 = v18[1];
    uint64_t v33 = 0;
    long long v32 = 0uLL;
    id v34 = (void **)&v32;
    char v35 = 0;
    if (v17 != v16)
    {
      id v30 = v14;
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__vallocate[abi:ne180100](&v32, (v17 - v16) >> 4);
      uint64_t v19 = 0;
      uint64_t v20 = *((void *)&v32 + 1);
      do
      {
        uint64_t v21 = *(void *)(v17 - 16);
        v17 -= 16;
        *(void *)(v20 + v19) = v21;
        *(void *)(v20 + v19 + 8) = *(id *)(v17 + 8);
        v19 += 16;
      }
      while (v17 != v16);
      *((void *)&v32 + 1) = v20 + v19;
      id v14 = v30;
    }
    uint64_t v22 = a1[4];
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v22 + 80));
    *(_OWORD *)(v22 + 80) = v32;
    *(void *)(v22 + 96) = v33;
    uint64_t v33 = 0;
    long long v32 = 0uLL;
    id v34 = (void **)&v32;
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v34);
    id v25 = a4;
    uint64_t v23 = *a4;
    uint64_t v24 = v25[1];
    uint64_t v33 = 0;
    long long v32 = 0uLL;
    id v34 = (void **)&v32;
    char v35 = 0;
    if (v24 != v23)
    {
      std::vector<std::tuple<long long,HKSample * {__strong}>>::__vallocate[abi:ne180100](&v32, (v24 - v23) >> 4);
      uint64_t v26 = 0;
      uint64_t v27 = *((void *)&v32 + 1);
      do
      {
        uint64_t v28 = *(void *)(v24 - 16);
        v24 -= 16;
        *(void *)(v27 + v26) = v28;
        *(void *)(v27 + v26 + 8) = *(id *)(v24 + 8);
        v26 += 16;
      }
      while (v24 != v23);
      *((void *)&v32 + 1) = v27 + v26;
    }
    uint64_t v29 = a1[4];
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v29 + 104));
    *(_OWORD *)(v29 + 104) = v32;
    *(void *)(v29 + 120) = v33;
    uint64_t v33 = 0;
    long long v32 = 0uLL;
    id v34 = (void **)&v32;
    std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v34);
    objc_storeStrong((id *)(a1[4] + 32), a5);
    *(unsigned char *)(a1[4] + 72) = v31;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a7);
  }
}

- (id)object
{
  return self->_currentHead;
}

- (HKSample)sample
{
  value__2 = self->_currentSample.__base_.__value__2;
  if (value__2) {
    v3 = value__2;
  }

  return value__2;
}

- (HKDeletedObject)deletedObject
{
  value__2 = self->_currentDeletedObject.__base_.__value__2;
  if (value__2) {
    v3 = value__2;
  }

  return value__2;
}

- (int64_t)objectID
{
  v3 = [(HDSortedSampleIterator *)self object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = 128;
  if (isKindOfClass) {
    uint64_t v5 = 144;
  }
  return *(int64_t *)((char *)&self->super.isa + v5);
}

- (HKSortedQueryAnchor)nextAnchor
{
  if (self->_currentHead)
  {
    v3 = (void *)MEMORY[0x1E4F2B558];
    sortDescriptors = self->_sortDescriptors;
    uint64_t v5 = [(HDSortedSampleIterator *)self sample];
    objc_msgSend(v3, "sortedQueryAnchorWithSortDescriptors:followingSample:objectID:", sortDescriptors, v5, -[HDSortedSampleIterator objectID](self, "objectID"));
    v6 = (HKSortedQueryAnchor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self->_anchor;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDQueryDescriptor *)self->_queryDescriptor hash];
  uint64_t v4 = [(NSArray *)self->_sortDescriptors hash];
  uint64_t v5 = [(HDSortedSampleIterator *)self sample];
  uint64_t v6 = [v5 hash];
  int64_t v7 = [(HDSortedSampleIterator *)self objectID];
  BOOL isComplete = self->_isComplete;
  BOOL includeDeletedObjects = self->_includeDeletedObjects;
  v10 = [(HDSortedSampleIterator *)self nextAnchor];
  unint64_t v11 = v4 ^ v3 ^ v6 ^ v7 ^ isComplete ^ includeDeletedObjects ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDSortedSampleIterator *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      queryDescriptor = self->_queryDescriptor;
      int64_t v7 = v5->_queryDescriptor;
      if (queryDescriptor != v7 && (!v7 || !-[HDQueryDescriptor isEqual:](queryDescriptor, "isEqual:"))) {
        goto LABEL_22;
      }
      sortDescriptors = self->_sortDescriptors;
      v9 = v5->_sortDescriptors;
      if (sortDescriptors != v9 && (!v9 || !-[NSArray isEqual:](sortDescriptors, "isEqual:"))) {
        goto LABEL_22;
      }
      v10 = [(HDSortedSampleIterator *)self sample];
      unint64_t v11 = [(HDSortedSampleIterator *)v5 sample];
      if (v10 == v11)
      {
      }
      else
      {
        v12 = [(HDSortedSampleIterator *)v5 sample];
        if (!v12)
        {
          char v16 = 0;
          goto LABEL_26;
        }
        v13 = [(HDSortedSampleIterator *)self sample];
        id v14 = [(HDSortedSampleIterator *)v5 sample];
        char v15 = [v13 isEqual:v14];

        if ((v15 & 1) == 0)
        {
LABEL_22:
          char v16 = 0;
LABEL_23:

          goto LABEL_24;
        }
      }
      int64_t v17 = [(HDSortedSampleIterator *)self objectID];
      if (v17 != [(HDSortedSampleIterator *)v5 objectID]
        || self->_isComplete != v5->_isComplete
        || self->_includeDeletedObjects != v5->_includeDeletedObjects)
      {
        goto LABEL_22;
      }
      v10 = [(HDSortedSampleIterator *)self nextAnchor];
      unint64_t v11 = [(HDSortedSampleIterator *)v5 nextAnchor];
      if (v10 == v11)
      {
        char v16 = 1;
        unint64_t v11 = v10;
      }
      else
      {
        BOOL v18 = [(HDSortedSampleIterator *)v5 nextAnchor];
        if (v18)
        {
          uint64_t v19 = [(HDSortedSampleIterator *)self nextAnchor];
          uint64_t v20 = [(HDSortedSampleIterator *)v5 nextAnchor];
          char v16 = [v19 isEqual:v20];
        }
        else
        {
          char v16 = 0;
        }
      }
LABEL_26:

      goto LABEL_23;
    }
    char v16 = 0;
  }
LABEL_24:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  queryDescriptor = self->_queryDescriptor;
  BOOL includeDeletedObjects = self->_includeDeletedObjects;
  sortDescriptors = self->_sortDescriptors;
  anchor = self->_anchor;
  int64_t bufferSize = self->_bufferSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v11 = [v4 initWithQueryDescriptor:queryDescriptor includeDeletedObjects:includeDeletedObjects sortDescriptors:sortDescriptors anchor:anchor bufferSize:bufferSize profile:WeakRetained];

  value__2 = self->_currentSample.__base_.__value__2;
  *(void *)(v11 + 128) = self->_currentSample.__base_.__value_;
  objc_storeStrong((id *)(v11 + 136), value__2);
  v13 = self->_currentDeletedObject.__base_.__value__2;
  *(void *)(v11 + 144) = self->_currentDeletedObject.__base_.__value_;
  objc_storeStrong((id *)(v11 + 152), v13);
  objc_storeStrong((id *)(v11 + 160), self->_currentHead);
  *(unsigned char *)(v11 + 72) = self->_isComplete;
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKSample * {__strong}>*,std::tuple<long long,HKSample * {__strong}>*>(&v15, (uint64_t *)self->_sampleBuffer.__begin_, (uint64_t *)self->_sampleBuffer.__end_, ((char *)self->_sampleBuffer.__end_ - (char *)self->_sampleBuffer.__begin_) >> 4);
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v11 + 80));
  *(_OWORD *)(v11 + 80) = v15;
  *(void *)(v11 + 96) = v16;
  uint64_t v16 = 0;
  long long v15 = 0uLL;
  int64_t v17 = (void **)&v15;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v17);
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  std::vector<std::tuple<long long,HKDeletedObject * {__strong}>>::__init_with_size[abi:ne180100]<std::tuple<long long,HKDeletedObject * {__strong}>*,std::tuple<long long,HKDeletedObject * {__strong}>*>(&v15, (uint64_t *)self->_deletedObjectsBuffer.__begin_, (uint64_t *)self->_deletedObjectsBuffer.__end_, ((char *)self->_deletedObjectsBuffer.__end_ - (char *)self->_deletedObjectsBuffer.__begin_) >> 4);
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__vdeallocate((void **)(v11 + 104));
  *(_OWORD *)(v11 + 104) = v15;
  *(void *)(v11 + 120) = v16;
  uint64_t v16 = 0;
  long long v15 = 0uLL;
  int64_t v17 = (void **)&v15;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v17);
  *(unsigned char *)(v11 + 16) = self->_includeDeletedObjects;
  return (id)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentHead, 0);

  p_begin = &self->_deletedObjectsBuffer.__begin_;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = &self->_sampleBuffer.__begin_;
  std::vector<std::tuple<long long,HKSample * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_restrictedSourceEntities, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 5) = 0u;
  return self;
}

@end