@interface AlgosScoreDataCSV
- (AlgosScoreCSVReader)rawStreamData;
- (AlgosScoreDataCSV)init;
- (NSMutableDictionary)statsDict;
- (id)readData:(id)a3;
- (id)readData:(id)a3 catchException:(BOOL)a4;
- (id)readDirectoryAndScore:(id)a3 score:(id)a4 options:(id)a5;
- (int)debug;
- (int)transformer;
- (void)clearStreamingData;
- (void)dealloc;
- (void)populateScore:(id)a3;
- (void)setDebug:(int)a3;
- (void)setRawStreamData:(id)a3;
- (void)setStatsDict:(id)a3;
@end

@implementation AlgosScoreDataCSV

- (AlgosScoreDataCSV)init
{
  v5.receiver = self;
  v5.super_class = (Class)AlgosScoreDataCSV;
  v2 = [(AlgosScoreDataCSV *)&v5 init];
  if (!v2) {
    return v2;
  }
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(AlgosScoreDataCSV *)v2 setStatsDict:v3];

  result = (AlgosScoreDataCSV *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->csvData = 0;
    *(void *)&result->_debug = 0;
    v2->csvData = result;
    return v2;
  }
  __break(1u);
  return result;
}

- (void)clearStreamingData
{
}

- (void)populateScore:(id)a3
{
  id v4 = a3;
  [v4 clearStreamRows];
  csvData = (const AlgosScoreStreamCSVFrameRow **)self->csvData;
  v6 = *csvData;
  v7 = csvData[1];
  v26 = csvData;
  if (*csvData != v7)
  {
    while (1)
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)&v28, v6);
      double v8 = v32 / 1000.0;
      double v9 = v31 / 1000.0;
      if ((v30 & 0x80000000) == 0) {
        break;
      }
      uint64_t v11 = v29;
      if (v29 == 4)
      {
        if (*(_DWORD *)v28 == 1702125938) {
          goto LABEL_24;
        }
        uint64_t v11 = v29;
      }
      else if (v29 == 5 && *(_DWORD *)v28 == 1918989427 && *((unsigned char *)v28 + 4) == 116)
      {
        goto LABEL_25;
      }
      if (v11) {
        goto LABEL_30;
      }
      uint64_t v14 = v29;
      if (v29 == 5)
      {
        if (*(_DWORD *)v28 == 1869771365 && *((unsigned char *)v28 + 4) == 114)
        {
          [v4 addStreamFailure:v8 weight:v33];
          goto LABEL_52;
        }
        uint64_t v14 = v29;
      }
      if (v14 == 13)
      {
        if (*(void *)v28 == 0x65702D6465786966 && *(void *)((char *)v28 + 5) == 0x79746C616E65702DLL)
        {
          [v4 addStreamPenalty:v8 amount:v33];
          goto LABEL_52;
        }
        uint64_t v14 = v29;
      }
      if (v14 == 3 && *(_WORD *)v28 == 28261 && *((unsigned char *)v28 + 2) == 100) {
        [v4 addStreamEnd:v8];
      }
LABEL_52:
      char v18 = v30;
      if (v35)
      {
        if (v30 < 0)
        {
          if (v29 == 5)
          {
            v19 = (unsigned __int8 *)v28;
            goto LABEL_58;
          }
        }
        else if (v30 == 5)
        {
          v19 = (unsigned __int8 *)&v28;
LABEL_58:
          int v20 = *(_DWORD *)v19;
          int v21 = v19[4];
          if (v20 == 1869771365 && v21 == 114) {
            goto LABEL_63;
          }
        }
        [v4 addStreamFailure:v8 weight:v33];
        char v18 = v30;
      }
LABEL_63:
      if (v18 < 0) {
        operator delete(v28);
      }
      v6 = (const AlgosScoreStreamCSVFrameRow *)((char *)v6 + 72);
      if (v6 == v7) {
        goto LABEL_66;
      }
    }
    if (!v30) {
      goto LABEL_52;
    }
    if (v30 == 4)
    {
      if (v28 != 1702125938) {
        goto LABEL_30;
      }
LABEL_24:
      [v4 addStreamTierSwitch:v8 - v9 end:v32 / 1000.0 quality:v34 weight:v33];
      goto LABEL_52;
    }
    if (v30 != 5 || (v28 == 1918989427 ? (BOOL v10 = BYTE4(v28) == 116) : (BOOL v10 = 0), !v10)) {
LABEL_30:
    }
      std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](v27, "stall-end-[0-9]+.*", 0);
LABEL_25:
    [v4 addStreamStart:0.0 play:v32 / 1000.0];
    if (v8 > 0.5)
    {
      if (v9 == 0.0) {
        double v13 = v8;
      }
      else {
        double v13 = v9;
      }
      [v4 addStreamStall:0.0 end:v13 quality:v34 weight:0.1];
    }
    goto LABEL_52;
  }
LABEL_66:
  if ([(AlgosScoreDataCSV *)self debug] >= 2)
  {
    v23 = *v26;
    v24 = v26[1];
    if (*v26 != v24)
    {
      do
      {
        AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)&__p, v23);
        AlgosScoreStreamCSVFrameRow::GetDescription((AlgosScoreStreamCSVFrameRow *)&__p, &v28);
        if (v30 >= 0) {
          v25 = (const char *)&v28;
        }
        else {
          v25 = (const char *)v28;
        }
        puts(v25);
        if (v30 < 0) {
          operator delete(v28);
        }
        if (v37 < 0) {
          operator delete(__p);
        }
        v23 = (const AlgosScoreStreamCSVFrameRow *)((char *)v23 + 72);
      }
      while (v23 != v24);
    }
  }
}

- (int)transformer
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"Unimplemented Transformer" code:-1 userInfo:0];
  objc_exception_throw(v2);
}

- (id)readData:(id)a3 catchException:(BOOL)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(AlgosScoreDataCSV *)self setRawStreamData:0];
  v6 = +[AlgosScoreCSVReader csvReader:v5 header:1];
  if ([(AlgosScoreDataCSV *)self debug]) {
    printf("--> Read %s\n", (const char *)[v5 cStringUsingEncoding:4]);
  }
  if ([(AlgosScoreDataCSV *)self debug] >= 2) {
    [v6 debugPrint:10];
  }
  v7 = [v6 error];

  if (v7)
  {
    double v8 = (FILE *)*MEMORY[0x263EF8348];
    double v9 = [v6 error];
    id v10 = [v9 description];
    fprintf(v8, "ReadData: %s\n", (const char *)[v10 cStringUsingEncoding:4]);

    uint64_t v11 = (void *)MEMORY[0x263EFF940];
    v12 = [v6 error];
    double v13 = [v12 description];
    char v18 = @"error";
    uint64_t v14 = [v6 error];
    v19[0] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v16 = [v11 exceptionWithName:@"ReaderError" reason:v13 userInfo:v15];
  }
  else
  {
    [(AlgosScoreDataCSV *)self setRawStreamData:v6];
    [(AlgosScoreDataCSV *)self transformer];

    if ([(AlgosScoreDataCSV *)self debug]) {
      AlgosScoreStreamCSVFrame::DebugPrint((AlgosScoreStreamCSVFrame *)self->csvData, 30);
    }
    v16 = 0;
  }

  return v16;
}

- (id)readData:(id)a3
{
  v3 = [(AlgosScoreDataCSV *)self readData:a3 catchException:0];
  return v3;
}

- (id)readDirectoryAndScore:(id)a3 score:(id)a4 options:(id)a5
{
  v67[1] = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v8 = a4;
  id v44 = a5;
  id v50 = [MEMORY[0x263EFF980] array];
  v51 = [MEMORY[0x263EFF980] array];
  v42 = [MEMORY[0x263F08850] defaultManager];
  double v9 = [v44 objectForKey:@"continue_on_error"];
  char v46 = [v9 BOOLValue];

  v49 = [v44 objectForKey:@"tracePath"];
  id v43 = v41;
  if (stat((const char *)[v43 cStringUsingEncoding:4], &v62))
  {
    v66 = @"error";
    v67[0] = [NSNumber numberWithInt:*__error()];
    obuint64_t j = (id)v67[0];
    id v10 = [NSDictionary dictionaryWithObjects:v67 forKeys:&v66 count:1];
    [v50 addObject:v10];
LABEL_38:

    goto LABEL_39;
  }
  int v11 = v62.st_mode & 0xF000;
  if (v11 == 0x4000)
  {
    double v13 = [NSURL fileURLWithPath:v43];
    uint64_t v65 = *MEMORY[0x263EFF6A8];
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v65 count:1];
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __57__AlgosScoreDataCSV_readDirectoryAndScore_score_options___block_invoke;
    v60[3] = &__block_descriptor_33_e27_B24__0__NSURL_8__NSError_16l;
    char v61 = v46;
    v15 = [v42 enumeratorAtURL:v13 includingPropertiesForKeys:v14 options:0 errorHandler:v60];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v12 = v15;
    uint64_t v16 = [v12 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          int v20 = [v19 pathExtension];
          if ([v20 isEqualToString:@"csv"])
          {
            int v21 = [v19 isFileURL];

            if (v21) {
              [v51 addObject:v19];
            }
          }
          else
          {
          }
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v16);
    }

    goto LABEL_18;
  }
  if (v11 == 0x8000)
  {
    id v12 = [NSURL fileURLWithPath:v43];
    [v51 addObject:v12];
LABEL_18:
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v22 = v51;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (!v23) {
    goto LABEL_40;
  }
  obuint64_t j = v22;
  uint64_t v47 = *(void *)v53;
  while (2)
  {
    uint64_t v48 = v23;
    for (uint64_t j = 0; j != v48; ++j)
    {
      if (*(void *)v53 != v47) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v52 + 1) + 8 * j);
      id v10 = [MEMORY[0x263EFF9A0] dictionary];
      v26 = [v25 path];
      v27 = [(AlgosScoreDataCSV *)self readData:v26];

      if (v27)
      {
        [v10 setObject:v27 forKeyedSubscript:@"error"];
        if ((v46 & 1) == 0)
        {

          goto LABEL_38;
        }
      }
      if (v8)
      {
        [(AlgosScoreDataCSV *)self populateScore:v8];
        if (v49)
        {
          v28 = [v25 path];
          uint64_t v29 = [v28 lastPathComponent];
          char v30 = [v29 stringByAppendingPathExtension:@"trace"];
          double v31 = [v49 stringByAppendingPathComponent:v30];

          if ([v8 saveEventsToFile:v31]) {
            printf("Trace in %s\n", (const char *)[v31 cStringUsingEncoding:4]);
          }
          else {
            fprintf((FILE *)*MEMORY[0x263EF8348], "Couldn't write trace file to %s\n", (const char *)[v31 cStringUsingEncoding:4]);
          }
        }
        double v32 = [v25 path];
        double v33 = [v8 scoreStreaming:v32];
        [v10 setObject:v33 forKeyedSubscript:@"score"];

        double v34 = [v10 objectForKeyedSubscript:@"score"];
        int v35 = [v34 objectForKeyedSubscript:@"stats"];
        v36 = [(AlgosScoreDataCSV *)self statsDict];
        [v35 addEntriesFromDictionary:v36];

        if ([(AlgosScoreDataCSV *)self debug])
        {
          char v37 = [v10 objectForKeyedSubscript:@"score"];
          v38 = [v37 objectForKeyedSubscript:@"score"];
          id v39 = [v38 description];
          printf("Score: %s\n", (const char *)[v39 cStringUsingEncoding:4]);
        }
      }
      [v50 addObject:v10];
    }
    uint64_t v23 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_39:
  id v22 = obj;
LABEL_40:

  return v50;
}

uint64_t __57__AlgosScoreDataCSV_readDirectoryAndScore_score_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (FILE *)*MEMORY[0x263EF8348];
  id v5 = [a3 description];
  fprintf(v4, "Enumeration: %s\n", (const char *)[v5 cStringUsingEncoding:4]);

  return *(unsigned __int8 *)(a1 + 32);
}

- (void)dealloc
{
  csvData = self->csvData;
  if (csvData)
  {
    id v5 = (void **)self->csvData;
    std::vector<AlgosScoreStreamCSVFrameRow>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x2166BF060](csvData, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)AlgosScoreDataCSV;
  [(AlgosScoreDataCSV *)&v4 dealloc];
}

- (AlgosScoreCSVReader)rawStreamData
{
  return self->_rawStreamData;
}

- (void)setRawStreamData:(id)a3
{
}

- (NSMutableDictionary)statsDict
{
  return self->_statsDict;
}

- (void)setStatsDict:(id)a3
{
}

- (int)debug
{
  return self->_debug;
}

- (void)setDebug:(int)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsDict, 0);
  objc_storeStrong((id *)&self->_rawStreamData, 0);
}

@end