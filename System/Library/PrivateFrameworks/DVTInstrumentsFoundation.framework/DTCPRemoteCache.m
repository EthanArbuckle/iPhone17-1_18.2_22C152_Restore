@interface DTCPRemoteCache
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)kindToString:(int64_t)a3;
+ (id)sharedDTCPRemoteCache;
- (BOOL)accessFileKind:(int64_t)a3 device:(id)a4 fileType:(id)a5 block:(id)a6;
- (DTCPRemoteCache)init;
- (id)_directoryForDevice:(id)a3;
- (id)_filePathForKind:(int64_t)a3 fileType:(id)a4 directoryURL:(id)a5;
- (void)dealloc;
@end

@implementation DTCPRemoteCache

+ (id)sharedDTCPRemoteCache
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2308E80C8;
  block[3] = &unk_264B8EFE8;
  block[4] = a1;
  if (qword_268708040 != -1) {
    dispatch_once(&qword_268708040, block);
  }
  v2 = (void *)qword_268708038;
  return v2;
}

+ (id)kindToString:(int64_t)a3
{
  v3 = @"unknown";
  if (a3 == 1) {
    v3 = @"kpep";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"trace";
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (DTCPRemoteCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)DTCPRemoteCache;
  v2 = [(DTCPRemoteCache *)&v10 init];
  if (v2)
  {
    v2->_locks = (id *)malloc_type_calloc(2uLL, 8uLL, 0x80040B8603338uLL);
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    locks = v2->_locks;
    v5 = *locks;
    *locks = v3;

    dispatch_semaphore_t v6 = dispatch_semaphore_create(1);
    v7 = v2->_locks;
    id v8 = v7[1];
    v7[1] = v6;
  }
  return v2;
}

- (void)dealloc
{
  locks = self->_locks;
  id v4 = *locks;
  id *locks = 0;

  v5 = self->_locks;
  id v6 = v5[1];
  v5[1] = 0;

  v7 = self->_locks;
  if (v7)
  {
    free(v7);
    self->_locks = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)DTCPRemoteCache;
  [(DTCPRemoteCache *)&v8 dealloc];
}

- (id)_directoryForDevice:(id)a3
{
  dispatch_semaphore_t v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v6 = [v5 URLsForDirectory:13 inDomains:1];
  if ([v6 count])
  {
    v7 = [v6 objectAtIndex:0];
    objc_super v8 = [v7 URLByAppendingPathComponent:@"com.apple.dt.Instruments/device_cache"];
  }
  else
  {
    objc_super v8 = [NSURL fileURLWithPath:@"/tmp/instruments_device_cache"];
  }
  v9 = [v8 URLByAppendingPathComponent:v4];

  return v9;
}

- (id)_filePathForKind:(int64_t)a3 fileType:(id)a4 directoryURL:(id)a5
{
  v7 = NSString;
  id v8 = a5;
  id v9 = a4;
  objc_super v10 = +[DTCPRemoteCache kindToString:a3];
  v11 = [v7 stringWithFormat:@"%@.%@", v10, v9];

  v12 = [v8 URLByAppendingPathComponent:v11];

  return v12;
}

- (BOOL)accessFileKind:(int64_t)a3 device:(id)a4 fileType:(id)a5 block:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (uint64_t (**)(id, void *, uint64_t))a6;
  v22 = v10;
  v13 = [(DTCPRemoteCache *)self _directoryForDevice:v10];
  v14 = [(DTCPRemoteCache *)self _filePathForKind:a3 fileType:v11 directoryURL:v13];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_locks[a3], 0xFFFFFFFFFFFFFFFFLL);
  v15 = [MEMORY[0x263F08850] defaultManager];
  v16 = [v13 path];
  id v23 = 0;
  LODWORD(a6) = [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v23];
  id v17 = v23;

  v18 = [v14 path];
  if (a6)
  {
    uint64_t v19 = [v15 fileExistsAtPath:v18];

    char v20 = v12[2](v12, v14, v19);
  }
  else
  {
    NSLog(&cfstr_FailedToCreate_2.isa, v18);

    char v20 = 0;
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_locks[a3]);
  return v20;
}

@end