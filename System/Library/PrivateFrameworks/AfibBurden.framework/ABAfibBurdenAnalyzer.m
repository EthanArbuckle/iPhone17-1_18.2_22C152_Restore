@interface ABAfibBurdenAnalyzer
+ (void)removeDiagnosticLogFiles;
- (ABAfibBurdenAnalyzer)init;
- (id).cxx_construct;
- (id)determineBurdenForTachogramClassificationBuckets:(id)a3;
- (id)processResults:(void *)a3 withAlgsAnalytics:(core_analytics_t *)a4;
- (unsigned)segmentsCount;
- (unsigned)segmentsWith5TachCount;
- (void)logToFileForTachoList:(id)a3 withBurdenResults:(id)a4;
- (void)setSegmentsCount:(unsigned __int8)a3;
- (void)setSegmentsWith5TachCount:(unsigned __int8)a3;
@end

@implementation ABAfibBurdenAnalyzer

- (ABAfibBurdenAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)ABAfibBurdenAnalyzer;
  v2 = [(ABAfibBurdenAnalyzer *)&v7 init];
  if (v2)
  {
    int out_token = -1;
    uint64_t v5 = 0;
    notify_register_check("com.apple.AfibBurden.ForceAnalysis.WriteToJson", &out_token);
    notify_get_state(out_token, &v5);
    if (!v5) {
      +[ABAfibBurdenAnalyzer removeDiagnosticLogFiles];
    }
    v3 = v2;
  }

  return v2;
}

- (id)processResults:(void *)a3 withAlgsAnalytics:(core_analytics_t *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  LOBYTE(v32) = 0;
  BOOL v33 = 0;
  LOBYTE(v30) = 0;
  char v31 = 0;
  *(void *)buf = &v32;
  v38 = &v30;
  uint64_t v4 = *((unsigned int *)a3 + 1);
  if (v4 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  v34 = buf;
  ((void (*)(uint8_t **, void *))off_26FBC2508[v4])(&v34, a3);
  objc_super v7 = objc_opt_new();
  v8 = v7;
  if (!v7) {
    goto LABEL_35;
  }
  if (!v33)
  {
    if (v31)
    {
      [v7 setBurdenPercentage:0];
      if (!v31) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      uint64_t v12 = v30;
      goto LABEL_14;
    }
    v24 = ab_get_framework_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:](v24);
    }

LABEL_35:
    id v23 = 0;
    goto LABEL_36;
  }
  float v9 = v32;
  double v10 = v32 / 100.0;
  if (v10 >= 0.0199999996)
  {
    if (modff(v32, (float *)buf) <= 0.5) {
      *(float *)&double v13 = floorf(v9) / 100.0;
    }
    else {
      *(float *)&double v13 = ceilf(v9) / 100.0;
    }
    v14 = [NSNumber numberWithFloat:v13];
    [v8 setBurdenPercentage:v14];
  }
  else
  {
    LODWORD(v10) = 1017370378;
    v11 = [NSNumber numberWithFloat:v10];
    [v8 setBurdenPercentage:v11];
  }
  uint64_t v12 = 0;
LABEL_14:
  [v8 setUnavailabilityReason:v12];
  self->_rawBurdenValue.var0.__val_.Afib_burden = v32;
  self->_rawBurdenValue.__engaged_ = v33;
  v35[0] = @"reasonNoReport";
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "unavailabilityReason"));
  v36[0] = v28;
  v35[1] = @"segmentsCount";
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsCount](self, "segmentsCount"));
  v36[1] = v27;
  v35[2] = @"segmentsWith5TachCount";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsWith5TachCount](self, "segmentsWith5TachCount"));
  v36[2] = v26;
  v35[3] = @"AFBurden";
  if (v33)
  {
    *(float *)&double v15 = v32;
    [NSNumber numberWithFloat:v15];
  }
  else
  {
    [MEMORY[0x263EFF9D0] null];
  v29 = };
  v36[3] = v29;
  v35[4] = @"AFDensity";
  if ((LODWORD(a4->var1) & 0x7FFFFFFFu) > 0x7F7FFFFF) {
    [MEMORY[0x263EFF9D0] null];
  }
  else {
  v16 = objc_msgSend(NSNumber, "numberWithFloat:");
  }
  v36[4] = v16;
  v35[5] = @"timeBetweenTachs";
  if ((LODWORD(a4->var0) & 0x7FFFFFFFu) > 0x7F7FFFFF) {
    [MEMORY[0x263EFF9D0] null];
  }
  else {
  v17 = objc_msgSend(NSNumber, "numberWithFloat:");
  }
  v36[5] = v17;
  v35[6] = @"countTimezoneShifts";
  if ((*(void *)&a4->var2 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF9D0] null];
  }
  else {
  v18 = objc_msgSend(NSNumber, "numberWithDouble:");
  }
  v36[6] = v18;
  v35[7] = @"highestTimezoneShift";
  if ((*(void *)&a4->var3 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
    [MEMORY[0x263EFF9D0] null];
  }
  else {
  v19 = [NSNumber numberWithDouble:a4->var3 / 3600.0];
  }
  v36[7] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:8];
  [v8 setMetricsForCoreAnalytics:v20];

  v21 = ab_get_framework_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = [v8 metricsForCoreAnalytics];
    -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:](v22, buf, v21);
  }

  id v23 = v8;
LABEL_36:

  return v23;
}

- (id)determineBurdenForTachogramClassificationBuckets:(id)a3
{
  v80[8] = *MEMORY[0x263EF8340];
  id v48 = a3;
  v55 = self;
  if ([v48 count])
  {
    long long v77 = 0u;
    long long v78 = 0u;
    *(_OWORD *)v76 = 0u;
    -[ABAfibBurdenAnalyzer setSegmentsCount:](self, "setSegmentsCount:", [v48 count]);
    [(ABAfibBurdenAnalyzer *)self setSegmentsWith5TachCount:0];
    uint64_t v4 = ab_get_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2477CF000, v4, OS_LOG_TYPE_DEFAULT, "bucketIndex, timestamp, UUID :", buf, 2u);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v48;
    uint64_t v5 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v5)
    {
      unsigned __int16 v53 = 0;
      uint64_t v51 = *(void *)v66;
      v47 = v64;
      while (2)
      {
        uint64_t v54 = 0;
        uint64_t v50 = v5;
        do
        {
          if (*(void *)v66 != v51) {
            objc_enumerationMutation(obj);
          }
          v6 = *(void **)(*((void *)&v65 + 1) + 8 * v54);
          if (!objc_msgSend(v6, "count", v47))
          {
            v45 = ab_get_framework_log();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
              -[ABAfibBurdenAnalyzer determineBurdenForTachogramClassificationBuckets:](v45);
            }

            v36 = 0;
            goto LABEL_64;
          }
          if ((unint64_t)[v6 count] >= 5) {
            [(ABAfibBurdenAnalyzer *)self setSegmentsWith5TachCount:([(ABAfibBurdenAnalyzer *)self segmentsWith5TachCount] + 1)];
          }
          v52 = [v6 sortedArrayUsingComparator:&__block_literal_global_0];
          if (([v52 isEqualToArray:v6] & 1) == 0)
          {
            objc_super v7 = ab_get_framework_log();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
              [(ABAfibBurdenAnalyzer *)&v63 determineBurdenForTachogramClassificationBuckets:v7];
            }
          }
          *(_OWORD *)__p = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          *(_OWORD *)buf = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v8 = v52;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v74 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v57 != v10) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v12 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                double v13 = ab_get_framework_log();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                {
                  v14 = [v12 date];
                  [v14 timeIntervalSince1970];
                  uint64_t v16 = v15;
                  v17 = [v12 uuid];
                  *(_DWORD *)v69 = 67109634;
                  *(_DWORD *)&v69[4] = v53;
                  __int16 v70 = 2048;
                  uint64_t v71 = v16;
                  __int16 v72 = 2112;
                  v73 = v17;
                  _os_log_impl(&dword_2477CF000, v13, OS_LOG_TYPE_DEFAULT, "%d, %f, %@", v69, 0x1Cu);

                  self = v55;
                }

                v69[0] = [v12 aFibDetected];
                std::vector<BOOL>::push_back((uint64_t)&__p[1], v69);
                v18 = [v12 date];
                [v18 timeIntervalSince1970];
                uint64_t v20 = v19;
                v21 = *(char **)&buf[8];
                if ((void *)*(void *)&buf[8] >= __p[0])
                {
                  id v23 = *(char **)buf;
                  uint64_t v24 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3;
                  unint64_t v25 = v24 + 1;
                  if ((unint64_t)(v24 + 1) >> 61) {
                    std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v26 = (uint64_t)__p[0] - *(void *)buf;
                  if (((uint64_t)__p[0] - *(void *)buf) >> 2 > v25) {
                    unint64_t v25 = v26 >> 2;
                  }
                  if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v27 = v25;
                  }
                  if (v27)
                  {
                    v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)__p, v27);
                    id v23 = *(char **)buf;
                    v21 = *(char **)&buf[8];
                  }
                  else
                  {
                    v28 = 0;
                  }
                  v29 = &v28[8 * v24];
                  *(void *)v29 = v20;
                  v22 = v29 + 8;
                  while (v21 != v23)
                  {
                    uint64_t v30 = *((void *)v21 - 1);
                    v21 -= 8;
                    *((void *)v29 - 1) = v30;
                    v29 -= 8;
                  }
                  *(void *)buf = v29;
                  *(void *)&uint8_t buf[8] = v22;
                  __p[0] = &v28[8 * v27];
                  if (v23) {
                    operator delete(v23);
                  }
                }
                else
                {
                  **(void **)&uint8_t buf[8] = v19;
                  v22 = v21 + 8;
                }
                *(void *)&uint8_t buf[8] = v22;
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v74 count:16];
            }
            while (v9);
          }

          long long v31 = v78;
          if ((unint64_t)v78 >= *((void *)&v78 + 1))
          {
            uint64_t v32 = std::vector<std::vector<BOOL>>::__push_back_slow_path<std::vector<BOOL> const&>((uint64_t *)&v77 + 1, (uint64_t)&__p[1]);
          }
          else
          {
            std::vector<BOOL>::vector((void *)v78, (uint64_t)&__p[1]);
            uint64_t v32 = v31 + 24;
          }
          *(void *)&long long v78 = v32;
          BOOL v33 = *(void **)&v76[8];
          if (*(void *)&v76[8] >= (unint64_t)v77)
          {
            uint64_t v34 = std::vector<std::vector<double>>::__push_back_slow_path<std::vector<double> const&>((uint64_t *)v76, (uint64_t)buf);
          }
          else
          {
            **(void **)&v76[8] = 0;
            v33[1] = 0;
            v33[2] = 0;
            std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(v33, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
            uint64_t v34 = (uint64_t)(v33 + 3);
          }
          *(void *)&v76[8] = v34;
          if (__p[1]) {
            operator delete(__p[1]);
          }
          if (*(void *)buf)
          {
            *(void *)&uint8_t buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }

          ++v53;
          ++v54;
        }
        while (v54 != v50);
        uint64_t v5 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    memset(buf, 0, sizeof(buf));
    __p[0] = 0;
    *(void *)v69 = beryllium::process((beryllium *)v76, (core_analytics_t *)buf, v35);
    v36 = [(ABAfibBurdenAnalyzer *)self processResults:v69 withAlgsAnalytics:buf];
    [(ABAfibBurdenAnalyzer *)self logToFileForTachoList:obj withBurdenResults:v36];
LABEL_64:
    *(void *)buf = (char *)&v77 + 8;
    std::vector<std::vector<BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    *(void *)buf = v76;
    std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    v37 = ab_get_framework_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v76 = 0;
      _os_log_impl(&dword_2477CF000, v37, OS_LOG_TYPE_DEFAULT, "Empty list of classification buckets received", v76, 2u);
    }

    v36 = objc_opt_new();
    [v36 setBurdenPercentage:0];
    [v36 setUnavailabilityReason:1];
    if (self->_rawBurdenValue.__engaged_) {
      self->_rawBurdenValue.__engaged_ = 0;
    }
    [(ABAfibBurdenAnalyzer *)self logToFileForTachoList:v48 withBurdenResults:v36];
    v79[0] = @"reasonNoReport";
    v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v36, "unavailabilityReason"));
    v80[0] = v38;
    v79[1] = @"segmentsCount";
    uint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsCount](self, "segmentsCount"));
    v80[1] = v39;
    v79[2] = @"segmentsWith5TachCount";
    v40 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[ABAfibBurdenAnalyzer segmentsWith5TachCount](self, "segmentsWith5TachCount"));
    v80[2] = v40;
    v79[3] = @"AFBurden";
    v41 = [MEMORY[0x263EFF9D0] null];
    v80[3] = v41;
    v80[4] = &unk_26FBC33D0;
    v79[4] = @"AFDensity";
    v79[5] = @"timeBetweenTachs";
    v80[5] = &unk_26FBC33D0;
    v80[6] = &unk_26FBC33D0;
    v79[6] = @"countTimezoneShifts";
    v79[7] = @"highestTimezoneShift";
    v80[7] = &unk_26FBC33D0;
    v42 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:8];
    [v36 setMetricsForCoreAnalytics:v42];

    v43 = ab_get_framework_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      v44 = [v36 metricsForCoreAnalytics];
      -[ABAfibBurdenAnalyzer processResults:withAlgsAnalytics:](v44, v76, v43);
    }
  }
  return v36;
}

uint64_t __73__ABAfibBurdenAnalyzer_determineBurdenForTachogramClassificationBuckets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 date];
  v6 = [v4 date];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

- (void)logToFileForTachoList:(id)a3 withBurdenResults:(id)a4
{
  v64[1] = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v30 = a4;
  int out_token = -1;
  uint64_t state64 = 0;
  notify_register_check("com.apple.AfibBurden.ForceAnalysis.WriteToJson", &out_token);
  notify_get_state(out_token, &state64);
  if (state64)
  {
    uint64_t v5 = ab_get_framework_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = state64;
      _os_log_impl(&dword_2477CF000, v5, OS_LOG_TYPE_DEFAULT, "ABAfibBurdenAnalyzer : logging to file. notifyState is set to %llu", (uint8_t *)buf, 0xCu);
    }

    v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v63 = *MEMORY[0x263F080A8];
    v64[0] = *MEMORY[0x263F08088];
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
    id v56 = 0;
    char v8 = [v6 createDirectoryAtPath:@"/var/mobile/Library/Logs/AfBHIDDiagnostics/" withIntermediateDirectories:1 attributes:v7 error:&v56];
    id v28 = v56;

    if (v8)
    {
      std::to_string(&v37, state64);
      uint64_t v9 = std::string::insert(&v37, 0, "process_burden_");
      long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
      buf[0].__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
      *(_OWORD *)&buf[0].__r_.__value_.__l.__data_ = v10;
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      v11 = std::string::append(buf, ".json");
      long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
      std::string::size_type v55 = v11->__r_.__value_.__r.__words[2];
      long long v54 = v12;
      v11->__r_.__value_.__l.__size_ = 0;
      v11->__r_.__value_.__r.__words[2] = 0;
      v11->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf[0].__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v37.__r_.__value_.__l.__data_);
      }
      objc_msgSend(@"/var/mobile/Library/Logs/AfBHIDDiagnostics/", "UTF8String", self);
      std::operator+<char>();
      std::ofstream::basic_ofstream((uint64_t *)buf);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v51, 0, 0, 0, 1);
      int v50 = 0;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)v48, 0, 0, 0, 2);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id obj = v29;
      uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
      if (v13)
      {
        uint64_t v32 = *(void *)v45;
        do
        {
          uint64_t v33 = v13;
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v45 != v32) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v35 = v14;
            uint64_t v7 = (void *)[v35 countByEnumeratingWithState:&v40 objects:v59 count:16];
            if (v7)
            {
              uint64_t v15 = *(void *)v41;
              do
              {
                for (j = 0; j != v7; j = (char *)j + 1)
                {
                  if (*(void *)v41 != v15) {
                    objc_enumerationMutation(v35);
                  }
                  v17 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::basic_json((uint64_t)&v38, 0, 0, 0, 1);
                  v18 = objc_msgSend(v17, "date", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[12],int &>((uint64_t)&v38, "bucketIndex", &v50, (uint64_t)&v37));
                  [v18 timeIntervalSince1970];
                  v36 = v19;
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[10],double>((uint64_t)&v38, "timestamp", (uint64_t *)&v36, (uint64_t)&v37);

                  uint64_t v20 = [v17 uuid];
                  id v21 = [v20 UUIDString];
                  v36 = (char *)[v21 UTF8String];
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[5],char const*>((uint64_t)&v38, "uuid", &v36, (uint64_t)&v37);

                  LOBYTE(v36) = [v17 aFibDetected];
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[13],BOOL>((uint64_t)&v38, "afibDetected", (unsigned __int8 *)&v36, (uint64_t)&v37);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace_back<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v48, (uint64_t)&v38);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)&v38);
                  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v39, v38);
                }
                uint64_t v7 = (void *)[v35 countByEnumeratingWithState:&v40 objects:v59 count:16];
              }
              while (v7);
            }

            ++v50;
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v44 objects:v60 count:16];
        }
        while (v13);
      }

      v22 = objc_msgSend(v30, "burdenPercentage", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>((uint64_t)v51, "classifiedTachoList", (uint64_t)v48, (uint64_t)&v37));
      if (v22)
      {
        uint64_t v7 = [v30 burdenPercentage];
        [v7 floatValue];
      }
      else
      {
        float v23 = -1.0;
      }
      *(float *)&uint64_t v38 = v23;
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[20],float>((uint64_t)v51, "burdenReportedValue", (float *)&v38, (uint64_t)&v37);
      if (v22) {

      }
      LODWORD(v36) = -1082130432;
      if (*(unsigned char *)(v27 + 12) && (*(_DWORD *)(v27 + 8) & 0x7FFFFFFFu) <= 0x7F7FFFFF) {
        LODWORD(v36) = *(_DWORD *)(v27 + 8);
      }
      uint64_t v38 = objc_msgSend(v30, "unavailabilityReason", nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[15],float &>((uint64_t)v51, "burdenRawValue", (float *)&v36, (uint64_t)&v37));
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::emplace<char const(&)[21],ABUnavailabilityReason>((uint64_t)v51, "unavailabilityReason", &v38, (uint64_t)&v37);
      nlohmann::operator<<((uint64_t *)buf, (uint64_t)v51);
      v37.__r_.__value_.__s.__data_[0] = 10;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)&v37, 1);
      notify_cancel(out_token);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v48);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v49, v48[0]);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::assert_invariant((uint64_t)v51);
      nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(v52, v51[0]);
      buf[0].__r_.__value_.__r.__words[0] = *MEMORY[0x263F8C2B0];
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words
                                + *(void *)(buf[0].__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x263F8C2B0] + 24);
      MEMORY[0x24C55DC00](&buf[0].__r_.__value_.__r.__words[1]);
      std::ostream::~ostream();
      MEMORY[0x24C55DCC0](&v62);
      if (v53 < 0) {
        operator delete(v52[1]);
      }
      unint64_t v25 = v28;
      if (SHIBYTE(v55) < 0) {
        operator delete((void *)v54);
      }
    }
    else
    {
      uint64_t v24 = ab_get_framework_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[ABTachogramClassifier logToFileForTacho:withClassification:]((uint64_t)v28, v24);
      }

      unint64_t v25 = v28;
      notify_cancel(out_token);
    }
  }
  else
  {
    notify_cancel(out_token);
  }
}

+ (void)removeDiagnosticLogFiles
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  v3 = @"/var/mobile/Library/Logs/AfBHIDDiagnostics/";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2477CF000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve files at path : %@ with error : %@", (uint8_t *)&v2, 0x16u);
}

- (unsigned)segmentsCount
{
  return self->_segmentsCount;
}

- (void)setSegmentsCount:(unsigned __int8)a3
{
  self->_segmentsCount = a3;
}

- (unsigned)segmentsWith5TachCount
{
  return self->_segmentsWith5TachCount;
}

- (void)setSegmentsWith5TachCount:(unsigned __int8)a3
{
  self->_segmentsWith5TachCount = a3;
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 12) = 0;
  return self;
}

- (void)processResults:(os_log_t)log withAlgsAnalytics:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2477CF000, log, OS_LOG_TYPE_ERROR, "No valid reason or value to report", v1, 2u);
}

- (void)processResults:(os_log_t)log withAlgsAnalytics:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_2477CF000, log, OS_LOG_TYPE_DEBUG, "CA Metrics : %@", buf, 0xCu);
}

- (void)determineBurdenForTachogramClassificationBuckets:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2477CF000, log, OS_LOG_TYPE_FAULT, "empty classification bucket received", v1, 2u);
}

- (void)determineBurdenForTachogramClassificationBuckets:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_2477CF000, log, OS_LOG_TYPE_FAULT, "input tachogram classification bucket is not in ascending order", buf, 2u);
}

@end