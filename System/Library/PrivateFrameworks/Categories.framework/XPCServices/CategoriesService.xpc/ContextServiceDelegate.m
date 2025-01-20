@interface ContextServiceDelegate
- (ContextServiceDelegate)init;
- (NSString)currentIndexVersionID;
- (void)setCurrentIndexVersionID:(id)a3;
@end

@implementation ContextServiceDelegate

- (ContextServiceDelegate)init
{
  v13.receiver = self;
  v13.super_class = (Class)ContextServiceDelegate;
  v2 = [(ContextServiceDelegate *)&v13 init];
  v3 = +[CTCategory client];
  v4 = [v3 indexVersionId];
  v5 = (NSString *)[v4 copy];
  currentIndexVersionID = v2->_currentIndexVersionID;
  v2->_currentIndexVersionID = v5;

  objc_initWeak(&location, v2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005218;
  v9[3] = &unk_10000C3C0;
  id v7 = v3;
  id v10 = v7;
  objc_copyWeak(&v11, &location);
  [v7 registerConfigurationUpdateHandler:v9];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v2;
}

- (NSString)currentIndexVersionID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentIndexVersionID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end