@interface CRKClearSignInHistoryResultObject
+ (BOOL)supportsSecureCoding;
- (CRKClearSignInHistoryResultObject)initWithCoder:(id)a3;
- (unint64_t)countOfRemovedRecords;
- (void)encodeWithCoder:(id)a3;
- (void)setCountOfRemovedRecords:(unint64_t)a3;
@end

@implementation CRKClearSignInHistoryResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKClearSignInHistoryResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKClearSignInHistoryResultObject;
  v5 = [(CATTaskResultObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countOfRemovedRecords"];
    v5->_countOfRemovedRecords = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKClearSignInHistoryResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKClearSignInHistoryResultObject countOfRemovedRecords](self, "countOfRemovedRecords", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"countOfRemovedRecords"];
}

- (unint64_t)countOfRemovedRecords
{
  return self->_countOfRemovedRecords;
}

- (void)setCountOfRemovedRecords:(unint64_t)a3
{
  self->_countOfRemovedRecords = a3;
}

@end