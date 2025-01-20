@interface CATSharingBenignError
- (CATSharingBenignError)initWithUnderlyingError:(id)a3;
- (NSError)underlyingError;
- (int64_t)failureType;
@end

@implementation CATSharingBenignError

- (CATSharingBenignError)initWithUnderlyingError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATSharingBenignError;
  v6 = [(CATSharingBenignError *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingError, a3);
  }

  return v7;
}

- (int64_t)failureType
{
  return 0;
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void).cxx_destruct
{
}

@end