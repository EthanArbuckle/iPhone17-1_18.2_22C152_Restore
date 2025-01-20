@interface PHPersonUserFeedbackProperties
+ (BOOL)isToMany;
+ (id)entityName;
+ (id)keyPathFromPrimaryObject;
+ (id)keyPathToPrimaryObject;
+ (id)propertiesToFetch;
+ (id)propertiesToSortBy;
+ (id)propertySetName;
- (NSOrderedSet)autonamingUserFeedbacks;
- (PHPersonUserFeedbackProperties)initWithFetchDictionary:(id)a3 person:(id)a4 prefetched:(BOOL)a5;
- (PHUserFeedback)userFeedback;
@end

@implementation PHPersonUserFeedbackProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autonamingUserFeedbacks, 0);

  objc_storeStrong((id *)&self->_userFeedback, 0);
}

- (NSOrderedSet)autonamingUserFeedbacks
{
  return self->_autonamingUserFeedbacks;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (PHPersonUserFeedbackProperties)initWithFetchDictionary:(id)a3 person:(id)a4 prefetched:(BOOL)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PHPersonUserFeedbackProperties;
  v33 = [(PHPersonUserFeedbackProperties *)&v39 init];
  if (v33)
  {
    objc_storeWeak((id *)&v33->super._person, v8);
    if (v7)
    {
      v9 = [v7 objectForKeyedSubscript:@"fetchedResults"];
      if ([v9 count])
      {
        id v31 = v8;
        id v32 = v7;
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v9, "count"));
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v30 = v9;
        id obj = v9;
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v36;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v36 != v13) {
                objc_enumerationMutation(obj);
              }
              v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
              v16 = [v15 objectForKeyedSubscript:@"uuid"];
              v17 = [v15 objectForKeyedSubscript:@"type"];
              __int16 v18 = [v17 integerValue];

              v19 = [v15 objectForKeyedSubscript:@"feature"];
              __int16 v20 = [v19 integerValue];

              v21 = [v15 objectForKeyedSubscript:@"creationType"];
              uint64_t v22 = [v21 integerValue];

              v23 = [v15 objectForKeyedSubscript:@"context"];
              v24 = [v15 objectForKeyedSubscript:@"lastModifiedDate"];
              v25 = [[PHUserFeedback alloc] initWithUUID:v16 type:v18 feature:v20 creationType:v22 context:v23 lastModifiedDate:v24];
              if ([(PHUserFeedback *)v25 feature] || v33->_userFeedback)
              {
                if ([(PHUserFeedback *)v25 feature] == 1 || [(PHUserFeedback *)v25 feature] == 2) {
                  [v10 addObject:v25];
                }
              }
              else
              {
                objc_storeStrong((id *)&v33->_userFeedback, v25);
              }

              ++v14;
            }
            while (v12 != v14);
            uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
            uint64_t v12 = v26;
          }
          while (v26);
        }

        if ([v10 count])
        {
          uint64_t v27 = [v10 copy];
          autonamingUserFeedbacks = v33->_autonamingUserFeedbacks;
          v33->_autonamingUserFeedbacks = (NSOrderedSet *)v27;
        }
        id v8 = v31;
        id v7 = v32;
        v9 = v30;
      }
    }
  }

  return v33;
}

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  v2 = (void *)propertiesToFetch_pl_once_object_24;

  return v2;
}

void __51__PHPersonUserFeedbackProperties_propertiesToFetch__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = @"uuid";
  v3[1] = @"type";
  v3[2] = @"feature";
  v3[3] = @"creationType";
  v3[4] = @"context";
  v3[5] = @"lastModifiedDate";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:6];
  uint64_t v1 = [v0 copy];
  v2 = (void *)propertiesToFetch_pl_once_object_24;
  propertiesToFetch_pl_once_object_24 = v1;
}

+ (id)propertiesToSortBy
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastModifiedDate" ascending:0];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)entityName
{
  return @"UserFeedback";
}

+ (BOOL)isToMany
{
  return 1;
}

+ (id)keyPathToPrimaryObject
{
  return @"person";
}

+ (id)keyPathFromPrimaryObject
{
  return @"userFeedbacks";
}

+ (id)propertySetName
{
  return @"PHPersonPropertySetUserFeedback";
}

@end