@interface MLMultiArrayBufferLayout
- (BOOL)isSubspaceOfBufferLayout:(id)a3;
- (MLMultiArrayBufferLayout)initWithShape:(id)a3 strides:(id)a4;
- (NSArray)shape;
- (NSArray)strides;
- (id).cxx_construct;
- (id)_equivalentFirstMajorBufferLayout;
- (id)description;
- (int64_t)_nonTrivialOffsetOfScalarAtIndex:(int64_t)a3;
- (int64_t)_nonTrivialScalarIndexAtOffset:(int64_t)a3;
- (int64_t)_scalarIndexAtOffset:(int64_t)a3 contiguousScalars:(int64_t *)a4;
- (int64_t)count;
- (int64_t)offsetOfScalarAtIndex:(int64_t)a3 contiguousScalars:(int64_t *)a4;
- (uint64_t)initWithShape:(uint64_t *)a3 strides:(uint64_t)a4;
@end

@implementation MLMultiArrayBufferLayout

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_shape, 0);
  begin = self->_innerToOuterIndices.__begin_;
  if (begin)
  {
    self->_innerToOuterIndices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_bufferStrides.__begin_;
  if (v4)
  {
    self->_bufferStrides.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_scalarStrides.__begin_;
  if (v5)
  {
    self->_scalarStrides.__end_ = v5;
    operator delete(v5);
  }
}

- (NSArray)strides
{
  return self->_strides;
}

- (NSArray)shape
{
  return self->_shape;
}

- (int64_t)count
{
  return self->_scalarCount;
}

- (id)_equivalentFirstMajorBufferLayout
{
  if (self->_firstMajorLayout)
  {
    v3 = self;
  }
  else
  {
    v4 = [(MLMultiArrayBufferLayout *)self shape];
    v5 = [(MLMultiArrayBufferLayout *)self strides];
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    begin = self->_innerToOuterIndices.__begin_;
    end = self->_innerToOuterIndices.__end_;
    while (begin != end)
    {
      unint64_t v10 = *begin;
      v11 = [v4 objectAtIndexedSubscript:*begin];
      [v6 addObject:v11];

      v12 = [v5 objectAtIndexedSubscript:v10];
      [v7 addObject:v12];

      ++begin;
    }
    v3 = [[MLMultiArrayBufferLayout alloc] initWithShape:v6 strides:v7];
  }

  return v3;
}

- (BOOL)isSubspaceOfBufferLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MLMultiArrayBufferLayout *)self count];
  if (v5 <= [v4 count])
  {
    v7 = [(MLMultiArrayBufferLayout *)self _equivalentFirstMajorBufferLayout];
    v8 = [v4 _equivalentFirstMajorBufferLayout];
    uint64_t v9 = 0;
    do
    {
      BOOL v6 = v9 >= v5;
      if (v9 >= v5) {
        break;
      }
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      objc_msgSend(v8, "_scalarIndexAtOffset:contiguousScalars:", objc_msgSend(v7, "offsetOfScalarAtIndex:contiguousScalars:", v9, &v12), &v11);
      v9 += v12;
    }
    while (v12 <= v11);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_nonTrivialScalarIndexAtOffset:(int64_t)a3
{
  begin = self->_bufferStrides.__begin_;
  end = self->_bufferStrides.__end_;
  int64_t v7 = (char *)end - (char *)begin;
  if (end == begin)
  {
    uint64_t v9 = 0;
    v8 = 0;
  }
  else
  {
    if (v7 < 0) {
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    }
    v8 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v7 >> 3);
    bzero(v8, v7);
    uint64_t v9 = &v8[v7];
  }
  uint64_t v11 = self->_innerToOuterIndices.__begin_;
  unint64_t v10 = self->_innerToOuterIndices.__end_;
  if (v10 != v11)
  {
    uint64_t v12 = self->_bufferStrides.__begin_;
    do
    {
      uint64_t v13 = *--v10;
      int64_t v14 = v12[v13];
      int64_t v15 = a3 / v14;
      a3 %= v14;
      *(void *)&v8[8 * v13] = v15;
    }
    while (v10 != v11);
  }
  if (v8 == v9)
  {
    int64_t v22 = 0;
    if (!v8) {
      return v22;
    }
    goto LABEL_12;
  }
  int v16 = 0;
  v17 = self->_scalarStrides.__begin_;
  v18 = v8;
  do
  {
    int v20 = *(_DWORD *)v18;
    v18 += 8;
    int v19 = v20;
    int v21 = *(_DWORD *)v17++;
    v16 += v21 * v19;
  }
  while (v18 != v9);
  int64_t v22 = v16;
  if (v8) {
LABEL_12:
  }
    operator delete(v8);
  return v22;
}

- (int64_t)_scalarIndexAtOffset:(int64_t)a3 contiguousScalars:(int64_t *)a4
{
  if (!self->_firstMajorContiguousLayout)
  {
    a3 = [(MLMultiArrayBufferLayout *)self _nonTrivialScalarIndexAtOffset:a3];
    if (!a4) {
      return a3;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    *a4 = self->_contiguousScalarBlockSize
        + a3 / self->_contiguousScalarBlockSize * self->_contiguousScalarBlockSize
        - a3;
  return a3;
}

- (int64_t)_nonTrivialOffsetOfScalarAtIndex:(int64_t)a3
{
  begin = self->_scalarStrides.__begin_;
  end = self->_scalarStrides.__end_;
  if (begin == end) {
    return 0;
  }
  int64_t result = 0;
  int64_t v7 = self->_bufferStrides.__begin_;
  do
  {
    uint64_t v9 = *begin++;
    uint64_t v8 = v9;
    int64_t v10 = a3 / v9;
    uint64_t v11 = *v7++;
    result += v11 * v10;
    a3 -= v10 * v8;
  }
  while (begin != end);
  return result;
}

- (int64_t)offsetOfScalarAtIndex:(int64_t)a3 contiguousScalars:(int64_t *)a4
{
  if (a3 < 0 || self->_scalarCount <= a3)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Index is out-of-range." userInfo:0];
    objc_exception_throw(v8);
  }
  int64_t result = a3;
  if (!self->_firstMajorContiguousLayout) {
    int64_t result = [(MLMultiArrayBufferLayout *)self _nonTrivialOffsetOfScalarAtIndex:a3];
  }
  if (a4) {
    *a4 = self->_contiguousScalarBlockSize
  }
        + a3 / self->_contiguousScalarBlockSize * self->_contiguousScalarBlockSize
        - a3;
  return result;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MLMultiArrayBufferLayout *)self shape];
  uint64_t v5 = [v4 componentsJoinedByString:@"x"];
  BOOL v6 = [(MLMultiArrayBufferLayout *)self strides];
  int64_t v7 = [v6 componentsJoinedByString:@","];
  id v8 = [v3 stringWithFormat:@"shape: [%@], strides: [%@]", v5, v7];

  return v8;
}

- (MLMultiArrayBufferLayout)initWithShape:(id)a3 strides:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v70 = a4;
  uint64_t v5 = [v69 count];
  if (v5 != [v70 count])
  {
    BOOL v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = [v69 count];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v70 count];
    }

    int64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = [v69 count];
    uint64_t v9 = [v70 count];
  }
  v80.receiver = self;
  v80.super_class = (Class)MLMultiArrayBufferLayout;
  v72 = [(MLMultiArrayBufferLayout *)&v80 init];
  if (v72)
  {
    CoreML::numericVectorFromObjC<long>((uint64_t)&v78, v69);
    CoreML::numericVectorFromObjC<long>((uint64_t)&v76, v70);
    v75 = 0;
    long long v74 = 0uLL;
    id v68 = v69;
    std::vector<long long>::reserve((void **)&v74, [v68 count]);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    int64_t v10 = [v68 reverseObjectEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v81 objects:buf count:16];
    uint64_t v12 = (char *)v74;
    if (v11)
    {
      uint64_t v13 = *(void *)v82;
      unint64_t v14 = (unint64_t)v75;
      uint64_t v15 = 1;
      id obj = v10;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v82 != v13) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v81 + 1) + 8 * i);
          v18 = (char *)*((void *)&v74 + 1);
          if (*((void *)&v74 + 1) >= v14)
          {
            uint64_t v20 = (uint64_t)(*((void *)&v74 + 1) - (void)v12) >> 3;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 61)
            {
              v75 = (int64_t *)v14;
              *(void *)&long long v74 = v12;
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v14 - (void)v12) >> 2 > v21) {
              unint64_t v21 = (uint64_t)(v14 - (void)v12) >> 2;
            }
            if (v14 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v22 = v21;
            }
            if (v22) {
              unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v22);
            }
            else {
              uint64_t v23 = 0;
            }
            v24 = (uint64_t *)(v22 + 8 * v20);
            uint64_t *v24 = v15;
            int v19 = (char *)(v24 + 1);
            while (v18 != v12)
            {
              uint64_t v25 = *((void *)v18 - 1);
              v18 -= 8;
              *--v24 = v25;
            }
            unint64_t v14 = v22 + 8 * v23;
            *((void *)&v74 + 1) = v19;
            if (v12) {
              operator delete(v12);
            }
            uint64_t v12 = (char *)v24;
          }
          else
          {
            **((void **)&v74 + 1) = v15;
            int v19 = v18 + 8;
          }
          *((void *)&v74 + 1) = v19;
          v15 *= [v17 integerValue];
        }
        v75 = (int64_t *)v14;
        *(void *)&long long v74 = v12;
        int64_t v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v81 objects:buf count:16];
      }
      while (v11);
    }
    else
    {
      int v19 = (char *)*((void *)&v74 + 1);
    }

    if (v12 != v19)
    {
      v26 = v19 - 8;
      if (v19 - 8 > v12)
      {
        v27 = v12 + 8;
        do
        {
          uint64_t v28 = *((void *)v27 - 1);
          *((void *)v27 - 1) = *(void *)v26;
          *(void *)v26 = v28;
          v26 -= 8;
          BOOL v29 = v27 >= v26;
          v27 += 8;
        }
        while (!v29);
      }
    }

    begin = v72->_scalarStrides.__begin_;
    if (begin)
    {
      v72->_scalarStrides.__end_ = begin;
      operator delete(begin);
      v72->_scalarStrides.__begin_ = 0;
      v72->_scalarStrides.__end_ = 0;
      v72->_scalarStrides.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v72->_scalarStrides.__begin_ = v74;
    v72->_scalarStrides.__end_cap_.__value_ = v75;
    v31 = v78;
    int v32 = 1;
    if (v78 != v79)
    {
      v33 = v78;
      do
      {
        uint64_t v34 = *v33++;
        uint64_t v35 = v32 * v34;
        if ((unsigned __int128)(v32 * (__int128)v34) >> 64 == v35 >> 63) {
          int v32 = v35;
        }
        else {
          int v32 = -1;
        }
      }
      while (v33 != v79);
    }
    v72->_scalarCount = v32;
    uint64_t v36 = [v68 copy];
    shape = v72->_shape;
    v72->_shape = (NSArray *)v36;

    uint64_t v38 = [v70 copy];
    strides = v72->_strides;
    v72->_strides = (NSArray *)v38;

    long long v40 = v76;
    v41 = (uint64_t *)v76;
    if ((void)v76 != *((void *)&v76 + 1))
    {
      v42 = (uint64_t *)(v76 + 8);
      while (v42 != *((uint64_t **)&v76 + 1))
      {
        uint64_t v44 = *(v42 - 1);
        uint64_t v43 = *v42++;
        if (v43 > v44)
        {
          v41 = v42 - 1;
          goto LABEL_51;
        }
      }
      v41 = (uint64_t *)*((void *)&v76 + 1);
    }
LABEL_51:
    v72->_firstMajorLayout = v41 == *((uint64_t **)&v76 + 1);
    v46 = v72->_scalarStrides.__begin_;
    end = v72->_scalarStrides.__end_;
    uint64_t v47 = (char *)end - (char *)v46;
    BOOL v48 = (char *)end - (char *)v46 == *((void *)&v40 + 1) - (void)v40
       && memcmp(v72->_scalarStrides.__begin_, (const void *)v40, (char *)end - (char *)v46) == 0;
    v72->_firstMajorContiguousLayout = v48;
    v72->_contiguousScalarBlockSize = 1;
    if (end != v46)
    {
      uint64_t v49 = v47 >> 3;
      if ((unint64_t)(v47 >> 3) <= 1) {
        uint64_t v49 = 1;
      }
      v50 = (uint64_t *)((char *)v31 + v47 - 8);
      v51 = (uint64_t *)(v40 + v47 - 8);
      v52 = end - 1;
      do
      {
        uint64_t v54 = *v52--;
        uint64_t v53 = v54;
        uint64_t v55 = *v51--;
        if (v53 != v55) {
          break;
        }
        uint64_t v56 = *v50 * v53;
        if ((unsigned __int128)(*v50 * (__int128)v53) >> 64 != v56 >> 63)
        {
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "integer overflow in multiplication.");
          exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
          __cxa_throw(exception, (struct type_info *)off_1E59A3018, MEMORY[0x1E4FBA1D0]);
        }
        v72->_contiguousScalarBlockSize = v56;
        --v50;
        --v49;
      }
      while (v49);
    }
    std::vector<unsigned long>::vector(buf, (uint64_t)(*((void *)&v40 + 1) - v40) >> 3);
    v57 = v72->_innerToOuterIndices.__begin_;
    if (v57)
    {
      v72->_innerToOuterIndices.__end_ = v57;
      operator delete(v57);
      v72->_innerToOuterIndices.__begin_ = 0;
      v72->_innerToOuterIndices.__end_ = 0;
      v72->_innerToOuterIndices.__end_cap_.__value_ = 0;
    }
    uint64_t v58 = *(void *)buf;
    v72->_innerToOuterIndices.__begin_ = *(unint64_t **)buf;
    v59 = *(uint64_t **)&buf[8];
    *(_OWORD *)&v72->_innerToOuterIndices.__end_ = *(_OWORD *)&buf[8];
    if ((uint64_t *)v58 != v59)
    {
      uint64_t v60 = 0;
      v61 = (uint64_t *)v58;
      do
        *v61++ = v60++;
      while (v61 != v59);
    }
    unint64_t v62 = 126 - 2 * __clz(((uint64_t)v59 - v58) >> 3);
    *(void *)buf = &v76;
    if (v59 == (uint64_t *)v58) {
      uint64_t v63 = 0;
    }
    else {
      uint64_t v63 = v62;
    }
    std::__introsort<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *,false>(v58, v59, (uint64_t **)buf, v63, 1);
    v64 = v72->_bufferStrides.__begin_;
    if (v64)
    {
      v72->_bufferStrides.__end_ = v64;
      operator delete(v64);
      v72->_bufferStrides.__begin_ = 0;
      v72->_bufferStrides.__end_ = 0;
      v72->_bufferStrides.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v72->_bufferStrides.__begin_ = v76;
    v65 = v78;
    v72->_bufferStrides.__end_cap_.__value_ = v77;
    if (v65) {
      operator delete(v65);
    }
  }

  return v72;
}

- (uint64_t)initWithShape:(uint64_t *)a3 strides:(uint64_t)a4
{
  uint64_t v11 = (uint64_t *)result;
  while (2)
  {
    uint64_t v12 = a2 - 1;
    uint64_t v13 = v11;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v11 = v13;
          uint64_t v14 = (char *)a2 - (char *)v13;
          unint64_t v15 = a2 - v13;
          if (v6 || !v5)
          {
            switch(v15)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                uint64_t v47 = *v13;
                if (*(void *)(**a3 + 8 * *v12) < *(void *)(**a3 + 8 * *v13))
                {
                  *uint64_t v13 = *v12;
                  uint64_t *v12 = v47;
                }
                break;
              case 3uLL:
                uint64_t v48 = **a3;
                int64_t result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MLMultiArrayBufferLayout *)v13 initWithShape:a2 - 1 strides:v48];
                break;
              case 4uLL:
                int64_t result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v13, v13 + 1, v13 + 2, a2 - 1, a3);
                break;
              case 5uLL:
                uint64_t v49 = v13 + 1;
                v50 = v13 + 2;
                v51 = v13 + 3;
                int64_t result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v13, v13 + 1, v13 + 2, v13 + 3, a3);
                uint64_t v52 = v13[3];
                uint64_t v53 = **a3;
                if (*(void *)(v53 + 8 * *v12) < *(void *)(v53 + 8 * v52))
                {
                  uint64_t *v51 = *v12;
                  uint64_t *v12 = v52;
                  uint64_t v54 = *v51;
                  uint64_t v55 = *v50;
                  if (*(void *)(v53 + 8 * *v51) < *(void *)(v53 + 8 * *v50))
                  {
                    uint64_t *v50 = v54;
                    uint64_t *v51 = v55;
                    uint64_t v56 = *v49;
                    if (*(void *)(v53 + 8 * v54) < *(void *)(v53 + 8 * *v49))
                    {
                      v13[1] = v54;
                      v13[2] = v56;
                      uint64_t v57 = *v13;
                      if (*(void *)(v53 + 8 * v54) < *(void *)(v53 + 8 * *v13))
                      {
                        *uint64_t v13 = v54;
                        v13[1] = v57;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v14 <= 191)
          {
            if (a5)
            {
              if (v13 != a2)
              {
                uint64_t v58 = v13 + 1;
                if (v13 + 1 != a2)
                {
                  uint64_t v59 = **a3;
                  uint64_t v60 = 8;
                  v61 = v13;
                  do
                  {
                    uint64_t v63 = *v61;
                    uint64_t v62 = v61[1];
                    v61 = v58;
                    if (*(void *)(v59 + 8 * v62) < *(void *)(v59 + 8 * v63))
                    {
                      uint64_t v64 = v60;
                      do
                      {
                        *(uint64_t *)((char *)v13 + v64) = v63;
                        uint64_t v65 = v64 - 8;
                        if (v64 == 8)
                        {
                          v66 = v13;
                          goto LABEL_78;
                        }
                        uint64_t v63 = *(uint64_t *)((char *)v13 + v64 - 16);
                        v64 -= 8;
                      }
                      while (*(void *)(v59 + 8 * v62) < *(void *)(v59 + 8 * v63));
                      v66 = (uint64_t *)((char *)v13 + v65);
LABEL_78:
                      uint64_t *v66 = v62;
                    }
                    uint64_t v58 = v61 + 1;
                    v60 += 8;
                  }
                  while (v61 + 1 != a2);
                }
              }
            }
            else if (v13 != a2)
            {
              v98 = v13 + 1;
              if (v13 + 1 != a2)
              {
                uint64_t v99 = **a3;
                do
                {
                  uint64_t v101 = *v11;
                  uint64_t v100 = v11[1];
                  uint64_t v11 = v98;
                  if (*(void *)(v99 + 8 * v100) < *(void *)(v99 + 8 * v101))
                  {
                    do
                    {
                      uint64_t *v98 = v101;
                      uint64_t v101 = *(v98 - 2);
                      --v98;
                    }
                    while (*(void *)(v99 + 8 * v100) < *(void *)(v99 + 8 * v101));
                    uint64_t *v98 = v100;
                  }
                  v98 = v11 + 1;
                }
                while (v11 + 1 != a2);
              }
            }
            return result;
          }
          if (!a4)
          {
            if (v13 != a2)
            {
              int64_t v67 = (v15 - 2) >> 1;
              id v68 = *a3;
              int64_t v69 = v67;
              do
              {
                int64_t v70 = v69;
                if (v67 >= v69)
                {
                  uint64_t v71 = (2 * v69) | 1;
                  v72 = &v13[v71];
                  uint64_t v73 = *v72;
                  if (2 * v70 + 2 < (uint64_t)v15)
                  {
                    uint64_t v74 = *v68;
                    if (*(void *)(*v68 + 8 * v73) < *(void *)(*v68 + 8 * v72[1]))
                    {
                      uint64_t v73 = v72[1];
                      ++v72;
                      uint64_t v71 = 2 * v70 + 2;
                    }
                  }
                  else
                  {
                    uint64_t v74 = *v68;
                  }
                  v75 = &v13[v70];
                  uint64_t v76 = *v75;
                  int64_t result = *(void *)(v74 + 8 * v73);
                  if (result >= *(void *)(v74 + 8 * *v75))
                  {
                    do
                    {
                      int64_t result = (uint64_t)v72;
                      uint64_t *v75 = v73;
                      if (v67 < v71) {
                        break;
                      }
                      uint64_t v77 = (2 * v71) | 1;
                      v72 = &v13[v77];
                      uint64_t v78 = 2 * v71 + 2;
                      uint64_t v73 = *v72;
                      if (v78 < (uint64_t)v15 && *(void *)(v74 + 8 * v73) < *(void *)(v74 + 8 * v72[1]))
                      {
                        uint64_t v73 = v72[1];
                        ++v72;
                        uint64_t v77 = v78;
                      }
                      v75 = (uint64_t *)result;
                      uint64_t v71 = v77;
                    }
                    while (*(void *)(v74 + 8 * v73) >= *(void *)(v74 + 8 * v76));
                    *(void *)int64_t result = v76;
                  }
                }
                int64_t v69 = v70 - 1;
              }
              while (v70);
              uint64_t v79 = (unint64_t)v14 >> 3;
              do
              {
                uint64_t v80 = 0;
                uint64_t v81 = *v13;
                long long v82 = *a3;
                long long v83 = v13;
                do
                {
                  long long v84 = &v83[v80];
                  uint64_t v87 = v84[1];
                  v85 = v84 + 1;
                  uint64_t v86 = v87;
                  uint64_t v88 = (2 * v80) | 1;
                  uint64_t v89 = 2 * v80 + 2;
                  if (v89 < v79)
                  {
                    int64_t result = v85[1];
                    if (*(void *)(*v82 + 8 * v86) < *(void *)(*v82 + 8 * result))
                    {
                      uint64_t v86 = v85[1];
                      ++v85;
                      uint64_t v88 = v89;
                    }
                  }
                  *long long v83 = v86;
                  long long v83 = v85;
                  uint64_t v80 = v88;
                }
                while (v88 <= (uint64_t)((unint64_t)(v79 - 2) >> 1));
                if (v85 == --a2)
                {
                  uint64_t *v85 = v81;
                }
                else
                {
                  uint64_t *v85 = *a2;
                  *a2 = v81;
                  uint64_t v90 = (char *)v85 - (char *)v13 + 8;
                  if (v90 >= 9)
                  {
                    unint64_t v91 = (((unint64_t)v90 >> 3) - 2) >> 1;
                    v92 = &v13[v91];
                    uint64_t v93 = *v92;
                    uint64_t v94 = *v85;
                    uint64_t v95 = *v82;
                    if (*(void *)(v95 + 8 * *v92) < *(void *)(v95 + 8 * *v85))
                    {
                      do
                      {
                        v96 = v92;
                        uint64_t *v85 = v93;
                        if (!v91) {
                          break;
                        }
                        unint64_t v91 = (v91 - 1) >> 1;
                        v92 = &v13[v91];
                        uint64_t v93 = *v92;
                        v85 = v96;
                      }
                      while (*(void *)(v95 + 8 * *v92) < *(void *)(v95 + 8 * v94));
                      uint64_t *v96 = v94;
                    }
                  }
                }
              }
              while (v79-- > 2);
            }
            return result;
          }
          unint64_t v16 = v15 >> 1;
          v17 = &v13[v15 >> 1];
          uint64_t v18 = **a3;
          if ((unint64_t)v14 >= 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MLMultiArrayBufferLayout *)v11 initWithShape:a2 - 1 strides:v18];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MLMultiArrayBufferLayout *)v11 + 1 initWithShape:a2 - 2 strides:**a3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MLMultiArrayBufferLayout *)v11 + 2 initWithShape:a2 - 3 strides:**a3];
            int64_t result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MLMultiArrayBufferLayout *)v17 - 1 initWithShape:&v11[v16 + 1] strides:**a3];
            uint64_t v19 = *v11;
            uint64_t *v11 = *v17;
            uint64_t *v17 = v19;
          }
          else
          {
            int64_t result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,[(MLMultiArrayBufferLayout *)&v11[v15 >> 1] initWithShape:a2 - 1 strides:v18];
          }
          --a4;
          uint64_t v20 = *v11;
          uint64_t v21 = **a3;
          if (a5) {
            break;
          }
          uint64_t v22 = *(void *)(v21 + 8 * v20);
          if (*(void *)(v21 + 8 * *(v11 - 1)) < v22) {
            goto LABEL_13;
          }
          if (v22 >= *(void *)(v21 + 8 * *v12))
          {
            uint64_t v38 = v11 + 1;
            do
            {
              uint64_t v13 = v38;
              if (v38 >= a2) {
                break;
              }
              ++v38;
            }
            while (v22 >= *(void *)(v21 + 8 * *v13));
          }
          else
          {
            uint64_t v13 = v11;
            do
            {
              uint64_t v37 = v13[1];
              ++v13;
            }
            while (v22 >= *(void *)(v21 + 8 * v37));
          }
          v39 = a2;
          if (v13 < a2)
          {
            v39 = a2;
            do
              uint64_t v40 = *--v39;
            while (v22 < *(void *)(v21 + 8 * v40));
          }
          if (v13 < v39)
          {
            uint64_t v41 = *v13;
            uint64_t v42 = *v39;
            do
            {
              *uint64_t v13 = v42;
              uint64_t *v39 = v41;
              uint64_t v43 = *(void *)(v21 + 8 * v20);
              do
              {
                uint64_t v44 = v13[1];
                ++v13;
                uint64_t v41 = v44;
              }
              while (v43 >= *(void *)(v21 + 8 * v44));
              do
              {
                uint64_t v45 = *--v39;
                uint64_t v42 = v45;
              }
              while (v43 < *(void *)(v21 + 8 * v45));
            }
            while (v13 < v39);
          }
          v46 = v13 - 1;
          BOOL v5 = v13 - 1 >= v11;
          BOOL v6 = v13 - 1 == v11;
          if (v13 - 1 != v11) {
            uint64_t *v11 = *v46;
          }
          a5 = 0;
          uint64_t *v46 = v20;
        }
        uint64_t v22 = *(void *)(v21 + 8 * v20);
LABEL_13:
        uint64_t v23 = v11;
        do
        {
          v24 = v23;
          uint64_t v26 = v23[1];
          ++v23;
          uint64_t v25 = v26;
        }
        while (*(void *)(v21 + 8 * v26) < v22);
        v27 = a2;
        if (v24 == v11)
        {
          v27 = a2;
          do
          {
            if (v23 >= v27) {
              break;
            }
            uint64_t v29 = *--v27;
          }
          while (*(void *)(v21 + 8 * v29) >= v22);
        }
        else
        {
          do
            uint64_t v28 = *--v27;
          while (*(void *)(v21 + 8 * v28) >= v22);
        }
        if (v23 < v27)
        {
          uint64_t v30 = *v27;
          v31 = v23;
          int v32 = v27;
          do
          {
            uint64_t *v31 = v30;
            *int v32 = v25;
            uint64_t v33 = *(void *)(v21 + 8 * v20);
            do
            {
              v24 = v31;
              uint64_t v34 = v31[1];
              ++v31;
              uint64_t v25 = v34;
            }
            while (*(void *)(v21 + 8 * v34) < v33);
            do
            {
              uint64_t v35 = *--v32;
              uint64_t v30 = v35;
            }
            while (*(void *)(v21 + 8 * v35) >= v33);
          }
          while (v31 < v32);
        }
        if (v24 != v11) {
          uint64_t *v11 = *v24;
        }
        uint64_t *v24 = v20;
        if (v23 >= v27) {
          break;
        }
LABEL_32:
        int64_t result = std::__introsort<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *,false>(v11, v24, a3, a4, a5 & 1);
        a5 = 0;
        uint64_t v13 = v24 + 1;
      }
      BOOL v36 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v11, v24, a3);
      uint64_t v13 = v24 + 1;
      int64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLMultiArrayBufferLayout initWithShape:strides:]::$_0 &,unsigned long *>(v24 + 1, a2, a3);
      if (result) {
        break;
      }
      if (!v36) {
        goto LABEL_32;
      }
    }
    a2 = v24;
    if (!v36) {
      continue;
    }
    return result;
  }
}

@end