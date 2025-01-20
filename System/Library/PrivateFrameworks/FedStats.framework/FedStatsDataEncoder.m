@interface FedStatsDataEncoder
+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4;
+ (id)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6;
+ (id)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7;
+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6;
+ (id)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6;
+ (id)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7;
+ (id)extractAssetNamesFrom:(id)a3 usingFieldValues:(id)a4;
+ (id)extractRequiredFieldsFrom:(id)a3;
+ (id)mutateDataTypeContent:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 error:(id *)a6;
+ (id)mutateDataTypeContent:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsDataEncoder)initWithDataTypes:(id)a3 combinationTypes:(id)a4;
- (NSArray)typeConfiguration;
- (NSDictionary)dataTypes;
- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4;
- (id)decodeFromBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5;
- (id)encodeToBitVector:(id)a3 possibleError:(id *)a4;
- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5;
- (id)encodeToIndex:(id)a3 error:(id *)a4;
- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5;
- (void)setDataTypes:(id)a3;
- (void)setTypeConfiguration:(id)a3;
@end

@implementation FedStatsDataEncoder

- (FedStatsDataEncoder)initWithDataTypes:(id)a3 combinationTypes:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)FedStatsDataEncoder;
  v9 = [(FedStatsDataEncoder *)&v43 init];
  v10 = v9;
  if (v9)
  {
    v32 = v9;
    objc_storeStrong((id *)&v9->_dataTypes, a3);
    v11 = [v8 allKeys];
    v12 = [v11 sortedArrayUsingComparator:&__block_literal_global_2];

    v13 = (void *)MEMORY[0x263EFF9C0];
    id v33 = v7;
    v14 = [v7 allKeys];
    v15 = [v13 setWithArray:v14];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v12;
    uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v40;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * v19);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v21 = [v8 objectForKey:v20];
          v22 = [v21 typesInCombination];

          uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v36;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v36 != v25) {
                  objc_enumerationMutation(v22);
                }
                [v15 removeObject:*(void *)(*((void *)&v35 + 1) + 8 * v26++)];
              }
              while (v24 != v26);
              uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v24);
          }

          [v15 removeObject:v20];
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v17);
    }

    v27 = [v15 allObjects];
    v28 = [v27 sortedArrayUsingComparator:&__block_literal_global_2];
    uint64_t v29 = [obj arrayByAddingObjectsFromArray:v28];
    v10 = v32;
    typeConfiguration = v32->_typeConfiguration;
    v32->_typeConfiguration = (NSArray *)v29;

    id v7 = v33;
  }

  return v10;
}

uint64_t __58__FedStatsDataEncoder_initWithDataTypes_combinationTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = v6;
  if (!v6 || ![v6 count])
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:100 description:@"Missing data type content"];
      long long v35 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v35 = 0;
    }
    goto LABEL_43;
  }
  long long v41 = (objc_class *)a1;
  long long v42 = a4;
  v44 = [MEMORY[0x263EFF980] array];
  v48 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  objc_super v43 = v7;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v56;
  unint64_t v12 = 0x265310000uLL;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v56 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void *)(*((void *)&v55 + 1) + 8 * i);
      id v15 = [v8 objectForKey:v14];
      uint64_t v16 = [v15 objectForKey:@"dataType"];
      if (!v16)
      {
        long long v36 = v42;
        if (v42)
        {
          id v46 = v15;
          id v22 = [NSString stringWithFormat:@"Missing data type specifier key \"%@\", @"dataType""];
          uint64_t v37 = 100;
LABEL_35:
          *long long v36 = +[FedStatsError errorWithCode:v37 description:v22];
          v34 = v48;
          goto LABEL_41;
        }
LABEL_36:
        long long v35 = 0;
LABEL_37:
        id v7 = v43;
        v34 = v48;
        goto LABEL_42;
      }
      uint64_t v17 = [*(id *)(v12 + 3920) dataTypeFromString:v16];
      if (v17 != 99)
      {
        id v46 = v15;
        if (v17 != -1)
        {
          id v18 = v8;
          unint64_t v19 = v12;
          uint64_t v20 = *(void **)(v12 + 3920);
          id v54 = 0;
          v21 = [v20 createFedStatsDataType:v16 dataTypeParams:v15 possibleError:&v54];
          id v22 = v54;
          if (v21)
          {
            [v48 setValue:v21 forKey:v14];

            unint64_t v12 = v19;
            id v8 = v18;
            id v15 = v46;
            goto LABEL_14;
          }
          if (v42)
          {
            long long v39 = [NSString stringWithFormat:@"Could not create data type \"%@\"", v14];
            *long long v42 = +[FedStatsError errorWithCode:302 underlyingError:v22 description:v39];
          }
          v34 = v48;
          id v8 = v18;
LABEL_41:

          long long v35 = 0;
          id v15 = v46;
          goto LABEL_42;
        }
        long long v36 = v42;
        if (v42)
        {
          id v22 = [NSString stringWithFormat:@"The data type \"%@\" is not supported", v16];
          uint64_t v37 = 101;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
      [v44 addObject:v14];
LABEL_14:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_16:

  v47 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v15 = v44;
  uint64_t v23 = [v15 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v45 = *(void *)v51;
    while (2)
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v15);
        }
        uint64_t v26 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x263EFF9A0];
        v28 = [v8 objectForKey:v26];
        uint64_t v16 = [v27 dictionaryWithDictionary:v28];

        uint64_t v29 = +[FedStatsCombinationType kAvailableTypes];
        v59 = v29;
        v60 = v48;
        v30 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        [v16 addEntriesFromDictionary:v30];

        id v49 = 0;
        v31 = +[FedStatsCombinationType createFromDict:v16 possibleError:&v49];
        id v32 = v49;
        if (!v31)
        {
          if (v42)
          {
            long long v38 = [NSString stringWithFormat:@"Could not create data type \"%@\"", v26];
            *long long v42 = +[FedStatsError errorWithCode:302 underlyingError:v32 description:v38];
          }
          long long v35 = 0;
          id v8 = v47;
          goto LABEL_37;
        }
        [v47 setValue:v31 forKey:v26];
        [v48 setValue:v31 forKey:v26];
      }
      uint64_t v24 = [v15 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v24) {
        continue;
      }
      break;
    }
  }

  id v33 = [v41 alloc];
  v34 = v48;
  id v15 = [NSDictionary dictionaryWithDictionary:v48];
  id v8 = v47;
  uint64_t v16 = [NSDictionary dictionaryWithDictionary:v47];
  long long v35 = (void *)[v33 initWithDataTypes:v15 combinationTypes:v16];
  id v7 = v43;
LABEL_42:

LABEL_43:
  return v35;
}

- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (!v11)
    {
      if (a5)
      {
        uint64_t v26 = [NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v26];
      }
      uint64_t v25 = 0;
      goto LABEL_24;
    }
    if ([v11 dataType] == 99)
    {
      v30 = a5;
      id v29 = v11;
      unint64_t v12 = [v29 typesInCombination];
      v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v20 = [v8 objectForKey:v19];
            [v13 setValue:v20 forKey:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v16);
      }

      v21 = (void *)[v13 copy];
      id v32 = 0;
      id v22 = v29;
      uint64_t v23 = [v29 encodeToIndex:v21 possibleError:&v32];
      id v24 = v32;

      a5 = v30;
    }
    else
    {
      id v22 = [v8 objectForKey:v9];
      id v31 = 0;
      uint64_t v23 = [v11 encodeToIndex:v22 possibleError:&v31];
      id v24 = v31;
    }

    if (v23)
    {
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "classCount"));
      uint64_t v25 = +[FedStatsDataEncoderDimensionalResult resultWithIndex:v23 dimensionality:v27];
    }
    else
    {
      if (!a5)
      {
        uint64_t v25 = 0;
        goto LABEL_23;
      }
      v27 = [NSString stringWithFormat:@"Cannot encode data to \"%@\"", v9];
      +[FedStatsError errorWithCode:401 underlyingError:v24 description:v27];
      uint64_t v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    uint64_t v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v25 = 0;
  }
LABEL_25:

  return v25;
}

- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      if ([v11 dataType] == 99)
      {
        v27 = a5;
        id v26 = v11;
        unint64_t v12 = [v26 typesInCombination];
        v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v20 = [v8 objectForKey:v19];
              [v13 setValue:v20 forKey:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
          }
          while (v16);
        }

        v21 = [NSDictionary dictionaryWithDictionary:v13];
        id v22 = [v26 encodeToOneHotVector:v21 possibleError:v27];
      }
      else
      {
        id v24 = [v8 objectForKey:v9];
        id v22 = [v11 encodeToOneHotVector:v24 possibleError:a5];
      }
    }
    else
    {
      if (a5)
      {
        uint64_t v23 = [NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v23];
      }
      id v22 = 0;
    }
  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    id v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)decodeFromBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(FedStatsDataEncoder *)self dataTypes];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      unint64_t v12 = [v11 decodeFromOneHotVector:v8 possibleError:a5];
    }
    else
    {
      if (a5)
      {
        v13 = [NSString stringWithFormat:@"The data type \"%@\" is not valid", v9];
        *a5 = +[FedStatsError errorWithCode:200 description:v13];
      }
      unint64_t v12 = 0;
    }
  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
    unint64_t v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (id)encodeToBitVector:(id)a3 possibleError:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v31 = a3;
  if (!v31)
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:401 description:@"Provided data is empty"];
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    goto LABEL_14;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v13 = [(FedStatsDataEncoder *)self dataTypes];
        id v14 = [v13 objectForKey:v12];
        v9 += [v14 classCount];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);

    if (v9 > 0x186A0)
    {
      if (a4)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Resulting dimensionality %lu is larger than max dimensionality %lu", v9, 100000);
        *a4 = +[FedStatsError errorWithCode:900 description:v15];
      }
LABEL_14:
      id v16 = 0;
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v17 = [MEMORY[0x263EFF990] data];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    v21 = 0;
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      uint64_t v23 = 0;
      id v24 = v21;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * v23);
        v21 = [(FedStatsDataEncoder *)self encodeToBitVector:v31 withType:v25 possibleError:a4];

        if (!v21)
        {
          if (a4)
          {
            uint64_t v26 = [*a4 code];
            v27 = NSString;
            long long v28 = [*a4 localizedDescription];
            long long v29 = [v27 stringWithFormat:@"Error encoding \"%@\" type: %@", v25, v28];
            *a4 = +[FedStatsError errorWithCode:v26 description:v29];
          }
          id v16 = 0;
          goto LABEL_29;
        }
        [v17 appendData:v21];
        ++v23;
        id v24 = v21;
      }
      while (v20 != v23);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v16 = v17;
LABEL_29:

LABEL_30:
  return v16;
}

- (id)encodeToIndex:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v8 = [v7 count];

  if (v8 != 1)
  {
    if (a4)
    {
      uint64_t v23 = @"This API is only available for single type in encoding schema";
      uint64_t v24 = 900;
LABEL_19:
      +[FedStatsError errorWithCode:v24 description:v23];
      uint64_t v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_23:
    uint64_t v20 = 0;
    goto LABEL_27;
  }
  if (!v6)
  {
    if (a4)
    {
      uint64_t v23 = @"Provided data is empty";
      uint64_t v24 = 401;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  id v31 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v9 = [(FedStatsDataEncoder *)self dataTypes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v15 = [(FedStatsDataEncoder *)self dataTypes];
        id v16 = [v15 objectForKey:v14];
        if ([v16 dataType] == 99)
        {
        }
        else
        {
          uint64_t v17 = [v6 objectForKey:v14];

          if (!v17)
          {
            if (v31)
            {
              uint64_t v25 = [NSString stringWithFormat:@"Provided data does not contain a value for \"%@\"", v14];
              id *v31 = +[FedStatsError errorWithCode:200 description:v25];
            }
            goto LABEL_23;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v18 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v19 = [v18 firstObject];
  id v32 = 0;
  uint64_t v20 = [(FedStatsDataEncoder *)self encodeToIndex:v6 withType:v19 error:&v32];
  id v21 = v32;

  if (v20)
  {
    id v22 = v20;
  }
  else if (v31)
  {
    uint64_t v26 = NSString;
    v27 = [(FedStatsDataEncoder *)self typeConfiguration];
    long long v28 = [v27 firstObject];
    long long v29 = [v26 stringWithFormat:@"Cannot encode data to \"%@\"", v28];
    id *v31 = +[FedStatsError errorWithCode:401 underlyingError:v21 description:v29];
  }
LABEL_27:

  return v20;
}

- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v6 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v7 = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v23 = objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(FedStatsDataEncoder *)self typeConfiguration];
  uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v25)
  {
    uint64_t v8 = 0;
    uint64_t v24 = *(void *)v29;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = a4;
      if (*(void *)v29 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v9);
      uint64_t v12 = [(FedStatsDataEncoder *)self dataTypes];
      v13 = [v12 objectForKey:v11];

      uint64_t v14 = [v13 classCount];
      uint64_t v15 = objc_msgSend(v26, "subdataWithRange:", v8, v14);
      id v27 = 0;
      id v16 = [(FedStatsDataEncoder *)self decodeFromBitVector:v15 withType:v11 possibleError:&v27];
      id v17 = v27;
      if (v16) {
        break;
      }
      if (!v10) {
        goto LABEL_13;
      }
      id v18 = [NSString stringWithFormat:@"The decoder for \"%@\" failed", v11];
      a4 = v10;
      id *v10 = +[FedStatsError errorWithCode:500 underlyingError:v17 description:v18];

LABEL_14:
      if (!v16)
      {

        uint64_t v20 = 0;
        uint64_t v19 = v23;
        goto LABEL_19;
      }
      if (v25 == ++v9)
      {
        uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v25) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v23 addEntriesFromDictionary:v16];
    }
    else {
      [v23 setValue:v16 forKey:v11];
    }
    v8 += v14;
LABEL_13:
    a4 = v10;
    goto LABEL_14;
  }
LABEL_17:

  uint64_t v19 = v23;
  uint64_t v20 = [NSDictionary dictionaryWithDictionary:v23];
LABEL_19:

  return v20;
}

+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    if (a6)
    {
      uint64_t v24 = @"encodeDataArray missing data type content";
LABEL_22:
      +[FedStatsError errorWithCode:400 description:v24];
      uint64_t v25 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_53;
    }
LABEL_23:
    uint64_t v25 = 0;
    goto LABEL_53;
  }
  if (!v9)
  {
    if (a6)
    {
      uint64_t v24 = @"encodeDataArray missing data array";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  id v70 = 0;
  uint64_t v11 = +[FedStatsDataEncoder createWithDataTypeContent:v10 possibleError:&v70];
  id v12 = v70;
  v13 = v12;
  if (v11)
  {
    id v43 = v12;
    id v44 = v10;
    long long v50 = +[FedStatsDataSampler samplerWithCount:20];
    uint64_t v14 = [v11 typeConfiguration];
    unint64_t v15 = [v14 count];

    uint64_t v45 = v9;
    if (v15 < 2)
    {
      *a5 = 1;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v26 = v9;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v61 objects:v74 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v62;
        id v47 = v26;
        v48 = v11;
        uint64_t v46 = *(void *)v62;
        do
        {
          uint64_t v30 = 0;
          uint64_t v49 = v28;
          do
          {
            if (*(void *)v62 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v61 + 1) + 8 * v30);
            if (v31)
            {
              id v58 = 0;
              id v32 = [v11 encodeToIndex:v31 error:&v58];
              uint64_t v33 = v58;
              if (v32)
              {
                [v50 addItem:v32];
              }
              else
              {
                long long v34 = +[FedStatsLog logger];
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                  +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](&v56, v57);
                }

                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v51 = v33;
                long long v35 = [v33 describe];
                uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v73 count:16];
                if (v36)
                {
                  uint64_t v37 = v36;
                  uint64_t v38 = *(void *)v53;
                  do
                  {
                    for (uint64_t i = 0; i != v37; ++i)
                    {
                      if (*(void *)v53 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      uint64_t v40 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                      long long v41 = +[FedStatsLog logger];
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v72 = v40;
                        _os_log_debug_impl(&dword_24DF55000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }
                    }
                    uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v73 count:16];
                  }
                  while (v37);
                }

                id v26 = v47;
                uint64_t v11 = v48;
                uint64_t v29 = v46;
                uint64_t v28 = v49;
                id v32 = 0;
                uint64_t v33 = v51;
              }
            }
            else
            {
              uint64_t v33 = +[FedStatsLog logger];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](&v59, v60);
              }
            }

            ++v30;
          }
          while (v30 != v28);
          uint64_t v28 = [v26 countByEnumeratingWithState:&v61 objects:v74 count:16];
        }
        while (v28);
      }
    }
    else
    {
      *a5 = 2;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v16 = v9;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v66 objects:v75 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v67;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v67 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v66 + 1) + 8 * j);
            uint64_t v65 = 0;
            id v22 = [v11 encodeToBitVector:v21 possibleError:&v65];
            if (v22)
            {
              [v50 addItem:v22];
            }
            else
            {
              uint64_t v23 = +[FedStatsLog logger];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](buf, &buf[1]);
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v66 objects:v75 count:16];
        }
        while (v18);
      }
    }
    id v9 = v45;

    uint64_t v25 = [v50 getResults];

    v13 = v43;
    id v10 = v44;
  }
  else if (a6)
  {
    +[FedStatsError errorWithCode:302 underlyingError:v12 description:@"encodeDataArray encoder construction failed"];
    uint64_t v25 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v25 = 0;
  }

LABEL_53:
  return v25;
}

+ (id)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  v88[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = v14;
  if (v14)
  {
    unint64_t v16 = [v14 length];
    if (v16 >= [@"fedstats:" length]
      && ([v15 substringToIndex:objc_msgSend(@"fedstats:", "length")],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 isEqualToString:@"fedstats:"],
          v17,
          (v18 & 1) != 0))
    {
      id v19 = v15;
    }
    else
    {
      id v19 = [@"fedstats:" stringByAppendingString:v15];
    }
    uint64_t v20 = v19;
    unint64_t v21 = 0x265310000uLL;
    id v22 = +[FedStatsLog logger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.5();
    }

    id v79 = 0;
    uint64_t v80 = 0;
    uint64_t v23 = +[FedStatsDataEncoder encodeDataArray:v11 dataTypeContent:v12 resultType:&v80 errorOut:&v79];
    id v24 = v79;
    if (!v23)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:401 underlyingError:v24 description:@"encodeDataArrayAndRecord failed at encoding"];
        uint64_t v28 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v28 = 0;
      }
      goto LABEL_69;
    }
    uint64_t v25 = +[FedStatsLog logger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.4(v23, v25);
    }

    id v26 = +[FedStatsLog logger];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](v26);
    }

    id v70 = (void *)[objc_alloc(MEMORY[0x263F3A1F8]) initWithKey:v20];
    if (!v70)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:600 description:@"encodeDataArrayAndRecord failed at recorder allocation"];
        uint64_t v28 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v28 = 0;
      }
      goto LABEL_68;
    }
    if ([v13 count])
    {
      id v27 = v13;
    }
    else
    {
      uint64_t v87 = *MEMORY[0x263F3A2F0];
      v88[0] = &stru_270008ED0;
      id v27 = [NSDictionary dictionaryWithObjects:v88 forKeys:&v87 count:1];
    }
    long long v69 = v27;
    if ([v23 count])
    {
      if (v80 == 1)
      {
        id v61 = v24;
        id v66 = v11;
        long long v67 = v20;
        long long v63 = v15;
        id v64 = v13;
        id v65 = v12;
        uint64_t v30 = [MEMORY[0x263EFF9A0] dictionary];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v62 = v23;
        id v31 = v23;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v76;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v76 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void **)(*((void *)&v75 + 1) + 8 * i);
              uint64_t v37 = [v36 dimensionality];
              uint64_t v38 = [v30 objectForKey:v37];

              if (v38)
              {
                long long v39 = [v36 index];
                [v38 arrayByAddingObject:v39];
              }
              else
              {
                uint64_t v40 = (void *)MEMORY[0x263EFF8C0];
                long long v39 = [v36 index];
                [v40 arrayWithObject:v39];
              long long v41 = };
              uint64_t v42 = [v36 dimensionality];
              [v30 setObject:v41 forKey:v42];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v75 objects:v86 count:16];
          }
          while (v33);
        }

        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v43 = v30;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v71 objects:v85 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v68 = 0;
          uint64_t v46 = *(void *)v72;
          uint64_t v47 = *MEMORY[0x263F3A220];
          uint64_t v48 = *MEMORY[0x263F3A228];
          unint64_t v21 = 0x265310000uLL;
          do
          {
            for (uint64_t j = 0; j != v45; ++j)
            {
              if (*(void *)v72 != v46) {
                objc_enumerationMutation(v43);
              }
              long long v50 = *(void **)(*((void *)&v71 + 1) + 8 * j);
              long long v51 = [*(id *)(v21 + 3944) logger];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v84 = v50;
                _os_log_debug_impl(&dword_24DF55000, v51, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord recording with dimension = \"%@\"", buf, 0xCu);
              }

              long long v52 = (void *)[v69 mutableCopy];
              uint64_t v81 = v47;
              v82 = v50;
              long long v53 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
              [v52 setObject:v53 forKey:v48];

              long long v54 = [v43 objectForKey:v50];
              char v55 = [v70 record:v54 metadata:v52];

              if (v55)
              {
                char v56 = [v43 objectForKey:v50];
                v68 += [v56 count];
                unint64_t v21 = 0x265310000;
              }
              else
              {
                unint64_t v21 = 0x265310000uLL;
                char v56 = +[FedStatsLog logger];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v67;
                  _os_log_debug_impl(&dword_24DF55000, v56, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record numbers for key '%@'", buf, 0xCu);
                }
              }
            }
            uint64_t v45 = [v43 countByEnumeratingWithState:&v71 objects:v85 count:16];
          }
          while (v45);
        }
        else
        {
          uint64_t v68 = 0;
          unint64_t v21 = 0x265310000uLL;
        }

        id v12 = v65;
        id v11 = v66;
        unint64_t v15 = v63;
        id v13 = v64;
        uint64_t v20 = v67;
        id v24 = v61;
        uint64_t v23 = v62;
        uint64_t v29 = v68;
        goto LABEL_64;
      }
      if (v80 != 2)
      {
        if (a7)
        {
          long long v57 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported result type \"%lu\" in data encoder", v80);
          *a7 = +[FedStatsError errorWithCode:900 description:v57];
        }
        uint64_t v28 = 0;
        goto LABEL_67;
      }
      if ([v70 recordBitVectors:v23 metadata:v69])
      {
        uint64_t v29 = [v23 count];
LABEL_64:
        char v59 = [*(id *)(v21 + 3944) logger];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:]();
        }

        uint64_t v28 = [NSNumber numberWithUnsignedInteger:v29];
LABEL_67:

LABEL_68:
LABEL_69:

        goto LABEL_70;
      }
      id v58 = +[FedStatsLog logger];
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:]();
      }
    }
    uint64_t v29 = 0;
    goto LABEL_64;
  }
  if (a7)
  {
    +[FedStatsError errorWithCode:400 description:@"encodeDataArrayAndRecord missing collection ID key"];
    uint64_t v28 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v28 = 0;
  }
LABEL_70:

  return v28;
}

+ (id)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v11 = (void *)MEMORY[0x263EFF8C0];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  unint64_t v16 = [v11 arrayWithObjects:&v19 count:1];
  uint64_t v17 = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", v16, v14, v13, v12, a7, v19, v20);

  return v17;
}

+ (id)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  return +[FedStatsDataEncoder encodeDataArrayAndRecord:a3 dataTypeContent:a4 metadata:MEMORY[0x263EFFA78] baseKey:a5 errorOut:a6];
}

+ (id)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v9 = (void *)MEMORY[0x263EFF8C0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 arrayWithObjects:&v16 count:1];
  id v14 = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:", v13, v11, v10, a6, v16, v17);

  return v14;
}

+ (id)mutateDataTypeContent:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v15 = v11;
  uint64_t v98 = [v15 countByEnumeratingWithState:&v118 objects:v125 count:16];
  if (!v98)
  {
LABEL_150:

    id v83 = v14;
    goto LABEL_152;
  }
  uint64_t v97 = *(void *)v119;
  unint64_t v16 = 0x265310000;
  id v86 = v15;
  v92 = v14;
  while (2)
  {
    uint64_t v17 = 0;
LABEL_4:
    if (*(void *)v119 != v97) {
      objc_enumerationMutation(v15);
    }
    uint64_t v101 = v17;
    uint64_t v18 = *(void *)(*((void *)&v118 + 1) + 8 * v17);
    id v19 = [v15 objectForKey:v18];
    uint64_t v20 = (void *)[v19 mutableCopy];

    unint64_t v21 = [v20 objectForKey:@"dataType"];
    int64_t v22 = +[FedStatsDataTypeFactory dataTypeFromString:v21];

    if (v22 != 3)
    {
      long long v35 = [v15 objectForKey:v18];
      [v14 setObject:v35 forKey:v18];

      goto LABEL_121;
    }
    uint64_t v93 = v18;
    uint64_t v23 = [v20 objectForKey:@"categoryFile"];
    v99 = v20;
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v117 = 0;
        uint64_t v36 = +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:v23 requiredForCollectionKey:0 error:&v117];
        id v37 = v117;
        uint64_t v38 = v37;
        v100 = v36;
        if (v36)
        {
          if (v12)
          {
            id v116 = v37;
            uint64_t v39 = [v36 assetSpecifierValueForDataPoint:v12 error:&v116];
            id v24 = v116;

            id v27 = (void *)v39;
            if (!v39)
            {
              if (a8)
              {
                [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v23];
                uint64_t v46 = v89 = v23;
                id v27 = 0;
                *a8 = +[FedStatsError errorWithCode:400 underlyingError:v24 description:v46];

                uint64_t v23 = v89;
              }
              int v42 = 1;
              goto LABEL_45;
            }
            if (!v13)
            {
              if (a7)
              {
                *a7 = [*a7 arrayByAddingObject:v39];
              }
              int v42 = 3;
              unint64_t v16 = 0x265310000;
              goto LABEL_45;
            }
            uint64_t v40 = [v13 objectForKey:v39];
            if (v40)
            {
              id v95 = v24;
              v88 = v23;
              [v20 setObject:v40 forKey:@"categoryFile"];
              long long v41 = [NSDictionary dictionaryWithDictionary:v20];
              [v92 setObject:v41 forKey:v93];
              int v42 = 3;
            }
            else
            {
              if (!a8)
              {
                int v42 = 1;
                goto LABEL_43;
              }
              id v95 = v24;
              v88 = v23;
              long long v41 = [NSString stringWithFormat:@"No URL found for asset name '%@'", v39];
              *a8 = +[FedStatsError errorWithCode:400 description:v41];
              int v42 = 1;
            }

            uint64_t v23 = v88;
            id v24 = v95;
LABEL_43:

            goto LABEL_44;
          }
          if (!a6)
          {
            int v42 = 3;
            goto LABEL_119;
          }
          id v43 = v23;
          id v44 = *a6;
          uint64_t v39 = [v100 parameters];
          uint64_t v45 = v44;
          uint64_t v23 = v43;
          *a6 = [v45 arrayByAddingObjectsFromArray:v39];
          int v42 = 3;
        }
        else
        {
          if (!a8)
          {
            int v42 = 1;
            goto LABEL_119;
          }
          uint64_t v39 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v23];
          *a8 = +[FedStatsError errorWithCode:400 underlyingError:v38 description:v39];
          int v42 = 1;
        }
        id v24 = v38;
LABEL_44:
        id v27 = (void *)v39;
LABEL_45:
        id v14 = v92;
        goto LABEL_118;
      }
    }
    id v24 = [v20 objectForKey:@"prefixSize"];
    id v94 = v24;
    if (!v24) {
      goto LABEL_59;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v24 unsignedIntegerValue]) {
      goto LABEL_59;
    }
    uint64_t v25 = [v20 objectForKey:@"prefixTreeParameters"];
    id v26 = (void *)[v25 mutableCopy];

    v100 = v26;
    id v27 = [v26 objectForKey:@"fileName"];
    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v115 = 0;
        uint64_t v28 = +[FedStatsCategoricalTypeAssetSpecifier assetSpecifierWithKey:v27 requiredForCollectionKey:0 error:&v115];
        id v29 = v115;
        uint64_t v30 = v29;
        if (v28)
        {
          id v24 = v94;
          if (!v12)
          {
            if (!a6)
            {
LABEL_57:

              id v15 = v86;
              goto LABEL_58;
            }
            v102 = v27;
            id v48 = *a6;
            id v31 = [v28 parameters];
            *a6 = [v48 arrayByAddingObjectsFromArray:v31];
LABEL_56:

            uint64_t v20 = v99;
            id v27 = v102;
            goto LABEL_57;
          }
          v102 = v27;
          id v114 = v29;
          id v31 = [v28 assetSpecifierValueForDataPoint:v12 error:&v114];
          id v32 = v114;

          if (v31)
          {
            if (!v13)
            {
              if (a7)
              {
                *a7 = [*a7 arrayByAddingObject:v31];
              }
              uint64_t v30 = v32;
              unint64_t v16 = 0x265310000uLL;
              goto LABEL_56;
            }
            uint64_t v87 = v23;
            uint64_t v33 = [v13 objectForKey:v31];
            if (v33)
            {
              uint64_t v34 = (void *)v33;
              [v100 setObject:v33 forKey:@"fileName"];
              [v99 setObject:v100 forKey:@"prefixTreeParameters"];

              uint64_t v30 = v32;
              uint64_t v23 = v87;
              goto LABEL_56;
            }
            if (!a8) {
              goto LABEL_146;
            }
            id v49 = v12;
            long long v50 = [NSString stringWithFormat:@"No URL found for asset name '%@'", v31];
            long long v51 = +[FedStatsError errorWithCode:400 description:v50];
LABEL_145:
            *a8 = v51;

            id v12 = v49;
            unint64_t v16 = 0x265310000;
LABEL_146:
            uint64_t v23 = v87;
            goto LABEL_147;
          }
          if (a8)
          {
            uint64_t v87 = v23;
            id v49 = v12;
            long long v50 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v102];
            long long v51 = +[FedStatsError errorWithCode:400 underlyingError:v32 description:v50];
            goto LABEL_145;
          }
        }
        else
        {
          id v24 = v94;
          if (!a8)
          {
LABEL_148:

            int v42 = 1;
            id v15 = v86;
            goto LABEL_45;
          }
          v102 = v27;
          uint64_t v47 = [NSString stringWithFormat:@"Cannot process asset specifier '%@'", v27];
          *a8 = +[FedStatsError errorWithCode:400 underlyingError:v30 description:v47];
          id v31 = (void *)v47;
          uint64_t v28 = 0;
          id v32 = v30;
        }
LABEL_147:

        uint64_t v30 = v32;
        id v27 = v102;
        goto LABEL_148;
      }
    }
LABEL_58:

    id v24 = v94;
LABEL_59:
    v100 = [v20 objectForKey:@"filters"];
    if (!v100) {
      goto LABEL_81;
    }
    v90 = v23;
    v103 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v100, "count"));
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id obj = v100;
    uint64_t v52 = [obj countByEnumeratingWithState:&v110 objects:v124 count:16];
    if (!v52) {
      goto LABEL_80;
    }
    uint64_t v53 = v52;
    uint64_t v106 = *(void *)v111;
    while (2)
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v111 != v106) {
          objc_enumerationMutation(obj);
        }
        char v55 = *(void **)(*((void *)&v110 + 1) + 8 * i);
        char v56 = [v55 objectForKey:@"filterParameters"];
        long long v57 = [v55 objectForKey:@"filterVariant"];
        if (v57) {
          BOOL v58 = v56 == 0;
        }
        else {
          BOOL v58 = 1;
        }
        if (!v58)
        {
          char v59 = *(void **)(v16 + 3808);
          if (v12)
          {
            if (v13)
            {
              v60 = a6;
              id v109 = 0;
              id v61 = [v59 forVariant:v57 mutateParameters:v56 usingFieldValues:v12 assetURLs:v13 error:&v109];
              id v62 = v109;
              if (v61)
              {
                v122[0] = @"filterVariant";
                v122[1] = @"filterParameters";
                v123[0] = v57;
                v123[1] = v61;
                [NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];
                id v63 = v13;
                v65 = id v64 = v12;
                [v103 addObject:v65];

                id v12 = v64;
                id v13 = v63;

                a6 = v60;
                unint64_t v16 = 0x265310000;
LABEL_77:

                goto LABEL_78;
              }
              if (a8)
              {
                *a8 = +[FedStatsError errorWithCode:900 underlyingError:v62 description:@"Cannot modify specifiers with field values in filter variant"];
              }

              a6 = v60;
              unint64_t v16 = 0x265310000;
              id v24 = v94;
              id v27 = v103;
              goto LABEL_97;
            }
            uint64_t v67 = [v59 forVariant:v57 assetNamesInParameters:v56 usingFieldValues:v12];
            if (v67)
            {
              id v62 = (id)v67;
              *a7 = [*a7 arrayByAddingObjectsFromArray:v67];
              goto LABEL_77;
            }
            id v24 = v94;
            id v27 = v103;
            if (!a8) {
              goto LABEL_97;
            }
            long long v71 = @"Cannot extract asset names using field values from filter parameters";
          }
          else
          {
            uint64_t v66 = [v59 forVariant:v57 requiredFieldsInParameters:v56];
            if (v66)
            {
              id v62 = (id)v66;
              *a6 = [*a6 arrayByAddingObjectsFromArray:v66];
              goto LABEL_77;
            }
            id v24 = v94;
            id v27 = v103;
            if (!a8)
            {
LABEL_97:

              int v42 = 1;
              id v15 = v86;
              uint64_t v23 = v90;
              id v14 = v92;
              goto LABEL_117;
            }
            long long v71 = @"Cannot extract required fields from filter parameters";
          }
          *a8 = +[FedStatsError errorWithCode:900 description:v71];
          goto LABEL_97;
        }
LABEL_78:
      }
      uint64_t v53 = [obj countByEnumeratingWithState:&v110 objects:v124 count:16];
      if (v53) {
        continue;
      }
      break;
    }
LABEL_80:

    uint64_t v20 = v99;
    [v99 setObject:v103 forKey:@"filters"];

    id v15 = v86;
    uint64_t v23 = v90;
    id v24 = v94;
LABEL_81:
    id v27 = [v20 objectForKey:@"tokenizerVariant"];
    if (!v27) {
      goto LABEL_102;
    }
    id obj = [v20 objectForKey:@"tokenizerParameters"];
    if (!obj) {
      goto LABEL_101;
    }
    if (!v12)
    {
      uint64_t v68 = v27;
      uint64_t v72 = +[FedStatsCategoricalTypeTokenizerFactory forVariant:v27 requiredFieldsInParameters:obj];
      if (v72)
      {
        id v70 = (id)v72;
        *a6 = [*a6 arrayByAddingObjectsFromArray:v72];
        goto LABEL_100;
      }
      uint64_t v80 = a8;
      if (a8)
      {
        uint64_t v81 = @"Cannot extract required fields from tokenizer parameters";
        goto LABEL_136;
      }
LABEL_137:
      int v42 = 1;
      goto LABEL_138;
    }
    if (!v13)
    {
      uint64_t v68 = v27;
      uint64_t v73 = +[FedStatsCategoricalTypeTokenizerFactory forVariant:v27 assetNamesInParameters:obj usingFieldValues:v12];
      if (!v73)
      {
        uint64_t v80 = a8;
        if (a8)
        {
          uint64_t v81 = @"Cannot extract asset names using field values from tokenizer parameters";
LABEL_136:
          *uint64_t v80 = +[FedStatsError errorWithCode:900 description:v81];
        }
        goto LABEL_137;
      }
      id v70 = (id)v73;
      *a7 = [*a7 arrayByAddingObjectsFromArray:v73];
      unint64_t v16 = 0x265310000;
LABEL_100:

      id v27 = v68;
LABEL_101:

LABEL_102:
      id obj = [v20 objectForKey:@"preEncodingVariant"];
      if (obj)
      {
        long long v74 = [v20 objectForKey:@"preEncodingParameters"];
        if (v74)
        {
          v104 = v27;
          if (v12)
          {
            if (v13)
            {
              long long v75 = v23;
              id v107 = 0;
              long long v76 = +[FedStatsCategoricalTypePreEncoderFactory forVariant:obj mutateParameters:v74 usingFieldValues:v12 assetURLs:v13 error:&v107];
              id v77 = v107;
              if (v76)
              {
                [v20 setObject:v76 forKey:@"preEncodingParameters"];

                uint64_t v23 = v75;
                id v24 = v94;
                goto LABEL_112;
              }
              if (a8)
              {
                *a8 = +[FedStatsError errorWithCode:900 underlyingError:v77 description:@"Cannot modify specifiers with field values in pre-encoder variant"];
              }

              int v42 = 1;
              uint64_t v23 = v75;
              id v24 = v94;
LABEL_142:
              id v27 = v104;
LABEL_115:

              id v15 = v86;
              goto LABEL_116;
            }
            uint64_t v79 = +[FedStatsCategoricalTypePreEncoderFactory forVariant:obj assetNamesInParameters:v74 usingFieldValues:v12];
            if (!v79)
            {
              if (a8)
              {
                *a8 = +[FedStatsError errorWithCode:900 description:@"Cannot extract asset names using field values from pre-encoding parameters"];
              }
              int v42 = 1;
              goto LABEL_142;
            }
            id v77 = (id)v79;
            *a7 = [*a7 arrayByAddingObjectsFromArray:v79];
            unint64_t v16 = 0x265310000;
          }
          else
          {
            uint64_t v78 = +[FedStatsCategoricalTypePreEncoderFactory forVariant:obj requiredFieldsInParameters:v74];
            if (!v78)
            {
              if (a8)
              {
                *a8 = +[FedStatsError errorWithCode:900 description:@"Cannot extract required fields from pre-encoding parameters"];
              }
              int v42 = 1;
              goto LABEL_115;
            }
            id v77 = (id)v78;
            *a6 = [*a6 arrayByAddingObjectsFromArray:v78];
          }
LABEL_112:

          id v27 = v104;
        }
      }
      long long v74 = [NSDictionary dictionaryWithDictionary:v20];
      [v92 setObject:v74 forKey:v93];
      int v42 = 0;
      goto LABEL_115;
    }
    v91 = v23;
    id v108 = 0;
    uint64_t v68 = v27;
    long long v69 = +[FedStatsCategoricalTypeTokenizerFactory forVariant:v27 mutateParameters:obj usingFieldValues:v12 assetURLs:v13 error:&v108];
    id v70 = v108;
    if (v69)
    {
      [v20 setObject:v69 forKey:@"tokenizerParameters"];

      uint64_t v23 = v91;
      id v24 = v94;
      goto LABEL_100;
    }
    if (a8)
    {
      *a8 = +[FedStatsError errorWithCode:900 underlyingError:v70 description:@"Cannot modify specifiers with field values in tokenizer variant"];
    }

    int v42 = 1;
    uint64_t v23 = v91;
    id v24 = v94;
LABEL_138:
    id v27 = v68;
LABEL_116:
    id v14 = v92;
LABEL_117:

LABEL_118:
    uint64_t v38 = v24;
LABEL_119:

    if (v42 == 3 || !v42)
    {
LABEL_121:
      uint64_t v17 = v101 + 1;
      if (v101 + 1 == v98)
      {
        uint64_t v82 = [v15 countByEnumeratingWithState:&v118 objects:v125 count:16];
        uint64_t v98 = v82;
        if (!v82) {
          goto LABEL_150;
        }
        continue;
      }
      goto LABEL_4;
    }
    break;
  }

  id v83 = 0;
LABEL_152:

  return v83;
}

+ (id)mutateDataTypeContent:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 error:(id *)a6
{
  return +[FedStatsDataEncoder mutateDataTypeContent:a3 usingFieldValues:a4 assetURLs:a5 requiredFields:0 assetNames:0 error:0];
}

+ (id)extractAssetNamesFrom:(id)a3 usingFieldValues:(id)a4
{
  id v10 = (id)MEMORY[0x263EFFA68];
  id v4 = +[FedStatsDataEncoder mutateDataTypeContent:a3 usingFieldValues:a4 assetURLs:0 requiredFields:0 assetNames:&v10 error:0];
  id v5 = v10;
  id v6 = [MEMORY[0x263EFFA08] setWithArray:v5];
  uint64_t v7 = [v6 allObjects];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_localizedCompare_];

  return v8;
}

+ (id)extractRequiredFieldsFrom:(id)a3
{
  id v9 = (id)MEMORY[0x263EFFA68];
  id v3 = +[FedStatsDataEncoder mutateDataTypeContent:a3 usingFieldValues:0 assetURLs:0 requiredFields:&v9 assetNames:0 error:0];
  id v4 = v9;
  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
  id v6 = [v5 allObjects];
  uint64_t v7 = [v6 sortedArrayUsingSelector:sel_localizedCompare_];

  return v7;
}

- (NSDictionary)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(id)a3
{
}

- (NSArray)typeConfiguration
{
  return self->_typeConfiguration;
}

- (void)setTypeConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeConfiguration, 0);
  objc_storeStrong((id *)&self->_dataTypes, 0);
}

+ (void)encodeDataArray:(unsigned char *)a1 dataTypeContent:(unsigned char *)a2 resultType:errorOut:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_2(&dword_24DF55000, v2, v3, "Cannot process data point, skipping...", v4);
}

+ (void)encodeDataArray:(unsigned char *)a1 dataTypeContent:(unsigned char *)a2 resultType:errorOut:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_2(&dword_24DF55000, v2, v3, "Non-dictionary or nil in the input, skipping...", v4);
}

+ (void)encodeDataArray:(unsigned char *)a1 dataTypeContent:(unsigned char *)a2 resultType:errorOut:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_2(&dword_24DF55000, v2, v3, "Cannot encode a data point, skipping. Encountered error:", v4);
}

+ (void)encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_24DF55000, v0, v1, "Recorded %lu data", v2, v3, v4, v5, v6);
}

+ (void)encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_24DF55000, v0, v1, "encodeDataArrayAndRecord failed to record bit vectors for key '%@'", v2, v3, v4, v5, v6);
}

+ (void)encodeDataArrayAndRecord:(os_log_t)log dataTypeContent:metadata:baseKey:errorOut:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_24DF55000, log, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord encoded data array, recording", v1, 2u);
}

+ (void)encodeDataArrayAndRecord:(void *)a1 dataTypeContent:(NSObject *)a2 metadata:baseKey:errorOut:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_24DF55000, a2, OS_LOG_TYPE_DEBUG, "Encoded %lu data", v3, 0xCu);
}

+ (void)encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_24DF55000, v0, v1, "encodeDataArrayAndRecord with baseKey = \"%@\"", v2, v3, v4, v5, v6);
}

@end