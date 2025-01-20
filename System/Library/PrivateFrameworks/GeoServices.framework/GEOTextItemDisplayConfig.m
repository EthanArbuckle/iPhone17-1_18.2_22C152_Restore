@interface GEOTextItemDisplayConfig
- (GEOTextItemDisplayConfig)init;
- (GEOTextItemDisplayConfig)initWithMaxItemsPerRow:(unsigned int)a3 maxRowCount:(unsigned int)a4;
- (GEOTextItemDisplayConfig)initWithTextItemDisplayConfig:(id)a3;
- (unsigned)maxItemsPerRow;
- (unsigned)maxRowCount;
@end

@implementation GEOTextItemDisplayConfig

- (GEOTextItemDisplayConfig)init
{
  result = (GEOTextItemDisplayConfig *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOTextItemDisplayConfig)initWithMaxItemsPerRow:(unsigned int)a3 maxRowCount:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTextItemDisplayConfig;
  result = [(GEOTextItemDisplayConfig *)&v7 init];
  if (result)
  {
    result->_maxItemsPerRow = a3;
    result->_maxRowCount = a4;
  }
  return result;
}

- (GEOTextItemDisplayConfig)initWithTextItemDisplayConfig:(id)a3
{
  v4 = a3;
  if (v4)
  {
    if (v4[24])
    {
      uint64_t v5 = *((unsigned int *)v4 + 4);
      if ((v4[24] & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = 4;
      if ((v4[24] & 2) != 0)
      {
LABEL_4:
        uint64_t v6 = *((unsigned int *)v4 + 5);
        goto LABEL_7;
      }
    }
    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
  }
LABEL_7:

  return [(GEOTextItemDisplayConfig *)self initWithMaxItemsPerRow:v5 maxRowCount:v6];
}

- (unsigned)maxItemsPerRow
{
  return self->_maxItemsPerRow;
}

- (unsigned)maxRowCount
{
  return self->_maxRowCount;
}

@end