@interface MURouteActivityProvider
- (MKMapItem)sourceMapItem;
- (MURouteActivityProvider)initWithSource:(id)a3 destination:(id)a4;
- (id)activitySourceTitle;
- (id)activityURL;
- (unint64_t)transportType;
- (void)setSourceMapItem:(id)a3;
- (void)setTransportType:(unint64_t)a3;
@end

@implementation MURouteActivityProvider

- (MURouteActivityProvider)initWithSource:(id)a3 destination:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MURouteActivityProvider;
  v8 = [(MUPlaceActivityProvider *)&v11 initWithMapItem:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceMapItem, a3);
    v9->_transportType = 1;
  }

  return v9;
}

- (id)activityURL
{
  v3 = [(MUPlaceActivityProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0
    || ([(MUPlaceActivityProvider *)self delegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 urlForMapActivity:self],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    id v7 = [MEMORY[0x1E4F31038] sharedInstance];
    int v8 = [v7 userInterfaceIdiom];

    if (v8 == 2)
    {
      v9 = [(MURouteActivityProvider *)self sourceMapItem];
      v10 = [v9 place];
      objc_super v11 = [v10 name];
      v12 = [(MURouteActivityProvider *)self sourceMapItem];
      v13 = [v12 _addressFormattedAsSinglelineAddress];
      __38__MURouteActivityProvider_activityURL__block_invoke(v11, v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      v15 = [(MUPlaceActivityProvider *)self mapItem];
      v16 = [v15 place];
      v17 = [v16 name];
      v18 = [(MUPlaceActivityProvider *)self mapItem];
      v19 = [v18 _addressFormattedAsSinglelineAddress];
      v20 = __38__MURouteActivityProvider_activityURL__block_invoke(v17, v19);

      v6 = objc_msgSend(MEMORY[0x1E4F31110], "URLForDirectionsFrom:to:transport:", v14, v20, -[MURouteActivityProvider transportType](self, "transportType"));
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F31098]);
      v20 = [(MURouteActivityProvider *)self sourceMapItem];
      v21 = [(MUPlaceActivityProvider *)self mapItem];
      v6 = objc_msgSend(v14, "urlForDirectionsFromMapItem:toMapItem:transportType:options:", v20, v21, -[MURouteActivityProvider transportType](self, "transportType"), 0);
    }
  }
  return v6;
}

id __38__MURouteActivityProvider_activityURL__block_invoke(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    id v5 = [NSString stringWithFormat:@"%@, %@", v3, v4];
  }
  else
  {
    if (v4) {
      v6 = v4;
    }
    else {
      v6 = v3;
    }
    id v5 = v6;
  }
  id v7 = v5;

  return v7;
}

- (id)activitySourceTitle
{
  id v3 = [(MUPlaceActivityProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceActivityProvider *)self delegate];
    [v5 sourceTitleForMapActivity:self];
  }
  else
  {
    id v5 = [(MURouteActivityProvider *)self sourceMapItem];
    [v5 name];
  v6 = };

  return v6;
}

- (MKMapItem)sourceMapItem
{
  return self->_sourceMapItem;
}

- (void)setSourceMapItem:(id)a3
{
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (void).cxx_destruct
{
}

@end