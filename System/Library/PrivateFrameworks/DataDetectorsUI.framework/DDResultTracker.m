@interface DDResultTracker
- (BOOL)addResultIfAppropriate:(__DDResult *)a3 referenceDate:(id)a4 referenceTimeZone:(id)a5;
- (DDResultTracker)initWithReferenceResult:(__DDResult *)a3;
- (id)results;
- (unint64_t)maximumDistance;
- (unint64_t)maximumDistanceForEmails;
- (unsigned)totalCountRemaining;
- (void)dealloc;
- (void)setMaximumDistance:(unint64_t)a3;
- (void)setMaximumDistanceForEmails:(unint64_t)a3;
@end

@implementation DDResultTracker

- (DDResultTracker)initWithReferenceResult:(__DDResult *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DDResultTracker;
  v4 = [(DDResultTracker *)&v14 init];
  if (v4)
  {
    *((void *)v4 + 12) = CFRetain(a3);
    *((void *)v4 + 6) = DDResultGetRange();
    int Category = DDResultGetCategory();
    *(_OWORD *)(v4 + 8) = xmmword_1A175CCB0;
    v6 = v4 + 8;
    *(_OWORD *)(v4 + 24) = xmmword_1A175CCC0;
    if (Category == 4)
    {
      *((_DWORD *)v4 + 6) = 2;
      v4[44] = 1;
    }
    else
    {
      --*(_DWORD *)&v6[4 * Category];
    }
    uint64_t v7 = 0;
    int v8 = 0;
    *((_DWORD *)v4 + 10) = 0;
    do
    {
      v8 += *(_DWORD *)&v6[v7];
      *((_DWORD *)v4 + 10) = v8;
      v7 += 4;
    }
    while (v7 != 32);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = (void *)*((void *)v4 + 10);
    *((void *)v4 + 10) = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = (void *)*((void *)v4 + 11);
    *((void *)v4 + 11) = v11;

    *((void *)v4 + 9) = 0;
  }
  return (DDResultTracker *)v4;
}

- (void)dealloc
{
  referenceResult = self->referenceResult;
  if (referenceResult) {
    CFRelease(referenceResult);
  }
  v4.receiver = self;
  v4.super_class = (Class)DDResultTracker;
  [(DDResultTracker *)&v4 dealloc];
}

- (BOOL)addResultIfAppropriate:(__DDResult *)a3 referenceDate:(id)a4 referenceTimeZone:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!self->totalCountRemaining) {
    goto LABEL_14;
  }
  int Category = DDResultGetCategory();
  unint64_t referenceResultLocation = self->referenceResultLocation;
  uint64_t Range = DDResultGetRange();
  uint64_t v13 = referenceResultLocation - Range;
  if ((uint64_t)(referenceResultLocation - Range) >= 0) {
    unint64_t v14 = referenceResultLocation - Range;
  }
  else {
    unint64_t v14 = Range - referenceResultLocation;
  }
  if (Category == 1)
  {
    if (v14 <= self->maximumDistanceForEmails)
    {
      if (v14 <= self->maximumDistance)
      {
        unsigned int v15 = self->countRemainingByCategory[1];
LABEL_38:
        if (!v15) {
          goto LABEL_44;
        }
LABEL_41:
        --self->countRemainingByCategory[Category];
        --self->totalCountRemaining;
        if (v13 < 1) {
          [(NSMutableArray *)self->resultsAfter addObject:a3];
        }
        else {
          [(NSMutableArray *)self->resultsBefore insertObject:a3 atIndex:0];
        }
        goto LABEL_44;
      }
      goto LABEL_14;
    }
LABEL_44:
    BOOL v17 = 1;
    goto LABEL_45;
  }
  unint64_t maximumDistance = self->maximumDistance;
  if (v14 <= maximumDistance)
  {
    if (Category == 3)
    {
      if (!self->existingAddressResult)
      {
        self->existingAddressResult = a3;
        goto LABEL_41;
      }
      if (DDAddressResultCanBeMergedWith()) {
        goto LABEL_41;
      }
      goto LABEL_44;
    }
    goto LABEL_19;
  }
  BOOL v17 = 0;
  if (Category == 4 && v14 <= 2 * maximumDistance)
  {
    if (!DDResultHasType() || DDResultIsPastDate())
    {
LABEL_14:
      BOOL v17 = 0;
      goto LABEL_45;
    }
LABEL_19:
    unsigned int v15 = self->countRemainingByCategory[Category];
    if (v15 && Category == 4)
    {
      id v40 = v8;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      referenceResult = self->referenceResult;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&referenceResult count:1];
      resultsBefore = self->resultsBefore;
      resultsAfter = self->resultsAfter;
      v51[0] = v18;
      v51[1] = resultsBefore;
      v51[2] = resultsAfter;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];

      uint64_t v36 = [v21 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v36)
      {
        uint64_t v22 = *(void *)v46;
        uint64_t v23 = *MEMORY[0x1E4F5F0D0];
        v38 = v21;
        id v39 = v9;
        uint64_t v34 = *(void *)v46;
        uint64_t v35 = v13;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(v21);
            }
            uint64_t v37 = v24;
            v25 = *(void **)(*((void *)&v45 + 1) + 8 * v24);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v26 = v25;
            uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v42;
              while (2)
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v42 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t Type = DDResultGetType();
                  if (MEMORY[0x1A6236700](Type, v23))
                  {
                    uint64_t v32 = DDResultGetType();
                    if (MEMORY[0x1A6236700](Type, v32))
                    {

                      BOOL v17 = 1;
                      id v9 = v39;
                      id v8 = v40;
                      goto LABEL_45;
                    }
                  }
                }
                uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }

            uint64_t v24 = v37 + 1;
            v21 = v38;
            id v9 = v39;
            uint64_t v22 = v34;
            uint64_t v13 = v35;
          }
          while (v37 + 1 != v36);
          uint64_t v36 = [v38 countByEnumeratingWithState:&v45 objects:v52 count:16];
        }
        while (v36);
      }

      id v8 = v40;
      goto LABEL_41;
    }
    goto LABEL_38;
  }
LABEL_45:

  return v17;
}

- (id)results
{
  v3 = [(NSMutableArray *)self->resultsBefore arrayByAddingObject:self->referenceResult];
  objc_super v4 = [v3 arrayByAddingObjectsFromArray:self->resultsAfter];

  if (self->sortByProximity)
  {
    id v5 = [v4 sortedArrayUsingFunction:MEMORY[0x1E4F5F120] context:self->referenceResult];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (unsigned)totalCountRemaining
{
  return self->totalCountRemaining;
}

- (unint64_t)maximumDistanceForEmails
{
  return self->maximumDistanceForEmails;
}

- (void)setMaximumDistanceForEmails:(unint64_t)a3
{
  self->maximumDistanceForEmails = a3;
}

- (unint64_t)maximumDistance
{
  return self->maximumDistance;
}

- (void)setMaximumDistance:(unint64_t)a3
{
  self->unint64_t maximumDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->resultsAfter, 0);
  objc_storeStrong((id *)&self->resultsBefore, 0);
}

@end