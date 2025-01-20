@interface GKAggregateMapping
- (GKAggregateMapping)init;
- (GKAggregateMapping)initWithGlobalToLocalMapping:(id)a3;
- (GKCollectionViewDataSource)dataSource;
- (NSMutableDictionary)globalSectionsToTags;
- (NSMutableDictionary)globalToLocalSections;
- (NSMutableDictionary)localToGlobalSections;
- (NSString)dynamicTag;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)globalIndexPathForLocalIndexPath:(id)a3;
- (id)localIndexPathForGlobalIndexPath:(id)a3;
- (id)tagForGlobalSection:(int64_t)a3;
- (int64_t)sectionCount;
- (unint64_t)globalSectionForLocalSection:(unint64_t)a3;
- (unint64_t)localSectionForGlobalSection:(unint64_t)a3;
- (unint64_t)updateMappingsStartingWithGlobalSection:(unint64_t)a3;
- (void)addMappingFromGlobalSection:(unint64_t)a3 toLocalSection:(unint64_t)a4 withTag:(id)a5;
- (void)setDataSource:(id)a3;
- (void)setDynamicTag:(id)a3;
- (void)setGlobalSectionsToTags:(id)a3;
- (void)setGlobalToLocalSections:(id)a3;
- (void)setLocalToGlobalSections:(id)a3;
- (void)setSectionCount:(int64_t)a3;
@end

@implementation GKAggregateMapping

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[GKAggregateMapping allocWithZone:a3] init];
  v5 = [(GKAggregateMapping *)self dataSource];
  [(GKAggregateMapping *)v4 setDataSource:v5];

  v6 = [(GKAggregateMapping *)self globalToLocalSections];
  [(GKAggregateMapping *)v4 setGlobalToLocalSections:v6];

  v7 = [(GKAggregateMapping *)self localToGlobalSections];
  [(GKAggregateMapping *)v4 setLocalToGlobalSections:v7];

  v8 = [(GKAggregateMapping *)self globalSectionsToTags];
  [(GKAggregateMapping *)v4 setGlobalSectionsToTags:v8];

  return v4;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  v19.receiver = self;
  v19.super_class = (Class)GKAggregateMapping;
  v4 = [(GKAggregateMapping *)&v19 description];
  objc_msgSend(v3, "appendFormat:", @"%@ ("), v4;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(NSMutableDictionary *)self->_globalSectionsToTags allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(NSMutableDictionary *)self->_globalToLocalSections objectForKeyedSubscript:v10];
        v12 = [(NSMutableDictionary *)self->_globalSectionsToTags objectForKeyedSubscript:v10];
        if ((v8 & 1) == 0) {
          [v3 appendString:@", "];
        }
        [v3 appendFormat:@"%@ -> %@[%@]", v10, v12, v11];

        char v8 = 0;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v20 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  [v3 appendString:@""]);

  return v3;
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  uint64_t v6 = _gkTabStringForTabLevel();
  uint64_t v7 = [(GKAggregateMapping *)self _gkDescription];
  [v5 appendFormat:@"%@%@", v6, v7];

  id v8 = (id)_gkUnicodifyDescription();
  v9 = [(GKCollectionViewDataSource *)self->_dataSource _gkDescriptionWithChildren:a3 + 1];
  [v5 appendFormat:@"%@", v9];

  return v5;
}

- (unint64_t)localSectionForGlobalSection:(unint64_t)a3
{
  globalToLocalSections = self->_globalToLocalSections;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)globalToLocalSections objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = NSString;
    v9 = [NSString stringWithFormat:@"globalSection %ld not found in globalToLocalSections: %@", a3, self->_globalToLocalSections];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m"];
    id v11 = [v10 lastPathComponent];
    v12 = [v8 stringWithFormat:@"%@ (localSection != nil)\n[%s (%s:%d)]", v9, "-[GKAggregateMapping localSectionForGlobalSection:]", objc_msgSend(v11, "UTF8String"), 100];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
  }
  unint64_t v13 = [v7 unsignedIntegerValue];

  return v13;
}

- (unint64_t)globalSectionForLocalSection:(unint64_t)a3
{
  localToGlobalSections = self->_localToGlobalSections;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)localToGlobalSections objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = NSString;
    v9 = [NSString stringWithFormat:@"localSection %ld not found in localToGlobalSections:%@", a3, self->_localToGlobalSections];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m"];
    id v11 = [v10 lastPathComponent];
    v12 = [v8 stringWithFormat:@"%@ (globalSection != nil)\n[%s (%s:%d)]", v9, "-[GKAggregateMapping globalSectionForLocalSection:]", objc_msgSend(v11, "UTF8String"), 107];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
  }
  unint64_t v13 = [v7 unsignedIntegerValue];

  return v13;
}

- (id)localIndexPathForGlobalIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[GKAggregateMapping localSectionForGlobalSection:](self, "localSectionForGlobalSection:", [v4 section]);
  uint64_t v6 = [v4 item];
  globalSectionsToTags = self->_globalSectionsToTags;
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
  v9 = [(NSMutableDictionary *)globalSectionsToTags objectForKeyedSubscript:v8];
  uint64_t v10 = +[GKMappedIndexPath indexPathForItem:v6 inSection:v5 fromSourceIndexPath:v4 withTag:v9];

  return v10;
}

- (id)globalIndexPathForLocalIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[GKAggregateMapping globalSectionForLocalSection:](self, "globalSectionForLocalSection:", [v4 section]);
  uint64_t v6 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v7 = [v4 item];

  return (id)[v6 indexPathForItem:v7 inSection:v5];
}

- (GKAggregateMapping)init
{
  return [(GKAggregateMapping *)self initWithGlobalToLocalMapping:0];
}

- (GKAggregateMapping)initWithGlobalToLocalMapping:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GKAggregateMapping;
  unint64_t v5 = [(GKAggregateMapping *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v4];
    globalToLocalSections = v5->_globalToLocalSections;
    v5->_globalToLocalSections = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](v5->_globalToLocalSections, "count"));
    localToGlobalSections = v5->_localToGlobalSections;
    v5->_localToGlobalSections = (NSMutableDictionary *)v8;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = v5->_globalToLocalSections;
    uint64_t v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          long long v16 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_globalToLocalSections, "objectForKeyedSubscript:", v15, (void)v20);
          [(NSMutableDictionary *)v5->_localToGlobalSections setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v12 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](v5->_globalToLocalSections, "count"));
    globalSectionsToTags = v5->_globalSectionsToTags;
    v5->_globalSectionsToTags = (NSMutableDictionary *)v17;
  }
  return v5;
}

- (id)tagForGlobalSection:(int64_t)a3
{
  globalSectionsToTags = self->_globalSectionsToTags;
  id v4 = [NSNumber numberWithInteger:a3];
  unint64_t v5 = [(NSMutableDictionary *)globalSectionsToTags objectForKeyedSubscript:v4];

  return v5;
}

- (void)addMappingFromGlobalSection:(unint64_t)a3 toLocalSection:(unint64_t)a4 withTag:(id)a5
{
  id v23 = a5;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v10 = [(NSMutableDictionary *)self->_localToGlobalSections objectForKeyedSubscript:v9];

  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [NSString stringWithFormat:@"collision while trying to add to a GKAggregateMapping"];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m"];
    id v14 = [v13 lastPathComponent];
    uint64_t v15 = [v11 stringWithFormat:@"%@ (_localToGlobalSections[localNum] == nil)\n[%s (%s:%d)]", v12, "-[GKAggregateMapping addMappingFromGlobalSection:toLocalSection:withTag:]", objc_msgSend(v14, "UTF8String"), 156];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v15 format];
  }
  [(NSMutableDictionary *)self->_globalToLocalSections setObject:v9 forKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_localToGlobalSections setObject:v8 forKeyedSubscript:v9];
  long long v16 = [(NSMutableDictionary *)self->_globalSectionsToTags objectForKeyedSubscript:v8];

  id v17 = v23;
  if (v16)
  {
    long long v18 = NSString;
    objc_super v19 = [NSString stringWithFormat:@"you must define a unique tag. %@ is already being used.", v23];
    long long v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewAggregateDataSourcePrivate.m"];
    id v21 = [v20 lastPathComponent];
    long long v22 = [v18 stringWithFormat:@"%@ (_globalSectionsToTags[globalNum] == nil)\n[%s (%s:%d)]", v19, "-[GKAggregateMapping addMappingFromGlobalSection:toLocalSection:withTag:]", objc_msgSend(v21, "UTF8String"), 160];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v22 format];
    id v17 = v23;
  }
  [(NSMutableDictionary *)self->_globalSectionsToTags setObject:v17 forKeyedSubscript:v8];
}

- (unint64_t)updateMappingsStartingWithGlobalSection:(unint64_t)a3
{
  self->_sectionCount = [(GKCollectionViewDataSource *)self->_dataSource numberOfSectionsInCollectionView:0];
  [(NSMutableDictionary *)self->_globalToLocalSections removeAllObjects];
  [(NSMutableDictionary *)self->_localToGlobalSections removeAllObjects];
  [(NSMutableDictionary *)self->_globalSectionsToTags removeAllObjects];
  if (self->_sectionCount)
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@ %ld", self->_dynamicTag, v5];
      [(GKAggregateMapping *)self addMappingFromGlobalSection:a3 + v5 toLocalSection:v5 withTag:v6];

      ++v5;
    }
    while (v5 < self->_sectionCount);
    a3 += v5;
  }
  return a3;
}

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (int64_t)sectionCount
{
  return self->_sectionCount;
}

- (void)setSectionCount:(int64_t)a3
{
  self->_sectionCount = a3;
}

- (NSString)dynamicTag
{
  return self->_dynamicTag;
}

- (void)setDynamicTag:(id)a3
{
}

- (NSMutableDictionary)globalToLocalSections
{
  return self->_globalToLocalSections;
}

- (void)setGlobalToLocalSections:(id)a3
{
}

- (NSMutableDictionary)localToGlobalSections
{
  return self->_localToGlobalSections;
}

- (void)setLocalToGlobalSections:(id)a3
{
}

- (NSMutableDictionary)globalSectionsToTags
{
  return self->_globalSectionsToTags;
}

- (void)setGlobalSectionsToTags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSectionsToTags, 0);
  objc_storeStrong((id *)&self->_localToGlobalSections, 0);
  objc_storeStrong((id *)&self->_globalToLocalSections, 0);
  objc_storeStrong((id *)&self->_dynamicTag, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end