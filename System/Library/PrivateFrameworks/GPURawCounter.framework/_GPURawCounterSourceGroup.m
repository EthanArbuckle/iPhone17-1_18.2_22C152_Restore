@interface _GPURawCounterSourceGroup
- (BOOL)startSampling;
- (BOOL)stopSampling;
- (NSArray)sourceList;
- (NSDictionary)features;
- (NSDictionary)options;
- (NSString)name;
- (_GPURawCounterSourceGroup)initWithAcceleratorPort:(unsigned int)a3;
- (id)subDivideCounterList:(id)a3 withOptions:(id)a4;
- (unint64_t)sampleMarker;
- (unsigned)acceleratorPort;
- (void)dealloc;
- (void)setOptions:(id)a3;
@end

@implementation _GPURawCounterSourceGroup

- (_GPURawCounterSourceGroup)initWithAcceleratorPort:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GPURawCounterSourceGroup;
  result = [(_GPURawCounterSourceGroup *)&v5 init];
  if (result)
  {
    result->_acceleratorPort = a3;
    if (!a3)
    {

      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  io_object_t acceleratorPort = self->_acceleratorPort;
  if (acceleratorPort)
  {
    IOObjectRelease(acceleratorPort);
    self->_io_object_t acceleratorPort = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)_GPURawCounterSourceGroup;
  [(_GPURawCounterSourceGroup *)&v4 dealloc];
}

- (unint64_t)sampleMarker
{
  return 0;
}

- (BOOL)startSampling
{
  return 0;
}

- (BOOL)stopSampling
{
  return 0;
}

- (id)subDivideCounterList:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)sourceList
{
  return self->_sourceList;
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)features
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

@end