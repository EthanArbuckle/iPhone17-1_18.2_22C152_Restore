@interface RequestEnvironment
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RequestEnvironment

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[RequestEnvironment allocWithZone:](RequestEnvironment, "allocWithZone:") init];
  v6 = (AMSProcessInfo *)[(AMSProcessInfo *)self->_clientInfo copyWithZone:a3];
  clientInfo = v5->_clientInfo;
  v5->_clientInfo = v6;

  objc_storeStrong((id *)&v5->_logKey, self->_logKey);
  id v8 = [self->_reconfigureRequestHandler copyWithZone:a3];
  id reconfigureRequestHandler = v5->_reconfigureRequestHandler;
  v5->_id reconfigureRequestHandler = v8;

  objc_storeStrong((id *)&v5->_requestPresenter, self->_requestPresenter);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestPresenter, 0);
  objc_storeStrong(&self->_reconfigureRequestHandler, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end