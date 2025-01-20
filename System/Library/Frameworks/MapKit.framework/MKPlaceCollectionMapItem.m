@interface MKPlaceCollectionMapItem
- (GEOPlaceCollectionItem)placeCollectionItem;
- (GEOQuickLink)appClip;
- (MKMapItem)mapItem;
- (MKPlaceCollectionMapItem)initWithMapItem:(id)a3 placeCollectionItem:(id)a4;
- (id)description;
@end

@implementation MKPlaceCollectionMapItem

- (MKPlaceCollectionMapItem)initWithMapItem:(id)a3 placeCollectionItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPlaceCollectionMapItem;
  v9 = [(MKPlaceCollectionMapItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mapItem, a3);
    objc_storeStrong((id *)&v10->_placeCollectionItem, a4);
  }

  return v10;
}

- (GEOQuickLink)appClip
{
  placeCollectionItem = self->_placeCollectionItem;
  if (placeCollectionItem)
  {
    v4 = [(GEOPlaceCollectionItem *)placeCollectionItem appClip];
    if ([v4 type] == 2)
    {
      id v5 = v4;
      id v6 = v5;
    }
    else if ([(GEOPlaceCollectionItem *)self->_placeCollectionItem disableAppClipFallback])
    {
      id v6 = 0;
      id v5 = v4;
    }
    else
    {
      id v7 = [(MKMapItem *)self->_mapItem _quickLinks];
      id v5 = [v7 firstObject];

      if ([v5 type] == 2) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return (GEOQuickLink *)v6;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MKPlaceCollectionMapItem *)self mapItem];
  id v5 = [v4 description];
  id v6 = [(MKPlaceCollectionMapItem *)self placeCollectionItem];
  id v7 = [v6 description];
  id v8 = [v3 stringWithFormat:@"%@ %@", v5, v7];

  return v8;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (GEOPlaceCollectionItem)placeCollectionItem
{
  return self->_placeCollectionItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollectionItem, 0);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end