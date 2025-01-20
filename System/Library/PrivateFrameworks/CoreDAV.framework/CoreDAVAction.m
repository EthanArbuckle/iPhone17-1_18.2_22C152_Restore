@interface CoreDAVAction
- (BOOL)ignoresGuardianRestrictions;
- (CoreDAVAction)initWithAction:(int)a3 context:(id)a4;
- (id)changeContext;
- (id)context;
- (id)description;
- (int)action;
- (void)setChangeContext:(id)a3;
- (void)setIgnoresGuardianRestrictions:(BOOL)a3;
@end

@implementation CoreDAVAction

- (CoreDAVAction)initWithAction:(int)a3 context:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVAction;
  v8 = [(CoreDAVAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_action = a3;
    objc_storeStrong(&v8->_context, a4);
  }

  return v9;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"<%@: %p> { Change type %d, Context: %@", objc_opt_class(), self, self->_action, self->_context];
  v4 = v3;
  if (self->_changeContext) {
    [v3 stringByAppendingFormat:@", ChangeContext: %@ }", self->_changeContext];
  }
  else {
  v5 = [v3 stringByAppendingString:@" }"];
  }

  return v5;
}

- (int)action
{
  return self->_action;
}

- (id)context
{
  return self->_context;
}

- (id)changeContext
{
  return self->_changeContext;
}

- (void)setChangeContext:(id)a3
{
}

- (BOOL)ignoresGuardianRestrictions
{
  return self->_ignoresGuardianRestrictions;
}

- (void)setIgnoresGuardianRestrictions:(BOOL)a3
{
  self->_ignoresGuardianRestrictions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeContext, 0);
  objc_storeStrong(&self->_context, 0);
}

@end