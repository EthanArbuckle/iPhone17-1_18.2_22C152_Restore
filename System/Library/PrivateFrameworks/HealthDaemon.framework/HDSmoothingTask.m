@interface HDSmoothingTask
- (BOOL)isEqual:(id)a3;
- (id)_initWithWorkout:(void *)a3 routes:;
- (id)description;
- (uint64_t)totalLocations;
- (void)setTransaction:(uint64_t)a1;
@end

@implementation HDSmoothingTask

- (id)_initWithWorkout:(void *)a3 routes:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)HDSmoothingTask;
    a1 = objc_msgSendSuper2(&v16, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v9;

      *((void *)a1 + 7) = 0;
      *((unsigned char *)a1 + 8) = 0;
      v11 = [v5 metadata];
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2BC20]];

      int v13 = [v12 BOOLValue];
      double v14 = 360.0;
      if (!v13) {
        double v14 = 30.0;
      }
      *((double *)a1 + 8) = v14;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  id v5 = [(HKWorkout *)self->_workout UUID];
  if (v4) {
    id v6 = (void *)v4[2];
  }
  else {
    id v6 = 0;
  }
  uint64_t v7 = [v6 UUID];
  char v8 = [v5 isEqual:v7];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(HKWorkout *)self->_workout UUID];
  uint64_t v5 = -[HDSmoothingTask totalLocations]((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)HDSmoothingTask;
  id v6 = [(HDSmoothingTask *)&v9 description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ totalLocations=%tu %@>", v4, v5, v6];

  return v7;
}

- (uint64_t)totalLocations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 24);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        v4 += objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "count", (void)v8);
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setTransaction:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_routes, 0);

  objc_storeStrong((id *)&self->_workout, 0);
}

@end