@interface PHASETargetRoomAcousticParameters
- (NSArray)subbandParameters;
- (PHASETargetRoomAcousticParameters)init;
- (PHASETargetRoomAcousticParameters)initWithSubbandParameters:(id)a3;
@end

@implementation PHASETargetRoomAcousticParameters

- (PHASETargetRoomAcousticParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHASETargetRoomAcousticParameters;
  v2 = [(PHASETargetRoomAcousticParameters *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    internalArray = v2->_internalArray;
    v2->_internalArray = v3;
  }
  return v2;
}

- (PHASETargetRoomAcousticParameters)initWithSubbandParameters:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASETargetRoomAcousticParameters;
  v5 = [(PHASETargetRoomAcousticParameters *)&v9 init];
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

- (void).cxx_destruct
{
}

@end