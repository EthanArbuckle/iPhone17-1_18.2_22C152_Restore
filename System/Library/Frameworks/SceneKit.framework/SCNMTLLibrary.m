@interface SCNMTLLibrary
- (MTLLibrary)library;
- (SCNMTLLibrary)initWithPath:(id)a3 manager:(id)a4;
- (void)_load;
- (void)dealloc;
@end

@implementation SCNMTLLibrary

- (MTLLibrary)library
{
  return self->_library;
}

- (SCNMTLLibrary)initWithPath:(id)a3 manager:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCNMTLLibrary;
  v6 = [(SCNMTLLibrary *)&v9 init];
  if (v6)
  {
    if (a3) {
      v7 = (NSURL *)(id)[NSURL fileURLWithPath:a3];
    }
    else {
      v7 = 0;
    }
    v6->_libraryURL = v7;
    v6->_manager = (SCNMTLLibraryManager *)a4;
    [(SCNMTLLibrary *)v6 _load];
  }
  return v6;
}

- (void)_load
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: FATAL ERROR : failed to load Metal shaders library %@, %@");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLLibrary;
  [(SCNMTLLibrary *)&v3 dealloc];
}

@end