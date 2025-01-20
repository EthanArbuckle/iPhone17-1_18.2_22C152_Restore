@interface MPGreenTeaLoggerWrapper
- (MPGreenTeaLoggerWrapper)initWithAccessorName:(id)a3;
- (void)beginLogAccessInterval;
- (void)endLogAccessInterval;
- (void)logAccess;
@end

@implementation MPGreenTeaLoggerWrapper

- (void)logAccess
{
}

- (MPGreenTeaLoggerWrapper)initWithAccessorName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPGreenTeaLoggerWrapper;
  v5 = [(MPGreenTeaLoggerWrapper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F79AE8]) initWithAccessorName:v4];
    logger = v5->_logger;
    v5->_logger = (ML3GreenTeaLogger *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)endLogAccessInterval
{
}

- (void)beginLogAccessInterval
{
}

@end