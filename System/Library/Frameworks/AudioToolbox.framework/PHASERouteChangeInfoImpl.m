@interface PHASERouteChangeInfoImpl
- (NSDictionary)description;
- (PHASERouteChangeInfoImpl)initWithDescription:(id)a3;
@end

@implementation PHASERouteChangeInfoImpl

- (void).cxx_destruct
{
}

- (NSDictionary)description
{
  return self->_description;
}

- (PHASERouteChangeInfoImpl)initWithDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASERouteChangeInfoImpl;
  v6 = [(PHASERouteChangeInfoImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_description, a3);
  }

  return v7;
}

@end