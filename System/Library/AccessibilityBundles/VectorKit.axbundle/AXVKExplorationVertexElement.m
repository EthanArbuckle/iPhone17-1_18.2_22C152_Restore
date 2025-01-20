@interface AXVKExplorationVertexElement
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates;
- (AXVKExplorationVertexElement)initWithCoordinates:(id)a3 betweenRoads:(id)a4;
- (BOOL)isComputed;
- (BOOL)isCurrent;
- (BOOL)isDeadEnd;
- (CGPoint)getScreenPoint;
- (NSMutableArray)edges;
- (NSMutableArray)neighbors;
- (NSMutableArray)roads;
- (VKMapView)mapView;
- (id)accessibilityLabel;
- (id)connectingRoadWith:(id)a3;
- (id)description;
- (void)setCoordinates:(id)a3;
- (void)setEdges:(id)a3;
- (void)setIsComputed:(BOOL)a3;
- (void)setIsCurrent:(BOOL)a3;
- (void)setIsDeadEnd:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setNeighbors:(id)a3;
- (void)setRoads:(id)a3;
@end

@implementation AXVKExplorationVertexElement

- (AXVKExplorationVertexElement)initWithCoordinates:(id)a3 betweenRoads:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AXVKExplorationVertexElement;
  v8 = [(AXVKExplorationVertexElement *)&v19 init];
  if (v8 && [v7 count])
  {
    uint64_t v9 = objc_opt_new();
    edges = v8->_edges;
    v8->_edges = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    neighbors = v8->_neighbors;
    v8->_neighbors = (NSMutableArray *)v11;

    uint64_t v13 = [v7 mutableCopy];
    roads = v8->_roads;
    v8->_roads = (NSMutableArray *)v13;

    v8->_coordinates.latitude = var0;
    v8->_coordinates.longitude = var1;
    v15 = [v7 firstObject];
    v16 = [v15 accessibilityContainer];
    objc_storeWeak((id *)&v8->_mapView, v16);

    v8->_isDeadEnd = [v7 count] == 1;
    v17 = v8;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)setIsComputed:(BOOL)a3
{
  if (!a3)
  {
    v5 = [(AXVKExplorationVertexElement *)self neighbors];
    [v5 removeAllObjects];

    v6 = [(AXVKExplorationVertexElement *)self edges];
    [v6 removeAllObjects];
  }
  self->_isComputed = a3;
}

- (void)setRoads:(id)a3
{
  v4 = (NSMutableArray *)a3;
  if (![(NSMutableArray *)v4 count]) {
    _AXAssert();
  }
  roads = self->_roads;
  self->_roads = v4;
}

- (id)connectingRoadWith:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = [(AXVKExplorationVertexElement *)self edges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v10 = objc_msgSend(v9, "vertices", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v10);
              }
              if (*(id *)(*((void *)&v16 + 1) + 8 * j) == v4)
              {
                v14 = [v9 road];

                goto LABEL_19;
              }
            }
            uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      v14 = 0;
    }
    while (v6);
  }
  else
  {
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (CGPoint)getScreenPoint
{
  v3 = [(AXVKExplorationVertexElement *)self mapView];
  [(AXVKExplorationVertexElement *)self coordinates];
  objc_msgSend(v3, "accessibilityConvertCoordinateToWindow:");
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)accessibilityLabel
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v4 = [(AXVKExplorationVertexElement *)self roads];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v9 = [v8 trueLabel];
        BOOL v10 = v9 == 0;

        if (v10) {
          AXVectorKitLocString(@"UNNAMED_ROAD");
        }
        else {
        uint64_t v11 = [v8 trueLabel];
        }
        [v3 addObject:v11];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v12 = AXFormatAndListWithElements();

  return v12;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [NSString stringWithFormat:@"%@:%p: ", objc_opt_class(), self];
  double v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(AXVKExplorationVertexElement *)self roads];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 trueLabel];
        BOOL v12 = v11 == 0;

        if (!v12)
        {
          uint64_t v13 = [v10 trueLabel];
          [v5 addObject:v13];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  long long v14 = [v5 componentsJoinedByString:@" - "];
  [v4 appendString:v14];

  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  double latitude = self->_coordinates.latitude;
  double longitude = self->_coordinates.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (void)setCoordinates:(id)a3
{
  self->_coordinates = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (VKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (VKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (BOOL)isComputed
{
  return self->_isComputed;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (void)setIsCurrent:(BOOL)a3
{
  self->_isCurrent = a3;
}

- (BOOL)isDeadEnd
{
  return self->_isDeadEnd;
}

- (void)setIsDeadEnd:(BOOL)a3
{
  self->_isDeadEnd = a3;
}

- (NSMutableArray)edges
{
  return self->_edges;
}

- (void)setEdges:(id)a3
{
}

- (NSMutableArray)neighbors
{
  return self->_neighbors;
}

- (void)setNeighbors:(id)a3
{
}

- (NSMutableArray)roads
{
  return self->_roads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roads, 0);
  objc_storeStrong((id *)&self->_neighbors, 0);
  objc_storeStrong((id *)&self->_edges, 0);

  objc_destroyWeak((id *)&self->_mapView);
}

@end