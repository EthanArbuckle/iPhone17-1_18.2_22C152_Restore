@interface DEGroundingInfo
- (GroundingInfo)This;
- (id).cxx_construct;
- (id)init:(int)a3 timeStamps:(id)a4 text:(id)a5;
- (id)text;
- (id)timestamps;
- (int)count;
- (void)setThis:(GroundingInfo *)a3;
@end

@implementation DEGroundingInfo

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_This.mText.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_This.mText.__r_.__value_.var0.var1.__data_);
  }
  begin = self->_This.mTimestamps.__begin_;
  if (begin)
  {
    self->_This.mTimestamps.__end_ = begin;
    operator delete(begin);
  }
}

- (void)setThis:(GroundingInfo *)a3
{
}

- (GroundingInfo)This
{
  objc_copyCppObjectAtomic(retstr, (const void *)(v1 + 8), (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__4337);
  return result;
}

- (id)timestamps
{
  [(DEGroundingInfo *)self This];
  v12 = 0;
  v13 = 0;
  uint64_t v14 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v12, v8, v9, (v9 - (uint64_t)v8) >> 3);
  if (v11 < 0) {
    operator delete(__p);
  }
  if (v8) {
    operator delete(v8);
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = v12;
  v4 = v13;
  if (v12 != v13)
  {
    v5 = v12;
    do
    {
      v6 = [NSNumber numberWithDouble:*v5];
      [v2 addObject:v6];

      ++v5;
    }
    while (v5 != v4);
  }
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

- (int)count
{
  [(DEGroundingInfo *)self This];
  if (v6 < 0) {
    operator delete(__p);
  }
  if (v4) {
    operator delete(v4);
  }
  return v3;
}

- (id)text
{
  id v2 = NSString;
  [(DEGroundingInfo *)self This];
  if ((__p[23] & 0x80000000) != 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)__p, *(std::string::size_type *)&__p[8]);
  }
  else {
    std::string v8 = *(std::string *)__p;
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v3 = &v8;
  }
  else {
    int v3 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  if (v6) {
    operator delete(v6);
  }
  return v4;
}

- (id)init:(int)a3 timeStamps:(id)a4 text:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  id v8 = a5;
  v46.receiver = self;
  v46.super_class = (Class)DEGroundingInfo;
  uint64_t v9 = [(DEGroundingInfo *)&v46 init];
  if (v9)
  {
    v43 = 0;
    v44 = 0;
    unint64_t v45 = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v10 = v31;
    v29 = v9;
    id v30 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v47 count:16];
    int v28 = a3;
    if (v11)
    {
      v12 = 0;
      v13 = 0;
      unint64_t v14 = 0;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(v10);
          }
          id v17 = *(id *)(*((void *)&v39 + 1) + 8 * i);
          [v17 doubleValue];
          uint64_t v19 = v18;
          if ((unint64_t)v12 >= v14)
          {
            uint64_t v20 = (v12 - v13) >> 3;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 61)
            {
              unint64_t v45 = v14;
              v43 = v13;
              std::vector<BOOL>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v14 - (void)v13) >> 2 > v21) {
              unint64_t v21 = (uint64_t)(v14 - (void)v13) >> 2;
            }
            if (v14 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v22 = v21;
            }
            if (v22) {
              unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<morphun::dialog::SemanticFeatureConceptBase *>>(v22);
            }
            else {
              uint64_t v23 = 0;
            }
            v24 = (char *)(v22 + 8 * v20);
            *(void *)v24 = v19;
            v25 = v24 + 8;
            while (v12 != v13)
            {
              uint64_t v26 = *((void *)v12 - 1);
              v12 -= 8;
              *((void *)v24 - 1) = v26;
              v24 -= 8;
            }
            unint64_t v14 = v22 + 8 * v23;
            v44 = v25;
            if (v13) {
              operator delete(v13);
            }
            v13 = v24;
            v12 = v25;
          }
          else
          {
            *(void *)v12 = v18;
            v12 += 8;
          }
          v44 = v12;
        }
        unint64_t v45 = v14;
        v43 = v13;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v11);
    }
    else
    {
      v13 = 0;
    }

    std::string::basic_string[abi:ne180100]<0>(v32, (char *)[v30 UTF8String]);
    uint64_t v9 = v29;
    siri::dialogengine::GroundingInfo::GroundingInfo(&v34, v28, (uint64_t)&v43, (long long *)v32);
    [(DEGroundingInfo *)v29 setThis:&v34];
    id v8 = v30;
    if (v38 < 0) {
      operator delete(__p);
    }
    if (v35)
    {
      v36 = v35;
      operator delete(v35);
    }
    if (v33 < 0) {
      operator delete(v32[0]);
    }
    if (v13)
    {
      v44 = v13;
      operator delete(v13);
    }
  }

  return v9;
}

@end