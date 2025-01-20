@interface GKHybridStrategist
- (BOOL)validateGameModel:(id)a3;
- (BOOL)validateRandomSource;
- (GKGameModel)gameModel;
- (GKHybridStrategist)init;
- (GKRandom)randomSource;
- (id)bestMoveForActivePlayer;
- (unint64_t)budget;
- (unint64_t)explorationParameter;
- (unint64_t)maxLookAheadDepth;
- (void)dealloc;
- (void)setBudget:(unint64_t)a3;
- (void)setExplorationParameter:(unint64_t)a3;
- (void)setGameModel:(id)a3;
- (void)setMaxLookAheadDepth:(unint64_t)a3;
- (void)setRandomSource:(id)a3;
@end

@implementation GKHybridStrategist

- (GKGameModel)gameModel
{
  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
  {
    id v3 = hybridStrategist[7];
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
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist)
  {
    v10 = v4;
    if (v4)
    {
      id v4 = (id)[(GKHybridStrategist *)self validateGameModel:v4];
      id v5 = v10;
      if ((v4 & 1) == 0) {
        goto LABEL_7;
      }
      v7 = self->_hybridStrategist;
      id v8 = v10;
      v9 = (void *)v7[7];
      v7[7] = v8;
    }
    else
    {
      v9 = (void *)hybridStrategist[7];
      hybridStrategist[7] = 0;
    }

    id v5 = v10;
  }
LABEL_7:

  MEMORY[0x270F9A758](v4, v5);
}

- (GKRandom)randomSource
{
  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
  {
    id v3 = hybridStrategist[8];
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
  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
  {
    id v7 = v5;
    objc_storeStrong(hybridStrategist + 8, a3);
    id v5 = v7;
  }
}

- (unint64_t)budget
{
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist) {
    return hybridStrategist[9];
  }
  else {
    return 0;
  }
}

- (void)setBudget:(unint64_t)a3
{
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist) {
    hybridStrategist[9] = a3;
  }
}

- (unint64_t)explorationParameter
{
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist) {
    return hybridStrategist[10];
  }
  else {
    return 0;
  }
}

- (void)setExplorationParameter:(unint64_t)a3
{
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist) {
    hybridStrategist[10] = a3;
  }
}

- (unint64_t)maxLookAheadDepth
{
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist) {
    return hybridStrategist[11];
  }
  else {
    return 0;
  }
}

- (void)setMaxLookAheadDepth:(unint64_t)a3
{
  hybridStrategist = self->_hybridStrategist;
  if (hybridStrategist) {
    hybridStrategist[11] = a3;
  }
}

- (GKHybridStrategist)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKHybridStrategist;
  if ([(GKHybridStrategist *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  hybridStrategist = (id *)self->_hybridStrategist;
  if (hybridStrategist)
  {
    GKCHybridStrategist::~GKCHybridStrategist(hybridStrategist);
    MEMORY[0x237DF7CA0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)GKHybridStrategist;
  [(GKHybridStrategist *)&v4 dealloc];
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

- (BOOL)validateRandomSource
{
  v2 = [(GKHybridStrategist *)self randomSource];

  if (!v2)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"No random source set for GKMonteCarloStrategist; random source must be set before attempting to find a move",
      0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return 1;
}

- (id)bestMoveForActivePlayer
{
  if (self->_hybridStrategist)
  {
    id v3 = [(GKHybridStrategist *)self gameModel];
    if ([(GKHybridStrategist *)self validateGameModel:v3])
    {
      BOOL v4 = [(GKHybridStrategist *)self validateRandomSource];

      if (v4) {
        GKCHybridStrategist::bestMoveForActivePlayer((GKCHybridStrategist *)self->_hybridStrategist);
      }
    }
    else
    {
    }
  }

  return 0;
}

@end