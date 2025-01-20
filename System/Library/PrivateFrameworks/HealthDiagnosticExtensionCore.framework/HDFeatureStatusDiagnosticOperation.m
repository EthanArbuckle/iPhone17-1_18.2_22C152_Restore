@interface HDFeatureStatusDiagnosticOperation
- (id)reportFilename;
- (void)_reportFeatureStatusByFeature;
- (void)_reportFeatureStatusForFeature:(id)a3 healthStore:(id)a4;
- (void)_reportRegionAvailabilityByFeature;
- (void)_reportRegionAvailabilityForFeature:(id)a3 healthStore:(id)a4;
- (void)_reportRequirementSatisfactionOverridesByFeature;
- (void)run;
@end

@implementation HDFeatureStatusDiagnosticOperation

- (id)reportFilename
{
  return @"HealthFeatureStatus.txt";
}

- (void)run
{
  [(HDFeatureStatusDiagnosticOperation *)self _reportRequirementSatisfactionOverridesByFeature];
  [(HDFeatureStatusDiagnosticOperation *)self _reportFeatureStatusByFeature];
  [(HDFeatureStatusDiagnosticOperation *)self _reportRegionAvailabilityByFeature];
}

- (void)_reportRequirementSatisfactionOverridesByFeature
{
  v2 = self;
  uint64_t v43 = *MEMORY[0x263EF8340];
  [(HDDiagnosticOperation *)self appendString:@"Requirement Satisfaction Overrides"];
  [(HDDiagnosticOperation *)v2 appendStrongSeparator];
  [(HDDiagnosticOperation *)v2 appendNewline];
  HKAllFeatureIdentifiers();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v3) {
    goto LABEL_23;
  }
  uint64_t v4 = v3;
  char v5 = 0;
  uint64_t v6 = *(void *)v38;
  uint64_t v24 = *(void *)v38;
  v25 = v2;
  do
  {
    uint64_t v7 = 0;
    uint64_t v26 = v4;
    do
    {
      if (*(void *)v38 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v37 + 1) + 8 * v7);
      if ((HKFeatureIdentifierIsProvidedBySleepDaemon() & 1) == 0)
      {
        v9 = (void *)[objc_alloc(MEMORY[0x263F0A398]) initWithFeatureIdentifier:v8];
        v10 = [v9 overriddenRequirementIdentifiers];
        if ([v10 count])
        {
          uint64_t v30 = v7;
          [(HDDiagnosticOperation *)v2 appendString:v8];
          [(HDDiagnosticOperation *)v2 appendSeparator];
          v11 = (void *)[objc_alloc(MEMORY[0x263F0A808]) initWithColumnTitles:0];
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __86__HDFeatureStatusDiagnosticOperation__reportRequirementSatisfactionOverridesByFeature__block_invoke;
          v35[3] = &unk_264866F18;
          id v28 = v11;
          id v36 = v28;
          v12 = (void (**)(void, void, void))MEMORY[0x22A6B8EE0](v35);
          v29 = v10;
          v13 = [v10 allObjects];
          v14 = [v13 sortedArrayUsingSelector:sel_compare_];

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v32 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                v21 = [v9 overriddenSatisfactionOfRequirementWithIdentifier:v20];
                if ([v21 BOOLValue]) {
                  v22 = @"YES";
                }
                else {
                  v22 = @"NO";
                }
                ((void (**)(void, uint64_t, __CFString *))v12)[2](v12, v20, v22);
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
            }
            while (v17);
          }

          v23 = [v28 formattedTable];
          v2 = v25;
          [(HDDiagnosticOperation *)v25 appendString:v23];

          [(HDDiagnosticOperation *)v25 appendNewline];
          char v5 = 1;
          uint64_t v6 = v24;
          uint64_t v4 = v26;
          v10 = v29;
          uint64_t v7 = v30;
        }
      }
      ++v7;
    }
    while (v7 != v4);
    uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  }
  while (v4);
  if ((v5 & 1) == 0)
  {
LABEL_23:
    [(HDDiagnosticOperation *)v2 appendString:@"<none>"];
    [(HDDiagnosticOperation *)v2 appendNewline];
  }
}

void __86__HDFeatureStatusDiagnosticOperation__reportRequirementSatisfactionOverridesByFeature__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[2] = *MEMORY[0x263EF8340];
  char v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"%@:", a2];
  v9[0] = v7;
  v9[1] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [*(id *)(a1 + 32) appendRow:v8];
}

- (void)_reportFeatureStatusByFeature
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(HDDiagnosticOperation *)self appendString:@"Feature Status"];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
  uint64_t v4 = HKAllFeatureIdentifiers();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HDFeatureStatusDiagnosticOperation *)self _reportFeatureStatusForFeature:*(void *)(*((void *)&v9 + 1) + 8 * v8) healthStore:v3];
        [(HDDiagnosticOperation *)self appendNewline];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_reportFeatureStatusForFeature:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HDDiagnosticOperation *)self appendString:v6];
  [(HDDiagnosticOperation *)self appendSeparator];
  if ([v6 isEqualToString:*MEMORY[0x263F09728]])
  {
    [(HDDiagnosticOperation *)self appendString:@"<redacted>"];
    [(HDDiagnosticOperation *)self appendNewline];
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureIdentifier:v6 healthStore:v7 countryCodeSource:0];
    id v14 = 0;
    long long v9 = [v8 featureStatusWithError:&v14];
    id v10 = v14;
    long long v11 = v10;
    if (v9)
    {
      long long v12 = (void *)[objc_alloc(MEMORY[0x263F0A398]) initWithFeatureIdentifier:v6];
      v13 = HKPrettyPrintedFeatureStatus();
      [(HDDiagnosticOperation *)self appendString:v13];
    }
    else
    {
      [(HDDiagnosticOperation *)self appendFormat:@"Error evaluating feature status for %@: %@", v6, v10];
      [(HDDiagnosticOperation *)self appendNewline];
    }
  }
}

- (void)_reportRegionAvailabilityByFeature
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(HDDiagnosticOperation *)self appendString:@"Region Availability"];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
  [(HDDiagnosticOperation *)self appendNewline];
  id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
  uint64_t v4 = HKAllFeatureIdentifiers();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HDFeatureStatusDiagnosticOperation *)self _reportRegionAvailabilityForFeature:*(void *)(*((void *)&v9 + 1) + 8 * v8) healthStore:v3];
        [(HDDiagnosticOperation *)self appendNewline];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_reportRegionAvailabilityForFeature:(id)a3 healthStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(HDDiagnosticOperation *)self appendString:v6];
  [(HDDiagnosticOperation *)self appendSeparator];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F0A3B8]) initWithFeatureIdentifier:v6 healthStore:v7];

  id v13 = 0;
  long long v9 = [v8 regionAvailabilityWithError:&v13];
  id v10 = v13;
  long long v11 = v10;
  if (v9)
  {
    long long v12 = [v9 prettyPrintedDescription];
    [(HDDiagnosticOperation *)self appendString:v12];
  }
  else
  {
    [(HDDiagnosticOperation *)self appendFormat:@"Error evaluating region availability for %@: %@", v6, v10];
    [(HDDiagnosticOperation *)self appendNewline];
  }
}

@end