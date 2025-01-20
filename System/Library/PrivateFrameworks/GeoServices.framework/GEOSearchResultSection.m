@interface GEOSearchResultSection
- (GEOSearchResultSection)init;
- (GEOSearchResultSection)initWithSearchResultSection:(id)a3;
- (GEOStyleAttributes)styleAttributes;
- (NSString)headerDisplayName;
- (NSString)subHeaderDisplayName;
- (int64_t)cellType;
- (void)setCellType:(int64_t)a3;
- (void)setHeaderDisplayName:(id)a3;
- (void)setSubHeaderDisplayName:(id)a3;
@end

@implementation GEOSearchResultSection

- (GEOSearchResultSection)init
{
  result = (GEOSearchResultSection *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSearchResultSection)initWithSearchResultSection:(id)a3
{
  v4 = (id *)a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOSearchResultSection;
  v5 = [(GEOSearchResultSection *)&v15 init];
  if (v5)
  {
    int v6 = -[GEOPDSSearchResultSection searchResultSectionCellType]((uint64_t)v4);
    if (v6)
    {
      if (v6 != 1)
      {
LABEL_7:
        uint64_t v8 = -[GEOPDSSearchResultSection sectionHeaderDisplayName](v4);
        headerDisplayName = v5->_headerDisplayName;
        v5->_headerDisplayName = (NSString *)v8;

        uint64_t v10 = -[GEOPDSSearchResultSection sectionSubHeaderDisplayName](v4);
        subHeaderDisplayName = v5->_subHeaderDisplayName;
        v5->_subHeaderDisplayName = (NSString *)v10;

        uint64_t v12 = -[GEOPDSSearchResultSection styleAttributes](v4);
        styleAttributes = v5->_styleAttributes;
        v5->_styleAttributes = (GEOStyleAttributes *)v12;

        goto LABEL_8;
      }
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
    v5->_cellType = v7;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (int64_t)cellType
{
  return self->_cellType;
}

- (void)setCellType:(int64_t)a3
{
  self->_cellType = a3;
}

- (NSString)headerDisplayName
{
  return self->_headerDisplayName;
}

- (void)setHeaderDisplayName:(id)a3
{
}

- (NSString)subHeaderDisplayName
{
  return self->_subHeaderDisplayName;
}

- (void)setSubHeaderDisplayName:(id)a3
{
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_subHeaderDisplayName, 0);

  objc_storeStrong((id *)&self->_headerDisplayName, 0);
}

@end