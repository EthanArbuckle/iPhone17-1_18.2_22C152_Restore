@interface PHASECardioidDirectivityModelParameters
- (NSArray)subbandParameters;
- (NSMutableArray)subbands;
- (PHASECardioidDirectivityModelParameters)init;
- (PHASECardioidDirectivityModelParameters)initWithSubbandParameters:(NSArray *)subbandParameters;
@end

@implementation PHASECardioidDirectivityModelParameters

- (PHASECardioidDirectivityModelParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHASECardioidDirectivityModelParameters;
  v2 = [(PHASEDirectivityModelParameters *)&v6 initInternal];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    internalArray = v2->_internalArray;
    v2->_internalArray = v3;
  }
  return v2;
}

- (PHASECardioidDirectivityModelParameters)initWithSubbandParameters:(NSArray *)subbandParameters
{
  v4 = subbandParameters;
  v9.receiver = self;
  v9.super_class = (Class)PHASECardioidDirectivityModelParameters;
  v5 = [(PHASEDirectivityModelParameters *)&v9 initInternal];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    internalArray = v5->_internalArray;
    v5->_internalArray = (NSMutableArray *)v6;
  }
  return v5;
}

- (NSArray)subbandParameters
{
  return (NSArray *)self->_internalArray;
}

- (NSMutableArray)subbands
{
  return self->_internalArray;
}

- (void).cxx_destruct
{
}

@end