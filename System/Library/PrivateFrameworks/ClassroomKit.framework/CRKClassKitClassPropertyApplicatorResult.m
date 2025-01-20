@interface CRKClassKitClassPropertyApplicatorResult
- (BOOL)classWasModified;
- (CRKClassKitClassPropertyApplicatorResult)init;
- (CRKClassKitClassPropertyApplicatorResult)initWithClassWasModified:(BOOL)a3;
@end

@implementation CRKClassKitClassPropertyApplicatorResult

- (CRKClassKitClassPropertyApplicatorResult)init
{
  return [(CRKClassKitClassPropertyApplicatorResult *)self initWithClassWasModified:0];
}

- (CRKClassKitClassPropertyApplicatorResult)initWithClassWasModified:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKClassKitClassPropertyApplicatorResult;
  result = [(CRKClassKitClassPropertyApplicatorResult *)&v5 init];
  if (result) {
    result->_classWasModified = a3;
  }
  return result;
}

- (BOOL)classWasModified
{
  return self->_classWasModified;
}

@end