@interface WFQueuedStatusPresentation
- (BOOL)isEqual:(id)a3;
- (WFQueuedStatusPresentation)initWithRunningContext:(id)a3;
- (WFWorkflowRunningContext)context;
- (unint64_t)hash;
@end

@implementation WFQueuedStatusPresentation

- (void).cxx_destruct
{
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFQueuedStatusPresentation *)self context];
    v6 = [v4 context];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFQueuedStatusPresentation *)self context];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (WFQueuedStatusPresentation)initWithRunningContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFQueuedStatusPresentation;
  v6 = [(WFQueuedStatusPresentation *)&v10 init];
  unsigned __int8 v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v8 = v7;
  }

  return v7;
}

@end