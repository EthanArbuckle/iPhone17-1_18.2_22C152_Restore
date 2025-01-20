@interface DRSessionViewModel
- (BOOL)acceptsSynthesizedTouchAtLocation:(CGPoint)a3 displayIdentifier:(id)a4;
- (BOOL)canAddManipulatedTouch;
- (BOOL)canAddTouches;
- (BOOL)canManipulateTransform;
- (BOOL)continuityDisplayWantsDragsHidden;
- (BOOL)hasReceivedInitialPreviewReply;
- (BOOL)isManipulatingTransform;
- (BOOL)resizable;
- (BOOL)rotatable;
- (BOOL)sourceIsHostedOnContinuityDisplay;
- (BOOL)sourceRestrictsDragToLocalDevice;
- (BOOL)sourceRestrictsDragToSelf;
- (BOOL)usesSynthesizedTouch;
- (BOOL)wantsElasticEffects;
- (CAPoint3D)centroid;
- (CAPoint3D)initialCentroidInSourceContext;
- (CGAffineTransform)appliedTransform;
- (CGAffineTransform)elasticTransform;
- (CGSize)maximumResizableSize;
- (CGSize)minimumResizableSize;
- (CGSize)originalScale;
- (DRClientModel)potentialDropDestinationClient;
- (DRClientModel)sourceClient;
- (DRPrecisionMode)precisionMode;
- (DRSessionViewModel)init;
- (DRSessionViewModelDelegate)delegate;
- (NSArray)itemModels;
- (NSArray)touchIDs;
- (NSIndexSet)preferredPreviewIndexes;
- (NSString)displayIdentifierForSynthesizedTouch;
- (UIViewFloatAnimatableProperty)elasticPositionX;
- (UIViewFloatAnimatableProperty)elasticPositionY;
- (UIViewFloatAnimatableProperty)elasticRotation;
- (UIViewFloatAnimatableProperty)elasticScaleX;
- (UIViewFloatAnimatableProperty)elasticScaleY;
- (_DUIPotentialDrop)potentialDrop;
- (double)_manipulatedScale;
- (double)enteredPrecisionModeTime;
- (double)enteredPrecisionModeY;
- (double)originalRotation;
- (id)addClientModelForClient:(id)a3 isSource:(BOOL)a4;
- (id)clientModelForClient:(id)a3;
- (id)modelsSortedByStackOrder;
- (int64_t)orientation;
- (unint64_t)touchesCount;
- (unsigned)sourceContextID;
- (void)_animateSpringWithDampingRatio:(double)a3 response:(double)a4 animations:(id)a5;
- (void)_invalidateElasticEffects;
- (void)_takeDragImageWithComponent:(id)a3 forClient:(id)a4 itemModel:(id)a5;
- (void)_takePreview:(id)a3 forClient:(id)a4 itemModel:(id)a5;
- (void)_updateElasticEffectForLocation:(CAPoint3D)a3;
- (void)_updateElasticProperties;
- (void)_updateElasticTransform;
- (void)addInitialItemsWithCount:(int64_t)a3;
- (void)addItem;
- (void)addTouchID:(id)a3;
- (void)beginDragManipulationWithLocation:(CAPoint3D)a3;
- (void)endDragManipulationWithLocation:(CAPoint3D)a3;
- (void)invalidateImageForClient:(id)a3 itemIndex:(unint64_t)a4;
- (void)removeTouchID:(id)a3;
- (void)setContinuityDisplayWantsDragsHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayIdentifierForSynthesizedTouch:(id)a3;
- (void)setHasReceivedInitialPreviewReply:(BOOL)a3;
- (void)setInitialCentroidInSourceContext:(CAPoint3D)a3;
- (void)setMaximumResizableSize:(CGSize)a3;
- (void)setMinimumResizableSize:(CGSize)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOriginalRotation:(double)a3;
- (void)setOriginalScale:(CGSize)a3;
- (void)setPotentialDrop:(id)a3;
- (void)setPotentialDropDestinationClient:(id)a3;
- (void)setPrecisionMode:(id)a3;
- (void)setPreferredPreviewIndexes:(id)a3;
- (void)setResizable:(BOOL)a3;
- (void)setRotatable:(BOOL)a3;
- (void)setSourceContextID:(unsigned int)a3;
- (void)setSourceIsHostedOnContinuityDisplay:(BOOL)a3;
- (void)setSourceRestrictsDragToLocalDevice:(BOOL)a3;
- (void)setSourceRestrictsDragToSelf:(BOOL)a3;
- (void)setUsesSynthesizedTouch:(BOOL)a3;
- (void)setWantsElasticEffects:(BOOL)a3;
- (void)takePreviewAndImageComponents:(id)a3 forClient:(id)a4;
- (void)updateDragManipulationWithLocation:(CAPoint3D)a3;
- (void)updateLocation:(CAPoint3D)a3 ofTouchID:(id)a4;
- (void)updateLocationWithoutTouches:(CAPoint3D)a3;
@end

@implementation DRSessionViewModel

- (DRSessionViewModel)init
{
  v17.receiver = self;
  v17.super_class = (Class)DRSessionViewModel;
  v2 = [(DRSessionViewModel *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v2 + 29);
    *((void *)v2 + 29) = v7;

    [*((id *)v2 + 29) setPrefersFullSizePreview:1];
    uint64_t v9 = objc_opt_new();
    v10 = (void *)*((void *)v2 + 31);
    *((void *)v2 + 31) = v9;

    uint64_t v11 = +[NSMapTable weakToStrongObjectsMapTable];
    v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    *((void *)v2 + 9) = -1;
    uint64_t v13 = objc_opt_new();
    v14 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v13;

    *(_OWORD *)(v2 + 88) = xmmword_10003F890;
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)(v2 + 136) = *(_OWORD *)&CGAffineTransformIdentity.a;
    *((void *)v2 + 13) = 0x3FF0000000000000;
    *((void *)v2 + 14) = 0;
    *((void *)v2 + 15) = 0;
    *((void *)v2 + 16) = 0;
    v2[81] = 1;
    *(_OWORD *)(v2 + 152) = v15;
    *(_OWORD *)(v2 + 168) = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  return (DRSessionViewModel *)v2;
}

- (id)addClientModelForClient:(id)a3 isSource:(BOOL)a4
{
  BOOL v4 = a4;
  clientModelsByClient = self->_clientModelsByClient;
  id v7 = a3;
  [(NSMapTable *)clientModelsByClient objectForKey:v7];

  v8 = [[DRClientModel alloc] initWithClient:v7 isSource:v4];
  [(NSMapTable *)self->_clientModelsByClient setObject:v8 forKey:v7];

  if (v4) {
    objc_storeStrong((id *)&self->_sourceClient, v8);
  }
  return v8;
}

- (id)clientModelForClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_clientModelsByClient objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [(DRSessionViewModel *)self addClientModelForClient:v4 isSource:0];
  }

  return v5;
}

- (BOOL)acceptsSynthesizedTouchAtLocation:(CGPoint)a3 displayIdentifier:(id)a4
{
  id v5 = a4;
  if ([(DRSessionViewModel *)self usesSynthesizedTouch]
    && ([(DRSessionViewModel *)self displayIdentifierForSynthesizedTouch],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqualToString:v5],
        v6,
        (v7 & 1) == 0))
  {
    UIDistanceBetweenPoints();
    BOOL v8 = v9 <= 1.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)addTouchID:(id)a3
{
  id v7 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_touchModels, "objectForKeyedSubscript:");

  if (!v4)
  {
    [(NSMutableArray *)self->_touchIDs addObject:v7];
    id v5 = objc_opt_new();
    [(NSMutableDictionary *)self->_touchModels setObject:v5 forKeyedSubscript:v7];

    v6 = [(DRSessionViewModel *)self delegate];
    [v6 viewModelInvalidated:self];
  }
}

- (void)removeTouchID:(id)a3
{
  id v12 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_touchModels, "objectForKeyedSubscript:");

  if (v4)
  {
    [(DRSessionViewModel *)self centroid];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    if ([(NSMutableDictionary *)self->_touchModels count] == (id)1)
    {
      self->_centroidWithoutTouches.x = v6;
      self->_centroidWithoutTouches.y = v8;
      self->_centroidWithoutTouches.z = v10;
      self->_lastTouchEnded = 1;
    }
    [(NSMutableArray *)self->_touchIDs removeObject:v12];
    [(NSMutableDictionary *)self->_touchModels setObject:0 forKeyedSubscript:v12];
    [(DRSessionViewModel *)self centroid];
    if ((CAPoint3DEqualToPoint() & 1) == 0)
    {
      uint64_t v11 = [(DRSessionViewModel *)self delegate];
      [v11 viewModelInvalidated:self];
    }
  }
}

- (NSArray)touchIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_touchModels allKeys];
}

- (void)addInitialItemsWithCount:(int64_t)a3
{
  if (a3)
  {
    int64_t v3 = a3;
    do
    {
      double v5 = [[DRItemViewModel alloc] initWithIndex:[(NSMutableArray *)self->_itemModels count]];
      [(DRItemViewModel *)v5 setApplyOriginalRotation:[(DRSessionViewModel *)self rotatable] ^ 1];
      [(NSMutableArray *)self->_itemModels addObject:v5];

      --v3;
    }
    while (v3);
  }
}

- (void)addItem
{
  id v4 = [[DRItemViewModel alloc] initWithIndex:[(NSMutableArray *)self->_itemModels count]];
  [(DRItemViewModel *)v4 setApplyOriginalRotation:[(DRSessionViewModel *)self rotatable] ^ 1];
  [(NSMutableArray *)self->_itemModels addObject:v4];
  [(DRItemViewModel *)v4 setPreferredStackOrder:self->_topStackOrder];
  int64_t topStackOrder = self->_topStackOrder;
  if ((topStackOrder & 0x8000000000000000) == 0) {
    self->_int64_t topStackOrder = topStackOrder + 1;
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    double v5 = [(DRSessionViewModel *)self delegate];
    [v5 viewModelInvalidated:self];

    double v6 = [(DRSessionViewModel *)self precisionMode];
    id v7 = [v6 copy];

    [v7 setOrientation:a3];
    [(DRSessionViewModel *)self setPrecisionMode:v7];
  }
}

- (void)setPotentialDrop:(id)a3
{
  double v5 = (_DUIPotentialDrop *)a3;
  potentialDrop = self->_potentialDrop;
  if (potentialDrop != v5 && ([(_DUIPotentialDrop *)potentialDrop isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_potentialDrop, a3);
    id v7 = [(DRSessionViewModel *)self delegate];
    [v7 viewModelInvalidated:self];
  }
  _objc_release_x1();
}

- (void)setPotentialDropDestinationClient:(id)a3
{
  double v5 = (DRClientModel *)a3;
  p_potentialDropDestinationClient = &self->_potentialDropDestinationClient;
  if (self->_potentialDropDestinationClient != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_potentialDropDestinationClient, a3);
    id v7 = [(DRSessionViewModel *)self delegate];
    [v7 viewModelInvalidated:self];

    double v5 = v8;
  }
  _objc_release_x1(p_potentialDropDestinationClient, v5);
}

- (void)takePreviewAndImageComponents:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 index];
        if (v13 < [(NSMutableArray *)self->_itemModels count])
        {
          v14 = -[NSMutableArray objectAtIndexedSubscript:](self->_itemModels, "objectAtIndexedSubscript:", [v12 index]);
          long long v15 = [v12 imageComponent];
          [(DRSessionViewModel *)self _takeDragImageWithComponent:v15 forClient:v7 itemModel:v14];

          v16 = [v12 preview];
          [(DRSessionViewModel *)self _takePreview:v16 forClient:v7 itemModel:v14];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (void)_takeDragImageWithComponent:(id)a3 forClient:(id)a4 itemModel:(id)a5
{
  id v11 = a3;
  id v8 = [a5 clientItemViewModelForClient:a4];
  [v8 fulfillImageRequest];
  id v9 = [v8 imageComponent];
  if (v9 != v11 && ([v11 isEqual:v9] & 1) == 0)
  {
    [v8 setImageComponent:v11];
    uint64_t v10 = [(DRSessionViewModel *)self delegate];
    [v10 viewModelInvalidated:self];
  }
}

- (void)_takePreview:(id)a3 forClient:(id)a4 itemModel:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = (unint64_t)[v18 preferredStackOrder];
  if ((v10 & 0x8000000000000000) == 0)
  {
    [v9 setPreferredStackOrder:v10];
    id v11 = [v9 preferredStackOrder];
    int64_t topStackOrder = self->_topStackOrder;
    if ((uint64_t)v11 <= topStackOrder + 1) {
      int64_t v13 = topStackOrder + 1;
    }
    else {
      int64_t v13 = (int64_t)v11;
    }
    self->_int64_t topStackOrder = v13;
  }
  v14 = [v9 clientItemViewModelForClient:v8];
  self->_hasReceivedInitialPreviewReply = 1;
  id v15 = [v14 preview];
  v16 = v15;
  if (!v18 || v15 != v18 && ([v15 isEqual:v18] & 1) == 0)
  {
    [v14 setPreview:v18];
    long long v17 = [(DRSessionViewModel *)self delegate];
    [v17 viewModelInvalidated:self];
  }
}

- (void)invalidateImageForClient:(id)a3 itemIndex:(unint64_t)a4
{
  id v9 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_itemModels count] > a4)
  {
    id v6 = [(NSMutableArray *)self->_itemModels objectAtIndexedSubscript:a4];
    id v7 = [v6 clientItemViewModelForClient:v9];
    if ([v7 invalidateImage])
    {
      id v8 = [(DRSessionViewModel *)self delegate];
      [v8 viewModelInvalidated:self];
    }
  }
}

- (void)updateLocation:(CAPoint3D)a3 ofTouchID:(id)a4
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(NSMutableDictionary *)self->_touchModels objectForKeyedSubscript:a4];
  if (v8)
  {
    id v10 = v8;
    if (![v8 hasLocation]
      || ([v10 location], (CAPoint3DEqualToPoint() & 1) == 0))
    {
      objc_msgSend(v10, "setLocation:", x, y, z);
      id v9 = [(DRSessionViewModel *)self delegate];
      [v9 viewModelInvalidated:self];
    }
    -[DRSessionViewModel _updateElasticEffectForLocation:](self, "_updateElasticEffectForLocation:", x, y, z);
    id v8 = v10;
  }
}

- (id)modelsSortedByStackOrder
{
  int64_t v3 = [(DRSessionViewModel *)self itemModels];
  if ((self->_topStackOrder & 0x8000000000000000) == 0)
  {
    id v4 = [(DRSessionViewModel *)self itemModels];
    uint64_t v5 = [v4 sortedArrayUsingComparator:&stru_100054E58];

    int64_t v3 = (void *)v5;
  }
  return v3;
}

- (void)updateLocationWithoutTouches:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  self->_centroidWithoutTouches = a3;
  id v7 = [(DRSessionViewModel *)self delegate];
  [v7 viewModelInvalidated:self];

  -[DRSessionViewModel _updateElasticEffectForLocation:](self, "_updateElasticEffectForLocation:", x, y, z);
}

- (void)setPrecisionMode:(id)a3
{
  uint64_t v5 = (DRPrecisionMode *)a3;
  int64_t precisionMode = (int64_t)self->_precisionMode;
  if ((DRPrecisionMode *)precisionMode != v5)
  {
    id v9 = v5;
    int64_t precisionMode = (int64_t)[(id)precisionMode isEqual:v5];
    uint64_t v5 = v9;
    if ((precisionMode & 1) == 0)
    {
      objc_storeStrong((id *)&self->_precisionMode, a3);
      int64_t precisionMode = [(DRPrecisionMode *)v9 direction];
      uint64_t v5 = v9;
      if (precisionMode)
      {
        [(DRSessionViewModel *)self centroid];
        self->_enteredPrecisionModeY = v7;
        double v8 = CACurrentMediaTime();
        uint64_t v5 = v9;
        self->_enteredPrecisionModeTime = v8;
      }
    }
  }
  _objc_release_x1(precisionMode, v5);
}

- (void)beginDragManipulationWithLocation:(CAPoint3D)a3
{
  self->_isManipulatingTransform = 1;
  -[DRSessionViewModel updateDragManipulationWithLocation:](self, "updateDragManipulationWithLocation:", a3.x, a3.y, a3.z);
}

- (void)updateDragManipulationWithLocation:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  if ([(DRSessionViewModel *)self touchesCount])
  {
    touchModels = self->_touchModels;
    double v8 = [(NSMutableArray *)self->_touchIDs firstObject];
    id v22 = [(NSMutableDictionary *)touchModels objectForKey:v8];

    if ([v22 hasLocation])
    {
      if (self->_invalidatedDragManipulation)
      {
        [v22 location];
        self->_rotationAngle.initial = sub_100006678(v9, v10, v11, x, y);
        [v22 location];
        self->_scaleDistance.initial = sub_100006650(v12, v13, v14, x, y, z);
        self->_invalidatedDragManipulation = 0;
      }
      [v22 location];
      self->_rotationAngle.current = sub_100006678(v15, v16, v17, x, y);
      [v22 location];
      self->_scaleDistance.current = sub_100006650(v18, v19, v20, x, y, z);
      v21 = [(DRSessionViewModel *)self delegate];
      [v21 viewModelInvalidated:self];
    }
  }
}

- (void)endDragManipulationWithLocation:(CAPoint3D)a3
{
  -[DRSessionViewModel updateDragManipulationWithLocation:](self, "updateDragManipulationWithLocation:", a3.x, a3.y, a3.z);
  self->_isManipulatingTransform = 0;
  self->_rotationAngle.previousValue = self->_rotationAngle.previousValue
                                     + self->_rotationAngle.current
                                     - self->_rotationAngle.initial;
  self->_rotationAngle.initial = 0.0;
  self->_rotationAngle.current = 0.0;
  [(DRSessionViewModel *)self _manipulatedScale];
  self->_scaleDistance.previousValue = v4;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->_scaleDistance.initial = _Q0;
  self->_invalidatedDragManipulation = 1;
}

- (NSArray)itemModels
{
  id v2 = [(NSMutableArray *)self->_itemModels copy];
  return (NSArray *)v2;
}

- (CAPoint3D)centroid
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int64_t v3 = [(NSMutableDictionary *)self->_touchModels objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v4)
  {

LABEL_13:
    double x = self->_centroidWithoutTouches.x;
    double y = self->_centroidWithoutTouches.y;
    double z = self->_centroidWithoutTouches.z;
    goto LABEL_14;
  }
  id v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v20;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(v3);
      }
      double v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if ([v12 hasLocation])
      {
        [v12 location];
        double v10 = v10 + v13;
        [v12 location];
        double v9 = v9 + v14;
        [v12 location];
        double v8 = v8 + v15;
        ++v6;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v5);

  if (v6 < 1) {
    goto LABEL_13;
  }
  double x = v10 / (double)v6;
  double y = v9 / (double)v6;
  double z = v8 / (double)v6;
LABEL_14:
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)touchesCount
{
  return (unint64_t)[(NSMutableDictionary *)self->_touchModels count];
}

- (BOOL)canAddTouches
{
  return !self->_lastTouchEnded;
}

- (CGAffineTransform)appliedTransform
{
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v14 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v13;
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tdouble x = v12;
  CAPoint3D result = (CGAffineTransform *)[(DRSessionViewModel *)self canManipulateTransform];
  if (result)
  {
    if ([(DRSessionViewModel *)self rotatable])
    {
      CGFloat v6 = -(self->_rotationAngle.current
           - self->_rotationAngle.initial
           + self->_rotationAngle.previousValue
           - self->_originalRotation);
      *(_OWORD *)&v16.a = v14;
      *(_OWORD *)&v16.c = v13;
      *(_OWORD *)&v16.tdouble x = v12;
      CGAffineTransformRotate(retstr, &v16, v6);
    }
    CAPoint3D result = (CGAffineTransform *)[(DRSessionViewModel *)self resizable];
    if (result)
    {
      [(DRSessionViewModel *)self _manipulatedScale];
      CGFloat v8 = v7 * self->_originalScale.width;
      CGFloat v9 = v7 * self->_originalScale.height;
      long long v10 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v15.c = v10;
      *(_OWORD *)&v15.tdouble x = *(_OWORD *)&retstr->tx;
      CAPoint3D result = CGAffineTransformScale(&v16, &v15, v8, v9);
      long long v11 = *(_OWORD *)&v16.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
      *(_OWORD *)&retstr->c = v11;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v16.tx;
    }
  }
  return result;
}

- (double)_manipulatedScale
{
  double initial = self->_scaleDistance.initial;
  if (initial == 0.0) {
    return 1.0;
  }
  double v33 = self->_scaleDistance.current / initial;
  double previousValue = self->_scaleDistance.previousValue;
  [(DRSessionViewModel *)self originalScale];
  double v5 = v4;
  double v7 = v6;
  [(DRSessionViewModel *)self minimumResizableSize];
  double v9 = v8;
  double v11 = v10;
  [(DRSessionViewModel *)self maximumResizableSize];
  double v13 = v12;
  double v15 = v14;
  CGAffineTransform v16 = [(DRSessionViewModel *)self itemModels];
  double v17 = [v16 firstObject];
  double v18 = [v17 preview];
  [v18 unscaledSize];
  double v20 = v19;
  double v22 = v21;

  double v23 = v5 * v20;
  double v24 = v7 * v22;
  double height = CGSizeZero.height;
  if (v9 == CGSizeZero.width && v11 == height)
  {
    double v27 = 2.22507386e-308;
  }
  else
  {
    double v27 = v9 / v23;
    double v28 = 0.0;
    if (v9 <= 0.0) {
      double v27 = 0.0;
    }
    if (v11 > 0.0) {
      double v28 = v11 / v24;
    }
    if (v27 <= 0.0 || v28 <= 0.0)
    {
      if (v28 <= 0.0) {
        double v28 = 2.22507386e-308;
      }
      if (v27 <= 0.0) {
        double v27 = v28;
      }
    }
    else
    {
      double v27 = fmin(v27, v28);
    }
  }
  if (v13 == CGSizeZero.width && v15 == height)
  {
    double v32 = 1.79769313e308;
  }
  else
  {
    double v31 = v13 / v23;
    if (v13 <= 0.0) {
      double v31 = 0.0;
    }
    double v32 = v15 / v24;
    if (v15 <= 0.0) {
      double v32 = 0.0;
    }
    if (v31 <= 0.0 || v32 <= 0.0)
    {
      if (v32 <= 0.0) {
        double v32 = 1.79769313e308;
      }
      if (v31 > 0.0) {
        double v32 = v31;
      }
    }
    else
    {
      double v32 = fmin(v31, v32);
    }
  }
  return fmax(v27, fmin(v33 * previousValue, v32));
}

- (BOOL)canManipulateTransform
{
  if (![(DRSessionViewModel *)self resizable] && ![(DRSessionViewModel *)self rotatable]) {
    return 0;
  }
  int64_t v3 = [(DRSessionViewModel *)self itemModels];
  BOOL v4 = [v3 count] == (id)1;

  return v4;
}

- (BOOL)canAddManipulatedTouch
{
  BOOL v3 = [(DRSessionViewModel *)self canManipulateTransform];
  if (v3) {
    LOBYTE(v3) = [(DRSessionViewModel *)self touchesCount] != 0;
  }
  return v3;
}

- (BOOL)isManipulatingTransform
{
  BOOL v3 = [(DRSessionViewModel *)self canManipulateTransform];
  if (v3) {
    LOBYTE(v3) = self->_isManipulatingTransform;
  }
  return v3;
}

- (CGAffineTransform)elasticTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CAPoint3D result = (CGAffineTransform *)[(DRSessionViewModel *)self wantsElasticEffects];
  if (result)
  {
    if (!self->_isManipulatingTransform)
    {
      long long v7 = *(_OWORD *)&self->_elasticTransform.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&self->_elasticTransform.a;
      *(_OWORD *)&retstr->c = v7;
      *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self->_elasticTransform.tx;
    }
  }
  return result;
}

- (void)_invalidateElasticEffects
{
  [(UIViewFloatAnimatableProperty *)self->_elasticPositionX invalidate];
  [(UIViewFloatAnimatableProperty *)self->_elasticPositionY invalidate];
  [(UIViewFloatAnimatableProperty *)self->_elasticRotation invalidate];
  [(UIViewFloatAnimatableProperty *)self->_elasticScaleX invalidate];
  elasticScaleY = self->_elasticScaleY;
  [(UIViewFloatAnimatableProperty *)elasticScaleY invalidate];
}

- (void)_updateElasticEffectForLocation:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  long long v7 = [(DRSessionViewModel *)self delegate];
  double v8 = [v7 referenceScreenForViewModel:self];

  if ([(DRSessionViewModel *)self wantsElasticEffects] && v8)
  {
    elasticPositionX = self->_elasticPositionX;
    if (!elasticPositionX
      || [(UIViewFloatAnimatableProperty *)elasticPositionX isInvalidated])
    {
      double v10 = (UIViewFloatAnimatableProperty *)objc_opt_new();
      double v11 = self->_elasticPositionX;
      self->_elasticPositionX = v10;

      [(UIViewFloatAnimatableProperty *)self->_elasticPositionX setValue:x];
      double v12 = (UIViewFloatAnimatableProperty *)objc_opt_new();
      elasticPositionY = self->_elasticPositionY;
      self->_elasticPositionY = v12;

      [(UIViewFloatAnimatableProperty *)self->_elasticPositionY setValue:y];
      double v14 = (UIViewFloatAnimatableProperty *)objc_opt_new();
      elasticRotation = self->_elasticRotation;
      self->_elasticRotation = v14;

      [(UIViewFloatAnimatableProperty *)self->_elasticRotation setValue:0.0];
      CGAffineTransform v16 = (UIViewFloatAnimatableProperty *)objc_opt_new();
      elasticScaleX = self->_elasticScaleX;
      self->_elasticScaleX = v16;

      [(UIViewFloatAnimatableProperty *)self->_elasticScaleX setValue:100.0];
      double v18 = (UIViewFloatAnimatableProperty *)objc_opt_new();
      elasticScaleY = self->_elasticScaleY;
      self->_elasticScaleY = v18;

      [(UIViewFloatAnimatableProperty *)self->_elasticScaleY setValue:100.0];
      objc_initWeak(&location, self);
      double v20 = [(DRSessionViewModel *)self elasticPositionX];
      v34[0] = v20;
      double v21 = [(DRSessionViewModel *)self elasticPositionY];
      v34[1] = v21;
      double v22 = +[NSArray arrayWithObjects:v34 count:2];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100011058;
      v30[3] = &unk_100054CA8;
      objc_copyWeak(&v31, &location);
      +[UIView _createTransformerWithInputAnimatableProperties:v22 presentationValueChangedCallback:v30];

      double v23 = [(DRSessionViewModel *)self elasticRotation];
      v33[0] = v23;
      double v24 = [(DRSessionViewModel *)self elasticScaleX];
      v33[1] = v24;
      v25 = [(DRSessionViewModel *)self elasticScaleY];
      v33[2] = v25;
      v26 = +[NSArray arrayWithObjects:v33 count:3];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100011098;
      v28[3] = &unk_100054CA8;
      objc_copyWeak(&v29, &location);
      +[UIView _createTransformerWithInputAnimatableProperties:v26 presentationValueChangedCallback:v28];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000110D8;
    v27[3] = &unk_100054E80;
    v27[4] = self;
    *(double *)&v27[5] = x;
    *(double *)&v27[6] = y;
    *(double *)&v27[7] = z;
    [(DRSessionViewModel *)self _animateSpringWithDampingRatio:v27 response:0.4264 animations:0.26792];
  }
}

- (void)_updateElasticProperties
{
  BOOL v3 = [(DRSessionViewModel *)self delegate];
  BOOL v4 = [v3 referenceScreenForViewModel:self];

  if (v4
    && ([(UIViewFloatAnimatableProperty *)self->_elasticRotation isInvalidated] & 1) == 0)
  {
    uint64_t v5 = sub_100005FF4(v4);
    [(UIViewFloatAnimatableProperty *)self->_elasticPositionX velocity];
    [(UIViewFloatAnimatableProperty *)self->_elasticPositionY velocity];
    _UIConvertPointFromOrientationToOrientation();
    uint64_t v8 = v6;
    if ((unint64_t)(v5 - 3) >= 2) {
      double v9 = v7;
    }
    else {
      double v9 = -v7;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000112A4;
    v11[3] = &unk_100054EA8;
    v11[4] = self;
    v11[5] = v6;
    *(double *)&v11[6] = v9;
    [(DRSessionViewModel *)self _animateSpringWithDampingRatio:v11 response:0.40089 animations:0.25];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000112DC;
    v10[3] = &unk_100054EA8;
    v10[4] = self;
    v10[5] = v8;
    *(double *)&v10[6] = v9;
    [(DRSessionViewModel *)self _animateSpringWithDampingRatio:v10 response:0.53452 animations:0.25];
  }
}

- (void)_updateElasticTransform
{
  if (([(UIViewFloatAnimatableProperty *)self->_elasticPositionX isInvalidated] & 1) == 0)
  {
    [(UIViewFloatAnimatableProperty *)self->_elasticPositionX presentationValue];
    double v4 = v3;
    [(UIViewFloatAnimatableProperty *)self->_elasticPositionX value];
    CGFloat v6 = v4 - v5;
    [(UIViewFloatAnimatableProperty *)self->_elasticPositionY presentationValue];
    double v8 = v7;
    [(UIViewFloatAnimatableProperty *)self->_elasticPositionY value];
    CGFloat v10 = v8 - v9;
    [(UIViewFloatAnimatableProperty *)self->_elasticRotation presentationValue];
    UIRoundToScale();
    double v12 = v11;
    [(UIViewFloatAnimatableProperty *)self->_elasticScaleX presentationValue];
    UIRoundToScale();
    CGFloat v14 = v13;
    [(UIViewFloatAnimatableProperty *)self->_elasticScaleY presentationValue];
    UIRoundToScale();
    CGFloat v16 = v15;
    long long v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v24.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v24.c = v17;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&t1.a = *(_OWORD *)&v24.a;
    *(_OWORD *)&t1.c = v17;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&v24.tx;
    CGAffineTransformTranslate(&v24, &t1, v6, v10);
    CGAffineTransform v22 = v24;
    CGAffineTransformRotate(&t1, &v22, -v12);
    *(_OWORD *)&v24.c = *(_OWORD *)&t1.c;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)&t1.tx;
    *(_OWORD *)&v24.a = *(_OWORD *)&t1.a;
    CGAffineTransform v22 = t1;
    CGAffineTransformScale(&t1, &v22, v14, v16);
    *(_OWORD *)&v24.c = *(_OWORD *)&t1.c;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)&t1.tx;
    long long v18 = *(_OWORD *)&t1.a;
    long long v19 = *(_OWORD *)&self->_elasticTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_elasticTransform.a;
    *(_OWORD *)&t1.c = v19;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_elasticTransform.tx;
    *(_OWORD *)&v24.a = v18;
    *(_OWORD *)&v22.a = v18;
    *(_OWORD *)&v22.c = *(_OWORD *)&v24.c;
    *(_OWORD *)&v22.tdouble x = *(_OWORD *)&v24.tx;
    if (!CGAffineTransformEqualToTransform(&t1, &v22))
    {
      long long v20 = *(_OWORD *)&v24.c;
      *(_OWORD *)&self->_elasticTransform.a = *(_OWORD *)&v24.a;
      *(_OWORD *)&self->_elasticTransform.c = v20;
      *(_OWORD *)&self->_elasticTransform.tdouble x = *(_OWORD *)&v24.tx;
      double v21 = [(DRSessionViewModel *)self delegate];
      [v21 viewModelInvalidated:self];
    }
  }
}

- (void)_animateSpringWithDampingRatio:(double)a3 response:(double)a4 animations:(id)a5
{
}

- (DRSessionViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRSessionViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)usesSynthesizedTouch
{
  return self->_usesSynthesizedTouch;
}

- (void)setUsesSynthesizedTouch:(BOOL)a3
{
  self->_usesSynthesizedTouch = a3;
}

- (NSString)displayIdentifierForSynthesizedTouch
{
  return self->_displayIdentifierForSynthesizedTouch;
}

- (void)setDisplayIdentifierForSynthesizedTouch:(id)a3
{
}

- (unsigned)sourceContextID
{
  return self->_sourceContextID;
}

- (void)setSourceContextID:(unsigned int)a3
{
  self->_sourceContextID = a3;
}

- (CAPoint3D)initialCentroidInSourceContext
{
  double x = self->_initialCentroidInSourceContext.x;
  double y = self->_initialCentroidInSourceContext.y;
  double z = self->_initialCentroidInSourceContext.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialCentroidInSourceContext:(CAPoint3D)a3
{
  self->_initialCentroidInSourceContext = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (DRClientModel)sourceClient
{
  return self->_sourceClient;
}

- (BOOL)sourceRestrictsDragToSelf
{
  return self->_sourceRestrictsDragToSelf;
}

- (void)setSourceRestrictsDragToSelf:(BOOL)a3
{
  self->_sourceRestrictsDragToSelf = a3;
}

- (BOOL)sourceRestrictsDragToLocalDevice
{
  return self->_sourceRestrictsDragToLocalDevice;
}

- (void)setSourceRestrictsDragToLocalDevice:(BOOL)a3
{
  self->_sourceRestrictsDragToLocalDevice = a3;
}

- (BOOL)sourceIsHostedOnContinuityDisplay
{
  return self->_sourceIsHostedOnContinuityDisplay;
}

- (void)setSourceIsHostedOnContinuityDisplay:(BOOL)a3
{
  self->_sourceIsHostedOnContinuityDispladouble y = a3;
}

- (BOOL)continuityDisplayWantsDragsHidden
{
  return self->_continuityDisplayWantsDragsHidden;
}

- (void)setContinuityDisplayWantsDragsHidden:(BOOL)a3
{
  self->_continuityDisplayWantsDragsHidden = a3;
}

- (_DUIPotentialDrop)potentialDrop
{
  return self->_potentialDrop;
}

- (DRClientModel)potentialDropDestinationClient
{
  return self->_potentialDropDestinationClient;
}

- (DRPrecisionMode)precisionMode
{
  return self->_precisionMode;
}

- (NSIndexSet)preferredPreviewIndexes
{
  return self->_preferredPreviewIndexes;
}

- (void)setPreferredPreviewIndexes:(id)a3
{
}

- (BOOL)rotatable
{
  return self->_rotatable;
}

- (void)setRotatable:(BOOL)a3
{
  self->_rotatable = a3;
}

- (BOOL)resizable
{
  return self->_resizable;
}

- (void)setResizable:(BOOL)a3
{
  self->_resizable = a3;
}

- (CGSize)minimumResizableSize
{
  double width = self->_minimumResizableSize.width;
  double height = self->_minimumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumResizableSize:(CGSize)a3
{
  self->_minimumResizableSize = a3;
}

- (CGSize)maximumResizableSize
{
  double width = self->_maximumResizableSize.width;
  double height = self->_maximumResizableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumResizableSize:(CGSize)a3
{
  self->_maximumResizableSize = a3;
}

- (double)originalRotation
{
  return self->_originalRotation;
}

- (void)setOriginalRotation:(double)a3
{
  self->_originalRotation = a3;
}

- (CGSize)originalScale
{
  double width = self->_originalScale.width;
  double height = self->_originalScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOriginalScale:(CGSize)a3
{
  self->_originalScale = a3;
}

- (BOOL)wantsElasticEffects
{
  return self->_wantsElasticEffects;
}

- (void)setWantsElasticEffects:(BOOL)a3
{
  self->_wantsElasticEffects = a3;
}

- (double)enteredPrecisionModeY
{
  return self->_enteredPrecisionModeY;
}

- (double)enteredPrecisionModeTime
{
  return self->_enteredPrecisionModeTime;
}

- (BOOL)hasReceivedInitialPreviewReply
{
  return self->_hasReceivedInitialPreviewReply;
}

- (void)setHasReceivedInitialPreviewReply:(BOOL)a3
{
  self->_hasReceivedInitialPreviewRepldouble y = a3;
}

- (UIViewFloatAnimatableProperty)elasticPositionX
{
  return self->_elasticPositionX;
}

- (UIViewFloatAnimatableProperty)elasticPositionY
{
  return self->_elasticPositionY;
}

- (UIViewFloatAnimatableProperty)elasticRotation
{
  return self->_elasticRotation;
}

- (UIViewFloatAnimatableProperty)elasticScaleX
{
  return self->_elasticScaleX;
}

- (UIViewFloatAnimatableProperty)elasticScaleY
{
  return self->_elasticScaleY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elasticScaleY, 0);
  objc_storeStrong((id *)&self->_elasticScaleX, 0);
  objc_storeStrong((id *)&self->_elasticRotation, 0);
  objc_storeStrong((id *)&self->_elasticPositionY, 0);
  objc_storeStrong((id *)&self->_elasticPositionX, 0);
  objc_storeStrong((id *)&self->_preferredPreviewIndexes, 0);
  objc_storeStrong((id *)&self->_precisionMode, 0);
  objc_storeStrong((id *)&self->_potentialDropDestinationClient, 0);
  objc_storeStrong((id *)&self->_potentialDrop, 0);
  objc_storeStrong((id *)&self->_sourceClient, 0);
  objc_storeStrong((id *)&self->_displayIdentifierForSynthesizedTouch, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientModelsByClient, 0);
  objc_storeStrong((id *)&self->_itemModels, 0);
  objc_storeStrong((id *)&self->_touchModels, 0);
  objc_storeStrong((id *)&self->_touchIDs, 0);
}

@end