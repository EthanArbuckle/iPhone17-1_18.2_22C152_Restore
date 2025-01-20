@interface AlgosScoreStreamDataCSV
+ (id)streamDataCSV:(BOOL)a3;
- (BOOL)isMusic;
- (BOOL)matchesMethod:(id)a3 code:(int64_t)a4;
- (BOOL)validMethod:(int64_t)a3;
- (NSDictionary)methods;
- (id)initIsMusic:(BOOL)a3;
- (id)setUpMethods;
- (int)transformer;
- (void)setIsMusic:(BOOL)a3;
- (void)setMethods:(id)a3;
@end

@implementation AlgosScoreStreamDataCSV

+ (id)streamDataCSV:(BOOL)a3
{
  id v3 = [[AlgosScoreStreamDataCSV alloc] initIsMusic:a3];
  return v3;
}

- (id)setUpMethods
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C6384E8, 0);
  [v2 setObject:v3 forKeyedSubscript:@"PlayEnded"];

  v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C638500, &unk_26C638518, 0);
  [v2 setObject:v4 forKeyedSubscript:@"PlayRateChanged"];

  v5 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C638530, &unk_26C638548, 0);
  [v2 setObject:v5 forKeyedSubscript:@"PlayStalled"];

  v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C638560, &unk_26C638578, 0);
  [v2 setObject:v6 forKeyedSubscript:@"PlayLikelyToKeepUp"];

  v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C638590, &unk_26C6385A8, 0);
  [v2 setObject:v7 forKeyedSubscript:@"PlayerError"];

  v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C6385C0, &unk_26C6385D8, 0);
  [v2 setObject:v8 forKeyedSubscript:@"PlayerSwitchComplete"];

  return v2;
}

- (BOOL)matchesMethod:(id)a3 code:(int64_t)a4
{
  id v6 = a3;
  v7 = [(AlgosScoreStreamDataCSV *)self methods];
  v8 = [v7 objectForKey:v6];

  v9 = [NSNumber numberWithLongLong:a4];
  LOBYTE(a4) = [v8 containsObject:v9];

  return a4;
}

- (BOOL)validMethod:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = [(AlgosScoreStreamDataCSV *)self methods];
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
        v11 = objc_msgSend(NSNumber, "numberWithInteger:", a3, (void)v14);
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

- (id)initIsMusic:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AlgosScoreStreamDataCSV;
  v4 = [(AlgosScoreDataCSV *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(AlgosScoreStreamDataCSV *)v4 setIsMusic:v3];
    id v6 = [(AlgosScoreStreamDataCSV *)v5 setUpMethods];
    [(AlgosScoreStreamDataCSV *)v5 setMethods:v6];
  }
  return v5;
}

- (int)transformer
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  [(AlgosScoreDataCSV *)self clearStreamingData];
  v78 = self;
  BOOL v3 = [(AlgosScoreDataCSV *)self rawStreamData];
  csvData = (uint64_t *)v78->super.csvData;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = [v3 rows];
  uint64_t v75 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (!v75)
  {

    int v65 = 0;
    BOOL v17 = 0;
    uint64_t v19 = 0;
    double v31 = 1.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v25 = 0.0;
    double v24 = 0.0;
    double v26 = 1.0;
    goto LABEL_112;
  }
  char v68 = 0;
  int v65 = 0;
  int v76 = 0;
  char v77 = 0;
  uint64_t v74 = *(void *)v84;
  int v70 = -1;
  uint64_t v71 = -1;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v73 = 0.0;
  double v67 = 0.0;
  uint64_t v72 = -1;
  uint64_t v69 = -1;
  do
  {
    uint64_t v8 = 0;
    double v9 = v5;
    do
    {
      if (*(void *)v84 != v74) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v83 + 1) + 8 * v8);
      v11 = [v3 atRow:v10 col:@"timedelta_ms"];
      [v11 doubleValue];
      double v5 = v12;

      [v3 doubleAtRow:v10 col:@"VaRk" defaultValue:v7 * 100.0];
      double v14 = v13;
      long long v15 = [v3 atRow:v10 col:@"IfTy"];
      int v16 = [v15 intValue];
      BOOL v17 = v16 == 3;

      uint64_t v18 = [v3 intAtRow:v10 col:@"method" defaultValue:-1];
      uint64_t v19 = [(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayerError" code:v18];
      int v20 = v76 + v8;
      if (v76 + v8)
      {
        v21 = @"None";
      }
      else
      {
        double v6 = v5;
        v21 = @"start";
      }
      [v3 doubleAtRow:v10 col:@"StartupTime" defaultValue:0.0];
      if (v22 == 0.0 && v20 == 0) {
        double v24 = 0.0;
      }
      else {
        double v24 = v22;
      }
      double v25 = v5 - v9;
      double v26 = v14 / 100.0;
      if (![(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayEnded" code:v18])
      {
        if ([(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayerError" code:v18])
        {
          if ([(AlgosScoreStreamDataCSV *)v78 isMusic]) {
            double v31 = 0.3;
          }
          else {
            double v31 = 1.0;
          }
          double v32 = v7;
          v21 = @"error";
          goto LABEL_55;
        }
        if ([(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayRateChanged" code:v18])
        {
          uint64_t v33 = [v3 intAtRow:v10 col:@"Rate" defaultValue:-1];
          double v24 = v5 - v6;
          if ((v77 & 1) == 0 && !v33)
          {
            uint64_t v72 = [v3 intAtRow:v10 col:@"IABR" defaultValue:v72];
            uint64_t v71 = [v3 intAtRow:v10 col:@"VaRk" defaultValue:v71];
            double v31 = 1.0;
LABEL_87:
            double v6 = v5;
            double v32 = v26;
            v21 = @"rate";
            double v26 = v7;
            goto LABEL_55;
          }
          if ((v77 & (v33 == 100)) != 1)
          {
            double v31 = 1.0;
            if ((v77 & (v33 == 0)) == 1)
            {
              uint64_t v72 = [v3 intAtRow:v10 col:@"IABR" defaultValue:v72];
              uint64_t v71 = [v3 intAtRow:v10 col:@"VaRk" defaultValue:v71];
              char v77 = 1;
            }
            goto LABEL_87;
          }
          double v24 = v5 - v73;
          double v31 = 1.0;
          if (v5 - v73 >= 0.5)
          {
            char v77 = 0;
          }
          else
          {
            printf("Unexpected stallduration cannot be less than %1.2f start: %1.2f, stop: %1.2f\n", 0.5, v73, v5);
            char v77 = 0;
            ++v65;
          }
          double v6 = v5;
          double v32 = v26;
          v21 = @"stall-end-1";
          double v26 = v7;
LABEL_99:
          double v67 = v5;
          goto LABEL_55;
        }
        if ([(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayLikelyToKeepUp" code:v18])
        {
          int v34 = [v3 intAtRow:v10 col:@"SwCnt" defaultValue:v70];
          uint64_t v69 = [v3 intAtRow:v10 col:@"OBRLast" defaultValue:v69];
          int v70 = v34;
          double v31 = 1.0;
          if (v77)
          {
            if (![(AlgosScoreStreamDataCSV *)v78 isMusic])
            {
              double v24 = v5 - v73;
              if (v5 - v73 < 0.5)
              {
                printf("Unexpected stallduration cannot be less than %1.2f start: %1.2f, stop: %1.2f\n", 0.5, v73, v5);
                ++v65;
              }
              uint64_t v72 = [v3 intAtRow:v10 col:@"IABR" defaultValue:v72];
              uint64_t v71 = [v3 intAtRow:v10 col:@"VaRk" defaultValue:v71];
              char v68 = 0;
              char v77 = 0;
              double v32 = v7;
              v21 = @"stall-end-2";
              goto LABEL_99;
            }
            char v68 = 0;
            char v77 = 1;
          }
          else
          {
            char v68 = 0;
            char v77 = 0;
          }
LABEL_95:
          double v32 = v7;
          goto LABEL_55;
        }
        if ([(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayStalled" code:v18])
        {
          if ((v77 & 1) == 0) {
            v21 = @"stall";
          }
          double v47 = v73;
          if ((v77 & 1) == 0) {
            double v47 = v5;
          }
          double v73 = v47;
          char v77 = 1;
        }
        else
        {
          if ([(AlgosScoreStreamDataCSV *)v78 matchesMethod:@"PlayerSwitchComplete" code:v18])
          {
            int v48 = [v3 intAtRow:v10 col:@"SwCnt" defaultValue:v70];
            uint64_t v69 = [v3 intAtRow:v10 col:@"OBRLast" defaultValue:v69];
            double v31 = 1.0;
            int v70 = v48;
            goto LABEL_95;
          }
          printf("Unused method %lld. Unexpected\n", v18);
        }
        double v31 = 1.0;
        goto LABEL_95;
      }
      uint64_t v27 = [v3 intAtRow:v10 col:@"TimeWorkingToLTKU" defaultValue:0];
      if (v27 >= 500)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "stall-end-4-startup");
        v28.n128_f64[0] = (double)v27;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v5 - v9, v28, v5, 0.5, v26);
        unint64_t v29 = csvData[1];
        if (v29 >= csvData[2])
        {
          uint64_t v30 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          uint64_t v30 = v29 + 72;
          csvData[1] = v29 + 72;
        }
        csvData[1] = v30;
        if (v82 < 0) {
          operator delete(__p[0]);
        }
        if (v80 < 0) {
          operator delete(v79[0]);
        }
      }
      if (v77)
      {
        if (v5 - v73 < 0.0)
        {
          printf("Unexpected stallduration cannot be less than zero start: %1.2f, stop: %1.2f\n", v73, v5);
          ++v65;
        }
        std::string::basic_string[abi:ne180100]<0>(v79, "stall-end-3");
        v35.n128_f64[0] = v5 - v73;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v5 - v9, v35, v5, 1.0, v26);
        unint64_t v36 = csvData[1];
        if (v36 >= csvData[2])
        {
          uint64_t v37 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          uint64_t v37 = v36 + 72;
          csvData[1] = v36 + 72;
        }
        csvData[1] = v37;
        if (v82 < 0) {
          operator delete(__p[0]);
        }
        if (v80 < 0) {
          operator delete(v79[0]);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(v79, "rate");
      v38.n128_f64[0] = v5 - v6;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v5 - v9, v38, v5, 1.0, v26);
      unint64_t v39 = csvData[1];
      if (v39 >= csvData[2])
      {
        uint64_t v40 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        uint64_t v40 = v39 + 72;
        csvData[1] = v39 + 72;
      }
      csvData[1] = v40;
      if (v82 < 0) {
        operator delete(__p[0]);
      }
      if (v80 < 0) {
        operator delete(v79[0]);
      }
      char v77 = 0;
      double v73 = 0.0;
      double v31 = 1.0;
      int v70 = -1;
      uint64_t v71 = -1;
      char v68 = 1;
      uint64_t v72 = -1;
      uint64_t v69 = -1;
      double v32 = v7;
      double v67 = 0.0;
      v21 = @"end";
LABEL_55:
      if (!v20 && ([(__CFString *)v21 isEqualToString:@"start"] & 1) == 0)
      {
        std::string::basic_string[abi:ne180100]<0>(v79, "start");
        v41.n128_f64[0] = v24;
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v25, v41, v5, v31, v26);
        unint64_t v42 = csvData[1];
        if (v42 >= csvData[2])
        {
          uint64_t v43 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
        }
        else
        {
          AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
          uint64_t v43 = v42 + 72;
          csvData[1] = v42 + 72;
        }
        csvData[1] = v43;
        if (v82 < 0) {
          operator delete(__p[0]);
        }
        if (v80 < 0) {
          operator delete(v79[0]);
        }
      }
      std::string::basic_string[abi:ne180100]<0>(v79, (char *)[(__CFString *)v21 cStringUsingEncoding:4]);
      v44.n128_f64[0] = v24;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v25, v44, v5, v31, v26);
      unint64_t v45 = csvData[1];
      if (v45 >= csvData[2])
      {
        uint64_t v46 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        uint64_t v46 = v45 + 72;
        csvData[1] = v45 + 72;
      }
      csvData[1] = v46;
      if (v82 < 0) {
        operator delete(__p[0]);
      }
      if (v80 < 0) {
        operator delete(v79[0]);
      }
      if ([(__CFString *)v21 isEqualToString:@"rate"]) {
        double v7 = v32;
      }
      else {
        double v7 = v26;
      }
      ++v8;
      double v9 = v5;
    }
    while (v75 != v8);
    uint64_t v49 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
    uint64_t v75 = v49;
    v76 += v8;
  }
  while (v49);

  if (v77)
  {
    std::string::basic_string[abi:ne180100]<0>(v79, (char *)[@"fake-stall-end" cStringUsingEncoding:4]);
    v50.n128_f64[0] = v24;
    AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v16 == 3, v19, v25, v50, v5, 1.0, v26);
    unint64_t v51 = csvData[1];
    if (v51 >= csvData[2])
    {
      uint64_t v52 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
    }
    else
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
      uint64_t v52 = v51 + 72;
      csvData[1] = v51 + 72;
    }
    csvData[1] = v52;
    if (v82 < 0) {
      operator delete(__p[0]);
    }
    if (v80 < 0) {
      operator delete(v79[0]);
    }
    puts("Received no stall end messages");
    if (v67 - v73 < 0.0)
    {
      v62 = (void *)MEMORY[0x263F087E8];
      v63 = [NSString stringWithFormat:@"Unexpected stallduration cannot be less than zero start: %1.2f, stop: %1.2f", *(void *)&v73, *(void *)&v67, 0];
      id v64 = [v62 errorWithDomain:v63 code:-1 userInfo:0];

      objc_exception_throw(v64);
    }
  }
  if ((v68 & 1) == 0)
  {
LABEL_112:
    v53 = [v3 rows];
    BOOL v54 = [v53 count] == 0;

    if (!v54)
    {
      puts("Received no play end messages, inserting fake rate and end");
      std::string::basic_string[abi:ne180100]<0>(v79, "rate");
      v55.n128_f64[0] = v5 - v6;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v17, v19, v25, v55, v5, v31, v26);
      unint64_t v56 = csvData[1];
      if (v56 >= csvData[2])
      {
        uint64_t v57 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        uint64_t v57 = v56 + 72;
        csvData[1] = v56 + 72;
      }
      csvData[1] = v57;
      if (v82 < 0) {
        operator delete(__p[0]);
      }
      if (v80 < 0) {
        operator delete(v79[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(v79, (char *)[@"end" cStringUsingEncoding:4]);
      v58.n128_f64[0] = v24;
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(__p, v79, v17, v19, v25, v58, v5, 1.0, v26);
      unint64_t v59 = csvData[1];
      if (v59 >= csvData[2])
      {
        uint64_t v60 = std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(csvData, (const AlgosScoreStreamCSVFrameRow *)__p);
      }
      else
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)csvData[1], (const AlgosScoreStreamCSVFrameRow *)__p);
        uint64_t v60 = v59 + 72;
        csvData[1] = v59 + 72;
      }
      csvData[1] = v60;
      if (v82 < 0) {
        operator delete(__p[0]);
      }
      if (v80 < 0) {
        operator delete(v79[0]);
      }
    }
  }

  return v65;
}

- (NSDictionary)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
}

- (BOOL)isMusic
{
  return self->_isMusic;
}

- (void)setIsMusic:(BOOL)a3
{
  self->_isMusic = a3;
}

- (void).cxx_destruct
{
}

@end