@interface AlgosScoreCombiner
+ (id)combiner;
- (AlgosScoreCombiner)init;
- (double)signedMeanSquaredDeviation;
- (id)scoreScores:(id)a3;
- (int)debug;
- (void)addScore:(double)a3 weight:(double)a4 type:(id)a5 label:(id)a6;
- (void)clearScores;
- (void)dealloc;
- (void)setDebug:(int)a3;
@end

@implementation AlgosScoreCombiner

+ (id)combiner
{
  v2 = objc_alloc_init(AlgosScoreCombiner);
  return v2;
}

- (AlgosScoreCombiner)init
{
  v4.receiver = self;
  v4.super_class = (Class)AlgosScoreCombiner;
  v2 = [(AlgosScoreCombiner *)&v4 init];
  if (!v2) {
    return v2;
  }
  result = (AlgosScoreCombiner *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->combinerData = 0;
    *(void *)&result->_debug = 0;
    v2->combinerData = result;
    return v2;
  }
  __break(1u);
  return result;
}

- (void)dealloc
{
  combinerData = self->combinerData;
  if (combinerData)
  {
    v5 = (void **)self->combinerData;
    std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x2166BF060](combinerData, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)AlgosScoreCombiner;
  [(AlgosScoreCombiner *)&v4 dealloc];
}

- (void)addScore:(double)a3 weight:(double)a4 type:(id)a5 label:(id)a6
{
  id v10 = a5;
  v11 = (__CFString *)a6;
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = &stru_26C637318;
  }
  combinerData = (uint64_t *)self->combinerData;
  id v14 = v10;
  std::string::basic_string[abi:ne180100]<0>(v18, (char *)[v14 cStringUsingEncoding:4]);
  v15 = v12;
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)[(__CFString *)v15 cStringUsingEncoding:4]);
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(v20, v18, v16, a3, a4);
  std::vector<AlgosScoreCombinerFrameRow>::push_back[abi:ne180100](combinerData, (AlgosScoreCombinerFrameRow *)v20);
  if (v23 < 0) {
    operator delete(__p);
  }
  if (v21 < 0) {
    operator delete(v20[0]);
  }
  if (v17 < 0) {
    operator delete(v16[0]);
  }
  if (v19 < 0) {
    operator delete(v18[0]);
  }
}

- (void)clearScores
{
  combinerData = (uint64_t *)self->combinerData;
  uint64_t v4 = *combinerData;
  uint64_t v3 = combinerData[1];
  if (v3 != *combinerData)
  {
    do
    {
      v3 -= 64;
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100]((uint64_t)(combinerData + 2), v3);
    }
    while (v3 != v4);
  }
  combinerData[1] = v4;
}

- (double)signedMeanSquaredDeviation
{
  combinerData = (const AlgosScoreCombinerFrameRow **)self->combinerData;
  uint64_t v4 = *combinerData;
  v5 = combinerData[1];
  double v6 = 0.0;
  if (*combinerData != v5)
  {
    v7.f64[0] = NAN;
    v7.f64[1] = NAN;
    int8x16_t v12 = (int8x16_t)vnegq_f64(v7);
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v15, v4);
      v8.i64[0] = v19;
      int8x16_t v13 = v8;
      int v9 = [(AlgosScoreCombiner *)self debug];
      *(double *)v10.i64 = *(double *)v13.i64 * *(double *)v13.i64;
      *(void *)&double v14 = vbslq_s8(v12, v10, v13).u64[0];
      if (v9 >= 2) {
        printf("deviation: %f, score_incr: %f\n", *(double *)v13.i64, v14);
      }
      if (v18 < 0) {
        operator delete(__p);
      }
      if (v16 < 0) {
        operator delete(v15);
      }
      double v6 = v6 + v14;
      uint64_t v4 = (const AlgosScoreCombinerFrameRow *)((char *)v4 + 64);
    }
    while (v4 != v5);
  }
  if ([(AlgosScoreCombiner *)self debug] > 1) {
    printf("raw score: %f\n", v6);
  }
  return sqrt(v6 / (double)(unint64_t)((combinerData[1] - *combinerData) >> 6));
}

- (id)scoreScores:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  double v6 = v5;
  if (v4) {
    float64x2_t v7 = v4;
  }
  else {
    float64x2_t v7 = @"no-label";
  }
  [v5 setObject:v7 forKeyedSubscript:@"label"];
  if ([(AlgosScoreCombiner *)self debug])
  {
    AlgosScoreCombinerFrame::DebugPrint((const std::string **)self->combinerData, 25);
    int8x16_t v8 = [NSNumber numberWithDouble:amean((const AlgosScoreCombinerFrameRow **)self->combinerData)];
    [v6 setObject:v8 forKeyedSubscript:@"amean"];

    int v9 = NSNumber;
    combinerData = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    v11 = *combinerData;
    int8x16_t v12 = combinerData[1];
    if (*combinerData == v12)
    {
      double v14 = 0.0;
    }
    else
    {
      double v13 = (double)(unint64_t)((v12 - v11) >> 6);
      double v14 = 0.0;
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v11);
        double v15 = log(fabs(v65));
        if (v64 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v62) < 0) {
          operator delete(v60);
        }
        double v14 = v14 + v15 / v13;
        v11 = (const AlgosScoreCombinerFrameRow *)((char *)v11 + 64);
      }
      while (v11 != v12);
    }
    char v16 = [v9 numberWithDouble:(double)exp(v14)];
    [v6 setObject:v16 forKeyedSubscript:@"gmean(abs)"];

    char v17 = NSNumber;
    char v18 = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    uint64_t v19 = *v18;
    v20 = v18[1];
    double v21 = 0.0;
    if (*v18 == v20)
    {
      char v23 = *v18;
    }
    else
    {
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v19);
        double v22 = v65;
        if (v64 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v62) < 0) {
          operator delete(v60);
        }
        double v21 = v21 + 1.0 / v22;
        uint64_t v19 = (const AlgosScoreCombinerFrameRow *)((char *)v19 + 64);
      }
      while (v19 != v20);
      uint64_t v19 = *v18;
      char v23 = v18[1];
    }
    v24 = [v17 numberWithDouble:(double)(unint64_t)((v23 - v19) >> 6) / v21];
    [v6 setObject:v24 forKeyedSubscript:@"hmean(abs)"];

    v25 = NSNumber;
    v26 = (AlgosScoreCombinerFrameRow **)self->combinerData;
    v27 = *v26;
    v28 = v26[1];
    uint64_t v29 = v28 - *v26;
    if ((unint64_t)v29 > 0x7F)
    {
      v60 = 0;
      v61 = 0;
      uint64_t v62 = 0;
      std::vector<AlgosScoreCombinerFrameRow>::__init_with_size[abi:ne180100]<AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)&v60, v27, v28, v29 >> 6);
      unint64_t v31 = 126 - 2 * __clz(((char *)v61 - (unsigned char *)v60) >> 6);
      v58 = compareScores;
      if (v61 == v60) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = v31;
      }
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,false>((AlgosScoreCombinerFrameRow *)v60, v61, (uint64_t (**)(std::string *, const AlgosScoreCombinerFrameRow *))&v58, v32, 1);
      v33 = (double *)((char *)v60 + ((((v26[1] - *v26) >> 1) + 32) & 0xFFFFFFFFFFFFFFC0));
      double v30 = *(v33 - 1) + (v33[7] - *(v33 - 1)) * 0.5;
      v59 = &v60;
      std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&v59);
    }
    else
    {
      double v30 = nan("median");
    }
    v34 = objc_msgSend(v25, "numberWithDouble:", v30, v58);
    [v6 setObject:v34 forKeyedSubscript:@"median"];

    v35 = [NSNumber numberWithDouble:stddev((const AlgosScoreCombinerFrameRow **)self->combinerData)];
    [v6 setObject:v35 forKeyedSubscript:@"std"];

    v36 = NSNumber;
    v37 = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    double v38 = amean(v37);
    v39 = *v37;
    v40 = v37[1];
    if (*v37 == v40)
    {
      double v42 = 0.0;
      v44 = *v37;
    }
    else
    {
      double v41 = v38;
      double v42 = 0.0;
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v39);
        double v43 = v65;
        if (v64 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v62) < 0) {
          operator delete(v60);
        }
        double v42 = v42 + vabdd_f64(v43, v41);
        v39 = (const AlgosScoreCombinerFrameRow *)((char *)v39 + 64);
      }
      while (v39 != v40);
      v39 = *v37;
      v44 = v37[1];
    }
    v45 = [v36 numberWithDouble:v42 / (double)(unint64_t)((v44 - v39) >> 6)];
    [v6 setObject:v45 forKeyedSubscript:@"mad"];

    v46 = NSNumber;
    v47 = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    v48 = *v47;
    v49 = v47[1];
    double v50 = *((double *)*v47 + 7);
    double v51 = v50;
    while (v48 != v49)
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v48);
      if (v65 < v50) {
        double v50 = v65;
      }
      if (v51 < v65) {
        double v51 = v65;
      }
      if (v64 < 0) {
        operator delete(__p);
      }
      if (SHIBYTE(v62) < 0) {
        operator delete(v60);
      }
      v48 = (const AlgosScoreCombinerFrameRow *)((char *)v48 + 64);
    }
    v52 = [v46 numberWithDouble:v51 - v50];
    [v6 setObject:v52 forKeyedSubscript:@"scale"];

    v53 = objc_msgSend(NSNumber, "numberWithDouble:", standard_moment((const AlgosScoreCombinerFrameRow **)self->combinerData, 4));
    [v6 setObject:v53 forKeyedSubscript:@"kurtosis"];

    v54 = objc_msgSend(NSNumber, "numberWithDouble:", standard_moment((const AlgosScoreCombinerFrameRow **)self->combinerData, 3));
    [v6 setObject:v54 forKeyedSubscript:@"skew"];
  }
  v55 = NSNumber;
  [(AlgosScoreCombiner *)self signedMeanSquaredDeviation];
  v56 = objc_msgSend(v55, "numberWithDouble:");
  [v6 setObject:v56 forKeyedSubscript:@"score"];

  return v6;
}

- (int)debug
{
  return self->_debug;
}

- (void)setDebug:(int)a3
{
  self->_debug = a3;
}

@end