@interface GCRacingWheel
+ (NSSet)connectedRacingWheels;
- (BOOL)acquireDeviceWithError:(NSError *)error;
- (BOOL)isAcquired;
- (BOOL)isSnapshot;
- (GCPhysicalInputProfile)physicalInputProfile;
- (GCRacingWheel)capture;
- (GCRacingWheel)init;
- (GCRacingWheel)initWithComponents:(id)a3;
- (GCRacingWheel)initWithIdentifier:(id)a3 components:(id)a4;
- (GCRacingWheelInput)wheelInput;
- (NSCopying)identifier;
- (NSString)productCategory;
- (NSString)vendorName;
- (OS_dispatch_queue)handlerQueue;
- (id)_componentWithProtocol:(void *)a1;
- (id)components;
- (void)setComponents:(void *)a1;
- (void)setHandlerQueue:(id)a3;
@end

@implementation GCRacingWheel

- (GCRacingWheel)initWithIdentifier:(id)a3 components:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GCRacingWheel;
  id v4 = a4;
  v5 = [(GCRacingWheel *)&v8 init];
  objc_storeStrong((id *)&v5->_handlerQueue, &_dispatch_main_q);
  components = v5->_components;
  v5->_components = (NSArray *)&__NSArray0__struct;

  -[GCRacingWheel setComponents:](v5, v4);
  return v5;
}

- (void)setComponents:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = [v3 differenceFromArray:a1[3]];
    v6 = [v5 insertions];

    v7 = [v4 differenceFromArray:a1[3]];
    objc_super v8 = [v7 removals];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v31 + 1) + 8 * i) object];
          [v14 setDevice:0];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }
    v25 = v9;

    v26 = v4;
    objc_setProperty(a1, sel_setComponents_, 24, v4, 1, 1);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v27 + 1) + 8 * j) object];
          [v20 setDevice:a1];
          if (objc_opt_respondsToSelector()) {
            [v20 setDispatchQueue:a1[1]];
          }
          char v21 = [v20 conformsToProtocol:&unk_26D2992E8];
          v22 = a1 + 4;
          if ((v21 & 1) != 0
            || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v22 = a1 + 5, (isKindOfClass & 1) != 0))
          {
            void *v22 = v20;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v17);
    }

    if (!a1[5])
    {
      v24 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v24 handleFailureInMethod:sel_setComponents_ object:a1 file:@"GCRacingWheel.m" lineNumber:92 description:@"Missing required <GCDevicePhysicalInput> component."];
    }
    id v4 = v26;
  }
}

- (GCRacingWheel)initWithComponents:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  v6 = [(GCRacingWheel *)self initWithIdentifier:v5 components:v4];

  return v6;
}

- (GCRacingWheel)init
{
  return 0;
}

- (id)components
{
  if (a1)
  {
    a1 = objc_getProperty(a1, sel_components, 24, 1);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_componentWithProtocol:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = -[GCRacingWheel components](a1);
    id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_super v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v8, "conformsToProtocol:", v3, (void)v10))
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)acquireDeviceWithError:(NSError *)error
{
  return 0;
}

- (BOOL)isAcquired
{
  return 0;
}

- (void)setHandlerQueue:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_handlerQueue, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = -[GCRacingWheel components](self);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "setDispatchQueue:", v5, (void)v12);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (NSString)vendorName
{
  v2 = -[GCRacingWheel _componentWithProtocol:](self, &unk_26D2992E8);
  id v3 = [v2 vendorName];

  return (NSString *)v3;
}

- (NSString)productCategory
{
  v2 = -[GCRacingWheel _componentWithProtocol:](self, &unk_26D2992E8);
  id v3 = [v2 productCategory];
  id v4 = v3;
  if (!v3) {
    id v3 = @"Racing Wheel";
  }
  id v5 = v3;

  return v5;
}

- (GCPhysicalInputProfile)physicalInputProfile
{
  id v2 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"-physicalInputProfile is not supported on GCRacingWheel.  Use -wheelInput instead." userInfo:0];
  objc_exception_throw(v2);
}

- (GCRacingWheelInput)wheelInput
{
  id v2 = [(_GCDevicePhysicalInputComponent *)(id *)&self->_input->super.isa defaultPhysicalInput];
  id v3 = -[_GCDevicePhysicalInputBase facade]((uint64_t)v2);

  return (GCRacingWheelInput *)v3;
}

- (GCRacingWheel)capture
{
  id v2 = -[GCRacingWheel components](self);
  id v3 = objc_msgSend(v2, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 1, &__block_literal_global_43);

  id v4 = (unsigned char *)[objc_alloc((Class)objc_opt_class()) initWithComponents:v3];
  v4[48] = 1;

  return (GCRacingWheel *)v4;
}

id __24__GCRacingWheel_capture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 capture];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (NSSet)connectedRacingWheels
{
  return +[NSSet set];
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (BOOL)isSnapshot
{
  return self->_isSnapshot;
}

- (NSCopying)identifier
{
  return (NSCopying *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end