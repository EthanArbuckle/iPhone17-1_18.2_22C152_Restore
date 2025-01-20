@interface CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject)initWithCoder:(id)a3;
- (CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject)initWithNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3;
- (int64_t)numberOfDaysBeforeAutomaticRemoval;
- (void)encodeWithCoder:(id)a3;
- (void)setNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3;
@end

@implementation CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject

- (CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject)initWithNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject;
  result = [(CATTaskResultObject *)&v5 init];
  if (result) {
    result->_numberOfDaysBeforeAutomaticRemoval = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject;
  objc_super v5 = [(CATTaskResultObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfDaysBeforeAutomaticRemoval"];
    v5->_numberOfDaysBeforeAutomaticRemoval = [v6 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[CRKFetchNumberOfDaysBeforeAutomaticRemovalResultObject numberOfDaysBeforeAutomaticRemoval](self, "numberOfDaysBeforeAutomaticRemoval", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"numberOfDaysBeforeAutomaticRemoval"];
}

- (int64_t)numberOfDaysBeforeAutomaticRemoval
{
  return self->_numberOfDaysBeforeAutomaticRemoval;
}

- (void)setNumberOfDaysBeforeAutomaticRemoval:(int64_t)a3
{
  self->_numberOfDaysBeforeAutomaticRemoval = a3;
}

@end