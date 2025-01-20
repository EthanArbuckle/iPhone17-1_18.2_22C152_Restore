@interface GKMetricData
- (GKGridLayoutMetrics)metrics;
- (GKMetricData)init;
- (GKSectionMetrics)sectionMetrics;
- (NSMutableArray)footerPinnableAttributes;
- (NSMutableArray)headerPinnableAttributes;
- (NSString)layoutKey;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)description;
- (id)localDescription;
- (unint64_t)currentMaxVisibleItemCount;
- (unint64_t)filteredTotalItemCount;
- (void)addAttributes:(id)a3 forLocation:(unint64_t)a4;
- (void)setCurrentMaxVisibleItemCount:(unint64_t)a3;
- (void)setFilteredTotalItemCount:(unint64_t)a3;
- (void)setFooterPinnableAttributes:(id)a3;
- (void)setHeaderPinnableAttributes:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation GKMetricData

- (GKMetricData)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKMetricData;
  v2 = [(GKMetricData *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentMaxVisibleItemCount = -1;
    v4 = [MEMORY[0x1E4F1CA48] array];
    [(GKMetricData *)v3 setHeaderPinnableAttributes:v4];

    v5 = [MEMORY[0x1E4F1CA48] array];
    [(GKMetricData *)v3 setFooterPinnableAttributes:v5];
  }
  return v3;
}

- (id)localDescription
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)GKMetricData;
  uint64_t v4 = [(GKMetricData *)&v14 description];
  v5 = (void *)v4;
  if (self->_metrics)
  {
    v6 = NSString;
    objc_super v7 = [(GKMetricData *)self layoutKey];
    v8 = [v6 stringWithFormat:@" layoutKey:'%@'", v7];
    metrics = self->_metrics;
    unint64_t currentMaxVisibleItemCount = self->_currentMaxVisibleItemCount;
    if (metrics)
    {
      v11 = [(GKGridLayoutMetrics *)metrics localDescription];
      v12 = [v3 stringWithFormat:@"%@%@: maxVis:%ld %@", v5, v8, currentMaxVisibleItemCount, v11];
    }
    else
    {
      v12 = [v3 stringWithFormat:@"%@%@: maxVis:%ld %@", v5, v8, self->_currentMaxVisibleItemCount, &stru_1F07B2408];
    }
  }
  else
  {
    v12 = [v3 stringWithFormat:@"%@%@: maxVis:%ld %@", v4, &stru_1F07B2408, self->_currentMaxVisibleItemCount, &stru_1F07B2408];
  }

  return v12;
}

- (id)description
{
  return [(GKMetricData *)self _gkDescriptionWithChildren:0];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  v5 = _gkTabStringForTabLevel();
  v6 = [MEMORY[0x1E4F28E78] string];
  v18.receiver = self;
  v18.super_class = (Class)GKMetricData;
  uint64_t v7 = [(GKMetricData *)&v18 description];
  v8 = (void *)v7;
  if (self->_metrics)
  {
    v9 = NSString;
    v10 = [(GKMetricData *)self layoutKey];
    v11 = [v9 stringWithFormat:@" layoutKey:'%@'", v10];
    [v6 appendFormat:@"%@%@: maxVis:%ld {", v8, v11, self->_currentMaxVisibleItemCount];
  }
  else
  {
    [v6 appendFormat:@"%@%@: maxVis:%ld {", v7, &stru_1F07B2408, self->_currentMaxVisibleItemCount];
  }

  metrics = self->_metrics;
  if (metrics)
  {
    v13 = [(GKGridLayoutMetrics *)metrics _gkDescriptionWithChildren:a3 + 1];
    objc_super v14 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v15 = [v13 stringByTrimmingCharactersInSet:v14];

    [v6 appendFormat:@"\n%@    sectionMetrics: %@", v5, v15];
  }
  v16 = [NSString stringWithFormat:@"%@}\n", v5];
  [v6 appendString:v16];

  return v6;
}

- (void)setMetrics:(id)a3
{
  v5 = (GKGridLayoutMetrics *)a3;
  if (self->_metrics != v5)
  {
    uint64_t v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self->_currentMaxVisibleItemCount != -1)
      {
LABEL_7:
        objc_storeStrong((id *)&self->_metrics, a3);
        v5 = v7;
        goto LABEL_8;
      }
      unint64_t v6 = [(GKGridLayoutMetrics *)v7 maximumVisibleItemCount];
    }
    else
    {
      unint64_t v6 = -1;
    }
    self->_unint64_t currentMaxVisibleItemCount = v6;
    goto LABEL_7;
  }
LABEL_8:
}

- (GKSectionMetrics)sectionMetrics
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = NSString;
    uint64_t v4 = [NSString stringWithFormat:@"Assertion failed"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutPrivate.m"];
    id v6 = [v5 lastPathComponent];
    uint64_t v7 = [v3 stringWithFormat:@"%@ ([_metrics isKindOfClass:[GKSectionMetrics class]])\n[%s (%s:%d)]", v4, "-[GKMetricData sectionMetrics]", objc_msgSend(v6, "UTF8String"), 81];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v7 format];
  }
  metrics = self->_metrics;

  return (GKSectionMetrics *)metrics;
}

- (NSString)layoutKey
{
  metrics = self->_metrics;
  if (metrics)
  {
    v3 = [(GKGridLayoutMetrics *)metrics layoutKey];
  }
  else
  {
    v3 = &stru_1F07B2408;
  }

  return (NSString *)v3;
}

- (void)addAttributes:(id)a3 forLocation:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    uint64_t v8 = 40;
  }
  else
  {
    uint64_t v8 = 32;
  }
  id v9 = v6;
  id v6 = (id)[*(id *)((char *)&self->super.isa + v8) addObjectsFromArray:v6];
  id v7 = v9;
LABEL_6:

  MEMORY[0x1F41817F8](v6, v7);
}

- (GKGridLayoutMetrics)metrics
{
  return self->_metrics;
}

- (unint64_t)currentMaxVisibleItemCount
{
  return self->_currentMaxVisibleItemCount;
}

- (void)setCurrentMaxVisibleItemCount:(unint64_t)a3
{
  self->_unint64_t currentMaxVisibleItemCount = a3;
}

- (unint64_t)filteredTotalItemCount
{
  return self->_filteredTotalItemCount;
}

- (void)setFilteredTotalItemCount:(unint64_t)a3
{
  self->_filteredTotalItemCount = a3;
}

- (NSMutableArray)headerPinnableAttributes
{
  return self->_headerPinnableAttributes;
}

- (void)setHeaderPinnableAttributes:(id)a3
{
}

- (NSMutableArray)footerPinnableAttributes
{
  return self->_footerPinnableAttributes;
}

- (void)setFooterPinnableAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerPinnableAttributes, 0);
  objc_storeStrong((id *)&self->_headerPinnableAttributes, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end