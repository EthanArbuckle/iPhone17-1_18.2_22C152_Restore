@interface FKBackgroundRefreshConfirmationPromptToken
- (BOOL)isEqual:(id)a3;
- (FKBackgroundRefreshConfirmationPromptToken)initWithFullyQualifiedAccountIdentifier:(id)a3 sequenceNumber:(int64_t)a4;
- (FKFullyQualifiedAccountIdentifier)fqaid;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sequenceNumber;
- (unint64_t)hash;
- (void)setFqaid:(id)a3;
- (void)setSequenceNumber:(int64_t)a3;
@end

@implementation FKBackgroundRefreshConfirmationPromptToken

- (FKBackgroundRefreshConfirmationPromptToken)initWithFullyQualifiedAccountIdentifier:(id)a3 sequenceNumber:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBackgroundRefreshConfirmationPromptToken;
  v7 = [(FKBackgroundRefreshConfirmationPromptToken *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    fqaid = v7->_fqaid;
    v7->_fqaid = (FKFullyQualifiedAccountIdentifier *)v8;

    v7->_sequenceNumber = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FKBackgroundRefreshConfirmationPromptToken alloc];
  fqaid = self->_fqaid;
  int64_t sequenceNumber = self->_sequenceNumber;

  return [(FKBackgroundRefreshConfirmationPromptToken *)v4 initWithFullyQualifiedAccountIdentifier:fqaid sequenceNumber:sequenceNumber];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_fqaid];
  v4 = [NSNumber numberWithLongLong:self->_sequenceNumber];
  [v3 safelyAddObject:v4];

  unint64_t v5 = FKCombinedHash(17, v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (FKBackgroundRefreshConfirmationPromptToken *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (FKEqualObjects(self->_fqaid, v6->_fqaid)) {
      BOOL v7 = self->_sequenceNumber == v6->_sequenceNumber;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (FKFullyQualifiedAccountIdentifier)fqaid
{
  return self->_fqaid;
}

- (void)setFqaid:(id)a3
{
}

- (int64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int64_t)a3
{
  self->_int64_t sequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end