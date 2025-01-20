@interface HDSimpleDiagnostic
- (HDAnalysis)analysis;
- (HDExperiment)experiment;
- (HDSimpleDiagnostic)initWithExperiment:(id)a3 analysis:(id)a4;
- (NSString)summary;
- (id)diagnosticDescription;
- (id)runWithParameters:(id)a3 host:(id)a4 error:(id *)a5;
- (void)setAnalysis:(id)a3;
- (void)setExperiment:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation HDSimpleDiagnostic

- (HDSimpleDiagnostic)initWithExperiment:(id)a3 analysis:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDSimpleDiagnostic;
  v9 = [(HDSimpleDiagnostic *)&v13 init];
  v10 = v9;
  if (v9)
  {
    summary = v9->_summary;
    v9->_summary = (NSString *)@"UNSPECIFIED";

    objc_storeStrong((id *)&v10->_experiment, a3);
    objc_storeStrong((id *)&v10->_analysis, a4);
  }

  return v10;
}

- (id)diagnosticDescription
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = [[HDDescription alloc] initWithSummary:self->_summary];
  v4 = [(HDSimpleDiagnostic *)self experiment];
  v5 = [v4 experimentDescription];

  v6 = [(HDSimpleDiagnostic *)self analysis];
  id v7 = [v6 analysisDescription];

  id v8 = [v5 parameters];
  uint64_t v9 = [v8 count];

  v31 = v3;
  if (v9)
  {
    v10 = [[HDKeyedObjectParameter alloc] initWithSummary:@"parameters for the experiment" required:0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v11 = [v5 parameters];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v17 = [v5 parameters];
          v18 = [v17 objectForKeyedSubscript:v16];

          if ([v18 required]) {
            [(HDKeyedObjectParameter *)v10 setRequired:1];
          }
          [(HDKeyedObjectParameter *)v10 addKey:v18 forName:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }

    v3 = v31;
    [(HDDescription *)v31 addParameter:v10 forName:@"experiment"];
  }
  v19 = [v7 parameters];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [[HDKeyedObjectParameter alloc] initWithSummary:@"parameters for the analysis" required:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v22 = [v7 parameters];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          v28 = [v7 parameters];
          v29 = [v28 objectForKeyedSubscript:v27];

          if ([v29 required]) {
            [(HDKeyedObjectParameter *)v21 setRequired:1];
          }
          [(HDKeyedObjectParameter *)v21 addKey:v29 forName:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v24);
    }

    v3 = v31;
    [(HDDescription *)v31 addParameter:v21 forName:@"analysis"];
  }
  return v3;
}

- (id)runWithParameters:(id)a3 host:(id)a4 error:(id *)a5
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  v11 = [MEMORY[0x263EFF910] date];
  [v10 setStartTime:v11];

  uint64_t v12 = [(HDSimpleDiagnostic *)self diagnosticDescription];
  uint64_t v13 = [(HDSimpleDiagnostic *)self experiment];
  uint64_t v14 = [(HDSimpleDiagnostic *)self analysis];
  if ([v12 validateAgainstValues:v8 error:a5])
  {
    v15 = [v8 objectForKeyedSubscript:@"experiment"];
    uint64_t v16 = [v8 objectForKeyedSubscript:@"analysis"];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v13 setupWithParameters:v15 host:v9 error:a5]
      || (objc_opt_respondsToSelector() & 1) != 0
      && ![v14 setupWithParameters:v16 host:v9 error:a5])
    {
      v44 = 0;
    }
    else
    {
      id v86 = 0;
      v17 = [v13 run:&v86];
      id v18 = v86;
      id v74 = v9;
      if (v17)
      {
        v69 = v15;
        v72 = v17;
        v19 = (void *)[v17 copy];
        id v85 = v18;
        v68 = v14;
        uint64_t v20 = [v14 analyzeExperimentResult:v19 error:&v85];
        id v21 = v85;

        if (v20)
        {
          v70 = v21;
          v67 = v16;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v73 = v20;
          v22 = [v20 measuredResults];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v87 count:16];
          uint64_t v14 = v68;
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v82;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v82 != v25) {
                  objc_enumerationMutation(v22);
                }
                [v10 addResult:*(void *)(*((void *)&v81 + 1) + 8 * i)];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v81 objects:v87 count:16];
            }
            while (v24);
          }

          uint64_t v27 = [v72 files];
          v79[0] = MEMORY[0x263EF8330];
          v79[1] = 3221225472;
          v79[2] = __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke;
          v79[3] = &unk_264D00130;
          id v28 = v10;
          id v80 = v28;
          [v27 enumerateKeysAndObjectsUsingBlock:v79];

          v29 = [v73 files];
          v77[0] = MEMORY[0x263EF8330];
          v77[1] = 3221225472;
          v77[2] = __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke_2;
          v77[3] = &unk_264D00130;
          id v30 = v28;
          id v78 = v30;
          [v29 enumerateKeysAndObjectsUsingBlock:v77];

          v31 = objc_opt_new();
          long long v32 = [v72 auxiliaryData];
          uint64_t v33 = [v32 count];

          if (v33)
          {
            long long v34 = [v72 auxiliaryData];
            [v31 setObject:v34 forKeyedSubscript:@"experiment"];
          }
          long long v35 = [v73 auxiliaryData];
          uint64_t v36 = [v35 count];

          if (v36)
          {
            long long v37 = [v73 auxiliaryData];
            [v31 setObject:v37 forKeyedSubscript:@"analysis"];
          }
          long long v38 = (void *)[v31 copy];
          [v30 setAuxiliaryData:v38];

          v66 = v31;
          if (objc_opt_respondsToSelector())
          {
            id v76 = v70;
            char v39 = [v13 teardown:&v76];
            id v40 = v76;

            if ((v39 & 1) == 0)
            {
              uint64_t v41 = [v30 error];
              uint64_t v42 = (void *)v41;
              if (v41) {
                id v43 = (id)v41;
              }
              else {
                id v43 = v40;
              }
              objc_msgSend(v30, "failedForError:", v43, v31);
            }
            v15 = v69;
            v31 = v66;
          }
          else
          {
            v15 = v69;
            id v40 = v70;
          }
          if (objc_opt_respondsToSelector())
          {
            v57 = v15;
            id v75 = v40;
            char v58 = [v68 teardown:&v75];
            id v59 = v75;

            id v71 = v59;
            if ((v58 & 1) == 0)
            {
              uint64_t v60 = [v30 error];
              v61 = (void *)v60;
              if (v60) {
                id v62 = (id)v60;
              }
              else {
                id v62 = v59;
              }
              objc_msgSend(v30, "failedForError:", v62, v66);
            }
            v15 = v57;
            v31 = v66;
            uint64_t v16 = v67;
          }
          else
          {
            id v71 = v40;
            uint64_t v16 = v67;
          }
          v63 = objc_msgSend(MEMORY[0x263EFF910], "date", v66);
          [v30 setEndTime:v63];

          [v30 attemptToSetPassed];
          id v64 = v30;

          id v18 = v71;
          v56 = v73;
        }
        else
        {
          v51 = [MEMORY[0x263EFF910] date];
          [v10 setEndTime:v51];

          uint64_t v52 = [v10 error];
          v53 = (void *)v52;
          if (v52) {
            id v54 = (id)v52;
          }
          else {
            id v54 = v21;
          }
          [v10 failedForError:v54];

          id v55 = v10;
          v56 = 0;
          id v18 = v21;
          uint64_t v14 = v68;
          v15 = v69;
        }

        v45 = v72;
      }
      else
      {
        [MEMORY[0x263EFF910] date];
        v46 = v45 = 0;
        [v10 setEndTime:v46];

        uint64_t v47 = [v10 error];
        v48 = (void *)v47;
        if (v47) {
          id v49 = (id)v47;
        }
        else {
          id v49 = v18;
        }
        [v10 failedForError:v49];

        id v50 = v10;
      }

      v44 = v10;
      id v9 = v74;
    }
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

void __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"experiment-%@", a2];
  [v4 addFile:v6 forName:v7];
}

void __51__HDSimpleDiagnostic_runWithParameters_host_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"analysis-%@", a2];
  [v4 addFile:v6 forName:v7];
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (HDExperiment)experiment
{
  return self->_experiment;
}

- (void)setExperiment:(id)a3
{
}

- (HDAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end