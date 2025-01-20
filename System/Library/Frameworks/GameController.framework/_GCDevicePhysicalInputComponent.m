@interface _GCDevicePhysicalInputComponent
- (NSObject)identifier;
- (_GCDevicePhysicalInputComponent)init;
- (_GCDevicePhysicalInputComponent)initWithIdentifier:(id)a3 defaultPhysicalInput:(id)a4;
- (_GCDevicePhysicalInputComponent)initWithIdentifier:(id)a3 physicalInputs:(id)a4;
- (id)_initWithIdentifier:(void *)a3 physicalInputGroup:;
- (id)capture;
- (id)defaultPhysicalInput;
- (id)defaultPhysicalInputGroup;
- (id)device;
- (void)handleGamepadEvent:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setGamepadEventSource:(id)a3;
@end

@implementation _GCDevicePhysicalInputComponent

- (id)_initWithIdentifier:(void *)a3 physicalInputGroup:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithIdentifier_physicalInputGroup_, a1, @"_GCDevicePhysicalInputComponent.m", 24, @"Invalid parameter not satisfying: %s", "identifier != nil");
    }
    v11.receiver = a1;
    v11.super_class = (Class)_GCDevicePhysicalInputComponent;
    a1 = (id *)objc_msgSendSuper2(&v11, sel_init);
    uint64_t v7 = [v5 copyWithZone:0];
    id v8 = a1[3];
    a1[3] = (id)v7;

    objc_storeStrong(a1 + 1, a3);
    -[_GCDevicePhysicalInputGroup setDataSource:]((id *)a1[1], a1);
  }

  return a1;
}

- (_GCDevicePhysicalInputComponent)initWithIdentifier:(id)a3 physicalInputs:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_GCDevicePhysicalInputGroup alloc] initWithPhysicalInputs:v6];

  v9 = (_GCDevicePhysicalInputComponent *)-[_GCDevicePhysicalInputComponent _initWithIdentifier:physicalInputGroup:]((id *)&self->super.isa, v7, v8);
  return v9;
}

- (_GCDevicePhysicalInputComponent)initWithIdentifier:(id)a3 defaultPhysicalInput:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputComponent.m", 39, @"Invalid parameter not satisfying: %s", "physicalInput != nil");
  }
  id v13 = v8;
  v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v10 = [(_GCDevicePhysicalInputComponent *)self initWithIdentifier:v7 physicalInputs:v9];

  return v10;
}

- (_GCDevicePhysicalInputComponent)init
{
  return 0;
}

- (id)defaultPhysicalInputGroup
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)defaultPhysicalInput
{
  if (a1)
  {
    a1 = [(_GCDevicePhysicalInputGroup *)a1[1] defaultPhysicalInput];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)setDevice:(id)a3
{
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)capture
{
  v3 = [_GCDevicePhysicalInputComponent alloc];
  v4 = [(_GCDevicePhysicalInputComponent *)self identifier];
  id v5 = -[_GCDevicePhysicalInputGroup capture]((uint64_t)self->_defaultPhysicalInputGroup);
  id v6 = -[_GCDevicePhysicalInputComponent _initWithIdentifier:physicalInputGroup:]((id *)&v3->super.isa, v4, v5);

  return v6;
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 24, 1);
}

- (id)device
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_gamepadEventObservation, 0);

  objc_storeStrong((id *)&self->_defaultPhysicalInputGroup, 0);
}

- (void)handleGamepadEvent:(id)a3
{
  id v4 = a3;
  id v5 = -[_GCDevicePhysicalInputGroup queue](self->_defaultPhysicalInputGroup);
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __62___GCDevicePhysicalInputComponent_PubSub__handleGamepadEvent___block_invoke;
    v6[3] = &unk_26D22A8E8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)setGamepadEventSource:(id)a3
{
  id v4 = a3;
  if (!-[_GCDevicePhysicalInputGroup isSnapshot]((BOOL)self->_defaultPhysicalInputGroup))
  {
    id gamepadEventObservation = self->_gamepadEventObservation;
    self->_id gamepadEventObservation = 0;

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __65___GCDevicePhysicalInputComponent_PubSub__setGamepadEventSource___block_invoke;
    v8[3] = &__block_descriptor_40_e27_v16__0____GCGamepadEvent__8lu32l8;
    v8[4] = self;
    id v6 = [v4 observeGamepadEvents:v8];
    id v7 = self->_gamepadEventObservation;
    self->_id gamepadEventObservation = v6;
  }
}

@end