@interface PDFCRGroupRegionCell
- (PDFCRGroupRegionCell)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 parent:(id)a6 groupID:(unint64_t)a7 rowIndex:(unint64_t)a8;
- (unint64_t)groupID;
- (unint64_t)rowIndex;
- (void)setGroupID:(unint64_t)a3;
- (void)setRowIndex:(unint64_t)a3;
@end

@implementation PDFCRGroupRegionCell

- (void)setRowIndex:(unint64_t)a3
{
  self->_rowIndex = a3;
}

- (unint64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setGroupID:(unint64_t)a3
{
  self->_groupID = a3;
}

- (unint64_t)groupID
{
  return self->_groupID;
}

- (PDFCRGroupRegionCell)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 parent:(id)a6 groupID:(unint64_t)a7 rowIndex:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PDFCRGroupRegionCell;
  v17 = [(PDFCRGroupRegion *)&v20 initWithBoundingQuad:v14 layoutDirection:a4 subregions:v15 parent:v16];
  v18 = v17;
  if (v17)
  {
    [(PDFCRGroupRegion *)v17 setType:6];
    [(PDFCRGroupRegionCell *)v18 setGroupID:a7];
    [(PDFCRGroupRegionCell *)v18 setRowIndex:a8];
  }

  return v18;
}

@end