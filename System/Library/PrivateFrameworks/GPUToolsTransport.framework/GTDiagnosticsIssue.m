@interface GTDiagnosticsIssue
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultLibrary;
- (GTDiagnosticsIssue)initWithCoder:(id)a3;
- (NSArray)callstack;
- (NSData)cpuCallstackData;
- (NSData)libraryOfflineSource;
- (NSString)libraryHash;
- (NSString)libraryOnlineSource;
- (NSString)metalFunctionName;
- (NSString)metalLogMessage;
- (NSURL)metalFunctionFile;
- (unsigned)cpuCallstackFramesNum;
- (void)encodeWithCoder:(id)a3;
- (void)setCallstack:(id)a3;
- (void)setCpuCallstackData:(id)a3;
- (void)setCpuCallstackFramesNum:(unsigned int)a3;
- (void)setIsDefaultLibrary:(BOOL)a3;
- (void)setLibraryHash:(id)a3;
- (void)setLibraryOfflineSource:(id)a3;
- (void)setLibraryOnlineSource:(id)a3;
- (void)setMetalFunctionFile:(id)a3;
- (void)setMetalFunctionName:(id)a3;
- (void)setMetalLogMessage:(id)a3;
@end

@implementation GTDiagnosticsIssue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTDiagnosticsIssue)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GTDiagnosticsIssue;
  v5 = [(GTDiagnosticsIssue *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"callstack"];
    callstack = v5->_callstack;
    v5->_callstack = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpuCallstackData"];
    cpuCallstackData = v5->_cpuCallstackData;
    v5->_cpuCallstackData = (NSData *)v8;

    v5->_cpuCallstackFramesNum = [v4 decodeInt32ForKey:@"cpuCallstackFramesNum"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryOnlineSource"];
    libraryOnlineSource = v5->_libraryOnlineSource;
    v5->_libraryOnlineSource = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryOfflineSource"];
    libraryOfflineSource = v5->_libraryOfflineSource;
    v5->_libraryOfflineSource = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryHash"];
    libraryHash = v5->_libraryHash;
    v5->_libraryHash = (NSString *)v14;

    v5->_isDefaultLibrary = [v4 decodeBoolForKey:@"isDefaultLibrary"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalFunctionName"];
    metalFunctionName = v5->_metalFunctionName;
    v5->_metalFunctionName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalFunctionFile"];
    metalFunctionFile = v5->_metalFunctionFile;
    v5->_metalFunctionFile = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalLogMessage"];
    metalLogMessage = v5->_metalLogMessage;
    v5->_metalLogMessage = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  callstack = self->_callstack;
  id v5 = a3;
  [v5 encodeObject:callstack forKey:@"callstack"];
  [v5 encodeObject:self->_cpuCallstackData forKey:@"cpuCallstackData"];
  [v5 encodeInt32:self->_cpuCallstackFramesNum forKey:@"cpuCallstackFramesNum"];
  [v5 encodeObject:self->_libraryOnlineSource forKey:@"libraryOnlineSource"];
  [v5 encodeObject:self->_libraryOfflineSource forKey:@"libraryOfflineSource"];
  [v5 encodeObject:self->_libraryHash forKey:@"libraryHash"];
  [v5 encodeBool:self->_isDefaultLibrary forKey:@"isDefaultLibrary"];
  [v5 encodeObject:self->_metalFunctionName forKey:@"metalFunctionName"];
  [v5 encodeObject:self->_metalFunctionFile forKey:@"metalFunctionFile"];
  [v5 encodeObject:self->_metalLogMessage forKey:@"metalLogMessage"];
}

- (NSArray)callstack
{
  return self->_callstack;
}

- (void)setCallstack:(id)a3
{
}

- (NSData)cpuCallstackData
{
  return self->_cpuCallstackData;
}

- (void)setCpuCallstackData:(id)a3
{
}

- (unsigned)cpuCallstackFramesNum
{
  return self->_cpuCallstackFramesNum;
}

- (void)setCpuCallstackFramesNum:(unsigned int)a3
{
  self->_cpuCallstackFramesNum = a3;
}

- (NSString)libraryOnlineSource
{
  return self->_libraryOnlineSource;
}

- (void)setLibraryOnlineSource:(id)a3
{
}

- (NSData)libraryOfflineSource
{
  return self->_libraryOfflineSource;
}

- (void)setLibraryOfflineSource:(id)a3
{
}

- (NSString)libraryHash
{
  return self->_libraryHash;
}

- (void)setLibraryHash:(id)a3
{
}

- (BOOL)isDefaultLibrary
{
  return self->_isDefaultLibrary;
}

- (void)setIsDefaultLibrary:(BOOL)a3
{
  self->_isDefaultLibrary = a3;
}

- (NSString)metalFunctionName
{
  return self->_metalFunctionName;
}

- (void)setMetalFunctionName:(id)a3
{
}

- (NSURL)metalFunctionFile
{
  return self->_metalFunctionFile;
}

- (void)setMetalFunctionFile:(id)a3
{
}

- (NSString)metalLogMessage
{
  return self->_metalLogMessage;
}

- (void)setMetalLogMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLogMessage, 0);
  objc_storeStrong((id *)&self->_metalFunctionFile, 0);
  objc_storeStrong((id *)&self->_metalFunctionName, 0);
  objc_storeStrong((id *)&self->_libraryHash, 0);
  objc_storeStrong((id *)&self->_libraryOfflineSource, 0);
  objc_storeStrong((id *)&self->_libraryOnlineSource, 0);
  objc_storeStrong((id *)&self->_cpuCallstackData, 0);
  objc_storeStrong((id *)&self->_callstack, 0);
}

@end