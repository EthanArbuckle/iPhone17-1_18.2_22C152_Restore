@interface GCDevicePhysicalInputViewDescription
- (BOOL)validate:(id *)a3;
- (GCDevicePhysicalInputViewDescription)init;
- (id)valueForUndefinedKey:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation GCDevicePhysicalInputViewDescription

- (GCDevicePhysicalInputViewDescription)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCDevicePhysicalInputViewDescription;
  return [(GCDevicePhysicalInputViewDescription *)&v3 init];
}

- (BOOL)validate:(id *)a3
{
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_additionalConfiguration valueForKey:a3];
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  additionalConfiguration = self->_additionalConfiguration;
  if (!additionalConfiguration)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_additionalConfiguration;
    self->_additionalConfiguration = v8;

    additionalConfiguration = self->_additionalConfiguration;
  }
  [(NSMutableDictionary *)additionalConfiguration setValue:v10 forUndefinedKey:v6];
}

- (void).cxx_destruct
{
}

@end