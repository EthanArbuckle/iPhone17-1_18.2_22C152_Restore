@interface _KDNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isLeaf;
- (_KDBoundingBox)boundingBox;
- (_KDNode)initWithCoder:(id)a3;
- (_KDNode)leftChild;
- (_KDNode)rightChild;
- (float)splitValue;
- (id).cxx_construct;
- (unint64_t)count;
- (unint64_t)splitDimension;
- (unint64_t)splitIndex;
- (unint64_t)startingIndex;
- (void)assignSplitsForData:(const float *)a3 indices:(unint64_t *)a4 numDimensions:(unint64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)findMin:(float *)a3 andMax:(float *)a4 alongDimension:(unint64_t)a5 data:(const float *)a6 indices:(const unint64_t *)a7 numDimensions:(unint64_t)a8;
- (void)partitionDataPoints:(const float *)a3 indices:(unint64_t *)a4 numDimensions:(unint64_t)a5;
- (void)print;
- (void)setBoundingBox:(_KDBoundingBox *)a3;
- (void)setCount:(unint64_t)a3;
- (void)setIsLeaf:(BOOL)a3;
- (void)setLeftChild:(id)a3;
- (void)setRightChild:(id)a3;
- (void)setSplitDimension:(unint64_t)a3;
- (void)setSplitIndex:(unint64_t)a3;
- (void)setSplitValue:(float)a3;
- (void)setStartingIndex:(unint64_t)a3;
@end

@implementation _KDNode

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_boundingBox._intervals.__begin_;
  if (begin)
  {
    self->_boundingBox._intervals.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_rightChild, 0);

  objc_storeStrong((id *)&self->_leftChild, 0);
}

- (void)setIsLeaf:(BOOL)a3
{
  self->_isLeaf = a3;
}

- (BOOL)isLeaf
{
  return self->_isLeaf;
}

- (void)setBoundingBox:(_KDBoundingBox *)a3
{
  p_boundingBox = (char *)&self->_boundingBox;
  if (p_boundingBox != (char *)a3) {
    std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>(p_boundingBox, (char *)a3->_intervals.__begin_, (uint64_t)a3->_intervals.__end_, (a3->_intervals.__end_ - a3->_intervals.__begin_) >> 3);
  }
  self->_boundingBox._numDimensions = a3->_numDimensions;
}

- (_KDBoundingBox)boundingBox
{
  _KDBoundingBox::_KDBoundingBox(retstr, &self->_boundingBox);
  return result;
}

- (void)setRightChild:(id)a3
{
}

- (_KDNode)rightChild
{
  return self->_rightChild;
}

- (void)setLeftChild:(id)a3
{
}

- (_KDNode)leftChild
{
  return self->_leftChild;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setStartingIndex:(unint64_t)a3
{
  self->_startingIndex = a3;
}

- (unint64_t)startingIndex
{
  return self->_startingIndex;
}

- (void)setSplitValue:(float)a3
{
  self->_splitValue = a3;
}

- (float)splitValue
{
  return self->_splitValue;
}

- (void)setSplitIndex:(unint64_t)a3
{
  self->_splitIndex = a3;
}

- (unint64_t)splitIndex
{
  return self->_splitIndex;
}

- (void)setSplitDimension:(unint64_t)a3
{
  self->_splitDimension = a3;
}

- (unint64_t)splitDimension
{
  return self->_splitDimension;
}

- (void)print
{
  unint64_t v3 = [(_KDNode *)self splitDimension];
  [(_KDNode *)self splitValue];
  printf("Splitting node along dimension %lu, by value %.4f", v3, v4);
  printf("\tFound split index %lu\n", [(_KDNode *)self splitIndex]);
}

- (void)assignSplitsForData:(const float *)a3 indices:(unint64_t *)a4 numDimensions:(unint64_t)a5
{
  [(_KDNode *)self boundingBox];
  v9 = __p;
  if (v28 == __p)
  {
    uint64_t v11 = 0;
    uint64_t v18 = 0;
    unint64_t v30 = 0;
    v9 = v28;
    if (!v28) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = ((char *)v28 - (char *)__p) >> 3;
    if (v12 <= 1) {
      unint64_t v12 = 1;
    }
    v13 = __p + 1;
    float v14 = 0.0;
    float v15 = -INFINITY;
    unsigned int v16 = 0;
    do
    {
      float v17 = vabds_f32(*v13, *(v13 - 1));
      if (v17 > v15)
      {
        uint64_t v11 = v10;
        float v15 = v17;
        unsigned int v16 = *((_DWORD *)v13 - 1);
        float v14 = *v13;
      }
      ++v10;
      v13 += 2;
    }
    while (v12 != v10);
    unint64_t v30 = __PAIR64__(v16, LODWORD(v14));
  }
  operator delete(v9);
  uint64_t v18 = v11;
LABEL_11:
  [(_KDNode *)self findMin:(char *)&v30 + 4 andMax:&v30 alongDimension:v18 data:a3 indices:a4 numDimensions:a5];
  unint64_t v19 = v30;
  [(_KDNode *)self setSplitDimension:v18];
  *(float *)&double v20 = (float)(*((float *)&v30 + 1) + *(float *)&v30) * 0.5;
  [(_KDNode *)self setSplitValue:v20];
  if (a5)
  {
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    float v23 = vabds_f32(*(float *)&v19, *((float *)&v19 + 1));
    while (v22 == [(_KDNode *)self splitDimension])
    {
LABEL_22:
      ++v22;
      v21 += 2;
      if (a5 == v22) {
        goto LABEL_23;
      }
    }
    [(_KDNode *)self boundingBox];
    if (v29 >= v22)
    {
      float v24 = vabds_f32(__p[v21 + 1], __p[v21]);
    }
    else
    {
      float v24 = 0.0;
      if (!__p) {
        goto LABEL_19;
      }
    }
    operator delete(__p);
LABEL_19:
    if (v24 > v23)
    {
      [(_KDNode *)self findMin:(char *)&v30 + 4 andMax:&v30 alongDimension:v22 data:a3 indices:a4 numDimensions:a5];
      float v25 = vabds_f32(*(float *)&v30, *((float *)&v30 + 1));
      if (v25 > v23)
      {
        [(_KDNode *)self setSplitDimension:v22];
        *(float *)&double v26 = (float)(*(float *)&v30 + *((float *)&v30 + 1)) * 0.5;
        [(_KDNode *)self setSplitValue:v26];
        float v23 = v25;
      }
    }
    goto LABEL_22;
  }
LABEL_23:
  [(_KDNode *)self partitionDataPoints:a3 indices:a4 numDimensions:a5];
}

- (void)partitionDataPoints:(const float *)a3 indices:(unint64_t *)a4 numDimensions:(unint64_t)a5
{
  int64_t v9 = [(_KDNode *)self startingIndex];
  int64_t v10 = v9 + [(_KDNode *)self count] - 1;
  while (v9 <= v10)
  {
    unint64_t v11 = a4[v9];
    float v12 = a3[[(_KDNode *)self splitDimension] + v11 * a5];
    [(_KDNode *)self splitValue];
    if (v12 >= v13)
    {
      unint64_t v14 = a4[v10];
      float v15 = a3[[(_KDNode *)self splitDimension] + v14 * a5];
      [(_KDNode *)self splitValue];
      if (v15 < v16)
      {
        unint64_t v17 = a4[v9];
        a4[v9] = a4[v10];
        a4[v10] = v17;
        ++v9;
      }
      --v10;
    }
    else
    {
      ++v9;
    }
  }
  unint64_t v18 = [(_KDNode *)self startingIndex];
  int64_t v19 = v18 + [(_KDNode *)self count] - 1;
  unint64_t v20 = v9;
  if (v9 <= v19)
  {
    unint64_t v20 = v9;
    do
    {
      unint64_t v21 = a4[v20];
      float v22 = a3[[(_KDNode *)self splitDimension] + v21 * a5];
      [(_KDNode *)self splitValue];
      if (v22 <= v23)
      {
        ++v20;
      }
      else
      {
        unint64_t v24 = a4[v19];
        float v25 = a3[[(_KDNode *)self splitDimension] + v24 * a5];
        [(_KDNode *)self splitValue];
        if (v25 < v26)
        {
          unint64_t v27 = a4[v20];
          a4[v20] = a4[v19];
          a4[v19] = v27;
          ++v20;
        }
        --v19;
      }
    }
    while ((uint64_t)v20 <= v19);
  }
  if (v9 == [(_KDNode *)self startingIndex] && v20 == [(_KDNode *)self startingIndex]) {
    goto LABEL_25;
  }
  if (v9 == [(_KDNode *)self startingIndex]
    && (unint64_t v28 = [(_KDNode *)self startingIndex], v20 == [(_KDNode *)self count] + v28)
    || (unint64_t v29 = [(_KDNode *)self startingIndex], v9 == [(_KDNode *)self count] + v29)
    && (unint64_t v30 = [(_KDNode *)self startingIndex], v20 == [(_KDNode *)self count] + v30)
    || v9 <= [(_KDNode *)self count] >> 1 && (int64_t v9 = v20, v20 >= [(_KDNode *)self count] >> 1))
  {
    unint64_t v20 = [(_KDNode *)self startingIndex];
LABEL_25:
    int64_t v9 = v20 + ([(_KDNode *)self count] >> 1);
  }

  [(_KDNode *)self setSplitIndex:v9];
}

- (void)findMin:(float *)a3 andMax:(float *)a4 alongDimension:(unint64_t)a5 data:(const float *)a6 indices:(const unint64_t *)a7 numDimensions:(unint64_t)a8
{
  unint64_t v15 = [(_KDNode *)self startingIndex];
  unint64_t v16 = [(_KDNode *)self count];
  unint64_t v17 = a5 + a7[v15] * a8;
  unint64_t v18 = v15 + v16 - 1;
  *a3 = a6[v17];
  float v19 = a6[v17];
  *a4 = v19;
  while (v15 <= v18)
  {
    float v20 = a6[a5 + a7[v15] * a8];
    if (v20 < *a3)
    {
      *a3 = v20;
      float v19 = *a4;
    }
    if (v20 > v19)
    {
      *a4 = v20;
      float v19 = v20;
    }
    ++v15;
  }
}

- (_KDNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_KDNode;
  id v5 = [(_KDNode *)&v24 init];
  if (v5)
  {
    *((void *)v5 + 3) = [v4 decodeIntegerForKey:@"splitIndex"];
    *((void *)v5 + 2) = [v4 decodeIntegerForKey:@"splitDimension"];
    [v4 decodeFloatForKey:@"splitValue"];
    *((_DWORD *)v5 + 3) = v6;
    *((void *)v5 + 4) = [v4 decodeIntegerForKey:@"startingIndex"];
    *((void *)v5 + 5) = [v4 decodeIntegerForKey:@"count"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rightChild"];
    v8 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"leftChild"];
    int64_t v10 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v9;

    uint64_t v23 = 0;
    id v11 = v4;
    float v12 = (const void *)[v11 decodeBytesForKey:@"intervals" returnedLength:&v23];
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    float v20 = 0;
    std::vector<_KDInterval>::__init_with_size[abi:ne180100]<_KDInterval*,_KDInterval*>(&v20, v12, (uint64_t)v12 + (v23 & 0xFFFFFFFFFFFFFFF8), v23 >> 3);
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    float v13 = v20;
    std::vector<_KDInterval>::__init_with_size[abi:ne180100]<_KDInterval*,_KDInterval*>(&v16, v20, v21, (v21 - (uint64_t)v20) >> 3);
    unint64_t v14 = v16;
    std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)v5 + 64, v16, v17, (v17 - (uint64_t)v16) >> 3);
    *((void *)v5 + 11) = v19;
    if (v14) {
      operator delete(v14);
    }
    *((unsigned char *)v5 + 8) = [v11 decodeBoolForKey:@"isLeaf"];
    if (v13) {
      operator delete(v13);
    }
  }

  return (_KDNode *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode splitIndex](self, "splitIndex"), @"splitIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode splitDimension](self, "splitDimension"), @"splitDimension");
  *(float *)&double v5 = (float)[(_KDNode *)self splitDimension];
  [v4 encodeFloat:@"splitValue" forKey:v5];
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode startingIndex](self, "startingIndex"), @"startingIndex");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_KDNode count](self, "count"), @"count");
  int v6 = [(_KDNode *)self rightChild];
  [v4 encodeObject:v6 forKey:@"rightChild"];

  uint64_t v7 = [(_KDNode *)self leftChild];
  [v4 encodeObject:v7 forKey:@"leftChild"];

  [(_KDNode *)self boundingBox];
  id v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  std::vector<_KDInterval>::__init_with_size[abi:ne180100]<_KDInterval*,_KDInterval*>(&v11, __p, v10, (v10 - (uint64_t)__p) >> 3);
  if (__p) {
    operator delete(__p);
  }
  v8 = v11;
  [v4 encodeBytes:v11 length:v12 - (void)v11 forKey:@"intervals"];
  objc_msgSend(v4, "encodeBool:forKey:", -[_KDNode isLeaf](self, "isLeaf"), @"isLeaf");
  if (v8) {
    operator delete(v8);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end