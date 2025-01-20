@interface _GCSyntheticDevice
+ (id)devicePropertiesWithDescription:(id)a3;
+ (void)deviceWithDescription:(void *)a3 creator:;
- (BOOL)isEqual:(id)a3;
- (_GCSyntheticDevice)init;
- (id)controllerIdentifier;
- (id)debugDescription;
- (id)description;
- (id)identifier;
- (id)persistentIdentifier;
- (uint64_t)serviceIdentity;
- (unint64_t)hash;
- (void)dealloc;
- (void)initWithIdentifier:(void *)a3 controllerIdentifier:(void *)a4 persistentIdentifier:(int)a5 service:;
@end

@implementation _GCSyntheticDevice

+ (void)deviceWithDescription:(void *)a3 creator:
{
  id v4 = a2;
  v5 = a3;
  v6 = self;
  if (v6 == objc_opt_class())
  {
    [v6 doesNotRecognizeSelector:sel_deviceWithDescription_creator_];
    v15 = 0;
  }
  else
  {
    v7 = [v4 controllerIdentifier];
    v8 = [v7 description];
    v9 = [v6 devicePropertiesWithDescription:v4];
    v10 = [v4 controllerIdentifier];
    [v9 setObject:v10 forKey:@"_GCSyntheticDeviceIdentifier"];

    if (!v9)
    {
      v17 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      [v17 handleFailureInMethod:sel_deviceWithDescription_creator_ object:v6 file:@"_GCSyntheticDevice.m" lineNumber:28 description:@"Assertion failed: deviceProperties != ((void *)0)"];
    }
    int v11 = v5[2](v5, v9);
    if (v11)
    {
      int v12 = v11;
      id v13 = objc_alloc((Class)v6);
      v14 = [v4 persistentIdentifier];
      v15 = -[_GCSyntheticDevice initWithIdentifier:controllerIdentifier:persistentIdentifier:service:](v13, v8, v7, v14, v12);
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void)initWithIdentifier:(void *)a3 controllerIdentifier:(void *)a4 persistentIdentifier:(int)a5 service:
{
  if (!a1) {
    return 0;
  }
  v19.receiver = a1;
  v19.super_class = (Class)_GCSyntheticDevice;
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  int v11 = objc_msgSendSuper2(&v19, sel_init);
  uint64_t v12 = objc_msgSend(v10, "copyWithZone:", 0, v19.receiver, v19.super_class);

  id v13 = (void *)v11[2];
  v11[2] = v12;

  uint64_t v14 = [v9 copyWithZone:0];
  v15 = (void *)v11[3];
  v11[3] = v14;

  uint64_t v16 = [v8 copy];
  v17 = (void *)v11[4];
  v11[4] = v16;

  *((_DWORD *)v11 + 2) = a5;
  return v11;
}

+ (id)devicePropertiesWithDescription:(id)a3
{
  return 0;
}

- (_GCSyntheticDevice)init
{
  return 0;
}

- (void)dealloc
{
  mach_port_deallocate(mach_task_self_, self->_serviceIdentity);
  v3.receiver = self;
  v3.super_class = (Class)_GCSyntheticDevice;
  [(_GCSyntheticDevice *)&v3 dealloc];
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v8 = Property;
    if (v4) {
      id v9 = objc_getProperty(v4, v7, 16, 1);
    }
    else {
      id v9 = 0;
    }
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v10 = [(NSString *)self->_identifier isEqual:v4];
    }
    else {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)identifier
{
  if (result) {
    return objc_getProperty(result, a2, 16, 1);
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ '%@'>", objc_opt_class(), self->_identifier];
}

- (id)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p '%@'>", v4, self, self->_identifier];

  return v5;
}

- (uint64_t)serviceIdentity
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (id)controllerIdentifier
{
  if (result) {
    return objc_getProperty(result, a2, 24, 1);
  }
  return result;
}

- (id)persistentIdentifier
{
  if (result) {
    return objc_getProperty(result, a2, 32, 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_controllerIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end