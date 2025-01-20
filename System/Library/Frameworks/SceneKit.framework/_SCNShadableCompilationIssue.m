@interface _SCNShadableCompilationIssue
+ (id)issueWithShadable:(id)a3 entryPoint:(id)a4 effectiveModifier:(id)a5 message:(id)a6 line:(int64_t)a7 type:(unint64_t)a8;
- (NSString)effectiveModifier;
- (NSString)entryPoint;
- (NSString)message;
- (SCNShadable)shadable;
- (int64_t)line;
- (unint64_t)type;
- (void)dealloc;
@end

@implementation _SCNShadableCompilationIssue

+ (id)issueWithShadable:(id)a3 entryPoint:(id)a4 effectiveModifier:(id)a5 message:(id)a6 line:(int64_t)a7 type:(unint64_t)a8
{
  v14 = objc_alloc_init(_SCNShadableCompilationIssue);
  v14->_shadable = (SCNShadable *)a3;
  v14->_entryPoint = (NSString *)a4;
  v14->_effectiveModifier = (NSString *)a5;
  v14->_message = (NSString *)a6;
  v14->_type = a8;
  v14->_line = a7;
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_SCNShadableCompilationIssue;
  [(_SCNShadableCompilationIssue *)&v3 dealloc];
}

- (SCNShadable)shadable
{
  return self->_shadable;
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (NSString)effectiveModifier
{
  return self->_effectiveModifier;
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)line
{
  return self->_line;
}

@end