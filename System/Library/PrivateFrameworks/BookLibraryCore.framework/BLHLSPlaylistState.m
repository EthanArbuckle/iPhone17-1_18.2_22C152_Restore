@interface BLHLSPlaylistState
- (BLHLSKey)currentKey;
- (BLHLSMap)currentMap;
- (BLHLSPlaylistState)init;
- (BLHLSStreamInf)currentStreamInf;
- (NSMutableArray)mutableSegments;
- (NSMutableArray)mutableStreamInfs;
- (NSMutableDictionary)mutableGroups;
- (double)currentDuration;
- (void)setCurrentDuration:(double)a3;
- (void)setCurrentKey:(id)a3;
- (void)setCurrentMap:(id)a3;
- (void)setCurrentStreamInf:(id)a3;
- (void)setMutableGroups:(id)a3;
- (void)setMutableSegments:(id)a3;
- (void)setMutableStreamInfs:(id)a3;
@end

@implementation BLHLSPlaylistState

- (BLHLSPlaylistState)init
{
  v19.receiver = self;
  v19.super_class = (Class)BLHLSPlaylistState;
  v5 = [(BLHLSPlaylistState *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v2, v3, v4);
    mutableGroups = v5->_mutableGroups;
    v5->_mutableGroups = (NSMutableDictionary *)v6;

    uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10);
    mutableSegments = v5->_mutableSegments;
    v5->_mutableSegments = (NSMutableArray *)v11;

    uint64_t v16 = objc_msgSend_array(MEMORY[0x263EFF980], v13, v14, v15);
    mutableStreamInfs = v5->_mutableStreamInfs;
    v5->_mutableStreamInfs = (NSMutableArray *)v16;

    v5->_currentDuration = -1.0;
  }
  return v5;
}

- (NSMutableDictionary)mutableGroups
{
  return self->_mutableGroups;
}

- (void)setMutableGroups:(id)a3
{
}

- (BLHLSMap)currentMap
{
  return self->_currentMap;
}

- (void)setCurrentMap:(id)a3
{
}

- (double)currentDuration
{
  return self->_currentDuration;
}

- (void)setCurrentDuration:(double)a3
{
  self->_currentDuration = a3;
}

- (NSMutableArray)mutableSegments
{
  return self->_mutableSegments;
}

- (void)setMutableSegments:(id)a3
{
}

- (BLHLSStreamInf)currentStreamInf
{
  return self->_currentStreamInf;
}

- (void)setCurrentStreamInf:(id)a3
{
}

- (NSMutableArray)mutableStreamInfs
{
  return self->_mutableStreamInfs;
}

- (void)setMutableStreamInfs:(id)a3
{
}

- (BLHLSKey)currentKey
{
  return self->_currentKey;
}

- (void)setCurrentKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKey, 0);
  objc_storeStrong((id *)&self->_mutableStreamInfs, 0);
  objc_storeStrong((id *)&self->_currentStreamInf, 0);
  objc_storeStrong((id *)&self->_mutableSegments, 0);
  objc_storeStrong((id *)&self->_currentMap, 0);

  objc_storeStrong((id *)&self->_mutableGroups, 0);
}

@end