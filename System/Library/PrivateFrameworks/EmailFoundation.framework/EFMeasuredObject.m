@interface EFMeasuredObject
+ (id)max:(id)a3;
+ (id)object:(id)a3 withMeasure:(double)a4;
+ (id)reverseSortedObjects:(id)a3 limit:(unint64_t)a4;
- (EFMeasuredObject)initWithObject:(id)a3 measure:(double)a4;
- (double)measure;
- (id)description;
- (id)object;
- (int64_t)compare:(id)a3;
- (void)setMeasure:(double)a3;
- (void)setObject:(id)a3;
@end

@implementation EFMeasuredObject

+ (id)object:(id)a3 withMeasure:(double)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObject:v5 measure:a4];

  return v6;
}

- (EFMeasuredObject)initWithObject:(id)a3 measure:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EFMeasuredObject;
  v7 = [(EFMeasuredObject *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(EFMeasuredObject *)v7 setMeasure:a4];
    [(EFMeasuredObject *)v8 setObject:v6];
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EFMeasuredObject *)self measure];
  uint64_t v6 = v5;
  v7 = [(EFMeasuredObject *)self object];
  v8 = [v3 stringWithFormat:@"<%@: %lf: %@>", v4, v6, v7];

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"EFMeasuredObject.m", 30, @"Invalid parameter not satisfying: %@", @"[otherObject isKindOfClass:[EFMeasuredObject class]]" object file lineNumber description];
  }
  [(EFMeasuredObject *)self measure];
  double v7 = v6;
  [v5 measure];
  if (v7 >= v8)
  {
    [(EFMeasuredObject *)self measure];
    double v11 = v10;
    [v5 measure];
    int64_t v9 = v11 > v12;
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

+ (id)max:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a3;
  uint64_t v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "measure", (void)v14);
        double v10 = v9;
        [v4 measure];
        if (v10 > v11)
        {
          id v12 = v8;

          uint64_t v4 = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (id)reverseSortedObjects:(id)a3 limit:(unint64_t)a4
{
  uint64_t v5 = [a3 sortedArrayUsingComparator:&__block_literal_global_9];
  if ([v5 count] <= a4)
  {
    id v6 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, a4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v7 = v6;

  return v7;
}

uint64_t __47__EFMeasuredObject_reverseSortedObjects_limit___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (double)measure
{
  return self->_measure;
}

- (void)setMeasure:(double)a3
{
  self->_measure = a3;
}

- (void).cxx_destruct
{
}

@end