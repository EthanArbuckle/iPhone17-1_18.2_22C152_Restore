@interface GKDataSourceMetrics
+ (GKDataSourceMetrics)dataSourceMetricsWithMetrics:(id)a3 dataSource:(id)a4;
- (GKCollectionViewDataSource)dataSource;
- (GKDataSourceMetrics)initWithMetrics:(id)a3 dataSource:(id)a4;
- (NSArray)childMetrics;
- (NSMutableDictionary)sectionToMetrics;
- (NSString)cachedKey;
- (_NSRange)globalSectionRange;
- (_NSRange)localSectionRange;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)accumulateSections:(id)a3 layout:(id)a4;
- (id)applyDataSourceMetricsToSections:(id)a3 withParent:(id)a4 layout:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)globalLayoutKey;
- (id)globalLayoutKeyForSection:(int64_t)a3;
- (id)metricsForSection:(int64_t)a3;
- (void)computeGlobalSectionRangesWithBaseIndex:(int64_t)a3;
- (void)generateMetricDataForLayout:(id)a3;
- (void)prepareLayout:(id)a3;
- (void)setCachedKey:(id)a3;
- (void)setChildMetrics:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setGlobalSectionRange:(_NSRange)a3;
- (void)setLocalSectionRange:(_NSRange)a3;
- (void)setMetrics:(id)a3 forSection:(int64_t)a4;
- (void)setSectionToMetrics:(id)a3;
@end

@implementation GKDataSourceMetrics

+ (GKDataSourceMetrics)dataSourceMetricsWithMetrics:(id)a3 dataSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMetrics:v6 dataSource:v5];

  return (GKDataSourceMetrics *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setGlobalSectionRange:", self->_globalSectionRange.location, self->_globalSectionRange.length);
    objc_msgSend(v5, "setLocalSectionRange:", self->_localSectionRange.location, self->_localSectionRange.length);
    sectionToMetrics = self->_sectionToMetrics;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__GKDataSourceMetrics_copyWithZone___block_invoke;
    v10[3] = &unk_1E5F63760;
    id v7 = v5;
    id v11 = v7;
    [(NSMutableDictionary *)sectionToMetrics enumerateKeysAndObjectsUsingBlock:v10];
    v8 = [(NSArray *)self->_childMetrics _gkMapWithBlock:&__block_literal_global_4];
    [v7 setChildMetrics:v8];

    [v7 setDataSource:self->_dataSource];
    [v7 setCachedKey:self->_cachedKey];
  }
  return v5;
}

void __36__GKDataSourceMetrics_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = (id)[a3 mutableCopy];
  id v6 = [*(id *)(a1 + 32) sectionToMetrics];
  [v6 setObject:v7 forKeyedSubscript:v5];
}

id __36__GKDataSourceMetrics_copyWithZone___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copy];

  return v2;
}

- (GKDataSourceMetrics)initWithMetrics:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(GKGridLayoutMetrics *)self init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionToMetrics = v8->_sectionToMetrics;
    v8->_sectionToMetrics = v9;

    if (v6)
    {
      id v11 = (void *)[v6 copy];

      v12 = [v11 keyToMetrics];
      [(GKGridLayoutMetrics *)v8 setKeyToMetrics:v12];

      v13 = [v11 locationToKeyList];
      [(GKGridLayoutMetrics *)v8 setLocationToKeyList:v13];

      id v6 = v11;
    }
    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

- (id)description
{
  return [(GKDataSourceMetrics *)self _gkDescriptionWithChildren:0];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = _gkTabStringForTabLevel();
  id v5 = [MEMORY[0x1E4F28E78] string];
  v68.receiver = self;
  v68.super_class = (Class)GKDataSourceMetrics;
  id v6 = [(GKGridLayoutMetrics *)&v68 localDescription];
  id v7 = _gkRangeFromToDescription(@" global:", self->_globalSectionRange.location, self->_globalSectionRange.length);
  v8 = _gkRangeFromToDescription(@" local:", self->_localSectionRange.location, self->_localSectionRange.length);
  [v5 appendFormat:@"%@%@%@%@", v4, v6, v7, v8];

  v9 = [(GKGridLayoutMetrics *)self layoutKey];

  if (v9)
  {
    v10 = [(GKGridLayoutMetrics *)self layoutKey];
    [v5 appendFormat:@" layoutKey:'%@'", v10];
  }
  id v11 = [(GKGridLayoutMetrics *)self locationToKeyList];
  uint64_t v12 = [v11 count];

  v55 = v4;
  v56 = v5;
  v54 = self;
  if (v12 <= 0)
  {
    v25 = [(GKDataSourceMetrics *)self sectionToMetrics];
    if ([v25 count])
    {
    }
    else
    {
      NSUInteger v26 = [(NSArray *)self->_childMetrics count];

      if (!v26) {
        goto LABEL_34;
      }
    }
    [v5 appendString:@"{\n"];
  }
  else
  {
    [v5 appendString:@"{\n"];
    v13 = [(GKGridLayoutMetrics *)self locationToKeyList];
    v14 = [v13 objectForKeyedSubscript:&unk_1F0811CB8];

    if ([v14 count])
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v65 = 0u;
      long long v64 = 0u;
      obuint64_t j = v14;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v65 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            v21 = [(GKGridLayoutMetrics *)self keyToMetrics];
            v22 = [v21 objectForKeyedSubscript:v20];
            v23 = [v22 objectForKeyedSubscript:@"metrics"];

            v24 = [v23 localDescription];
            [v5 appendFormat:@"%@    header - %@\t:\t%@\n", v55, v20, v24];

            self = v54;
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v17);
      }

      id v4 = v55;
      [v5 appendFormat:@"%@    ---\n", v55];
      v14 = obj;
    }
  }
  v27 = [(GKDataSourceMetrics *)self sectionToMetrics];
  uint64_t v28 = [v27 count];

  p_isa = (id *)&v54->super.super.isa;
  if (v28)
  {
    [v5 appendFormat:@"%@    sectionMetrics: {\n", v4];
    v30 = v5;
    v31 = v4;
    if ([(NSMutableDictionary *)v54->_sectionToMetrics count])
    {
      unint64_t v32 = 0;
      do
      {
        sectionToMetrics = v54->_sectionToMetrics;
        v34 = [NSNumber numberWithInteger:v32];
        v35 = [(NSMutableDictionary *)sectionToMetrics objectForKeyedSubscript:v34];

        v36 = [v35 _gkDescriptionWithChildren:a3 + 2];
        v37 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v38 = [v36 stringByTrimmingCharactersInSet:v37];

        v39 = [NSNumber numberWithInteger:v32];
        [v30 appendFormat:@"%@        section %@ - %@", v31, v39, v38];

        p_isa = (id *)&v54->super.super.isa;
        ++v32;
      }
      while (v32 < [(NSMutableDictionary *)v54->_sectionToMetrics count]);
    }
    [v30 appendFormat:@"%@    }\n", v31];
    id v5 = v30;
    id v4 = v31;
  }
  if (![p_isa[5] count]) {
    goto LABEL_32;
  }
  [v5 appendFormat:@"%@    children: {\n", v4];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obja = p_isa[5];
  uint64_t v40 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = 0;
    uint64_t v43 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v61 != v43) {
          objc_enumerationMutation(obja);
        }
        v45 = [*(id *)(*((void *)&v60 + 1) + 8 * j) _gkDescriptionWithChildren:a3 + 2];
        v46 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v47 = [v45 stringByTrimmingCharactersInSet:v46];

        v48 = [NSNumber numberWithInteger:v42 + j];
        id v4 = v55;
        id v5 = v56;
        [v56 appendFormat:@"%@        child %@ - %@", v55, v48, v47];
      }
      uint64_t v41 = [obja countByEnumeratingWithState:&v60 objects:v69 count:16];
      v42 += j;
    }
    while (v41);
  }

  [v5 appendFormat:@"%@    }\n", v4];
  p_isa = (id *)&v54->super.super.isa;
  if (v54)
  {
LABEL_32:
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __50__GKDataSourceMetrics__gkDescriptionWithChildren___block_invoke;
    v57[3] = &unk_1E5F63788;
    v57[4] = p_isa;
    id v58 = v5;
    id v59 = v4;
    [p_isa enumerateSupplementaryLocations:v57];
  }
  [v5 appendFormat:@"%@}", v4];
LABEL_34:
  [v5 appendString:@"\n"];
  id v49 = (id)_gkUnicodifyDescription();

  return v5;
}

void __50__GKDataSourceMetrics__gkDescriptionWithChildren___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) locationToKeyList];
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 count];
  unint64_t v22 = a2;
  if (a2 && v7)
  {
    [*(id *)(a1 + 40) appendFormat:@"%@    ---\n", *(void *)(a1 + 48)];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v20 = v6;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v13 = [*(id *)(a1 + 32) keyToMetrics];
          v14 = [v13 objectForKeyedSubscript:v12];
          id v15 = [v14 objectForKeyedSubscript:@"metrics"];

          if (v22 > 4) {
            uint64_t v16 = 0;
          }
          else {
            uint64_t v16 = off_1E5F63BF0[v22 - 1];
          }
          uint64_t v18 = *(void **)(a1 + 40);
          uint64_t v17 = *(void *)(a1 + 48);
          v19 = [v15 localDescription];
          [v18 appendFormat:@"%@    %@ - %@\t:\t%@\n", v17, v16, v12, v19];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    id v6 = v20;
  }
}

- (id)metricsForSection:(int64_t)a3
{
  sectionToMetrics = self->_sectionToMetrics;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)sectionToMetrics objectForKeyedSubscript:v4];

  return v5;
}

- (void)setMetrics:(id)a3 forSection:(int64_t)a4
{
  sectionToMetrics = self->_sectionToMetrics;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)sectionToMetrics setObject:v7 forKeyedSubscript:v8];
}

- (id)globalLayoutKey
{
  cachedKey = self->_cachedKey;
  if (!cachedKey)
  {
    id v4 = [NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self->_dataSource];
    id v5 = self->_cachedKey;
    self->_cachedKey = v4;

    cachedKey = self->_cachedKey;
  }

  return cachedKey;
}

- (id)globalLayoutKeyForSection:(int64_t)a3
{
  id v4 = NSString;
  id v5 = [(GKDataSourceMetrics *)self globalLayoutKey];
  id v6 = [v4 stringWithFormat:@"%@ - %ld", v5, a3];

  return v6;
}

- (_NSRange)globalSectionRange
{
  p_globalSectionRange = &self->_globalSectionRange;
  NSUInteger location = self->_globalSectionRange.location;
  NSUInteger length = p_globalSectionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setGlobalSectionRange:(_NSRange)a3
{
  self->_globalSectionRange = a3;
}

- (_NSRange)localSectionRange
{
  p_localSectionRange = &self->_localSectionRange;
  NSUInteger location = self->_localSectionRange.location;
  NSUInteger length = p_localSectionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLocalSectionRange:(_NSRange)a3
{
  self->_localSectionRange = a3;
}

- (NSMutableDictionary)sectionToMetrics
{
  return self->_sectionToMetrics;
}

- (void)setSectionToMetrics:(id)a3
{
}

- (NSArray)childMetrics
{
  return self->_childMetrics;
}

- (void)setChildMetrics:(id)a3
{
}

- (GKCollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSString)cachedKey
{
  return self->_cachedKey;
}

- (void)setCachedKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedKey, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_childMetrics, 0);

  objc_storeStrong((id *)&self->_sectionToMetrics, 0);
}

- (void)computeGlobalSectionRangesWithBaseIndex:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(GKDataSourceMetrics *)self localSectionRange];
  uint64_t v6 = v5;
  -[GKDataSourceMetrics setGlobalSectionRange:](self, "setGlobalSectionRange:", a3, v5);
  id v7 = [(GKDataSourceMetrics *)self globalLayoutKey];
  [(GKGridLayoutMetrics *)self setLayoutKey:v7];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84__GKDataSourceMetrics_GKGridLayoutPrivate__computeGlobalSectionRangesWithBaseIndex___block_invoke;
  v20[3] = &__block_descriptor_48_e56_v40__0__GKSupplementaryViewMetrics_8__NSString_16Q24_B32l;
  v20[4] = a3;
  v20[5] = v6;
  [(GKGridLayoutMetrics *)self enumerateSupplementaryMetricsUsingBlock:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(GKDataSourceMetrics *)self childMetrics];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v13 computeGlobalSectionRangesWithBaseIndex:a3];
        uint64_t v14 = [v13 globalSectionRange];
        a3 = v14 + v15;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }
}

uint64_t __84__GKDataSourceMetrics_GKGridLayoutPrivate__computeGlobalSectionRangesWithBaseIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGlobalSectionRange:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (id)accumulateSections:(id)a3 layout:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GKDataSourceMetrics *)self globalSectionRange];
  uint64_t v10 = v9;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v11 = [(GKDataSourceMetrics *)self childMetrics];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (id)[*(id *)(*((void *)&v29 + 1) + 8 * i) accumulateSections:v6 layout:v7];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v13);
  }
  uint64_t v28 = self;

  if (v10)
  {
    uint64_t v17 = 0;
    while (1)
    {
      long long v18 = [v7 collectionView];
      uint64_t v19 = [v18 numberOfSections];

      uint64_t v20 = [NSNumber numberWithInteger:v8 + v17];
      if (v8 + v17 < v19) {
        break;
      }
      [v6 removeObjectForKey:v20];
LABEL_20:

      if (v10 == ++v17) {
        goto LABEL_23;
      }
    }
    v21 = [v6 objectForKeyedSubscript:v20];

    if (v21)
    {
      uint64_t v22 = [v7 collectionView];
      uint64_t v23 = [v22 numberOfItemsInSection:v8 + v17];

      if (v23 > 0 || ([v21 shouldShowSectionHeadersWhenNoItems] & 1) != 0) {
        goto LABEL_19;
      }
      long long v24 = [NSNumber numberWithInteger:v8 + v17];
      [v6 removeObjectForKey:v24];
    }
    else
    {
      long long v25 = [(GKDataSourceMetrics *)v28 metricsForSection:v17];
      v21 = (void *)[v25 copy];

      if (!v21)
      {
        uint64_t v20 = 0;
        goto LABEL_20;
      }
      long long v26 = [NSNumber numberWithInteger:v8 + v17];
      [v6 setObject:v21 forKeyedSubscript:v26];

      long long v24 = [(GKDataSourceMetrics *)v28 globalLayoutKeyForSection:v17];
      [v21 setLayoutKey:v24];
    }

LABEL_19:
    uint64_t v20 = v21;
    goto LABEL_20;
  }
LABEL_23:

  return v6;
}

- (id)applyDataSourceMetricsToSections:(id)a3 withParent:(id)a4 layout:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v10 = [(GKDataSourceMetrics *)self childMetrics];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = (id)[*(id *)(*((void *)&v41 + 1) + 8 * i) applyDataSourceMetricsToSections:v8 withParent:self layout:v9];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v12);
  }

  uint64_t v40 = [(GKDataSourceMetrics *)self globalSectionRange];
  if (v16)
  {
    uint64_t v17 = v16;
    id v39 = a4;
    uint64_t v18 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v21 = v40 + v18;
      uint64_t v22 = objc_msgSend(v9, "collectionView", v39);
      uint64_t v23 = [v22 numberOfSections];

      if (v40 + v18 < v23)
      {
        long long v24 = [v9 collectionView];
        uint64_t v25 = [v24 numberOfItemsInSection:v21];

        if (v20 == 0x7FFFFFFFFFFFFFFFLL && v25 > 0) {
          uint64_t v20 = v40 + v18;
        }
        if (v25 > 0) {
          uint64_t v19 = v40 + v18;
        }
      }
      v27 = [NSNumber numberWithInteger:v21];
      uint64_t v28 = [v8 objectForKeyedSubscript:v27];

      if (!v28)
      {
        long long v29 = [v9 defaultSectionMetricsInternal];
        uint64_t v28 = (void *)[v29 copy];

        long long v30 = [NSNumber numberWithInteger:v21];
        [v8 setObject:v28 forKeyedSubscript:v30];

        long long v31 = [(GKDataSourceMetrics *)self globalLayoutKeyForSection:v18];
        [v28 setLayoutKey:v31];
      }
      ++v18;
    }
    while (v17 != v18);
    if (v39 && v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v32 = v19;
      uint64_t v33 = v19 - v20;
      uint64_t v34 = [NSNumber numberWithInteger:v20];
      v35 = [v8 objectForKeyedSubscript:v34];

      objc_msgSend(v35, "mergeSupplementaryMetricsFromEnclosingMetrics:atLocation:globalRange:", self, 0, v20, v33);
      v36 = [NSNumber numberWithInteger:v32];
      v37 = [v8 objectForKeyedSubscript:v36];

      objc_msgSend(v37, "mergeSupplementaryMetricsFromEnclosingMetrics:atLocation:globalRange:", self, 1, v20, v33);
    }
  }

  return v8;
}

- (void)generateMetricDataForLayout:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(GKDataSourceMetrics *)self globalSectionRange];
  uint64_t v6 = v5;
  [(GKDataSourceMetrics *)self localSectionRange];
  if (v6 != v7)
  {
    id v8 = NSString;
    id v9 = [NSString stringWithFormat:@"Assertion failed"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutPrivate.m"];
    id v11 = [v10 lastPathComponent];
    uint64_t v12 = [v8 stringWithFormat:@"%@ (self.globalSectionRange.length == self.localSectionRange.length)\n[%s (%s:%d)]", v9, "-[GKDataSourceMetrics(GKGridLayoutPrivate) generateMetricDataForLayout:]", objc_msgSend(v11, "UTF8String"), 212];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v12 format];
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA60];
  [(GKDataSourceMetrics *)self globalSectionRange];
  id v15 = [v13 dictionaryWithCapacity:v14];
  uint64_t v16 = [(GKDataSourceMetrics *)self accumulateSections:v15 layout:v4];

  id v17 = [(GKDataSourceMetrics *)self applyDataSourceMetricsToSections:v16 withParent:0 layout:v4];
  uint64_t v18 = [v16 allKeys];
  uint64_t v19 = [v18 sortedArrayUsingComparator:&__block_literal_global_31];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = [v16 objectForKeyedSubscript:v25];
        v27 = [v26 layoutKey];
        uint64_t v28 = [v4 metricDataForKey:v27];
        [v28 setMetrics:v26];
        [v28 setFilteredTotalItemCount:-1];
        objc_msgSend(v4, "setMetricData:forSection:", v28, objc_msgSend(v25, "integerValue"));
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }

  long long v29 = [v4 metricDataForKey:@"GKGlobalSection"];
  [v4 setMetricData:v29 forSection:0x7FFFFFFFFFFFFFFFLL];
}

uint64_t __72__GKDataSourceMetrics_GKGridLayoutPrivate__generateMetricDataForLayout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)prepareLayout:(id)a3
{
  id v4 = a3;
  [(GKDataSourceMetrics *)self computeGlobalSectionRangesWithBaseIndex:[(GKDataSourceMetrics *)self globalSectionRange]];
  [(GKDataSourceMetrics *)self generateMetricDataForLayout:v4];
}

@end