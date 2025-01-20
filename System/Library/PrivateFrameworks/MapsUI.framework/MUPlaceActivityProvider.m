@interface MUPlaceActivityProvider
- (MKMapItem)mapItem;
- (MUPlaceActivityProvider)initWithMapItem:(id)a3;
- (MUPlaceActivityProviderDelegate)delegate;
- (id)activityAnnotationView;
- (id)activityImage;
- (id)activitySubTitle;
- (id)activityTitle;
- (id)activityURL;
- (id)mapMetadataSpecialization;
- (void)setDelegate:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation MUPlaceActivityProvider

- (MUPlaceActivityProvider)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceActivityProvider;
  v6 = [(MUPlaceActivityProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (id)activityTitle
{
  v3 = [(MUPlaceActivityProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceActivityProvider *)self delegate];
    [v5 titleForMapActivity:self];
  }
  else
  {
    id v5 = [(MUPlaceActivityProvider *)self mapItem];
    [v5 name];
  v6 = };

  return v6;
}

- (id)activitySubTitle
{
  v3 = [(MUPlaceActivityProvider *)self mapItem];
  char v4 = [v3 _firstLocalizedCategoryName];

  id v5 = [(MUPlaceActivityProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MUPlaceActivityProvider *)self delegate];
    v8 = [v7 subtitleForMapActivity:self];

    if (v8)
    {
      id v9 = v8;

      char v4 = v9;
    }
  }
  return v4;
}

- (id)activityImage
{
  v3 = [(MUPlaceActivityProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceActivityProvider *)self delegate];
    [v5 imageForMapActivity:self];
  }
  else
  {
    id v5 = [(MUPlaceActivityProvider *)self mapItem];
    categoryIconFromMapItem(v5);
  char v6 = };

  return v6;
}

- (id)activityURL
{
  v3 = [(MUPlaceActivityProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceActivityProvider *)self delegate];
    [v5 urlForMapActivity:self];
  }
  else
  {
    id v5 = [(MUPlaceActivityProvider *)self mapItem];
    [v5 _activityURL];
  char v6 = };

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v8 = [(MUPlaceActivityProvider *)self mapItem];
    id v7 = [v8 sharingURL];
  }
  return v7;
}

- (id)activityAnnotationView
{
  v3 = [(MUPlaceActivityProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceActivityProvider *)self delegate];
    char v6 = [v5 annotationViewForMapActivity:self];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F30F58]);
    id v5 = [(MUPlaceActivityProvider *)self mapItem];
    v8 = [v5 placemark];
    char v6 = (void *)[v7 initWithAnnotation:v8 reuseIdentifier:0];
  }
  return v6;
}

- (id)mapMetadataSpecialization
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F30AA0]);
  char v4 = [(MUPlaceActivityProvider *)self activityTitle];
  [v3 setName:v4];

  id v5 = [(MUPlaceActivityProvider *)self mapItem];
  char v6 = [v5 _shortAddress];
  [v3 setAddress:v6];

  id v7 = [(MUPlaceActivityProvider *)self mapItem];
  v8 = [v7 _cnPostalAddress];
  [v3 setAddressComponents:v8];

  id v9 = [(MUPlaceActivityProvider *)self mapItem];
  [v9 _coordinate];
  objc_msgSend(v3, "setLocation:");

  v10 = [(MUPlaceActivityProvider *)self mapItem];
  v11 = categoryIconFromMapItem(v10);
  [v3 setCategoryIcon:v11];

  v12 = [(MUPlaceActivityProvider *)self mapItem];
  v13 = [v12 _firstLocalizedCategoryName];

  if (v13)
  {
    v14 = [(MUPlaceActivityProvider *)self mapItem];
    v15 = [v14 _firstLocalizedCategoryName];
    [v3 setCategory:v15];
  }
  v16 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
  v17 = [v16 currentLocation];

  v18 = [v17 latLng];
  [v18 lat];
  CLLocationDegrees v20 = v19;
  v21 = [v17 latLng];
  [v21 lng];
  CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(v20, v22);

  v24 = [(MUPlaceActivityProvider *)self mapItem];
  [v24 _coordinate];
  v27 = distanceBetweenCoordinates(v23.latitude, v23.longitude, v25, v26);
  [v3 setDistance:v27];

  return v3;
}

- (MUPlaceActivityProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceActivityProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end