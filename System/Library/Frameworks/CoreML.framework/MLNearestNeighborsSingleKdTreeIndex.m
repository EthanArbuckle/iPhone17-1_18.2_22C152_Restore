@interface MLNearestNeighborsSingleKdTreeIndex
+ (BOOL)supportsSecureCoding;
- (BOOL)updateWithData:(const void *)a3 error:(id *)a4;
- (MLNearestNeighborsSingleKdTreeIndex)initWithCoder:(id)a3;
- (MLNearestNeighborsSingleKdTreeIndex)initWithDataset:(void *)a3 numberOfDimensions:(unint64_t)a4 leafSize:(unint64_t)a5 error:(id *)a6;
- (_KDNode)root;
- (id).cxx_construct;
- (id)constructTree;
- (id)constructTreeForPointsBoundedBy:(void *)a3 startingIndex:(unint64_t)a4 count:(unint64_t)a5;
- (unint64_t)dataPointCount;
- (unint64_t)leafSize;
- (unint64_t)numDimensions;
- (vector<std::pair<unsigned)calculateDistancesForNodesBetweenLeft:(std:(float>>> *__return_ptr)retstr :(vector<std:()float> :(std:(float>>> *)self :(SEL)a3 allocator<std:(unint64_t)a4 :(unint64_t)a5 pair<unsigned)long pair<unsigned)long allocator<std:(const void *)a6 :pair<unsigned)long andRight:toQueryPoint:;
- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsSingleKdTreeIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toIndex:(unint64_t)a5;
- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsSingleKdTreeIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toQueryPoint:(const void *)a5;
- (void)encodeWithCoder:(id)a3;
- (void)findK:(unint64_t)a3 nearestNeighbors:(void *)a4 toQueryPoint:(const void *)a5 inTree:(id)a6;
- (void)setLeafSize:(unint64_t)a3;
- (void)setNumDimensions:(unint64_t)a3;
- (void)setRoot:(id)a3;
@end

@implementation MLNearestNeighborsSingleKdTreeIndex

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  begin = self->vIndices.__begin_;
  if (begin)
  {
    self->vIndices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->vData.__begin_;
  if (v4)
  {
    self->vData.__end_ = v4;
    operator delete(v4);
  }
}

- (void)setRoot:(id)a3
{
}

- (_KDNode)root
{
  return self->_root;
}

- (void)setLeafSize:(unint64_t)a3
{
  self->_leafSize = a3;
}

- (unint64_t)leafSize
{
  return self->_leafSize;
}

- (void)setNumDimensions:(unint64_t)a3
{
  self->_numDimensions = a3;
}

- (unint64_t)numDimensions
{
  return self->_numDimensions;
}

- (MLNearestNeighborsSingleKdTreeIndex)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MLNearestNeighborsSingleKdTreeIndex;
  v5 = [(MLNearestNeighborsSingleKdTreeIndex *)&v23 init];
  if (v5)
  {
    *((void *)v5 + 7) = [v4 decodeIntegerForKey:@"kNumDimensions"];
    *((void *)v5 + 8) = [v4 decodeIntegerForKey:@"kLeafSize"];
    uint64_t v22 = 0;
    id v6 = v4;
    v7 = (const void *)[v6 decodeBytesForKey:@"kVData" returnedLength:&v22];
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    v19 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v19, v7, (uint64_t)v7 + (v22 & 0xFFFFFFFFFFFFFFFCLL), v22 >> 2);
    v8 = v19;
    std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v5 + 8, v19, v20, (v20 - (uint64_t)v19) >> 2);
    id v9 = v6;
    v10 = (const void *)[v9 decodeBytesForKey:@"kVIndices" returnedLength:&v22];
    v17 = 0;
    uint64_t v18 = 0;
    __p = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v10, (uint64_t)v10 + (v22 & 0xFFFFFFFFFFFFFFF8), v22 >> 3);
    if (v5 + 32 != (char *)&__p) {
      std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v5 + 32, (char *)__p, (uint64_t)v17, (v17 - (unsigned char *)__p) >> 3);
    }
    id v15 = 0;
    uint64_t v11 = [v9 decodeTopLevelObjectOfClass:objc_opt_class() forKey:@"kRoot" error:&v15];
    id v12 = v15;
    v13 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v11;

    if (__p)
    {
      v17 = __p;
      operator delete(__p);
    }
    if (v8) {
      operator delete(v8);
    }
  }
  return (MLNearestNeighborsSingleKdTreeIndex *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MLNearestNeighborsSingleKdTreeIndex numDimensions](self, "numDimensions"), @"kNumDimensions");
  objc_msgSend(v5, "encodeInteger:forKey:", -[MLNearestNeighborsSingleKdTreeIndex leafSize](self, "leafSize"), @"kLeafSize");
  [v5 encodeBytes:self->vData.__begin_ length:(char *)self->vData.__end_ - (char *)self->vData.__begin_ forKey:@"kVData"];
  [v5 encodeBytes:self->vIndices.__begin_ length:(char *)self->vIndices.__end_ - (char *)self->vIndices.__begin_ forKey:@"kVIndices"];
  id v4 = [(MLNearestNeighborsSingleKdTreeIndex *)self root];
  [v5 encodeObject:v4 forKey:@"kRoot"];
}

- (void)findK:(unint64_t)a3 nearestNeighbors:(void *)a4 toQueryPoint:(const void *)a5 inTree:(id)a6
{
  id v10 = a6;
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 isLeaf])
    {
      -[MLNearestNeighborsSingleKdTreeIndex calculateDistancesForNodesBetweenLeft:andRight:toQueryPoint:](self, "calculateDistancesForNodesBetweenLeft:andRight:toQueryPoint:", [v11 startingIndex], objc_msgSend(v11, "startingIndex") + objc_msgSend(v11, "count") - 1, a5);
      unint64_t v12 = (uint64_t)(*((void *)&v56 + 1) - v56) >> 4;
      unint64_t v13 = 126 - 2 * __clz(v12);
      if (*((void *)&v56 + 1) == (void)v56) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v13;
      }
      std::__introsort<std::_ClassicAlgPolicy,CoreML::CompareIndexDistancePairs &,std::pair<unsigned long,float> *,false>((float *)v56, *((float **)&v56 + 1), v14, 1);
      if (v12 >= a3) {
        unint64_t v12 = a3;
      }
      if (v12)
      {
        uint64_t v15 = 0;
        while (1)
        {
          v16 = (float *)(v56 + 16 * v15);
          float v17 = *v16;
          float v18 = v16[2];
          v19 = (float *)*((void *)a4 + 1);
          uint64_t v20 = (float *)*((void *)a4 + 2);
          uint64_t v21 = ((char *)v20 - (char *)v19) >> 3;
          unint64_t v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) <= *(void *)a4) {
            break;
          }
          if (v18 < v19[1])
          {
            _KDPriorityQueue::pop((_KDPriorityQueue *)a4);
            uint64_t v20 = (float *)*((void *)a4 + 2);
            unint64_t v23 = *((void *)a4 + 3);
            if ((unint64_t)v20 >= v23)
            {
              v19 = (float *)*((void *)a4 + 1);
              uint64_t v24 = ((char *)v20 - (char *)v19) >> 3;
              unint64_t v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 61) {
                goto LABEL_69;
              }
              uint64_t v26 = v23 - (void)v19;
              if (v26 >> 2 > v25) {
                unint64_t v25 = v26 >> 2;
              }
              if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v22 = v25;
              }
              if (v22)
              {
                unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v22);
                v19 = (float *)*((void *)a4 + 1);
                uint64_t v20 = (float *)*((void *)a4 + 2);
              }
              else
              {
                uint64_t v27 = 0;
              }
              unint64_t v31 = v22 + 8 * v24;
              *(float *)unint64_t v31 = v17;
              *(float *)(v31 + 4) = v18;
              unint64_t v32 = v31;
              if (v20 != v19)
              {
                do
                {
                  uint64_t v34 = *((void *)v20 - 1);
                  v20 -= 2;
                  *(void *)(v32 - 8) = v34;
                  v32 -= 8;
                }
                while (v20 != v19);
                goto LABEL_37;
              }
              goto LABEL_38;
            }
LABEL_22:
            *uint64_t v20 = v17;
            v20[1] = v18;
            uint64_t v29 = (uint64_t)(v20 + 2);
            goto LABEL_40;
          }
LABEL_41:
          if (++v15 == v12) {
            goto LABEL_67;
          }
        }
        unint64_t v28 = *((void *)a4 + 3);
        if ((unint64_t)v20 < v28) {
          goto LABEL_22;
        }
        if (v22 >> 61) {
LABEL_69:
        }
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        uint64_t v30 = v28 - (void)v19;
        if (v30 >> 2 > v22) {
          unint64_t v22 = v30 >> 2;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
        }
        if (v22)
        {
          unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v22);
          v19 = (float *)*((void *)a4 + 1);
          uint64_t v20 = (float *)*((void *)a4 + 2);
        }
        else
        {
          uint64_t v27 = 0;
        }
        unint64_t v31 = v22 + 8 * v21;
        *(float *)unint64_t v31 = v17;
        *(float *)(v31 + 4) = v18;
        unint64_t v32 = v31;
        if (v20 != v19)
        {
          do
          {
            uint64_t v33 = *((void *)v20 - 1);
            v20 -= 2;
            *(void *)(v32 - 8) = v33;
            v32 -= 8;
          }
          while (v20 != v19);
LABEL_37:
          v19 = (float *)*((void *)a4 + 1);
        }
LABEL_38:
        uint64_t v29 = v31 + 8;
        *((void *)a4 + 1) = v32;
        *((void *)a4 + 2) = v31 + 8;
        *((void *)a4 + 3) = v22 + 8 * v27;
        if (v19) {
          operator delete(v19);
        }
LABEL_40:
        *((void *)a4 + 2) = v29;
        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_KDPriorityQueueComparator &,std::__wrap_iter<_KDPriorityQueueElement *>>(*((void *)a4 + 1), v29, (v29 - *((void *)a4 + 1)) >> 3);
        goto LABEL_41;
      }
      if ((void)v56) {
LABEL_67:
      }
        operator delete((void *)v56);
    }
    else
    {
      v35 = [v11 leftChild];
      v36 = v35;
      if (v35)
      {
        [v35 boundingBox];
        long long v37 = v56;
        double v38 = _KDBoundingBox::computeDistanceFromPoint((_KDBoundingBox *)v56, *((const float **)&v56 + 1), *(float **)a5);
        float v39 = *(float *)&v38;
        if ((void)v56)
        {
          *((void *)&v56 + 1) = v56;
          operator delete((void *)v37);
        }
      }
      else
      {
        long long v56 = 0u;
        double v40 = _KDBoundingBox::computeDistanceFromPoint(0, 0, *(float **)a5);
        float v39 = *(float *)&v40;
      }

      v41 = [v11 rightChild];
      v42 = v41;
      if (v41)
      {
        [v41 boundingBox];
        double v43 = _KDBoundingBox::computeDistanceFromPoint((_KDBoundingBox *)v56, *((const float **)&v56 + 1), *(float **)a5);
        float v44 = *(float *)&v43;
        if ((void)v56) {
          operator delete((void *)v56);
        }
      }
      else
      {
        *(void *)&long long v56 = 0;
        double v45 = _KDBoundingBox::computeDistanceFromPoint(0, 0, *(float **)a5);
        float v44 = *(float *)&v45;
      }

      uint64_t v46 = *((void *)a4 + 1);
      if (a3 == (*((void *)a4 + 2) - v46) >> 3) {
        float v47 = *(float *)(v46 + 4);
      }
      else {
        float v47 = INFINITY;
      }
      if (v39 >= v44)
      {
        uint64_t v52 = [v11 rightChild];
        v49 = [v11 leftChild];
        v50 = (void *)v52;
        float v51 = v44;
        float v44 = v39;
      }
      else
      {
        uint64_t v48 = [v11 leftChild];
        v49 = [v11 rightChild];
        v50 = (void *)v48;
        float v51 = v39;
      }
      if (v51 < v47 || (uint64_t v53 = *((void *)a4 + 1), v54 = *((void *)a4 + 2) - v53, a3 > v54 >> 3))
      {
        -[MLNearestNeighborsSingleKdTreeIndex findK:nearestNeighbors:toQueryPoint:inTree:](self, "findK:nearestNeighbors:toQueryPoint:inTree:", a3, a4, a5, v50, (void)v56);
        uint64_t v53 = *((void *)a4 + 1);
        uint64_t v54 = *((void *)a4 + 2) - v53;
      }
      unint64_t v55 = v54 >> 3;
      if (v55 == a3) {
        float v47 = *(float *)(v53 + 4);
      }
      if (v44 < v47 || v55 < a3) {
        -[MLNearestNeighborsSingleKdTreeIndex findK:nearestNeighbors:toQueryPoint:inTree:](self, "findK:nearestNeighbors:toQueryPoint:inTree:", a3, a4, a5, v49, (void)v56);
      }
    }
  }
}

- (vector<std::pair<unsigned)calculateDistancesForNodesBetweenLeft:(std:(float>>> *__return_ptr)retstr :(vector<std:()float> :(std:(float>>> *)self :(SEL)a3 allocator<std:(unint64_t)a4 :(unint64_t)a5 pair<unsigned)long pair<unsigned)long allocator<std:(const void *)a6 :pair<unsigned)long andRight:toQueryPoint:
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (a5 >= a4)
  {
    v8 = self;
    float v44 = 0;
    double v45 = 0;
    uint64_t v46 = 0;
    unint64_t v10 = a5 - a4 + 1;
    std::vector<float>::reserve(&v44, unk_1EF151870(self, "numDimensions") * v10);
    unint64_t v11 = a4;
    do
    {
      var1 = (char *)v8->var1;
      uint64_t v13 = *((void *)v8[1].var1 + v11);
      int v14 = unk_1EF151878(v8, "numDimensions");
      uint64_t v15 = v45;
      int v16 = unk_1EF151880(v8, "numDimensions");
      std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>(&v44, v15, &var1[4 * (int)v13 * v14], &var1[4 * (int)v13 * v14 + 4 * v16], v16);
      ++v11;
    }
    while (v11 <= a5);
    v42 = (char *)v44;
    int v17 = unk_1EF151888(v8, "numDimensions");
    LODWORD(v48[0]) = 0;
    std::vector<float>::vector(v43, (int)v10, v48);
    std::vector<float>::vector(v48, 1uLL);
    std::vector<float>::vector(__p, (int)v10);
    cblas_sdot_NEWLAPACK();
    *(_DWORD *)v48[0] = v18;
    if ((int)v10 > 0)
    {
      uint64_t v19 = 0;
      uint64_t v20 = v42;
      do
      {
        cblas_sdot_NEWLAPACK();
        *(_DWORD *)((char *)__p[0] + v19) = v21;
        v19 += 4;
        v20 += 4 * v17;
      }
      while (4 * v10 != v19);
    }
    cblas_sgemm_NEWLAPACK();
    unint64_t v22 = (float *)__p[0];
    if ((int)v10 >= 1)
    {
      unint64_t v23 = (float *)v48[0];
      uint64_t v24 = (float *)v43[0];
      uint64_t v25 = v10;
      do
      {
        float v26 = *v22++;
        *uint64_t v24 = (float)(*v23 + v26) + *v24;
        ++v24;
        --v25;
      }
      while (v25);
      unint64_t v22 = (float *)__p[0];
    }
    if (v22)
    {
      __p[1] = v22;
      operator delete(v22);
    }
    if (v48[0])
    {
      v48[1] = v48[0];
      operator delete(v48[0]);
    }
    if (v10)
    {
      if (v10 >> 60) {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v27 = std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v10);
      retstr->var0 = v27;
      retstr->var1 = v27;
      retstr->var2.var0 = &v27[2 * v28];
    }
    else
    {
      uint64_t v27 = 0;
    }
    unint64_t v29 = a4;
    do
    {
      uint64_t v30 = *((void *)v8[1].var1 + v29);
      uint64_t v31 = *((unsigned int *)v43[0] + v29 - a4);
      var0 = retstr->var2.var0;
      if (v27 >= (void *)var0)
      {
        uint64_t v34 = retstr->var0;
        uint64_t v35 = ((char *)v27 - (char *)retstr->var0) >> 4;
        unint64_t v36 = v35 + 1;
        if ((unint64_t)(v35 + 1) >> 60) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v37 = var0 - v34;
        if (v37 >> 3 > v36) {
          unint64_t v36 = v37 >> 3;
        }
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v38 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v38 = v36;
        }
        if (v38) {
          unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v38);
        }
        else {
          uint64_t v39 = 0;
        }
        double v40 = (char *)(v38 + 16 * v35);
        *(void *)double v40 = v30;
        *((void *)v40 + 1) = v31;
        v41 = v40;
        if (v27 != (void *)v34)
        {
          do
          {
            *((_OWORD *)v41 - 1) = *((_OWORD *)v27 - 1);
            v41 -= 16;
            v27 -= 2;
          }
          while (v27 != (void *)v34);
          uint64_t v27 = retstr->var0;
        }
        uint64_t v33 = v40 + 16;
        retstr->var0 = v41;
        retstr->var1 = v40 + 16;
        retstr->var2.var0 = (void *)(v38 + 16 * v39);
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        *uint64_t v27 = v30;
        v27[1] = v31;
        uint64_t v33 = v27 + 2;
      }
      retstr->var1 = v33;
      ++v29;
      uint64_t v27 = v33;
    }
    while (v29 <= a5);
    if (v43[0])
    {
      v43[1] = v43[0];
      operator delete(v43[0]);
    }
    self = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v44;
    if (v44)
    {
      double v45 = (char *)v44;
      operator delete(v44);
    }
  }
  return self;
}

- (id)constructTreeForPointsBoundedBy:(void *)a3 startingIndex:(unint64_t)a4 count:(unint64_t)a5
{
  if (a5)
  {
    id v9 = objc_alloc_init(_KDNode);
    _KDBoundingBox::_KDBoundingBox(&__p, (_KDBoundingBox *)a3);
    [(_KDNode *)v9 setBoundingBox:&__p];
    if (__p._intervals.__begin_)
    {
      __p._intervals.__end_ = __p._intervals.__begin_;
      operator delete(__p._intervals.__begin_);
    }
    [(_KDNode *)v9 setStartingIndex:a4];
    [(_KDNode *)v9 setCount:a5];
    if ([(MLNearestNeighborsSingleKdTreeIndex *)self leafSize] >= a5)
    {
      [(_KDNode *)v9 setSplitIndex:0x7FFFFFFFLL];
      [(_KDNode *)v9 setSplitDimension:0x7FFFFFFFLL];
      [(_KDNode *)v9 setLeftChild:0];
      [(_KDNode *)v9 setRightChild:0];
      [(_KDNode *)v9 setIsLeaf:1];
    }
    else
    {
      [(_KDNode *)v9 assignSplitsForData:self->vData.__begin_ indices:self->vIndices.__begin_ numDimensions:[(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions]];
      _KDBoundingBox::_KDBoundingBox(&v28, (_KDBoundingBox *)a3);
      unint64_t v10 = [(_KDNode *)v9 splitDimension];
      uint64_t v11 = [(_KDNode *)v9 splitDimension];
      int v12 = *((_DWORD *)v28._intervals.__begin_ + 2 * v11);
      [(_KDNode *)v9 splitValue];
      if (v10 < (v28._intervals.__end_ - v28._intervals.__begin_) >> 3)
      {
        int v14 = (_DWORD *)((char *)v28._intervals.__begin_ + 8 * v10);
        *int v14 = v12;
        v14[1] = v13;
      }
      uint64_t v15 = [(MLNearestNeighborsSingleKdTreeIndex *)self constructTreeForPointsBoundedBy:&v28 startingIndex:a4 count:[(_KDNode *)v9 splitIndex] - a4];
      [(_KDNode *)v9 setLeftChild:v15];

      _KDBoundingBox::_KDBoundingBox(&v27, (_KDBoundingBox *)a3);
      unint64_t v16 = [(_KDNode *)v9 splitDimension];
      [(_KDNode *)v9 splitValue];
      int v18 = v17;
      uint64_t v19 = [(_KDNode *)v9 splitDimension];
      if (v16 < (v27._intervals.__end_ - v27._intervals.__begin_) >> 3)
      {
        int v20 = *((_DWORD *)v27._intervals.__begin_ + 2 * v19 + 1);
        int v21 = (_DWORD *)((char *)v27._intervals.__begin_ + 8 * v16);
        *int v21 = v18;
        v21[1] = v20;
      }
      unint64_t v22 = [(MLNearestNeighborsSingleKdTreeIndex *)self constructTreeForPointsBoundedBy:&v27 startingIndex:[(_KDNode *)v9 splitIndex] count:[(_KDNode *)v9 startingIndex] + a5 - [(_KDNode *)v9 splitIndex]];
      [(_KDNode *)v9 setRightChild:v22];

      for (unsigned int i = 0; [(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions] > i; ++i)
      {
        if (i < (unint64_t)((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3))
        {
          v24.i32[0] = *((void *)v27._intervals.__begin_ + i);
          v24.i32[1] = HIDWORD(*((void *)v28._intervals.__begin_ + i));
          v25.i32[0] = *((void *)v28._intervals.__begin_ + i);
          v25.i32[1] = HIDWORD(*((void *)v27._intervals.__begin_ + i));
          *(int8x8_t *)(*(void *)a3 + 8 * i) = vbsl_s8((int8x8_t)vcgt_f32(v25, v24), *(int8x8_t *)((char *)v27._intervals.__begin_ + 8 * i), *(int8x8_t *)((char *)v28._intervals.__begin_ + 8 * i));
        }
      }
      if (v27._intervals.__begin_)
      {
        v27._intervals.__end_ = v27._intervals.__begin_;
        operator delete(v27._intervals.__begin_);
      }
      if (v28._intervals.__begin_)
      {
        v28._intervals.__end_ = v28._intervals.__begin_;
        operator delete(v28._intervals.__begin_);
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)constructTree
{
  p_vIndices = &self->vIndices;
  std::vector<unsigned long>::reserve((void **)&self->vIndices.__begin_, (self->vData.__end_ - self->vData.__begin_)/ [(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions]);
  value = self->vIndices.__end_cap_.__value_;
  begin = self->vIndices.__begin_;
  end = self->vIndices.__end_;
  uint64_t v7 = (char *)value - (char *)begin;
  if (value != begin)
  {
    unint64_t v8 = 0;
    id v9 = self->vIndices.__end_;
    do
    {
      if (v9 >= value)
      {
        uint64_t v10 = v9 - begin;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        if (v7 >> 2 > v11) {
          unint64_t v11 = v7 >> 2;
        }
        if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12)
        {
          int v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&self->vIndices.__end_cap_, v12);
          begin = self->vIndices.__begin_;
          id v9 = self->vIndices.__end_;
        }
        else
        {
          int v13 = 0;
        }
        int v14 = (unint64_t *)&v13[8 * v10];
        *int v14 = v8;
        end = v14 + 1;
        while (v9 != begin)
        {
          unint64_t v15 = *--v9;
          *--int v14 = v15;
        }
        value = (unint64_t *)&v13[8 * v12];
        self->vIndices.__begin_ = v14;
        self->vIndices.__end_ = end;
        self->vIndices.__end_cap_.__value_ = value;
        if (begin)
        {
          operator delete(begin);
          value = self->vIndices.__end_cap_.__value_;
          begin = p_vIndices->__begin_;
        }
        else
        {
          begin = v14;
        }
      }
      else
      {
        *id v9 = v8;
        end = v9 + 1;
      }
      self->vIndices.__end_ = end;
      ++v8;
      uint64_t v7 = (char *)value - (char *)begin;
      id v9 = end;
    }
    while (v8 < value - begin);
  }
  unsigned int v16 = [(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions];
  _KDBoundingBox __p = 0;
  double v43 = 0;
  uint64_t v17 = v16;
  float v44 = 0;
  uint64_t v45 = v16;
  if (v16)
  {
    int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v16);
    uint64_t v19 = 0;
    int v21 = &v18[8 * v20];
    _KDBoundingBox __p = v18;
    double v43 = v18;
    float v44 = v21;
    unint64_t v22 = v18;
    do
    {
      if (v22 >= v21)
      {
        uint64_t v24 = (v22 - v18) >> 3;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        if ((v21 - v18) >> 2 > v25) {
          unint64_t v25 = (v21 - v18) >> 2;
        }
        if ((unint64_t)(v21 - v18) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v25;
        }
        if (v26) {
          unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v26);
        }
        else {
          uint64_t v27 = 0;
        }
        _KDBoundingBox v28 = (void *)(v26 + 8 * v24);
        *_KDBoundingBox v28 = 0xFF8000007F800000;
        unint64_t v23 = v28 + 1;
        if (v22 != v18)
        {
          do
          {
            uint64_t v29 = *((void *)v22 - 1);
            v22 -= 8;
            *--_KDBoundingBox v28 = v29;
          }
          while (v22 != v18);
          int v18 = (char *)__p;
        }
        int v21 = (char *)(v26 + 8 * v27);
        _KDBoundingBox __p = v28;
        float v44 = v21;
        if (v18) {
          operator delete(v18);
        }
        int v18 = (char *)v28;
      }
      else
      {
        *(void *)unint64_t v22 = 0xFF8000007F800000;
        unint64_t v23 = v22 + 8;
      }
      double v43 = v23;
      ++v19;
      unint64_t v22 = (char *)v23;
    }
    while (v19 != v17);
    uint64_t v30 = (char *)__p;
  }
  else
  {
    uint64_t v30 = 0;
  }
  uint64_t v31 = 0;
  unint64_t v32 = self->vIndices.__begin_;
  uint64_t v33 = self->vData.__begin_;
  uint64_t v34 = (float *)(v30 + 4);
  do
  {
    if (v17)
    {
      uint64_t v35 = (float *)((char *)v33 + 4 * v17 * v32[v31]);
      unint64_t v36 = v34;
      uint64_t v37 = v17;
      do
      {
        float v38 = *v35;
        if (*v35 < *(v36 - 1))
        {
          *(v36 - 1) = v38;
          float v38 = *v35;
        }
        if (v38 > *v36) {
          float *v36 = v38;
        }
        v36 += 2;
        ++v35;
        --v37;
      }
      while (v37);
    }
  }
  while (v31++ != ((unint64_t)((char *)end - (char *)begin) >> 3) - 1);
  double v40 = [(MLNearestNeighborsSingleKdTreeIndex *)self constructTreeForPointsBoundedBy:&__p startingIndex:0 count:self->vIndices.__end_ - self->vIndices.__begin_];
  if (__p)
  {
    double v43 = __p;
    operator delete(__p);
  }

  return v40;
}

- (unint64_t)dataPointCount
{
  unint64_t v2 = self->vData.__end_ - self->vData.__begin_;
  return v2 / [(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions];
}

- (BOOL)updateWithData:(const void *)a3 error:(id *)a4
{
  unint64_t v7 = (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 2;
  if (v7 % [(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions])
  {
    if (a4)
    {
      unint64_t v8 = @"Unexpected dimensionality of update data";
LABEL_4:
      id v9 = +[MLModelErrorUtils genericErrorWithFormat:v8];
      BOOL result = 0;
      *a4 = v9;
      return result;
    }
    return 0;
  }
  unint64_t v11 = (char *)*((void *)a3 + 1);
  if (v11 == *(char **)a3)
  {
    if (a4)
    {
      unint64_t v8 = @"Training data is empty";
      goto LABEL_4;
    }
    return 0;
  }
  std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>((void **)&self->vData.__begin_, (char *)self->vData.__end_, *(char **)a3, v11, (uint64_t)&v11[-*(void *)a3] >> 2);
  begin = self->vIndices.__begin_;
  if (begin != self->vIndices.__end_) {
    self->vIndices.__end_ = begin;
  }
  int v13 = [(MLNearestNeighborsSingleKdTreeIndex *)self constructTree];
  root = self->_root;
  self->_root = v13;

  return 1;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsSingleKdTreeIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toIndex:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(MLNearestNeighborsSingleKdTreeIndex *)self dataPointCount] <= a4)
  {
    std::to_string(&__p, a4);
    int v18 = std::string::insert(&__p, 0, "invalid k=");
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v23.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    uint64_t v20 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v21 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        int v21 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
      _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&__p, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v23);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
  }
  begin = self->vData.__begin_;
  uint64_t v10 = &begin[[(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions] * a5];
  unint64_t v11 = [(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions];
  memset(&v23, 0, sizeof(v23));
  std::vector<float>::__init_with_size[abi:ne180100]<std::__wrap_iter<float *>,std::__wrap_iter<float *>>(&v23, v10, (uint64_t)&v10[v11], v11);
  unint64_t v12 = a4 + 1;
  [(MLNearestNeighborsSingleKdTreeIndex *)self findNearestNeighbors:v12 toQueryPoint:&v23];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  std::string::size_type size = __p.__r_.__value_.__l.__size_;
  int v13 = (_OWORD *)__p.__r_.__value_.__r.__words[0];
  uint64_t v24 = retstr;
  if (__p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
  {
    var0 = 0;
    var1 = 0;
  }
  else
  {
    do
    {
      if (*(void *)v13 != a5) {
        std::back_insert_iterator<std::vector<std::pair<unsigned long,float>>>::operator=[abi:ne180100]((void ***)&v24, v13);
      }
      ++v13;
    }
    while (v13 != (_OWORD *)size);
    var0 = retstr->var0;
    var1 = retstr->var1;
  }
  if (v12 == (var1 - var0) >> 4) {
    retstr->var1 = var1 - 16;
  }
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  BOOL result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v23.__r_.__value_.__r.__words[0];
  if (v23.__r_.__value_.__r.__words[0])
  {
    v23.__r_.__value_.__l.__size_ = v23.__r_.__value_.__r.__words[0];
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  return result;
}

- (vector<std::pair<unsigned)findNearestNeighbors:(std:(float>>> *__return_ptr)retstr :(MLNearestNeighborsSingleKdTreeIndex *)self allocator<std:(SEL)a3 :(unint64_t)a4 pair<unsigned)long toQueryPoint:(const void *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  uint64_t v10 = *(void *)a5;
  uint64_t v9 = *((void *)a5 + 1);
  if ([(MLNearestNeighborsSingleKdTreeIndex *)self numDimensions] != (v9 - v10) >> 2)
  {
    std::to_string(&v38, (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 2);
    uint64_t v31 = std::string::insert(&v38, 0, "invalid point.size()=");
    long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
    v36.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v32;
    v31->__r_.__value_.__l.__size_ = 0;
    v31->__r_.__value_.__r.__words[2] = 0;
    v31->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v38.__r_.__value_.__l.__data_);
    }
    uint64_t v33 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = &v36;
      if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v34 = (std::string *)v36.__r_.__value_.__r.__words[0];
      }
      LODWORD(v38.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v38.__r_.__value_.__r.__words + 4) = (std::string::size_type)v34;
      _os_log_error_impl(&dword_19E58B000, v33, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v38, 0xCu);
    }

    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, &v36);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4E8] + 16);
    __cxa_throw(exception, (struct type_info *)off_1E59A3028, MEMORY[0x1E4FBA1E8]);
  }
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = a4;
  v36.__r_.__value_.__r.__words[2] = 0;
  uint64_t v37 = 0;
  unint64_t v11 = [(MLNearestNeighborsSingleKdTreeIndex *)self root];
  [(MLNearestNeighborsSingleKdTreeIndex *)self findK:a4 nearestNeighbors:&v36 toQueryPoint:a5 inTree:v11];

  for (unsigned int i = 0; ; unsigned int i = v17)
  {
    BOOL result = (vector<std::pair<unsigned long, float>, std::allocator<std::pair<unsigned long, float>>> *)v36.__r_.__value_.__r.__words[2];
    if (v36.__r_.__value_.__r.__words[2] == v36.__r_.__value_.__l.__size_) {
      break;
    }
    uint64_t v14 = HIDWORD(*(void *)v36.__r_.__value_.__l.__size_);
    uint64_t v15 = (int)*(void *)v36.__r_.__value_.__l.__size_;
    var0 = (char *)retstr->var2.var0;
    if (i >= var0)
    {
      int v18 = (char *)retstr->var0;
      uint64_t v19 = (i - (char *)retstr->var0) >> 4;
      unint64_t v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60) {
        std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v21 = var0 - v18;
      if (v21 >> 3 > v20) {
        unint64_t v20 = v21 >> 3;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v20;
      }
      if (v22) {
        unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v22);
      }
      else {
        uint64_t v23 = 0;
      }
      unint64_t v24 = v22 + 16 * v19;
      *(void *)unint64_t v24 = v15;
      *(_DWORD *)(v24 + 8) = v14;
      unint64_t v25 = (char *)v24;
      if (i != v18)
      {
        do
        {
          *((_OWORD *)v25 - 1) = *((_OWORD *)i - 1);
          v25 -= 16;
          i -= 16;
        }
        while (i != v18);
        unsigned int i = (char *)retstr->var0;
      }
      uint64_t v17 = (char *)(v24 + 16);
      retstr->var0 = v25;
      retstr->var1 = (void *)(v24 + 16);
      retstr->var2.var0 = (void *)(v22 + 16 * v23);
      if (i) {
        operator delete(i);
      }
    }
    else
    {
      *(void *)unsigned int i = v15;
      *((_DWORD *)i + 2) = v14;
      uint64_t v17 = i + 16;
    }
    retstr->var1 = v17;
    _KDPriorityQueue::pop((_KDPriorityQueue *)&v36);
  }
  uint64_t v26 = (char *)retstr->var0;
  uint64_t v27 = i - 16;
  if (retstr->var0 != i && v27 > v26)
  {
    do
    {
      uint64_t v29 = *(void *)v26;
      *(void *)uint64_t v26 = *(void *)v27;
      *(void *)uint64_t v27 = v29;
      int v30 = *((_DWORD *)v26 + 2);
      *((_DWORD *)v26 + 2) = *((_DWORD *)v27 + 2);
      *((_DWORD *)v27 + 2) = v30;
      v26 += 16;
      v27 -= 16;
    }
    while (v26 < v27);
  }
  if (result)
  {
    v36.__r_.__value_.__r.__words[2] = (std::string::size_type)result;
    operator delete(result);
  }
  return result;
}

- (MLNearestNeighborsSingleKdTreeIndex)initWithDataset:(void *)a3 numberOfDimensions:(unint64_t)a4 leafSize:(unint64_t)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MLNearestNeighborsSingleKdTreeIndex;
  uint64_t v10 = [(MLNearestNeighborsSingleKdTreeIndex *)&v21 init];
  unint64_t v11 = v10;
  if (!v10)
  {
LABEL_9:
    a6 = v11;
    goto LABEL_10;
  }
  unint64_t v12 = *(char **)a3;
  uint64_t v13 = *((void *)a3 + 1);
  unint64_t v14 = (v13 - *(void *)a3) >> 2;
  if (!(v14 % a4))
  {
    p_vData = (char *)&v10->vData;
    if (&v11->vData != a3)
    {
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(p_vData, v12, v13, v14);
      unint64_t v12 = *(char **)a3;
      uint64_t v13 = *((void *)a3 + 1);
    }
    v11->_numDimensions = a4;
    v11->_leafSize = a5;
    if ((char *)v13 != v12)
    {
      uint64_t v18 = [(MLNearestNeighborsSingleKdTreeIndex *)v11 constructTree];
      root = v11->_root;
      v11->_root = (_KDNode *)v18;
    }
    goto LABEL_9;
  }
  if (a6)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"dataPoints.size() % dimensionality != 0";
    unsigned int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a6 = [v15 errorWithDomain:@"com.apple" code:0 userInfo:v16];

    a6 = 0;
  }
LABEL_10:

  return (MLNearestNeighborsSingleKdTreeIndex *)a6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end