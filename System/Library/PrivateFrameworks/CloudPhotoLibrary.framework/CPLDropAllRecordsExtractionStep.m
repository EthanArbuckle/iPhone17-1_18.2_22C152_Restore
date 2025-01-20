@interface CPLDropAllRecordsExtractionStep
- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6;
- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3;
- (id)shortDescription;
@end

@implementation CPLDropAllRecordsExtractionStep

- (id)shortDescription
{
  return @"DropAll";
}

- (BOOL)shouldResetFromThisStepWithIncomingChange:(id)a3
{
  return 1;
}

- (BOOL)extractToBatch:(id)a3 maximumCount:(unint64_t)a4 maximumResourceSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v8 = [(CPLBatchExtractionStep *)self storage];
  v9 = [(CPLBatchExtractionStep *)self storage];
  v10 = [(CPLBatchExtractionStep *)self scopeIdentifier];
  v11 = [v9 allChangesWithScopeIdentifier:v10];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = 0;
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      uint64_t v17 = 0;
      v18 = v15;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * v17);
        id v23 = v18;
        int v20 = [v8 removeChange:v19 error:&v23];
        id v15 = v23;

        if (!v20)
        {

          if (a6)
          {
            id v15 = v15;
            BOOL v21 = 0;
            *a6 = v15;
          }
          else
          {
            BOOL v21 = 0;
          }
          goto LABEL_15;
        }
        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }

  BOOL v21 = 1;
LABEL_15:

  return v21;
}

@end