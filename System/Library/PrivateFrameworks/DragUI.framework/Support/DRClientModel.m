@interface DRClientModel
- (BOOL)isSource;
- (DRClientModel)initWithClient:(id)a3 isSource:(BOOL)a4;
- (_DUIClientSessionCommon)client;
- (id)description;
@end

@implementation DRClientModel

- (DRClientModel)initWithClient:(id)a3 isSource:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DRClientModel;
  v8 = [(DRClientModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_client, a3);
    v9->_isSource = a4;
  }

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p client=%p isSource=%d>", objc_opt_class(), self, self->_client, self->_isSource];
}

- (_DUIClientSessionCommon)client
{
  return self->_client;
}

- (BOOL)isSource
{
  return self->_isSource;
}

- (void).cxx_destruct
{
}

@end