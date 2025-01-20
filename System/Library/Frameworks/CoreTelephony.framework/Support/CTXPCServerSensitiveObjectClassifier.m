@interface CTXPCServerSensitiveObjectClassifier
- (BOOL)foundSensitiveObject;
- (void)classifyObject:(id)a3;
@end

@implementation CTXPCServerSensitiveObjectClassifier

- (void)classifyObject:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
    v5 = v7;
    id v6 = v4;
  }
  else
  {
    id v6 = 0;
    v5 = v7;
  }

  if ([(id)objc_opt_class() isSensitiveMessage]) {
    self->_foundSensitiveObject = 1;
  }
}

- (BOOL)foundSensitiveObject
{
  return self->_foundSensitiveObject;
}

@end