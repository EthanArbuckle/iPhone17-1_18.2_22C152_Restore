@interface _HKLocationShifter
+ (BOOL)isShiftRequiredForLocations:(id)a3;
- (_HKLocationShifter)init;
- (void)shiftLocations:(id)a3 withCompletion:(id)a4;
@end

@implementation _HKLocationShifter

- (_HKLocationShifter)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKLocationShifter;
  v2 = [(_HKLocationShifter *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = HKCreateSerialDispatchQueue(v2, 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (BOOL)isShiftRequiredForLocations:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x19F395970](v4);
        objc_msgSend(v8, "coordinate", (void)v14);
        double v11 = v10;
        [v8 coordinate];
        LOBYTE(v8) = objc_msgSend(getGEOLocationShifterClass(), "isLocationShiftRequiredForCoordinate:", v11, v12);
        if (v8)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)shiftLocations:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
  id v22 = objc_alloc_init((Class)getGEOLocationShifterClass());
  v8 = dispatch_group_create();
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      double v10 = [v6 objectAtIndexedSubscript:v9];
      [v10 coordinate];
      double v12 = v11;
      [v10 coordinate];
      double v14 = v13;
      if (objc_msgSend(getGEOLocationShifterClass(), "isLocationShiftRequiredForCoordinate:", v12, v13))
      {
        dispatch_group_enter(v8);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke;
        v31[3] = &unk_1E58C7FC0;
        id v32 = v10;
        id v15 = v7;
        id v33 = v15;
        unint64_t v35 = v9;
        long long v16 = v8;
        v34 = v16;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_2;
        v27[3] = &unk_1E58C7FE8;
        unint64_t v30 = v9;
        id v28 = v15;
        v29 = v16;
        objc_msgSend(v22, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v31, 0, v27, self->_queue, v12, v14, 0.0);
      }
      ++v9;
    }
    while (v9 < [v6 count]);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___HKLocationShifter_shiftLocations_withCompletion___block_invoke_14;
  block[3] = &unk_1E58BBA78;
  id v24 = v7;
  id v25 = v6;
  id v26 = v21;
  id v18 = v21;
  id v19 = v6;
  id v20 = v7;
  dispatch_group_notify(v8, queue, block);
}

- (void).cxx_destruct
{
}

@end