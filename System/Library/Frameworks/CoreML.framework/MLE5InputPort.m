@interface MLE5InputPort
- (BOOL)boundFeatureDirectly;
- (BOOL)copyFeatureValue:(id)a3 error:(id *)a4;
- (BOOL)prepareForFeatureValue:(id)a3 error:(id *)a4;
- (BOOL)reusableForFeatureValue:(id)a3 willBindDirectly:(BOOL *)a4;
- (MLE5InputPort)initWithPortHandle:(e5rt_io_port *)a3 name:(id)a4 featureDescription:(id)a5;
- (MLE5InputPortBinder)binder;
- (MLPixelBufferPool)pixelBufferPool;
- (NSString)description;
- (NSString)name;
- (e5rt_io_port)portHandle;
- (void)dealloc;
- (void)reset;
- (void)setBinder:(id)a3;
- (void)setPixelBufferPool:(id)a3;
@end

@implementation MLE5InputPort

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binder, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setBinder:(id)a3
{
}

- (MLE5InputPortBinder)binder
{
  return (MLE5InputPortBinder *)objc_getProperty(self, a2, 24, 1);
}

- (e5rt_io_port)portHandle
{
  return self->_portHandle;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)reset
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (e5rt_io_port_bind_buffer_object())
  {
    v3 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = [(MLE5InputPort *)self name];
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_19E58B000, v3, OS_LOG_TYPE_ERROR, "Failed to unbind feature value from %@ port.", buf, 0xCu);
    }
    v4 = (void *)MEMORY[0x1E4F1CA00];
    v5 = [(MLE5InputPort *)self name];
    [v4 raise:*MEMORY[0x1E4F1C3B8], @"Failed to unbind feature value from %@ port.", v5 format];
  }
  v6 = [(MLE5InputPort *)self binder];
  [v6 reset];
}

- (BOOL)copyFeatureValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLE5InputPort *)self binder];
  LOBYTE(a4) = [v7 copyFeatureValue:v6 error:a4];

  return (char)a4;
}

- (BOOL)prepareForFeatureValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLE5InputPort *)self binder];
  LOBYTE(a4) = [v7 bindMemoryObjectForFeatureValue:v6 error:a4];

  return (char)a4;
}

- (BOOL)reusableForFeatureValue:(id)a3 willBindDirectly:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(MLE5InputPort *)self binder];
  LOBYTE(a4) = [v7 reusableForFeatureValue:v6 willBindDirectly:a4];

  return (char)a4;
}

- (MLPixelBufferPool)pixelBufferPool
{
  v2 = [(MLE5InputPort *)self binder];
  v3 = [v2 pixelBufferPool];

  return (MLPixelBufferPool *)v3;
}

- (void)setPixelBufferPool:(id)a3
{
  id v5 = a3;
  v4 = [(MLE5InputPort *)self binder];
  [v4 setPixelBufferPool:v5];
}

- (BOOL)boundFeatureDirectly
{
  v2 = [(MLE5InputPort *)self binder];
  BOOL v3 = [v2 bindingMode] == 1;

  return v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  v4 = [(MLE5InputPort *)self name];
  id v5 = [v3 stringWithFormat:@"<MLE5InputPort: %p> %@", self, v4];

  return (NSString *)v5;
}

- (void)dealloc
{
  if (self->_portHandle)
  {
    e5rt_io_port_bind_buffer_object();
    e5rt_io_port_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)MLE5InputPort;
  [(MLE5InputPort *)&v3 dealloc];
}

- (MLE5InputPort)initWithPortHandle:(e5rt_io_port *)a3 name:(id)a4 featureDescription:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MLE5InputPort;
  uint64_t v10 = [(MLE5InputPort *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_portHandle = a3;
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = [[MLE5InputPortBinder alloc] initWithPort:a3 featureDescription:v9];
    binder = v11->_binder;
    v11->_binder = v14;
  }
  return v11;
}

@end