@interface AlgosScoreFaceTimeDataCSV
+ (id)facetimeDataCSV;
- (AlgosScoreFaceTimeDataCSV)init;
- (BOOL)matchesMethod:(id)a3 code:(int64_t)a4;
- (BOOL)validMethod:(int64_t)a3;
- (NSDictionary)methods;
- (id)setUpMethods;
- (int)transformer;
- (void)setMethods:(id)a3;
@end

@implementation AlgosScoreFaceTimeDataCSV

+ (id)facetimeDataCSV
{
  v2 = objc_alloc_init(AlgosScoreFaceTimeDataCSV);
  return v2;
}

- (id)setUpMethods
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C6385F0, 0);
  [v2 setObject:v3 forKeyedSubscript:@"RealTimeStats"];

  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C638608, 0);
  [v2 setObject:v4 forKeyedSubscript:@"CallSegmentReport"];

  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C638620, 0);
  [v2 setObject:v5 forKeyedSubscript:@"CallEnd"];

  return v2;
}

- (BOOL)matchesMethod:(id)a3 code:(int64_t)a4
{
  id v6 = a3;
  v7 = [(AlgosScoreFaceTimeDataCSV *)self methods];
  v8 = [v7 objectForKey:v6];

  v9 = [NSNumber numberWithLongLong:a4];
  LOBYTE(a4) = [v8 containsObject:v9];

  return a4;
}

- (BOOL)validMethod:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = [(AlgosScoreFaceTimeDataCSV *)self methods];
  v5 = [v4 allValues];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithLongLong:", a3, (void)v14);
        LOBYTE(v10) = [v10 containsObject:v11];

        if (v10)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (AlgosScoreFaceTimeDataCSV)init
{
  v6.receiver = self;
  v6.super_class = (Class)AlgosScoreFaceTimeDataCSV;
  v2 = [(AlgosScoreDataCSV *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(AlgosScoreFaceTimeDataCSV *)v2 setUpMethods];
    [(AlgosScoreFaceTimeDataCSV *)v3 setMethods:v4];
  }
  return v3;
}

- (int)transformer
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  v2 = [(AlgosScoreDataCSV *)self rawStreamData];
  [v2 sortOnColumn:@"eventTime" ascending:1];

  [(AlgosScoreDataCSV *)self clearStreamingData];
  v3 = [(AlgosScoreDataCSV *)self rawStreamData];
  v4 = [(AlgosScoreDataCSV *)self rawStreamData];
  v5 = [v4 rows];
  objc_super v6 = [v5 objectAtIndexedSubscript:0];
  [v3 doubleAtRow:v6 col:@"eventTime" defaultValue:0.0];
  double v93 = v7;

  csvData = (uint64_t *)self->super.csvData;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v9 = [(AlgosScoreDataCSV *)self rawStreamData];
  v10 = [v9 rows];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v104 objects:v108 count:16];
  if (!v11)
  {

    double v81 = 0.0;
    goto LABEL_86;
  }
  uint64_t v12 = 0;
  int v13 = 0;
  unint64_t v87 = 0;
  uint64_t v91 = *(void *)v105;
  double v90 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  double v88 = 0.0;
  double v16 = 0.0;
  do
  {
    uint64_t v95 = 0;
    uint64_t v92 = v11;
    int v94 = v13;
    int v86 = v13 + v11;
    uint64_t v17 = v12;
    double v18 = v16;
    do
    {
      if (*(void *)v105 != v91) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void *)(*((void *)&v104 + 1) + 8 * v95);
      v20 = [(AlgosScoreDataCSV *)self rawStreamData];
      [v20 doubleAtRow:v19 col:@"eventTime" defaultValue:0.0];
      double v22 = v21;

      v23 = [(AlgosScoreDataCSV *)self rawStreamData];
      uint64_t v96 = [v23 intAtRow:v19 col:@"TTxR" defaultValue:v17];

      if (v96) {
        double v24 = fmin((double)v96 / 1949.0, 1.0);
      }
      else {
        double v24 = 0.0;
      }
      v25 = [(AlgosScoreDataCSV *)self rawStreamData];
      uint64_t v26 = [v25 intAtRow:v19 col:@"_method" defaultValue:0];

      v27 = [(AlgosScoreDataCSV *)self rawStreamData];
      uint64_t v28 = [v27 intAtRow:v19 col:@"DERR" defaultValue:0];

      v29 = [(AlgosScoreDataCSV *)self rawStreamData];
      [v29 doubleAtRow:v19 col:@"VST" defaultValue:v15];
      double v31 = v30;

      double v32 = v31;
      v33 = [(AlgosScoreDataCSV *)self rawStreamData];
      [v33 doubleAtRow:v19 col:@"APT" defaultValue:v14];
      double v35 = v34;

      double v36 = v35;
      v37 = [MEMORY[0x263EFF980] array];
      v99 = [MEMORY[0x263EFF980] array];
      v98 = [MEMORY[0x263EFF980] array];
      double v16 = v22 - v93;
      double v38 = (v16 - v18) * 1000.0;
      if (v94) {
        goto LABEL_10;
      }
      std::string::basic_string[abi:ne180100]<0>(v100, "start");
      v40.n128_u64[0] = 0;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, 0, v28 != 0, v38, v40, v16, 1.0, v24);
      unint64_t v41 = csvData[1];
      if (v41 >= csvData[2])
      {
        uint64_t v42 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        uint64_t v42 = v41 + 72;
        csvData[1] = v41 + 72;
      }
      csvData[1] = v42;
      if (v103 < 0) {
        operator delete(__p[0]);
      }
      if (v101 < 0) {
        operator delete(v100[0]);
      }
      if (v32 == 0.0)
      {
LABEL_10:
        double v39 = v16;
      }
      else
      {
        double v93 = v93 - v32;
        double v39 = v32;
        double v38 = v32;
      }
      if ([(AlgosScoreFaceTimeDataCSV *)self matchesMethod:@"CallEnd" code:v26])
      {
        v43 = [(AlgosScoreDataCSV *)self rawStreamData];
        [v43 doubleAtRow:v19 col:@"AEAP" defaultValue:0.0];
        uint64_t v44 = 0;
        double v32 = 0.0;
        double v36 = 0.0;
        v45 = @"end";
        double v88 = v46 / 10000.0;
        goto LABEL_46;
      }
      if ([(AlgosScoreFaceTimeDataCSV *)self matchesMethod:@"CallSegmentReport" code:v26])
      {
        v47 = [(AlgosScoreDataCSV *)self rawStreamData];
        v43 = [v47 atRow:v19 col:@"CONFIG"];

        if ([v43 isEqualToString:&stru_26C637318])
        {
          uint64_t v44 = 0;
        }
        else
        {
          v53 = [v43 componentsSeparatedByString:@":"];
          if ((unint64_t)[v53 count] <= 3)
          {
            id v85 = [MEMORY[0x263EFF940] exceptionWithName:@"Not enough components for CONFIG" reason:0 userInfo:0];
            objc_exception_throw(v85);
          }
          v54 = [v53 objectAtIndexedSubscript:0];
          if ([v54 isEqualToString:@"W"])
          {
            uint64_t v44 = 1;
          }
          else
          {
            v55 = [v53 objectAtIndexedSubscript:1];
            uint64_t v44 = [v55 isEqualToString:@"W"];
          }
        }
        unint64_t v56 = 0x8E38E38E38E38E39 * ((csvData[1] - *csvData) >> 3);
        unint64_t v57 = v56 - v87;
        if (v56 > v87)
        {
          v58 = (unsigned char *)(*csvData + 72 * v87 + 64);
          do
          {
            unsigned char *v58 = v44;
            v58 += 72;
            --v57;
          }
          while (v57);
        }
        unint64_t v87 = v56 + 1;
LABEL_45:
        v45 = &stru_26C637318;
LABEL_46:

        double v15 = v32;
        double v14 = v36;
        if (!v17) {
          goto LABEL_49;
        }
        goto LABEL_47;
      }
      if ([(AlgosScoreFaceTimeDataCSV *)self matchesMethod:@"RealTimeStats" code:v26])
      {
        if (v32 != v15)
        {
          [v37 addObject:@"stall-end-1"];
          double v48 = (v32 - v15) * 1000.0;
          if (v48 < 500.0) {
            double v48 = 0.0;
          }
          v49 = [NSNumber numberWithDouble:v48];
          [v99 addObject:v49];

          v50 = [NSNumber numberWithDouble:1.0];
          [v98 addObject:v50];
        }
        if (v36 != v14)
        {
          [v37 addObject:@"stall-end-2"];
          double v51 = (v36 - v14) * 1000.0;
          if (v51 < 500.0) {
            double v51 = 0.0;
          }
          v52 = [NSNumber numberWithDouble:v51];
          [v99 addObject:v52];

          v43 = [NSNumber numberWithDouble:1.0];
          [v98 addObject:v43];
          uint64_t v44 = 0;
          goto LABEL_45;
        }
      }
      uint64_t v44 = 0;
      double v15 = v32;
      double v14 = v36;
      v45 = &stru_26C637318;
      if (!v17) {
        goto LABEL_49;
      }
LABEL_47:
      if (v17 == v96)
      {
        uint64_t v96 = v17;
        goto LABEL_54;
      }
LABEL_49:
      if ([(__CFString *)v45 isEqualToString:&stru_26C637318]
        && ![v37 count])
      {
        double v90 = v39;
      }
      else
      {
        if (![v37 count])
        {
          [v37 addObject:v45];
          v59 = [NSNumber numberWithDouble:0.0];
          [v99 addObject:v59];

          v60 = [NSNumber numberWithDouble:1.0];
          [v98 addObject:v60];
        }
        [v37 addObject:@"rate"];
        v61 = [NSNumber numberWithDouble:(v39 - v90) * 1000.0];
        [v99 addObject:v61];

        [v98 addObject:&unk_26C638660];
        double v90 = v39;
      }
LABEL_54:
      uint64_t v62 = [v37 count];
      double v63 = v39 * 1000.0;
      if (v62)
      {
        uint64_t v64 = 0;
        BOOL v65 = v28 != 0;
        do
        {
          id v66 = [v37 objectAtIndexedSubscript:v64];
          std::string::basic_string[abi:ne180100]<0>(v100, (char *)[v66 cStringUsingEncoding:4]);
          v67 = [v99 objectAtIndexedSubscript:v64];
          [v67 doubleValue];
          unint64_t v69 = v68;
          v70 = [v98 objectAtIndexedSubscript:v64];
          [v70 doubleValue];
          v71.n128_u64[0] = v69;
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, v44, v65, v38, v71, v63, v72, v24);
          unint64_t v73 = csvData[1];
          if (v73 >= csvData[2])
          {
            uint64_t v74 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
          }
          else
          {
            AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
            uint64_t v74 = v73 + 72;
            csvData[1] = v73 + 72;
          }
          csvData[1] = v74;
          if (v103 < 0) {
            operator delete(__p[0]);
          }

          if (v101 < 0) {
            operator delete(v100[0]);
          }

          ++v64;
        }
        while (v62 != v64);
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(v100, (char *)[(__CFString *)v45 cStringUsingEncoding:4]);
        v75.n128_u64[0] = 0;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, v44, v28 != 0, v38, v75, v63, 1.0, v24);
        unint64_t v76 = csvData[1];
        if (v76 >= csvData[2])
        {
          uint64_t v77 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          uint64_t v77 = v76 + 72;
          csvData[1] = v76 + 72;
        }
        csvData[1] = v77;
        if (v103 < 0) {
          operator delete(__p[0]);
        }
        if (v101 < 0) {
          operator delete(v100[0]);
        }
      }

      ++v94;
      uint64_t v12 = v96;
      uint64_t v17 = v96;
      double v18 = v16;
      ++v95;
    }
    while (v95 != v92);
    uint64_t v11 = [obj countByEnumeratingWithState:&v104 objects:v108 count:16];
    int v13 = v86;
  }
  while (v11);

  if (v88 != 0.0)
  {
    std::string::basic_string[abi:ne180100]<0>(v100, "fixed-penalty");
    v78.n128_u64[0] = 0;
    AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v100, 0, 0, 0.0, v78, v63, v88 * 35.0, 0.0);
    unint64_t v79 = csvData[1];
    if (v79 >= csvData[2])
    {
      uint64_t v80 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
    }
    else
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
      uint64_t v80 = v79 + 72;
      csvData[1] = v79 + 72;
    }
    csvData[1] = v80;
    if (v103 < 0) {
      operator delete(__p[0]);
    }
    if (v101 < 0) {
      operator delete(v100[0]);
    }
  }
  double v81 = v88;
LABEL_86:
  v82 = [NSNumber numberWithDouble:v81];
  v83 = [(AlgosScoreDataCSV *)self statsDict];
  [v83 setObject:v82 forKeyedSubscript:@"audio-erasure"];

  return 0;
}

- (NSDictionary)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
}

- (void).cxx_destruct
{
}

@end