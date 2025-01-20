@interface ASOServiceLockupDefinition
- (ASCLockup)lockup;
- (ASCLockupRequest)request;
- (ASOServiceLockupDefinition)initWithLockup:(id)a3;
- (ASOServiceLockupDefinition)initWithRequest:(id)a3;
- (void)setLockup:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation ASOServiceLockupDefinition

- (ASOServiceLockupDefinition)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOServiceLockupDefinition;
  v6 = [(ASOServiceLockupDefinition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (ASOServiceLockupDefinition)initWithLockup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASOServiceLockupDefinition;
  v6 = [(ASOServiceLockupDefinition *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lockup, a3);
  }

  return v7;
}

- (ASCLockup)lockup
{
  return self->_lockup;
}

- (void)setLockup:(id)a3
{
}

- (ASCLockupRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_lockup, 0);
}

@end