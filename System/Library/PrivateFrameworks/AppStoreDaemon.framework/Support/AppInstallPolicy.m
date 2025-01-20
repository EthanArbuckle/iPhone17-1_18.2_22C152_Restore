@interface AppInstallPolicy
- (AppInstallPolicy)init;
- (BOOL)isEqual:(id)a3;
@end

@implementation AppInstallPolicy

- (AppInstallPolicy)init
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = (AppInstallPolicy *)sub_1003D4BC0(self, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    v6 = v5;
    if (self)
    {
      if (v5) {
        id v7 = [v5[1] copy];
      }
      else {
        id v7 = 0;
      }
      id v8 = [(NSMutableDictionary *)self->_dictionary copy];
      LOBYTE(self) = [v8 isEqualToDictionary:v7];
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void).cxx_destruct
{
}

@end