@interface CPLProcessSpecification
+ (id)baseProcessSpecification;
+ (id)priviledgedProcessSpecification;
+ (id)signalProcessSpecification;
- (BOOL)requiresRoot;
- (BOOL)shouldRunMemoryTools;
- (BOOL)shouldRunTaskInfo;
- (BOOL)shouldSample;
- (BOOL)shouldSignal;
- (CPLProcessSpecification)initWithShouldSignal:(BOOL)a3 shouldSample:(BOOL)a4 shouldRunMemoryTools:(BOOL)a5 shouldRunTaskInfo:(BOOL)a6 requiresRoot:(BOOL)a7;
- (NSString)defaultsDomain;
- (id)addDefaultsDomain:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setRequiresRoot:(BOOL)a3;
- (void)setShouldRunMemoryTools:(BOOL)a3;
- (void)setShouldRunTaskInfo:(BOOL)a3;
- (void)setShouldSample:(BOOL)a3;
- (void)setShouldSignal:(BOOL)a3;
@end

@implementation CPLProcessSpecification

- (CPLProcessSpecification)initWithShouldSignal:(BOOL)a3 shouldSample:(BOOL)a4 shouldRunMemoryTools:(BOOL)a5 shouldRunTaskInfo:(BOOL)a6 requiresRoot:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)CPLProcessSpecification;
  result = [(CPLProcessSpecification *)&v13 init];
  if (result)
  {
    result->_shouldSignal = a3;
    result->_shouldSample = a4;
    result->_shouldRunMemoryTools = a5;
    result->_shouldRunTaskInfo = a6;
    result->_requiresRoot = a7;
  }
  return result;
}

+ (id)baseProcessSpecification
{
  id v2 = [objc_alloc((Class)a1) initWithShouldSignal:0 shouldSample:1 shouldRunMemoryTools:1 shouldRunTaskInfo:1 requiresRoot:0];
  return v2;
}

+ (id)priviledgedProcessSpecification
{
  id v2 = [objc_alloc((Class)a1) initWithShouldSignal:0 shouldSample:1 shouldRunMemoryTools:1 shouldRunTaskInfo:1 requiresRoot:1];
  return v2;
}

+ (id)signalProcessSpecification
{
  id v2 = [objc_alloc((Class)a1) initWithShouldSignal:1 shouldSample:1 shouldRunMemoryTools:1 shouldRunTaskInfo:1 requiresRoot:0];
  return v2;
}

- (id)addDefaultsDomain:(id)a3
{
  return self;
}

- (BOOL)shouldSignal
{
  return self->_shouldSignal;
}

- (void)setShouldSignal:(BOOL)a3
{
  self->_shouldSignal = a3;
}

- (BOOL)shouldSample
{
  return self->_shouldSample;
}

- (void)setShouldSample:(BOOL)a3
{
  self->_shouldSample = a3;
}

- (BOOL)shouldRunMemoryTools
{
  return self->_shouldRunMemoryTools;
}

- (void)setShouldRunMemoryTools:(BOOL)a3
{
  self->_shouldRunMemoryTools = a3;
}

- (BOOL)shouldRunTaskInfo
{
  return self->_shouldRunTaskInfo;
}

- (void)setShouldRunTaskInfo:(BOOL)a3
{
  self->_shouldRunTaskInfo = a3;
}

- (BOOL)requiresRoot
{
  return self->_requiresRoot;
}

- (void)setRequiresRoot:(BOOL)a3
{
  self->_requiresRoot = a3;
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end