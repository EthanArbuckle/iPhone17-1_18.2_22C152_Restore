@interface CoreDAVOrderedAction
- (CoreDAVOrderedAction)initWithAction:(int)a3 context:(id)a4 absoluteOrder:(int)a5;
- (NSURL)priorURL;
- (id)description;
- (int)absoluteOrder;
- (void)setPriorURL:(id)a3;
@end

@implementation CoreDAVOrderedAction

- (CoreDAVOrderedAction)initWithAction:(int)a3 context:(id)a4 absoluteOrder:(int)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVOrderedAction;
  result = [(CoreDAVAction *)&v7 initWithAction:*(void *)&a3 context:a4];
  if (result) {
    *((_DWORD *)&result->super._ignoresGuardianRestrictions + 1) = a5;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> { Change type %d, Absolute Order %d prior url %@, Context: %@ }", objc_opt_class(), self, self->super._action, *((unsigned int *)&self->super._ignoresGuardianRestrictions + 1), *(void *)&self->_absoluteOrder, self->super._context];
}

- (int)absoluteOrder
{
  return *((_DWORD *)&self->super._ignoresGuardianRestrictions + 1);
}

- (NSURL)priorURL
{
  return *(NSURL **)&self->_absoluteOrder;
}

- (void)setPriorURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end