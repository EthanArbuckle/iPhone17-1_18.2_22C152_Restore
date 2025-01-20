@interface GKBehavior
+ (GKBehavior)behaviorWithGoal:(GKGoal *)goal weight:(float)weight;
+ (GKBehavior)behaviorWithGoals:(NSArray *)goals;
+ (GKBehavior)behaviorWithGoals:(NSArray *)goals andWeights:(NSArray *)weights;
+ (GKBehavior)behaviorWithWeightedGoals:(NSDictionary *)weightedGoals;
- (GKBehavior)init;
- (GKBehavior)initWithGoal:(id)a3 weight:(float)a4;
- (GKBehavior)initWithGoals:(id)a3;
- (GKBehavior)initWithGoals:(id)a3 andWeights:(id)a4;
- (GKBehavior)initWithWeightedGoals:(id)a3;
- (GKGoal)objectAtIndexedSubscript:(NSUInteger)idx;
- (NSInteger)goalCount;
- (NSNumber)objectForKeyedSubscript:(GKGoal *)goal;
- (__n128)getTotalForce:(uint64_t)a3 agent:(void *)a4;
- (float)weightForGoal:(GKGoal *)goal;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)goals;
- (id)weights;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)removeAllGoals;
- (void)removeGoal:(GKGoal *)goal;
- (void)setObject:(NSNumber *)weight forKeyedSubscript:(GKGoal *)goal;
- (void)setWeight:(float)weight forGoal:(GKGoal *)goal;
@end

@implementation GKBehavior

- (NSInteger)goalCount
{
  return [(NSMutableArray *)self->_goals count];
}

- (id)goals
{
  return self->_goals;
}

- (id)weights
{
  return self->_weights;
}

- (__n128)getTotalForce:(uint64_t)a3 agent:(void *)a4
{
  id v6 = a4;
  if ([a1 goalCount] < 1)
  {
    float32x4_t v13 = 0u;
  }
  else
  {
    uint64_t v7 = 0;
    objc_msgSend(a1[1], "objectAtIndex:", 0, 0, 0);
    while (1)
      v8 = {;
      v9 = [a1[2] objectAtIndex:v7];
      [v9 floatValue];
      float v14 = v10;

      if (v8)
      {
        [v8 getForce:v6 agent:a2];
        float32x4_t v13 = vmlaq_n_f32(v13, v11, v14);
      }

      if ([a1 goalCount] <= ++v7) {
        break;
      }
      objc_msgSend(a1[1], "objectAtIndex:", v7, *(_OWORD *)&v13);
    }
  }

  return (__n128)v13;
}

- (GKBehavior)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKBehavior;
  v2 = [(GKBehavior *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    goals = v2->_goals;
    v2->_goals = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF980] array];
    weights = v2->_weights;
    v2->_weights = (NSMutableArray *)v5;
  }
  return v2;
}

+ (GKBehavior)behaviorWithGoal:(GKGoal *)goal weight:(float)weight
{
  uint64_t v5 = goal;
  id v6 = [GKBehavior alloc];
  *(float *)&double v7 = weight;
  objc_super v8 = [(GKBehavior *)v6 initWithGoal:v5 weight:v7];

  return v8;
}

- (GKBehavior)initWithGoal:(id)a3 weight:(float)a4
{
  id v6 = a3;
  double v7 = [(GKBehavior *)self init];
  v9 = v7;
  if (v7)
  {
    *(float *)&double v8 = a4;
    [(GKBehavior *)v7 setWeight:v6 forGoal:v8];
  }

  return v9;
}

+ (GKBehavior)behaviorWithGoals:(NSArray *)goals
{
  v4 = goals;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithGoals:v4];

  return (GKBehavior *)v5;
}

- (GKBehavior)initWithGoals:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(GKBehavior *)self init];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          LODWORD(v8) = 1.0;
          -[GKBehavior setWeight:forGoal:](v5, "setWeight:forGoal:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), v8, (void)v13);
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  return v5;
}

+ (GKBehavior)behaviorWithGoals:(NSArray *)goals andWeights:(NSArray *)weights
{
  id v6 = weights;
  uint64_t v7 = goals;
  double v8 = (void *)[objc_alloc((Class)a1) initWithGoals:v7 andWeights:v6];

  return (GKBehavior *)v8;
}

- (GKBehavior)initWithGoals:(id)a3 andWeights:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(GKBehavior *)self init];
  if (v8 && [v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
      [v10 floatValue];
      int v12 = v11;
      long long v13 = [v6 objectAtIndexedSubscript:v9];
      LODWORD(v14) = v12;
      [(GKBehavior *)v8 setWeight:v13 forGoal:v14];

      ++v9;
    }
    while ([v6 count] > v9);
  }

  return v8;
}

+ (GKBehavior)behaviorWithWeightedGoals:(NSDictionary *)weightedGoals
{
  id v4 = weightedGoals;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithWeightedGoals:v4];

  return (GKBehavior *)v5;
}

- (GKBehavior)initWithWeightedGoals:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKBehavior *)self init];
  if (v5)
  {
    id v6 = [v4 allKeys];
    id v7 = [v4 allValues];
    if ([v6 count])
    {
      unint64_t v8 = 0;
      do
      {
        unint64_t v9 = [v7 objectAtIndexedSubscript:v8];
        [v9 floatValue];
        int v11 = v10;
        int v12 = [v6 objectAtIndexedSubscript:v8];
        LODWORD(v13) = v11;
        [(GKBehavior *)v5 setWeight:v12 forGoal:v13];

        ++v8;
      }
      while ([v6 count] > v8);
    }
  }
  return v5;
}

- (float)weightForGoal:(GKGoal *)goal
{
  uint64_t v4 = [(NSMutableArray *)self->_goals indexOfObject:goal];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }
  id v6 = [(NSMutableArray *)self->_weights objectAtIndexedSubscript:v4];
  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (void)removeGoal:(GKGoal *)goal
{
  uint64_t v4 = [(NSMutableArray *)self->_goals indexOfObject:goal];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    [(NSMutableArray *)self->_goals removeObjectAtIndex:v4];
    weights = self->_weights;
    [(NSMutableArray *)weights removeObjectAtIndex:v5];
  }
}

- (void)removeAllGoals
{
  [(NSMutableArray *)self->_goals removeAllObjects];
  weights = self->_weights;

  [(NSMutableArray *)weights removeAllObjects];
}

- (GKGoal)objectAtIndexedSubscript:(NSUInteger)idx
{
  return (GKGoal *)[(NSMutableArray *)self->_goals objectAtIndexedSubscript:idx];
}

- (void)setObject:(NSNumber *)weight forKeyedSubscript:(GKGoal *)goal
{
  id v6 = goal;
  [(NSNumber *)weight floatValue];
  -[GKBehavior setWeight:forGoal:](self, "setWeight:forGoal:", v6);
}

- (void)setWeight:(float)weight forGoal:(GKGoal *)goal
{
  int v12 = goal;
  uint64_t v6 = -[NSMutableArray indexOfObject:](self->_goals, "indexOfObject:");
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_goals addObject:v12];
    weights = self->_weights;
    *(float *)&double v9 = weight;
    int v10 = [NSNumber numberWithFloat:v9];
    [(NSMutableArray *)weights addObject:v10];
  }
  else
  {
    uint64_t v11 = v6;
    *(float *)&double v7 = weight;
    int v10 = [NSNumber numberWithFloat:v7];
    [(NSMutableArray *)self->_weights setObject:v10 atIndexedSubscript:v11];
  }
}

- (NSNumber)objectForKeyedSubscript:(GKGoal *)goal
{
  uint64_t v4 = [(NSMutableArray *)self->_goals indexOfObject:goal];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_weights objectAtIndexedSubscript:v4];
  }
  return (NSNumber *)v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_goals countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x237DF7AF0](self, a2);

  return [(GKBehavior *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(GKBehavior);
  uint64_t v5 = [MEMORY[0x263EFF980] arrayWithArray:self->_goals];
  goals = v4->_goals;
  v4->_goals = (NSMutableArray *)v5;

  uint64_t v7 = [MEMORY[0x263EFF980] arrayWithArray:self->_weights];
  weights = v4->_weights;
  v4->_weights = (NSMutableArray *)v7;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_goals, 0);
}

@end