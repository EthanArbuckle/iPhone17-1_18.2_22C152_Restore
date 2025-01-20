@interface GKCompositeBehavior
+ (GKCompositeBehavior)behaviorWithBehaviors:(NSArray *)behaviors;
+ (GKCompositeBehavior)behaviorWithBehaviors:(NSArray *)behaviors andWeights:(NSArray *)weights;
- (GKBehavior)objectAtIndexedSubscript:(NSUInteger)idx;
- (GKCompositeBehavior)init;
- (GKCompositeBehavior)initWithBehaviors:(id)a3;
- (GKCompositeBehavior)initWithBehaviors:(id)a3 andWeights:(id)a4;
- (NSInteger)behaviorCount;
- (NSNumber)objectForKeyedSubscript:(GKBehavior *)behavior;
- (__n128)getTotalForce:(uint64_t)a3 agent:(void *)a4;
- (float)weightForBehavior:(GKBehavior *)behavior;
- (void)removeAllBehaviors;
- (void)removeBehavior:(GKBehavior *)behavior;
- (void)setObject:(NSNumber *)weight forKeyedSubscript:(GKBehavior *)behavior;
- (void)setWeight:(float)weight forBehavior:(GKBehavior *)behavior;
@end

@implementation GKCompositeBehavior

- (__n128)getTotalForce:(uint64_t)a3 agent:(void *)a4
{
  id v6 = a4;
  v16.receiver = a1;
  v16.super_class = (Class)GKCompositeBehavior;
  objc_msgSendSuper2(&v16, sel_getTotalForce_agent_, v6, a2);
  float32x4_t v14 = v7;
  if ([a1 behaviorCount] >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      v9 = objc_msgSend(a1[3], "objectAtIndex:", v8, *(_OWORD *)&v14);
      v10 = [a1[4] objectAtIndex:v8];
      [v10 floatValue];
      float v15 = v11;

      if (v9)
      {
        [v9 getTotalForce:v6 agent:a2];
        float32x4_t v14 = vmlaq_n_f32(v14, v12, v15);
      }

      ++v8;
    }
    while ([a1 behaviorCount] > v8);
  }

  return (__n128)v14;
}

- (NSInteger)behaviorCount
{
  return [(NSMutableArray *)self->_subBehaviors count];
}

- (GKCompositeBehavior)init
{
  return [(GKCompositeBehavior *)self initWithBehaviors:MEMORY[0x263EFFA68]];
}

+ (GKCompositeBehavior)behaviorWithBehaviors:(NSArray *)behaviors
{
  v4 = behaviors;
  v5 = (void *)[objc_alloc((Class)a1) initWithBehaviors:v4];

  return (GKCompositeBehavior *)v5;
}

- (GKCompositeBehavior)initWithBehaviors:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GKCompositeBehavior;
  v5 = [(GKBehavior *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    subBehaviors = v5->_subBehaviors;
    v5->_subBehaviors = (NSMutableArray *)v6;

    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v5->_subBehaviors, "count"));
    subBehaviorWeights = v5->_subBehaviorWeights;
    v5->_subBehaviorWeights = (NSMutableArray *)v8;

    if ([(NSMutableArray *)v5->_subBehaviors count])
    {
      unint64_t v11 = 0;
      do
      {
        float32x4_t v12 = v5->_subBehaviorWeights;
        LODWORD(v10) = 1.0;
        v13 = [NSNumber numberWithFloat:v10];
        [(NSMutableArray *)v12 addObject:v13];

        ++v11;
      }
      while ([(NSMutableArray *)v5->_subBehaviors count] > v11);
    }
  }

  return v5;
}

+ (GKCompositeBehavior)behaviorWithBehaviors:(NSArray *)behaviors andWeights:(NSArray *)weights
{
  uint64_t v6 = weights;
  float32x4_t v7 = behaviors;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithBehaviors:v7 andWeights:v6];

  return (GKCompositeBehavior *)v8;
}

- (GKCompositeBehavior)initWithBehaviors:(id)a3 andWeights:(id)a4
{
  id v6 = a4;
  float32x4_t v7 = [(GKCompositeBehavior *)self initWithBehaviors:a3];
  if (v7 && [v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v6 objectAtIndexedSubscript:v8];
      [(NSMutableArray *)v7->_subBehaviorWeights setObject:v9 atIndexedSubscript:v8];

      ++v8;
    }
    while ([v6 count] > v8);
  }

  return v7;
}

- (void)setWeight:(float)weight forBehavior:(GKBehavior *)behavior
{
  float32x4_t v12 = behavior;
  uint64_t v6 = -[NSMutableArray indexOfObject:](self->_subBehaviors, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_subBehaviors addObject:v12];
    subBehaviorWeights = self->_subBehaviorWeights;
    *(float *)&double v9 = weight;
    double v10 = [NSNumber numberWithFloat:v9];
    [(NSMutableArray *)subBehaviorWeights addObject:v10];
  }
  else
  {
    uint64_t v11 = v6;
    *(float *)&double v7 = weight;
    double v10 = [NSNumber numberWithFloat:v7];
    [(NSMutableArray *)self->_subBehaviorWeights setObject:v10 atIndexedSubscript:v11];
  }
}

- (float)weightForBehavior:(GKBehavior *)behavior
{
  uint64_t v4 = [(NSMutableArray *)self->_subBehaviors indexOfObject:behavior];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }
  uint64_t v6 = [(NSMutableArray *)self->_subBehaviorWeights objectAtIndexedSubscript:v4];
  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (void)removeBehavior:(GKBehavior *)behavior
{
  uint64_t v4 = [(NSMutableArray *)self->_subBehaviors indexOfObject:behavior];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    [(NSMutableArray *)self->_subBehaviors removeObjectAtIndex:v4];
    subBehaviorWeights = self->_subBehaviorWeights;
    [(NSMutableArray *)subBehaviorWeights removeObjectAtIndex:v5];
  }
}

- (void)removeAllBehaviors
{
  [(NSMutableArray *)self->_subBehaviors removeAllObjects];
  subBehaviorWeights = self->_subBehaviorWeights;

  [(NSMutableArray *)subBehaviorWeights removeAllObjects];
}

- (GKBehavior)objectAtIndexedSubscript:(NSUInteger)idx
{
  return (GKBehavior *)[(NSMutableArray *)self->_subBehaviors objectAtIndexedSubscript:idx];
}

- (void)setObject:(NSNumber *)weight forKeyedSubscript:(GKBehavior *)behavior
{
  uint64_t v6 = behavior;
  [(NSNumber *)weight floatValue];
  -[GKCompositeBehavior setWeight:forBehavior:](self, "setWeight:forBehavior:", v6);
}

- (NSNumber)objectForKeyedSubscript:(GKBehavior *)behavior
{
  uint64_t v4 = [(NSMutableArray *)self->_subBehaviors indexOfObject:behavior];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [NSNumber numberWithInteger:-1];
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_subBehaviorWeights objectAtIndexedSubscript:v4];
  }
  return (NSNumber *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subBehaviorWeights, 0);

  objc_storeStrong((id *)&self->_subBehaviors, 0);
}

@end