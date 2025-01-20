@interface BMAccessDelegate
- (BMAccessDelegate)initWithDelegates:(id)a3;
- (BOOL)handlesDirectoryCreationForResource:(id)a3 inContainer:(id)a4;
- (BOOL)handlesDirectoryRemovalForResource:(id)a3 inContainer:(id)a4;
- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4 inContainer:(id)a5;
- (BOOL)teardownResource:(id)a3 inContainer:(id)a4;
- (NSDictionary)delegates;
@end

@implementation BMAccessDelegate

- (BOOL)prepareResource:(id)a3 withMode:(unint64_t)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  delegates = self->_delegates;
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "type"));
  v12 = [(NSDictionary *)delegates objectForKeyedSubscript:v11];

  if (v12) {
    char v13 = [v12 prepareResource:v8 withMode:a4 inContainer:v9];
  }
  else {
    char v13 = 1;
  }

  return v13;
}

- (BOOL)handlesDirectoryCreationForResource:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegates = self->_delegates;
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  v10 = [(NSDictionary *)delegates objectForKeyedSubscript:v9];

  if (v10) {
    char v11 = [v10 handlesDirectoryCreationForResource:v6 inContainer:v7];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (BMAccessDelegate)initWithDelegates:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMAccessDelegate;
  id v6 = [(BMAccessDelegate *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegates, a3);
  }

  return v7;
}

- (BOOL)handlesDirectoryRemovalForResource:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegates = self->_delegates;
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  v10 = [(NSDictionary *)delegates objectForKeyedSubscript:v9];

  if (v10) {
    char v11 = [v10 handlesDirectoryRemovalForResource:v6 inContainer:v7];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)teardownResource:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  delegates = self->_delegates;
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  v10 = [(NSDictionary *)delegates objectForKeyedSubscript:v9];

  if (v10) {
    char v11 = [v10 teardownResource:v6 inContainer:v7];
  }
  else {
    char v11 = 1;
  }

  return v11;
}

- (NSDictionary)delegates
{
  return self->_delegates;
}

- (void).cxx_destruct
{
}

@end