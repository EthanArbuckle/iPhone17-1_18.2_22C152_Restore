@interface ADInterSessionFilter
- (ADInterSessionFilter)initWithFieldNames:(id)a3 parameters:(id)a4;
- (BOOL)TtestStepWithCandidate:(unsigned int)a3;
- (double)L2FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5 WithMean:(double)a6;
- (double)LossFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4;
- (double)SLFromIndex:(unsigned int)a3;
- (double)TTESTWithCandidate:(unsigned int)a3 ByElement:(unsigned int)a4;
- (double)V1FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4;
- (double)V2FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4;
- (double)samplesMeanFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5;
- (double)samplesVarianceFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5 WithMean:(double)a6;
- (double)sigmaSWithCandidate:(unsigned int)a3 ByElement:(unsigned int)a4;
- (id).cxx_construct;
- (id)calculate;
- (id)calculateInterSessionFilterResultFromIndex:(unsigned int)a3;
- (id)insertEntryAndCalculate:(id)a3 withWeight:(double)a4;
- (id)persistenceData;
- (int64_t)fillWithDictionaryRepresentation:(id)a3;
- (int64_t)fillWithEntry:(id)a3;
- (int64_t)insertEntry:(id)a3 withWeight:(double)a4;
- (int64_t)markOutliers:(unsigned int)a3;
- (unsigned)kIndexCandidate;
- (unsigned)stepDetection;
- (void)dealloc;
- (void)markInStep:(unsigned int)a3;
- (void)resetElementFlags:(void *)a3;
- (void)setOnlineWeights:(unsigned int)a3;
@end

@implementation ADInterSessionFilter

- (int64_t)fillWithDictionaryRepresentation:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = a3;
  v17 = [v16 objectForKeyedSubscript:@"nodes"];
  v4 = [v16 objectForKeyedSubscript:@"version"];
  if ([v4 unsignedIntValue] != self->_version)
  {

    goto LABEL_14;
  }
  uint64_t v5 = [v17 count];
  unsigned int v6 = [(ADInterSessionFilterParameters *)self->_params capacity];

  if (v5 != v6)
  {
LABEL_14:
    int64_t v14 = -22950;
    goto LABEL_15;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v17;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      v12 = [v11 objectForKeyedSubscript:@"elements"];
      v13 = [v11 objectForKeyedSubscript:@"weight"];
      [v13 doubleValue];
      int64_t v14 = -[ADInterSessionFilter insertEntry:withWeight:](self, "insertEntry:withWeight:", v12);

      if (v14) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    int64_t v14 = 0;
  }

LABEL_15:
  return v14;
}

- (int64_t)insertEntry:(id)a3 withWeight:(double)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v16 = a3;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_elementsNames, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_elementsNames;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v6)
  {
LABEL_9:

    operator new();
  }
  int v7 = 0;
  uint64_t v8 = *(void *)v18;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v18 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
    v11 = [v16 objectForKey:v10];
    BOOL v12 = v11 == 0;

    if (v12) {
      break;
    }
    v13 = [v16 objectForKeyedSubscript:v10];
    [v15 setObject:v13 atIndexedSubscript:(v7 + v9)];

    if (v6 == ++v9)
    {
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      v7 += v9;
      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }

  return -22950;
}

- (id)persistenceData
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [NSNumber numberWithUnsignedInt:self->_version];
  [v21 setObject:v3 forKeyedSubscript:@"version"];

  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_nodes.__size_.__value_];
  begin = self->_nodes.__map_.__begin_;
  end = self->_nodes.__map_.__end_;
  uint64_t v23 = &begin[self->_nodes.__start_ >> 9];
  v24 = self;
  if (end == begin) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (double **)&begin[self->_nodes.__start_ >> 9][self->_nodes.__start_ & 0x1FF];
  }
  for (unsigned int i = 0; ; ++i)
  {
    if (end == begin)
    {
      uint64_t v8 = 0;
    }
    else
    {
      unint64_t v7 = v24->_nodes.__size_.__value_ + v24->_nodes.__start_;
      uint64_t v8 = (uint64_t)&(*(Node ***)((char *)begin + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)))[v7 & 0x1FF];
    }
    if (v6 == (double **)v8) {
      break;
    }
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v10 = (double **)*((void *)*v6 + 2);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v11 = v24->_elementsNames;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * j);
          id v16 = [NSNumber numberWithDouble:**v10];
          [v9 setObject:v16 forKeyedSubscript:v15];

          ++v10;
        }
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    id v17 = objc_alloc(NSDictionary);
    long long v18 = [NSNumber numberWithDouble:**v6];
    long long v19 = objc_msgSend(v17, "initWithObjectsAndKeys:", v18, @"weight", v9, @"elements", 0);
    [v22 setObject:v19 atIndexedSubscript:i];

    if ((char *)++v6 - (char *)*v23 == 4096)
    {
      uint64_t v6 = (double **)v23[1];
      ++v23;
    }
    begin = v24->_nodes.__map_.__begin_;
    end = v24->_nodes.__map_.__end_;
  }
  [v21 setObject:v22 forKeyedSubscript:@"nodes"];

  return v21;
}

- (ADInterSessionFilter)initWithFieldNames:(id)a3 parameters:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADInterSessionFilter;
  uint64_t v8 = [(ADInterSessionFilter *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    v8->_version = 1;
    objc_storeStrong((id *)&v8->_params, a4);
    objc_storeStrong((id *)&v9->_elementsNames, a3);
    [(NSArray *)v9->_elementsNames count];
    operator new[]();
  }

  return 0;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((void *)self + 11) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 9) = (char *)self + 80;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsNames, 0);
  std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::destroy((char *)self->_sets.__tree_.__pair1_.__value_.__left_);
  begin = self->_nodes.__map_.__begin_;
  end = self->_nodes.__map_.__end_;
  self->_nodes.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_nodes.__map_.__end_;
      begin = self->_nodes.__map_.__begin_ + 1;
      self->_nodes.__map_.__begin_ = begin;
      unint64_t v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v6 = v5 >> 3;
  if (v6 == 1)
  {
    unint64_t v7 = 256;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    unint64_t v7 = 512;
LABEL_7:
    self->_nodes.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      uint64_t v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    uint64_t v10 = self->_nodes.__map_.__begin_;
    id v9 = self->_nodes.__map_.__end_;
    if (v9 != v10) {
      self->_nodes.__map_.__end_ = (Node ***)((char *)v9 + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
    }
  }
  first = self->_nodes.__map_.__first_;
  if (first) {
    operator delete(first);
  }

  objc_storeStrong((id *)&self->_params, 0);
}

- (BOOL)TtestStepWithCandidate:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v5 = 0.0;
  if ([(NSArray *)self->_elementsNames count])
  {
    unsigned int v6 = 1;
    do
    {
      [(ADInterSessionFilter *)self TTESTWithCandidate:v3 ByElement:v6 - 1];
      if (v7 > v5) {
        double v5 = v7;
      }
    }
    while ([(NSArray *)self->_elementsNames count] > v6++);
  }
  [(ADInterSessionFilterParameters *)self->_params stepDetectionThreshold];
  return v5 > v9;
}

- (double)TTESTWithCandidate:(unsigned int)a3 ByElement:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int value = self->_nodes.__size_.__value_;
  unsigned int v8 = value - a3;
  [(ADInterSessionFilter *)self samplesMeanFromIndex:0 ToIndex:a3 - 1 ByElement:*(void *)&a4];
  double v10 = v9;
  [(ADInterSessionFilter *)self samplesMeanFromIndex:v5 ToIndex:(value - 1) ByElement:v4];
  double v12 = v10 - v11;
  [(ADInterSessionFilter *)self sigmaSWithCandidate:v5 ByElement:v4];
  if (v13 < 1.0) {
    double v13 = 1.0;
  }
  return fabs(v12 / (v13 * sqrt(1.0 / (double)v5 + 1.0 / (double)v8)));
}

- (double)sigmaSWithCandidate:(unsigned int)a3 ByElement:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  int value = self->_nodes.__size_.__value_;
  uint64_t v8 = a3 - 1;
  [(ADInterSessionFilter *)self samplesMeanFromIndex:0 ToIndex:v8 ByElement:*(void *)&a4];
  -[ADInterSessionFilter samplesVarianceFromIndex:ToIndex:ByElement:WithMean:](self, "samplesVarianceFromIndex:ToIndex:ByElement:WithMean:", 0, v8, v4);
  double v10 = v9;
  [(ADInterSessionFilter *)self samplesMeanFromIndex:v5 ToIndex:(value - 1) ByElement:v4];
  -[ADInterSessionFilter samplesVarianceFromIndex:ToIndex:ByElement:WithMean:](self, "samplesVarianceFromIndex:ToIndex:ByElement:WithMean:", v5, (value - 1), v4);
  return sqrt((v11 * (double)(value + ~v5) + (double)v8 * v10)/ (double)(value - 2));
}

- (double)samplesVarianceFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5 WithMean:(double)a6
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  double v9 = 0.0;
  if (a3 <= a4)
  {
    unsigned int v10 = a3;
    do
    {
      double v11 = (*(Node ***)((char *)self->_nodes.__map_.__begin_
                       + (((self->_nodes.__start_ + v10) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + v10) & 0x1FF];
      if (v11)
      {
        double v12 = *(double *)v11;
        double v13 = *(double **)(*((void *)v11 + 2) + 8 * a5);
        double v9 = v9 + v12 * ((*v13 - a6) * (*v13 - a6));
      }
      ++v10;
    }
    while (v10 <= a4);
  }
  -[ADInterSessionFilter V1FromIndex:ToIndex:](self, "V1FromIndex:ToIndex:", *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
  double v15 = v14;
  [(ADInterSessionFilter *)self V2FromIndex:v7 ToIndex:v6];
  double v17 = v15 - v16 / v15;
  if (v17 < 1.0e-20) {
    double v17 = 1.0e-20;
  }
  return v9 / v17;
}

- (double)V2FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4
{
  for (double result = 0.0; a3 <= a4; ++a3)
  {
    uint64_t v5 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v5) {
      double result = result + *(double *)v5 * *(double *)v5;
    }
  }
  return result;
}

- (double)V1FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4
{
  for (double result = 0.0; a3 <= a4; ++a3)
  {
    uint64_t v5 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v5) {
      double result = result + *(double *)v5;
    }
  }
  if (result < 1.0e-20) {
    return 1.0e-20;
  }
  return result;
}

- (unsigned)kIndexCandidate
{
  unsigned int v3 = [(ADInterSessionFilterParameters *)self->_params minStepIndex];
  int value = self->_nodes.__size_.__value_;
  unsigned int v5 = ~[(ADInterSessionFilterParameters *)self->_params minStepSize] + value;
  uint64_t v6 = [(ADInterSessionFilterParameters *)self->_params minStepIndex];
  if (v6 <= v5)
  {
    uint64_t v7 = v6;
    double v8 = 1.0e20;
    do
    {
      [(ADInterSessionFilter *)self SLFromIndex:v7];
      if (v9 < v8)
      {
        double v8 = v9;
        unsigned int v3 = v7;
      }
      uint64_t v7 = (v7 + 1);
    }
    while (v7 <= v5);
  }
  return v3;
}

- (double)SLFromIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(ADInterSessionFilter *)self LossFromIndex:0 ToIndex:a3 - 1];
  double v6 = v5;
  [(ADInterSessionFilter *)self LossFromIndex:v3 ToIndex:(LODWORD(self->_nodes.__size_.__value_) - 1)];
  return v6 + v7;
}

- (double)LossFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  double v7 = 0.0;
  if ([(NSArray *)self->_elementsNames count])
  {
    unsigned int v8 = 1;
    do
    {
      [(ADInterSessionFilter *)self samplesMeanFromIndex:v5 ToIndex:v4 ByElement:v8 - 1];
      -[ADInterSessionFilter L2FromIndex:ToIndex:ByElement:WithMean:](self, "L2FromIndex:ToIndex:ByElement:WithMean:", v5, v4, v8 - 1);
      double v7 = v7 + v9;
    }
    while ([(NSArray *)self->_elementsNames count] > v8++);
  }
  return v7;
}

- (double)L2FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5 WithMean:(double)a6
{
  for (double i = 0.0; a3 <= a4; ++a3)
  {
    double v7 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v7)
    {
      double v8 = *(double *)v7;
      double v9 = *(double **)(*((void *)v7 + 2) + 8 * a5);
      double i = i + v8 * ((*v9 - a6) * (*v9 - a6));
    }
  }
  return i;
}

- (double)samplesMeanFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5
{
  double v5 = 0.0;
  for (double i = 0.0; a3 <= a4; ++a3)
  {
    double v7 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v7)
    {
      double i = i + *(double *)v7 * **(double **)(*((void *)v7 + 2) + 8 * a5);
      double v5 = v5 + *(double *)v7;
    }
  }
  if (v5 < 1.0e-20) {
    double v5 = 1.0e-20;
  }
  return i / v5;
}

- (void)resetElementFlags:(void *)a3
{
  *((_WORD *)a3 + 8) = 0;
}

- (id)calculateInterSessionFilterResultFromIndex:(unsigned int)a3
{
  uint64_t v5 = [(NSArray *)self->_elementsNames count];
  double v6 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v5];
  bzero(self->_weightedAverage, 8 * v5);
  bzero(self->_sumOfWeights, 8 * v5);
  unint64_t value = self->_nodes.__size_.__value_;
  if (value > a3)
  {
    uint64_t v8 = a3;
    unint64_t start = self->_nodes.__start_;
    begin = self->_nodes.__map_.__begin_;
    do
    {
      double v11 = (*(Node ***)((char *)begin + (((start + v8) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v8) & 0x1FF];
      double v12 = (double **)*((void *)v11 + 2);
      if (v12 != *((double ***)v11 + 3))
      {
        int v13 = 0;
        do
        {
          double v14 = *v12;
          if (!*((unsigned char *)*v12 + 16))
          {
            weightedAverage = self->_weightedAverage;
            self->_sumOfWeights[v13] = *((double *)v11 + 1) + self->_sumOfWeights[v13];
            weightedAverage[v13] = weightedAverage[v13] + *v14 * *((double *)v11 + 1);
          }
          -[ADInterSessionFilter resetElementFlags:](self, "resetElementFlags:");
          ++v13;
          unint64_t start = self->_nodes.__start_;
          begin = self->_nodes.__map_.__begin_;
          ++v12;
          double v11 = (*(Node ***)((char *)begin + (((start + v8) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v8) & 0x1FF];
        }
        while (v12 != *((double ***)v11 + 3));
        unint64_t value = self->_nodes.__size_.__value_;
      }
      uint64_t v8 = ++a3;
    }
    while (value > a3);
  }
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      double v17 = [NSNumber numberWithDouble:self->_weightedAverage[i] / self->_sumOfWeights[i]];
      long long v18 = [(NSArray *)self->_elementsNames objectAtIndexedSubscript:i];
      [v6 setObject:v17 forKeyedSubscript:v18];
    }
  }

  return v6;
}

- (int64_t)markOutliers:(unsigned int)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  unsigned int v5 = [(ADInterSessionFilterParameters *)self->_params outlierNumber];
  unint64_t value = self->_nodes.__size_.__value_;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = self->_elementsNames;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    unsigned int v8 = vcvtpd_u64_f64((double)v5 * (double)(value - a3) / (double)value);
    uint64_t v35 = *(void *)v39;
    p_sets = (uint64_t **)&self->_sets;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v38 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
        v42 = __p;
        double v12 = (void *)**((void **)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0) {
          operator delete(__p[0]);
        }
        id v13 = v11;
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);
        v42 = __p;
        uint64_t v14 = *((void *)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0) {
          operator delete(__p[0]);
        }
        id v15 = v13;
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v15 UTF8String]);
        v42 = __p;
        uint64_t v16 = *((void *)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0) {
          operator delete(__p[0]);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v15 UTF8String]);
        v42 = __p;
        double v17 = (void *)**((void **)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0) {
          operator delete(__p[0]);
        }
        if (v12 != (void *)(v14 + 8) && v8)
        {
          unsigned int v18 = 0;
          do
          {
            uint64_t v19 = v12[4];
            if (*(unsigned char *)(v19 + 17))
            {
              *(unsigned char *)(v19 + 16) = 1;
              ++v18;
            }
            long long v20 = (void *)v12[1];
            if (v20)
            {
              do
              {
                id v21 = v20;
                long long v20 = (void *)*v20;
              }
              while (v20);
            }
            else
            {
              do
              {
                id v21 = (void *)v12[2];
                BOOL v22 = *v21 == (void)v12;
                double v12 = v21;
              }
              while (!v22);
            }
            if (v21 == (void *)(v14 + 8)) {
              break;
            }
            double v12 = v21;
          }
          while (v18 < v8);
        }
        uint64_t v23 = (void *)(v16 + 8);
        if ((void *)(v16 + 8) != v17 && v8)
        {
          unsigned int v24 = 0;
          do
          {
            v25 = (void *)*v23;
            long long v26 = (void *)*v23;
            long long v27 = v23;
            if (*v23)
            {
              do
              {
                long long v28 = v26;
                long long v26 = (void *)v26[1];
              }
              while (v26);
            }
            else
            {
              do
              {
                long long v28 = (void *)v27[2];
                BOOL v22 = *v28 == (void)v27;
                long long v27 = v28;
              }
              while (v22);
            }
            if (*(unsigned char *)(v28[4] + 17))
            {
              long long v29 = (void *)*v23;
              v30 = v23;
              if (v25)
              {
                do
                {
                  uint64_t v31 = v29;
                  long long v29 = (void *)v29[1];
                }
                while (v29);
              }
              else
              {
                do
                {
                  uint64_t v31 = (void *)v30[2];
                  BOOL v22 = *v31 == (void)v30;
                  v30 = v31;
                }
                while (v22);
              }
              *(unsigned char *)(v31[4] + 16) = 1;
              ++v24;
            }
            if (v25)
            {
              do
              {
                v32 = v25;
                v25 = (void *)v25[1];
              }
              while (v25);
            }
            else
            {
              do
              {
                v32 = (void *)v23[2];
                BOOL v22 = *v32 == (void)v23;
                uint64_t v23 = v32;
              }
              while (v22);
            }
            if (v32 == v17) {
              break;
            }
            uint64_t v23 = v32;
          }
          while (v24 < v8);
        }
      }
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v7);
  }

  return 0;
}

- (void)markInStep:(unsigned int)a3
{
  unint64_t value = self->_nodes.__size_.__value_;
  if (value > a3)
  {
    uint64_t v4 = a3;
    unint64_t start = self->_nodes.__start_;
    begin = self->_nodes.__map_.__begin_;
    do
    {
      uint64_t v7 = (*(Node ***)((char *)begin + (((start + v4) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v4) & 0x1FF];
      unsigned int v8 = (uint64_t *)*((void *)v7 + 2);
      double v9 = (uint64_t *)*((void *)v7 + 3);
      while (v8 != v9)
      {
        uint64_t v10 = *v8++;
        *(unsigned char *)(v10 + 17) = 1;
      }
      uint64_t v4 = ++a3;
    }
    while (value > a3);
  }
}

- (unsigned)stepDetection
{
  uint64_t v3 = [(ADInterSessionFilter *)self kIndexCandidate];
  if ([(ADInterSessionFilter *)self TtestStepWithCandidate:v3]) {
    return v3;
  }
  else {
    return 0;
  }
}

- (id)insertEntryAndCalculate:(id)a3 withWeight:(double)a4
{
  id v6 = a3;
  if ([(ADInterSessionFilter *)self insertEntry:v6 withWeight:a4])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(ADInterSessionFilter *)self calculate];
  }

  return v7;
}

- (void)setOnlineWeights:(unsigned int)a3
{
  unint64_t value = self->_nodes.__size_.__value_;
  if (value > a3)
  {
    unsigned int v4 = a3;
    uint64_t v6 = a3;
    unint64_t start = self->_nodes.__start_;
    begin = self->_nodes.__map_.__begin_;
    do
    {
      double v9 = (*(Node ***)((char *)begin + (((start + v6) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v6) & 0x1FF];
      *((void *)v9 + 1) = *(void *)v9;
      uint64_t v10 = *((void *)v9 + 2);
      uint64_t v11 = *((void *)v9 + 3);
      while (v10 != v11)
      {
        if (*(unsigned char *)(*(void *)v10 + 16))
        {
          [(ADInterSessionFilterParameters *)self->_params outlierWeight];
          unint64_t start = self->_nodes.__start_;
          unint64_t value = self->_nodes.__size_.__value_;
          begin = self->_nodes.__map_.__begin_;
          *((double *)(*(Node ***)((char *)begin + (((start + v6) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v6) & 0x1FF]
          + 1) = v12;
          break;
        }
        v10 += 8;
      }
      uint64_t v6 = ++v4;
    }
    while (value > v4);
  }
}

- (id)calculate
{
  unint64_t value = self->_nodes.__size_.__value_;
  if (value >= [(ADInterSessionFilterParameters *)self->_params minimalEntriesForResult])
  {
    if ([(ADInterSessionFilterParameters *)self->_params isStepDetectionActive]) {
      uint64_t v5 = [(ADInterSessionFilter *)self stepDetection];
    }
    else {
      uint64_t v5 = 0;
    }
    [(ADInterSessionFilter *)self markInStep:v5];
    [(ADInterSessionFilter *)self markOutliers:v5];
    [(ADInterSessionFilter *)self setOnlineWeights:v5];
    unsigned int v4 = [(ADInterSessionFilter *)self calculateInterSessionFilterResultFromIndex:v5];
  }
  else
  {
    unsigned int v4 = 0;
  }

  return v4;
}

- (int64_t)fillWithEntry:(id)a3
{
  id v4 = a3;
  int v5 = -1;
  while (++v5 < [(ADInterSessionFilterParameters *)self->_params capacity])
  {
    [(ADInterSessionFilterParameters *)self->_params maximalWeight];
    int64_t v7 = [(ADInterSessionFilter *)self insertEntry:v4 withWeight:v6];
    if (v7) {
      goto LABEL_6;
    }
  }
  int64_t v7 = 0;
LABEL_6:

  return v7;
}

- (void)dealloc
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)self->_sets.__tree_.__begin_node_;
  p_pair1 = &self->_sets.__tree_.__pair1_;
  if (begin_node != &self->_sets.__tree_.__pair1_)
  {
    do
    {
      left = (char *)begin_node[7].__value_.__left_;
      std::__tree<Element *,Element::ElementCompare,std::allocator<Element *>>::destroy(*((void **)left + 1));
      *(void *)left = left + 8;
      *((void *)left + 2) = 0;
      *((void *)left + 1) = 0;
      float v6 = (void **)begin_node[7].__value_.__left_;
      if (v6)
      {
        std::__tree<Element *,Element::ElementCompare,std::allocator<Element *>>::destroy(v6[1]);
        MEMORY[0x24C570740](v6, 0x1020C4062D53EE8);
      }
      int64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)begin_node[1].__value_.__left_;
      if (v7)
      {
        do
        {
          unsigned int v8 = v7;
          int64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)v7->__value_.__left_;
        }
        while (v7);
      }
      else
      {
        do
        {
          unsigned int v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }
  std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::destroy((char *)self->_sets.__tree_.__pair1_.__value_.__left_);
  self->_sets.__tree_.__pair1_.__value_.__left_ = 0;
  self->_sets.__tree_.__pair3_.__value_ = 0;
  self->_sets.__tree_.__begin_node_ = p_pair1;
  begin = self->_nodes.__map_.__begin_;
  end = self->_nodes.__map_.__end_;
  float v12 = &begin[self->_nodes.__start_ >> 9];
  if (end == begin) {
    id v13 = 0;
  }
  else {
    id v13 = &(*v12)[self->_nodes.__start_ & 0x1FF];
  }
  while (1)
  {
    unint64_t v15 = (char *)end - (char *)begin;
    if (v15)
    {
      unint64_t v16 = self->_nodes.__size_.__value_ + self->_nodes.__start_;
      uint64_t v17 = (uint64_t)&(*(Node ***)((char *)begin + ((v16 >> 6) & 0x3FFFFFFFFFFFFF8)))[v16 & 0x1FF];
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (v13 == (Node **)v17) {
      break;
    }
    if (*v13)
    {
      Node::~Node(*v13);
      MEMORY[0x24C570740]();
    }
    if ((char *)++v13 - (char *)*v12 == 4096)
    {
      uint64_t v14 = v12[1];
      ++v12;
      id v13 = v14;
    }
    begin = self->_nodes.__map_.__begin_;
    end = self->_nodes.__map_.__end_;
  }
  self->_nodes.__size_.__value_ = 0;
  if (v15 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      unsigned int v18 = self->_nodes.__map_.__end_;
      begin = self->_nodes.__map_.__begin_ + 1;
      self->_nodes.__map_.__begin_ = begin;
      unint64_t v15 = (char *)v18 - (char *)begin;
    }
    while (v15 > 0x10);
  }
  if (v15 >> 3 == 1)
  {
    unint64_t v19 = 256;
  }
  else
  {
    if (v15 >> 3 != 2) {
      goto LABEL_29;
    }
    unint64_t v19 = 512;
  }
  self->_nodes.__start_ = v19;
LABEL_29:
  weightedAverage = self->_weightedAverage;
  if (weightedAverage) {
    MEMORY[0x24C570720](weightedAverage, 0x1000C8000313F17);
  }
  sumOfWeights = self->_sumOfWeights;
  if (sumOfWeights) {
    MEMORY[0x24C570720](sumOfWeights, 0x1000C8000313F17);
  }
  v22.receiver = self;
  v22.super_class = (Class)ADInterSessionFilter;
  [(ADInterSessionFilter *)&v22 dealloc];
}

@end