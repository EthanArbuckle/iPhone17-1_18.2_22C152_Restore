@interface _GCFusedLogicalDevice
- (_GCFusedLogicalDevice)init;
- (_GCFusedLogicalDevice)initWithPrimaryPhysicalDevice:(id)a3 secondaryPhysicalDevice:(id)a4 configuration:(id)a5 manager:(id)a6;
- (_GCPhysicalDevice)secondaryDevice;
- (id)_makeControllerGamepadEventSource;
- (id)underlyingDevices;
@end

@implementation _GCFusedLogicalDevice

- (_GCFusedLogicalDevice)initWithPrimaryPhysicalDevice:(id)a3 secondaryPhysicalDevice:(id)a4 configuration:(id)a5 manager:(id)a6
{
  v10 = (_GCPhysicalDevice *)a4;
  v14.receiver = self;
  v14.super_class = (Class)_GCFusedLogicalDevice;
  v11 = [(_GCDefaultLogicalDevice *)&v14 initWithPhysicalDevice:a3 configuration:a5 manager:a6];
  secondaryDevice = v11->_secondaryDevice;
  v11->_secondaryDevice = v10;

  return v11;
}

- (_GCFusedLogicalDevice)init
{
  return 0;
}

- (id)underlyingDevices
{
  v8.receiver = self;
  v8.super_class = (Class)_GCFusedLogicalDevice;
  v3 = [(_GCDefaultLogicalDevice *)&v8 underlyingDevices];
  v4 = v3;
  if (self->_secondaryDevice)
  {
    objc_msgSend(v3, "setByAddingObject:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)_makeControllerGamepadEventSource
{
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v3 = [(_GCDefaultLogicalDevice *)self underlyingDevice];
  v4 = [v3 components];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v10 conformsToProtocol:&unk_26D292F88])
        {
          id v11 = v10;

          unint64_t v7 = (unint64_t)v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v12 = [(_GCFusedLogicalDevice *)self secondaryDevice];
  v13 = [v12 components];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        if ([v19 conformsToProtocol:&unk_26D292F88])
        {
          id v20 = v19;

          unint64_t v16 = (unint64_t)v20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v15);
  }
  else
  {
    unint64_t v16 = 0;
  }

  if (!(v7 | v16))
  {
    v21 = 0;
    goto LABEL_35;
  }
  if (v7 && !v16)
  {
    v22 = (void *)v7;
LABEL_31:
    v21 = [v22 gamepadEventSource];
    goto LABEL_35;
  }
  if (!v7 && v16)
  {
    v22 = (void *)v16;
    goto LABEL_31;
  }
  v23 = [(id)v7 gamepadEventSource];
  v24 = [(id)v16 gamepadEventSource];
  v25 = [[_GCGamepadEventFusionConfig alloc] initWithSourceCount:2];
  for (uint64_t k = 0; k != 47; ++k)
  {
    [(_GCGamepadEventFusionConfig *)v25 setPassRule:2 forElement:k forSourceAtIndex:0];
    [(_GCGamepadEventFusionConfig *)v25 setPassRule:2 forElement:k forSourceAtIndex:1];
  }
  v27 = [_GCGamepadEventFusionDescription alloc];
  v38[0] = v23;
  v38[1] = v24;
  v28 = +[NSArray arrayWithObjects:v38 count:2];
  v21 = [(_GCGamepadEventFusionDescription *)v27 initWithConfiguration:v25 sources:v28];

LABEL_35:

  return v21;
}

- (_GCPhysicalDevice)secondaryDevice
{
  return self->_secondaryDevice;
}

- (void).cxx_destruct
{
}

@end