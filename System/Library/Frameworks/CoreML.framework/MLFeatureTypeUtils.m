@interface MLFeatureTypeUtils
+ (BOOL)canShapeArrayBePromotedFrom:(id)a3 to:(id)a4;
+ (id)descriptionForType:(int64_t)a3;
+ (id)featureDescriptionWithName:(id)a3 consistentWithFeatureValues:(id)a4 error:(id *)a5;
+ (id)featureValuesWithConsistentTypeFromArray:(id)a3 error:(id *)a4;
+ (int64_t)featureTypeForObject:(id)a3;
+ (int64_t)featureTypeForValuesInArray:(id)a3 error:(id *)a4;
@end

@implementation MLFeatureTypeUtils

+ (BOOL)canShapeArrayBePromotedFrom:(id)a3 to:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke;
  v18[3] = &unk_1E59A4D50;
  id v19 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v18];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke_2;
  v16 = &unk_1E59A4D50;
  id v17 = v10;
  id v11 = v10;
  [v6 enumerateObjectsUsingBlock:&v13];

  LOBYTE(v6) = objc_msgSend(v9, "isEqualToArray:", v11, v13, v14, v15, v16);
  return (char)v6;
}

void __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 integerValue] != 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __53__MLFeatureTypeUtils_canShapeArrayBePromotedFrom_to___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 integerValue] != 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

+ (id)descriptionForType:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 9)
  {
    v4 = (void *)MEMORY[0x1E4F1CA00];
    id v8 = @"value";
    v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    v9[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = [v4 exceptionWithName:@"UnknownValue" reason:@"Illegal value in MLFeatureType enum" userInfo:v6];

    objc_exception_throw(v7);
  }
  return off_1E59A4D70[a3];
}

+ (id)featureValuesWithConsistentTypeFromArray:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = 0;
  int64_t v6 = +[MLFeatureTypeUtils featureTypeForValuesInArray:v5 error:&v26];
  id v7 = v26;
  if (v7)
  {
    id v8 = v7;
    if (a4)
    {
      id v8 = v7;
      id v9 = 0;
      *a4 = v8;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    v20 = a4;
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v21 = 0;
          id v17 = +[MLFeatureValue featureValueOfType:v6 fromObject:v16 error:&v21];
          id v18 = v21;
          if (v18)
          {
            id v8 = v18;
            if (v20) {
              id *v20 = v18;
            }

            id v9 = 0;
            goto LABEL_17;
          }
          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v9 = v10;
    id v8 = 0;
LABEL_17:
  }

  return v9;
}

+ (id)featureDescriptionWithName:(id)a3 consistentWithFeatureValues:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 count])
  {
    v54 = a5;
    id v10 = [v9 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 type];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v13 = v9;
    uint64_t v52 = [v13 countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v52)
    {
      int v14 = 0;
      uint64_t v15 = *(void *)v62;
      id v49 = a1;
      uint64_t v50 = *(void *)v62;
      v51 = v8;
      id v53 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          int v17 = v14;
          uint64_t v18 = v11;
          if (*(void *)v62 != v15) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v20 = v12;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v58;
LABEL_9:
            uint64_t v24 = 0;
            while (1)
            {
              if (*(void *)v58 != v23) {
                objc_enumerationMutation(v20);
              }
              if (([*(id *)(*((void *)&v57 + 1) + 8 * v24) isAllowedValue:v19 error:0] & 1) == 0) {
                break;
              }
              if (v22 == ++v24)
              {
                uint64_t v22 = [v20 countByEnumeratingWithState:&v57 objects:v66 count:16];
                if (!v22) {
                  goto LABEL_15;
                }
                goto LABEL_9;
              }
            }
            if (v54)
            {
              id *v54 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Inconsistent value constraints in array"];
            }

            goto LABEL_36;
          }
LABEL_15:

          if (v19)
          {
            int v25 = [v19 isUndefined];
            if (v18 != [v19 type])
            {
              if (v54)
              {
                v47 = @"Inconsistent value types in array";
                goto LABEL_48;
              }
LABEL_36:

              v45 = 0;
              id v8 = v51;
              id v12 = v53;
              goto LABEL_41;
            }
            uint64_t v11 = v18;
            int v14 = v25 | v17;
            switch([v19 type])
            {
              case 4:
                if (![v19 imageBufferValue]) {
                  break;
                }
                id v26 = (__CVBuffer *)[v19 imageBufferValue];
                unint64_t v27 = +[MLImageConstraint imagePixelTypeFromOSType:CVPixelBufferGetPixelFormatType(v26)];
                if (!v27)
                {
                  if (v54)
                  {
                    v47 = @"Image found with unsupported pixel type";
LABEL_48:
                    id *v54 = +[MLModelErrorUtils featureTypeErrorWithFormat:v47];
                  }
                  goto LABEL_36;
                }
                unint64_t v28 = v27;
                v29 = [MLImageSize alloc];
                size_t Width = CVPixelBufferGetWidth(v26);
                v31 = [(MLImageSize *)v29 initWithPixelsWide:Width pixelsHigh:CVPixelBufferGetHeight(v26)];
                v32 = [MLImageSizeConstraint alloc];
                v65 = v31;
                v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
                v34 = [(MLImageSizeConstraint *)v32 initWithEnumeratedImageSizes:v33];

                v35 = +[MLImageConstraint constraintWithPixelsWide:[(MLImageSize *)v31 pixelsWide] pixelsHigh:[(MLImageSize *)v31 pixelsHigh] pixelType:v28 sizeConstraint:v34];
                if (v35) {
                  [v20 addObject:v35];
                }

LABEL_25:
LABEL_29:

                break;
              case 5:
                v31 = [v19 multiArrayValue];
                v34 = [(MLImageSize *)v31 shape];
                v36 = [v19 multiArrayValue];
                v37 = +[MLMultiArrayConstraint constraintWithShape:dataType:](MLMultiArrayConstraint, "constraintWithShape:dataType:", v34, [v36 dataType]);
                [v20 addObject:v37];

                goto LABEL_25;
              case 7:
                v38 = [v19 sequenceValue];
                v39 = [v38 values];
                uint64_t v48 = [v39 count];

                v40 = [v51 stringByAppendingString:@".values"];
                v41 = [v19 sequenceValue];
                v42 = [v41 featureValues];
                v31 = [v49 featureDescriptionWithName:v40 consistentWithFeatureValues:v42 error:v54];

                if (!v31) {
                  goto LABEL_36;
                }
                v43 = -[MLSequenceConstraint initWithValueDescription:countRange:]([MLSequenceConstraint alloc], "initWithValueDescription:countRange:", v31, v48, 1);
                [v20 addObject:v43];

                goto LABEL_29;
              case 8:
                v44 = [v19 internalStateValue];
                v55[0] = MEMORY[0x1E4F143A8];
                v55[1] = 3221225472;
                v55[2] = __83__MLFeatureTypeUtils_featureDescriptionWithName_consistentWithFeatureValues_error___block_invoke;
                v55[3] = &unk_1E59A4D28;
                v56 = (MLImageSize *)v20;
                [v44 internalGetMultiArrayWithHandler:v55];

                v31 = v56;
                goto LABEL_29;
              default:
                break;
            }
          }
          else
          {
            int v14 = 1;
            uint64_t v11 = v18;
          }
          id v12 = v53;
          uint64_t v15 = v50;
        }
        id v8 = v51;
        uint64_t v52 = [v13 countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (v52) {
          continue;
        }
        break;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }

    v45 = +[MLFeatureDescription featureDescriptionWithName:v8 type:v11 optional:v14 & 1 constraints:v12];
LABEL_41:
  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Cannot form description from nothing"];
    v45 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

void __83__MLFeatureTypeUtils_featureDescriptionWithName_consistentWithFeatureValues_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v3 shape];
  uint64_t v4 = [v3 dataType];

  id v5 = +[MLStateConstraint constraintWithBufferShape:v6 dataType:v4];
  [v2 addObject:v5];
}

+ (int64_t)featureTypeForValuesInArray:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  objc_opt_class();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
LABEL_22:
    int64_t v10 = 0;
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  int v17 = a4;
  char v9 = 0;
  int64_t v10 = 0;
  uint64_t v11 = *(void *)v19;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v19 != v11) {
      objc_enumerationMutation(v6);
    }
    uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * v12);
    if (objc_opt_isKindOfClass()) {
      goto LABEL_17;
    }
    int64_t v14 = +[MLFeatureTypeUtils featureTypeForObject:v13];
    int64_t v15 = v14;
    if ((v9 & 1) == 0)
    {
      char v9 = 1;
      int64_t v10 = v14;
      goto LABEL_17;
    }
    if (v10 != v14) {
      break;
    }
    char v9 = 1;
LABEL_17:
    if (v8 == ++v12)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_23;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 && (v10 == 1 && v15 == 2 || v10 == 2 && v15 == 1))
  {
    char v9 = 1;
    int64_t v10 = 2;
    goto LABEL_17;
  }
  if (!v17) {
    goto LABEL_22;
  }
  +[MLModelErrorUtils featureTypeErrorWithFormat:@"Inconsistent value types in array"];
  int64_t v10 = 0;
  *int v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v10;
}

+ (int64_t)featureTypeForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = [v3 type];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFNumberType Type = CFNumberGetType((CFNumberRef)v3);
      if ((unint64_t)(Type - 5) >= 0xC) {
        int64_t v4 = 1;
      }
      else {
        int64_t v4 = qword_19EC7D938[Type - 5];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v4 = 3;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v4 = 5;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v4 = 6;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int64_t v4 = 7;
            }
            else if (v3 && (CFTypeID v6 = CFGetTypeID(v3), v6 == CVPixelBufferGetTypeID()))
            {
              int64_t v4 = 4;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v9 = 0;
                int64_t v7 = +[MLFeatureTypeUtils featureTypeForValuesInArray:v3 error:&v9];
                if (v9 | (v7 - 1) & 0xFFFFFFFFFFFFFFFDLL) {
                  int64_t v4 = 0;
                }
                else {
                  int64_t v4 = 7;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  int64_t v4 = 8;
                }
                else {
                  int64_t v4 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

@end