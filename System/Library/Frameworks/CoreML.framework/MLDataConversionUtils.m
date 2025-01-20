@interface MLDataConversionUtils
+ (BOOL)populateEspressoShapeAndStridesFromInputShape:(id)a3 ndRepresentation:(BOOL)a4 espressoShape:(id *)a5 espressoStrides:(id *)a6 error:(id *)a7;
+ (BOOL)populateShapeAndStrideFor:(id)a3 inputShape:(id)a4 outputShape:(id *)a5 outputStrides:(id *)a6 error:(id *)a7;
+ (id)batchProviderFromEspressoDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)batchProviderFromMLComputeDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)espressoDataProviderFromBatchProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6;
+ (id)espressoDataProviderFromFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6;
+ (id)featureProviderFomMLComputeDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)featureProviderFromEspressoDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)mlComputeDataProviderFromBatchProvider:(id)a3 batchSize:(unint64_t)a4 forPrediction:(BOOL)a5 neuralNetworkEngine:(id)a6 error:(id *)a7;
+ (id)stridesForShape:(id)a3;
+ (unint64_t)mlComputeDataTypeSize:(int64_t)a3;
+ (unint64_t)sizeFromShape:(id)a3;
@end

@implementation MLDataConversionUtils

+ (id)stridesForShape:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:v3];
  unint64_t v5 = 0;
  uint64_t v6 = 1;
  uint64_t v7 = -1;
  while (v5 < [v3 count])
  {
    v8 = [NSNumber numberWithInt:v6];
    objc_msgSend(v4, "setObject:atIndexedSubscript:", v8, v7 + objc_msgSend(v3, "count"));

    v9 = objc_msgSend(v3, "objectAtIndexedSubscript:", v7 + objc_msgSend(v3, "count"));
    uint64_t v6 = v6 * [v9 integerValue];

    ++v5;
    --v7;
  }

  return v4;
}

+ (unint64_t)sizeFromShape:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0;
  unint64_t v5 = 1;
  while (v4 < [v3 count])
  {
    uint64_t v6 = [v3 objectAtIndexedSubscript:v4];
    v5 *= [v6 unsignedIntegerValue];

    ++v4;
  }

  return v5;
}

+ (unint64_t)mlComputeDataTypeSize:(int64_t)a3
{
  return 4;
}

+ (id)batchProviderFromMLComputeDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v8 = a4;
  id v70 = a5;
  v87 = v8;
  v9 = [v8 modelDescription];
  v78 = [v9 outputDescriptionsByName];

  id v10 = (id)[v72 numberOfBatches];
  v71 = [MEMORY[0x1E4F1CA48] array];
  if (!v10)
  {
LABEL_74:
    v64 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v71];
    id v85 = v10;
    goto LABEL_84;
  }
  id v66 = v10;
  id v10 = 0;
  uint64_t v11 = 0;
LABEL_3:
  id v104 = v10;
  uint64_t v68 = v11;
  v79 = objc_msgSend(v72, "batchAtIndex:error:", v66);
  id v85 = v104;

  if (v79)
  {
    id v10 = v85;
    uint64_t v67 = [v72 sizeOfBatchAtIndex:v68];
    if (!v67) {
      goto LABEL_73;
    }
    uint64_t v73 = 0;
    while (1)
    {
      v12 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v102 = 0u;
      long long v103 = 0u;
      long long v101 = 0u;
      long long v100 = 0u;
      v13 = [v79 allKeys];
      obuint64_t j = v13;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v100 objects:v107 count:16];
      if (!v14)
      {
        id v85 = v10;
        goto LABEL_71;
      }
      uint64_t v77 = *(void *)v101;
      id v85 = v10;
      do
      {
        uint64_t v76 = v14;
        for (uint64_t i = 0; i != v76; ++i)
        {
          if (*(void *)v101 != v77) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v100 + 1) + 8 * i);
          v88 = [v78 objectForKeyedSubscript:v16];
          v17 = [v87 modelDescription];
          v18 = [v17 predictedFeatureName];
          int v19 = [v18 isEqualToString:v16];

          if (v88) {
            char v20 = 1;
          }
          else {
            char v20 = v19;
          }
          if ((v20 & 1) == 0) {
            continue;
          }
          if ((v19 & 1) == 0 && [v88 type] != 5)
          {
            if (a6)
            {
              *a6 = +[MLModelErrorUtils updateErrorWithFormat:@"Output is not in the expected format."];
            }
            goto LABEL_80;
          }
          v21 = (void *)MEMORY[0x1E4F1C9B8];
          v22 = [v79 objectForKeyedSubscript:v16];
          uint64_t v23 = [v22 bytes];
          v24 = [v79 objectForKeyedSubscript:v16];
          v82 = objc_msgSend(v21, "dataWithBytesNoCopy:length:freeWhenDone:", v23, objc_msgSend(v24, "length"), 0);

          if (v19)
          {
            v25 = NSNumber;
            v26 = [v87 classLabels];
            v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
            v106 = v27;
            v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];

            uint64_t v28 = 65568;
          }
          else
          {
            v29 = [v88 multiArrayConstraint];
            uint64_t v28 = [v29 dataType];

            v26 = [v88 multiArrayConstraint];
            v84 = [v26 shape];
          }

          v81 = +[MLDataConversionUtils stridesForShape:v84];
          uint64_t v30 = [a1 sizeFromShape:v84];
          uint64_t v31 = [a1 mlComputeDataTypeSize:v28];
          if ([v87 classifierOutputIsSigmoidOutput]) {
            uint64_t v32 = [a1 mlComputeDataTypeSize:v28];
          }
          else {
            uint64_t v32 = v31 * v30;
          }
          id v86 = [v82 subdataWithRange:v32 * v73];
          v33 = [MLMultiArray alloc];
          id v99 = v85;
          v83 = [(MLMultiArray *)v33 initWithShape:v84 dataType:v28 error:&v99];
          id v34 = v99;

          if (!v83)
          {
            if (a6)
            {
              *a6 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor"];
            }

            id v85 = v34;
LABEL_80:

LABEL_81:
            goto LABEL_82;
          }
          if ([v87 classifierOutputIsSigmoidOutput])
          {
            v35 = [[MLMultiArray alloc] initWithShape:&unk_1EF11A9E8 dataType:65568 error:a6];
            if (!v35)
            {
              if (a6)
              {
                v60 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to create a multi array of size 2"];
                goto LABEL_53;
              }
LABEL_54:

              int v59 = 0;
              v44 = 0;
LABEL_55:
              id v85 = v34;
              goto LABEL_64;
            }
            float v36 = *(float *)[v86 bytes];
            *(float *)&double v37 = v36;
            v38 = [NSNumber numberWithFloat:v37];
            [(MLMultiArray *)v35 setObject:v38 atIndexedSubscript:0];

            *(float *)&double v39 = 1.0 - v36;
            v40 = [NSNumber numberWithFloat:v39];
            [(MLMultiArray *)v35 setObject:v40 atIndexedSubscript:1];

            v41 = [MLMultiArray alloc];
            v42 = v35;
            uint64_t v43 = [(MLMultiArray *)v42 mutableBytes];
            id v98 = v34;
            v44 = [(MLMultiArray *)v41 initWithDataPointer:v43 shape:v84 dataType:65568 strides:v81 deallocator:0 error:&v98];
            id v45 = v98;

            if (!v44)
            {
              if (a6)
              {
                v60 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor"];
                id v34 = v45;
LABEL_53:
                *a6 = v60;
              }
              else
              {
                id v34 = v45;
              }
              goto LABEL_54;
            }
          }
          else
          {
            v46 = [MLMultiArray alloc];
            uint64_t v47 = [v86 bytes];
            id v97 = v34;
            v44 = [(MLMultiArray *)v46 initWithDataPointer:v47 shape:v84 dataType:65568 strides:v81 deallocator:0 error:&v97];
            id v85 = v97;

            if (!v44)
            {
              if (a6)
              {
                id v58 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor"];
                int v59 = 0;
                v44 = 0;
                goto LABEL_48;
              }
              int v59 = 0;
              v44 = 0;
              goto LABEL_64;
            }
            id v45 = v85;
          }
          id v96 = v45;
          BOOL v48 = [(MLMultiArray *)v44 copyIntoMultiArray:v83 error:&v96];
          id v85 = v96;

          if (v48)
          {
            if (!v19)
            {
              [v12 setObject:v83 forKeyedSubscript:v16];
LABEL_50:
              int v59 = 1;
              goto LABEL_64;
            }
            v49 = [v87 classScoreVectorName];
            [v12 setObject:v83 forKeyedSubscript:v49];

            v50 = [MLDictionaryFeatureProvider alloc];
            id v95 = v85;
            v69 = [(MLDictionaryFeatureProvider *)v50 initWithDictionary:v12 error:&v95];
            id v34 = v95;

            if (!v69)
            {
              if (a6)
              {
                +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor"];
                int v59 = 0;
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                int v59 = 0;
              }
              goto LABEL_55;
            }
            id v94 = v34;
            v51 = [v87 addClassifierInformationToOutput:v69 options:v70 error:&v94];
            id v85 = v94;

            if (v51)
            {
              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              v52 = [v51 featureNames];
              uint64_t v53 = [v52 countByEnumeratingWithState:&v90 objects:v105 count:16];
              if (v53)
              {
                uint64_t v54 = *(void *)v91;
                do
                {
                  for (uint64_t j = 0; j != v53; ++j)
                  {
                    if (*(void *)v91 != v54) {
                      objc_enumerationMutation(v52);
                    }
                    uint64_t v56 = *(void *)(*((void *)&v90 + 1) + 8 * j);
                    v57 = [v51 featureValueForName:v56];
                    [v12 setObject:v57 forKeyedSubscript:v56];
                  }
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v90 objects:v105 count:16];
                }
                while (v53);
              }

              goto LABEL_50;
            }
            v61 = v69;
            if (a6)
            {
              *a6 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor"];
              v61 = v69;
            }
          }
          else if (a6)
          {
            id v58 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to copy output data to output tensor"];
            int v59 = 0;
LABEL_48:
            *a6 = v58;
            goto LABEL_64;
          }
          int v59 = 0;
LABEL_64:

          if (!v59) {
            goto LABEL_81;
          }
        }
        v13 = obj;
        uint64_t v14 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
      }
      while (v14);
LABEL_71:

      v62 = [MLDictionaryFeatureProvider alloc];
      id v89 = v85;
      v63 = [(MLDictionaryFeatureProvider *)v62 initWithDictionary:v12 error:&v89];
      id v10 = v89;

      if (!v63)
      {
        if (a6)
        {
          *a6 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor"];
        }

        id v85 = v10;
LABEL_82:

        goto LABEL_83;
      }
      [v71 addObject:v63];

      if (++v73 == v67)
      {
LABEL_73:

        uint64_t v11 = v68 + 1;
        if ((id)(v68 + 1) == v66) {
          goto LABEL_74;
        }
        goto LABEL_3;
      }
    }
  }
  if (a6)
  {
    *a6 = +[MLModelErrorUtils updateErrorWithFormat:@"Failed to extract output tensor."];
  }

LABEL_83:
  v64 = 0;
LABEL_84:

  return v64;
}

+ (id)featureProviderFomMLComputeDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v6 = +[MLDataConversionUtils batchProviderFromMLComputeDataProvider:a3 neuralNetworkEngine:a4 options:a5 error:a6];
  uint64_t v7 = [v6 featuresAtIndex:0];

  return v7;
}

+ (id)mlComputeDataProviderFromBatchProvider:(id)a3 batchSize:(unint64_t)a4 forPrediction:(BOOL)a5 neuralNetworkEngine:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a6;
  v13 = [[MLComputeBatchDataSource alloc] initWithBatchProvider:v11 batchSize:a4 forPrediction:v9 neuralNetworkEngine:v12 error:a7];

  return v13;
}

+ (id)batchProviderFromEspressoDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v8 = a4;
  id v50 = a5;
  v60 = v8;
  BOOL v9 = [v8 modelDescription];
  v57 = [v9 outputDescriptionsByName];

  uint64_t v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v51, "numberOfDataPoints"));
  unint64_t v49 = 0;
  id v10 = 0;
  while (1)
  {
    if (v49 >= [v51 numberOfDataPoints])
    {
      uint64_t v43 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v47];
      goto LABEL_72;
    }
    id v82 = v10;
    uint64_t v54 = objc_msgSend(v51, "dataPointAtIndex:error:");
    id v11 = v82;

    if (!v54) {
      break;
    }
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    obuint64_t j = [v54 allKeys];
    uint64_t v13 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v13)
    {
      uint64_t v56 = *(void *)v79;
      while (2)
      {
        uint64_t v55 = v13;
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v79 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v78 + 1) + 8 * i);
          v64 = [v57 objectForKeyedSubscript:v15];
          uint64_t v16 = [v60 classScoreVectorName];
          char v17 = [v16 isEqualToString:v15];

          if (v64) {
            char v18 = 1;
          }
          else {
            char v18 = v17;
          }
          if (v18)
          {
            if ((v17 & 1) == 0 && [v64 type] != 5)
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6 format:@"Output is not in the expected format"];
              }
              goto LABEL_65;
            }
            v62 = [v54 objectForKeyedSubscript:v15];
            if (v17)
            {
              uint64_t v19 = 65568;
            }
            else
            {
              char v20 = [v64 multiArrayConstraint];
              uint64_t v19 = [v20 dataType];
            }
            v21 = [v62 shape];
            id v76 = 0;
            id v77 = 0;
            id v75 = v11;
            BOOL v22 = +[MLDataConversionUtils populateShapeAndStrideFor:v64 inputShape:v21 outputShape:&v77 outputStrides:&v76 error:&v75];
            id v23 = v77;
            id v63 = v76;
            id v24 = v75;

            if (!v22)
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v24 format:@"Output is not in the expected format"];
              }

LABEL_64:
              id v11 = v24;
LABEL_65:

              goto LABEL_66;
            }
            if (!v23)
            {
              uint64_t v25 = [v62 shape];
              uint64_t v26 = +[MLDataConversionUtils stridesForShape:v25];

              id v63 = (id)v26;
              id v23 = (id)v25;
            }
            v27 = [MLMultiArray alloc];
            uint64_t v28 = [v62 dataPointer];
            id v74 = v24;
            v61 = [(MLMultiArray *)v27 initWithDataPointer:v28 shape:v23 dataType:65568 strides:v63 deallocator:0 error:&v74];
            id v58 = v23;
            id v11 = v74;

            if (!v61)
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Failed to extract output tensor"];
              }

              goto LABEL_65;
            }
            v29 = [MLMultiArray alloc];
            id v73 = v11;
            int v59 = [(MLMultiArray *)v29 initWithShape:v23 dataType:v19 error:&v73];
            id v24 = v73;

            if (!v59)
            {
              if (a6)
              {
                id v44 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v24 format:@"Failed to extract output tensor"];
                id v45 = 0;
                *a6 = v44;
              }
              else
              {
                id v45 = 0;
              }
              goto LABEL_63;
            }
            id v72 = v24;
            BOOL v30 = [(MLMultiArray *)v61 copyIntoMultiArray:v59 error:&v72];
            id v11 = v72;

            if (!v30)
            {
              if (a6)
              {
                *a6 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Failed to extract output tensor"];
              }
LABEL_61:
              id v24 = v11;
LABEL_62:
              id v45 = v59;
LABEL_63:

              goto LABEL_64;
            }
            [v12 setObject:v59 forKeyedSubscript:v15];
            uint64_t v31 = [v60 classScoreVectorName];
            int v32 = [v31 isEqualToString:v15];

            if (v32)
            {
              v33 = [MLDictionaryFeatureProvider alloc];
              id v71 = v11;
              v52 = [(MLDictionaryFeatureProvider *)v33 initWithDictionary:v12 error:&v71];
              id v24 = v71;

              if (!v52)
              {
                if (a6)
                {
                  *a6 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v24 format:@"Failed to extract output tensor"];
                }
                goto LABEL_62;
              }
              id v70 = v24;
              id v34 = [v60 addClassifierInformationToOutput:v52 options:v50 error:&v70];
              id v11 = v70;

              if (!v34)
              {
                if (a6)
                {
                  *a6 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Failed to extract output tensor"];
                }

                goto LABEL_61;
              }
              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              v35 = [v34 featureNames];
              uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v83 count:16];
              if (v36)
              {
                uint64_t v37 = *(void *)v67;
                do
                {
                  for (uint64_t j = 0; j != v36; ++j)
                  {
                    if (*(void *)v67 != v37) {
                      objc_enumerationMutation(v35);
                    }
                    uint64_t v39 = *(void *)(*((void *)&v66 + 1) + 8 * j);
                    v40 = [v34 featureValueForName:v39];
                    [v12 setObject:v40 forKeyedSubscript:v39];
                  }
                  uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v83 count:16];
                }
                while (v36);
              }
            }
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v78 objects:v84 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v41 = [MLDictionaryFeatureProvider alloc];
    id v65 = v11;
    v42 = [(MLDictionaryFeatureProvider *)v41 initWithDictionary:v12 error:&v65];
    id v10 = v65;

    if (v42)
    {
      [v47 addObject:v42];
    }
    else if (a6)
    {
      *a6 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v10 format:@"Failed to extract output tensor"];
    }

    ++v49;
    if (!v42)
    {
      uint64_t v43 = 0;
LABEL_72:
      id v11 = v10;
      goto LABEL_67;
    }
  }
  if (a6)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Failed to extract output tensor"];
    uint64_t v43 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_66:
    uint64_t v43 = 0;
  }
LABEL_67:

  return v43;
}

+ (id)featureProviderFromEspressoDataProvider:(id)a3 neuralNetworkEngine:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v6 = +[MLDataConversionUtils batchProviderFromEspressoDataProvider:a3 neuralNetworkEngine:a4 options:a5 error:a6];
  uint64_t v7 = [v6 featuresAtIndex:0];

  return v7;
}

+ (id)espressoDataProviderFromBatchProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = [[_MLBatchDataSource alloc] initWithMLBatchProvider:v9 forPrediction:v8 neuralNetworkEngine:v10 error:a6];

  return v11;
}

+ (id)espressoDataProviderFromFeatureProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = [[_MLDataSource alloc] initWithMLFeatureProvider:v9 forPrediction:v8 neuralNetworkEngine:v10 error:a6];

  return v11;
}

+ (BOOL)populateShapeAndStrideFor:(id)a3 inputShape:(id)a4 outputShape:(id *)a5 outputStrides:(id *)a6 error:(id *)a7
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (v11)
  {
    uint64_t v13 = [v11 multiArrayConstraint];
    uint64_t v14 = [v13 shapeConstraint];
  }
  else
  {
    uint64_t v14 = 0;
  }
  v61 = (void *)v14;
  uint64_t v15 = [v12 objectAtIndexedSubscript:2];
  v57 = a6;
  id v58 = a5;
  v69[0] = v15;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];

  uint64_t v16 = [v12 objectAtIndexedSubscript:2];
  if ([v16 unsignedLongValue] != 1) {
    goto LABEL_7;
  }
  char v17 = [v12 objectAtIndexedSubscript:3];
  if ([v17 unsignedLongValue] == 1)
  {

LABEL_7:
    goto LABEL_8;
  }
  id v24 = [v12 objectAtIndexedSubscript:4];
  BOOL v25 = [v24 unsignedLongValue] == 1;

  if (!v25)
  {
    BOOL v22 = [v12 objectAtIndexedSubscript:3];
    v68[0] = v22;
    id v23 = [v12 objectAtIndexedSubscript:4];
    v68[1] = v23;
    int v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
    goto LABEL_17;
  }
LABEL_8:
  char v18 = [v12 objectAtIndexedSubscript:2];
  if ([v18 unsignedLongValue] != 1)
  {
    uint64_t v19 = [v12 objectAtIndexedSubscript:3];
    if ([v19 unsignedLongValue] == 1)
    {
      char v20 = [v12 objectAtIndexedSubscript:4];
      BOOL v21 = [v20 unsignedLongValue] == 1;

      if (!v21)
      {
        BOOL v22 = [v12 objectAtIndexedSubscript:2];
        v67[0] = v22;
        id v23 = [v12 objectAtIndexedSubscript:4];
        v67[1] = v23;
        int v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
LABEL_16:
  BOOL v22 = [v12 objectAtIndexedSubscript:2];
  v66[0] = v22;
  id v23 = [v12 objectAtIndexedSubscript:3];
  v66[1] = v23;
  int v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
LABEL_17:

  uint64_t v26 = [v12 objectAtIndexedSubscript:2];
  v65[0] = v26;
  v27 = [v12 objectAtIndexedSubscript:3];
  v65[1] = v27;
  uint64_t v28 = [v12 objectAtIndexedSubscript:4];
  v65[2] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];

  if (v61) {
    BOOL v30 = v11 != 0;
  }
  else {
    BOOL v30 = 0;
  }
  if (v30 && [v61 type] != 1)
  {
    if ([v61 isAllowedShape:v60 error:a7])
    {
      uint64_t v26 = [v12 objectAtIndexedSubscript:3];
      if ([v26 unsignedLongValue] == 1)
      {
        uint64_t v36 = [v12 objectAtIndexedSubscript:4];
        BOOL v37 = [v36 unsignedLongValue] == 1;

        v38 = v60;
        if (v37) {
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    char v39 = [v61 isAllowedShape:v29 error:a7];
    v38 = v29;
    if ((v39 & 1) == 0)
    {
      if (v59 && [v61 isAllowedShape:v59 error:a7])
      {
        id v32 = v59;
      }
      else
      {
        id v32 = [v61 findAvailableShape:v29];
        if (!v32)
        {
          uint64_t v56 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E58B000, v56, OS_LOG_TYPE_INFO, "WARNING: The computed output shape does not match any output shape allowed in the model's description. Please update the model description.", buf, 2u);
          }

          goto LABEL_22;
        }
      }
LABEL_36:
      v40 = [v12 objectAtIndexedSubscript:0];
      uint64_t v41 = [v40 unsignedLongValue];
      if (v41 == 1
        && ([v12 objectAtIndexedSubscript:1],
            uint64_t v26 = objc_claimAutoreleasedReturnValue(),
            (unint64_t)[v26 unsignedLongValue] >= 2))
      {
      }
      else
      {
        v42 = [v12 objectAtIndexedSubscript:0];
        if ((unint64_t)[v42 unsignedLongValue] < 2)
        {

          if (v41 != 1) {
            goto LABEL_50;
          }
          goto LABEL_49;
        }
        uint64_t v43 = [v12 objectAtIndexedSubscript:1];
        uint64_t v44 = [v43 unsignedLongValue];

        if (v41 == 1)
        {

          if (v44 != 1)
          {
LABEL_51:
            id v50 = [v12 objectAtIndexedSubscript:0];
            if ((unint64_t)[v50 unsignedLongValue] >= 2)
            {
              id v51 = [v12 objectAtIndexedSubscript:1];
              BOOL v52 = (unint64_t)[v51 unsignedLongValue] > 1;

              if (!v52)
              {
LABEL_55:
                uint64_t v31 = +[MLDataConversionUtils stridesForShape:v32];
                goto LABEL_23;
              }
              id v50 = [v12 objectAtIndexedSubscript:0];
              v63[0] = v50;
              uint64_t v53 = [v12 objectAtIndexedSubscript:1];
              v63[1] = v53;
              uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
              uint64_t v55 = [v54 arrayByAddingObjectsFromArray:v32];

              id v32 = (id)v55;
            }

            goto LABEL_55;
          }
        }
        else
        {

          if (v44 != 1) {
            goto LABEL_51;
          }
        }
      }
      id v45 = [v12 objectAtIndexedSubscript:1];
      unint64_t v46 = [v45 unsignedLongValue];
      uint64_t v47 = [v12 objectAtIndexedSubscript:0];
      unint64_t v48 = [v47 unsignedLongValue];
      if (v46 <= v48) {
        unint64_t v46 = v48;
      }

      v40 = [NSNumber numberWithUnsignedLong:v46];
      v64 = v40;
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
      uint64_t v49 = [v26 arrayByAddingObjectsFromArray:v32];

      id v32 = (id)v49;
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
LABEL_30:
    id v32 = v38;
    if (!v32)
    {
      uint64_t v31 = 0;
      goto LABEL_23;
    }
    goto LABEL_36;
  }
LABEL_22:
  uint64_t v31 = 0;
  id v32 = 0;
LABEL_23:
  id v33 = v32;
  *id v58 = v33;
  id v34 = v31;
  id *v57 = v34;

  return 1;
}

+ (BOOL)populateEspressoShapeAndStridesFromInputShape:(id)a3 ndRepresentation:(BOOL)a4 espressoShape:(id *)a5 espressoStrides:(id *)a6 error:(id *)a7
{
  BOOL v10 = a4;
  v35[5] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = v12;
  if (v10)
  {
    switch([v12 count])
    {
      case 1:
        v35[0] = &unk_1EF11A5C8;
        v35[1] = &unk_1EF11A5C8;
        v35[2] = &unk_1EF11A5C8;
        v35[3] = &unk_1EF11A5C8;
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        v35[4] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
        goto LABEL_16;
      case 2:
        v34[0] = &unk_1EF11A5C8;
        v34[1] = &unk_1EF11A5C8;
        v34[2] = &unk_1EF11A5C8;
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        v34[3] = v14;
        uint64_t v16 = [v13 objectAtIndexedSubscript:1];
        v34[4] = v16;
        char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:5];
        goto LABEL_22;
      case 3:
        v33[0] = &unk_1EF11A5C8;
        v33[1] = &unk_1EF11A5C8;
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        v33[2] = v14;
        uint64_t v16 = [v13 objectAtIndexedSubscript:1];
        v33[3] = v16;
        char v18 = [v13 objectAtIndexedSubscript:2];
        v33[4] = v18;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
        goto LABEL_20;
      case 4:
        v32[0] = &unk_1EF11A5C8;
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        v32[1] = v14;
        uint64_t v16 = [v13 objectAtIndexedSubscript:1];
        v32[2] = v16;
        char v18 = [v13 objectAtIndexedSubscript:2];
        v32[3] = v18;
        char v20 = [v13 objectAtIndexedSubscript:3];
        v32[4] = v20;
        char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
        goto LABEL_12;
      case 5:
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        v31[0] = v14;
        uint64_t v16 = [v13 objectAtIndexedSubscript:1];
        v31[1] = v16;
        char v18 = [v13 objectAtIndexedSubscript:2];
        v31[2] = v18;
        char v20 = [v13 objectAtIndexedSubscript:3];
        v31[3] = v20;
        BOOL v21 = [v13 objectAtIndexedSubscript:4];
        v31[4] = v21;
        char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];

LABEL_12:
        goto LABEL_21;
      default:
        if (a7) {
          goto LABEL_14;
        }
        goto LABEL_32;
    }
  }
  switch([v12 count])
  {
    case 1:
      v30[0] = &unk_1EF11A5C8;
      v30[1] = &unk_1EF11A5C8;
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      v30[2] = v14;
      v30[3] = &unk_1EF11A5C8;
      v30[4] = &unk_1EF11A5C8;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
      goto LABEL_16;
    case 2:
      v29[0] = &unk_1EF11A5C8;
      v29[1] = &unk_1EF11A5C8;
      uint64_t v14 = [v13 objectAtIndexedSubscript:1];
      v29[2] = v14;
      v29[3] = &unk_1EF11A5C8;
      v29[4] = &unk_1EF11A5C8;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:5];
LABEL_16:
      char v17 = (void *)v15;
      goto LABEL_23;
    case 3:
      v28[0] = &unk_1EF11A5C8;
      v28[1] = &unk_1EF11A5C8;
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      v28[2] = v14;
      uint64_t v16 = [v13 objectAtIndexedSubscript:1];
      v28[3] = v16;
      char v18 = [v13 objectAtIndexedSubscript:2];
      v28[4] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:5];
      goto LABEL_20;
    case 4:
      v27[0] = &unk_1EF11A5C8;
      v27[1] = &unk_1EF11A5C8;
      uint64_t v14 = [v13 objectAtIndexedSubscript:1];
      v27[2] = v14;
      uint64_t v16 = [v13 objectAtIndexedSubscript:2];
      v27[3] = v16;
      char v18 = [v13 objectAtIndexedSubscript:3];
      v27[4] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
      goto LABEL_20;
    case 5:
      v26[0] = &unk_1EF11A5C8;
      v26[1] = &unk_1EF11A5C8;
      uint64_t v14 = [v13 objectAtIndexedSubscript:2];
      v26[2] = v14;
      uint64_t v16 = [v13 objectAtIndexedSubscript:3];
      v26[3] = v16;
      char v18 = [v13 objectAtIndexedSubscript:4];
      v26[4] = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
LABEL_20:
      char v17 = (void *)v19;
LABEL_21:

LABEL_22:
LABEL_23:

      id v23 = [a1 stridesForShape:v17];
      if (a5) {
        BOOL v24 = a6 == 0;
      }
      else {
        BOOL v24 = 1;
      }
      LOBYTE(a7) = !v24;
      if (!v24)
      {
        *a5 = v17;
        *a6 = v23;
      }

      break;
    default:
      if (a7)
      {
LABEL_14:
        BOOL v22 = [v13 componentsJoinedByString:@", "];
        *a7 = +[MLModelErrorUtils errorWithCode:6, @"Data provided has unsupported shape (%@)", v22 format];

        LOBYTE(a7) = 0;
      }
      break;
  }
LABEL_32:

  return (char)a7;
}

@end