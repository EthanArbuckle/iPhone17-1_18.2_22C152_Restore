@interface CDMCATIIntent
- (CDMCATIIntent)init;
- (CDMCATIIntent)initWithGuid:(id)a3 intentName:(id)a4 ensemble:(id)a5;
- (NSString)ensemble;
- (NSString)guid;
- (NSString)intentName;
- (void)setEnsemble:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIntentName:(id)a3;
@end

@implementation CDMCATIIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ensemble, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setEnsemble:(id)a3
{
}

- (NSString)ensemble
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIntentName:(id)a3
{
}

- (NSString)intentName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (CDMCATIIntent)initWithGuid:(id)a3 intentName:(id)a4 ensemble:(id)a5
{
  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSString *)a5;
  v11 = [(CDMCATIIntent *)self init];
  guid = v11->_guid;
  v11->_guid = v8;
  v13 = v8;

  intentName = v11->_intentName;
  v11->_intentName = v9;
  v15 = v9;

  ensemble = v11->_ensemble;
  v11->_ensemble = v10;

  return v11;
}

- (CDMCATIIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDMCATIIntent;
  return [(CDMCATIIntent *)&v3 init];
}

@end