@interface MLDefaultCustomLayerFactory
- (id)createCustomLayer:(id)a3 withParameters:(id)a4 error:(id *)a5;
@end

@implementation MLDefaultCustomLayerFactory

- (id)createCustomLayer:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v7 = (NSString *)a3;
  id v8 = a4;
  Class v9 = NSClassFromString(v7);
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F28E78] stringWithCapacity:50];
    [v11 appendString:@"A Core ML custom neural network layer requires an implementation named '"];
    [v11 appendString:v7];
    [v11 appendString:@"' which was not found in the global namespace."];
    v12 = +[MLLogging coreChannel];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = [(NSString *)v7 UTF8String];
    v13 = "A Core ML custom neural network layer requires an implementation named '%s' which was not found in the global namespace.";
LABEL_14:
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    goto LABEL_7;
  }
  if ([(objc_class *)v9 conformsToProtocol:&unk_1EF12FA70])
  {
    v10 = (void *)[objc_alloc(NSClassFromString(v7)) initWithParameterDictionary:v8 error:a5];
    goto LABEL_10;
  }
  v11 = [MEMORY[0x1E4F28E78] stringWithCapacity:50];
  [v11 appendString:@"A custom neural network layer implementation class named '"];
  [v11 appendString:v7];
  [v11 appendString:@"' does not conform to the MLCustomLayer protocol."];
  v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = [(NSString *)v7 UTF8String];
    v13 = "A Core ML custom neural network layer implementation class named '%s' does not conform to the MLCustomLayer protocol.";
    goto LABEL_14;
  }
LABEL_7:

  if (a5)
  {
    *a5 = +[MLModelErrorUtils errorWithCode:4, @"%@", v11 format];
  }

  v10 = 0;
LABEL_10:

  return v10;
}

@end