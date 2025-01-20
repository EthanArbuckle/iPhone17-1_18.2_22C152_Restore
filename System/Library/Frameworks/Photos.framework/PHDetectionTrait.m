@interface PHDetectionTrait
+ (id)detectionTraitsByFaceLocalIdentifierForFaceUUIDs:(id)a3 photoLibrary:(id)a4;
+ (id)detectionTraitsByFaceLocalIdentifierForFaceUUIDs:(id)a3 photoLibrary:(id)a4 withDetectionTraitTypes:(id)a5;
+ (id)detectionTraitsByFaceLocalIdentifierForFaces:(id)a3;
+ (id)detectionTraitsByFaceLocalIdentifierForFaces:(id)a3 withDetectionTraitTypes:(id)a4;
+ (id)detectionTraitsForDetection:(id)a3;
- (PHDetectionTrait)initWithPropertyListRepresentation:(id)a3;
- (PHDetectionTrait)initWithType:(signed __int16)a3 value:(signed __int16)a4 score:(double)a5 startTime:(double)a6 duration:(double)a7;
- (double)duration;
- (double)score;
- (double)startTime;
- (id)propertyListRepresentation;
- (signed)type;
- (signed)value;
@end

@implementation PHDetectionTrait

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)score
{
  return self->_score;
}

- (signed)value
{
  return self->_value;
}

- (signed)type
{
  return self->_type;
}

- (id)propertyListRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithShort:", -[PHDetectionTrait type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  v5 = objc_msgSend(NSNumber, "numberWithShort:", -[PHDetectionTrait value](self, "value"));
  [v3 setObject:v5 forKeyedSubscript:@"value"];

  v6 = NSNumber;
  [(PHDetectionTrait *)self score];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v7 forKeyedSubscript:@"score"];

  v8 = NSNumber;
  [(PHDetectionTrait *)self startTime];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"startTime"];

  v10 = NSNumber;
  [(PHDetectionTrait *)self duration];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"duration"];

  return v3;
}

- (PHDetectionTrait)initWithPropertyListRepresentation:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PHDetectionTrait.m", 108, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];
  }
  v6 = [v5 objectForKeyedSubscript:@"type"];
  __int16 v7 = [v6 integerValue];
  v8 = [v5 objectForKeyedSubscript:@"value"];
  __int16 v9 = [v8 integerValue];
  v10 = [v5 objectForKeyedSubscript:@"score"];
  [v10 doubleValue];
  double v12 = v11;
  v13 = [v5 objectForKeyedSubscript:@"startTime"];
  [v13 doubleValue];
  double v15 = v14;
  v16 = [v5 objectForKeyedSubscript:@"duration"];
  [v16 doubleValue];
  v18 = [(PHDetectionTrait *)self initWithType:v7 value:v9 score:v12 startTime:v15 duration:v17];

  return v18;
}

- (PHDetectionTrait)initWithType:(signed __int16)a3 value:(signed __int16)a4 score:(double)a5 startTime:(double)a6 duration:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)PHDetectionTrait;
  result = [(PHDetectionTrait *)&v13 init];
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
    result->_score = a5;
    result->_startTime = a6;
    result->_duration = a7;
  }
  return result;
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaceUUIDs:(id)a3 photoLibrary:(id)a4 withDetectionTraitTypes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__10856;
  v25 = __Block_byref_object_dispose__10857;
  id v26 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = [v8 photoLibrary];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke;
  v16[3] = &unk_1E58480A0;
  id v11 = v7;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  v20 = &v21;
  [v12 performBlockAndWait:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v14;
}

void __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v13 = 0;
  v4 = [MEMORY[0x1E4F8A7C8] fetchDetectionTraitByFaceUUIDWithFaceUUIDs:v2 library:v3 error:&v13];
  id v5 = v13;
  if (v4)
  {
    v6 = (void *)a1[6];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke_2;
    v9[3] = &unk_1E5843558;
    BOOL v12 = v6 != 0;
    id v7 = v6;
    uint64_t v8 = a1[7];
    id v10 = v7;
    uint64_t v11 = v8;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24 = +[PHObject localIdentifierWithUUID:a2];
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        if (!*(unsigned char *)(a1 + 48)
          || (id v13 = *(void **)(a1 + 32),
              objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v11), "type")), id v14 = objc_claimAutoreleasedReturnValue(), LODWORD(v13) = objc_msgSend(v13, "containsObject:", v14), v14, v13))
        {
          double v15 = [PHDetectionTrait alloc];
          uint64_t v16 = [v12 type];
          uint64_t v17 = [v12 value];
          [v12 score];
          double v19 = v18;
          [v12 startTime];
          double v21 = v20;
          [v12 duration];
          uint64_t v23 = [(PHDetectionTrait *)v15 initWithType:v16 value:v17 score:v19 startTime:v21 duration:v22];
          [v6 addObject:v23];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v6 forKeyedSubscript:v24];
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaceUUIDs:(id)a3 photoLibrary:(id)a4
{
  return (id)[a1 detectionTraitsByFaceLocalIdentifierForFaceUUIDs:a3 photoLibrary:a4 withDetectionTraitTypes:0];
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaces:(id)a3 withDetectionTraitTypes:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10)
  {
    double v18 = (void *)MEMORY[0x1E4F1CC08];
    id v12 = v9;
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  id v12 = 0;
  uint64_t v13 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v9);
      }
      double v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend(v15, "uuid", (void)v20);
      [v8 addObject:v16];

      if (!v12) {
        id v12 = v15;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);

  if (v12)
  {
    uint64_t v17 = [v12 photoLibrary];
    double v18 = [a1 detectionTraitsByFaceLocalIdentifierForFaceUUIDs:v8 photoLibrary:v17 withDetectionTraitTypes:v7];

LABEL_13:
    goto LABEL_15;
  }
  double v18 = (void *)MEMORY[0x1E4F1CC08];
LABEL_15:

  return v18;
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaces:(id)a3
{
  return (id)[a1 detectionTraitsByFaceLocalIdentifierForFaces:a3 withDetectionTraitTypes:0];
}

+ (id)detectionTraitsForDetection:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__10856;
  double v18 = __Block_byref_object_dispose__10857;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  v4 = [v3 photoLibrary];
  id v5 = [v4 photoLibrary];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__PHDetectionTrait_detectionTraitsForDetection___block_invoke;
  v10[3] = &unk_1E5848318;
  id v6 = v5;
  id v11 = v6;
  id v7 = v3;
  id v12 = v7;
  uint64_t v13 = &v14;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

void __48__PHDetectionTrait_detectionTraitsForDetection___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = [MEMORY[0x1E4F8A7B0] entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [*(id *)(a1 + 40) objectID];
  id v8 = [v6 predicateWithFormat:@"self == %@", v7];
  [v5 setPredicate:v8];

  long long v27 = v5;
  long long v28 = v2;
  id v9 = [v2 executeFetchRequest:v5 error:0];
  uint64_t v10 = [v9 firstObject];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v26 = v10;
  id v11 = [v10 detectionTraits];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        uint64_t v17 = [PHDetectionTrait alloc];
        uint64_t v18 = [v16 type];
        uint64_t v19 = [v16 value];
        [v16 score];
        double v21 = v20;
        [v16 startTime];
        double v23 = v22;
        [v16 duration];
        uint64_t v25 = [(PHDetectionTrait *)v17 initWithType:v18 value:v19 score:v21 startTime:v23 duration:v24];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v25];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
}

@end