@interface CPPointOfInterestTemplate
+ (BOOL)supportsSecureCoding;
- (CPPointOfInterestTemplate)initWithCoder:(id)a3;
- (CPPointOfInterestTemplate)initWithTitle:(NSString *)title pointsOfInterest:(NSArray *)pointsOfInterest selectedIndex:(NSUInteger)selectedIndex;
- (CPPointsOfInterestEntity)poiEntity;
- (NSArray)pointsOfInterest;
- (NSString)title;
- (NSUInteger)selectedIndex;
- (id)_pointOfInterestWithIdentifier:(id)a3;
- (id)pointOfInterestDelegate;
- (void)encodeWithCoder:(id)a3;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)handleDidSelectPointOfInterestWithIdentifier:(id)a3;
- (void)handleMapRegionDidChange:(id *)a3;
- (void)performUpdate;
- (void)setPoiEntity:(id)a3;
- (void)setPointOfInterestDelegate:(id)pointOfInterestDelegate;
- (void)setPointsOfInterest:(NSArray *)pointsOfInterest selectedIndex:(NSUInteger)selectedIndex;
- (void)setPointsOfInterest:(id)a3;
- (void)setSelectedIndex:(NSUInteger)selectedIndex;
- (void)setTitle:(NSString *)title;
@end

@implementation CPPointOfInterestTemplate

- (CPPointOfInterestTemplate)initWithTitle:(NSString *)title pointsOfInterest:(NSArray *)pointsOfInterest selectedIndex:(NSUInteger)selectedIndex
{
  v8 = title;
  v9 = pointsOfInterest;
  v18.receiver = self;
  v18.super_class = (Class)CPPointOfInterestTemplate;
  v10 = [(CPTemplate *)&v18 init];
  if (v10)
  {
    v11 = [CPPointsOfInterestEntity alloc];
    v12 = v9;
    if ([(NSArray *)v12 count] > 0xC)
    {
      -[NSArray subarrayWithRange:](v12, "subarrayWithRange:", 0, 12);
      v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v14 = v13;

    uint64_t v15 = [(CPPointsOfInterestEntity *)v11 initWithTitle:v8 pointsOfInterest:v14];
    poiEntity = v10->_poiEntity;
    v10->_poiEntity = (CPPointsOfInterestEntity *)v15;

    v10->_selectedIndex = selectedIndex;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPointOfInterestTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPPointOfInterestTemplate;
  v5 = [(CPTemplate *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CPEntity"];
    poiEntity = v5->_poiEntity;
    v5->_poiEntity = (CPPointsOfInterestEntity *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PointOfInterestTemplateSelectedIndex"];
    v5->_selectedIndex = [v8 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPPointOfInterestTemplate;
  id v4 = a3;
  [(CPTemplate *)&v7 encodeWithCoder:v4];
  v5 = [(CPPointOfInterestTemplate *)self poiEntity];
  [v4 encodeObject:v5 forKey:@"CPEntity"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPPointOfInterestTemplate selectedIndex](self, "selectedIndex"));
  [v4 encodeObject:v6 forKey:@"PointOfInterestTemplateSelectedIndex"];
}

- (void)setTitle:(NSString *)title
{
  v8 = title;
  id v4 = [(CPPointOfInterestTemplate *)self poiEntity];
  v5 = [v4 title];
  char v6 = [v5 isEqualToString:v8];

  if ((v6 & 1) == 0)
  {
    objc_super v7 = [(CPPointOfInterestTemplate *)self poiEntity];
    [v7 setTitle:v8];

    [(CPTemplate *)self setNeedsUpdate];
  }
}

- (NSString)title
{
  v2 = [(CPPointOfInterestTemplate *)self poiEntity];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setPointsOfInterest:(NSArray *)pointsOfInterest selectedIndex:(NSUInteger)selectedIndex
{
  objc_super v10 = pointsOfInterest;
  if ([(NSArray *)v10 count] > 0xC)
  {
    -[NSArray subarrayWithRange:](v10, "subarrayWithRange:", 0, 12);
    char v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v6 = v10;
  }
  objc_super v7 = v6;

  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL && [(NSArray *)v7 count] <= selectedIndex) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"Selected index %ld is beyond array bounds [0..%ld]", selectedIndex, -[NSArray count](v7, "count"));
  }
  if ([(CPPointOfInterestTemplate *)self selectedIndex] != selectedIndex
    || ([(CPPointOfInterestTemplate *)self pointsOfInterest],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = BSEqualArrays(),
        v8,
        (v9 & 1) == 0))
  {
    [(CPPointOfInterestTemplate *)self setPointsOfInterest:v7];
    [(CPPointOfInterestTemplate *)self setSelectedIndex:selectedIndex];
    [(CPTemplate *)self setNeedsUpdate];
  }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
  if (self->_selectedIndex != selectedIndex)
  {
    self->_selectedIndex = selectedIndex;
    [(CPTemplate *)self setNeedsUpdate];
  }
}

- (void)setPointsOfInterest:(id)a3
{
  id v4 = a3;
  v5 = [(CPPointOfInterestTemplate *)self entity];
  [v5 setPointsOfInterest:v4];

  [(CPTemplate *)self setNeedsUpdate];
}

- (NSArray)pointsOfInterest
{
  v2 = [(CPPointOfInterestTemplate *)self poiEntity];
  v3 = [v2 pointsOfInterest];

  return (NSArray *)v3;
}

- (void)performUpdate
{
  v8.receiver = self;
  v8.super_class = (Class)CPPointOfInterestTemplate;
  [(CPTemplate *)&v8 performUpdate];
  objc_initWeak(&location, self);
  v3 = [(CPTemplate *)self templateProviderFuture];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CPPointOfInterestTemplate_performUpdate__block_invoke;
  v5[3] = &unk_26430AE70;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[v3 addSuccessBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__CPPointOfInterestTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 updateEntityTemplate:WeakRetained withProxyDelegate:WeakRetained];
}

- (void)handleMapRegionDidChange:(id *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  id v12 = [(CPPointOfInterestTemplate *)self pointOfInterestDelegate];
  objc_msgSend(v12, "pointOfInterestTemplate:didChangeMapRegion:", self, v10, v9, v8, v7);
}

- (void)handleDidSelectPointOfInterestWithIdentifier:(id)a3
{
  id v8 = a3;
  double v4 = [(CPPointOfInterestTemplate *)self pointOfInterestDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CPPointOfInterestTemplate *)self _pointOfInterestWithIdentifier:v8];
    if (v6)
    {
      double v7 = [(CPPointOfInterestTemplate *)self pointOfInterestDelegate];
      [v7 pointOfInterestTemplate:self didSelectPointOfInterest:v6];
    }
  }

  MEMORY[0x270F9A790]();
}

- (id)_pointOfInterestWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  objc_super v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  char v5 = [(CPPointOfInterestTemplate *)self pointsOfInterest];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__CPPointOfInterestTemplate__pointOfInterestWithIdentifier___block_invoke;
  v11[3] = &unk_26430AE98;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  [v5 enumerateObjectsUsingBlock:v11];

  double v7 = (void *)v15[5];
  if (!v7)
  {
    id v8 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_2181A5000, v8, OS_LOG_TYPE_INFO, "Failed to identify a local point of interest for %@", buf, 0xCu);
    }

    double v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);

  return v9;
}

void __60__CPPointOfInterestTemplate__pointOfInterestWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  double v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CPPointOfInterestTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_264309F38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __62__CPPointOfInterestTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) entity];
  double v3 = [v2 objectForIdentifier:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = v3;
    id v5 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    [v4 handlePrimaryAction];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)CPPointOfInterestTemplate;
    objc_msgSendSuper2(&v9, sel_handleActionForControlIdentifier_, v8);
  }
}

- (NSUInteger)selectedIndex
{
  return self->_selectedIndex;
}

- (id)pointOfInterestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointOfInterestDelegate);

  return WeakRetained;
}

- (void)setPointOfInterestDelegate:(id)pointOfInterestDelegate
{
}

- (CPPointsOfInterestEntity)poiEntity
{
  return self->_poiEntity;
}

- (void)setPoiEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiEntity, 0);

  objc_destroyWeak((id *)&self->_pointOfInterestDelegate);
}

@end