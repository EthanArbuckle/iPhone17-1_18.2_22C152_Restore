@interface GCMouseInput
- (GCControllerButtonInput)leftButton;
- (GCControllerButtonInput)middleButton;
- (GCControllerButtonInput)rightButton;
- (GCDeviceCursor)scroll;
- (GCMouseInput)initWithIdentifier:(id)a3;
- (GCMouseInput)initWithIdentifier:(id)a3 additionalButtons:(unsigned int)a4;
- (GCMouseMoved)mouseMovedHandler;
- (NSArray)auxiliaryButtons;
- (id)liveInputFacade;
- (id)mouseButtonPressedPrivate;
- (id)mouseMovedHandlerPrivate;
- (id)name;
- (id)physicalInputQueue:(id)a3;
- (id)physicalInputWithAttributes:(id)a3;
- (uint64_t)_liveInput;
- (uint64_t)_physicalInputQueue;
- (void)_bufferEvent:(uint64_t)a1;
- (void)_drainBufferedEvents:(id)a3 latestOnly:(BOOL)a4;
- (void)_handleButtonEventType:(unint64_t)a3 buttonMask:(unint64_t)a4;
- (void)handleMouseButtonEventAddingButtonMask:(unint64_t)a3;
- (void)handleMouseButtonEventRemovingButtonMask:(unint64_t)a3;
- (void)handleMouseButtonEventSettingButtonMask:(unint64_t)a3;
- (void)handleMouseMovementEventWithDelta:(CGPoint)a3;
- (void)handleScrollEventWithDelta:(CGPoint)a3;
- (void)physicalInput:(id)a3 setQueue:(id)a4;
- (void)physicalInputTransactionQueueDepthDidChange:(id)a3;
- (void)setButtonEventSource:(id)a3;
- (void)setDigitizerEventSource:(id)a3;
- (void)setMouseButtonPressedPrivate:(id)a3;
- (void)setMouseMovedHandler:(GCMouseMoved)mouseMovedHandler;
- (void)setMouseMovedHandlerPrivate:(id)a3;
- (void)setPointerEventSource:(id)a3;
- (void)setScrollEventSource:(id)a3;
- (void)set_liveInput:(uint64_t)a1;
- (void)set_physicalInputQueue:(uint64_t)a1;
@end

@implementation GCMouseInput

- (GCMouseInput)initWithIdentifier:(id)a3 additionalButtons:(unsigned int)a4
{
  id v6 = a3;
  v70.receiver = self;
  v70.super_class = (Class)GCMouseInput;
  v7 = [(GCPhysicalInputProfile *)&v70 initWithIdentifier:v6];
  if (v7)
  {
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v67 = 0;
    __int16 v63 = 1;
    char v66 = 0;
    int v65 = 0;
    v62 = @"Scroll";
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v61, (uint64_t)&v62);
    uint64_t v8 = [(GCPhysicalInputProfile *)v7 _cursorWithInfo:v61];
    scroll = v7->_scroll;
    v7->_scroll = (GCDeviceCursor *)v8;

    v10 = v62;
    v62 = @"Left Button";

    HIBYTE(v63) = 1;
    int v64 = 0;
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v60, (uint64_t)&v62);
    uint64_t v11 = [(GCPhysicalInputProfile *)v7 _buttonWithInfo:v60];
    leftButton = v7->_leftButton;
    v7->_leftButton = (GCControllerButtonInput *)v11;

    if (a4)
    {
      HIBYTE(v63) = 1;
      v13 = v62;
      v62 = @"Right Button";

      __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v59, (uint64_t)&v62);
      uint64_t v14 = [(GCPhysicalInputProfile *)v7 _buttonWithInfo:v59];
      rightButton = v7->_rightButton;
      v7->_rightButton = (GCControllerButtonInput *)v14;

      if (a4 >= 2)
      {
        HIBYTE(v63) = 1;
        v16 = v62;
        v62 = @"Middle Button";

        __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v58, (uint64_t)&v62);
        uint64_t v17 = [(GCPhysicalInputProfile *)v7 _buttonWithInfo:v58];
        middleButton = v7->_middleButton;
        v7->_middleButton = (GCControllerButtonInput *)v17;

        if (a4 >= 3)
        {
          v19 = objc_opt_new();
          if (a4 >= 4)
          {
            uint64_t v20 = 3;
            do
            {
              HIBYTE(v63) = 1;
              uint64_t v21 = +[NSString stringWithFormat:@"Auxiliary Button %u", v20];
              v22 = v62;
              v62 = (__CFString *)v21;

              __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v57, (uint64_t)&v62);
              v23 = [(GCPhysicalInputProfile *)v7 _buttonWithInfo:v57];
              [v19 addObject:v23];

              uint64_t v20 = (v20 + 1);
            }
            while (a4 != v20);
          }
          uint64_t v24 = [v19 copy];
          auxiliaryButtons = v7->_auxiliaryButtons;
          v7->_auxiliaryButtons = (NSArray *)v24;
        }
      }
    }
    id v52 = v6;
    v7->_buttons = 0;
    v26 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"primaryMouseButton"];
    v27 = +[NSSet setWithObject:@"Primary Button"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v26, v27);

    _GCFConvertStringToLocalizedString();
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v26, v28);

    v53 = [[_GCDevicePhysicalInputElement alloc] initWithParameters:v26];
    v29 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"secondaryMouseButton"];

    v30 = +[NSSet setWithObject:@"Secondary Button"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v29, v30);

    _GCFConvertStringToLocalizedString();
    v31 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v29, v31);

    v32 = [[_GCDevicePhysicalInputElement alloc] initWithParameters:v29];
    v33 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"thirdMouseButton"];

    v34 = +[NSSet setWithObject:@"Third Button"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v33, v34);

    _GCFConvertStringToLocalizedString();
    v35 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v33, v35);

    v36 = [[_GCDevicePhysicalInputElement alloc] initWithParameters:v33];
    v37 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"mouseCursor"];

    v38 = +[NSSet setWithObject:@"Cursor"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v37, v38);

    _GCFConvertStringToLocalizedString();
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v37, v39);

    v40 = [(_GCDevicePhysicalInputElement *)[GCCursorElement alloc] initWithParameters:v37];
    v41 = +[_GCDevicePhysicalInputElementParameters parametersWithIdentifier:@"mouseScrollWheel"];

    v42 = +[NSSet setWithObject:@"Scroll Wheel"];
    -[_GCDevicePhysicalInputElementParameters setAliases:](v41, v42);

    _GCFConvertStringToLocalizedString();
    v43 = (char *)objc_claimAutoreleasedReturnValue();
    -[_GCDevicePhysicalInputElementParameters setLocalizedName:](v41, v43);

    v44 = [[_GCDevicePhysicalInputElement alloc] initWithParameters:v41];
    v45 = +[NSSet setWithObjects:](&off_26D2B4E80, "setWithObjects:", v53, v32, v36, v40, v44, 0);
    v46 = objc_opt_new();
    v47 = [[_GCDevicePhysicalInput alloc] initWithFacade:v46 elements:v45];
    liveInput = v7->_liveInput;
    v7->_liveInput = v47;

    [(_GCDevicePhysicalInput *)v7->_liveInput setDataSource:v7];
    v7->_eventBufferLock._os_unfair_lock_opaque = 0;
    uint64_t v49 = objc_opt_new();
    eventBuffer = v7->_eventBuffer;
    v7->_eventBuffer = (NSMutableArray *)v49;

    v7->_eventBufferDepth = -[_GCDevicePhysicalInput transactionQueueDepth](&v7->_liveInput->super.super.isa);
    objc_initWeak(&location, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __53__GCMouseInput_initWithIdentifier_additionalButtons___block_invoke;
    block[3] = &unk_26D22A9D0;
    objc_copyWeak(&v55, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);

    __destructor_8_s0_s48_s56_s64((uint64_t)&v62);
    id v6 = v52;
  }

  return v7;
}

void __53__GCMouseInput_initWithIdentifier_additionalButtons___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[UIApplication sharedApplication];
    v2 = [v1 windows];
    uint64_t v3 = [v2 firstObject];
    v4 = (void *)WeakRetained[82];
    WeakRetained[82] = v3;
  }
}

- (GCMouseInput)initWithIdentifier:(id)a3
{
  return [(GCMouseInput *)self initWithIdentifier:a3 additionalButtons:0];
}

- (id)name
{
  return @"Mouse";
}

- (void)_bufferEvent:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 664));
    if ((unint64_t)[*(id *)(a1 + 672) count] >= *(void *)(a1 + 680))
    {
      *(void *)(a2 + 8) = 0;
      [*(id *)(a1 + 672) removeAllObjects];
    }
    v4 = (void *)[objc_alloc((Class)&off_26D2ACCE0) initWithBytes:a2 objCType:"{?=QQ(?={?=ff}q)}"];
    [*(id *)(a1 + 672) addObject:v4];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 664));
    v5 = *(void **)(a1 + 752);
    if (v5)
    {
      id v6 = v5;
      objc_initWeak(&location, (id)a1);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = __29__GCMouseInput__bufferEvent___block_invoke;
      v7[3] = &unk_26D22A9D0;
      objc_copyWeak(&v8, &location);
      dispatch_async(v6, v7);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (uint64_t)_physicalInputQueue
{
  if (result) {
    return *(void *)(result + 752);
  }
  return result;
}

void __29__GCMouseInput__bufferEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _drainBufferedEvents:WeakRetained[95] latestOnly:0];
    WeakRetained = v2;
  }
}

- (uint64_t)_liveInput
{
  if (result) {
    return *(void *)(result + 760);
  }
  return result;
}

- (void)_drainBufferedEvents:(id)a3 latestOnly:(BOOL)a4
{
  v5 = (_GCDevicePhysicalInput *)a3;
  os_unfair_lock_lock(&self->_eventBufferLock);
  uint64_t v6 = [(NSMutableArray *)self->_eventBuffer count];
  if (v6)
  {
    uint64_t v7 = 0;
    do
    {
      long long v11 = 0uLL;
      uint64_t v12 = 0;
      id v8 = [(NSMutableArray *)self->_eventBuffer objectAtIndexedSubscript:v7];
      [v8 getValue:&v11 size:24];

      long long v9 = v11;
      uint64_t v10 = v12;
      -[_GCDevicePhysicalInput handleMouseEvent:](v5, &v9);
      ++v7;
    }
    while (v6 != v7);
  }
  [(NSMutableArray *)self->_eventBuffer removeAllObjects];
  os_unfair_lock_unlock(&self->_eventBufferLock);
}

- (id)physicalInputWithAttributes:(id)a3
{
  return 0;
}

- (id)physicalInputQueue:(id)a3
{
  if (!self || (v4 = self->_physicalInputQueue) == 0)
  {
    v5 = [(GCPhysicalInputProfile *)self controller];
    v4 = [v5 handlerQueue];
  }

  return v4;
}

- (void)physicalInput:(id)a3 setQueue:(id)a4
{
}

- (void)set_physicalInputQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 752), a2);
  }
}

- (void)physicalInputTransactionQueueDepthDidChange:(id)a3
{
  v4 = a3;
  os_unfair_lock_lock(&self->_eventBufferLock);
  self->_eventBufferDepth = -[_GCDevicePhysicalInput transactionQueueDepth](v4);
  os_unfair_lock_unlock(&self->_eventBufferLock);
}

- (GCMouseMoved)mouseMovedHandler
{
  return self->_mouseMovedHandler;
}

- (void)setMouseMovedHandler:(GCMouseMoved)mouseMovedHandler
{
}

- (id)mouseMovedHandlerPrivate
{
  return self->_mouseMovedHandlerPrivate;
}

- (void)setMouseMovedHandlerPrivate:(id)a3
{
}

- (id)mouseButtonPressedPrivate
{
  return self->_mouseButtonPressedPrivate;
}

- (void)setMouseButtonPressedPrivate:(id)a3
{
}

- (void)set_liveInput:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 760), a2);
  }
}

- (GCDeviceCursor)scroll
{
  return self->_scroll;
}

- (GCControllerButtonInput)leftButton
{
  return self->_leftButton;
}

- (GCControllerButtonInput)rightButton
{
  return self->_rightButton;
}

- (GCControllerButtonInput)middleButton
{
  return self->_middleButton;
}

- (NSArray)auxiliaryButtons
{
  return self->_auxiliaryButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryButtons, 0);
  objc_storeStrong((id *)&self->_middleButton, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_scroll, 0);
  objc_storeStrong((id *)&self->_liveInput, 0);
  objc_storeStrong((id *)&self->_physicalInputQueue, 0);
  objc_storeStrong(&self->_mouseButtonPressedPrivate, 0);
  objc_storeStrong(&self->_mouseMovedHandlerPrivate, 0);
  objc_storeStrong(&self->_mouseMovedHandler, 0);
  objc_storeStrong(&self->_pointerEventObservation, 0);
  objc_storeStrong(&self->_digitizerEventObservation, 0);
  objc_storeStrong(&self->_scrollEventObservation, 0);
  objc_storeStrong(&self->_buttonEventObservation, 0);
  objc_storeStrong((id *)&self->_eventBuffer, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (id)liveInputFacade
{
  if (a1)
  {
    a1 = (id *)a1[95];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)handleMouseButtonEventSettingButtonMask:(unint64_t)a3
{
}

- (void)handleMouseButtonEventAddingButtonMask:(unint64_t)a3
{
}

- (void)handleMouseButtonEventRemovingButtonMask:(unint64_t)a3
{
}

- (void)_handleButtonEventType:(unint64_t)a3 buttonMask:(unint64_t)a4
{
  if (a3 - 3 >= 3)
  {
    id v20 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Unknown button event type" userInfo:0];
    objc_exception_throw(v20);
  }
  v24[0] = 0;
  v24[1] = a3;
  v24[2] = a4;
  -[GCMouseInput _bufferEvent:]((uint64_t)self, (uint64_t)v24);
  uint64_t v6 = [(GCPhysicalInputProfile *)self handlerQueue];
  self->_buttons = a4;
  uint64_t v7 = [(GCMouseInput *)self leftButton];
  *(float *)&double v8 = (float)(a4 & 1);
  [v7 _setValue:v6 queue:v8];

  long long v9 = [(GCMouseInput *)self rightButton];
  *(float *)&double v10 = (float)(a4 & 2);
  [v9 _setValue:v6 queue:v10];

  long long v11 = [(GCMouseInput *)self middleButton];
  *(float *)&double v12 = (float)(a4 & 4);
  [v11 _setValue:v6 queue:v12];

  if ([(NSArray *)self->_auxiliaryButtons count])
  {
    unint64_t v13 = 0;
    do
    {
      if (((8 << v13) & a4) != 0) {
        float v14 = 1.0;
      }
      else {
        float v14 = 0.0;
      }
      v15 = [(NSArray *)self->_auxiliaryButtons objectAtIndexedSubscript:v13];
      *(float *)&double v16 = v14;
      [v15 _setValue:v6 queue:v16];

      ++v13;
    }
    while ([(NSArray *)self->_auxiliaryButtons count] > v13);
  }
  uint64_t v17 = (void *)MEMORY[0x223C6E420](self->_mouseButtonPressedPrivate);
  v18 = [(GCPhysicalInputProfile *)self handlerQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __58__GCMouseInput_PubSub___handleButtonEventType_buttonMask___block_invoke;
  v21[3] = &unk_26D22AD10;
  v21[4] = self;
  id v22 = v17;
  unint64_t v23 = a4;
  id v19 = v17;
  dispatch_async(v18, v21);
}

uint64_t __58__GCMouseInput_PubSub___handleButtonEventType_buttonMask___block_invoke(void *a1)
{
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[6]);
  }
  return result;
}

- (void)handleScrollEventWithDelta:(CGPoint)a3
{
  float x = a3.x;
  float v5 = -x;
  long long v39 = xmmword_220A91CF0;
  float y = a3.y;
  float v40 = -x;
  float v41 = y;
  -[GCMouseInput _bufferEvent:]((uint64_t)self, (uint64_t)&v39);
  uint64_t v7 = [(GCMouseInput *)self scroll];
  double v8 = [(GCPhysicalInputProfile *)self handlerQueue];
  id v9 = v7;
  id v10 = v8;
  [v9 frame];
  CGFloat v11 = v42.origin.x;
  CGFloat v12 = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  double MinX = CGRectGetMinX(v42);
  if (MinX >= v5)
  {
    float v17 = v5;
  }
  else
  {
    float v16 = MinX;
    float v17 = v16;
  }
  float v38 = v5;
  v43.origin.float x = v11;
  v43.origin.float y = v12;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v43);
  if (MaxX >= v5)
  {
    float v19 = MaxX;
    float v20 = v19;
  }
  else
  {
    float v20 = v5;
  }
  float v37 = v20;
  v44.origin.float x = v11;
  v44.origin.float y = v12;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v44);
  float v22 = y;
  double v23 = y;
  if (MinY >= v23)
  {
    float v25 = v22;
  }
  else
  {
    float v24 = MinY;
    float v25 = v24;
  }
  v45.origin.float x = v11;
  v45.origin.float y = v12;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v45);
  if (MaxY >= v23)
  {
    float v27 = MaxY;
    float v28 = v27;
  }
  else
  {
    float v28 = v22;
  }
  objc_msgSend(v9, "setFrame:", v17, v25, (float)(v37 - v17), (float)(v28 - v25));
  id v29 = v9;
  id v30 = v10;
  v31 = [v29 xAxis];
  *(float *)&double v32 = v38;
  char v33 = [v31 _setValue:v30 queue:v32];

  v34 = [v29 yAxis];
  *(float *)&double v35 = v22;
  int v36 = [v34 _setValue:v30 queue:v35];

  if ((v33 & 1) != 0 || v36) {
    [0 addObject:v29];
  }
}

- (void)handleMouseMovementEventWithDelta:(CGPoint)a3
{
  CGFloat x = a3.x;
  double v5 = -a3.y;
  float v6 = a3.x;
  long long v21 = xmmword_220A91D00;
  float v7 = -a3.y;
  float v22 = v6;
  float v23 = v7;
  -[GCMouseInput _bufferEvent:]((uint64_t)self, (uint64_t)&v21);
  double v8 = [(GCPhysicalInputProfile *)self handlerQueue];
  id v9 = (void *)MEMORY[0x223C6E420](self->_mouseMovedHandler);
  id v10 = v9;
  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke;
    block[3] = &unk_26D22AD38;
    void block[4] = self;
    id v18 = v9;
    CGFloat v19 = x;
    double v20 = v5;
    dispatch_async(v8, block);
  }
  CGFloat v11 = (void *)MEMORY[0x223C6E420](self->_mouseMovedHandlerPrivate);
  CGFloat v12 = v11;
  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke_2;
    v13[3] = &unk_26D22AD38;
    v13[4] = self;
    id v14 = v11;
    CGFloat v15 = x;
    double v16 = v5;
    dispatch_async(v8, v13);
  }
}

uint64_t __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 48);
  float v2 = *(double *)(a1 + 56);
  return (*(uint64_t (**)(void, void, float, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), v1, v2);
}

uint64_t __58__GCMouseInput_PubSub__handleMouseMovementEventWithDelta___block_invoke_2(uint64_t a1)
{
  float v1 = *(double *)(a1 + 48);
  float v2 = *(double *)(a1 + 56);
  return (*(uint64_t (**)(void, void, float, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), v1, v2);
}

- (void)setButtonEventSource:(id)a3
{
  id buttonEventObservation = self->_buttonEventObservation;
  self->_id buttonEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__GCMouseInput_PubSub__setButtonEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e26_v16__0____GCButtonEvent__8lu32l8;
  v8[4] = self;
  float v6 = [v5 observeButtonEvents:v8];

  id v7 = self->_buttonEventObservation;
  self->_id buttonEventObservation = v6;
}

uint64_t __45__GCMouseInput_PubSub__setButtonEventSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _receivedEvent];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v4 mask];

  return [v5 handleMouseButtonEventSettingButtonMask:v6];
}

- (void)setScrollEventSource:(id)a3
{
  id scrollEventObservation = self->_scrollEventObservation;
  self->_id scrollEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__GCMouseInput_PubSub__setScrollEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e26_v16__0____GCScrollEvent__8lu32l8;
  v8[4] = self;
  uint64_t v6 = [v5 observeScrollEvents:v8];

  id v7 = self->_scrollEventObservation;
  self->_id scrollEventObservation = v6;
}

uint64_t __45__GCMouseInput_PubSub__setScrollEventSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _receivedEvent];
  id v5 = *(void **)(a1 + 32);
  [v4 x];
  double v7 = v6;
  [v4 y];
  float v9 = v8;

  return objc_msgSend(v5, "handleScrollEventWithDelta:", v7, v9);
}

- (void)setDigitizerEventSource:(id)a3
{
  id digitizerEventObservation = self->_digitizerEventObservation;
  self->_id digitizerEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __48__GCMouseInput_PubSub__setDigitizerEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e29_v16__0____GCDigitizerEvent__8lu32l8;
  v8[4] = self;
  float v6 = [v5 observeDigitizerEvents:v8];

  id v7 = self->_digitizerEventObservation;
  self->_id digitizerEventObservation = v6;
}

uint64_t __48__GCMouseInput_PubSub__setDigitizerEventSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _receivedEvent];
  id v5 = *(void **)(a1 + 32);
  [v4 x];
  double v7 = v6;
  [v4 y];
  float v9 = v8;

  return objc_msgSend(v5, "handleDigitizerEvent:", v7, v9);
}

- (void)setPointerEventSource:(id)a3
{
  id pointerEventObservation = self->_pointerEventObservation;
  self->_id pointerEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __46__GCMouseInput_PubSub__setPointerEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v16__0____GCPointerEvent__8lu32l8;
  v8[4] = self;
  float v6 = [v5 observePointerEvents:v8];

  id v7 = self->_pointerEventObservation;
  self->_id pointerEventObservation = v6;
}

uint64_t __46__GCMouseInput_PubSub__setPointerEventSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _receivedEvent];
  id v5 = *(void **)(a1 + 32);
  [v4 x];
  double v7 = v6;
  [v4 y];
  float v9 = v8;

  return objc_msgSend(v5, "handleMouseMovementEventWithDelta:", v7, v9);
}

@end