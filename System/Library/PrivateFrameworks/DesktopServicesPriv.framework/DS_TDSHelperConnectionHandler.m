@interface DS_TDSHelperConnectionHandler
- (DS_TDSHelperConnectionHandler)initWithHelper:(void *)a3;
- (id).cxx_construct;
- (void)clearHelper;
- (void)handleHelperEvent:(id)a3;
@end

@implementation DS_TDSHelperConnectionHandler

- (DS_TDSHelperConnectionHandler)initWithHelper:(void *)a3
{
  result = [(DS_TDSHelperConnectionHandler *)self init];
  result->_helper = a3;
  return result;
}

- (void)handleHelperEvent:(id)a3
{
  id v5 = a3;
  TDSMutex::lock(&self->_mutex);
  helper = self->_helper;
  if (helper) {
    TDSHelperContext::HandleHelperEvent(helper, v5);
  }
  TDSMutex::unlock(&self->_mutex);
}

- (void)clearHelper
{
  p_mutex = &self->_mutex;
  TDSMutex::lock(&self->_mutex);
  self->_helper = 0;
  TDSMutex::unlock(p_mutex);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end