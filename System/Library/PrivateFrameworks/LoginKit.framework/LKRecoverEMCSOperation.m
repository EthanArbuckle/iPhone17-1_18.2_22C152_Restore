@interface LKRecoverEMCSOperation
- (LKRecoverEMCSOperation)init;
- (id)dictionary;
- (int64_t)recoveredKeychainItemCount;
- (void)setRecoveredKeychainItemCount:(int64_t)a3;
@end

@implementation LKRecoverEMCSOperation

- (LKRecoverEMCSOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)LKRecoverEMCSOperation;
  result = [(LKOperation *)&v3 init];
  if (result) {
    result->_recoveredKeychainItemCount = 0;
  }
  return result;
}

- (void)setRecoveredKeychainItemCount:(int64_t)a3
{
  if (self->_recoveredKeychainItemCount != a3) {
    self->_recoveredKeychainItemCount = a3;
  }
}

- (id)dictionary
{
  v8.receiver = self;
  v8.super_class = (Class)LKRecoverEMCSOperation;
  objc_super v3 = [(LKOperation *)&v8 dictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[LKRecoverEMCSOperation recoveredKeychainItemCount](self, "recoveredKeychainItemCount"));
  [v4 setObject:v5 forKeyedSubscript:@"recoveredKeychainItemCount"];

  v6 = (void *)[v4 copy];
  return v6;
}

- (int64_t)recoveredKeychainItemCount
{
  return self->_recoveredKeychainItemCount;
}

@end