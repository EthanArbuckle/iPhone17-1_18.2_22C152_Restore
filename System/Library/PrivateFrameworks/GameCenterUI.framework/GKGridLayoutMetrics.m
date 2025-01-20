@interface GKGridLayoutMetrics
+ (id)metrics;
- (GKGridLayoutMetrics)init;
- (NSMutableDictionary)keyToMetrics;
- (NSMutableDictionary)locationToKeyList;
- (NSString)layoutKey;
- (id)_gkDescription;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyListForLocation:(unint64_t)a3;
- (id)listForLocation:(unint64_t)a3;
- (id)localDescription;
- (id)supplementaryMetricsForKey:(id)a3;
- (int64_t)prepareLayout:(id)a3 startingAtSection:(int64_t)a4;
- (void)addSupplementaryMetrics:(id)a3 forKey:(id)a4 atLocation:(unint64_t)a5;
- (void)configureCollectionView:(id)a3;
- (void)enumerateSupplementaryLocations:(id)a3;
- (void)enumerateSupplementaryMetricsUsingBlock:(id)a3;
- (void)insertSupplementaryMetrics:(id)a3 forKey:(id)a4 atLocation:(unint64_t)a5;
- (void)mergeSupplementaryMetricsFromEnclosingMetrics:(id)a3 atLocation:(unint64_t)a4 globalRange:(_NSRange)a5;
- (void)removeSupplementaryMetricsForKey:(id)a3;
- (void)replaceSupplementaryMetrics:(id)a3 forKey:(id)a4;
- (void)setKeyToMetrics:(id)a3;
- (void)setLayoutKey:(id)a3;
- (void)setLocationToKeyList:(id)a3;
@end

@implementation GKGridLayoutMetrics

+ (id)metrics
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    locationToKeyList = self->_locationToKeyList;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__GKGridLayoutMetrics_copyWithZone___block_invoke;
    v17[3] = &unk_1E5F63760;
    id v7 = v4;
    id v18 = v7;
    [(NSMutableDictionary *)locationToKeyList enumerateKeysAndObjectsUsingBlock:v17];
    keyToMetrics = self->_keyToMetrics;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __36__GKGridLayoutMetrics_copyWithZone___block_invoke_2;
    v15 = &unk_1E5F63760;
    id v9 = v7;
    id v16 = v9;
    [(NSMutableDictionary *)keyToMetrics enumerateKeysAndObjectsUsingBlock:&v12];
    v10 = [(GKGridLayoutMetrics *)self layoutKey];
    [v9 setLayoutKey:v10];
  }
  return v5;
}

void __36__GKGridLayoutMetrics_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = (id)[a3 mutableCopy];
  v6 = [*(id *)(a1 + 32) locationToKeyList];
  [v6 setObject:v7 forKeyedSubscript:v5];
}

void __36__GKGridLayoutMetrics_copyWithZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  v6 = (void *)[v10 mutableCopy];
  id v7 = [v10 objectForKeyedSubscript:@"metrics"];
  v8 = (void *)[v7 copy];
  [v6 setObject:v8 forKeyedSubscript:@"metrics"];

  id v9 = [*(id *)(a1 + 32) keyToMetrics];
  [v9 setObject:v6 forKeyedSubscript:v5];
}

- (GKGridLayoutMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)GKGridLayoutMetrics;
  id v2 = [(GKGridLayoutMetrics *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    locationToKeyList = v2->_locationToKeyList;
    v2->_locationToKeyList = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyToMetrics = v2->_keyToMetrics;
    v2->_keyToMetrics = v5;
  }
  return v2;
}

- (id)localDescription
{
  v4.receiver = self;
  v4.super_class = (Class)GKGridLayoutMetrics;
  id v2 = [(GKGridLayoutMetrics *)&v4 description];

  return v2;
}

- (id)description
{
  return [(GKGridLayoutMetrics *)self _gkDescriptionWithChildren:0];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  objc_super v4 = _gkTabStringForTabLevel();
  id v5 = [MEMORY[0x1E4F28E78] string];
  v16.receiver = self;
  v16.super_class = (Class)GKGridLayoutMetrics;
  uint64_t v6 = [(GKGridLayoutMetrics *)&v16 description];
  id v7 = (void *)v6;
  if (self->_layoutKey)
  {
    objc_super v8 = [NSString stringWithFormat:@" layoutKey:%@", self->_layoutKey];
    [v5 appendFormat:@"%@%@%@ {\n", v4, v7, v8];
  }
  else
  {
    [v5 appendFormat:@"%@%@%@ {\n", v4, v6, &stru_1F07B2408];
  }

  if ([(NSMutableDictionary *)self->_keyToMetrics count])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__GKGridLayoutMetrics__gkDescriptionWithChildren___block_invoke;
    v13[3] = &unk_1E5F63788;
    v13[4] = self;
    id v9 = v5;
    id v14 = v9;
    id v10 = v4;
    id v15 = v10;
    [(GKGridLayoutMetrics *)self enumerateSupplementaryLocations:v13];
    [v9 appendFormat:@"%@}\n", v10];
  }
  else
  {
    v11 = [(GKGridLayoutMetrics *)self localDescription];
    [v5 appendFormat:@"%@    --- SECTION : %@\n", v4, v11];
  }

  return v5;
}

void __50__GKGridLayoutMetrics__gkDescriptionWithChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  switch(a2)
  {
    case 0:
      id v7 = @"header";
      break;
    case 1:
      objc_super v8 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [*(id *)(a1 + 32) localDescription];
      [v8 appendFormat:@"%@    --- SECTION : %@\n", v9, v10];

      id v7 = @"footer";
      break;
    case 2:
      id v7 = @"overlay";
      break;
    case 3:
      id v7 = @"segmented-box";
      break;
    case 4:
      id v7 = @"content-box";
      break;
    default:
      id v7 = 0;
      break;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_super v16 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v15];
        v17 = [v16 objectForKeyedSubscript:@"metrics"];

        v19 = *(void **)(a1 + 40);
        uint64_t v18 = *(void *)(a1 + 48);
        v20 = [v17 localDescription];
        [v19 appendFormat:@"%@    %@ - %@\t:\t%@\n", v18, v7, v15, v20];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
}

- (id)_gkDescription
{
  v4.receiver = self;
  v4.super_class = (Class)GKGridLayoutMetrics;
  id v2 = [(GKGridLayoutMetrics *)&v4 description];

  return v2;
}

- (void)enumerateSupplementaryLocations:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28E60] indexSet];
    locationToKeyList = self->_locationToKeyList;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke;
    v10[3] = &unk_1E5F637B0;
    id v11 = v5;
    id v7 = v5;
    [(NSMutableDictionary *)locationToKeyList enumerateKeysAndObjectsUsingBlock:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke_2;
    v8[3] = &unk_1E5F637D8;
    id v9 = v4;
    [v7 enumerateIndexesUsingBlock:v8];
  }
}

uint64_t __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];

  return [v2 addIndex:v3];
}

uint64_t __55__GKGridLayoutMetrics_enumerateSupplementaryLocations___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSupplementaryMetricsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__GKGridLayoutMetrics_enumerateSupplementaryMetricsUsingBlock___block_invoke;
  v6[3] = &unk_1E5F63800;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(GKGridLayoutMetrics *)self enumerateSupplementaryLocations:v6];
}

void __63__GKGridLayoutMetrics_enumerateSupplementaryMetricsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  id v5 = [v3 objectForKeyedSubscript:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"metrics"];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)keyListForLocation:(unint64_t)a3
{
  locationToKeyList = self->_locationToKeyList;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)locationToKeyList objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = self->_locationToKeyList;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (id)listForLocation:(unint64_t)a3
{
  id v4 = [(GKGridLayoutMetrics *)self keyListForLocation:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__GKGridLayoutMetrics_listForLocation___block_invoke;
  v7[3] = &unk_1E5F63828;
  v7[4] = self;
  id v5 = [v4 _gkMapWithBlock:v7];

  return v5;
}

id __39__GKGridLayoutMetrics_listForLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:a2];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"metrics"];

  return v3;
}

- (void)insertSupplementaryMetrics:(id)a3 forKey:(id)a4 atLocation:(unint64_t)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = NSString;
    id v11 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v13 = [v12 lastPathComponent];
    long long v14 = [v10 stringWithFormat:@"%@ ([metrics isKindOfClass:[GKSupplementaryViewMetrics class]])\n[%s (%s:%d)]", v11, "-[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v13, "UTF8String"), 254];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  long long v15 = [(GKGridLayoutMetrics *)self keyListForLocation:a5];
  long long v16 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:v9];

  if (v16)
  {
    v17 = NSString;
    uint64_t v18 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:v9];
    v19 = [v17 stringWithFormat:@"attempted to insert key %@ that already exists: %@", v9, v18];
    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v21 = [v20 lastPathComponent];
    long long v22 = [v17 stringWithFormat:@"%@ (_keyToMetrics[key] == nil)\n[%s (%s:%d)]", v19, "-[GKGridLayoutMetrics insertSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v21, "UTF8String"), 256];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v22 format];
  }
  [v15 insertObject:v9 atIndex:0];
  v25[0] = @"metrics";
  v25[1] = @"location";
  v26[0] = v8;
  long long v23 = [NSNumber numberWithUnsignedInteger:a5];
  v26[1] = v23;
  long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [(NSMutableDictionary *)self->_keyToMetrics setObject:v24 forKeyedSubscript:v9];
}

- (void)addSupplementaryMetrics:(id)a3 forKey:(id)a4 atLocation:(unint64_t)a5
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v10 = NSString;
    id v11 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v13 = [v12 lastPathComponent];
    long long v14 = [v10 stringWithFormat:@"%@ ([metrics isKindOfClass:[GKSupplementaryViewMetrics class]])\n[%s (%s:%d)]", v11, "-[GKGridLayoutMetrics addSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v13, "UTF8String"), 263];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
  }
  long long v15 = [(GKGridLayoutMetrics *)self keyListForLocation:a5];
  long long v16 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:v9];

  if (v16)
  {
    v17 = NSString;
    uint64_t v18 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:v9];
    v19 = [v17 stringWithFormat:@"attempted to add key %@ that already exists: %@", v9, v18];
    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v21 = [v20 lastPathComponent];
    long long v22 = [v17 stringWithFormat:@"%@ (_keyToMetrics[key] == nil)\n[%s (%s:%d)]", v19, "-[GKGridLayoutMetrics addSupplementaryMetrics:forKey:atLocation:]", objc_msgSend(v21, "UTF8String"), 265];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v22 format];
  }
  [v15 addObject:v9];
  v25[0] = @"metrics";
  v25[1] = @"location";
  v26[0] = v8;
  long long v23 = [NSNumber numberWithUnsignedInteger:a5];
  v26[1] = v23;
  long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  [(NSMutableDictionary *)self->_keyToMetrics setObject:v24 forKeyedSubscript:v9];
}

- (void)mergeSupplementaryMetricsFromEnclosingMetrics:(id)a3 atLocation:(unint64_t)a4 globalRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v37 = a3;
  id v9 = [v37 keyListForLocation:a4];
  uint64_t v10 = [v9 count];
  uint64_t v11 = v10;
  switch(a4)
  {
    case 0uLL:
      if (v10 >= 1)
      {
        unint64_t v22 = v10 + 1;
        do
        {
          long long v23 = [v9 objectAtIndexedSubscript:v22 - 2];
          long long v24 = [v37 keyToMetrics];
          long long v25 = [v24 objectForKeyedSubscript:v23];

          v26 = [v25 objectForKeyedSubscript:@"metrics"];
          objc_msgSend(v26, "setGlobalSectionRange:", location, length);
          [(GKGridLayoutMetrics *)self insertSupplementaryMetrics:v26 forKey:v23 atLocation:0];

          --v22;
        }
        while (v22 > 1);
      }
      break;
    case 1uLL:
      if (v10 >= 1)
      {
        uint64_t v27 = 0;
        do
        {
          v28 = [v9 objectAtIndexedSubscript:v27];
          v29 = [v37 keyToMetrics];
          v30 = [v29 objectForKeyedSubscript:v28];

          v31 = [v30 objectForKeyedSubscript:@"metrics"];
          objc_msgSend(v31, "setGlobalSectionRange:", location, length);
          [(GKGridLayoutMetrics *)self addSupplementaryMetrics:v31 forKey:v28 atLocation:0];
          ++v27;
        }
        while (v11 != v27);
      }
      break;
    case 2uLL:
      if (v10 >= 1)
      {
        unint64_t v32 = v10 + 1;
        do
        {
          v33 = [v9 objectAtIndexedSubscript:v32 - 2];
          v34 = [v37 keyToMetrics];
          v35 = [v34 objectForKeyedSubscript:v33];

          v36 = [v35 objectForKeyedSubscript:@"metrics"];
          objc_msgSend(v36, "setGlobalSectionRange:", location, length);
          [(GKGridLayoutMetrics *)self insertSupplementaryMetrics:v36 forKey:v33 atLocation:2];

          --v32;
        }
        while (v32 > 1);
      }
      break;
    case 3uLL:
    case 4uLL:
      if (v10 >= 1)
      {
        unint64_t v12 = v10 + 1;
        do
        {
          id v13 = [v9 objectAtIndexedSubscript:v12 - 2];
          long long v14 = [v37 keyToMetrics];
          long long v15 = [v14 objectForKeyedSubscript:v13];

          long long v16 = [v15 objectForKeyedSubscript:@"metrics"];
          objc_msgSend(v16, "setGlobalSectionRange:", location, length);
          [(GKGridLayoutMetrics *)self insertSupplementaryMetrics:v16 forKey:v13 atLocation:a4];

          --v12;
        }
        while (v12 > 1);
      }
      break;
    default:
      v17 = NSString;
      uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"unknown location %ld encountered", a4);
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
      id v20 = [v19 lastPathComponent];
      id v21 = [v17 stringWithFormat:@"%@ (nil)\n[%s (%s:%d)]", v18, "-[GKGridLayoutMetrics mergeSupplementaryMetricsFromEnclosingMetrics:atLocation:globalRange:]", objc_msgSend(v20, "UTF8String"), 315];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v21 format];
      break;
  }
}

- (id)supplementaryMetricsForKey:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:a3];
  id v4 = [v3 objectForKeyedSubscript:@"metrics"];

  return v4;
}

- (void)replaceSupplementaryMetrics:(id)a3 forKey:(id)a4
{
  v41[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v39 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = NSString;
    id v9 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v11 = [v10 lastPathComponent];
    unint64_t v12 = [v8 stringWithFormat:@"%@ ([metrics isKindOfClass:[GKSupplementaryViewMetrics class]])\n[%s (%s:%d)]", v9, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v11, "UTF8String"), 327];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
  }
  id v13 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:v7];

  if (!v13)
  {
    long long v14 = NSString;
    long long v15 = [NSString stringWithFormat:@"attempted to replace key %@ that does not exist", v7];
    long long v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v17 = [v16 lastPathComponent];
    uint64_t v18 = [v14 stringWithFormat:@"%@ (_keyToMetrics[key] != nil)\n[%s (%s:%d)]", v15, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v17, "UTF8String"), 328];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v18 format];
  }
  v38 = [(NSMutableDictionary *)self->_keyToMetrics objectForKeyedSubscript:v7];
  v19 = [v38 objectForKeyedSubscript:@"location"];
  if (!v19)
  {
    id v20 = NSString;
    id v21 = [NSString stringWithFormat:@"Assertion failed"];
    unint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v23 = [v22 lastPathComponent];
    long long v24 = [v20 stringWithFormat:@"%@ (location != ((void *)0))\n[%s (%s:%d)]", v21, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v23, "UTF8String"), 331];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v24 format];
  }
  long long v25 = -[GKGridLayoutMetrics keyListForLocation:](self, "keyListForLocation:", [v19 integerValue]);
  if (!v25)
  {
    v26 = NSString;
    uint64_t v27 = [NSString stringWithFormat:@"Assertion failed"];
    v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v29 = [v28 lastPathComponent];
    v30 = [v26 stringWithFormat:@"%@ (keyList != ((void *)0))\n[%s (%s:%d)]", v27, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v29, "UTF8String"), 333];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v30 format];
  }
  uint64_t v31 = [v25 indexOfObject:v7];
  if (v31 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v32 = NSString;
    v33 = [NSString stringWithFormat:@"Inconsistency: key lookup contains metrics but list doesn't"];
    v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v35 = [v34 lastPathComponent];
    v36 = [v32 stringWithFormat:@"%@ (idx != NSNotFound)\n[%s (%s:%d)]", v33, "-[GKGridLayoutMetrics replaceSupplementaryMetrics:forKey:]", objc_msgSend(v35, "UTF8String"), 335];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v36 format];
  }
  [v25 setObject:v7 atIndexedSubscript:v31];
  v40[0] = @"metrics";
  v40[1] = @"location";
  v41[0] = v39;
  v41[1] = v19;
  id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  [(NSMutableDictionary *)self->_keyToMetrics setObject:v37 forKeyedSubscript:v7];
}

- (void)removeSupplementaryMetricsForKey:(id)a3
{
}

- (void)configureCollectionView:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__GKGridLayoutMetrics_configureCollectionView___block_invoke;
  v6[3] = &unk_1E5F63850;
  id v7 = v4;
  id v5 = v4;
  [(GKGridLayoutMetrics *)self enumerateSupplementaryMetricsUsingBlock:v6];
}

void __47__GKGridLayoutMetrics_configureCollectionView___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend((id)objc_msgSend(v5, "reusableViewClass"), "isSubclassOfClass:", objc_opt_class()))
  {
    uint64_t v3 = (void *)[v5 reusableViewClass];
    id v4 = [v5 kind];
    [v3 registerSupplementaryViewClassesForKind:v4 withCollectionView:*(void *)(a1 + 32)];
  }
}

- (NSMutableDictionary)keyToMetrics
{
  return self->_keyToMetrics;
}

- (void)setKeyToMetrics:(id)a3
{
}

- (NSMutableDictionary)locationToKeyList
{
  return self->_locationToKeyList;
}

- (void)setLocationToKeyList:(id)a3
{
}

- (NSString)layoutKey
{
  return self->_layoutKey;
}

- (void)setLayoutKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutKey, 0);
  objc_storeStrong((id *)&self->_locationToKeyList, 0);

  objc_storeStrong((id *)&self->_keyToMetrics, 0);
}

- (int64_t)prepareLayout:(id)a3 startingAtSection:(int64_t)a4
{
  id v5 = [a3 collectionView];
  int64_t v6 = [v5 numberOfSections] + a4;

  return v6;
}

@end