@interface MURouteLinkPresentationActivityProvider
- (MURouteLinkPresentationActivityProvider)initWithSource:(id)a3 destination:(id)a4 composedRoute:(id)a5;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)mapMetadataSpecialization;
@end

@implementation MURouteLinkPresentationActivityProvider

- (MURouteLinkPresentationActivityProvider)initWithSource:(id)a3 destination:(id)a4 composedRoute:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MURouteLinkPresentationActivityProvider;
  v10 = [(MURouteActivityProvider *)&v13 initWithSource:a3 destination:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_composedRoute, a5);
  }

  return v11;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    v5 = [(MURouteActivityProvider *)self activityURL];
    metadataWithURL(v5);
    v6 = (LPLinkMetadata *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    v8 = [(MURouteLinkPresentationActivityProvider *)self mapMetadataSpecialization];
    [(LPLinkMetadata *)self->_cachedMetadata setSpecialization:v8];

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (id)mapMetadataSpecialization
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F30AA0]);
  v4 = [(MURouteActivityProvider *)self activitySourceTitle];
  [v3 setName:v4];

  v5 = [(MURouteActivityProvider *)self sourceMapItem];
  v6 = [v5 _shortAddress];
  [v3 setDirectionsSourceAddress:v6];

  v7 = [(MURouteActivityProvider *)self sourceMapItem];
  v8 = [v7 name];
  [v3 setDirectionsSourceLocationName:v8];

  id v9 = [(MURouteActivityProvider *)self sourceMapItem];
  v10 = [v9 _cnPostalAddress];
  [v3 setDirectionsSourceAddressComponents:v10];

  v11 = [(MURouteActivityProvider *)self destinationMapItem];
  v12 = [v11 _shortAddress];
  [v3 setDirectionsDestinationAddress:v12];

  objc_super v13 = [(MURouteActivityProvider *)self destinationMapItem];
  v14 = [v13 _cnPostalAddress];
  [v3 setDirectionsDestinationAddressComponents:v14];

  v15 = [(MURouteActivityProvider *)self destinationMapItem];
  v16 = [v15 name];
  [v3 setDirectionsDestinationLocationName:v16];

  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[GEOComposedRoute transportType](self->_composedRoute, "transportType"));
  [v3 setTransportType:v17];

  uint64_t v18 = [(MURouteActivityProvider *)self sourceMapItem];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(MURouteActivityProvider *)self sourceMapItem];
    [v20 _coordinate];
    if (CLLocationCoordinate2DIsValid(v34))
    {
      uint64_t v21 = [(MURouteActivityProvider *)self destinationMapItem];
      if (v21)
      {
        v22 = (void *)v21;
        v23 = [(MURouteActivityProvider *)self destinationMapItem];
        [v23 _coordinate];
        BOOL v24 = CLLocationCoordinate2DIsValid(v35);

        if (!v24) {
          goto LABEL_7;
        }
        v19 = [(MURouteActivityProvider *)self sourceMapItem];
        [v19 _coordinate];
        double v26 = v25;
        double v28 = v27;
        v20 = [(MURouteActivityProvider *)self destinationMapItem];
        [v20 _coordinate];
        v31 = distanceBetweenCoordinates(v26, v28, v29, v30);
        [v3 setDistance:v31];
      }
    }
  }
LABEL_7:
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
  objc_storeStrong((id *)&self->_composedRoute, 0);
}

@end