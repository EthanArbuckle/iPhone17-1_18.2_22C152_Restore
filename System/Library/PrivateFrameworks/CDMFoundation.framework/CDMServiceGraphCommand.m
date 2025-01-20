@interface CDMServiceGraphCommand
+ (BOOL)supportsSecureCoding;
+ (id)serviceGraphName;
- (CDMDataDispatcherContext)dataDispatcherContext;
- (CDMServiceGraphCommand)initWithCoder:(id)a3;
- (id)loggingRequestID;
- (void)encodeWithCoder:(id)a3;
- (void)setDataDispatcherContext:(id)a3;
@end

@implementation CDMServiceGraphCommand

- (void).cxx_destruct
{
}

- (void)setDataDispatcherContext:(id)a3
{
}

- (CDMDataDispatcherContext)dataDispatcherContext
{
  return self->_dataDispatcherContext;
}

- (id)loggingRequestID
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CDMServiceGraphCommand;
  [(CDMBaseCommand *)&v3 encodeWithCoder:a3];
}

- (CDMServiceGraphCommand)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDMServiceGraphCommand;
  return [(CDMBaseCommand *)&v4 initWithCoder:a3];
}

+ (id)serviceGraphName
{
  return &stru_26DA24FF0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end