@interface GKMonteCarloStrategist
- (BOOL)validateGameModel:(id)a3;
- (GKGameModel)gameModel;
- (GKMonteCarloStrategist)init;
- (GKRandom)randomSource;
- (NSUInteger)budget;
- (NSUInteger)explorationParameter;
- (id)bestMoveForActivePlayer;
- (void)dealloc;
- (void)setBudget:(NSUInteger)budget;
- (void)setExplorationParameter:(NSUInteger)explorationParameter;
- (void)setGameModel:(id)a3;
- (void)setRandomSource:(id)a3;
@end

@implementation GKMonteCarloStrategist

- (GKGameModel)gameModel
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {
    id v3 = monteCarloStrategist->var0;
  }
  else
  {
    id v3 = 0;
  }
  return (GKGameModel *)v3;
}

- (void)setGameModel:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {
    v10 = v4;
    if (v4)
    {
      id v4 = (id)[(GKMonteCarloStrategist *)self validateGameModel:v4];
      id v5 = v10;
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      v7 = self->_monteCarloStrategist;
      id v8 = v10;
      id var0 = v7->var0;
      v7->id var0 = v8;
    }
    else
    {
      id var0 = monteCarloStrategist->var0;
      monteCarloStrategist->id var0 = 0;
    }

    id v5 = v10;
  }
LABEL_7:

  MEMORY[0x270F9A758](v4, v5);
}

- (GKRandom)randomSource
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {
    id v3 = monteCarloStrategist->var1;
  }
  else
  {
    id v3 = 0;
  }
  return (GKRandom *)v3;
}

- (void)setRandomSource:(id)a3
{
  id v5 = a3;
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {
    id v7 = v5;
    objc_storeStrong(&monteCarloStrategist->var1, a3);
    id v5 = v7;
  }
}

- (NSUInteger)budget
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist) {
    return monteCarloStrategist->var2;
  }
  else {
    return 0;
  }
}

- (void)setBudget:(NSUInteger)budget
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist) {
    monteCarloStrategist->var2 = budget;
  }
}

- (NSUInteger)explorationParameter
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist) {
    return monteCarloStrategist->var3;
  }
  else {
    return 0;
  }
}

- (void)setExplorationParameter:(NSUInteger)explorationParameter
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist) {
    monteCarloStrategist->var3 = explorationParameter;
  }
}

- (GKMonteCarloStrategist)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKMonteCarloStrategist;
  if ([(GKMonteCarloStrategist *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  monteCarloStrategist = self->_monteCarloStrategist;
  if (monteCarloStrategist)
  {

    MEMORY[0x237DF7CA0](monteCarloStrategist, 0x1080C4018622206);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKMonteCarloStrategist;
  [(GKMonteCarloStrategist *)&v4 dealloc];
}

- (BOOL)validateGameModel:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"No game model set for GKMonteCarloStrategist; game model must be set before attempting to find a move",
      0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = NSString;
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    uint64_t v9 = [v6 stringWithFormat:@"%@ must implement isWinForPlayer to work with GKMonteCarloStrategist", v8];

    id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v9 userInfo:0];
    objc_exception_throw(v10);
  }

  return 1;
}

- (id)bestMoveForActivePlayer
{
  if (self->_monteCarloStrategist)
  {
    id v3 = [(GKMonteCarloStrategist *)self gameModel];
    BOOL v4 = [(GKMonteCarloStrategist *)self validateGameModel:v3];

    if (v4)
    {
      id v5 = [(GKMonteCarloStrategist *)self randomSource];

      if (!v5)
      {
        v6 = objc_alloc_init(GKARC4RandomSource);
        [(GKMonteCarloStrategist *)self setRandomSource:v6];
      }
      GKCMonteCarloStrategist::bestMoveForActivePlayer(self->_monteCarloStrategist);
    }
  }

  return 0;
}

@end