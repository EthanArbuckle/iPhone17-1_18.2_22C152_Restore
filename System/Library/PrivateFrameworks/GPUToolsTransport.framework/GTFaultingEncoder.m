@interface GTFaultingEncoder
+ (BOOL)supportsSecureCoding;
- (GTFaultingEncoder)initWithCoder:(id)a3;
- (NSData)cpuCallstackData;
- (NSString)metalLogMessage;
- (unsigned)cpuCallstackFramesNum;
- (void)encodeWithCoder:(id)a3;
- (void)setCpuCallstackData:(id)a3;
- (void)setCpuCallstackFramesNum:(unsigned int)a3;
- (void)setMetalLogMessage:(id)a3;
@end

@implementation GTFaultingEncoder

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTFaultingEncoder)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTFaultingEncoder;
  v5 = [(GTFaultingEncoder *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpuCallstackData"];
    cpuCallstackData = v5->_cpuCallstackData;
    v5->_cpuCallstackData = (NSData *)v6;

    v5->_cpuCallstackFramesNum = [v4 decodeInt32ForKey:@"cpuCallstackFramesNum"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalLogMessage"];
    metalLogMessage = v5->_metalLogMessage;
    v5->_metalLogMessage = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  cpuCallstackData = self->_cpuCallstackData;
  id v5 = a3;
  [v5 encodeObject:cpuCallstackData forKey:@"cpuCallstackData"];
  [v5 encodeInt32:self->_cpuCallstackFramesNum forKey:@"cpuCallstackFramesNum"];
  [v5 encodeObject:self->_metalLogMessage forKey:@"metalLogMessage"];
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
  objc_storeStrong((id *)&self->_cpuCallstackData, 0);
}

@end