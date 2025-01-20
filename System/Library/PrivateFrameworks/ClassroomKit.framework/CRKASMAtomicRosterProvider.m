@interface CRKASMAtomicRosterProvider
- (CRKASMAtomicRosterProvider)initWithRosterProvider:(id)a3;
- (NSMutableDictionary)completionsByConstraint;
- (id)courseWithIdentifier:(id)a3 inRoster:(id)a4;
- (id)coursesMatchingCreateProperties:(id)a3 inRoster:(id)a4 createdAfter:(id)a5;
- (id)pushCompletion:(id)a3 withRosterEvaluator:(id)a4;
- (void)beginObservingRoster;
- (void)createCourseWithProperties:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)endObservingRoster;
- (void)evaluateConstraintForUnderlyingCompletion:(id)a3 error:(id)a4;
- (void)evalutateConstraintsForRosterUpdate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5;
@end

@implementation CRKASMAtomicRosterProvider

- (void)dealloc
{
  [(CRKASMAtomicRosterProvider *)self endObservingRoster];
  v3.receiver = self;
  v3.super_class = (Class)CRKASMAtomicRosterProvider;
  [(CRKASMAtomicRosterProvider *)&v3 dealloc];
}

- (CRKASMAtomicRosterProvider)initWithRosterProvider:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKASMAtomicRosterProvider;
  objc_super v3 = [(CRKASMRosterProviderDecoratorBase *)&v7 initWithRosterProvider:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    completionsByConstraint = v3->_completionsByConstraint;
    v3->_completionsByConstraint = (NSMutableDictionary *)v4;

    [(CRKASMAtomicRosterProvider *)v3 beginObservingRoster];
  }
  return v3;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263F08B88];
  id v9 = a4;
  if (([v8 isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = NSStringFromSelector(a2);
    [v16 handleFailureInMethod:a2, self, @"CRKASMAtomicRosterProvider.m", 56, @"%@ must be called from the main thread", v17 object file lineNumber description];
  }
  v10 = [MEMORY[0x263EFF910] date];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke;
  v20[3] = &unk_2646F5518;
  v20[4] = self;
  id v21 = v7;
  id v22 = v10;
  id v11 = v10;
  id v12 = v7;
  v13 = [(CRKASMAtomicRosterProvider *)self pushCompletion:v9 withRosterEvaluator:v20];

  v14 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke_2;
  v18[3] = &unk_2646F4918;
  v18[4] = self;
  id v19 = v13;
  id v15 = v13;
  [v14 createCourseWithProperties:v12 completion:v18];
}

BOOL __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) coursesMatchingCreateProperties:*(void *)(a1 + 40) inRoster:a2 createdAfter:*(void *)(a1 + 48)];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __68__CRKASMAtomicRosterProvider_createCourseWithProperties_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateConstraintForUnderlyingCompletion:*(void *)(a1 + 40) error:a2];
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x263F08B88];
  id v12 = a5;
  if (([v11 isMainThread] & 1) == 0)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    v26 = NSStringFromSelector(a2);
    [v25 handleFailureInMethod:a2, self, @"CRKASMAtomicRosterProvider.m", 76, @"%@ must be called from the main thread", v26 object file lineNumber description];
  }
  v13 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v14 = [v13 roster];
  id v15 = [v14 user];

  v16 = [v10 usersToRemove];
  v17 = objc_msgSend(v16, "crk_mapUsingBlock:", &__block_literal_global_102);

  v18 = [v15 identifier];
  char v19 = [v17 containsObject:v18];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_2;
  v29[3] = &unk_2646F5540;
  v29[4] = self;
  id v30 = v9;
  char v32 = v19;
  id v31 = v10;
  id v20 = v10;
  id v21 = v9;
  id v22 = [(CRKASMAtomicRosterProvider *)self pushCompletion:v12 withRosterEvaluator:v29];

  v23 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_3;
  v27[3] = &unk_2646F4918;
  v27[4] = self;
  id v28 = v22;
  id v24 = v22;
  [v23 updateCourseWithIdentifier:v21 properties:v20 completion:v27];
}

uint64_t __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) courseWithIdentifier:*(void *)(a1 + 40) inRoster:a2];
  if (v3) {
    uint64_t v4 = [*(id *)(a1 + 48) areFulfilledByCourse:v3];
  }
  else {
    uint64_t v4 = *(unsigned char *)(a1 + 56) != 0;
  }

  return v4;
}

uint64_t __79__CRKASMAtomicRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateConstraintForUnderlyingCompletion:*(void *)(a1 + 40) error:a2];
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKASMAtomicRosterProvider.m", 102, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke;
  v17[3] = &unk_2646F5568;
  v17[4] = self;
  id v18 = v7;
  id v9 = v7;
  id v10 = [(CRKASMAtomicRosterProvider *)self pushCompletion:v8 withRosterEvaluator:v17];
  id v11 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke_2;
  v15[3] = &unk_2646F4918;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  [v11 removeCourseWithIdentifier:v9 completion:v15];
}

BOOL __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) courseWithIdentifier:*(void *)(a1 + 40) inRoster:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __68__CRKASMAtomicRosterProvider_removeCourseWithIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateConstraintForUnderlyingCompletion:*(void *)(a1 + 40) error:a2];
}

- (void)beginObservingRoster
{
  id v3 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  [v3 addObserver:self forKeyPath:@"roster" options:0 context:@"CRKASMAtomicRosterProviderObservationContext"];
}

- (void)endObservingRoster
{
  id v3 = [(CRKASMRosterProviderDecoratorBase *)self underlyingRosterProvider];
  [v3 removeObserver:self forKeyPath:@"roster" context:@"CRKASMAtomicRosterProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKASMAtomicRosterProviderObservationContext")
  {
    [(CRKASMAtomicRosterProvider *)self evalutateConstraintsForRosterUpdate];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKASMAtomicRosterProvider;
    -[CRKASMAtomicRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)pushCompletion:(id)a3 withRosterEvaluator:(id)a4
{
  id v7 = a4;
  objc_super v8 = (void *)MEMORY[0x263F08B88];
  id v9 = a3;
  if (([v8 isMainThread] & 1) == 0)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = NSStringFromSelector(a2);
    [v14 handleFailureInMethod:a2, self, @"CRKASMAtomicRosterProvider.m", 144, @"%@ must be called from the main thread", v15 object file lineNumber description];
  }
  uint64_t v10 = +[CRKASMAtomicRosterConstraint constraintWithRosterEvaluator:v7];
  id v11 = (void *)MEMORY[0x22A620AF0](v9);

  id v12 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
  [v12 setObject:v11 forKeyedSubscript:v10];

  return v10;
}

- (void)evaluateConstraintForUnderlyingCompletion:(id)a3 error:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    id v16 = NSStringFromSelector(a2);
    [v15 handleFailureInMethod:a2, self, @"CRKASMAtomicRosterProvider.m", 151, @"%@ must be called from the main thread", v16 object file lineNumber description];
  }
  objc_super v8 = [(CRKASMRosterProviderDecoratorBase *)self roster];

  if (v8)
  {
    id v9 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
    uint64_t v10 = [v9 objectForKeyedSubscript:v17];

    if (v10)
    {
      if (v7)
      {
        id v11 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
        [v11 setObject:0 forKeyedSubscript:v17];

        ((void (**)(void, id))v10)[2](v10, v7);
      }
      else
      {
        id v12 = [(CRKASMRosterProviderDecoratorBase *)self roster];
        int v13 = [v17 isFulfilledByRoster:v12];

        if (v13)
        {
          v14 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
          [v14 setObject:0 forKeyedSubscript:v17];

          v10[2](v10, 0);
        }
      }
    }
  }
}

- (void)evalutateConstraintsForRosterUpdate
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v24 = [MEMORY[0x263F08690] currentHandler];
    v25 = NSStringFromSelector(a2);
    [v24 handleFailureInMethod:a2, self, @"CRKASMAtomicRosterProvider.m", 182, @"%@ must be called from the main thread", v25 object file lineNumber description];
  }
  uint64_t v4 = [(CRKASMRosterProviderDecoratorBase *)self roster];

  if (v4)
  {
    v5 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v6 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
    id v7 = [v6 allKeys];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
          int v13 = [(CRKASMRosterProviderDecoratorBase *)self roster];
          int v14 = [v12 isFulfilledByRoster:v13];

          if (v14) {
            [v5 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v5;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          id v21 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
          id v22 = [v21 objectForKeyedSubscript:v20];

          v23 = [(CRKASMAtomicRosterProvider *)self completionsByConstraint];
          [v23 setObject:0 forKeyedSubscript:v20];

          v22[2](v22, 0);
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v17);
    }
  }
}

- (id)courseWithIdentifier:(id)a3 inRoster:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 courses];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__CRKASMAtomicRosterProvider_courseWithIdentifier_inRoster___block_invoke;
  v10[3] = &unk_2646F4100;
  id v11 = v5;
  id v7 = v5;
  uint64_t v8 = objc_msgSend(v6, "crk_firstMatching:", v10);

  return v8;
}

uint64_t __60__CRKASMAtomicRosterProvider_courseWithIdentifier_inRoster___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)coursesMatchingCreateProperties:(id)a3 inRoster:(id)a4 createdAfter:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [a4 courses];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__CRKASMAtomicRosterProvider_coursesMatchingCreateProperties_inRoster_createdAfter___block_invoke;
  v14[3] = &unk_2646F5590;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = objc_msgSend(v9, "crk_filterUsingBlock:", v14);

  return v12;
}

uint64_t __84__CRKASMAtomicRosterProvider_coursesMatchingCreateProperties_inRoster_createdAfter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 creationDate];
  id v5 = [v4 earlierDate:*(void *)(a1 + 32)];
  if (v5 == *(void **)(a1 + 32)) {
    uint64_t v6 = [*(id *)(a1 + 40) areFulfilledByCourse:v3];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)completionsByConstraint
{
  return self->_completionsByConstraint;
}

- (void).cxx_destruct
{
}

@end