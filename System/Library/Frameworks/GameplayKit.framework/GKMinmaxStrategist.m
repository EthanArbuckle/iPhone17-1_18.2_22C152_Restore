@interface GKMinmaxStrategist
- (GKGameModel)gameModel;
- (GKMinmaxStrategist)init;
- (GKRandom)randomSource;
- (NSInteger)maxLookAheadDepth;
- (id)bestMoveForActivePlayer;
- (id)bestMoveForPlayer:(id)player;
- (id)randomMoveForPlayer:(id)player fromNumberOfBestMoves:(NSInteger)numMovesToConsider;
- (void)dealloc;
- (void)setGameModel:(id)a3;
- (void)setMaxLookAheadDepth:(NSInteger)maxLookAheadDepth;
- (void)setRandomSource:(id)a3;
@end

@implementation GKMinmaxStrategist

- (NSInteger)maxLookAheadDepth
{
  cppMinmax = self->_cppMinmax;
  if (cppMinmax) {
    return cppMinmax[12];
  }
  else {
    return 0;
  }
}

- (void)setMaxLookAheadDepth:(NSInteger)maxLookAheadDepth
{
  cppMinmax = self->_cppMinmax;
  if (cppMinmax) {
    cppMinmax[12] = maxLookAheadDepth;
  }
}

- (GKGameModel)gameModel
{
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    id v3 = cppMinmax[9];
  }
  else
  {
    id v3 = 0;
  }
  return (GKGameModel *)v3;
}

- (void)setGameModel:(id)a3
{
  id v5 = a3;
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    id v7 = v5;
    objc_storeStrong(cppMinmax + 9, a3);
    id v5 = v7;
  }
}

- (GKRandom)randomSource
{
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    id v3 = cppMinmax[11];
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
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    id v7 = v5;
    objc_storeStrong(cppMinmax + 11, a3);
    id v5 = v7;
  }
}

- (GKMinmaxStrategist)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKMinmaxStrategist;
  if ([(GKMinmaxStrategist *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  cppMinmax = (id *)self->_cppMinmax;
  if (cppMinmax)
  {
    GKCMinmaxStrategist::~GKCMinmaxStrategist(cppMinmax);
    MEMORY[0x237DF7CA0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)GKMinmaxStrategist;
  [(GKMinmaxStrategist *)&v4 dealloc];
}

- (id)bestMoveForActivePlayer
{
  if (!self->_cppMinmax) {
    goto LABEL_6;
  }
  uint64_t v3 = [(GKMinmaxStrategist *)self gameModel];
  if (!v3) {
    goto LABEL_6;
  }
  objc_super v4 = (void *)v3;
  id v5 = [(GKMinmaxStrategist *)self gameModel];
  v6 = [v5 activePlayer];
  if (!v6)
  {
    v10 = 0;
    goto LABEL_8;
  }
  id v7 = [(GKMinmaxStrategist *)self gameModel];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_9;
  }
  cppMinmax = self->_cppMinmax;
  objc_super v4 = [(GKMinmaxStrategist *)self gameModel];
  id v5 = [v4 activePlayer];
  v10 = GKCMinmaxStrategist::findBestMoveForPlayer((uint64_t)cppMinmax, v5, 0);
LABEL_8:

LABEL_9:

  return v10;
}

- (id)bestMoveForPlayer:(id)player
{
  id v4 = player;
  if (!self->_cppMinmax) {
    goto LABEL_5;
  }
  id v5 = [(GKMinmaxStrategist *)self gameModel];
  if (!v5) {
    goto LABEL_6;
  }
  v6 = [(GKMinmaxStrategist *)self gameModel];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = GKCMinmaxStrategist::findBestMoveForPlayer((uint64_t)self->_cppMinmax, v4, 0);
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }
LABEL_6:

  return v5;
}

- (id)randomMoveForPlayer:(id)player fromNumberOfBestMoves:(NSInteger)numMovesToConsider
{
  id v6 = player;
  if (self->_cppMinmax
    && ([(GKMinmaxStrategist *)self gameModel], (char v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(GKMinmaxStrategist *)self gameModel],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    cppMinmax = self->_cppMinmax;
    cppMinmax[13] = numMovesToConsider;
    v11 = GKCMinmaxStrategist::findBestMoveForPlayer((uint64_t)cppMinmax, v6, 1);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end