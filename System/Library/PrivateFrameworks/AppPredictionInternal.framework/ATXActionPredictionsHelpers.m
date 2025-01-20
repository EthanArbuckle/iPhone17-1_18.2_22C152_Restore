@interface ATXActionPredictionsHelpers
+ (id)limitTheNumberOfPredictions:(id)a3 withLimit:(int)a4;
+ (id)processCandidateActionPredictions:(id)a3 limit:(int)a4 predictionItemsToKeep:(void *)a5;
+ (id)sortedPredictions:(id)a3;
+ (void)applyJointLogProbabilityToActionPredictions:(id)a3 withAppActionTypePredictionScore:(double)a4;
+ (void)applyLogOfLinearProbabilityTransformationToPredictions:(id)a3;
+ (void)applyLogSoftmaxToPredictions:(id)a3;
+ (void)applyNormalizationToPredictions:(id)a3;
+ (void)keepRandomPredictionItems:(id)a3 limit:(unint64_t)a4 predictionItemsToKeep:(void *)a5;
+ (void)sortPredictions:(id)a3;
@end

@implementation ATXActionPredictionsHelpers

+ (id)processCandidateActionPredictions:(id)a3 limit:(int)a4 predictionItemsToKeep:(void *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = +[ATXActionPredictionsHelpers sortedPredictions:v7];

  +[ATXActionPredictionsHelpers keepRandomPredictionItems:v8 limit:(int)v6 predictionItemsToKeep:a5];
  v9 = +[ATXActionPredictionsHelpers limitTheNumberOfPredictions:v8 withLimit:v6];

  +[ATXActionPredictionsHelpers applyLogSoftmaxToPredictions:v9];
  +[ATXSlotResolution setSlotLogProbabilityForCandidateActionPredictions:v9];
  return v9;
}

+ (void)keepRandomPredictionItems:(id)a3 limit:(unint64_t)a4 predictionItemsToKeep:(void *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (a5)
  {
    unint64_t v33 = a4;
    v34 = (char **)a5;
    v43 = 0;
    v42 = 0;
    v44 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    v32 = v8;
    if (v9)
    {
      uint64_t v10 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (v12) {
            [v12 predictionItem];
          }
          else {
            bzero(&v36, 0xCE0uLL);
          }
          v13 = v43;
          if (v43 >= v44)
          {
            v16 = (void ***)v42;
            unint64_t v17 = 0xDAB7EC1DD3431B57 * (((char *)v43 - v42) >> 5);
            unint64_t v18 = v17 + 1;
            if (v17 + 1 > 0x13E22CBCE4A902) {
              std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
            }
            if (0xB56FD83BA68636AELL * (((char *)v44 - v42) >> 5) > v18) {
              unint64_t v18 = 0xB56FD83BA68636AELL * (((char *)v44 - v42) >> 5);
            }
            if (0xDAB7EC1DD3431B57 * (((char *)v44 - v42) >> 5) >= 0x9F1165E725481) {
              unint64_t v19 = 0x13E22CBCE4A902;
            }
            else {
              unint64_t v19 = v18;
            }
            v45[4] = &v44;
            if (v19)
            {
              v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)&v44, v19);
              uint64_t v22 = v21;
              v13 = v43;
              v16 = (void ***)v42;
            }
            else
            {
              v20 = 0;
              uint64_t v22 = 0;
            }
            v23 = (void ***)&v20[3296 * v17];
            v24 = v36;
            v36 = 0;
            *v23 = v24;
            memcpy(v23 + 1, v37, 0xCD2uLL);
            if (v13 == v16)
            {
              v29 = &v20[3296 * v17];
            }
            else
            {
              v25 = &v20[3296 * v17];
              v26 = v13;
              do
              {
                v27 = v26 - 412;
                uint64_t v28 = (uint64_t)*(v26 - 412);
                v29 = v25 - 3296;
                *(v26 - 412) = 0;
                *((void *)v25 - 412) = v28;
                memcpy(v25 - 3288, v26 - 411, 0xCD2uLL);
                v25 = v29;
                v26 = v27;
              }
              while (v27 != v16);
            }
            v15 = v23 + 412;
            v42 = v29;
            v43 = v15;
            v30 = v44;
            v44 = (void ***)&v20[3296 * v22];
            v45[2] = v13;
            v45[3] = v30;
            v45[1] = v16;
            v45[0] = v16;
            std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v45);
          }
          else
          {
            v14 = v36;
            v36 = 0;
            *v43 = v14;
            memcpy(v13 + 1, v37, 0xCD2uLL);
            v15 = v13 + 412;
          }
          v43 = v15;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v9);
    }

    v31 = +[_ATXGlobals sharedInstance];
    ATXKeepRandomPredictionItemsBelowLimit((uint64_t)&v42, v33, v34, (int)[v31 numberOfRandomSlotsToKeepForLogging]);

    v36 = (void **)&v42;
    std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v36);
    v8 = v32;
  }
}

+ (void)sortPredictions:(id)a3
{
}

uint64_t __47__ATXActionPredictionsHelpers_sortPredictions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  float v7 = v6;
  [v5 score];
  if (v7 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 < v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }

  return v10;
}

+ (id)sortedPredictions:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [a1 sortPredictions:v4];
  return v4;
}

+ (id)limitTheNumberOfPredictions:(id)a3 withLimit:(int)a4
{
  id v7 = a3;
  if (a4 < 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"ATXActionPredictionsHelpers.mm", 61, @"Invalid parameter not satisfying: %@", @"limit >= 0" object file lineNumber description];
  }
  if ([v7 count] > (unint64_t)a4)
  {
    float v8 = objc_msgSend(v7, "subarrayWithRange:", 0, a4);
    uint64_t v9 = [v8 copy];

    id v7 = (id)v9;
  }
  return v7;
}

+ (void)applyJointLogProbabilityToActionPredictions:(id)a3 withAppActionTypePredictionScore:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "scoredAction", (void)v12);
        [v9 score];
        double v11 = v10 + a4;
        *(float *)&double v11 = v11;
        [v9 setScore:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

+ (void)applyNormalizationToPredictions:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v40;
      double v7 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v40 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v39 + 1) + 8 * i) score];
          double v7 = v7 + v9;
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
    }

    unint64_t v10 = [v4 count];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
    double v13 = v7 / (double)v10;
    if (v12)
    {
      uint64_t v14 = *(void *)v36;
      double v15 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          [v17 score];
          float v19 = v18;
          [v17 score];
          double v15 = v15 + (v19 - v13) * (v20 - v13);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v12);
    }
    else
    {
      double v15 = 0.0;
    }

    unint64_t v21 = [v11 count];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v11;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v23)
    {
      double v24 = sqrt(v15 / (double)v21);
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8 * k);
          if (v24 == 0.0)
          {
            objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * k), "score", (void)v31);
            double v29 = v30 - v13;
          }
          else
          {
            [*(id *)(*((void *)&v31 + 1) + 8 * k) score];
            double v29 = (v28 - v13) / v24;
          }
          *(float *)&double v29 = v29;
          objc_msgSend(v27, "setScore:", v29, (void)v31);
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v23);
    }
  }
}

+ (void)applyLogOfLinearProbabilityTransformationToPredictions:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count]) {
    goto LABEL_25;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    double v9 = 0.0;
    double v10 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v12 score];
        float v14 = v13;
        [v12 score];
        if (v10 > v15)
        {
          [v12 score];
          double v10 = v16;
        }
        double v9 = v9 + v14;
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);

    double v17 = 0.0;
    if (v10 <= 0.0)
    {
      double v17 = 1.0 - v10;
      double v9 = v9 + (1.0 - v10) * (double)(unint64_t)[v6 count];
    }
    if (v9 > 0.0) {
      goto LABEL_17;
    }
  }
  else
  {

    double v9 = 0.0;
    double v17 = 0.0;
  }
  float v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2 object:a1 file:@"ATXActionPredictionsHelpers.mm" lineNumber:126 description:@"Error: Shifting sum is not greater than zero"];

LABEL_17:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = v6;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        objc_msgSend(v23, "score", (void)v26);
        long double v25 = log((v17 + v24) / v9);
        *(float *)&long double v25 = v25;
        [v23 setScore:(double)v25];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

LABEL_25:
}

+ (void)applyLogSoftmaxToPredictions:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v34;
    double v6 = -INFINITY;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v8 score];
        if (v6 < v9)
        {
          [v8 score];
          double v6 = v10;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = -INFINITY;
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    long double v14 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * j) score];
        long double v14 = v14 + exp(v16 - v6);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v12);
  }
  else
  {
    long double v14 = 0.0;
  }

  double v17 = log(v14);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = *(void **)(*((void *)&v25 + 1) + 8 * k);
        objc_msgSend(v22, "score", (void)v25);
        double v24 = v23 - v6 - v17;
        *(float *)&double v24 = v24;
        [v22 setScore:v24];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v19);
  }
}

@end