@interface MPSGraphPackageMLIRLibrary
- (BOOL)optimizedFileExistsWithSignature:(id)a3;
- (BOOL)optimizedNoDeviceFileExistsWithSignature:(id)a3;
- (BOOL)originalFileExists;
- (MPSGraphPackageMLIRLibrary)init;
- (MPSGraphPackageMLIRLibrary)initWithMLIRLibraryDict:(id)a3;
- (id)getCallablesDescription;
- (id)getDict;
- (id)getOptimizedMLIRLibrary;
- (id)getOptimizedNoDeviceMLIRLibrary;
- (id)getOptimizedNoDeviceResourcesUsedLibrary;
- (id)getOptimizedResourcesUsedLibrary;
- (id)getOriginalResourcesUsed;
- (id)getResourceOffsetsLibrary;
- (unint64_t)getResourceStorageMode;
- (void)addOptimizedMLIRFile:(id)a3 withSignature:(id)a4;
- (void)addOptimizedNoDeviceMLIRFile:(id)a3 withSignature:(id)a4;
- (void)addOptimizedNoDeviceResourcesUsed:(id)a3 withSignature:(id)a4;
- (void)addOptimizedResourcesUsed:(id)a3 withSignature:(id)a4;
- (void)addOriginalMLIRFile:(id)a3;
- (void)addOriginalResourcesUsed:(id)a3;
- (void)setCallablesDescription:(id)a3;
- (void)setResourceStorageMode:(unint64_t)a3;
- (void)updateWithMLIRLibrary:(id)a3;
@end

@implementation MPSGraphPackageMLIRLibrary

- (MPSGraphPackageMLIRLibrary)init
{
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphPackageMLIRLibrary;
  v2 = [(MPSGraphPackageMLIRLibrary *)&v11 init];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  mlirLibrary = v2->_mlirLibrary;
  v2->_mlirLibrary = v3;

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableDictionary *)v2->_mlirLibrary setObject:v5 forKeyedSubscript:@"Optimized"];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableDictionary *)v2->_mlirLibrary setObject:v6 forKeyedSubscript:@"Optimized No Device"];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableDictionary *)v2->_mlirLibrary setObject:v7 forKeyedSubscript:@"Optimized Resources Used"];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableDictionary *)v2->_mlirLibrary setObject:v8 forKeyedSubscript:@"Optimized No Device Resources Used"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(NSMutableDictionary *)v2->_mlirLibrary setObject:v9 forKeyedSubscript:@"Resource Offsets"];

  return v2;
}

- (MPSGraphPackageMLIRLibrary)initWithMLIRLibraryDict:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphPackageMLIRLibrary;
  id v5 = [(MPSGraphPackageMLIRLibrary *)&v9 init];
  uint64_t v6 = [v4 mutableCopy];
  mlirLibrary = v5->_mlirLibrary;
  v5->_mlirLibrary = (NSMutableDictionary *)v6;

  return v5;
}

- (id)getOptimizedMLIRLibrary
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized"];
}

- (id)getOptimizedNoDeviceMLIRLibrary
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized No Device"];
}

- (unint64_t)getResourceStorageMode
{
  v2 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Resource Storage Mode"];
  v3 = v2;
  if (v2)
  {
    unint64_t v4 = [v2 unsignedLongLongValue];

    return v4;
  }
  else
  {

    return 0;
  }
}

- (id)getOptimizedResourcesUsedLibrary
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized Resources Used"];
}

- (id)getOriginalResourcesUsed
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Original Resources Used"];
}

- (id)getOptimizedNoDeviceResourcesUsedLibrary
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized No Device Resources Used"];
}

- (id)getResourceOffsetsLibrary
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Resource Offsets"];
}

- (id)getCallablesDescription
{
  return (id)[(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Callables"];
}

- (void)updateWithMLIRLibrary:(id)a3
{
  id v21 = a3;
  unint64_t v4 = [v21 getDict];
  id v5 = [(NSMutableDictionary *)self->_mlirLibrary objectForKey:@"Original"];
  if (v5
    && ([v4 objectForKeyedSubscript:@"Original"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    objc_super v9 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized"];
    v10 = [v4 objectForKeyedSubscript:@"Optimized"];
    [v9 addEntriesFromDictionary:v10];

    objc_super v11 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized No Device"];
    v12 = [v4 objectForKeyedSubscript:@"Optimized No Device"];
    [v11 addEntriesFromDictionary:v12];

    v13 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Resource Storage Mode"];
    [v4 objectForKeyedSubscript:@"Resource Storage Mode"];

    v14 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Resource Storage Mode"];
    v15 = [v4 objectForKeyedSubscript:@"Resource Storage Mode"];

    if (v14 != v15 && MTLReportFailureTypeEnabled()) {
      MTLReportFailure();
    }
    v16 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized Resources Used"];
    v17 = [v4 objectForKeyedSubscript:@"Optimized Resources Used"];
    [v16 addEntriesFromDictionary:v17];

    v18 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Optimized No Device Resources Used"];
    v19 = [v4 objectForKeyedSubscript:@"Optimized No Device Resources Used"];
    [v18 addEntriesFromDictionary:v19];

    mlirLibrary = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Resource Offsets"];
    v20 = [v4 objectForKeyedSubscript:@"Resource Offsets"];
    [mlirLibrary addEntriesFromDictionary:v20];
  }
  else
  {
    id v7 = (NSMutableDictionary *)[v4 mutableCopy];
    mlirLibrary = self->_mlirLibrary;
    self->_mlirLibrary = v7;
  }
}

- (id)getDict
{
  return self->_mlirLibrary;
}

- (BOOL)originalFileExists
{
  v2 = [(NSMutableDictionary *)self->_mlirLibrary objectForKeyedSubscript:@"Original"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)optimizedFileExistsWithSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(MPSGraphPackageMLIRLibrary *)self getOptimizedMLIRLibrary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)optimizedNoDeviceFileExistsWithSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(MPSGraphPackageMLIRLibrary *)self getOptimizedNoDeviceMLIRLibrary];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)addOriginalMLIRFile:(id)a3
{
}

- (void)addOptimizedMLIRFile:(id)a3 withSignature:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(MPSGraphPackageMLIRLibrary *)self getOptimizedMLIRLibrary];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (void)addOptimizedNoDeviceMLIRFile:(id)a3 withSignature:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(MPSGraphPackageMLIRLibrary *)self getOptimizedNoDeviceMLIRLibrary];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (void)setResourceStorageMode:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mlirLibrary, "setObject:forKeyedSubscript:");
}

- (void)setCallablesDescription:(id)a3
{
}

- (void)addOriginalResourcesUsed:(id)a3
{
}

- (void)addOptimizedResourcesUsed:(id)a3 withSignature:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(MPSGraphPackageMLIRLibrary *)self getOptimizedResourcesUsedLibrary];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (void)addOptimizedNoDeviceResourcesUsed:(id)a3 withSignature:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  BOOL v7 = [(MPSGraphPackageMLIRLibrary *)self getOptimizedNoDeviceResourcesUsedLibrary];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (void).cxx_destruct
{
}

@end