@interface AMDDODMLDataProcessor
- (AMDDODMLDataProcessor)initWithActionArray:(id)a3 withAttachmentProcessor:(id)a4;
- (id)aggregateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)bindToBuffer:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)checkIfArrayEmptyAndThrowError:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)combineArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)constantValueMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)destroyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)downSampleData:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)filterArrayOnNumber:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)generateHashFromInputs:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)getCoreDictionary;
- (id)getCurrentTime:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)getElementInCoreDictionary:(id)a3;
- (id)getElementInInputDictionary:(id)a3;
- (id)getElementInNumberInputsBounds:(id)a3;
- (id)getElementsInSampleDictionary;
- (id)getInputDictionary;
- (id)hashAdamIdsToIndices:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)hashFromCoreDictionary:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)ifStatement:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)insertArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)insertRawArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)padArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)parseAndCall:(id)a3 withInputs:(id)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)processForLoop:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)processForLoopHelper:(id)a3 withNumber:(id)a4 withDictionary:(id)a5;
- (id)processRecipe:(id *)a3 errorDomain:(id)a4;
- (id)randomizeArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)replicateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)requestData:(id)a3 withUseStubs:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6;
- (id)sampleFromDistribution:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)sortArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)spliceArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)strideCopyAndSplitArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)strideCopyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)twoArrayMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (id)windowFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (int64_t)getInputSize;
- (void)resetDataProcessorWithRecipe:(id)a3;
- (void)setElementInCoreDictionary:(id)a3 withKey:(id)a4;
- (void)setElementsInCoreDictionary:(id)a3;
@end

@implementation AMDDODMLDataProcessor

- (AMDDODMLDataProcessor)initWithActionArray:(id)a3 withAttachmentProcessor:(id)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  v4 = v22;
  v22 = 0;
  v19.receiver = v4;
  v19.super_class = (Class)AMDDODMLDataProcessor;
  v18 = [(AMDDODMLDataProcessor *)&v19 init];
  v22 = v18;
  objc_storeStrong((id *)&v22, v18);
  if (v18)
  {
    objc_storeStrong((id *)&v22->_actionArray, location[0]);
    objc_storeStrong((id *)&v22->_attachmentsProcessor, v20);
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    coreDictionary = v22->_coreDictionary;
    v22->_coreDictionary = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    inputDictionary = v22->_inputDictionary;
    v22->_inputDictionary = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    numberInputsBound = v22->_numberInputsBound;
    v22->_numberInputsBound = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    elementsInSample = v22->_elementsInSample;
    v22->_elementsInSample = v11;

    v13 = (AMDClient *)objc_alloc_init((Class)AMDClient);
    myAMDClient = v22->_myAMDClient;
    v22->_myAMDClient = v13;
  }
  v16 = v22;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v16;
}

- (void)resetDataProcessorWithRecipe:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v12->_actionArray, location[0]);
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  inputDictionary = v12->_inputDictionary;
  v12->_inputDictionary = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  numberInputsBound = v12->_numberInputsBound;
  v12->_numberInputsBound = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  elementsInSample = v12->_elementsInSample;
  v12->_elementsInSample = v7;

  v9 = (AMDClient *)objc_alloc_init((Class)AMDClient);
  myAMDClient = v12->_myAMDClient;
  v12->_myAMDClient = v9;

  objc_storeStrong(location, 0);
}

- (void)setElementInCoreDictionary:(id)a3 withKey:(id)a4
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(NSMutableDictionary *)v7->_coreDictionary setObject:location[0] forKey:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)getCoreDictionary
{
  return self->_coreDictionary;
}

- (void)setElementsInCoreDictionary:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  id v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v7);
      v3 = v14;
      id v4 = [location[0] objectForKey:v12];
      -[AMDDODMLDataProcessor setElementInCoreDictionary:withKey:](v3, "setElementInCoreDictionary:withKey:");

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0;
        id v8 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(location, 0);
}

- (id)getElementInCoreDictionary:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(NSMutableDictionary *)v6->_coreDictionary objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)getElementInInputDictionary:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(NSMutableDictionary *)v6->_inputDictionary objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)getElementInNumberInputsBounds:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(NSMutableDictionary *)v6->_numberInputsBound objectForKey:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)getInputDictionary
{
  return self->_inputDictionary;
}

- (int64_t)getInputSize
{
  v15 = self;
  SEL v14 = a2;
  int64_t v13 = -1;
  memset(__b, 0, sizeof(__b));
  id obj = v15->_numberInputsBound;
  id v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v7);
      id v3 = [(NSMutableDictionary *)v15->_numberInputsBound objectForKey:v12];
      id v4 = [v3 longValue];

      if ((uint64_t)v4 < v13 || v13 == -1) {
        int64_t v13 = (int64_t)v4;
      }
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0;
        id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  return v13;
}

- (id)getElementsInSampleDictionary
{
  return self->_elementsInSample;
}

- (id)processRecipe:(id *)a3 errorDomain:(id)a4
{
  v15 = self;
  SEL v14 = a2;
  int64_t v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v6 = i;
    if (v6 >= [(NSArray *)v15->_actionArray count]) {
      break;
    }
    id v10 = [(NSArray *)v15->_actionArray objectAtIndex:i];
    id v9 = [v10 objectForKey:FunctionName];
    id v8 = [(AMDDODMLDataProcessor *)v15 parseAndCall:v9 withInputs:v10 error:v13 errorDomain:location];
    if (v8)
    {
      int v7 = 0;
    }
    else
    {
      v16 = 0;
      int v7 = 1;
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    if (v7) {
      goto LABEL_9;
    }
  }
  v16 = +[NSNumber numberWithLong:1];
LABEL_9:
  objc_storeStrong(&location, 0);
  id v4 = v16;

  return v4;
}

- (id)parseAndCall:(id)a3 withInputs:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  SEL v14 = a5;
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  if ([location[0] isEqual:AggregateArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 aggregateArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:BindToBuffer])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 bindToBuffer:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:CheckIfArrayEmptyAndThrowError])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 checkIfArrayEmptyAndThrowError:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:CombineArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 combineArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:ConstantValueMathFunction])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 constantValueMathFunction:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:DownSampleData])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 downSampleData:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:DestroyArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 destroyArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:FilterArrayOnNumber])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 filterArrayOnNumber:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:IfStatement])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 ifStatement:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:GenerateHashFromInputs])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 generateHashFromInputs:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:GetCurrentTime])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 getCurrentTime:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:HashAdamIdsToIndices])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 hashAdamIdsToIndices:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:HashFromCoreDictionary])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 hashFromCoreDictionary:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:InsertArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 insertArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:InsertRawArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 insertRawArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:PadArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 padArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:ProcessForLoop])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 processForLoop:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:RandomizeArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 randomizeArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:ReplicateArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 replicateArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:RequestData])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 requestData:v15 withUseStubs:0 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:RequestDummyData])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 requestData:v15 withUseStubs:1 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:SampleFromDistribution])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 sampleFromDistribution:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:SortArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 sortArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:SpliceArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 spliceArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:StrideCopyAndSplitArray])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 strideCopyAndSplitArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:StrideArrayCopy])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 strideCopyArray:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:TwoArrayMathFunction])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 twoArrayMathFunction:v15 error:v14 errorDomain:v13];
  }
  else if ([location[0] isEqual:WindowFunction])
  {
    id v18 = [(AMDDODMLDataProcessor *)v17 windowFunction:v15 error:v14 errorDomain:v13];
  }
  else
  {
    id v6 = objc_alloc((Class)NSError);
    id v7 = [v6 initWithDomain:v13 code:24 userInfo:0];
    id *v14 = v7;
    id v18 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v8 = v18;

  return v8;
}

- (id)processForLoopHelper:(id)a3 withNumber:(id)a4 withDictionary:(id)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v32 = 0;
  objc_storeStrong(&v32, a4);
  id v31 = 0;
  objc_storeStrong(&v31, a5);
  memset(__b, 0, sizeof(__b));
  id v24 = v31;
  id v25 = [v24 countByEnumeratingWithState:__b objects:v34 count:16];
  if (v25)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0;
    id v21 = v25;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(v24);
      }
      uint64_t v30 = *(void *)(__b[1] + 8 * v20);
      id v28 = [v31 objectForKey:v30];
      id v27 = [v28 objectForKey:Multiplier];
      id v26 = [v28 objectForKey:Adder];
      [v32 doubleValue];
      double v13 = v5;
      [v27 doubleValue];
      double v12 = v6;
      [v26 doubleValue];
      id v15 = location[0];
      uint64_t v14 = v30;
      v17 = +[NSNumber numberWithDouble:v7 + v13 * v12];
      v16 = [(NSNumber *)v17 stringValue];
      id v8 = objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v14);
      id v9 = location[0];
      location[0] = v8;

      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      ++v20;
      if (v18 + 1 >= (unint64_t)v21)
      {
        uint64_t v20 = 0;
        id v21 = [v24 countByEnumeratingWithState:__b objects:v34 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  id v11 = location[0];
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);

  return v11;
}

- (id)processForLoop:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  v93 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v91 = a4;
  id v90 = 0;
  objc_storeStrong(&v90, a5);
  id v89 = [location[0] objectForKey:Starting];
  id v88 = [location[0] objectForKey:Ending];
  id v87 = [location[0] objectForKey:StartingLikeOtherArray];
  id v86 = [location[0] objectForKey:EndingLikeOtherArray];
  if (!v87) {
    goto LABEL_75;
  }
  id v85 = [(NSMutableDictionary *)v93->_coreDictionary objectForKey:v87];
  id v84 = [location[0] objectForKey:StartingLikeOtherArrayMultiplier];
  id v83 = [location[0] objectForKey:StartingLikeOtherArrayOffset];
  if (v85 && v84 && v83)
  {
    double v7 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v83 longValue]+ (void)objc_msgSend(v85, "count") * (void)objc_msgSend(v84, "longValue"));
    id v8 = v89;
    id v89 = v7;

    int v82 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v90 code:47 userInfo:0];
    id *v91 = v6;
    v94 = 0;
    int v82 = 1;
  }
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v85, 0);
  if (!v82)
  {
LABEL_75:
    if (!v86) {
      goto LABEL_15;
    }
    id v81 = [(NSMutableDictionary *)v93->_coreDictionary objectForKey:v86];
    id v80 = [location[0] objectForKey:EndingLikeOtherArrayMultiplier];
    id v79 = [location[0] objectForKey:EndingLikeOtherArrayOffset];
    if (v81 && v80 && v79)
    {
      id v11 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v79 longValue]+ (void)objc_msgSend(v81, "count") * (void)objc_msgSend(v80, "longValue"));
      id v12 = v88;
      id v88 = v11;

      int v82 = 0;
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:v90 code:146 userInfo:0];
      id *v91 = v10;
      v94 = 0;
      int v82 = 1;
    }
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v81, 0);
    if (!v82)
    {
LABEL_15:
      id v78 = [location[0] objectForKey:InsideLoop];
      for (uint64_t i = (int)[v89 intValue]; ; ++i)
      {
        uint64_t v47 = i;
        if (v47 >= (int)[v88 intValue]) {
          break;
        }
        id v76 = +[NSNumber numberWithLong:i];
        for (unint64_t j = 0; ; ++j)
        {
          unint64_t v46 = j;
          if (v46 >= (unint64_t)[v78 count]) {
            break;
          }
          id v74 = [v78 objectAtIndex:j];
          id v73 = [v74 objectForKey:OverrideKey];
          id v72 = [v74 objectForKey:OverrideNumberKeys];
          if (!v73)
          {
            id v13 = objc_alloc_init((Class)NSDictionary);
            id v14 = v73;
            id v73 = v13;
          }
          if (!v72)
          {
            id v15 = objc_alloc_init((Class)NSDictionary);
            id v16 = v72;
            id v72 = v15;
          }
          id v71 = objc_alloc_init((Class)NSMutableDictionary);
          memset(__b, 0, sizeof(__b));
          id v44 = v74;
          id v45 = [v44 countByEnumeratingWithState:__b objects:v97 count:16];
          if (v45)
          {
            uint64_t v41 = *(void *)__b[2];
            uint64_t v42 = 0;
            id v43 = v45;
            while (1)
            {
              uint64_t v40 = v42;
              if (*(void *)__b[2] != v41) {
                objc_enumerationMutation(v44);
              }
              uint64_t v70 = *(void *)(__b[1] + 8 * v42);
              id v68 = [v74 objectForKey:v70];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v65 = v68;
                memset(v63, 0, sizeof(v63));
                id v38 = v72;
                id v39 = [v38 countByEnumeratingWithState:v63 objects:v96 count:16];
                if (v39)
                {
                  uint64_t v35 = *(void *)v63[2];
                  uint64_t v36 = 0;
                  id v37 = v39;
                  while (1)
                  {
                    uint64_t v34 = v36;
                    if (*(void *)v63[2] != v35) {
                      objc_enumerationMutation(v38);
                    }
                    id v64 = *(id *)(v63[1] + 8 * v36);
                    if ([v64 isEqual:v70])
                    {
                      id v62 = [v72 objectForKey:v64];
                      id v61 = [v62 objectForKey:Multiplier];
                      id v60 = [v62 objectForKey:Adder];
                      double v59 = 0.0;
                      [v76 doubleValue];
                      double v59 = v17;
                      double v33 = v17;
                      [v61 doubleValue];
                      double v32 = v18;
                      [v60 doubleValue];
                      double v59 = v19 + v33 * v32;
                      uint64_t v20 = +[NSNumber numberWithDouble:v59];
                      id v21 = v65;
                      id v65 = v20;

                      objc_storeStrong(&v60, 0);
                      objc_storeStrong(&v61, 0);
                      objc_storeStrong(&v62, 0);
                    }
                    ++v36;
                    if (v34 + 1 >= (unint64_t)v37)
                    {
                      uint64_t v36 = 0;
                      id v37 = [v38 countByEnumeratingWithState:v63 objects:v96 count:16];
                      if (!v37) {
                        break;
                      }
                    }
                  }
                }

                [v71 setObject:v65 forKey:v70];
                objc_storeStrong(&v65, 0);
                goto LABEL_53;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v58 = v68;
                id v57 = objc_alloc_init((Class)NSMutableDictionary);
                memset(v55, 0, sizeof(v55));
                id v30 = v58;
                id v31 = [v30 countByEnumeratingWithState:v55 objects:v95 count:16];
                if (v31)
                {
                  uint64_t v27 = *(void *)v55[2];
                  uint64_t v28 = 0;
                  id v29 = v31;
                  while (1)
                  {
                    uint64_t v26 = v28;
                    if (*(void *)v55[2] != v27) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v56 = *(void *)(v55[1] + 8 * v28);
                    id v54 = [(AMDDODMLDataProcessor *)v93 processForLoopHelper:v56 withNumber:v76 withDictionary:v73];
                    id v53 = [v58 objectForKey:v56];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v52 = [(AMDDODMLDataProcessor *)v93 processForLoopHelper:v53 withNumber:v76 withDictionary:v73];
                      [v57 setObject:v52 forKey:v54];
                      objc_storeStrong(&v52, 0);
                    }
                    else
                    {
                      [v57 setObject:v53 forKey:v54];
                    }
                    objc_storeStrong(&v53, 0);
                    objc_storeStrong(&v54, 0);
                    ++v28;
                    if (v26 + 1 >= (unint64_t)v29)
                    {
                      uint64_t v28 = 0;
                      id v29 = [v30 countByEnumeratingWithState:v55 objects:v95 count:16];
                      if (!v29) {
                        break;
                      }
                    }
                  }
                }

                [v71 setObject:v57 forKey:v70];
                objc_storeStrong(&v57, 0);
                objc_storeStrong(&v58, 0);
                goto LABEL_53;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v71 setObject:v68 forKey:v70];
                goto LABEL_53;
              }
              id v22 = objc_alloc((Class)NSError);
              id v23 = [v22 initWithDomain:v90 code:147 userInfo:0];
              id *v91 = v23;
              v94 = 0;
              int v82 = 1;
LABEL_54:
              objc_storeStrong(&v68, 0);
              if (v82) {
                goto LABEL_58;
              }
              ++v42;
              if (v40 + 1 >= (unint64_t)v43)
              {
                uint64_t v42 = 0;
                id v43 = [v44 countByEnumeratingWithState:__b objects:v97 count:16];
                if (!v43) {
                  goto LABEL_57;
                }
              }
            }
            id v67 = v68;
            id v66 = [(AMDDODMLDataProcessor *)v93 processForLoopHelper:v67 withNumber:v76 withDictionary:v73];
            [v71 setObject:v66 forKey:v70];
            objc_storeStrong(&v66, 0);
            objc_storeStrong(&v67, 0);
LABEL_53:
            int v82 = 0;
            goto LABEL_54;
          }
LABEL_57:
          int v82 = 0;
LABEL_58:

          if (!v82)
          {
            id v51 = [v71 objectForKey:FunctionName];
            id v50 = [(AMDDODMLDataProcessor *)v93 parseAndCall:v51 withInputs:v71 error:v91 errorDomain:v90];
            if (v50)
            {
              int v82 = 0;
            }
            else
            {
              v94 = 0;
              int v82 = 1;
            }
            objc_storeStrong(&v50, 0);
            objc_storeStrong(&v51, 0);
          }
          objc_storeStrong(&v71, 0);
          objc_storeStrong(&v72, 0);
          objc_storeStrong(&v73, 0);
          objc_storeStrong(&v74, 0);
          if (v82) {
            goto LABEL_66;
          }
        }
        int v82 = 0;
LABEL_66:
        objc_storeStrong(&v76, 0);
        if (v82) {
          goto LABEL_69;
        }
      }
      v94 = +[NSNumber numberWithLong:1];
      int v82 = 1;
LABEL_69:
      objc_storeStrong(&v78, 0);
    }
  }
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v90, 0);
  objc_storeStrong(location, 0);
  id v24 = v94;

  return v24;
}

- (id)aggregateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  double v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = a4;
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = [location[0] objectForKey:InputArray];
  id v27 = [location[0] objectForKey:OutputArray];
  id v26 = [location[0] objectForKey:AggregationMethod];
  if (v28 && v27 && v26)
  {
    id v24 = [(NSMutableDictionary *)v32->_coreDictionary objectForKey:v28];
    if (v24)
    {
      id v23 = objc_alloc_init((Class)NSMutableArray);
      if ([v26 isEqual:AggregateSum])
      {
        double v22 = 0.0;
        for (unint64_t i = 0; i < (unint64_t)[v24 count]; ++i)
        {
          id v16 = [v24 objectAtIndex:i];
          [v16 doubleValue];
          double v22 = v22 + v9;
        }
        id v15 = +[NSNumber numberWithDouble:v22];
        objc_msgSend(v23, "addObject:");
      }
      else if ([v26 isEqual:AggregateAverage])
      {
        double v20 = 0.0;
        for (unint64_t j = 0; j < (unint64_t)[v24 count]; ++j)
        {
          id v14 = [v24 objectAtIndex:j];
          [v14 doubleValue];
          double v20 = v20 + v10;
        }
        id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20 / (double)(unint64_t)[v24 count]);
        objc_msgSend(v23, "addObject:");
      }
      [(NSMutableDictionary *)v32->_coreDictionary setObject:v23 forKey:v27];
      double v33 = +[NSNumber numberWithLong:1];
      int v25 = 1;
      objc_storeStrong(&v23, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v29 code:142 userInfo:0];
      *id v30 = v8;
      double v33 = 0;
      int v25 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v29 code:141 userInfo:0];
    *id v30 = v6;
    double v33 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  id v11 = v33;

  return v11;
}

- (id)bindToBuffer:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  double v32 = a4;
  id v31 = 0;
  objc_storeStrong(&v31, a5);
  id v30 = [location[0] objectForKey:InputArray];
  id v29 = [location[0] objectForKey:OutputArray];
  id v28 = [location[0] objectForKey:ElementsInSample];
  if (v30 && v29 && v28)
  {
    id v26 = [(NSMutableDictionary *)v34->_coreDictionary objectForKey:v30];
    if (v26)
    {
      id v16 = [v26 count];
      if (v16 >= [v28 longValue])
      {
        id v25 = objc_alloc_init((Class)NSMutableData);
        uint64_t v24 = (uint64_t)[v26 count];
        uint64_t v23 = v24 % (uint64_t)[v28 longValue];
        uint64_t v22 = (v24 - v23) / (uint64_t)[v28 longValue];
        for (uint64_t i = 0; i < v24 - v23; ++i)
        {
          id v20 = [v26 objectAtIndex:i];
          int v19 = 0;
          [v20 floatValue];
          int v19 = v11;
          [v25 appendBytes:&v19 length:4];
          objc_storeStrong(&v20, 0);
        }
        numberInputsBound = v34->_numberInputsBound;
        id v15 = +[NSNumber numberWithLong:v22];
        -[NSMutableDictionary setObject:forKey:](numberInputsBound, "setObject:forKey:");

        [(NSMutableDictionary *)v34->_elementsInSample setObject:v28 forKey:v29];
        [(NSMutableDictionary *)v34->_inputDictionary setObject:v25 forKey:v29];
        uint64_t v35 = +[NSNumber numberWithLong:1];
        int v27 = 1;
        objc_storeStrong(&v25, 0);
      }
      else
      {
        id v9 = objc_alloc((Class)NSError);
        id v10 = [v9 initWithDomain:v31 code:92 userInfo:0];
        *double v32 = v10;
        uint64_t v35 = 0;
        int v27 = 1;
      }
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v31 code:27 userInfo:0];
      *double v32 = v8;
      uint64_t v35 = 0;
      int v27 = 1;
    }
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v31 code:38 userInfo:0];
    *double v32 = v6;
    uint64_t v35 = 0;
    int v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  id v12 = v35;

  return v12;
}

- (id)checkIfArrayEmptyAndThrowError:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v19 = a4;
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = [location[0] objectForKey:InputArray];
  if (v17)
  {
    id v15 = [(NSMutableDictionary *)v21->_coreDictionary objectForKey:v17];
    if (v15)
    {
      if ([v15 count])
      {
        uint64_t v22 = +[NSNumber numberWithLong:1];
      }
      else
      {
        id v9 = objc_alloc((Class)NSError);
        id v10 = [v9 initWithDomain:v18 code:97 userInfo:0];
        *int v19 = v10;
        uint64_t v22 = 0;
      }
      int v16 = 1;
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v18 code:98 userInfo:0];
      *int v19 = v8;
      uint64_t v22 = 0;
      int v16 = 1;
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v18 code:99 userInfo:0];
    *int v19 = v6;
    uint64_t v22 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  int v11 = v22;

  return v11;
}

- (id)combineArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  int v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = a4;
  id v24 = 0;
  objc_storeStrong(&v24, a5);
  id v23 = [location[0] objectForKey:InputArray];
  id v22 = [location[0] objectForKey:SecondArray];
  id v21 = [location[0] objectForKey:OutputArray];
  if (v23 && v21 && v22)
  {
    id v19 = [(NSMutableDictionary *)v27->_coreDictionary objectForKey:v23];
    id v18 = [(NSMutableDictionary *)v27->_coreDictionary objectForKey:v22];
    if (v19 && v18)
    {
      id v17 = objc_alloc_init((Class)NSMutableArray);
      for (unint64_t i = 0; i < (unint64_t)[v19 count]; ++i)
      {
        id v12 = [v19 objectAtIndex:i];
        objc_msgSend(v17, "addObject:");
      }
      for (unint64_t j = 0; j < (unint64_t)[v18 count]; ++j)
      {
        id v11 = [v18 objectAtIndex:j];
        objc_msgSend(v17, "addObject:");
      }
      [(NSMutableDictionary *)v27->_coreDictionary setObject:v17 forKey:v21];
      id v28 = +[NSNumber numberWithLong:1];
      int v20 = 1;
      objc_storeStrong(&v17, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v24 code:28 userInfo:0];
      *id v25 = v8;
      id v28 = 0;
      int v20 = 1;
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v24 code:39 userInfo:0];
    *id v25 = v6;
    id v28 = 0;
    int v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  id v9 = v28;

  return v9;
}

- (id)destroyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = a4;
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v15 = [location[0] objectForKey:InputArray];
  if (v15)
  {
    id v13 = [(NSMutableDictionary *)v19->_coreDictionary objectForKey:v15];
    if (v13)
    {
      [(NSMutableDictionary *)v19->_coreDictionary removeObjectForKey:v15];
      int v20 = +[NSNumber numberWithLong:1];
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v16 code:37 userInfo:0];
      id *v17 = v8;
      int v20 = 0;
    }
    int v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v16 code:57 userInfo:0];
    id *v17 = v6;
    int v20 = 0;
    int v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  id v9 = v20;

  return v9;
}

- (id)downSampleData:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  v108 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v106 = a4;
  id v105 = 0;
  objc_storeStrong(&v105, a5);
  id v104 = [location[0] objectForKey:InputArray];
  id v103 = [location[0] objectForKey:OutputArray];
  id v102 = [location[0] objectForKey:DefaultRatio];
  id v101 = [location[0] objectForKey:Mapping];
  *((void *)&v100 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&long long v100 = [location[0] objectForKey:OtherAffectedVectors];
  if (v100 == 0)
  {
    *((void *)&v100 + 1) = objc_alloc_init((Class)NSDictionary);

    *(void *)&long long v100 = objc_alloc_init((Class)NSDictionary);
LABEL_31:
    if (v104 && v103 && v101 && v102 && *((void *)&v100 + 1) && (void)v100)
    {
      id v93 = [(AMDDODMLAttachmentProcessor *)v108->_attachmentsProcessor downSampleDictionaryForKey:v101];
      if (v93)
      {
        id v92 = [(NSMutableDictionary *)v108->_coreDictionary objectForKey:v104];
        if (v92)
        {
          id v91 = objc_alloc_init((Class)NSMutableDictionary);
          memset(v89, 0, sizeof(v89));
          id v51 = *((id *)&v100 + 1);
          id v52 = [v51 countByEnumeratingWithState:v89 objects:v112 count:16];
          if (v52)
          {
            uint64_t v48 = *(void *)v89[2];
            uint64_t v49 = 0;
            id v50 = v52;
            while (1)
            {
              uint64_t v47 = v49;
              if (*(void *)v89[2] != v48) {
                objc_enumerationMutation(v51);
              }
              uint64_t v90 = *(void *)(v89[1] + 8 * v49);
              id v88 = [*((id *)&v100 + 1) objectForKey:v90];
              id v45 = v91;
              id v46 = objc_alloc_init((Class)NSMutableArray);
              objc_msgSend(v45, "setObject:forKey:");

              objc_storeStrong(&v88, 0);
              ++v49;
              if (v47 + 1 >= (unint64_t)v50)
              {
                uint64_t v49 = 0;
                id v50 = [v51 countByEnumeratingWithState:v89 objects:v112 count:16];
                if (!v50) {
                  break;
                }
              }
            }
          }

          id v87 = objc_alloc_init((Class)NSMutableArray);
          for (unint64_t i = 0; ; ++i)
          {
            unint64_t v44 = i;
            if (v44 >= (unint64_t)[v92 count]) {
              break;
            }
            id v85 = [v92 objectAtIndex:i];
            id v84 = [v93 objectForKey:v85];
            if (!v84) {
              objc_storeStrong(&v84, v102);
            }
            double v83 = 0.0;
            [v84 doubleValue];
            double v83 = v21;
            double v82 = 0.0;
            double v82 = (double)(arc4random() % 0x80000000) / 2147483650.0;
            if (v82 >= v83) {
              goto LABEL_70;
            }
            [v87 addObject:v85];
            memset(v80, 0, sizeof(v80));
            id v42 = *((id *)&v100 + 1);
            id v43 = [v42 countByEnumeratingWithState:v80 objects:v111 count:16];
            if (v43)
            {
              uint64_t v39 = *(void *)v80[2];
              uint64_t v40 = 0;
              id v41 = v43;
              while (1)
              {
                uint64_t v38 = v40;
                if (*(void *)v80[2] != v39) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v81 = *(void *)(v80[1] + 8 * v40);
                id v79 = [(id)v100 objectForKey:v81];
                id v78 = [*((id *)&v100 + 1) objectForKey:v81];
                id v77 = [v91 objectForKey:v78];
                for (uint64_t j = 0; ; ++j)
                {
                  uint64_t v37 = j;
                  if (v37 >= (uint64_t)[v79 longValue]) {
                    break;
                  }
                  unint64_t v75 = 0;
                  unint64_t v35 = i;
                  id v22 = [v79 longValue];
                  unint64_t v75 = v35 * (void)v22 + j;
                  id v74 = [(NSMutableDictionary *)v108->_coreDictionary objectForKey:v81];
                  unint64_t v36 = v75;
                  if (v36 < (unint64_t)[v74 count])
                  {
                    id v73 = [v74 objectAtIndex:v75];
                    [v77 addObject:v73];
                    objc_storeStrong(&v73, 0);
                    int v99 = 0;
                  }
                  else
                  {
                    id v23 = objc_alloc((Class)NSError);
                    id v24 = [v23 initWithDomain:v105 code:25 userInfo:0];
                    id *v106 = v24;
                    v109 = 0;
                    int v99 = 1;
                  }
                  objc_storeStrong(&v74, 0);
                  if (v99) {
                    goto LABEL_65;
                  }
                }
                int v99 = 0;
LABEL_65:
                objc_storeStrong(&v77, 0);
                objc_storeStrong(&v78, 0);
                objc_storeStrong(&v79, 0);
                if (v99) {
                  break;
                }
                ++v40;
                if (v38 + 1 >= (unint64_t)v41)
                {
                  uint64_t v40 = 0;
                  id v41 = [v42 countByEnumeratingWithState:v80 objects:v111 count:16];
                  if (!v41) {
                    goto LABEL_68;
                  }
                }
              }
            }
            else
            {
LABEL_68:
              int v99 = 0;
            }

            if (!v99) {
LABEL_70:
            }
              int v99 = 0;
            objc_storeStrong(&v84, 0);
            objc_storeStrong(&v85, 0);
            if (v99) {
              goto LABEL_80;
            }
          }
          memset(v71, 0, sizeof(v71));
          id v33 = v91;
          id v34 = [v33 countByEnumeratingWithState:v71 objects:v110 count:16];
          if (v34)
          {
            uint64_t v30 = *(void *)v71[2];
            uint64_t v31 = 0;
            id v32 = v34;
            while (1)
            {
              uint64_t v29 = v31;
              if (*(void *)v71[2] != v30) {
                objc_enumerationMutation(v33);
              }
              uint64_t v72 = *(void *)(v71[1] + 8 * v31);
              coreDictionary = v108->_coreDictionary;
              id v28 = [v91 objectForKey:v72];
              -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

              ++v31;
              if (v29 + 1 >= (unint64_t)v32)
              {
                uint64_t v31 = 0;
                id v32 = [v33 countByEnumeratingWithState:v71 objects:v110 count:16];
                if (!v32) {
                  break;
                }
              }
            }
          }

          [(NSMutableDictionary *)v108->_coreDictionary setObject:v87 forKey:v103];
          v109 = +[NSNumber numberWithLong:1];
          int v99 = 1;
LABEL_80:
          objc_storeStrong(&v87, 0);
          objc_storeStrong(&v91, 0);
        }
        else
        {
          id v19 = objc_alloc((Class)NSError);
          id v20 = [v19 initWithDomain:v105 code:29 userInfo:0];
          id *v106 = v20;
          v109 = 0;
          int v99 = 1;
        }
        objc_storeStrong(&v92, 0);
      }
      else
      {
        id v17 = objc_alloc((Class)NSError);
        id v18 = [v17 initWithDomain:v105 code:21 userInfo:0];
        id *v106 = v18;
        v109 = 0;
        int v99 = 1;
      }
      objc_storeStrong(&v93, 0);
    }
    else
    {
      id v15 = objc_alloc((Class)NSError);
      id v16 = [v15 initWithDomain:v105 code:40 userInfo:0];
      id *v106 = v16;
      v109 = 0;
      int v99 = 1;
    }
    goto LABEL_83;
  }
  if (!*((void *)&v100 + 1) || !(void)v100)
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v105 code:40 userInfo:0];
    id *v106 = v6;
    v109 = 0;
    int v99 = 1;
    goto LABEL_83;
  }
  memset(__b, 0, sizeof(__b));
  id v67 = *((id *)&v100 + 1);
  id v68 = [v67 countByEnumeratingWithState:__b objects:v114 count:16];
  if (v68)
  {
    uint64_t v64 = *(void *)__b[2];
    uint64_t v65 = 0;
    id v66 = v68;
    while (1)
    {
      uint64_t v63 = v65;
      if (*(void *)__b[2] != v64) {
        objc_enumerationMutation(v67);
      }
      uint64_t v98 = *(void *)(__b[1] + 8 * v65);
      id v7 = [(id)v100 objectForKey:v98];
      BOOL v62 = v7 != 0;

      if (!v62) {
        break;
      }
      id v60 = [(id)v100 objectForKey:v98];
      BOOL v61 = (uint64_t)[v60 longValue] >= 1;

      if (!v61) {
        break;
      }
      ++v65;
      if (v63 + 1 >= (unint64_t)v66)
      {
        uint64_t v65 = 0;
        id v66 = [v67 countByEnumeratingWithState:__b objects:v114 count:16];
        if (!v66) {
          goto LABEL_15;
        }
      }
    }
    id v8 = objc_alloc((Class)NSError);
    id v9 = [v8 initWithDomain:v105 code:40 userInfo:0];
    id *v106 = v9;
    v109 = 0;
    int v99 = 1;
  }
  else
  {
LABEL_15:
    int v99 = 0;
  }

  if (!v99)
  {
    memset(v95, 0, sizeof(v95));
    id v58 = (id)v100;
    id v59 = [v58 countByEnumeratingWithState:v95 objects:v113 count:16];
    if (v59)
    {
      uint64_t v55 = *(void *)v95[2];
      uint64_t v56 = 0;
      id v57 = v59;
      while (1)
      {
        uint64_t v54 = v56;
        if (*(void *)v95[2] != v55) {
          objc_enumerationMutation(v58);
        }
        uint64_t v96 = *(void *)(v95[1] + 8 * v56);
        id v10 = [*((id *)&v100 + 1) objectForKey:v96];
        BOOL v53 = v10 != 0;

        if (!v53) {
          break;
        }
        id v94 = [(NSMutableDictionary *)v108->_coreDictionary objectForKey:v96];
        if (v94)
        {
          int v99 = 0;
        }
        else
        {
          id v13 = objc_alloc((Class)NSError);
          id v14 = [v13 initWithDomain:v105 code:29 userInfo:0];
          id *v106 = v14;
          v109 = 0;
          int v99 = 1;
        }
        objc_storeStrong(&v94, 0);
        if (v99) {
          goto LABEL_30;
        }
        ++v56;
        if (v54 + 1 >= (unint64_t)v57)
        {
          uint64_t v56 = 0;
          id v57 = [v58 countByEnumeratingWithState:v95 objects:v113 count:16];
          if (!v57) {
            goto LABEL_29;
          }
        }
      }
      id v11 = objc_alloc((Class)NSError);
      id v12 = [v11 initWithDomain:v105 code:40 userInfo:0];
      id *v106 = v12;
      v109 = 0;
      int v99 = 1;
    }
    else
    {
LABEL_29:
      int v99 = 0;
    }
LABEL_30:

    if (!v99) {
      goto LABEL_31;
    }
  }
LABEL_83:
  objc_storeStrong((id *)&v100, 0);
  objc_storeStrong((id *)&v100 + 1, 0);
  objc_storeStrong(&v101, 0);
  objc_storeStrong(&v102, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&v104, 0);
  objc_storeStrong(&v105, 0);
  objc_storeStrong(location, 0);
  id v25 = v109;

  return v25;
}

- (id)constantValueMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  BOOL v53 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v51 = a4;
  id v50 = 0;
  objc_storeStrong(&v50, a5);
  id v49 = [location[0] objectForKey:InputArray];
  id v48 = [location[0] objectForKey:OutputArray];
  id v47 = [location[0] objectForKey:ConstantValue];
  id v46 = [location[0] objectForKey:Operation];
  if (!v49
    || !v48
    || !v47
    || !v46
    || ([v47 doubleValue], v5 == 0.0)
    && (([v46 isEqual:Modulo] & 1) != 0
     || ([v46 isEqual:Division] & 1) != 0))
  {
    id v6 = objc_alloc((Class)NSError);
    id v7 = [v6 initWithDomain:v50 code:86 userInfo:0];
    *id v51 = v7;
    uint64_t v54 = 0;
    int v45 = 1;
    goto LABEL_31;
  }
  id v44 = [(NSMutableDictionary *)v53->_coreDictionary objectForKey:v49];
  if (!v44)
  {
    id v8 = objc_alloc((Class)NSError);
    id v9 = [v8 initWithDomain:v50 code:85 userInfo:0];
    *id v51 = v9;
    uint64_t v54 = 0;
    int v45 = 1;
    goto LABEL_30;
  }
  id v43 = objc_alloc_init((Class)NSMutableArray);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v37 = i;
    if (v37 >= (unint64_t)[v44 count]) {
      break;
    }
    id v41 = [v44 objectAtIndex:i];
    id v40 = 0;
    if ([v46 isEqual:Modulo])
    {
      uint64_t v36 = (uint64_t)[v41 longValue];
      id v10 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v36 % (uint64_t)[v47 longValue]);
      id v11 = v40;
      id v40 = v10;
    }
    else if ([v46 isEqual:Division])
    {
      [v41 doubleValue];
      double v35 = v12;
      [v47 doubleValue];
      id v14 = +[NSNumber numberWithDouble:v35 / v13];
      id v15 = v40;
      id v40 = v14;
    }
    else if ([v46 isEqual:Multiplication])
    {
      [v41 doubleValue];
      double v34 = v16;
      [v47 doubleValue];
      id v18 = +[NSNumber numberWithDouble:v34 * v17];
      id v19 = v40;
      id v40 = v18;
    }
    else if ([v46 isEqual:Addition])
    {
      [v41 doubleValue];
      double v33 = v20;
      [v47 doubleValue];
      id v22 = +[NSNumber numberWithDouble:v33 + v21];
      id v23 = v40;
      id v40 = v22;
    }
    else
    {
      if (([v46 isEqual:Subtraction] & 1) == 0)
      {
        id v28 = objc_alloc((Class)NSError);
        id v29 = [v28 initWithDomain:v50 code:83 userInfo:0];
        *id v51 = v29;
        uint64_t v54 = 0;
        int v45 = 1;
        goto LABEL_26;
      }
      [v41 doubleValue];
      double v32 = v24;
      [v47 doubleValue];
      id v26 = +[NSNumber numberWithDouble:v32 - v25];
      id v27 = v40;
      id v40 = v26;
    }
    [v43 addObject:v40];
    int v45 = 0;
LABEL_26:
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
    if (v45) {
      goto LABEL_29;
    }
  }
  [(NSMutableDictionary *)v53->_coreDictionary setObject:v43 forKey:v48];
  uint64_t v54 = +[NSNumber numberWithLong:1];
  int v45 = 1;
LABEL_29:
  objc_storeStrong(&v43, 0);
LABEL_30:
  objc_storeStrong(&v44, 0);
LABEL_31:
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  uint64_t v30 = v54;

  return v30;
}

- (id)filterArrayOnNumber:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  v121 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v119 = a4;
  id v118 = 0;
  objc_storeStrong(&v118, a5);
  id v117 = [location[0] objectForKey:InputArray];
  id v116 = [location[0] objectForKey:OutputArray];
  id v115 = [location[0] objectForKey:FilterOperation];
  id v114 = [location[0] objectForKey:ConstantValue];
  *((void *)&v113 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&long long v113 = [location[0] objectForKey:OtherAffectedVectors];
  if (v113 == 0)
  {
    *((void *)&v113 + 1) = objc_alloc_init((Class)NSDictionary);

    *(void *)&long long v113 = objc_alloc_init((Class)NSDictionary);
  }
  else
  {
    if (!*((void *)&v113 + 1) || !(void)v113)
    {
      id v5 = objc_alloc((Class)NSError);
      id v6 = [v5 initWithDomain:v118 code:102 userInfo:0];
      id *v119 = v6;
      v122 = 0;
      int v112 = 1;
      goto LABEL_95;
    }
    memset(__b, 0, sizeof(__b));
    id v83 = *((id *)&v113 + 1);
    id v84 = [v83 countByEnumeratingWithState:__b objects:v127 count:16];
    if (v84)
    {
      uint64_t v80 = *(void *)__b[2];
      uint64_t v81 = 0;
      id v82 = v84;
      while (1)
      {
        uint64_t v79 = v81;
        if (*(void *)__b[2] != v80) {
          objc_enumerationMutation(v83);
        }
        uint64_t v111 = *(void *)(__b[1] + 8 * v81);
        id v7 = [(id)v113 objectForKey:v111];
        BOOL v78 = v7 != 0;

        if (!v78) {
          break;
        }
        id v76 = [(id)v113 objectForKey:v111];
        BOOL v77 = (uint64_t)[v76 longValue] >= 1;

        if (!v77) {
          break;
        }
        ++v81;
        if (v79 + 1 >= (unint64_t)v82)
        {
          uint64_t v81 = 0;
          id v82 = [v83 countByEnumeratingWithState:__b objects:v127 count:16];
          if (!v82) {
            goto LABEL_15;
          }
        }
      }
      id v8 = objc_alloc((Class)NSError);
      id v9 = [v8 initWithDomain:v118 code:102 userInfo:0];
      id *v119 = v9;
      v122 = 0;
      int v112 = 1;
    }
    else
    {
LABEL_15:
      int v112 = 0;
    }

    if (v112) {
      goto LABEL_95;
    }
    memset(v108, 0, sizeof(v108));
    id v74 = (id)v113;
    id v75 = [v74 countByEnumeratingWithState:v108 objects:v126 count:16];
    if (v75)
    {
      uint64_t v71 = *(void *)v108[2];
      uint64_t v72 = 0;
      id v73 = v75;
      while (1)
      {
        uint64_t v70 = v72;
        if (*(void *)v108[2] != v71) {
          objc_enumerationMutation(v74);
        }
        uint64_t v109 = *(void *)(v108[1] + 8 * v72);
        id v10 = [*((id *)&v113 + 1) objectForKey:v109];
        BOOL v69 = v10 != 0;

        if (!v69) {
          break;
        }
        id v107 = [(NSMutableDictionary *)v121->_coreDictionary objectForKey:v109];
        if (v107)
        {
          int v112 = 0;
        }
        else
        {
          id v13 = objc_alloc((Class)NSError);
          id v14 = [v13 initWithDomain:v118 code:101 userInfo:0];
          id *v119 = v14;
          v122 = 0;
          int v112 = 1;
        }
        objc_storeStrong(&v107, 0);
        if (v112) {
          goto LABEL_30;
        }
        ++v72;
        if (v70 + 1 >= (unint64_t)v73)
        {
          uint64_t v72 = 0;
          id v73 = [v74 countByEnumeratingWithState:v108 objects:v126 count:16];
          if (!v73) {
            goto LABEL_29;
          }
        }
      }
      id v11 = objc_alloc((Class)NSError);
      id v12 = [v11 initWithDomain:v118 code:102 userInfo:0];
      id *v119 = v12;
      v122 = 0;
      int v112 = 1;
    }
    else
    {
LABEL_29:
      int v112 = 0;
    }
LABEL_30:

    if (v112) {
      goto LABEL_95;
    }
  }
  if (!v117 || !v116 || !v115 || !v114 || !*((void *)&v113 + 1) || !(void)v113)
  {
    id v15 = objc_alloc((Class)NSError);
    id v16 = [v15 initWithDomain:v118 code:102 userInfo:0];
    id *v119 = v16;
    v122 = 0;
    int v112 = 1;
    goto LABEL_95;
  }
  id v106 = [(NSMutableDictionary *)v121->_coreDictionary objectForKey:v117];
  if (!v106)
  {
    id v17 = objc_alloc((Class)NSError);
    id v18 = [v17 initWithDomain:v118 code:101 userInfo:0];
    id *v119 = v18;
    v122 = 0;
    int v112 = 1;
    goto LABEL_94;
  }
  id v105 = objc_alloc_init((Class)NSMutableDictionary);
  memset(v103, 0, sizeof(v103));
  id v67 = *((id *)&v113 + 1);
  id v68 = [v67 countByEnumeratingWithState:v103 objects:v125 count:16];
  if (v68)
  {
    uint64_t v64 = *(void *)v103[2];
    uint64_t v65 = 0;
    id v66 = v68;
    while (1)
    {
      uint64_t v63 = v65;
      if (*(void *)v103[2] != v64) {
        objc_enumerationMutation(v67);
      }
      uint64_t v104 = *(void *)(v103[1] + 8 * v65);
      id v102 = [*((id *)&v113 + 1) objectForKey:v104];
      id v61 = v105;
      id v62 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v61, "setObject:forKey:");

      objc_storeStrong(&v102, 0);
      ++v65;
      if (v63 + 1 >= (unint64_t)v66)
      {
        uint64_t v65 = 0;
        id v66 = [v67 countByEnumeratingWithState:v103 objects:v125 count:16];
        if (!v66) {
          break;
        }
      }
    }
  }

  id v101 = objc_alloc_init((Class)NSMutableArray);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v60 = i;
    if (v60 >= (unint64_t)[v106 count]) {
      break;
    }
    id v99 = [v106 objectAtIndex:i];
    uint64_t v98 = 0;
    if ([v115 isEqual:GreaterThan])
    {
      [v99 doubleValue];
      double v59 = v19;
      [v114 doubleValue];
      double v21 = v20;
      double v22 = v59;
      if (v59 > v21) {
        uint64_t v98 = 1;
      }
    }
    else if ([v115 isEqual:LessThan])
    {
      [v99 doubleValue];
      double v58 = v23;
      [v114 doubleValue];
      double v25 = v24;
      double v22 = v58;
      if (v58 < v25) {
        uint64_t v98 = 1;
      }
    }
    else if ([v115 isEqual:NotEqualTo])
    {
      [v99 doubleValue];
      double v57 = v26;
      [v114 doubleValue];
      double v28 = v27;
      double v22 = v57;
      if (v57 != v28) {
        uint64_t v98 = 1;
      }
    }
    else
    {
      if (([v115 isEqual:IsEqualTo] & 1) == 0)
      {
        id v32 = objc_alloc((Class)NSError);
        id v33 = [v32 initWithDomain:v118 code:100 userInfo:0];
        id *v119 = v33;
        v122 = 0;
        int v112 = 1;
        goto LABEL_84;
      }
      [v99 doubleValue];
      double v56 = v29;
      [v114 doubleValue];
      double v31 = v30;
      double v22 = v56;
      if (v56 == v31) {
        uint64_t v98 = 1;
      }
    }
    if (!v98) {
      goto LABEL_83;
    }
    objc_msgSend(v101, "addObject:", v99, v22);
    memset(v96, 0, sizeof(v96));
    id v54 = *((id *)&v113 + 1);
    id v55 = [v54 countByEnumeratingWithState:v96 objects:v124 count:16];
    if (v55)
    {
      uint64_t v51 = *(void *)v96[2];
      uint64_t v52 = 0;
      id v53 = v55;
      while (1)
      {
        uint64_t v50 = v52;
        if (*(void *)v96[2] != v51) {
          objc_enumerationMutation(v54);
        }
        uint64_t v97 = *(void *)(v96[1] + 8 * v52);
        id v95 = [(id)v113 objectForKey:v97];
        id v94 = [*((id *)&v113 + 1) objectForKey:v97];
        id v93 = [v105 objectForKey:v94];
        for (uint64_t j = 0; ; ++j)
        {
          uint64_t v49 = j;
          if (v49 >= (uint64_t)[v95 longValue]) {
            break;
          }
          unint64_t v91 = 0;
          unint64_t v47 = i;
          id v34 = [v95 longValue];
          unint64_t v91 = v47 * (void)v34 + j;
          id v90 = [(NSMutableDictionary *)v121->_coreDictionary objectForKey:v97];
          unint64_t v48 = v91;
          if (v48 < (unint64_t)[v90 count])
          {
            id v89 = [v90 objectAtIndex:v91];
            [v93 addObject:v89];
            objc_storeStrong(&v89, 0);
            int v112 = 0;
          }
          else
          {
            id v35 = objc_alloc((Class)NSError);
            id v36 = [v35 initWithDomain:v118 code:105 userInfo:0];
            id *v119 = v36;
            v122 = 0;
            int v112 = 1;
          }
          objc_storeStrong(&v90, 0);
          if (v112) {
            goto LABEL_78;
          }
        }
        int v112 = 0;
LABEL_78:
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
        objc_storeStrong(&v95, 0);
        if (v112) {
          break;
        }
        ++v52;
        if (v50 + 1 >= (unint64_t)v53)
        {
          uint64_t v52 = 0;
          id v53 = [v54 countByEnumeratingWithState:v96 objects:v124 count:16];
          if (!v53) {
            goto LABEL_81;
          }
        }
      }
    }
    else
    {
LABEL_81:
      int v112 = 0;
    }

    if (!v112) {
LABEL_83:
    }
      int v112 = 0;
LABEL_84:
    objc_storeStrong(&v99, 0);
    if (v112) {
      goto LABEL_93;
    }
  }
  memset(v87, 0, sizeof(v87));
  id v45 = v105;
  id v46 = [v45 countByEnumeratingWithState:v87 objects:v123 count:16];
  if (v46)
  {
    uint64_t v42 = *(void *)v87[2];
    uint64_t v43 = 0;
    id v44 = v46;
    while (1)
    {
      uint64_t v41 = v43;
      if (*(void *)v87[2] != v42) {
        objc_enumerationMutation(v45);
      }
      uint64_t v88 = *(void *)(v87[1] + 8 * v43);
      coreDictionary = v121->_coreDictionary;
      id v40 = [v105 objectForKey:v88];
      -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

      ++v43;
      if (v41 + 1 >= (unint64_t)v44)
      {
        uint64_t v43 = 0;
        id v44 = [v45 countByEnumeratingWithState:v87 objects:v123 count:16];
        if (!v44) {
          break;
        }
      }
    }
  }

  [(NSMutableDictionary *)v121->_coreDictionary setObject:v101 forKey:v116];
  v122 = +[NSNumber numberWithLong:1];
  int v112 = 1;
LABEL_93:
  objc_storeStrong(&v101, 0);
  objc_storeStrong(&v105, 0);
LABEL_94:
  objc_storeStrong(&v106, 0);
LABEL_95:
  objc_storeStrong((id *)&v113, 0);
  objc_storeStrong((id *)&v113 + 1, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(location, 0);
  unint64_t v37 = v122;

  return v37;
}

- (id)getCurrentTime:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  double v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18[1] = a4;
  v18[0] = 0;
  objc_storeStrong(v18, a5);
  id v17 = [location[0] objectForKey:OutputArray];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v5 = mach_absolute_time();
  LODWORD(v7) = info.denom;
  LODWORD(v6) = info.numer;
  double v15 = (double)v5 * ((double)v6 / (1000000000.0 * (double)v7));
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v11 = v14;
  id v12 = +[NSNumber numberWithDouble:v15];
  objc_msgSend(v11, "addObject:");

  [(NSMutableDictionary *)v20->_coreDictionary setObject:v14 forKey:v17];
  id v13 = +[NSNumber numberWithLong:1];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(location, 0);

  return v13;
}

- (id)hashFromCoreDictionary:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  unint64_t v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = a4;
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  id v33 = [location[0] objectForKey:InputArray];
  id v32 = [location[0] objectForKey:OutputArray];
  id v31 = [location[0] objectForKey:InputArrayMappingKey];
  id v30 = [location[0] objectForKey:InputArrayMappingValue];
  id v29 = [location[0] objectForKey:DefaultValue];
  if (v33 && v32 && v31 && v30)
  {
    id v27 = [(NSMutableDictionary *)v37->_coreDictionary objectForKey:v33];
    id v26 = [(NSMutableDictionary *)v37->_coreDictionary objectForKey:v31];
    id v25 = [(NSMutableDictionary *)v37->_coreDictionary objectForKey:v30];
    if (v27 && v26 && v25)
    {
      id v16 = [v26 count];
      if (v16 == [v25 count])
      {
        id v24 = objc_alloc_init((Class)NSMutableDictionary);
        for (unint64_t i = 0; i < (unint64_t)[v26 count]; ++i)
        {
          id v15 = [v25 objectAtIndex:i];
          id v14 = [v26 objectAtIndex:i];
          objc_msgSend(v24, "setObject:forKey:", v15);
        }
        id v22 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t j = 0; ; ++j)
        {
          unint64_t v13 = j;
          if (v13 >= (unint64_t)[v27 count]) {
            break;
          }
          id v20 = [v27 objectAtIndex:j];
          id v19 = [v24 objectForKey:v20];
          if (v19)
          {
            [v22 addObject:v19];
          }
          else if (v29)
          {
            [v22 addObject:v29];
          }
          objc_storeStrong(&v19, 0);
          objc_storeStrong(&v20, 0);
        }
        [(NSMutableDictionary *)v37->_coreDictionary setObject:v22 forKey:v32];
        uint64_t v38 = +[NSNumber numberWithLong:1];
        int v28 = 1;
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v24, 0);
      }
      else
      {
        id v9 = objc_alloc((Class)NSError);
        id v10 = [v9 initWithDomain:v34 code:130 userInfo:0];
        *id v35 = v10;
        uint64_t v38 = 0;
        int v28 = 1;
      }
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v34 code:129 userInfo:0];
      *id v35 = v8;
      uint64_t v38 = 0;
      int v28 = 1;
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v34 code:128 userInfo:0];
    *id v35 = v6;
    uint64_t v38 = 0;
    int v28 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  id v11 = v38;

  return v11;
}

- (id)hashAdamIdsToIndices:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v28 = a4;
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v26 = [location[0] objectForKey:InputArray];
  id v25 = [location[0] objectForKey:OutputArray];
  id v24 = [location[0] objectForKey:Mapping];
  id v23 = [location[0] objectForKey:DefaultValue];
  if (v26 && v25 && v24)
  {
    id v21 = [(AMDDODMLAttachmentProcessor *)v30->_attachmentsProcessor hashMapForKey:v24];
    if (v21)
    {
      id v20 = [(NSMutableDictionary *)v30->_coreDictionary objectForKey:v26];
      if (v20)
      {
        id v19 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t i = 0; ; ++i)
        {
          unint64_t v13 = i;
          if (v13 >= (unint64_t)[v20 count]) {
            break;
          }
          id v17 = [v20 objectAtIndex:i];
          id v16 = [v21 objectForKey:v17];
          if (v16)
          {
            [v19 addObject:v16];
          }
          else if (v23)
          {
            [v19 addObject:v23];
          }
          objc_storeStrong(&v16, 0);
          objc_storeStrong(&v17, 0);
        }
        [(NSMutableDictionary *)v30->_coreDictionary setObject:v19 forKey:v25];
        id v31 = +[NSNumber numberWithLong:1];
        int v22 = 1;
        objc_storeStrong(&v19, 0);
      }
      else
      {
        id v9 = objc_alloc((Class)NSError);
        id v10 = [v9 initWithDomain:v27 code:30 userInfo:0];
        *int v28 = v10;
        id v31 = 0;
        int v22 = 1;
      }
      objc_storeStrong(&v20, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v27 code:22 userInfo:0];
      *int v28 = v8;
      id v31 = 0;
      int v22 = 1;
    }
    objc_storeStrong(&v21, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v27 code:41 userInfo:0];
    *int v28 = v6;
    id v31 = 0;
    int v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  id v11 = v31;

  return v11;
}

- (id)ifStatement:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  long long v113 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v111 = a4;
  id v110 = 0;
  objc_storeStrong(&v110, a5);
  id v109 = [location[0] objectForKey:IfStatement];
  id v108 = [location[0] objectForKey:OutputArray];
  id v107 = [location[0] objectForKey:AllowedIterationNumber];
  id v106 = objc_alloc_init((Class)NSMutableArray);
  id v105 = objc_alloc_init((Class)NSMutableArray);
  id v104 = objc_alloc_init((Class)NSMutableArray);
  if (!v109 || !v108)
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v110 code:151 userInfo:0];
    *uint64_t v111 = v6;
    id v114 = 0;
    int v103 = 1;
    goto LABEL_100;
  }
  if (!v107)
  {
    id v107 = +[NSNumber numberWithLong:10000];
  }
  id v102 = 0;
  uint64_t v101 = 0;
  while (1)
  {
    if ([v104 count] || (BOOL v63 = 0, !v102))
    {
      uint64_t v62 = v101;
      BOOL v63 = v62 < (uint64_t)[v107 longValue];
    }
    if (!v63) {
      break;
    }
    ++v101;
    id v100 = [v109 copy];
    id v99 = 0;
    id v99 = (char *)[v106 count] - 1;
    for (uint64_t i = 0; i < (uint64_t)v99; ++i)
    {
      id v97 = [v106 objectAtIndex:i];
      id v96 = [v100 objectForKey:Statements];
      id v7 = objc_msgSend(v96, "objectAtIndex:", (int)objc_msgSend(v97, "intValue"));
      id v8 = v100;
      id v100 = v7;

      objc_storeStrong(&v96, 0);
      objc_storeStrong(&v97, 0);
    }
    id v95 = 0;
    id v95 = [v106 count];
    if ((uint64_t)v95 <= 0) {
      goto LABEL_30;
    }
    uint64_t v94 = 0;
    id v60 = [v106 lastObject];
    uint64_t v61 = (int)[v60 intValue];

    uint64_t v94 = v61;
    id v93 = [v100 objectForKey:Statements];
    id v92 = 0;
    id v92 = [v93 count];
    if (v94 < (uint64_t)v92)
    {
      id v9 = [v93 objectAtIndex:v94];
      id v10 = v100;
      id v100 = v9;

      int v103 = 0;
    }
    else
    {
      [v106 removeLastObject];
      [v105 removeLastObject];
      id v91 = [v104 lastObject];
      [v104 removeLastObject];
      id v90 = 0;
      id v90 = [v104 count];
      if ((uint64_t)v90 <= 0)
      {
        objc_storeStrong(&v102, v91);
      }
      else
      {
        char v89 = 0;
        id v58 = [v104 lastObject];
        unsigned __int8 v59 = [v58 BOOLValue];

        char v89 = v59 & 1;
        id v88 = [v105 lastObject];
        [v104 removeLastObject];
        if ([v88 isEqual:andKey])
        {
          unsigned __int8 v57 = 0;
          if (v89) {
            unsigned __int8 v57 = [v91 BOOLValue];
          }
          char v89 = v57 & 1;
        }
        else if ([v88 isEqual:orKey])
        {
          unsigned __int8 v56 = 1;
          if ((v89 & 1) == 0) {
            unsigned __int8 v56 = [v91 BOOLValue];
          }
          char v89 = v56 & 1;
        }
        id v50 = v104;
        uint64_t v51 = +[NSNumber numberWithBool:v89 & 1];
        objc_msgSend(v50, "addObject:");

        unsigned int v87 = 0;
        id v52 = [v106 lastObject];
        unsigned int v53 = [v52 intValue] + 1;

        unsigned int v87 = v53;
        [v106 removeLastObject];
        id v54 = v106;
        id v55 = +[NSNumber numberWithInt:v87];
        objc_msgSend(v54, "addObject:");

        objc_storeStrong(&v88, 0);
      }
      int v103 = 2;
      objc_storeStrong(&v91, 0);
    }
    objc_storeStrong(&v93, 0);
    if (!v103)
    {
LABEL_30:
      id v86 = [v100 objectForKey:Operation];
      if (([v86 isEqual:NAKey] & 1) == 0)
      {
        if ([v86 isEqual:andKey])
        {
          [v104 addObject:&off_1000258D0];
        }
        else if ([v86 isEqual:orKey])
        {
          [v104 addObject:&off_1000258E8];
        }
        [v105 addObject:v86];
        [v106 addObject:&off_1000258E8];
        goto LABEL_67;
      }
      id v85 = [v100 objectForKey:Statement];
      id v84 = [v85 objectForKey:InputArray];
      id v83 = [(NSMutableDictionary *)v113->_coreDictionary objectForKey:v84];
      id v82 = [v85 objectForKey:ComparisonOp];
      id v81 = [v85 objectForKey:ComparisonNumber];
      id v80 = 0;
      if ([v82 isEqual:HasLengthEqualTo])
      {
        id v49 = [v83 count];
        if (v49 == (id)(int)[v81 intValue]) {
          objc_storeStrong(&v80, &off_1000258D0);
        }
        else {
          objc_storeStrong(&v80, &off_1000258E8);
        }
LABEL_50:
        if ([v104 count])
        {
          char v78 = 0;
          id v43 = [v104 lastObject];
          unsigned __int8 v44 = [v43 BOOLValue];

          char v78 = v44 & 1;
          id v77 = [v105 lastObject];
          [v104 removeLastObject];
          if ([v77 isEqual:andKey])
          {
            unsigned __int8 v42 = 0;
            if (v78) {
              unsigned __int8 v42 = [v80 BOOLValue];
            }
            char v78 = v42 & 1;
          }
          else if ([v77 isEqual:orKey])
          {
            unsigned __int8 v41 = 1;
            if ((v78 & 1) == 0) {
              unsigned __int8 v41 = [v80 BOOLValue];
            }
            char v78 = v41 & 1;
          }
          id v35 = v104;
          id v36 = +[NSNumber numberWithBool:v78 & 1];
          objc_msgSend(v35, "addObject:");

          id v37 = [v106 lastObject];
          unsigned int v38 = [v37 intValue] + 1;

          unsigned int v76 = v38;
          [v106 removeLastObject];
          id v39 = v106;
          id v40 = +[NSNumber numberWithInt:v38];
          objc_msgSend(v39, "addObject:");

          objc_storeStrong(&v77, 0);
        }
        else
        {
          objc_storeStrong(&v102, v80);
        }
        objc_storeStrong(&v80, 0);
        objc_storeStrong(&v81, 0);
        objc_storeStrong(&v82, 0);
        objc_storeStrong(&v83, 0);
        objc_storeStrong(&v84, 0);
        objc_storeStrong(&v85, 0);
LABEL_67:
        objc_storeStrong(&v86, 0);
        int v103 = 0;
        goto LABEL_68;
      }
      id v79 = [v83 firstObject];
      if ([v82 isEqual:IsEqualTo])
      {
        [v79 doubleValue];
        double v48 = v11;
        [v81 doubleValue];
        if (v48 == v12) {
          goto LABEL_47;
        }
LABEL_48:
        objc_storeStrong(&v80, &off_1000258E8);
      }
      else if ([v82 isEqual:GreaterThan])
      {
        [v79 doubleValue];
        double v47 = v13;
        [v81 doubleValue];
        if (v47 <= v14) {
          goto LABEL_48;
        }
LABEL_47:
        objc_storeStrong(&v80, &off_1000258D0);
      }
      else
      {
        if ([v82 isEqual:LessThan])
        {
          [v79 doubleValue];
          double v46 = v15;
          [v81 doubleValue];
          if (v46 < v16) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
        if ([v82 isEqual:NotEqualTo])
        {
          [v79 doubleValue];
          double v45 = v17;
          [v81 doubleValue];
          if (v45 != v18) {
            goto LABEL_47;
          }
          goto LABEL_48;
        }
      }
      objc_storeStrong(&v79, 0);
      goto LABEL_50;
    }
LABEL_68:
    objc_storeStrong(&v100, 0);
  }
  id v75 = [location[0] objectForKey:IfEffect];
  id v74 = [location[0] objectForKey:ElseEffect];
  if (([v102 BOOLValue] & 1) != 0 && v75)
  {
    memset(__b, 0, sizeof(__b));
    id v33 = v75;
    id v34 = [v33 countByEnumeratingWithState:__b objects:v117 count:16];
    if (v34)
    {
      uint64_t v30 = *(void *)__b[2];
      uint64_t v31 = 0;
      id v32 = v34;
      while (1)
      {
        uint64_t v29 = v31;
        if (*(void *)__b[2] != v30) {
          objc_enumerationMutation(v33);
        }
        id v73 = *(id *)(__b[1] + 8 * v31);
        id v71 = [v73 objectForKey:FunctionName];
        id v70 = [(AMDDODMLDataProcessor *)v113 parseAndCall:v71 withInputs:v73 error:v111 errorDomain:v110];
        if (v70)
        {
          int v103 = 0;
        }
        else
        {
          id v114 = 0;
          int v103 = 1;
        }
        objc_storeStrong(&v70, 0);
        objc_storeStrong(&v71, 0);
        if (v103) {
          break;
        }
        ++v31;
        if (v29 + 1 >= (unint64_t)v32)
        {
          uint64_t v31 = 0;
          id v32 = [v33 countByEnumeratingWithState:__b objects:v117 count:16];
          if (!v32) {
            goto LABEL_81;
          }
        }
      }
    }
    else
    {
LABEL_81:
      int v103 = 0;
    }

    if (!v103) {
      goto LABEL_98;
    }
  }
  else
  {
    if (([v102 BOOLValue] & 1) != 0 || !v74) {
      goto LABEL_98;
    }
    memset(v68, 0, sizeof(v68));
    id v27 = v74;
    id v28 = [v27 countByEnumeratingWithState:v68 objects:v116 count:16];
    if (v28)
    {
      uint64_t v24 = *(void *)v68[2];
      uint64_t v25 = 0;
      id v26 = v28;
      while (1)
      {
        uint64_t v23 = v25;
        if (*(void *)v68[2] != v24) {
          objc_enumerationMutation(v27);
        }
        id v69 = *(id *)(v68[1] + 8 * v25);
        id v67 = [v69 objectForKey:FunctionName];
        id v66 = [(AMDDODMLDataProcessor *)v113 parseAndCall:v67 withInputs:v69 error:v111 errorDomain:v110];
        if (v66)
        {
          int v103 = 0;
        }
        else
        {
          id v114 = 0;
          int v103 = 1;
        }
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
        if (v103) {
          break;
        }
        ++v25;
        if (v23 + 1 >= (unint64_t)v26)
        {
          uint64_t v25 = 0;
          id v26 = [v27 countByEnumeratingWithState:v68 objects:v116 count:16];
          if (!v26) {
            goto LABEL_96;
          }
        }
      }
    }
    else
    {
LABEL_96:
      int v103 = 0;
    }

    if (!v103)
    {
LABEL_98:
      coreDictionary = v113->_coreDictionary;
      id v115 = v102;
      int v22 = +[NSArray arrayWithObjects:&v115 count:1];
      -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

      id v114 = +[NSNumber numberWithLong:1];
      int v103 = 1;
    }
  }
  objc_storeStrong(&v74, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v102, 0);
LABEL_100:
  objc_storeStrong(&v104, 0);
  objc_storeStrong(&v105, 0);
  objc_storeStrong(&v106, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong(&v108, 0);
  objc_storeStrong(&v109, 0);
  objc_storeStrong(&v110, 0);
  objc_storeStrong(location, 0);
  id v19 = v114;

  return v19;
}

- (id)generateHashFromInputs:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v38 = a4;
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  id v36 = [location[0] objectForKey:InputArray];
  id v35 = [location[0] objectForKey:Mapping];
  id v34 = [location[0] objectForKey:MaxHashValue];
  if (v36 && v35 && v34)
  {
    id v32 = objc_alloc_init((Class)NSMutableSet);
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v23 = i;
      if (v23 >= (unint64_t)[v36 count]) {
        break;
      }
      id v30 = [v36 objectAtIndex:i];
      id v29 = [(NSMutableDictionary *)v40->_coreDictionary objectForKey:v30];
      if (v29)
      {
        [v32 addObjectsFromArray:v29];
        int v33 = 0;
      }
      else
      {
        id v7 = objc_alloc((Class)NSError);
        id v8 = [v7 initWithDomain:v37 code:110 userInfo:0];
        *unsigned int v38 = v8;
        unsigned __int8 v41 = 0;
        int v33 = 1;
      }
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      if (v33) {
        goto LABEL_21;
      }
    }
    id v22 = [v32 count];
    if (v22 <= [v34 longValue])
    {
      uint64_t v28 = 0;
      id v27 = objc_alloc_init((Class)NSMutableDictionary);
      memset(__b, 0, 0x40uLL);
      id v20 = v32;
      id v21 = [v20 countByEnumeratingWithState:__b objects:v42 count:16];
      if (v21)
      {
        uint64_t v17 = *(void *)__b[2];
        uint64_t v18 = 0;
        id v19 = v21;
        while (1)
        {
          uint64_t v16 = v18;
          if (*(void *)__b[2] != v17) {
            objc_enumerationMutation(v20);
          }
          void __b[8] = *(void *)(__b[1] + 8 * v18);
          id v14 = v27;
          double v15 = +[NSNumber numberWithLong:v28];
          objc_msgSend(v14, "setObject:forKey:");

          ++v28;
          ++v18;
          if (v16 + 1 >= (unint64_t)v19)
          {
            uint64_t v18 = 0;
            id v19 = [v20 countByEnumeratingWithState:__b objects:v42 count:16];
            if (!v19) {
              break;
            }
          }
        }
      }

      id v11 = [(AMDDODMLAttachmentProcessor *)v40->_attachmentsProcessor setHashMap:v27 forKey:v35];
      unsigned __int8 v41 = +[NSNumber numberWithLong:1];
      int v33 = 1;
      objc_storeStrong(&v27, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:v37 code:112 userInfo:0];
      *unsigned int v38 = v10;
      unsigned __int8 v41 = 0;
      int v33 = 1;
    }
LABEL_21:
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v37 code:111 userInfo:0];
    *unsigned int v38 = v6;
    unsigned __int8 v41 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  double v12 = v41;

  return v12;
}

- (id)insertArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = a4;
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = [location[0] objectForKey:ConstantValue];
  id v23 = [location[0] objectForKey:FinalLength];
  id v22 = [location[0] objectForKey:OutputArray];
  id v21 = [location[0] objectForKey:FinalLengthLikeOtherArray];
  if (!v21) {
    goto LABEL_10;
  }
  id v20 = [(NSMutableDictionary *)v28->_coreDictionary objectForKey:v21];
  id v19 = [location[0] objectForKey:FinalLengthLikeOtherArrayMultiplier];
  id v18 = [location[0] objectForKey:FinalLengthLikeOtherArrayOffset];
  if (v20 && v19 && v18)
  {
    id v7 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v18 longValue]+ (void)objc_msgSend(v20, "count") * (void)objc_msgSend(v19, "longValue"));
    id v8 = v23;
    id v23 = v7;

    int v17 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v25 code:42 userInfo:0];
    *id v26 = v6;
    id v29 = 0;
    int v17 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  if (!v17)
  {
LABEL_10:
    if (v22 && v23 && v24)
    {
      id v16 = objc_alloc_init((Class)NSMutableArray);
      for (uint64_t i = 0; i < (uint64_t)[v23 longValue]; ++i)
        [v16 addObject:v24];
      [(NSMutableDictionary *)v28->_coreDictionary setObject:v16 forKey:v22];
      id v29 = +[NSNumber numberWithLong:1];
      int v17 = 1;
      objc_storeStrong(&v16, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:v25 code:42 userInfo:0];
      *id v26 = v10;
      id v29 = 0;
      int v17 = 1;
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  id v11 = v29;

  return v11;
}

- (id)insertRawArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = a4;
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = [location[0] objectForKey:InputArray];
  id v11 = [location[0] objectForKey:OutputArray];
  if (v11 && v12)
  {
    [(NSMutableDictionary *)v16->_coreDictionary setObject:v12 forKey:v11];
    int v17 = +[NSNumber numberWithLong:1];
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v13 code:150 userInfo:0];
    id *v14 = v6;
    int v17 = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  id v7 = v17;

  return v7;
}

- (id)padArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  unsigned int v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = a4;
  id v35 = 0;
  objc_storeStrong(&v35, a5);
  id v34 = [location[0] objectForKey:InputArray];
  id v33 = [location[0] objectForKey:OutputArray];
  id v32 = [location[0] objectForKey:PaddingValue];
  id v31 = [location[0] objectForKey:PadEnd];
  id v30 = [location[0] objectForKey:FinalLength];
  id v29 = [location[0] objectForKey:FinalLengthLikeOtherArray];
  if (!v29) {
    goto LABEL_15;
  }
  id v28 = [(NSMutableDictionary *)v38->_coreDictionary objectForKey:v29];
  id v27 = [location[0] objectForKey:FinalLengthLikeOtherArrayMultiplier];
  id v26 = [location[0] objectForKey:FinalLengthLikeOtherArrayOffset];
  if (v28 && v27 && v26)
  {
    id v7 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v26 longValue]+ (void)objc_msgSend(v28, "count") * (void)objc_msgSend(v27, "longValue"));
    id v8 = v30;
    id v30 = v7;

    int v25 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v35 code:43 userInfo:0];
    *id v36 = v6;
    id v39 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  if (!v25)
  {
LABEL_15:
    if (v34
      && v33
      && v32
      && v31
      && v30
      && (([v31 isEqual:&off_1000258E8] & 1) != 0
       || ([v31 isEqual:&off_1000258D0] & 1) != 0))
    {
      id v24 = [(NSMutableDictionary *)v38->_coreDictionary objectForKey:v34];
      if (v24)
      {
        id v23 = objc_alloc_init((Class)NSMutableArray);
        int v17 = [v30 longValue];
        int64_t v16 = v17 - (unsigned char *)[v24 count];
        if ([v31 isEqual:&off_1000258E8])
        {
          for (int64_t i = 0; i < v16; ++i)
            [v23 addObject:v32];
        }
        for (unint64_t j = 0; j < (unint64_t)[v24 count]; ++j)
        {
          id v15 = [v24 objectAtIndex:j];
          objc_msgSend(v23, "addObject:");
        }
        if ([v31 isEqual:&off_1000258D0])
        {
          for (int64_t k = 0; k < v16; ++k)
            [v23 addObject:v32];
        }
        [(NSMutableDictionary *)v38->_coreDictionary setObject:v23 forKey:v33];
        id v39 = +[NSNumber numberWithLong:1];
        int v25 = 1;
        objc_storeStrong(&v23, 0);
      }
      else
      {
        id v11 = objc_alloc((Class)NSError);
        id v12 = [v11 initWithDomain:v35 code:31 userInfo:0];
        *id v36 = v12;
        id v39 = 0;
        int v25 = 1;
      }
      objc_storeStrong(&v24, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:v35 code:43 userInfo:0];
      *id v36 = v10;
      id v39 = 0;
      int v25 = 1;
    }
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
  id v13 = v39;

  return v13;
}

- (id)randomizeArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v110 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v108 = a4;
  id v107 = 0;
  objc_storeStrong(&v107, a5);
  id v106 = [location[0] objectForKey:InputArray];
  id v105 = [location[0] objectForKey:OutputArray];
  *((void *)&v104 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&long long v104 = [location[0] objectForKey:OtherAffectedVectors];
  if (v104 == 0)
  {
    *((void *)&v104 + 1) = objc_alloc_init((Class)NSDictionary);

    *(void *)&long long v104 = objc_alloc_init((Class)NSDictionary);
LABEL_31:
    if (v106 && v105)
    {
      id v97 = [(NSMutableDictionary *)v110->_coreDictionary objectForKey:v106];
      if (v97)
      {
        id v96 = objc_alloc_init((Class)NSMutableDictionary);
        memset(v94, 0, sizeof(v94));
        id v53 = *((id *)&v104 + 1);
        id v54 = [v53 countByEnumeratingWithState:v94 objects:v114 count:16];
        if (v54)
        {
          uint64_t v50 = *(void *)v94[2];
          uint64_t v51 = 0;
          id v52 = v54;
          while (1)
          {
            uint64_t v49 = v51;
            if (*(void *)v94[2] != v50) {
              objc_enumerationMutation(v53);
            }
            uint64_t v95 = *(void *)(v94[1] + 8 * v51);
            id v93 = [*((id *)&v104 + 1) objectForKey:v95];
            id v47 = v96;
            id v48 = objc_alloc_init((Class)NSMutableArray);
            objc_msgSend(v47, "setObject:forKey:");

            objc_storeStrong(&v93, 0);
            ++v51;
            if (v49 + 1 >= (unint64_t)v52)
            {
              uint64_t v51 = 0;
              id v52 = [v53 countByEnumeratingWithState:v94 objects:v114 count:16];
              if (!v52) {
                break;
              }
            }
          }
        }

        id v92 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t i = 0; i < (unint64_t)[v97 count]; ++i)
        {
          double v46 = +[NSNumber numberWithLong:i];
          objc_msgSend(v92, "addObject:");
        }
        id v90 = (char *)[v92 count];
        for (uint64_t j = 0; j < (uint64_t)v90; ++j)
        {
          id v88 = &v90[-j];
          uint64_t v87 = arc4random() % (uint64_t)&v90[-j] + j;
          [v92 exchangeObjectAtIndex:j withObjectAtIndex:v87];
        }
        id v86 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t k = 0; ; ++k)
        {
          unint64_t v45 = k;
          if (v45 >= (unint64_t)[v97 count]) {
            break;
          }
          id v84 = 0;
          id v39 = [v92 objectAtIndex:k];
          id v40 = [v39 longValue];

          id v84 = v40;
          id v41 = v86;
          id v42 = [v97 objectAtIndex:v40];
          objc_msgSend(v41, "addObject:");

          memset(v82, 0, sizeof(v82));
          id v43 = *((id *)&v104 + 1);
          id v44 = [v43 countByEnumeratingWithState:v82 objects:v113 count:16];
          if (v44)
          {
            uint64_t v36 = *(void *)v82[2];
            uint64_t v37 = 0;
            id v38 = v44;
            while (1)
            {
              uint64_t v35 = v37;
              if (*(void *)v82[2] != v36) {
                objc_enumerationMutation(v43);
              }
              uint64_t v83 = *(void *)(v82[1] + 8 * v37);
              id v81 = [(id)v104 objectForKey:v83];
              id v80 = [*((id *)&v104 + 1) objectForKey:v83];
              id v79 = [v96 objectForKey:v80];
              for (uint64_t m = 0; ; ++m)
              {
                uint64_t v34 = m;
                if (v34 >= (uint64_t)[v81 longValue]) {
                  break;
                }
                unint64_t v77 = 0;
                id v32 = v84;
                id v19 = [v81 longValue];
                unint64_t v77 = (void)v32 * (void)v19 + m;
                id v76 = [(NSMutableDictionary *)v110->_coreDictionary objectForKey:v83];
                unint64_t v33 = v77;
                if (v33 < (unint64_t)[v76 count])
                {
                  id v75 = [v76 objectAtIndex:v77];
                  [v79 addObject:v75];
                  objc_storeStrong(&v75, 0);
                  int v103 = 0;
                }
                else
                {
                  id v20 = objc_alloc((Class)NSError);
                  id v21 = [v20 initWithDomain:v107 code:26 userInfo:0];
                  id *v108 = v21;
                  uint64_t v111 = 0;
                  int v103 = 1;
                }
                objc_storeStrong(&v76, 0);
                if (v103) {
                  goto LABEL_62;
                }
              }
              int v103 = 0;
LABEL_62:
              objc_storeStrong(&v79, 0);
              objc_storeStrong(&v80, 0);
              objc_storeStrong(&v81, 0);
              if (v103) {
                break;
              }
              ++v37;
              if (v35 + 1 >= (unint64_t)v38)
              {
                uint64_t v37 = 0;
                id v38 = [v43 countByEnumeratingWithState:v82 objects:v113 count:16];
                if (!v38) {
                  goto LABEL_65;
                }
              }
            }
          }
          else
          {
LABEL_65:
            int v103 = 0;
          }

          if (v103) {
            goto LABEL_75;
          }
        }
        memset(v73, 0, sizeof(v73));
        id v30 = v96;
        id v31 = [v30 countByEnumeratingWithState:v73 objects:v112 count:16];
        if (v31)
        {
          uint64_t v27 = *(void *)v73[2];
          uint64_t v28 = 0;
          id v29 = v31;
          while (1)
          {
            uint64_t v26 = v28;
            if (*(void *)v73[2] != v27) {
              objc_enumerationMutation(v30);
            }
            uint64_t v74 = *(void *)(v73[1] + 8 * v28);
            coreDictionary = v110->_coreDictionary;
            id v25 = [v96 objectForKey:v74];
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v28;
            if (v26 + 1 >= (unint64_t)v29)
            {
              uint64_t v28 = 0;
              id v29 = [v30 countByEnumeratingWithState:v73 objects:v112 count:16];
              if (!v29) {
                break;
              }
            }
          }
        }

        [(NSMutableDictionary *)v110->_coreDictionary setObject:v86 forKey:v105];
        uint64_t v111 = +[NSNumber numberWithLong:1];
        int v103 = 1;
LABEL_75:
        objc_storeStrong(&v86, 0);
        objc_storeStrong(&v92, 0);
        objc_storeStrong(&v96, 0);
      }
      else
      {
        id v17 = objc_alloc((Class)NSError);
        id v18 = [v17 initWithDomain:v107 code:32 userInfo:0];
        id *v108 = v18;
        uint64_t v111 = 0;
        int v103 = 1;
      }
      objc_storeStrong(&v97, 0);
    }
    else
    {
      id v15 = objc_alloc((Class)NSError);
      id v16 = [v15 initWithDomain:v107 code:44 userInfo:0];
      id *v108 = v16;
      uint64_t v111 = 0;
      int v103 = 1;
    }
    goto LABEL_77;
  }
  if (!*((void *)&v104 + 1) || !(void)v104)
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v107 code:44 userInfo:0];
    id *v108 = v6;
    uint64_t v111 = 0;
    int v103 = 1;
    goto LABEL_77;
  }
  memset(__b, 0, sizeof(__b));
  id v69 = *((id *)&v104 + 1);
  id v70 = [v69 countByEnumeratingWithState:__b objects:v116 count:16];
  if (v70)
  {
    uint64_t v66 = *(void *)__b[2];
    uint64_t v67 = 0;
    id v68 = v70;
    while (1)
    {
      uint64_t v65 = v67;
      if (*(void *)__b[2] != v66) {
        objc_enumerationMutation(v69);
      }
      uint64_t v102 = *(void *)(__b[1] + 8 * v67);
      id v7 = [(id)v104 objectForKey:v102];
      BOOL v64 = v7 != 0;

      if (!v64) {
        break;
      }
      id v62 = [(id)v104 objectForKey:v102];
      BOOL v63 = (uint64_t)[v62 longValue] >= 1;

      if (!v63) {
        break;
      }
      ++v67;
      if (v65 + 1 >= (unint64_t)v68)
      {
        uint64_t v67 = 0;
        id v68 = [v69 countByEnumeratingWithState:__b objects:v116 count:16];
        if (!v68) {
          goto LABEL_15;
        }
      }
    }
    id v8 = objc_alloc((Class)NSError);
    id v9 = [v8 initWithDomain:v107 code:44 userInfo:0];
    id *v108 = v9;
    uint64_t v111 = 0;
    int v103 = 1;
  }
  else
  {
LABEL_15:
    int v103 = 0;
  }

  if (!v103)
  {
    memset(v99, 0, sizeof(v99));
    id v60 = (id)v104;
    id v61 = [v60 countByEnumeratingWithState:v99 objects:v115 count:16];
    if (v61)
    {
      uint64_t v57 = *(void *)v99[2];
      uint64_t v58 = 0;
      id v59 = v61;
      while (1)
      {
        uint64_t v56 = v58;
        if (*(void *)v99[2] != v57) {
          objc_enumerationMutation(v60);
        }
        uint64_t v100 = *(void *)(v99[1] + 8 * v58);
        id v10 = [*((id *)&v104 + 1) objectForKey:v100];
        BOOL v55 = v10 != 0;

        if (!v55) {
          break;
        }
        id v98 = [(NSMutableDictionary *)v110->_coreDictionary objectForKey:v100];
        if (v98)
        {
          int v103 = 0;
        }
        else
        {
          id v13 = objc_alloc((Class)NSError);
          id v14 = [v13 initWithDomain:v107 code:44 userInfo:0];
          id *v108 = v14;
          uint64_t v111 = 0;
          int v103 = 1;
        }
        objc_storeStrong(&v98, 0);
        if (v103) {
          goto LABEL_30;
        }
        ++v58;
        if (v56 + 1 >= (unint64_t)v59)
        {
          uint64_t v58 = 0;
          id v59 = [v60 countByEnumeratingWithState:v99 objects:v115 count:16];
          if (!v59) {
            goto LABEL_29;
          }
        }
      }
      id v11 = objc_alloc((Class)NSError);
      id v12 = [v11 initWithDomain:v107 code:44 userInfo:0];
      id *v108 = v12;
      uint64_t v111 = 0;
      int v103 = 1;
    }
    else
    {
LABEL_29:
      int v103 = 0;
    }
LABEL_30:

    if (!v103) {
      goto LABEL_31;
    }
  }
LABEL_77:
  objc_storeStrong((id *)&v104, 0);
  objc_storeStrong((id *)&v104 + 1, 0);
  objc_storeStrong(&v105, 0);
  objc_storeStrong(&v106, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong(location, 0);
  id v22 = v111;

  return v22;
}

- (id)replicateArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = a4;
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = [location[0] objectForKey:InputArray];
  id v20 = [location[0] objectForKey:NumberOfCopies];
  id v19 = [location[0] objectForKey:OutputArray];
  if (v21 && v19 && v20)
  {
    id v17 = [(NSMutableDictionary *)v25->_coreDictionary objectForKey:v21];
    if (v17)
    {
      id v16 = objc_alloc_init((Class)NSMutableArray);
      for (uint64_t i = 0; i < (uint64_t)[v20 longValue]; ++i)
      {
        for (unint64_t j = 0; j < (unint64_t)[v17 count]; ++j)
        {
          id v11 = [v17 objectAtIndex:j];
          objc_msgSend(v16, "addObject:");
        }
      }
      [(NSMutableDictionary *)v25->_coreDictionary setObject:v16 forKey:v19];
      uint64_t v26 = +[NSNumber numberWithLong:1];
      int v18 = 1;
      objc_storeStrong(&v16, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v22 code:33 userInfo:0];
      *id v23 = v8;
      uint64_t v26 = 0;
      int v18 = 1;
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v22 code:45 userInfo:0];
    *id v23 = v6;
    uint64_t v26 = 0;
    int v18 = 1;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  id v9 = v26;

  return v9;
}

- (id)requestData:(id)a3 withUseStubs:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  v126 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v124 = a4;
  v123 = a5;
  id v122 = 0;
  objc_storeStrong(&v122, a6);
  id v121 = [location[0] objectForKey:FeatureName];
  id v120 = [location[0] objectForKey:OutputArray];
  id v119 = [location[0] objectForKey:Domain];
  id v118 = [location[0] objectForKey:CustomDescriptor];
  id v117 = [location[0] objectForKey:SchemaVersion];
  id v116 = [location[0] objectForKey:KeySuffix];
  id v115 = [location[0] objectForKey:ValueSuffix];
  id v114 = [location[0] objectForKey:DictOfArraysPrefix];
  id v113 = [location[0] objectForKey:IterateOverNumbers];
  if (!v121 || !v120 || !v119)
  {
    id v6 = objc_alloc((Class)NSError);
    id v7 = [v6 initWithDomain:v122 code:62 userInfo:0];
    id *v123 = v7;
    v127 = 0;
    int v112 = 1;
    goto LABEL_120;
  }
  if (!v116 || !v115)
  {
    objc_storeStrong(&v116, DefaultKeySuffix);
    objc_storeStrong(&v115, DefaultValueSuffix);
  }
  if (!v114)
  {
    id v114 = [v120 stringByAppendingString:Underscore];
  }
  id v8 = objc_alloc((Class)AMDClientRequestEvent);
  id v111 = [v8 initWithFeatureName:v121 withAccountDSID:0 andAccountStoreFrontId:0 inDomain:v119 withCustomDescriptor:v118 andSchemaVersion:v117];
  if (v111)
  {
    id v110 = 0;
    if (v124)
    {
      id v11 = [v126->_myAMDClient getFeatureStub:v111];
      id v12 = v110;
      id v110 = v11;
    }
    else
    {
      for (int i = 0; i < 3; ++i)
      {
        id v13 = [v126->_myAMDClient getFeature:v111];
        id v14 = v110;
        id v110 = v13;

        char v107 = 0;
        unsigned __int8 v73 = 0;
        if (v110)
        {
          id v108 = [v110 objectForKey:AMD_CLIENT_STATUS];
          char v107 = 1;
          unsigned __int8 v73 = [v108 isEqual:AMD_CLIENT_STATUS_OK];
        }
        if (v107) {

        }
        if (v73) {
          break;
        }
      }
    }
    if (!v110)
    {
      id v15 = objc_alloc((Class)NSError);
      id v16 = [v15 initWithDomain:v122 code:64 userInfo:0];
      id *v123 = v16;
      v127 = 0;
      int v112 = 1;
LABEL_118:
      objc_storeStrong(&v110, 0);
      goto LABEL_119;
    }
    id v106 = [v110 objectForKey:AMD_CLIENT_STATUS];
    if (([v106 isEqual:AMD_CLIENT_STATUS_OK] & 1) == 0)
    {
      id v17 = objc_alloc((Class)NSError);
      id v18 = [v17 initWithDomain:v122 code:65 userInfo:0];
      id *v123 = v18;
      v127 = 0;
      int v112 = 1;
LABEL_117:
      objc_storeStrong(&v106, 0);
      goto LABEL_118;
    }
    id v105 = [v110 objectForKey:AMD_CLIENT_DATA];
    if (!v105)
    {
      id v19 = objc_alloc((Class)NSError);
      id v20 = [v19 initWithDomain:v122 code:66 userInfo:0];
      id *v123 = v20;
      v127 = 0;
      int v112 = 1;
LABEL_116:
      objc_storeStrong(&v105, 0);
      goto LABEL_117;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v104 = v105;
      [(NSMutableDictionary *)v126->_coreDictionary setObject:v104 forKey:v120];
      v127 = +[NSNumber numberWithLong:1];
      int v112 = 1;
      objc_storeStrong(&v104, 0);
      goto LABEL_116;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v31 = objc_alloc((Class)NSError);
      id v32 = [v31 initWithDomain:v122 code:108 userInfo:0];
      id *v123 = v32;
      v127 = 0;
      int v112 = 1;
      goto LABEL_116;
    }
    id v103 = v105;
    id v102 = 0;
    memset(__b, 0, sizeof(__b));
    id v71 = v103;
    id v72 = [v71 countByEnumeratingWithState:__b objects:v132 count:16];
    if (v72)
    {
      uint64_t v68 = *(void *)__b[2];
      uint64_t v69 = 0;
      id v70 = v72;
      while (1)
      {
        uint64_t v67 = v69;
        if (*(void *)__b[2] != v68) {
          objc_enumerationMutation(v71);
        }
        uint64_t v101 = *(void *)(__b[1] + 8 * v69);
        id v99 = [v103 objectForKey:v101];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v102)
          {
            objc_storeStrong(&v102, IsAnArray);
LABEL_53:
            int v112 = 0;
            goto LABEL_54;
          }
          if ([v102 isEqual:IsAnArray]) {
            goto LABEL_53;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (!v102)
            {
              objc_storeStrong(&v102, IsANumber);
              goto LABEL_53;
            }
            if ([v102 isEqual:IsANumber]) {
              goto LABEL_53;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v23 = objc_alloc((Class)NSError);
              id v24 = [v23 initWithDomain:v122 code:108 userInfo:0];
              id *v123 = v24;
              v127 = 0;
              int v112 = 1;
              goto LABEL_54;
            }
            if (!v102)
            {
              objc_storeStrong(&v102, IsADictionary);
              goto LABEL_53;
            }
            if ([v102 isEqual:IsADictionary]) {
              goto LABEL_53;
            }
          }
        }
        id v21 = objc_alloc((Class)NSError);
        id v22 = [v21 initWithDomain:v122 code:107 userInfo:0];
        id *v123 = v22;
        v127 = 0;
        int v112 = 1;
LABEL_54:
        objc_storeStrong(&v99, 0);
        if (v112) {
          goto LABEL_58;
        }
        ++v69;
        if (v67 + 1 >= (unint64_t)v70)
        {
          uint64_t v69 = 0;
          id v70 = [v71 countByEnumeratingWithState:__b objects:v132 count:16];
          if (!v70) {
            break;
          }
        }
      }
    }
    int v112 = 0;
LABEL_58:

    if (v112)
    {
LABEL_113:
      objc_storeStrong(&v102, 0);
      objc_storeStrong(&v103, 0);
      if (!v112)
      {
        v127 = +[NSNumber numberWithLong:1];
        int v112 = 1;
      }
      goto LABEL_116;
    }
    if ([v102 isEqual:IsANumber])
    {
      id v98 = objc_alloc_init((Class)NSMutableArray);
      id v97 = objc_alloc_init((Class)NSMutableArray);
      if (v113 && ([v113 isEqual:IterateOverNumbers] & 1) != 0)
      {
        memset(v95, 0, sizeof(v95));
        id v65 = v103;
        id v66 = [v65 countByEnumeratingWithState:v95 objects:v131 count:16];
        if (v66)
        {
          uint64_t v62 = *(void *)v95[2];
          uint64_t v63 = 0;
          id v64 = v66;
          while (1)
          {
            uint64_t v61 = v63;
            if (*(void *)v95[2] != v62) {
              objc_enumerationMutation(v65);
            }
            uint64_t v96 = *(void *)(v95[1] + 8 * v63);
            [v98 addObject:v96];
            id v94 = [v103 objectForKey:v96];
            [v97 addObject:v94];
            objc_storeStrong(&v94, 0);
            ++v63;
            if (v61 + 1 >= (unint64_t)v64)
            {
              uint64_t v63 = 0;
              id v64 = [v65 countByEnumeratingWithState:v95 objects:v131 count:16];
              if (!v64) {
                break;
              }
            }
          }
        }
      }
      else
      {
        memset(v92, 0, sizeof(v92));
        id v59 = v103;
        id v60 = [v59 countByEnumeratingWithState:v92 objects:v130 count:16];
        if (v60)
        {
          uint64_t v56 = *(void *)v92[2];
          uint64_t v57 = 0;
          id v58 = v60;
          while (1)
          {
            uint64_t v55 = v57;
            if (*(void *)v92[2] != v56) {
              objc_enumerationMutation(v59);
            }
            id v93 = *(id *)(v92[1] + 8 * v57);
            id v53 = v98;
            id v54 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v93 longLongValue]);
            objc_msgSend(v53, "addObject:");

            id v91 = [v103 objectForKey:v93];
            [v97 addObject:v91];
            objc_storeStrong(&v91, 0);
            ++v57;
            if (v55 + 1 >= (unint64_t)v58)
            {
              uint64_t v57 = 0;
              id v58 = [v59 countByEnumeratingWithState:v92 objects:v130 count:16];
              if (!v58) {
                break;
              }
            }
          }
        }
      }
      id v90 = [v120 stringByAppendingString:v116];
      id v89 = [v120 stringByAppendingString:v115];
      [(NSMutableDictionary *)v126->_coreDictionary setObject:v98 forKey:v90];
      [(NSMutableDictionary *)v126->_coreDictionary setObject:v97 forKey:v89];
      objc_storeStrong(&v89, 0);
      objc_storeStrong(&v90, 0);
      objc_storeStrong(&v97, 0);
      objc_storeStrong(&v98, 0);
LABEL_112:
      int v112 = 0;
      goto LABEL_113;
    }
    if ([v102 isEqual:IsAnArray])
    {
      memset(v87, 0, sizeof(v87));
      id v51 = v103;
      id v52 = [v51 countByEnumeratingWithState:v87 objects:v129 count:16];
      if (v52)
      {
        uint64_t v48 = *(void *)v87[2];
        uint64_t v49 = 0;
        id v50 = v52;
        while (1)
        {
          uint64_t v47 = v49;
          if (*(void *)v87[2] != v48) {
            objc_enumerationMutation(v51);
          }
          uint64_t v88 = *(void *)(v87[1] + 8 * v49);
          id v86 = [v114 stringByAppendingString:v88];
          coreDictionary = v126->_coreDictionary;
          id v46 = [v103 objectForKey:v88];
          -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

          objc_storeStrong(&v86, 0);
          ++v49;
          if (v47 + 1 >= (unint64_t)v50)
          {
            uint64_t v49 = 0;
            id v50 = [v51 countByEnumeratingWithState:v87 objects:v129 count:16];
            if (!v50) {
              break;
            }
          }
        }
      }

      goto LABEL_112;
    }
    if (([v102 isEqual:IsADictionary] & 1) == 0)
    {
      id v29 = objc_alloc((Class)NSError);
      id v30 = [v29 initWithDomain:v122 code:108 userInfo:0];
      id *v123 = v30;
      v127 = 0;
      int v112 = 1;
      goto LABEL_113;
    }
    id v85 = [location[0] objectForKey:SubKeyDictOfDicts];
    if (!v85)
    {
      id v25 = objc_alloc((Class)NSError);
      id v26 = [v25 initWithDomain:v122 code:62 userInfo:0];
      id *v123 = v26;
      v127 = 0;
      int v112 = 1;
      goto LABEL_109;
    }
    id v84 = [location[0] objectForKey:SubKeyForSkippingTypes];
    id v83 = [location[0] objectForKey:TypesToSkip];
    memset(v81, 0, sizeof(v81));
    id v43 = v103;
    id v44 = [v43 countByEnumeratingWithState:v81 objects:v128 count:16];
    if (!v44)
    {
LABEL_105:
      int v112 = 0;
LABEL_106:

      if (!v112) {
        int v112 = 0;
      }
      objc_storeStrong(&v83, 0);
      objc_storeStrong(&v84, 0);
LABEL_109:
      objc_storeStrong(&v85, 0);
      if (v112) {
        goto LABEL_113;
      }
      goto LABEL_112;
    }
    uint64_t v40 = *(void *)v81[2];
    uint64_t v41 = 0;
    id v42 = v44;
    while (1)
    {
      uint64_t v39 = v41;
      if (*(void *)v81[2] != v40) {
        objc_enumerationMutation(v43);
      }
      uint64_t v82 = *(void *)(v81[1] + 8 * v41);
      id v80 = [v103 objectForKey:v82];
      if (!v84 && !v83) {
        break;
      }
      if (v84 && v83)
      {
        id v78 = [v80 objectForKey:v84];
        if (([v83 containsObject:v78] & 1) == 0)
        {
          id v77 = [v114 stringByAppendingString:v82];
          uint64_t v35 = v126->_coreDictionary;
          id v36 = [v80 objectForKey:v85];
          -[NSMutableDictionary setObject:forKey:](v35, "setObject:forKey:");

          objc_storeStrong(&v77, 0);
        }
        objc_storeStrong(&v78, 0);
        goto LABEL_101;
      }
      id v27 = objc_alloc((Class)NSError);
      id v28 = [v27 initWithDomain:v122 code:62 userInfo:0];
      id *v123 = v28;
      v127 = 0;
      int v112 = 1;
LABEL_102:
      objc_storeStrong(&v80, 0);
      if (v112) {
        goto LABEL_106;
      }
      ++v41;
      if (v39 + 1 >= (unint64_t)v42)
      {
        uint64_t v41 = 0;
        id v42 = [v43 countByEnumeratingWithState:v81 objects:v128 count:16];
        if (!v42) {
          goto LABEL_105;
        }
      }
    }
    id v79 = [v114 stringByAppendingString:v82];
    uint64_t v37 = v126->_coreDictionary;
    id v38 = [v80 objectForKey:v85];
    -[NSMutableDictionary setObject:forKey:](v37, "setObject:forKey:");

    objc_storeStrong(&v79, 0);
LABEL_101:
    int v112 = 0;
    goto LABEL_102;
  }
  id v9 = objc_alloc((Class)NSError);
  id v10 = [v9 initWithDomain:v122 code:63 userInfo:0];
  id *v123 = v10;
  v127 = 0;
  int v112 = 1;
LABEL_119:
  objc_storeStrong(&v111, 0);
LABEL_120:
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, 0);
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(&v119, 0);
  objc_storeStrong(&v120, 0);
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(location, 0);
  unint64_t v33 = v127;

  return v33;
}

- (id)sampleFromDistribution:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  uint64_t v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v45 = a4;
  id v44 = 0;
  objc_storeStrong(&v44, a5);
  id v43 = [location[0] objectForKey:OutputArray];
  id v42 = [location[0] objectForKey:Mapping];
  id v41 = [location[0] objectForKey:NumNegSamps];
  id v40 = [location[0] objectForKey:NumNegSampsLikeOtherArray];
  if (!v40) {
    goto LABEL_10;
  }
  id v39 = [(NSMutableDictionary *)v47->_coreDictionary objectForKey:v40];
  id v38 = [location[0] objectForKey:NumNegSampsLikeOtherArrayMultiplier];
  id v37 = [location[0] objectForKey:NumNegSampsLikeOtherArrayOffset];
  if (v39 && v38 && v37)
  {
    id v7 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v37 longValue]+ (void)objc_msgSend(v39, "count") * (void)objc_msgSend(v38, "longValue"));
    id v8 = v41;
    id v41 = v7;

    int v36 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v44 code:46 userInfo:0];
    *unint64_t v45 = v6;
    uint64_t v48 = 0;
    int v36 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  if (!v36)
  {
LABEL_10:
    if (v43 && v42 && v41)
    {
      id v35 = [(AMDDODMLAttachmentProcessor *)v47->_attachmentsProcessor negSampleArrayForKey:v42];
      if (v35)
      {
        id v34 = objc_alloc_init((Class)NSMutableArray);
        for (int i = 0; i < (uint64_t)[v41 longValue]; ++i)
        {
          double v32 = (double)(arc4random() % 0x80000000) / 2147483650.0;
          id v23 = +[NSNumber numberWithDouble:v32];
          objc_msgSend(v34, "addObject:");
        }
        id v31 = +[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:1];
        id v49 = v31;
        id v22 = +[NSArray arrayWithObjects:&v49 count:1];
        id v30 = objc_msgSend(v34, "sortedArrayUsingDescriptors:");

        uint64_t v29 = 0;
        uint64_t v28 = 0;
        id v27 = [v30 count];
        id v26 = objc_alloc_init((Class)NSMutableArray);
        while (v28 < (uint64_t)v27)
        {
          id v20 = [v30 objectAtIndexedSubscript:v28];
          [v20 doubleValue];
          double v19 = v13;
          id v18 = [v35 objectAtIndexedSubscript:v29];
          [v18 doubleValue];
          BOOL v21 = v19 > v14;

          if (v21)
          {
            ++v29;
          }
          else
          {
            id v17 = +[NSNumber numberWithLong:v29];
            objc_msgSend(v26, "addObject:");

            ++v28;
          }
        }
        [(NSMutableDictionary *)v47->_coreDictionary setObject:v26 forKey:v43];
        uint64_t v48 = +[NSNumber numberWithLong:1];
        int v36 = 1;
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v34, 0);
      }
      else
      {
        id v11 = objc_alloc((Class)NSError);
        id v12 = [v11 initWithDomain:v44 code:23 userInfo:0];
        *unint64_t v45 = v12;
        uint64_t v48 = 0;
        int v36 = 1;
      }
      objc_storeStrong(&v35, 0);
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:v44 code:46 userInfo:0];
      *unint64_t v45 = v10;
      uint64_t v48 = 0;
      int v36 = 1;
    }
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  id v15 = v48;

  return v15;
}

- (id)sortArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v116 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v114 = a4;
  id v113 = 0;
  objc_storeStrong(&v113, a5);
  id v112 = [location[0] objectForKey:InputArray];
  id v111 = [location[0] objectForKey:OutputArray];
  *((void *)&v110 + 1) = [location[0] objectForKey:OtherAffectedVectorsOutputKeys];
  *(void *)&long long v110 = [location[0] objectForKey:OtherAffectedVectors];
  if (v110 == 0)
  {
    *((void *)&v110 + 1) = objc_alloc_init((Class)NSDictionary);

    *(void *)&long long v110 = objc_alloc_init((Class)NSDictionary);
LABEL_31:
    if (v112 && v111)
    {
      id v103 = [(NSMutableDictionary *)v116->_coreDictionary objectForKey:v112];
      if (v103)
      {
        id v102 = objc_alloc_init((Class)NSMutableDictionary);
        memset(v100, 0, sizeof(v100));
        id v58 = *((id *)&v110 + 1);
        id v59 = [v58 countByEnumeratingWithState:v100 objects:v121 count:16];
        if (v59)
        {
          uint64_t v55 = *(void *)v100[2];
          uint64_t v56 = 0;
          id v57 = v59;
          while (1)
          {
            uint64_t v54 = v56;
            if (*(void *)v100[2] != v55) {
              objc_enumerationMutation(v58);
            }
            uint64_t v101 = *(void *)(v100[1] + 8 * v56);
            id v99 = [*((id *)&v110 + 1) objectForKey:v101];
            id v52 = v102;
            id v53 = objc_alloc_init((Class)NSMutableArray);
            objc_msgSend(v52, "setObject:forKey:");

            objc_storeStrong(&v99, 0);
            ++v56;
            if (v54 + 1 >= (unint64_t)v57)
            {
              uint64_t v56 = 0;
              id v57 = [v58 countByEnumeratingWithState:v100 objects:v121 count:16];
              if (!v57) {
                break;
              }
            }
          }
        }

        id v98 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t i = 0; ; ++i)
        {
          unint64_t v51 = i;
          if (v51 >= (unint64_t)[v103 count]) {
            break;
          }
          id v50 = [v103 objectAtIndex:i];
          v120[0] = v50;
          id v49 = +[NSNumber numberWithLong:i];
          v120[1] = v49;
          uint64_t v96 = +[NSArray arrayWithObjects:v120 count:2];

          [v98 addObject:v96];
          objc_storeStrong((id *)&v96, 0);
        }
        id v95 = [v98 sortedArrayUsingComparator:&stru_100024258];
        id v94 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t j = 0; ; ++j)
        {
          unint64_t v48 = j;
          if (v48 >= (unint64_t)[v95 count]) {
            break;
          }
          id v92 = [v95 objectAtIndex:j];
          id v46 = v94;
          id v47 = [v92 lastObject];
          objc_msgSend(v46, "addObject:");

          objc_storeStrong(&v92, 0);
        }
        id v91 = objc_alloc_init((Class)NSMutableArray);
        for (unint64_t k = 0; ; ++k)
        {
          unint64_t v45 = k;
          if (v45 >= (unint64_t)[v103 count]) {
            break;
          }
          id v89 = 0;
          id v39 = [v94 objectAtIndex:k];
          id v40 = [v39 longValue];

          id v89 = v40;
          id v41 = v91;
          id v42 = [v103 objectAtIndex:v40];
          objc_msgSend(v41, "addObject:");

          memset(v87, 0, sizeof(v87));
          id v43 = *((id *)&v110 + 1);
          id v44 = [v43 countByEnumeratingWithState:v87 objects:v119 count:16];
          if (v44)
          {
            uint64_t v36 = *(void *)v87[2];
            uint64_t v37 = 0;
            id v38 = v44;
            while (1)
            {
              uint64_t v35 = v37;
              if (*(void *)v87[2] != v36) {
                objc_enumerationMutation(v43);
              }
              uint64_t v88 = *(void *)(v87[1] + 8 * v37);
              id v86 = [(id)v110 objectForKey:v88];
              id v85 = [*((id *)&v110 + 1) objectForKey:v88];
              id v84 = [v102 objectForKey:v85];
              for (uint64_t m = 0; ; ++m)
              {
                uint64_t v34 = m;
                if (v34 >= (uint64_t)[v86 longValue]) {
                  break;
                }
                unint64_t v82 = 0;
                id v32 = v89;
                id v19 = [v86 longValue];
                unint64_t v82 = (void)v32 * (void)v19 + m;
                id v81 = [(NSMutableDictionary *)v116->_coreDictionary objectForKey:v88];
                unint64_t v33 = v82;
                if (v33 < (unint64_t)[v81 count])
                {
                  id v80 = [v81 objectAtIndex:v82];
                  [v84 addObject:v80];
                  objc_storeStrong(&v80, 0);
                  int v109 = 0;
                }
                else
                {
                  id v20 = objc_alloc((Class)NSError);
                  id v21 = [v20 initWithDomain:v113 code:26 userInfo:0];
                  *id v114 = v21;
                  id v117 = 0;
                  int v109 = 1;
                }
                objc_storeStrong(&v81, 0);
                if (v109) {
                  goto LABEL_62;
                }
              }
              int v109 = 0;
LABEL_62:
              objc_storeStrong(&v84, 0);
              objc_storeStrong(&v85, 0);
              objc_storeStrong(&v86, 0);
              if (v109) {
                break;
              }
              ++v37;
              if (v35 + 1 >= (unint64_t)v38)
              {
                uint64_t v37 = 0;
                id v38 = [v43 countByEnumeratingWithState:v87 objects:v119 count:16];
                if (!v38) {
                  goto LABEL_65;
                }
              }
            }
          }
          else
          {
LABEL_65:
            int v109 = 0;
          }

          if (v109) {
            goto LABEL_75;
          }
        }
        memset(v78, 0, sizeof(v78));
        id v30 = v102;
        id v31 = [v30 countByEnumeratingWithState:v78 objects:v118 count:16];
        if (v31)
        {
          uint64_t v27 = *(void *)v78[2];
          uint64_t v28 = 0;
          id v29 = v31;
          while (1)
          {
            uint64_t v26 = v28;
            if (*(void *)v78[2] != v27) {
              objc_enumerationMutation(v30);
            }
            uint64_t v79 = *(void *)(v78[1] + 8 * v28);
            coreDictionary = v116->_coreDictionary;
            id v25 = [v102 objectForKey:v79];
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v28;
            if (v26 + 1 >= (unint64_t)v29)
            {
              uint64_t v28 = 0;
              id v29 = [v30 countByEnumeratingWithState:v78 objects:v118 count:16];
              if (!v29) {
                break;
              }
            }
          }
        }

        [(NSMutableDictionary *)v116->_coreDictionary setObject:v91 forKey:v111];
        id v117 = +[NSNumber numberWithLong:1];
        int v109 = 1;
LABEL_75:
        objc_storeStrong(&v91, 0);
        objc_storeStrong(&v94, 0);
        objc_storeStrong(&v95, 0);
        objc_storeStrong(&v98, 0);
        objc_storeStrong(&v102, 0);
      }
      else
      {
        id v17 = objc_alloc((Class)NSError);
        id v18 = [v17 initWithDomain:v113 code:104 userInfo:0];
        *id v114 = v18;
        id v117 = 0;
        int v109 = 1;
      }
      objc_storeStrong(&v103, 0);
    }
    else
    {
      id v15 = objc_alloc((Class)NSError);
      id v16 = [v15 initWithDomain:v113 code:103 userInfo:0];
      *id v114 = v16;
      id v117 = 0;
      int v109 = 1;
    }
    goto LABEL_77;
  }
  if (!*((void *)&v110 + 1) || !(void)v110)
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v113 code:103 userInfo:0];
    *id v114 = v6;
    id v117 = 0;
    int v109 = 1;
    goto LABEL_77;
  }
  memset(__b, 0, sizeof(__b));
  id v74 = *((id *)&v110 + 1);
  id v75 = [v74 countByEnumeratingWithState:__b objects:v123 count:16];
  if (v75)
  {
    uint64_t v71 = *(void *)__b[2];
    uint64_t v72 = 0;
    id v73 = v75;
    while (1)
    {
      uint64_t v70 = v72;
      if (*(void *)__b[2] != v71) {
        objc_enumerationMutation(v74);
      }
      uint64_t v108 = *(void *)(__b[1] + 8 * v72);
      id v7 = [(id)v110 objectForKey:v108];
      BOOL v69 = v7 != 0;

      if (!v69) {
        break;
      }
      id v67 = [(id)v110 objectForKey:v108];
      BOOL v68 = (uint64_t)[v67 longValue] >= 1;

      if (!v68) {
        break;
      }
      ++v72;
      if (v70 + 1 >= (unint64_t)v73)
      {
        uint64_t v72 = 0;
        id v73 = [v74 countByEnumeratingWithState:__b objects:v123 count:16];
        if (!v73) {
          goto LABEL_15;
        }
      }
    }
    id v8 = objc_alloc((Class)NSError);
    id v9 = [v8 initWithDomain:v113 code:103 userInfo:0];
    *id v114 = v9;
    id v117 = 0;
    int v109 = 1;
  }
  else
  {
LABEL_15:
    int v109 = 0;
  }

  if (!v109)
  {
    memset(v105, 0, sizeof(v105));
    id v65 = (id)v110;
    id v66 = [v65 countByEnumeratingWithState:v105 objects:v122 count:16];
    if (v66)
    {
      uint64_t v62 = *(void *)v105[2];
      uint64_t v63 = 0;
      id v64 = v66;
      while (1)
      {
        uint64_t v61 = v63;
        if (*(void *)v105[2] != v62) {
          objc_enumerationMutation(v65);
        }
        uint64_t v106 = *(void *)(v105[1] + 8 * v63);
        id v10 = [*((id *)&v110 + 1) objectForKey:v106];
        BOOL v60 = v10 != 0;

        if (!v60) {
          break;
        }
        id v104 = [(NSMutableDictionary *)v116->_coreDictionary objectForKey:v106];
        if (v104)
        {
          int v109 = 0;
        }
        else
        {
          id v13 = objc_alloc((Class)NSError);
          id v14 = [v13 initWithDomain:v113 code:103 userInfo:0];
          *id v114 = v14;
          id v117 = 0;
          int v109 = 1;
        }
        objc_storeStrong(&v104, 0);
        if (v109) {
          goto LABEL_30;
        }
        ++v63;
        if (v61 + 1 >= (unint64_t)v64)
        {
          uint64_t v63 = 0;
          id v64 = [v65 countByEnumeratingWithState:v105 objects:v122 count:16];
          if (!v64) {
            goto LABEL_29;
          }
        }
      }
      id v11 = objc_alloc((Class)NSError);
      id v12 = [v11 initWithDomain:v113 code:103 userInfo:0];
      *id v114 = v12;
      id v117 = 0;
      int v109 = 1;
    }
    else
    {
LABEL_29:
      int v109 = 0;
    }
LABEL_30:

    if (!v109) {
      goto LABEL_31;
    }
  }
LABEL_77:
  objc_storeStrong((id *)&v110, 0);
  objc_storeStrong((id *)&v110 + 1, 0);
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&v112, 0);
  objc_storeStrong(&v113, 0);
  objc_storeStrong(location, 0);
  id v22 = v117;

  return v22;
}

- (id)spliceArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = a4;
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  id v37 = [location[0] objectForKey:Starting];
  id v36 = [location[0] objectForKey:Ending];
  id v35 = [location[0] objectForKey:InputArray];
  id v34 = [location[0] objectForKey:OutputArray];
  id v33 = [location[0] objectForKey:StartingLikeOtherArray];
  id v32 = [location[0] objectForKey:EndingLikeOtherArray];
  if (!v33) {
    goto LABEL_36;
  }
  id v31 = [(NSMutableDictionary *)v41->_coreDictionary objectForKey:v33];
  id v30 = [location[0] objectForKey:StartingLikeOtherArrayMultiplier];
  id v29 = [location[0] objectForKey:StartingLikeOtherArrayOffset];
  if (v31 && v30 && v29)
  {
    id v7 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v29 longValue]+ (void)objc_msgSend(v31, "count") * (void)objc_msgSend(v30, "longValue"));
    id v8 = v37;
    id v37 = v7;

    int v28 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v38 code:47 userInfo:0];
    *id v39 = v6;
    id v42 = 0;
    int v28 = 1;
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  if (!v28)
  {
LABEL_36:
    if (!v32) {
      goto LABEL_18;
    }
    id v27 = [(NSMutableDictionary *)v41->_coreDictionary objectForKey:v32];
    id v26 = [location[0] objectForKey:EndingLikeOtherArrayMultiplier];
    id v25 = [location[0] objectForKey:EndingLikeOtherArrayOffset];
    if (v27 && v26 && v25)
    {
      id v11 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v25 longValue]+ (void)objc_msgSend(v27, "count") * (void)objc_msgSend(v26, "longValue"));
      id v12 = v36;
      id v36 = v11;

      int v28 = 0;
    }
    else
    {
      id v9 = objc_alloc((Class)NSError);
      id v10 = [v9 initWithDomain:v38 code:47 userInfo:0];
      *id v39 = v10;
      id v42 = 0;
      int v28 = 1;
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    if (!v28)
    {
LABEL_18:
      if (v35 && v34 && v37 && v36)
      {
        id v24 = [(NSMutableDictionary *)v41->_coreDictionary objectForKey:v35];
        if (v24)
        {
          id v23 = objc_alloc_init((Class)NSMutableArray);
          for (uint64_t i = 0; i < (unint64_t)[v24 count]; ++i)
          {
            if (i >= (uint64_t)[v37 longValue] && i < (uint64_t)objc_msgSend(v36, "longValue"))
            {
              id v19 = [v24 objectAtIndex:i];
              objc_msgSend(v23, "addObject:");
            }
          }
          [(NSMutableDictionary *)v41->_coreDictionary setObject:v23 forKey:v34];
          id v42 = +[NSNumber numberWithLong:1];
          int v28 = 1;
          objc_storeStrong(&v23, 0);
        }
        else
        {
          id v15 = objc_alloc((Class)NSError);
          id v16 = [v15 initWithDomain:v38 code:34 userInfo:0];
          *id v39 = v16;
          id v42 = 0;
          int v28 = 1;
        }
        objc_storeStrong(&v24, 0);
      }
      else
      {
        id v13 = objc_alloc((Class)NSError);
        id v14 = [v13 initWithDomain:v38 code:47 userInfo:0];
        *id v39 = v14;
        id v42 = 0;
        int v28 = 1;
      }
    }
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
  id v17 = v42;

  return v17;
}

- (id)strideCopyArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = a4;
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = [location[0] objectForKey:StridesForSample];
  id v26 = [location[0] objectForKey:ElementsInSample];
  id v25 = [location[0] objectForKey:InputArray];
  id v24 = [location[0] objectForKey:OutputArray];
  id v23 = [location[0] objectForKey:Starting];
  if (!v23) {
    objc_storeStrong(&v23, &off_1000258E8);
  }
  if (v25 && v24 && v26 && v27)
  {
    id v21 = [(NSMutableDictionary *)v31->_coreDictionary objectForKey:v25];
    if (v21)
    {
      id v20 = objc_alloc_init((Class)NSMutableArray);
      id v13 = [v21 count];
      int64_t v19 = v13 - (unsigned char *)[v26 longValue];
      for (uint64_t i = (uint64_t)[v23 longValue]; i <= v19; i += (uint64_t)v9)
      {
        for (uint64_t j = 0; ; ++j)
        {
          uint64_t v12 = j;
          if (v12 >= (uint64_t)[v26 longValue]) {
            break;
          }
          id v16 = [v21 objectAtIndex:i + j];
          [v20 addObject:v16];
          objc_storeStrong(&v16, 0);
        }
        id v9 = [v27 longValue];
      }
      [(NSMutableDictionary *)v31->_coreDictionary setObject:v20 forKey:v24];
      id v32 = +[NSNumber numberWithLong:1];
      int v22 = 1;
      objc_storeStrong(&v20, 0);
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      id v8 = [v7 initWithDomain:v28 code:35 userInfo:0];
      *id v29 = v8;
      id v32 = 0;
      int v22 = 1;
    }
    objc_storeStrong(&v21, 0);
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v28 code:48 userInfo:0];
    *id v29 = v6;
    id v32 = 0;
    int v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  id v10 = v32;

  return v10;
}

- (id)strideCopyAndSplitArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v65 = a4;
  id v64 = 0;
  objc_storeStrong(&v64, a5);
  id v63 = [location[0] objectForKey:StridesForSample];
  id v62 = [location[0] objectForKey:ElementsInSample];
  id v61 = [location[0] objectForKey:InputArray];
  id v60 = [location[0] objectForKey:Starting];
  if (!v60) {
    objc_storeStrong(&v60, &off_1000258E8);
  }
  id v59 = [location[0] objectForKey:SplitArrayInstructions];
  if (v59 && v61 && v62 && v63)
  {
    id v57 = 0;
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v34 = i;
      if (v34 >= (unint64_t)[v59 count]) {
        break;
      }
      id v55 = [v59 objectAtIndex:i];
      if ([v55 count] == (id)2)
      {
        id v54 = [v55 objectAtIndex:1];
        if ((uint64_t)[v54 longValue] >= 1)
        {
          id v11 = (char *)[v54 longValue];
          id v57 = &v11[(void)v57];
          int v58 = 0;
        }
        else
        {
          id v9 = objc_alloc((Class)NSError);
          id v10 = [v9 initWithDomain:v64 code:87 userInfo:0];
          *id v65 = v10;
          BOOL v68 = 0;
          int v58 = 1;
        }
        objc_storeStrong(&v54, 0);
      }
      else
      {
        id v7 = objc_alloc((Class)NSError);
        id v8 = [v7 initWithDomain:v64 code:87 userInfo:0];
        *id v65 = v8;
        BOOL v68 = 0;
        int v58 = 1;
      }
      objc_storeStrong(&v55, 0);
      if (v58) {
        goto LABEL_42;
      }
    }
    id v33 = v57;
    if (v33 == [v62 longValue])
    {
      id v53 = [(NSMutableDictionary *)v67->_coreDictionary objectForKey:v61];
      if (v53)
      {
        id v52 = objc_alloc_init((Class)NSMutableDictionary);
        for (unint64_t j = 0; ; ++j)
        {
          unint64_t v32 = j;
          if (v32 >= (unint64_t)[v59 count]) {
            break;
          }
          id v50 = [v59 objectAtIndex:j];
          id v49 = [v50 objectAtIndex:0];
          id v30 = v52;
          id v31 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v30, "setObject:forKey:");

          objc_storeStrong(&v49, 0);
          objc_storeStrong(&v50, 0);
        }
        id v29 = (char *)[v53 count];
        unint64_t v48 = &v29[-(int)[v62 intValue]];
        for (unint64_t k = (char *)[v60 longValue]; (uint64_t)k <= (uint64_t)v48; unint64_t k = &v16[(void)k])
        {
          id v46 = k;
          for (unint64_t m = 0; ; ++m)
          {
            unint64_t v28 = m;
            if (v28 >= (unint64_t)[v59 count]) {
              break;
            }
            id v44 = [v59 objectAtIndex:m];
            id v43 = [v44 objectAtIndex:0];
            id v42 = [v44 objectAtIndex:1];
            id v41 = [v52 objectForKey:v43];
            for (uint64_t n = 0; ; ++n)
            {
              uint64_t v27 = n;
              if (v27 >= (uint64_t)[v42 longValue]) {
                break;
              }
              id v39 = [v53 objectAtIndex:v46];
              [v41 addObject:v39];
              ++v46;
              objc_storeStrong(&v39, 0);
            }
            objc_storeStrong(&v41, 0);
            objc_storeStrong(&v42, 0);
            objc_storeStrong(&v43, 0);
            objc_storeStrong(&v44, 0);
          }
          id v16 = (char *)[v63 longValue];
        }
        memset(__b, 0, sizeof(__b));
        id v25 = v52;
        id v26 = [v25 countByEnumeratingWithState:__b objects:v69 count:16];
        if (v26)
        {
          uint64_t v22 = *(void *)__b[2];
          uint64_t v23 = 0;
          id v24 = v26;
          while (1)
          {
            uint64_t v21 = v23;
            if (*(void *)__b[2] != v22) {
              objc_enumerationMutation(v25);
            }
            uint64_t v38 = *(void *)(__b[1] + 8 * v23);
            coreDictionary = v67->_coreDictionary;
            id v20 = [v52 objectForKey:v38];
            -[NSMutableDictionary setObject:forKey:](coreDictionary, "setObject:forKey:");

            ++v23;
            if (v21 + 1 >= (unint64_t)v24)
            {
              uint64_t v23 = 0;
              id v24 = [v25 countByEnumeratingWithState:__b objects:v69 count:16];
              if (!v24) {
                break;
              }
            }
          }
        }

        BOOL v68 = +[NSNumber numberWithLong:1];
        int v58 = 1;
        objc_storeStrong(&v52, 0);
      }
      else
      {
        id v14 = objc_alloc((Class)NSError);
        id v15 = [v14 initWithDomain:v64 code:84 userInfo:0];
        *id v65 = v15;
        BOOL v68 = 0;
        int v58 = 1;
      }
      objc_storeStrong(&v53, 0);
    }
    else
    {
      id v12 = objc_alloc((Class)NSError);
      id v13 = [v12 initWithDomain:v64 code:87 userInfo:0];
      *id v65 = v13;
      BOOL v68 = 0;
      int v58 = 1;
    }
  }
  else
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v64 code:87 userInfo:0];
    *id v65 = v6;
    BOOL v68 = 0;
    int v58 = 1;
  }
LABEL_42:
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  id v17 = v68;

  return v17;
}

- (id)twoArrayMathFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v58 = a4;
  id v57 = 0;
  objc_storeStrong(&v57, a5);
  id v56 = [location[0] objectForKey:InputArray];
  id v55 = [location[0] objectForKey:OutputArray];
  id v54 = [location[0] objectForKey:SecondArray];
  id v53 = [location[0] objectForKey:Operation];
  if (!v56 || !v55 || !v54 || !v53)
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v57 code:88 userInfo:0];
    *int v58 = v6;
    id v61 = 0;
    int v52 = 1;
    goto LABEL_35;
  }
  id v51 = [(NSMutableDictionary *)v60->_coreDictionary objectForKey:v56];
  id v50 = [(NSMutableDictionary *)v60->_coreDictionary objectForKey:v54];
  if (!v51 || !v50)
  {
    id v7 = objc_alloc((Class)NSError);
    id v8 = [v7 initWithDomain:v57 code:89 userInfo:0];
    *int v58 = v8;
    id v61 = 0;
    int v52 = 1;
    goto LABEL_34;
  }
  id v42 = [v51 count];
  if (v42 != [v50 count])
  {
    id v9 = objc_alloc((Class)NSError);
    id v10 = [v9 initWithDomain:v57 code:93 userInfo:0];
    *int v58 = v10;
    id v61 = 0;
    int v52 = 1;
    goto LABEL_34;
  }
  id v49 = objc_alloc_init((Class)NSMutableArray);
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v41 = i;
    if (v41 >= (unint64_t)[v51 count]) {
      break;
    }
    id v47 = [v51 objectAtIndex:i];
    id v46 = [v50 objectAtIndex:i];
    [v46 doubleValue];
    if (v11 == 0.0
      && (([v53 isEqual:Modulo] & 1) != 0
       || ([v53 isEqual:Division] & 1) != 0))
    {
      id v12 = objc_alloc((Class)NSError);
      id v13 = [v12 initWithDomain:v57 code:90 userInfo:0];
      *int v58 = v13;
      id v61 = 0;
      int v52 = 1;
      goto LABEL_30;
    }
    id v45 = 0;
    if ([v53 isEqual:Modulo])
    {
      uint64_t v40 = (uint64_t)[v47 longValue];
      id v14 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v40 % (uint64_t)[v46 longValue]);
      id v15 = v45;
      id v45 = v14;

LABEL_28:
      [v49 addObject:v45];
      int v52 = 0;
      goto LABEL_29;
    }
    if ([v53 isEqual:Division])
    {
      [v47 doubleValue];
      double v39 = v16;
      [v46 doubleValue];
      id v18 = +[NSNumber numberWithDouble:v39 / v17];
      id v19 = v45;
      id v45 = v18;

      goto LABEL_28;
    }
    if ([v53 isEqual:Multiplication])
    {
      [v47 doubleValue];
      double v38 = v20;
      [v46 doubleValue];
      uint64_t v22 = +[NSNumber numberWithDouble:v38 * v21];
      id v23 = v45;
      id v45 = v22;

      goto LABEL_28;
    }
    if ([v53 isEqual:Addition])
    {
      [v47 doubleValue];
      double v37 = v24;
      [v46 doubleValue];
      id v26 = +[NSNumber numberWithDouble:v37 + v25];
      id v27 = v45;
      id v45 = v26;

      goto LABEL_28;
    }
    if ([v53 isEqual:Subtraction])
    {
      [v47 doubleValue];
      double v36 = v28;
      [v46 doubleValue];
      id v30 = +[NSNumber numberWithDouble:v36 - v29];
      id v31 = v45;
      id v45 = v30;

      goto LABEL_28;
    }
    id v32 = objc_alloc((Class)NSError);
    id v33 = [v32 initWithDomain:v57 code:83 userInfo:0];
    *int v58 = v33;
    id v61 = 0;
    int v52 = 1;
LABEL_29:
    objc_storeStrong(&v45, 0);
LABEL_30:
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
    if (v52) {
      goto LABEL_33;
    }
  }
  [(NSMutableDictionary *)v60->_coreDictionary setObject:v49 forKey:v55];
  id v61 = +[NSNumber numberWithLong:1];
  int v52 = 1;
LABEL_33:
  objc_storeStrong(&v49, 0);
LABEL_34:
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
LABEL_35:
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
  unint64_t v34 = v61;

  return v34;
}

- (id)windowFunction:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v65 = a4;
  id v64 = 0;
  objc_storeStrong(&v64, a5);
  id v63 = [location[0] objectForKey:WindowSize];
  id v62 = [location[0] objectForKey:InputArray];
  id v61 = [location[0] objectForKey:FeatureOutput];
  id v60 = [location[0] objectForKey:ContextOutput];
  id v59 = [location[0] objectForKey:LabelOutput];
  id v58 = [location[0] objectForKey:TimeStampArrayKey];
  id v57 = [location[0] objectForKey:TimeStampMaxDistKey];
  if (!v63 || !v62 || !v61 || !v60 || !v59)
  {
    id v5 = objc_alloc((Class)NSError);
    id v6 = [v5 initWithDomain:v64 code:49 userInfo:0];
    *id v65 = v6;
    BOOL v68 = 0;
    int v56 = 1;
    goto LABEL_40;
  }
  id v55 = [(NSMutableDictionary *)v67->_coreDictionary objectForKey:v62];
  if (v55)
  {
    id v54 = 0;
    if (v58)
    {
      if (!v57 || ([v57 doubleValue], v11 <= 0.0))
      {
        id v9 = objc_alloc((Class)NSError);
        id v10 = [v9 initWithDomain:v64 code:49 userInfo:0];
        *id v65 = v10;
        BOOL v68 = 0;
        int v56 = 1;
LABEL_38:
        objc_storeStrong(&v54, 0);
        goto LABEL_39;
      }
      id v12 = [(NSMutableDictionary *)v67->_coreDictionary objectForKey:v58];
      id v13 = v54;
      id v54 = v12;

      if (!v54)
      {
        id v14 = objc_alloc((Class)NSError);
        id v15 = [v14 initWithDomain:v64 code:36 userInfo:0];
        *id v65 = v15;
        BOOL v68 = 0;
        int v56 = 1;
        goto LABEL_38;
      }
      id v35 = [v54 count];
      if (v35 != [v55 count])
      {
        id v16 = objc_alloc((Class)NSError);
        id v17 = [v16 initWithDomain:v64 code:96 userInfo:0];
        *id v65 = v17;
        BOOL v68 = 0;
        int v56 = 1;
        goto LABEL_38;
      }
    }
    id v53 = objc_alloc_init((Class)NSMutableArray);
    id v52 = objc_alloc_init((Class)NSMutableArray);
    id v51 = objc_alloc_init((Class)NSMutableArray);
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v34 = i;
      if (v34 >= (unint64_t)[v55 count]) {
        break;
      }
      id v49 = [v55 objectAtIndex:i];
      for (uint64_t j = 1; ; ++j)
      {
        uint64_t v33 = j;
        if (v33 > (uint64_t)[v63 longValue]) {
          break;
        }
        if ((uint64_t)(i - j) >= 0)
        {
          uint64_t v47 = 1;
          if (v54)
          {
            id v46 = [v54 objectAtIndex:i];
            id v45 = [v54 objectAtIndex:i - j];
            double v44 = 0.0;
            [v46 doubleValue];
            double v32 = v18;
            [v45 doubleValue];
            double v44 = vabdd_f64(v32, v19);
            [v57 doubleValue];
            if (v20 < v44) {
              uint64_t v47 = 0;
            }
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v46, 0);
          }
          if (v47 == 1)
          {
            id v43 = [v55 objectAtIndex:i - j];
            [v51 addObject:v49];
            [v53 addObject:v43];
            id v30 = v52;
            id v31 = +[NSNumber numberWithInt:1];
            objc_msgSend(v30, "addObject:");

            objc_storeStrong(&v43, 0);
          }
        }
        unint64_t v29 = i + j;
        if (v29 < (unint64_t)[v55 count])
        {
          uint64_t v42 = 1;
          if (v54)
          {
            id v41 = [v54 objectAtIndex:i];
            id v40 = [v54 objectAtIndex:i + j];
            double v39 = 0.0;
            [v41 doubleValue];
            double v28 = v21;
            [v40 doubleValue];
            double v39 = vabdd_f64(v28, v22);
            [v57 doubleValue];
            if (v23 < v39) {
              uint64_t v42 = 0;
            }
            objc_storeStrong(&v40, 0);
            objc_storeStrong(&v41, 0);
          }
          if (v42 == 1)
          {
            id v38 = [v55 objectAtIndex:i + j];
            [v51 addObject:v49];
            [v53 addObject:v38];
            id v26 = v52;
            id v27 = +[NSNumber numberWithInt:1];
            objc_msgSend(v26, "addObject:");

            objc_storeStrong(&v38, 0);
          }
        }
      }
      objc_storeStrong(&v49, 0);
    }
    [(NSMutableDictionary *)v67->_coreDictionary setObject:v51 forKey:v61];
    [(NSMutableDictionary *)v67->_coreDictionary setObject:v53 forKey:v60];
    [(NSMutableDictionary *)v67->_coreDictionary setObject:v52 forKey:v59];
    BOOL v68 = +[NSNumber numberWithLong:1];
    int v56 = 1;
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v53, 0);
    goto LABEL_38;
  }
  id v7 = objc_alloc((Class)NSError);
  id v8 = [v7 initWithDomain:v64 code:36 userInfo:0];
  *id v65 = v8;
  BOOL v68 = 0;
  int v56 = 1;
LABEL_39:
  objc_storeStrong(&v55, 0);
LABEL_40:
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  double v24 = v68;

  return v24;
}

- (void).cxx_destruct
{
}

@end