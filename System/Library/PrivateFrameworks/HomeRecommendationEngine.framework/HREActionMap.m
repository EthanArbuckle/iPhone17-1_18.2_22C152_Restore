@interface HREActionMap
+ (id)actionMapWithChildMaps:(id)a3;
+ (id)emptyMap;
- (BOOL)conditionSatisfiedByObject:(id)a3;
- (BOOL)visitedByFlatten;
- (HREActionMap)initWithCondition:(id)a3 childMaps:(id)a4;
- (NSMutableArray)childMaps;
- (NSPredicate)condition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)flattenedMapEvaluatedForObject:(id)a3;
- (id)mergeWithActionMaps:(id)a3;
- (void)setChildMaps:(id)a3;
- (void)setCondition:(id)a3;
- (void)setVisitedByFlatten:(BOOL)a3;
@end

@implementation HREActionMap

- (HREActionMap)initWithCondition:(id)a3 childMaps:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HREActionMap;
  v9 = [(HREActionMap *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_condition, a3);
    v11 = (void *)[v8 mutableCopy];
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = [MEMORY[0x263EFF980] array];
    }
    childMaps = v10->_childMaps;
    v10->_childMaps = v13;
  }
  return v10;
}

+ (id)emptyMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__HREActionMap_emptyMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_268944B58 != -1) {
    dispatch_once(&qword_268944B58, block);
  }
  v2 = (void *)_MergedGlobals_16;

  return v2;
}

uint64_t __24__HREActionMap_emptyMap__block_invoke(uint64_t a1)
{
  _MergedGlobals_16 = [objc_alloc(*(Class *)(a1 + 32)) initWithCondition:0 childMaps:0];

  return MEMORY[0x270F9A758]();
}

+ (id)actionMapWithChildMaps:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCondition:0 childMaps:v4];

  return v5;
}

- (BOOL)conditionSatisfiedByObject:(id)a3
{
  id v4 = a3;
  v5 = [(HREActionMap *)self condition];
  if (v5)
  {
    v6 = [(HREActionMap *)self condition];
    char v7 = [v6 evaluateWithObject:v4];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)flattenedMapEvaluatedForObject:(id)a3
{
  id v4 = a3;
  if ([(HREActionMap *)self conditionSatisfiedByObject:v4]
    || [(HREActionMap *)self visitedByFlatten])
  {
    [(HREActionMap *)self setVisitedByFlatten:1];
    v5 = [(HREActionMap *)self childMaps];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__HREActionMap_flattenedMapEvaluatedForObject___block_invoke;
    v11[3] = &unk_264CF3980;
    id v12 = v4;
    v6 = objc_msgSend(v5, "na_map:", v11);

    char v7 = [(HREActionMap *)self mergeWithActionMaps:v6];
    id v8 = v7;
    if (v7 != self)
    {
      v9 = [(HREActionMap *)v7 childMaps];
      [v9 removeAllObjects];
    }
    [(HREActionMap *)self setVisitedByFlatten:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __47__HREActionMap_flattenedMapEvaluatedForObject___block_invoke(uint64_t a1, void *a2)
{
  return [a2 flattenedMapEvaluatedForObject:*(void *)(a1 + 32)];
}

- (id)mergeWithActionMaps:(id)a3
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() emptyMap];
  int v7 = [(HREActionMap *)self isEqual:v6];

  if (v7)
  {
    id v8 = [v5 firstObject];
    v9 = [v8 mergeWithActionMaps:v5];
  }
  else
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HREActionMap.m", 84, @"%s is an abstract method that must be overriden by subclass %@", "-[HREActionMap mergeWithActionMaps:]", objc_opt_class() object file lineNumber description];
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  childMaps = self->_childMaps;
  condition = self->_condition;

  return (id)[v4 initWithCondition:condition childMaps:childMaps];
}

- (NSMutableArray)childMaps
{
  return self->_childMaps;
}

- (void)setChildMaps:(id)a3
{
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (BOOL)visitedByFlatten
{
  return self->_visitedByFlatten;
}

- (void)setVisitedByFlatten:(BOOL)a3
{
  self->_visitedByFlatten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);

  objc_storeStrong((id *)&self->_childMaps, 0);
}

@end