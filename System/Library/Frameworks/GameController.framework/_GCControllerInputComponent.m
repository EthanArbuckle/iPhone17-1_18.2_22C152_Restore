@interface _GCControllerInputComponent
- (_GCControllerInputComponent)initWithIdentifier:(id)a3 templateFacadeParameters:(id)a4 templateElementParameters:(id)a5;
- (void)handleGamepadEvent:(id)a3;
- (void)setController:(id)a3;
- (void)setSettingsProfile:(id)a3;
@end

@implementation _GCControllerInputComponent

- (_GCControllerInputComponent)initWithIdentifier:(id)a3 templateFacadeParameters:(id)a4 templateElementParameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "viewClass")), "initWithParameters:", v9);

  v12 = objc_msgSend(v8, "gc_arrayByTransformingElementsUsingBlock:", &__block_literal_global_44);
  v13 = +[NSSet setWithArray:v12];

  v14 = [_GCDevicePhysicalInput alloc];
  v15 = +[NSSet set];
  v16 = [(_GCDevicePhysicalInput *)v14 initWithFacade:v11 elements:v13 attributes:v15];

  v17 = [_GCDevicePhysicalInput alloc];
  v18 = +[NSSet setWithObject:@"unmapped"];
  v19 = [(_GCDevicePhysicalInput *)v17 initWithFacade:v11 elements:v13 attributes:v18];

  v26[0] = v16;
  v26[1] = v19;
  v20 = +[NSArray arrayWithObjects:v26 count:2];
  v25.receiver = self;
  v25.super_class = (Class)_GCControllerInputComponent;
  v21 = [(_GCDevicePhysicalInputComponent *)&v25 initWithIdentifier:v10 physicalInputs:v20];

  uint64_t v22 = [v8 copy];
  templateElementParameters = v21->_templateElementParameters;
  v21->_templateElementParameters = (NSArray *)v22;

  return v21;
}

- (void)setController:(id)a3
{
  id v4 = a3;
  [(_GCDevicePhysicalInputComponent *)self setDevice:v4];
  id v5 = [v4 handlerQueue];

  [(_GCDevicePhysicalInputComponent *)self setDispatchQueue:v5];
}

- (void)handleGamepadEvent:(id)a3
{
  id v4 = (_GCGamepadEventImpl *)a3;
  if ([(NSArray *)self->_eventRemappingActions count])
  {
    id v5 = [[_GCGamepadEventImpl alloc] initWithGamepadEvent:v4];
    v6 = self;
    objc_sync_enter(v6);
    v7 = self->_eventRemappingActions;
    objc_sync_exit(v6);

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * v12++) + 16))();
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v5 = v4;
  }
  v13.receiver = self;
  v13.super_class = (Class)_GCControllerInputComponent;
  [(_GCDevicePhysicalInputComponent *)&v13 handleGamepadEvent:v5];
}

- (void)setSettingsProfile:(id)a3
{
  id v4 = a3;
  v6 = [(_GCDevicePhysicalInputComponent *)(id *)&self->super.super.isa defaultPhysicalInput];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v4 && (isKindOfClass & 1) != 0)
  {
    -[_GCDevicePhysicalInputComponent defaultPhysicalInputGroup]((id *)&self->super.super.isa);
    id v8 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = -[_GCDevicePhysicalInputGroup queue](v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __50___GCControllerInputComponent_setSettingsProfile___block_invoke;
    block[3] = &unk_26D22B618;
    id v11 = v4;
    uint64_t v12 = self;
    id v13 = v6;
    dispatch_async(v9, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRemappingActions, 0);
  objc_storeStrong((id *)&self->_appliedSettingsProfile, 0);

  objc_storeStrong((id *)&self->_templateElementParameters, 0);
}

@end