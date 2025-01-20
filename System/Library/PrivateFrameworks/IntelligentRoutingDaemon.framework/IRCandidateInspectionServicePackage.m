@interface IRCandidateInspectionServicePackage
- (IRCandidate)candidate;
- (IRCandidateInspectionServicePackage)initWithRules:(id)a3 classification:(int64_t)a4 orderOfExecution:(id)a5 andClassificationDescription:(id)a6 forCandidate:(id)a7;
- (IRInspectionOrderOfExectionForCandidate)orderOfExecution;
- (NSArray)rules;
- (NSString)classificationDescription;
- (id)exportCandidateInspectionAsDictionary;
- (int64_t)classification;
@end

@implementation IRCandidateInspectionServicePackage

- (IRCandidateInspectionServicePackage)initWithRules:(id)a3 classification:(int64_t)a4 orderOfExecution:(id)a5 andClassificationDescription:(id)a6 forCandidate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)IRCandidateInspectionServicePackage;
  v17 = [(IRCandidateInspectionServicePackage *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rules, a3);
    objc_storeStrong((id *)&v18->_candidate, a7);
    v18->_classification = a4;
    objc_storeStrong((id *)&v18->_classificationDescription, a6);
    objc_storeStrong((id *)&v18->_orderOfExecution, a5);
  }

  return v18;
}

- (id)exportCandidateInspectionAsDictionary
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v34 = self;
  v3 = [(IRCandidateInspectionServicePackage *)self rules];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v10 = [v8 evaluation];
        if ([v10 hasBoolean])
        {
          v11 = [v8 evaluation];
          if ([v11 BOOLean]) {
            v12 = @"Yes";
          }
          else {
            v12 = @"No";
          }
          [v9 setObject:v12 forKeyedSubscript:@"evaluation"];
        }
        else
        {
          [v9 setObject:@"Invalid" forKeyedSubscript:@"evaluation"];
        }

        id v13 = [v8 ruleName];
        [v36 setObject:v9 forKeyedSubscript:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v5);
  }

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v15 = [(IRCandidateInspectionServicePackage *)v34 candidate];
  id v16 = [v15 nodes];

  obuint64_t j = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v23 = [v21 avOutpuDeviceIdentifier];
        if (v23)
        {
          v24 = [v21 avOutpuDeviceIdentifier];
          [v22 setObject:v24 forKeyedSubscript:@"avOutpuDeviceIdentifier"];
        }
        else
        {
          [v22 setObject:&stru_27039A840 forKeyedSubscript:@"avOutpuDeviceIdentifier"];
        }

        v25 = [v21 rapportIdentifier];
        if (v25)
        {
          v26 = [v21 rapportIdentifier];
          [v22 setObject:v26 forKeyedSubscript:@"rapportIdentifier"];
        }
        else
        {
          [v22 setObject:&stru_27039A840 forKeyedSubscript:@"rapportIdentifier"];
        }

        v27 = [v21 idsIdentifier];
        if (v27)
        {
          v28 = [v21 idsIdentifier];
          [v22 setObject:v28 forKeyedSubscript:@"idsIdentifier"];
        }
        else
        {
          [v22 setObject:&stru_27039A840 forKeyedSubscript:@"idsIdentifier"];
        }

        [v14 addObject:v22];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v18);
  }

  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v29 setObject:v36 forKeyedSubscript:@"rules"];
  [v29 setObject:v14 forKeyedSubscript:@"nodes"];
  [(IRCandidateInspectionServicePackage *)v34 classification];
  v30 = IRCandidateClassificationToString();
  [v29 setObject:v30 forKeyedSubscript:@"classification"];

  v31 = [(IRCandidateInspectionServicePackage *)v34 candidate];
  v32 = [v31 candidateIdentifier];
  [v29 setObject:v32 forKeyedSubscript:@"candidateIdentifier"];

  return v29;
}

- (IRCandidate)candidate
{
  return self->_candidate;
}

- (NSArray)rules
{
  return self->_rules;
}

- (int64_t)classification
{
  return self->_classification;
}

- (IRInspectionOrderOfExectionForCandidate)orderOfExecution
{
  return self->_orderOfExecution;
}

- (NSString)classificationDescription
{
  return self->_classificationDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescription, 0);
  objc_storeStrong((id *)&self->_orderOfExecution, 0);
  objc_storeStrong((id *)&self->_rules, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

@end