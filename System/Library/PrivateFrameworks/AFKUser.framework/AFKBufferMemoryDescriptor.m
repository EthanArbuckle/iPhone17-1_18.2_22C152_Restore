@interface AFKBufferMemoryDescriptor
+ (id)withManager:(id)a3 capacity:(unint64_t)a4;
+ (id)withManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5;
- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 buffer:(BOOL)a5;
- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5;
- (int)appendBytes:(const void *)a3 withSize:(unint64_t)a4;
- (int)assumeControlWithOffset:(unint64_t)a3 andSize:(unint64_t)a4;
- (int)releaseControl:(BOOL)a3 withOffset:(unint64_t)a4 andSize:(unint64_t)a5;
- (void)getBytesNoCopy:(unint64_t)a3 withSize:(unint64_t)a4;
@end

@implementation AFKBufferMemoryDescriptor

+ (id)withManager:(id)a3 capacity:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[AFKBufferMemoryDescriptor alloc] initWithManager:v5 capacity:a4 buffer:1];

  return v6;
}

- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 buffer:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!v5) {
    goto LABEL_5;
  }
  v12.receiver = self;
  v12.super_class = (Class)AFKBufferMemoryDescriptor;
  v9 = [(AFKMemoryDescriptor *)&v12 initWithManager:v8 capacity:a4 buffer:1];
  if (!v9)
  {
    self = 0;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  self = v9;
  v10 = self;
LABEL_6:

  return v10;
}

+ (id)withManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [[AFKBufferMemoryDescriptor alloc] initWithManager:v7 capacity:a4 token:a5];

  return v8;
}

- (AFKBufferMemoryDescriptor)initWithManager:(id)a3 capacity:(unint64_t)a4 token:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AFKBufferMemoryDescriptor;
  BOOL v5 = [(AFKMemoryDescriptor *)&v9 initWithManager:a3 capacity:a4 token:a5];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }

  return v6;
}

- (int)assumeControlWithOffset:(unint64_t)a3 andSize:(unint64_t)a4
{
  kern_return_t v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t input[4];

  input[3] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  input[1] = a3;
  input[2] = a4;
  id v7 = [(AFKMemoryDescriptor *)self manager];
  id v8 = IOConnectCallScalarMethod([v7 connect], 6u, input, 3u, 0, 0);

  if (v8)
  {
    v10 = _AFKUserLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[AFKBufferMemoryDescriptor assumeControlWithOffset:andSize:]((uint64_t)&v11, [(AFKMemoryDescriptor *)self regID], v8);
    }
  }
  return v8;
}

- (int)releaseControl:(BOOL)a3 withOffset:(unint64_t)a4 andSize:(unint64_t)a5
{
  kern_return_t v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t input[5];

  BOOL v7 = a3;
  input[4] = *MEMORY[0x1E4F143B8];
  input[0] = [(AFKMemoryDescriptor *)self token];
  input[1] = v7;
  input[2] = a4;
  input[3] = a5;
  objc_super v9 = [(AFKMemoryDescriptor *)self manager];
  v10 = IOConnectCallScalarMethod([v9 connect], 7u, input, 4u, 0, 0);

  if (v10)
  {
    objc_super v12 = _AFKUserLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AFKBufferMemoryDescriptor releaseControl:withOffset:andSize:]((uint64_t)&v13, [(AFKMemoryDescriptor *)self regID], v10);
    }
  }
  return v10;
}

- (void)getBytesNoCopy:(unint64_t)a3 withSize:(unint64_t)a4
{
  if (__CFADD__(a3, a4) || a3 + a4 > [(AFKMemoryDescriptor *)self length]) {
    return 0;
  }
  else {
    return [(AFKMemoryDescriptor *)self buffer] + a3;
  }
}

- (int)appendBytes:(const void *)a3 withSize:(unint64_t)a4
{
  int v7 = -536870181;
  unint64_t v8 = [(AFKMemoryDescriptor *)self length];
  unint64_t v9 = v8 + a4;
  if (__CFADD__(v8, a4)) {
    return -536870168;
  }
  unint64_t v10 = v8;
  if (v9 <= [(AFKMemoryDescriptor *)self capacity])
  {
    [(AFKMemoryDescriptor *)self setLength:v9];
    int v7 = [(AFKBufferMemoryDescriptor *)self assumeControlWithOffset:v10 andSize:a4];
    if (!v7) {
      memcpy([(AFKMemoryDescriptor *)self buffer] + v10, a3, a4);
    }
  }
  return v7;
}

- (void)assumeControlWithOffset:(int)a3 andSize:.cold.1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0(a1, a2, a3, 3.8521e-34);
  _os_log_error_impl(&dword_1DB6F4000, v4, OS_LOG_TYPE_ERROR, "0x%llx: kAssumeSubrangeMethod:0x%x", v3, 0x12u);
}

- (void)releaseControl:(uint64_t)a1 withOffset:(uint64_t)a2 andSize:(int)a3 .cold.1(uint64_t a1, uint64_t a2, int a3)
{
  OUTLINED_FUNCTION_0(a1, a2, a3, 3.8521e-34);
  _os_log_error_impl(&dword_1DB6F4000, v4, OS_LOG_TYPE_ERROR, "0x%llx: kReleaseSubrangeMethod:0x%x", v3, 0x12u);
}

@end