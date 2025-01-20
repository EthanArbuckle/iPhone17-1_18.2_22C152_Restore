@interface _CPLWeakLibraryManager
- (CPLLibraryManager)weakLibraryManager;
- (_CPLWeakLibraryManager)initWithLibraryManager:(id)a3;
- (void)setWeakLibraryManager:(id)a3;
@end

@implementation _CPLWeakLibraryManager

- (void).cxx_destruct
{
}

- (void)setWeakLibraryManager:(id)a3
{
}

- (CPLLibraryManager)weakLibraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakLibraryManager);
  return (CPLLibraryManager *)WeakRetained;
}

- (_CPLWeakLibraryManager)initWithLibraryManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_CPLWeakLibraryManager;
  v5 = [(_CPLWeakLibraryManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_weakLibraryManager, v4);
  }

  return v6;
}

@end