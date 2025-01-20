@interface BLTBulletinStorageSection
- (BLTBulletinStorageSection)initWithMaxContextSize:(unint64_t)a3;
- (NSMutableArray)bulletins;
- (NSMutableDictionary)bulletinIDToBulletin;
- (id)addOrReplaceBulletin:(id)a3;
- (unint64_t)maxContextSize;
- (unint64_t)totalContextSize;
- (void)removeBulletin:(id)a3;
@end

@implementation BLTBulletinStorageSection

- (BLTBulletinStorageSection)initWithMaxContextSize:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BLTBulletinStorageSection;
  v4 = [(BLTBulletinStorageSection *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxContextSize = a3;
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    bulletins = v5->_bulletins;
    v5->_bulletins = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    bulletinIDToBulletin = v5->_bulletinIDToBulletin;
    v5->_bulletinIDToBulletin = (NSMutableDictionary *)v8;
  }
  return v5;
}

- (id)addOrReplaceBulletin:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  bulletinIDToBulletin = self->_bulletinIDToBulletin;
  uint64_t v6 = [v4 bulletinID];
  v7 = [(NSMutableDictionary *)bulletinIDToBulletin objectForKeyedSubscript:v6];

  if (v7)
  {
    self->_totalContextSize -= [(BLTBulletinStorageBulletin *)v7 contextSize];
    [(NSMutableArray *)self->_bulletins removeObject:v7];
  }
  else
  {
    v7 = objc_alloc_init(BLTBulletinStorageBulletin);
    uint64_t v8 = self->_bulletinIDToBulletin;
    v9 = [v4 bulletinID];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  [(BLTBulletinStorageBulletin *)v7 setBulletin:v4];
  self->_totalContextSize += [(BLTBulletinStorageBulletin *)v7 contextSize];
  -[NSMutableArray insertObject:atIndex:](self->_bulletins, "insertObject:atIndex:", v7, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_bulletins, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, [(NSMutableArray *)self->_bulletins count], 1024, &__block_literal_global_15));
  v10 = 0;
  if (self->_totalContextSize > self->_maxContextSize)
  {
    objc_super v11 = blt_notification_size_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = [v4 sectionID];
      unint64_t totalContextSize = self->_totalContextSize;
      unint64_t maxContextSize = self->_maxContextSize;
      int v21 = 138412802;
      v22 = v18;
      __int16 v23 = 2048;
      unint64_t v24 = maxContextSize;
      __int16 v25 = 2048;
      unint64_t v26 = totalContextSize;
      _os_log_error_impl(&dword_222F4C000, v11, OS_LOG_TYPE_ERROR, "Section %@ exceeded max size (%lu). Total size is %lu", (uint8_t *)&v21, 0x20u);
    }
    v10 = [MEMORY[0x263EFF980] array];
    while (self->_totalContextSize > self->_maxContextSize && [(NSMutableArray *)self->_bulletins count])
    {
      v12 = [(NSMutableArray *)self->_bulletins objectAtIndexedSubscript:0];
      v13 = [v12 bulletin];
      [v10 addObject:v13];

      [(NSMutableArray *)self->_bulletins removeFirstObject];
      v14 = self->_bulletinIDToBulletin;
      v15 = [v12 bulletin];
      v16 = [v15 bulletinID];
      [(NSMutableDictionary *)v14 removeObjectForKey:v16];

      self->_totalContextSize -= [v12 contextSize];
    }
  }

  return v10;
}

uint64_t __50__BLTBulletinStorageSection_addOrReplaceBulletin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 bulletin];
  uint64_t v6 = [v5 dateOrRecencyDate];
  v7 = [v4 bulletin];

  uint64_t v8 = [v7 dateOrRecencyDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)removeBulletin:(id)a3
{
  id v4 = a3;
  bulletinIDToBulletin = self->_bulletinIDToBulletin;
  id v10 = v4;
  uint64_t v6 = [v4 bulletinID];
  v7 = [(NSMutableDictionary *)bulletinIDToBulletin objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = self->_bulletinIDToBulletin;
    uint64_t v9 = [v10 bulletinID];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    [(NSMutableArray *)self->_bulletins removeObject:v7];
    self->_totalContextSize -= [v7 contextSize];
  }
}

- (unint64_t)totalContextSize
{
  return self->_totalContextSize;
}

- (unint64_t)maxContextSize
{
  return self->_maxContextSize;
}

- (NSMutableArray)bulletins
{
  return self->_bulletins;
}

- (NSMutableDictionary)bulletinIDToBulletin
{
  return self->_bulletinIDToBulletin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletinIDToBulletin, 0);
  objc_storeStrong((id *)&self->_bulletins, 0);
}

@end