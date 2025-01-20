@interface FileLocalXPC
+ (BOOL)supportsSecureCoding;
- (FileLocalXPC)initWithCoder:(id)a3;
- (FileLocalXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FileLocalXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FileLocalXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6 = a3;
  int v13 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FileLocalXPC;
  v7 = [(FileLocalXPC *)&v12 init];
  if (v7)
  {
    v9 = (char *)[v6 fileSystemRepresentation];
    sub_1000D66F8(&v9, &v13, &v10);
    long long v11 = v10;
    long long v10 = 0uLL;
    [(BackendXPC *)v7 setBackend:&v11];
    if (*((void *)&v11 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v11 + 1));
    }
    if (*((void *)&v10 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v10 + 1));
    }
  }

  return v7;
}

- (FileLocalXPC)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FileLocalXPC;
  v5 = [(BackendXPC *)&v13 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file_handle"];
    unsigned __int8 v12 = [v4 decodeBoolForKey:@"is_writable"];
    unsigned __int8 v11 = [v4 decodeBoolForKey:@"is_locked"];
    unsigned int v10 = dup((int)[v6 fileDescriptor]);
    sub_1000D6860(&v10, &v12, (char *)&v11, &v8);
    long long v9 = v8;
    long long v8 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v9, 0);
    if (*((void *)&v9 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v9 + 1));
    }
    if (*((void *)&v8 + 1)) {
      sub_100004944(*((std::__shared_weak_count **)&v8 + 1));
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(BackendXPC *)self backend];
  uint64_t v6 = v9;
  v5 = v10;
  v8.receiver = self;
  v8.super_class = (Class)FileLocalXPC;
  [(BackendXPC *)&v8 encodeWithCoder:v4];
  id v7 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 176))(v6)];
  [v4 encodeObject:v7 forKey:@"file_handle"];
  [v4 encodeBool:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6) forKey:@"is_writable"];
  [v4 encodeBool:sub_10012A790(v6) forKey:@"is_locked"];

  if (v5) {
    sub_100004944(v5);
  }
}

@end