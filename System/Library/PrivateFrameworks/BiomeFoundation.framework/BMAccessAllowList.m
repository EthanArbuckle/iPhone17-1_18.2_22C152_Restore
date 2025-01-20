@interface BMAccessAllowList
- (BMAccessAllowList)initWithList:(id)a3;
- (BOOL)includesIdentifier:(id)a3 useCase:(id)a4;
- (BOOL)includesProcess:(id)a3 useCase:(id)a4;
@end

@implementation BMAccessAllowList

- (BMAccessAllowList)initWithList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAccessAllowList;
  v6 = [(BMAccessAllowList *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_allowed, a3);
  }

  return v7;
}

- (BOOL)includesIdentifier:(id)a3 useCase:(id)a4
{
  allowed = self->_allowed;
  id v6 = a4;
  v7 = [(NSDictionary *)allowed objectForKeyedSubscript:a3];
  LOBYTE(allowed) = [v7 containsObject:v6];

  return (char)allowed;
}

- (BOOL)includesProcess:(id)a3 useCase:(id)a4
{
  allowed = self->_allowed;
  id v6 = a4;
  v7 = [a3 identifier];
  v8 = [(NSDictionary *)allowed objectForKeyedSubscript:v7];
  char v9 = [v8 containsObject:v6];

  return v9;
}

- (void).cxx_destruct
{
}

@end