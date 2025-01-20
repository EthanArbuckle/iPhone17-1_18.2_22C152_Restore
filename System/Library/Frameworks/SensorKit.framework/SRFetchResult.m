@interface SRFetchResult
+ (SRFetchResult)new;
+ (void)initialize;
- (Class)sampleClass;
- (NSData)sampleData;
- (NSDictionary)configuration;
- (NSDictionary)metadata;
- (SRAbsoluteTime)timestamp;
- (SRCursor)_cursor;
- (SRFetchResult)init;
- (SRFetchResult)initWithBytes:(void *)a3 length:(unint64_t)a4 timestamp:(double)a5 metadata:(id)a6 configuration:(id)a7 cursor:(id)a8 sampleClass:(Class)a9;
- (SRFetchResult)initWithData:(id)a3 timestamp:(double)a4 metadata:(id)a5 configuration:(id)a6 cursor:(id)a7 sampleClass:(Class)a8;
- (id)_sensorConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sample;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSampleClass:(Class)a3;
- (void)setSampleData:(id)a3;
- (void)set_cursor:(id)a3;
@end

@implementation SRFetchResult

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogFetchRequest = (uint64_t)os_log_create("com.apple.SensorKit", "SRFetchRequest");
  }
}

- (SRFetchResult)init
{
  return 0;
}

+ (SRFetchResult)new
{
  return 0;
}

- (SRFetchResult)initWithData:(id)a3 timestamp:(double)a4 metadata:(id)a5 configuration:(id)a6 cursor:(id)a7 sampleClass:(Class)a8
{
  v17.receiver = self;
  v17.super_class = (Class)SRFetchResult;
  v14 = [(SRFetchResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_timestamp = a4;
    v14->_sampleData = (NSData *)a3;
    v15->_metadata = (NSDictionary *)a5;
    v15->_configuration = (NSDictionary *)a6;
    v15->_sampleClass = a8;
    v15->__cursor = (SRCursor *)a7;
  }
  return v15;
}

- (SRFetchResult)initWithBytes:(void *)a3 length:(unint64_t)a4 timestamp:(double)a5 metadata:(id)a6 configuration:(id)a7 cursor:(id)a8 sampleClass:(Class)a9
{
  v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  v16 = [(SRFetchResult *)self initWithData:v15 timestamp:a6 metadata:a7 configuration:a8 cursor:a9 sampleClass:a5];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(NSData *)self->_sampleData copy];
  v5 = [[SRFetchResult alloc] initWithData:v4 timestamp:self->_metadata metadata:self->_configuration configuration:self->__cursor cursor:self->_sampleClass sampleClass:self->_timestamp];

  return v5;
}

- (void)dealloc
{
  [(SRFetchResult *)self setSampleClass:0];
  [(SRFetchResult *)self setMetadata:0];
  [(SRFetchResult *)self setConfiguration:0];
  [(SRFetchResult *)self setSampleClass:0];
  [(SRFetchResult *)self setSampleData:0];
  [(SRFetchResult *)self set_cursor:0];
  v3.receiver = self;
  v3.super_class = (Class)SRFetchResult;
  [(SRFetchResult *)&v3 dealloc];
}

- (id)sample
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  sampleClass = self->_sampleClass;
  if (!sampleClass)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRFetchResult.m", 98, @"Failed to find a sample class to construct the sample");
    sampleClass = self->_sampleClass;
    if (!sampleClass)
    {
      v6 = (void *)MEMORY[0x263EFF940];
      uint64_t v7 = *MEMORY[0x263EFF498];
      v8 = @"Failed to find a sample class to construct the sample object";
      uint64_t v9 = 0;
      goto LABEL_11;
    }
  }
  v4 = (void *)[[sampleClass alloc] initWithBinarySampleRepresentation:self->_sampleData metadata:self->_metadata timestamp:self->_timestamp];
  if (!v4)
  {
    v10 = NSStringFromClass(self->_sampleClass);
    v11 = SRLogFetchRequest;
    if (os_log_type_enabled((os_log_t)SRLogFetchRequest, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v17 = v10;
      _os_log_fault_impl(&dword_21FCA3000, v11, OS_LOG_TYPE_FAULT, "Failed to instantiate a sample of type %{public}@ with the given data", buf, 0xCu);
    }
    v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF498];
    v14 = @"SRSampleClass";
    v15 = v10;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v8 = @"Unable to construct a sample object";
    v6 = v12;
    uint64_t v7 = v13;
LABEL_11:
    objc_exception_throw((id)[v6 exceptionWithName:v7 reason:v8 userInfo:v9]);
  }

  return v4;
}

- (id)_sensorConfiguration
{
  return self->_configuration;
}

- (SRAbsoluteTime)timestamp
{
  return self->_timestamp;
}

- (NSData)sampleData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSampleData:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (Class)sampleClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (void)setSampleClass:(Class)a3
{
}

- (SRCursor)_cursor
{
  return self->__cursor;
}

- (void)set_cursor:(id)a3
{
}

@end