@interface FAHTTPResponse
- (BOOL)familyRefreshTriggered;
- (FAHTTPResponse)initWithHTTPResponse:(id)a3 body:(id)a4;
- (FAHTTPResponse)initWithHTTPResponse:(id)a3 body:(id)a4 familyRefreshTriggered:(BOOL)a5;
- (NSHTTPURLResponse)HTTPResponse;
- (id)body;
- (void)setFamilyRefreshTriggered:(BOOL)a3;
@end

@implementation FAHTTPResponse

- (FAHTTPResponse)initWithHTTPResponse:(id)a3 body:(id)a4
{
  return [(FAHTTPResponse *)self initWithHTTPResponse:a3 body:a4 familyRefreshTriggered:0];
}

- (FAHTTPResponse)initWithHTTPResponse:(id)a3 body:(id)a4 familyRefreshTriggered:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)FAHTTPResponse;
    v11 = [(FAHTTPResponse *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_HTTPResponse, a3);
      objc_storeStrong(&v12->_body, a4);
      v12->_familyRefreshTriggered = a5;
    }
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSHTTPURLResponse)HTTPResponse
{
  return self->_HTTPResponse;
}

- (id)body
{
  return self->_body;
}

- (BOOL)familyRefreshTriggered
{
  return self->_familyRefreshTriggered;
}

- (void)setFamilyRefreshTriggered:(BOOL)a3
{
  self->_familyRefreshTriggered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_body, 0);
  objc_storeStrong((id *)&self->_HTTPResponse, 0);
}

@end