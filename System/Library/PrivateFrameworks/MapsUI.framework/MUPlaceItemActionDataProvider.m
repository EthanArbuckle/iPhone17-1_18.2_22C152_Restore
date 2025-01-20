@interface MUPlaceItemActionDataProvider
- (BOOL)isInSupportedCustomRouteRegion;
- (BOOL)supportsAddingPhotos;
- (BOOL)supportsMessagesForBusiness;
- (void)_placeItemDidUpdate;
@end

@implementation MUPlaceItemActionDataProvider

- (void)_placeItemDidUpdate
{
  v3 = [MUPlaceDataAvailability alloc];
  v4 = [(MKPlaceItemActionDataProvider *)self placeItem];
  v5 = [v4 mapItem];
  v6 = [(MUPlaceDataAvailability *)v3 initWithMapItem:v5 options:[(MKPlaceItemActionDataProvider *)self options]];
  availability = self->_availability;
  self->_availability = v6;

  if ([(MUPlaceDataAvailability *)self->_availability isRouteCreationAvailable])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F64660]);
    v9 = [(MKPlaceItemActionDataProvider *)self mapItem];
    [v9 _coordinate];
    double v11 = v10;
    v12 = [(MKPlaceItemActionDataProvider *)self mapItem];
    [v12 _coordinate];
    v13 = objc_msgSend(v8, "initWithLatitude:longitude:", v11);

    objc_initWeak(&location, self);
    v14 = (void *)MEMORY[0x1E4F64540];
    uint64_t v15 = MEMORY[0x1E4F14428];
    id v16 = MEMORY[0x1E4F14428];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__MUPlaceItemActionDataProvider__placeItemDidUpdate__block_invoke;
    v17[3] = &unk_1E5750F20;
    objc_copyWeak(&v18, &location);
    [v14 customRouteCreationSupportedForLocation:v13 queue:v15 handler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_isDroppedPinOrAddressInSupportedCustomRouteRegion = 0;
  }
}

uint64_t __52__MUPlaceItemActionDataProvider__placeItemDidUpdate__block_invoke(uint64_t a1, int a2)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v6 = WeakRetained;
      WeakRetained = (id *)[WeakRetained[3] isRouteCreationAvailable];
      v4 = v6;
    }
    else
    {
      WeakRetained = 0;
    }
    *((unsigned char *)v4 + 32) = (_BYTE)WeakRetained;
  }
  return MEMORY[0x1F41817F8](WeakRetained, v4);
}

- (BOOL)supportsAddingPhotos
{
  return [(MUPlaceDataAvailability *)self->_availability supportsAddingPhotos];
}

- (BOOL)supportsMessagesForBusiness
{
  return [(MUPlaceDataAvailability *)self->_availability supportsMessagesForBusiness];
}

- (BOOL)isInSupportedCustomRouteRegion
{
  return self->_isDroppedPinOrAddressInSupportedCustomRouteRegion;
}

- (void).cxx_destruct
{
}

@end