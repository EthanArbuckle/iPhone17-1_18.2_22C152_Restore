@interface AlgosStreamScore
+ (id)streamScore;
- (AlgosStreamScore)init;
- (BOOL)debug;
- (BOOL)enforceStreamEnd;
- (BOOL)music;
- (BOOL)restoreEventsFromFile:(id)a3 clear:(BOOL)a4;
- (BOOL)saveEventsToFile:(id)a3;
- (double)findTotalTime:(id)a3 debug:(BOOL)a4;
- (id)scoreStreaming:(id)a3;
- (void)addRawStreamEvent:(int)a3 start:(double)a4 end:(double)a5 weight:(double)a6 quality:(double)a7 params:(id)a8;
- (void)addStreamEnd:(double)a3;
- (void)addStreamFailure:(double)a3 weight:(double)a4;
- (void)addStreamPenalty:(double)a3 amount:(double)a4;
- (void)addStreamStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6;
- (void)addStreamStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6 params:(id)a7;
- (void)addStreamStart:(double)a3 play:(double)a4;
- (void)addStreamStartupStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6;
- (void)addStreamTierSwitch:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6;
- (void)clearStreamRows;
- (void)dealloc;
- (void)setDebug:(BOOL)a3;
- (void)setEnforceStreamEnd:(BOOL)a3;
- (void)setMusic:(BOOL)a3;
@end

@implementation AlgosStreamScore

- (void)addStreamStart:(double)a3 play:(double)a4
{
}

- (AlgosStreamScore)init
{
  v4.receiver = self;
  v4.super_class = (Class)AlgosStreamScore;
  v2 = [(AlgosStreamScore *)&v4 init];
  if (!v2) {
    return v2;
  }
  result = (AlgosStreamScore *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->streamData = 0;
    result->logisticScale = 0.0;
    v2->streamData = result;
    v2->logisticScale = 7.5;
    [(AlgosStreamScore *)v2 setMusic:0];
    return v2;
  }
  __break(1u);
  return result;
}

- (void)setMusic:(BOOL)a3
{
  self->_music = a3;
}

- (void)addRawStreamEvent:(int)a3 start:(double)a4 end:(double)a5 weight:(double)a6 quality:(double)a7 params:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v13 = a8;
  id v24 = v13;
  if (v12 >= 6)
  {
    id v23 = objc_alloc(MEMORY[0x263EFF940]);
    objc_exception_throw((id)objc_msgSend(v23, "initWithName:reason:userInfo:", *MEMORY[0x263EFF4A0], @"Not a valid event", 0, v24));
  }
  v34[0] = 0;
  v34[1] = 0;
  v33 = (uint64_t *)v34;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v13;
  uint64_t v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v36, 16, v24);
  if (v15)
  {
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v19 = [v14 objectForKeyedSubscript:v18];
        uint64_t v20 = [v19 cStringUsingEncoding:4];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 cStringUsingEncoding:4]);
        v35 = __p;
        v21 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v33, (const void **)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v35);
        MEMORY[0x2166BEEE0]((char *)v21 + 56, v20);
        if (v27 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v15);
  }

  streamData = (uint64_t *)self->streamData;
  AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(__p, v12, &v33, a4, a5, a6, a7);
  std::vector<AlgosScoreStreamFrameRow>::push_back[abi:ne180100](streamData, (AlgosScoreStreamFrameRow *)__p);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v28, v28[1]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v33, v34[0]);
}

- (void)dealloc
{
  streamData = self->streamData;
  if (streamData)
  {
    v5 = (void **)self->streamData;
    std::vector<AlgosScoreStreamFrameRow>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x2166BF060](streamData, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)AlgosStreamScore;
  [(AlgosStreamScore *)&v4 dealloc];
}

+ (id)streamScore
{
  v2 = objc_alloc_init(AlgosStreamScore);
  return v2;
}

- (void)addStreamStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6 params:(id)a7
{
}

- (void)addStreamStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6
{
}

- (void)addStreamStartupStall:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6
{
}

- (void)addStreamFailure:(double)a3 weight:(double)a4
{
}

- (void)addStreamTierSwitch:(double)a3 end:(double)a4 quality:(double)a5 weight:(double)a6
{
}

- (void)addStreamPenalty:(double)a3 amount:(double)a4
{
}

- (void)addStreamEnd:(double)a3
{
}

- (void)clearStreamRows
{
  streamData = (uint64_t *)self->streamData;
  uint64_t v4 = *streamData;
  uint64_t v3 = streamData[1];
  if (v3 != *streamData)
  {
    do
    {
      uint64_t v5 = v3 - 64;
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v3 - 24, *(void **)(v3 - 16));
      uint64_t v3 = v5;
    }
    while (v5 != v4);
  }
  streamData[1] = v4;
}

- (double)findTotalTime:(id)a3 debug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)v28, *(const AlgosScoreStreamFrameRow **)self->streamData);
  AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)v25, (const AlgosScoreStreamFrameRow *)(*((void *)self->streamData + 1) - 64));
  streamData = (const AlgosScoreStreamFrameRow **)self->streamData;
  v8 = *streamData;
  v9 = streamData[1];
  if (*streamData == v9)
  {
    uint64_t v10 = 0;
    double v12 = 0.0;
  }
  else
  {
    uint64_t v10 = 0;
    char v11 = 0;
    double v12 = 0.0;
    do
    {
      AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)&v21, v8);
      int v13 = v21;
      if (!((v21 != 0) | v11 & 1))
      {
        AlgosScoreStreamFrameRow::operator=((uint64_t)v28, (uint64_t)&v21);
        char v11 = 1;
        int v13 = v21;
      }
      if (v13 == 5)
      {
        AlgosScoreStreamFrameRow::operator=((uint64_t)v25, (uint64_t)&v21);
        uint64_t v10 = (v10 + 1);
      }
      else if (v13 == 1)
      {
        double v12 = v12 + v23 - v22;
      }
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v24, v24[1]);
      v8 = (const AlgosScoreStreamFrameRow *)((char *)v8 + 64);
    }
    while (v8 != v9);
  }
  double v14 = v26 - v29;
  uint64_t v15 = [NSNumber numberWithDouble:v26 - v29];
  [v6 setObject:v15 forKeyedSubscript:@"total-duration"];

  uint64_t v16 = [NSNumber numberWithDouble:v12];
  [v6 setObject:v16 forKeyedSubscript:@"stall-time"];
  double v17 = fmax(v14 - v12, 0.1);

  v18 = [NSNumber numberWithDouble:v17];
  [v6 setObject:v18 forKeyedSubscript:@"net-time"];

  id v19 = [NSNumber numberWithInt:v10];
  [v6 setObject:v19 forKeyedSubscript:@"end-count"];

  if (v4) {
    printf("duration: %1.3f, stall: %1.3f\n", v14, v12);
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v27, v27[1]);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v30, v30[1]);

  return v17;
}

- (id)scoreStreaming:(id)a3
{
  v102[3] = *MEMORY[0x263EF8340];
  BOOL v4 = (__CFString *)a3;
  if (*(void *)self->streamData == *((void *)self->streamData + 1))
  {
    v58 = 0;
  }
  else
  {
    if (!v4) {
      BOOL v4 = @"no-label";
    }
    v81 = v4;
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    [(AlgosStreamScore *)self findTotalTime:v5 debug:[(AlgosStreamScore *)self debug]];
    double v77 = *(double *)v6.i64;
    streamData = (const AlgosScoreStreamFrameRow **)self->streamData;
    v9 = *streamData;
    v8 = streamData[1];
    if (*streamData != v8)
    {
      uint64_t v10 = 0;
      uint64_t v85 = 0;
      unsigned int v88 = 0;
      unsigned int v84 = 0;
      double v11 = 1.0;
      char v12 = 1;
      v6.i64[0] = 0;
      int8x16_t v89 = v6;
      double v13 = 0.0;
      double v14 = 0.0;
      double v15 = 0.0;
      double v83 = 0.0;
      double v86 = 0.0;
      double v87 = 0.0;
      double v16 = 0.0;
      while (1)
      {
        AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)&v95, v9);
        unsigned int v17 = v95;
        if (![(AlgosStreamScore *)self debug]) {
          break;
        }
        AlgosScoreStreamFrameRow::StringForEvent(v17, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        printf("Event: %s", (const char *)p_p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (v100[2])
        {
          AlgosScoreStreamFrameRow::GetParamString((AlgosScoreStreamFrameRow *)&v95, (uint64_t)&__p);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            id v19 = &__p;
          }
          else {
            id v19 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          printf(", Params: %s\n", (const char *)v19);
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            break;
          }
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((v12 & 1) == 0)
          {
LABEL_23:
            double v20 = v98;
            switch(v17)
            {
              case 1u:
                std::string::basic_string[abi:ne180100]<0>(v92, "startup");
                std::string::basic_string[abi:ne180100]<0>(v90, "false");
                AlgosScoreStreamFrameRow::GetParam((uint64_t)&v95, (const void **)v92, (uint64_t)v90, &__p);
                if (v91 < 0) {
                  operator delete(v90[0]);
                }
                if (v93 < 0) {
                  operator delete(v92[0]);
                }
                int v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  double v22 = (std::string *)((char *)&__p + HIBYTE(__p.__r_.__value_.__r.__words[2]));
                }
                else {
                  double v22 = (std::string *)(__p.__r_.__value_.__r.__words[0] + __p.__r_.__value_.__l.__size_);
                }
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  double v23 = &__p;
                }
                else {
                  double v23 = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                if (v23 != v22)
                {
                  do
                  {
                    v23->__r_.__value_.__s.__data_[0] = __tolower(v23->__r_.__value_.__s.__data_[0]);
                    double v23 = (std::string *)((char *)v23 + 1);
                  }
                  while (v23 != v22);
                  int v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
                }
                double v80 = v20;
                if ((v21 & 0x80) != 0)
                {
                  if (__p.__r_.__value_.__l.__size_ != 4) {
                    goto LABEL_57;
                  }
                  id v24 = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_56:
                  double v40 = v15;
                  int v41 = LODWORD(v24->__r_.__value_.__l.__data_) == 1702195828;
                }
                else
                {
                  if (v21 == 4)
                  {
                    id v24 = &__p;
                    goto LABEL_56;
                  }
LABEL_57:
                  double v40 = v15;
                  int v41 = 0;
                }
                double v82 = 0.0;
                double v42 = v96;
                if (v14 != 0.0 && (v41 & 1) == 0) {
                  double v82 = exp((v96 - v14) / -30.0);
                }
                double v78 = v16;
                double v79 = v40;
                double v43 = v97;
                double v44 = v99;
                if ([(AlgosStreamScore *)self music]) {
                  double v45 = v11;
                }
                else {
                  double v45 = v44;
                }
                if (v45 >= 0.5) {
                  double v46 = v11 - v45 + 0.5;
                }
                else {
                  double v46 = v11;
                }
                double logisticScale = self->logisticScale;
                [(AlgosStreamScore *)self debug];
                double v48 = v43 - v42;
                long double v49 = -(logisticScale - (v82 + 0.2) * logisticScale * 2.0);
                long double v50 = exp(-(logisticScale - (v82 + 0.2 + v48 / 10.0) * logisticScale * 2.0));
                double v51 = log(v50 + 1.0);
                long double v52 = exp(v49);
                double v53 = log(v52 + 1.0);
                if (v41) {
                  double v54 = 0.0;
                }
                else {
                  double v54 = (1.0 - v82) * 8.5;
                }
                double v55 = v46 * (v51 - v53) * 8.0;
                double v56 = v54 + v55;
                if ([(AlgosStreamScore *)self debug]) {
                  printf("%1.2f: last_stall: %1.2f, shift: %1.2f, deltat: %1.2f, quality: %1.2f, qfactor: %1.2f, wgt: %1.2f, lscore: %1.2f\n", v96 - v13, v14, v82, v48, v45, v46, v80, v56);
                }
                if (!v41) {
                  double v14 = v97;
                }
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(__p.__r_.__value_.__l.__data_);
                }
                v84 += v41;
                double v15 = v79;
                double v83 = v83 + v54 * v80;
                double v16 = v78 + v55 * v80;
                LODWORD(v85) = v85 + 1;
                v57.i64[1] = v89.i64[1];
                *(double *)v57.i64 = *(double *)v89.i64 + v56 * v80;
                int8x16_t v89 = v57;
                double v11 = 1.0;
                goto LABEL_20;
              case 2u:
                BOOL v38 = [(AlgosStreamScore *)self debug];
                v39.i64[1] = v89.i64[1];
                *(double *)v39.i64 = *(double *)v89.i64 + v20 * 75.0;
                int8x16_t v89 = v39;
                ++v88;
                double v87 = v87 + v20 * 75.0;
                if (v38) {
                  printf("Fixed failure penalty: %1.2f\n");
                }
                goto LABEL_20;
              case 3u:
                double v25 = v14;
                double v26 = v15;
                double v27 = v16;
                double v29 = v96;
                double v28 = v97;
                double v30 = v99;
                if ([(AlgosStreamScore *)self music]) {
                  double v30 = 1.0;
                }
                BOOL v31 = [(AlgosStreamScore *)self debug];
                double v32 = v28 - v29;
                double v33 = (v28 - v29) / v77;
                double v34 = v20 * (v33 * (1.0 - v30) * 85.0);
                double v15 = v26 + v34;
                v35.i64[1] = v89.i64[1];
                *(double *)v35.i64 = *(double *)v89.i64 + v34;
                int8x16_t v89 = v35;
                ++HIDWORD(v85);
                if (v31) {
                  printf("%1.2f: quality: %1.2f, deltat: %1.2f, pct: %1.2f%%, dscore: %1.2f, weight: %1.2f\n", v96, v30, v32, v33 * 100.0, v34, v20);
                }
                double v16 = v27;
                double v14 = v25;
                double v11 = 1.0;
                goto LABEL_20;
              case 4u:
                BOOL v36 = [(AlgosStreamScore *)self debug];
                v37.i64[1] = v89.i64[1];
                *(double *)v37.i64 = *(double *)v89.i64 + v20;
                int8x16_t v89 = v37;
                double v86 = v86 + v20;
                if (v36) {
                  printf("Penalty imposed: %1.2f\n");
                }
                goto LABEL_20;
              case 5u:
                if ([(AlgosStreamScore *)self enforceStreamEnd]
                  && ((uint64_t)(*((void *)self->streamData + 1) - *(void *)self->streamData) >> 6) - 1 != v10)
                {
                  id v76 = objc_alloc(MEMORY[0x263EFF940]);
                  objc_exception_throw((id)[v76 initWithName:*MEMORY[0x263EFF4A0] reason:@"end must be last event" userInfo:0]);
                }
                goto LABEL_20;
              default:
                goto LABEL_20;
            }
          }
        }
        else
        {
          putchar(10);
          if ((v12 & 1) == 0) {
            goto LABEL_23;
          }
        }
LABEL_18:
        if (v17)
        {
          id v75 = objc_alloc(MEMORY[0x263EFF940]);
          objc_exception_throw((id)[v75 initWithName:*MEMORY[0x263EFF4A0] reason:@"first event must be a stream-start" userInfo:0]);
        }
        double v13 = v96;
LABEL_20:
        ++v10;
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v100, v100[1]);
        char v12 = 0;
        v9 = (const AlgosScoreStreamFrameRow *)((char *)v9 + 64);
        if (v9 == v8) {
          goto LABEL_79;
        }
      }
      if ((v12 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
    uint64_t v85 = 0;
    unsigned int v84 = 0;
    unsigned int v88 = 0;
    double v16 = 0.0;
    double v86 = 0.0;
    double v87 = 0.0;
    double v83 = 0.0;
    double v15 = 0.0;
    v6.i64[0] = 0;
    int8x16_t v89 = v6;
LABEL_79:
    if ([(AlgosStreamScore *)self debug]) {
      printf("Uncompressed Score: %f\n", *(double *)v89.i64);
    }
    double v59 = log1p(fabs(*(double *)v89.i64) * 0.02);
    double v60 = log1p(0.02);
    v61 = [NSNumber numberWithInt:v85];
    [v5 setObject:v61 forKeyedSubscript:@"stall-count"];

    v62 = [NSNumber numberWithInt:v84];
    [v5 setObject:v62 forKeyedSubscript:@"startup-stalls"];

    v63 = [NSNumber numberWithInt:v88];
    [v5 setObject:v63 forKeyedSubscript:@"failures"];

    v64 = [NSNumber numberWithDouble:v87];
    [v5 setObject:v64 forKeyedSubscript:@"failure-penalty"];

    v65 = [NSNumber numberWithInt:HIDWORD(v85)];
    [v5 setObject:v65 forKeyedSubscript:@"tier-switches"];

    v66 = [NSNumber numberWithDouble:v86];
    [v5 setObject:v66 forKeyedSubscript:@"direct-penalty"];

    v67 = [NSNumber numberWithDouble:v83];
    [v5 setObject:v67 forKeyedSubscript:@"stall-boost-penalty"];

    v68 = [NSNumber numberWithDouble:v16];
    [v5 setObject:v68 forKeyedSubscript:@"stall-penalty"];

    v69 = [NSNumber numberWithDouble:v15];
    [v5 setObject:v69 forKeyedSubscript:@"quality-penalty"];

    [v5 setObject:@"streaming" forKeyedSubscript:@"type"];
    v70 = objc_msgSend(NSNumber, "numberWithBool:", -[AlgosStreamScore music](self, "music"));
    [v5 setObject:v70 forKeyedSubscript:@"music"];

    *(double *)v71.i64 = v59 / v60;
    v72.f64[0] = NAN;
    v72.f64[1] = NAN;
    v101[0] = @"score";
    v73 = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)vbslq_s8((int8x16_t)vnegq_f64(v72), v71, v89).i64);
    v102[0] = v73;
    v102[1] = v81;
    v101[1] = @"label";
    v101[2] = @"stats";
    v102[2] = v5;
    v58 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:3];
  }
  return v58;
}

- (BOOL)saveEventsToFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 createFileAtPath:v4 contents:0 attributes:0];

  if (v6)
  {
    v7 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v4];
    if (v7)
    {
      AlgosScoreStreamFrameRow::GetCSVHeader((AlgosScoreStreamFrameRow *)1, &v24);
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v8 = &v24;
      }
      else {
        v8 = (std::string *)v24.__r_.__value_.__r.__words[0];
      }
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v24.__r_.__value_.__l.__size_;
      }
      uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v8 length:size freeWhenDone:0];
      [v7 writeData:v10 error:0];

      streamData = (const AlgosScoreStreamFrameRow **)self->streamData;
      char v12 = *streamData;
      double v13 = streamData[1];
      if (*streamData == v13)
      {
LABEL_20:
        [v7 closeFile];
        BOOL v18 = 1;
      }
      else
      {
        while (1)
        {
          AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)v22, v12);
          AlgosScoreStreamFrameRow::GetCSVRow((AlgosScoreStreamFrameRow *)v22, 1, __p);
          if ((v21 & 0x80u) == 0) {
            double v14 = __p;
          }
          else {
            double v14 = (void **)__p[0];
          }
          if ((v21 & 0x80u) == 0) {
            unint64_t v15 = v21;
          }
          else {
            unint64_t v15 = (unint64_t)__p[1];
          }
          double v16 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v14 length:v15 freeWhenDone:0];
          char v17 = [v7 writeData:v16 error:0];

          if ((char)v21 < 0) {
            operator delete(__p[0]);
          }
          std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v23, v23[1]);
          if ((v17 & 1) == 0) {
            break;
          }
          char v12 = (const AlgosScoreStreamFrameRow *)((char *)v12 + 64);
          if (v12 == v13) {
            goto LABEL_20;
          }
        }
        BOOL v18 = 0;
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)restoreEventsFromFile:(id)a3 clear:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = a3;
  if (v4) {
    [(AlgosStreamScore *)self clearStreamRows];
  }
  char v6 = [MEMORY[0x263F08840] fileHandleForReadingAtPath:v21];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 readDataUpToLength:0x200000 error:0];
    v9 = (void *)v8;
    if (v8)
    {
      uint64_t v10 = (void *)v8;
      double v20 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      [v20 componentsSeparatedByString:@"\n"];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v27;
        char v14 = 1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v11);
            }
            double v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (!(([v16 length] == 0) | v14 & 1))
            {
              streamData = (uint64_t *)self->streamData;
              std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 cStringUsingEncoding:4]);
              AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(v24, __p);
              std::vector<AlgosScoreStreamFrameRow>::push_back[abi:ne180100](streamData, (AlgosScoreStreamFrameRow *)v24);
              std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)v25, v25[1]);
              if (v23 < 0) {
                operator delete(__p[0]);
              }
            }
            char v14 = 0;
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
          char v14 = 0;
        }
        while (v12);
      }

      v9 = v10;
      [v7 closeFile];
      BOOL v18 = 1;
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)enforceStreamEnd
{
  return self->_enforceStreamEnd;
}

- (void)setEnforceStreamEnd:(BOOL)a3
{
  self->_enforceStreamEnd = a3;
}

- (BOOL)music
{
  return self->_music;
}

@end