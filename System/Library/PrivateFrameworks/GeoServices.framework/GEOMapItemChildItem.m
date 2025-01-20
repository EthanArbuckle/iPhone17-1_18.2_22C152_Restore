@interface GEOMapItemChildItem
- (GEOMapItemChildAction)childItemAction;
- (GEOMapItemChildItem)initWithChildItem:(id)a3;
- (GEOMapItemChildItem)initWithChildPlace:(id)a3;
- (GEOMapItemChildItem)initWithPublisherResult:(id)a3;
- (GEOMapItemChildPlace)childItemPlace;
- (GEOPublisherResult)publisherResult;
- (int64_t)childItemType;
- (void)setChildItemAction:(id)a3;
- (void)setChildItemPlace:(id)a3;
- (void)setChildItemType:(int64_t)a3;
@end

@implementation GEOMapItemChildItem

- (GEOMapItemChildItem)initWithChildItem:(id)a3
{
  v4 = (id *)a3;
  v20.receiver = self;
  v20.super_class = (Class)GEOMapItemChildItem;
  v5 = [(GEOMapItemChildItem *)&v20 init];
  if (!v5) {
    goto LABEL_10;
  }
  int v6 = -[GEOPDChildItem childItemType]((uint64_t)v4);
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  v5->_childItemType = v7;
  v8 = -[GEOPDChildItem childPlace](v4);

  if (v8)
  {
    v9 = [GEOMapItemChildPlace alloc];
    v10 = -[GEOPDChildItem childPlace](v4);
    uint64_t v11 = [(GEOMapItemChildPlace *)v9 initWithChildPlace:v10];
    childItemPlace = v5->_childItemPlace;
    v5->_childItemPlace = (GEOMapItemChildPlace *)v11;
  }
  v13 = -[GEOPDChildItem childAction](v4);

  if (v13)
  {
    v14 = [GEOMapItemChildAction alloc];
    v15 = -[GEOPDChildItem childAction](v4);
    uint64_t v16 = [(GEOMapItemChildAction *)v14 initWithChildAction:v15];
    childItemAction = v5->_childItemAction;
    v5->_childItemAction = (GEOMapItemChildAction *)v16;
  }
  if (v5->_childItemPlace || v5->_childItemAction) {
LABEL_10:
  }
    v18 = v5;
  else {
    v18 = 0;
  }

  return v18;
}

- (GEOMapItemChildItem)initWithChildPlace:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapItemChildItem;
  v5 = [(GEOMapItemChildItem *)&v10 init];
  int v6 = v5;
  if (v5)
  {
    v5->_childItemType = 1;
    uint64_t v7 = [[GEOMapItemChildPlace alloc] initWithChildPlace:v4];
    childItemPlace = v6->_childItemPlace;
    v6->_childItemPlace = v7;
  }
  return v6;
}

- (GEOMapItemChildItem)initWithPublisherResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMapItemChildItem;
  int v6 = [(GEOMapItemChildItem *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_childItemType = 3;
    objc_storeStrong((id *)&v6->_publisherResult, a3);
  }

  return v7;
}

- (int64_t)childItemType
{
  return self->_childItemType;
}

- (void)setChildItemType:(int64_t)a3
{
  self->_childItemType = a3;
}

- (GEOMapItemChildPlace)childItemPlace
{
  return self->_childItemPlace;
}

- (void)setChildItemPlace:(id)a3
{
}

- (GEOMapItemChildAction)childItemAction
{
  return self->_childItemAction;
}

- (void)setChildItemAction:(id)a3
{
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_childItemAction, 0);

  objc_storeStrong((id *)&self->_childItemPlace, 0);
}

@end