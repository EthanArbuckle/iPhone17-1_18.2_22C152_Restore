@interface NIExportedObjectForwarder
- (Class)exportedObjectClass;
- (NIExportedObjectForwarder)initWithExportedObject:(id)a3;
- (id)exportedObject;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)setExportedObject:(id)a3;
- (void)setExportedObjectClass:(Class)a3;
@end

@implementation NIExportedObjectForwarder

- (NIExportedObjectForwarder)initWithExportedObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"NIServerConnection.m", 163, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)NIExportedObjectForwarder;
  v6 = [(NIExportedObjectForwarder *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(NIExportedObjectForwarder *)v6 setExportedObject:v5];
    [(NIExportedObjectForwarder *)v7 setExportedObjectClass:objc_opt_class()];
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = [(NIExportedObjectForwarder *)self exportedObjectClass];

  return (id)[(objc_class *)v4 instanceMethodSignatureForSelector:a3];
}

- (id)exportedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_exportedObject);

  return WeakRetained;
}

- (void)setExportedObject:(id)a3
{
}

- (Class)exportedObjectClass
{
  return self->_exportedObjectClass;
}

- (void)setExportedObjectClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObjectClass, 0);

  objc_destroyWeak(&self->_exportedObject);
}

@end