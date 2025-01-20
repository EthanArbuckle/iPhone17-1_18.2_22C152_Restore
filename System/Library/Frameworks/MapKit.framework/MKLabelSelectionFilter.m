@interface MKLabelSelectionFilter
- (BOOL)canSelectLabelMarker:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabelSelectionFilter:(id)a3;
- (BOOL)isFeatureAnnotationSelectable:(id)a3;
- (BOOL)isLabelSelectable:(id)a3;
- (BOOL)selectionEnabled;
- (MKLabelSelectionFilter)initWithMapFeatureOptions:(int64_t)a3;
- (MKLabelSelectionFilter)initWithSelectionHandler:(id)a3;
- (MKMapView)mapView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)selectionHandler;
- (int64_t)mapFeatureOptions;
- (void)performQueries:(id)a3 completionHandler:(id)a4 completionQueue:(id)a5;
- (void)setMapView:(id)a3;
@end

@implementation MKLabelSelectionFilter

- (MKLabelSelectionFilter)initWithMapFeatureOptions:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKLabelSelectionFilter;
  result = [(MKLabelSelectionFilter *)&v5 init];
  if (result) {
    result->_featureOptions = a3;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);

  objc_storeStrong(&self->_selectionHandler, 0);
}

- (MKLabelSelectionFilter)initWithSelectionHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKLabelSelectionFilter;
  objc_super v5 = [(MKLabelSelectionFilter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_featureOptions = 7;
    uint64_t v7 = MEMORY[0x18C139AE0](v4);
    id selectionHandler = v6->_selectionHandler;
    v6->_id selectionHandler = (id)v7;
  }
  return v6;
}

- (BOOL)canSelectLabelMarker:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F29060] mainThread];

  if (v5)
  {
    v6 = [(MKLabelSelectionFilter *)self mapView];
    uint64_t v7 = [v6 preferredConfiguration];

    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0 && [v7 elevationStyle] == 0;
    objc_super v10 = [[MKMapFeatureAnnotation alloc] initWithVKLabelMarker:v4 isHybridMap:v8];
    char v9 = (*((uint64_t (**)(void))self->_selectionHandler + 2))();
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__MKLabelSelectionFilter_canSelectLabelMarker___block_invoke;
    v12[3] = &unk_1E54BD028;
    v14 = &v16;
    objc_copyWeak(&v15, &location);
    id v13 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], v12);
    char v9 = *((unsigned char *)v17 + 24) != 0;

    objc_destroyWeak(&v15);
    _Block_object_dispose(&v16, 8);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __47__MKLabelSelectionFilter_canSelectLabelMarker___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained canSelectLabelMarker:*(void *)(a1 + 32)];
}

- (BOOL)selectionEnabled
{
  return self->_selectionHandler || self->_featureOptions != 0;
}

- (BOOL)isFeatureAnnotationSelectable:(id)a3
{
  id selectionHandler = self->_selectionHandler;
  if (selectionHandler)
  {
    objc_super v5 = (uint64_t (*)(void))*((void *)selectionHandler + 2);
    return v5();
  }
  else
  {
    uint64_t v7 = [a3 featureType];
    switch(v7)
    {
      case 2:
        int v8 = (LOBYTE(self->_featureOptions) >> 2) & 1;
        break;
      case 1:
        int v8 = (LOBYTE(self->_featureOptions) >> 1) & 1;
        break;
      case 0:
        LOBYTE(v8) = self->_featureOptions & 1;
        break;
    }
    return v8 & 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(MKLabelSelectionFilter *)self isEqualToLabelSelectionFilter:v4];

  return v5;
}

- (BOOL)isEqualToLabelSelectionFilter:(id)a3
{
  return self->_selectionHandler == (id)*((void *)a3 + 1) && self->_featureOptions == *((void *)a3 + 2);
}

- (BOOL)isLabelSelectable:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 featureAnnotation];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [v4 featureAnnotation];
    int v8 = [v7 annotationView];
    char v9 = [v8 isEnabled];
  }
  else if (self->_selectionHandler)
  {
    char v9 = [(MKLabelSelectionFilter *)self canSelectLabelMarker:v4];
  }
  else
  {
    unsigned int v10 = [v4 externalFeatureCategory];
    if (v10 == 1)
    {
      if ((self->_featureOptions & 1) == 0)
      {
        char v9 = 0;
        goto LABEL_14;
      }
      BOOL v13 = [v4 pickedLabelBalloonBehavior] == 1;
    }
    else
    {
      uint64_t v11 = v10;
      uint64_t v12 = 4;
      if (v10 != 3) {
        uint64_t v12 = 0;
      }
      if (v10 != 2) {
        uint64_t v11 = v12;
      }
      BOOL v13 = (self->_featureOptions & v11) == 0;
    }
    char v9 = !v13;
  }
LABEL_14:

  return v9;
}

- (void)performQueries:(id)a3 completionHandler:(id)a4 completionQueue:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = [v15 labelMarker];
        objc_msgSend(v15, "setResult:", -[MKLabelSelectionFilter isLabelSelectable:](self, "isLabelSelectable:", v16));
      }
      uint64_t v12 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__MKLabelSelectionFilter_performQueries_completionHandler_completionQueue___block_invoke;
  v19[3] = &unk_1E54B8360;
  id v20 = v8;
  id v21 = v9;
  id v17 = v8;
  id v18 = v9;
  dispatch_async(v10, v19);
}

uint64_t __75__MKLabelSelectionFilter_performQueries_completionHandler_completionQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MKLabelSelectionFilter);
  uint64_t v5 = MEMORY[0x18C139AE0](self->_selectionHandler);
  id selectionHandler = v4->_selectionHandler;
  v4->_id selectionHandler = (id)v5;

  v4->_featureOptions = self->_featureOptions;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_storeWeak((id *)&v4->_mapView, WeakRetained);

  return v4;
}

- (int64_t)mapFeatureOptions
{
  return self->_featureOptions;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

@end