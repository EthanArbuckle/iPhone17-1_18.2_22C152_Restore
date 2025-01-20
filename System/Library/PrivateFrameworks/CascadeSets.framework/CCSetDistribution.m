@interface CCSetDistribution
- (CCSetDistribution)init;
- (CCSetDistribution)initWithSet:(id)a3;
- (id).cxx_construct;
- (id)_sanitizedEncodedDescriptors;
- (id)compute;
- (void)_sanitizedEncodedDescriptors;
- (void)addSetChange:(id)a3;
@end

@implementation CCSetDistribution

- (CCSetDistribution)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSetDistribution)initWithSet:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CCSetDistribution;
  v6 = [(CCSetDistribution *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_set, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    devices = v7->_devices;
    v7->_devices = v8;

    v10 = operator new(0x30uLL);
    v10[1] = 0;
    v10[2] = 0;
    void *v10 = &unk_26FDBEDD0;
    v10[4] = 0;
    v10[5] = 0;
    v10[3] = 0;
    cntrl = (std::__shared_weak_count *)v7->_contentLengths.__cntrl_;
    v7->_contentLengths.__ptr_ = v10 + 3;
    v7->_contentLengths.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v12 = operator new(0x30uLL);
    v12[1] = 0;
    v12[2] = 0;
    void *v12 = &unk_26FDBEDD0;
    v12[4] = 0;
    v12[5] = 0;
    v12[3] = 0;
    v13 = (std::__shared_weak_count *)v7->_metaContentLengths.__cntrl_;
    v7->_metaContentLengths.__ptr_ = v12 + 3;
    v7->_metaContentLengths.__cntrl_ = (__shared_weak_count *)v12;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }

  return v7;
}

- (void)addSetChange:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v44 = a3;
  v4 = [v44 sharedItem];
  id v5 = [v4 content];
  v6 = [v5 data];
  unsigned __int16 v7 = [v6 length];

  ptr = (unsigned __int16 **)self->_contentLengths.__ptr_;
  v9 = ptr[1];
  unint64_t v10 = (unint64_t)ptr[2];
  if ((unint64_t)v9 >= v10)
  {
    v12 = *ptr;
    uint64_t v13 = (char *)v9 - (char *)*ptr;
    if (v13 <= -3) {
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v13 >> 1;
    unint64_t v15 = v10 - (void)v12;
    if (v15 <= (v13 >> 1) + 1) {
      unint64_t v16 = v14 + 1;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v15 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v17 = v16;
    }
    if (v17)
    {
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(ptr + 2), v17);
      v12 = *ptr;
      v9 = ptr[1];
    }
    else
    {
      v18 = 0;
    }
    v19 = &v18[2 * v14];
    v20 = &v18[2 * v17];
    *(_WORD *)v19 = v7;
    v11 = (unsigned __int16 *)(v19 + 2);
    while (v9 != v12)
    {
      __int16 v21 = *--v9;
      *((_WORD *)v19 - 1) = v21;
      v19 -= 2;
    }
    *ptr = (unsigned __int16 *)v19;
    ptr[1] = v11;
    ptr[2] = (unsigned __int16 *)v20;
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    unsigned __int16 *v9 = v7;
    v11 = v9 + 1;
  }
  ptr[1] = v11;
  self->_sumContentLength += v7;
  v43 = [v44 allLocalInstances];
  if ([v43 count])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v22 = v43;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = [*(id *)(*((void *)&v45 + 1) + 8 * i) metaContent];
          v27 = [v26 data];
          unsigned __int16 v28 = [v27 length];

          v29 = (unsigned __int16 **)self->_metaContentLengths.__ptr_;
          v30 = v29[1];
          unint64_t v31 = (unint64_t)v29[2];
          if ((unint64_t)v30 >= v31)
          {
            v33 = *v29;
            uint64_t v34 = (char *)v30 - (char *)*v29;
            if (v34 <= -3) {
              std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v35 = v34 >> 1;
            unint64_t v36 = v31 - (void)v33;
            if (v36 <= (v34 >> 1) + 1) {
              unint64_t v37 = v35 + 1;
            }
            else {
              unint64_t v37 = v36;
            }
            if (v36 >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v38 = v37;
            }
            if (v38)
            {
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(v29 + 2), v38);
              v33 = *v29;
              v30 = v29[1];
            }
            else
            {
              v39 = 0;
            }
            v40 = &v39[2 * v35];
            *(_WORD *)v40 = v28;
            v32 = (unsigned __int16 *)(v40 + 2);
            while (v30 != v33)
            {
              __int16 v41 = *--v30;
              *((_WORD *)v40 - 1) = v41;
              v40 -= 2;
            }
            *v29 = (unsigned __int16 *)v40;
            v29[1] = v32;
            v29[2] = (unsigned __int16 *)&v39[2 * v38];
            if (v33) {
              operator delete(v33);
            }
          }
          else
          {
            unsigned __int16 *v30 = v28;
            v32 = v30 + 1;
          }
          v29[1] = v32;
          self->_sumMetaContentLength += v28;
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v23);
    }

    ++self->_localContentCount;
  }
  v42 = [v44 allDevices];
  [(NSMutableSet *)self->_devices addObjectsFromArray:v42];
  self->_deviceContentCount += [v42 count];
}

- (id)compute
{
  v35[12] = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)self->_contentLengths.__ptr_ + 1) - *(void *)self->_contentLengths.__ptr_;
  uint64_t v4 = v3 >> 1;
  if (v3) {
    double v5 = (double)self->_sumContentLength / (double)(unint64_t)v4;
  }
  else {
    double v5 = 0.0;
  }
  cntrl = self->_contentLengths.__cntrl_;
  ptr = self->_contentLengths.__ptr_;
  v33 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  +[CCSetMetrics _populationStandardDeviation:&ptr mean:v5];
  double v8 = v7;
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v33);
  }
  uint64_t v9 = *((void *)self->_metaContentLengths.__ptr_ + 1) - *(void *)self->_metaContentLengths.__ptr_;
  uint64_t v10 = v9 >> 1;
  if (v9) {
    double v11 = (double)self->_sumMetaContentLength / (double)(unint64_t)v10;
  }
  else {
    double v11 = 0.0;
  }
  v12 = self->_metaContentLengths.__cntrl_;
  v30 = self->_metaContentLengths.__ptr_;
  unint64_t v31 = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
  }
  +[CCSetMetrics _populationStandardDeviation:&v30 mean:v11];
  double v14 = v13;
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v31);
  }
  uint64_t v15 = [(CCSet *)self->_set itemType];
  v29 = [(CCSetDistribution *)self _sanitizedEncodedDescriptors];
  v34[0] = @"itemType";
  unsigned __int16 v28 = [NSNumber numberWithUnsignedShort:v15];
  v35[0] = v28;
  v35[1] = v29;
  v34[1] = @"encodedDescriptors";
  v34[2] = @"contentCount";
  v27 = [NSNumber numberWithUnsignedLong:v4];
  v35[2] = v27;
  v34[3] = @"contentLengthMean";
  v26 = [NSNumber numberWithDouble:v5];
  v35[3] = v26;
  v34[4] = @"contentLengthStdev";
  unint64_t v16 = [NSNumber numberWithDouble:v8];
  v35[4] = v16;
  v34[5] = @"metaContentCount";
  uint64_t v17 = [NSNumber numberWithUnsignedLong:v10];
  v35[5] = v17;
  v34[6] = @"metaContentLengthMean";
  v18 = [NSNumber numberWithDouble:v11];
  v35[6] = v18;
  v34[7] = @"metaContentLengthStdev";
  v19 = [NSNumber numberWithDouble:v14];
  v35[7] = v19;
  v34[8] = @"localContentCount";
  v20 = [NSNumber numberWithUnsignedLongLong:self->_localContentCount];
  v35[8] = v20;
  v34[9] = @"deviceContributorCount";
  __int16 v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableSet count](self->_devices, "count"));
  v35[9] = v21;
  v34[10] = @"deviceContributedContentCount";
  id v22 = [NSNumber numberWithUnsignedLongLong:self->_deviceContentCount];
  v35[10] = v22;
  v34[11] = @"isSynchronized";
  uint64_t v23 = [NSNumber numberWithBool:0];
  v35[11] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:12];

  return v24;
}

- (id)_sanitizedEncodedDescriptors
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  p_set = (uint64_t *)&self->_set;
  uint64_t v17 = [(CCSet *)self->_set descriptors];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v17, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v17;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = [v8 key];
        if (([v9 isEqual:@"sourceIdentifier"] & 1) != 0
          || [v9 isEqual:@"localeIdentifier"])
        {
          [v3 addObject:v8];
        }
        uint64_t v10 = __biome_log_for_category();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = *p_set;
          *(_DWORD *)buf = 138412546;
          uint64_t v24 = v9;
          __int16 v25 = 2112;
          uint64_t v26 = v11;
          _os_log_debug_impl(&dword_249B92000, v10, OS_LOG_TYPE_DEBUG, "Filtering out descriptor with key: %@ for set: %@", buf, 0x16u);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v5);
  }

  id v18 = 0;
  v12 = +[BMResourceDescriptor encodedStringFromDescriptors:v3 error:&v18];
  id v13 = v18;
  if (v12)
  {
    double v14 = v12;
  }
  else
  {
    uint64_t v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(CCSetDistribution *)p_set _sanitizedEncodedDescriptors];
    }

    double v14 = &stru_26FDBF2B8;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  cntrl = self->_metaContentLengths.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_contentLengths.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }

  objc_storeStrong((id *)&self->_set, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)_sanitizedEncodedDescriptors
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Failed to encode sanitized descriptors for set: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end