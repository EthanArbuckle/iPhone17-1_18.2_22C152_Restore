@interface CDPCombinedWalrusStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)mismatchDetected;
- (CDPCombinedWalrusStatus)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)escrowWalrusStatus;
- (unint64_t)octagonWalrusStatus;
- (unint64_t)pcsWalrusStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setEscrowWalrusStatus:(unint64_t)a3;
- (void)setOctagonWalrusStatus:(unint64_t)a3;
- (void)setPcsWalrusStatus:(unint64_t)a3;
@end

@implementation CDPCombinedWalrusStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)mismatchDetected
{
  return [(CDPCombinedWalrusStatus *)self octagonWalrusStatus] == 2
      && [(CDPCombinedWalrusStatus *)self pcsWalrusStatus] == 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t octagonWalrusStatus = self->_octagonWalrusStatus;
  id v5 = a3;
  [v5 encodeInteger:octagonWalrusStatus forKey:@"_octagonWalrusStatus"];
  [v5 encodeInteger:self->_pcsWalrusStatus forKey:@"_pcsWalrusStatus"];
  [v5 encodeInteger:self->_escrowWalrusStatus forKey:@"_escrowWalrusStatus"];
}

- (CDPCombinedWalrusStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CDPCombinedWalrusStatus *)self init];
  if (v5)
  {
    v5->_unint64_t octagonWalrusStatus = [v4 decodeIntegerForKey:@"_octagonWalrusStatus"];
    v5->_pcsWalrusStatus = [v4 decodeIntegerForKey:@"_pcsWalrusStatus"];
    v5->_escrowWalrusStatus = [v4 decodeIntegerForKey:@"_escrowWalrusStatus"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(CDPCombinedWalrusStatus);
  *((void *)result + 1) = self->_octagonWalrusStatus;
  *((void *)result + 2) = self->_pcsWalrusStatus;
  *((void *)result + 3) = self->_escrowWalrusStatus;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithUnsignedInteger:self->_octagonWalrusStatus];
  v6 = [NSNumber numberWithUnsignedInteger:self->_pcsWalrusStatus];
  v7 = [NSNumber numberWithUnsignedInteger:self->_escrowWalrusStatus];
  v8 = [v3 stringWithFormat:@"<%@: %p> Octagon: %@, PCS: %@, Escrow: %@", v4, self, v5, v6, v7];

  return v8;
}

- (unint64_t)octagonWalrusStatus
{
  return self->_octagonWalrusStatus;
}

- (void)setOctagonWalrusStatus:(unint64_t)a3
{
  self->_unint64_t octagonWalrusStatus = a3;
}

- (unint64_t)pcsWalrusStatus
{
  return self->_pcsWalrusStatus;
}

- (void)setPcsWalrusStatus:(unint64_t)a3
{
  self->_pcsWalrusStatus = a3;
}

- (unint64_t)escrowWalrusStatus
{
  return self->_escrowWalrusStatus;
}

- (void)setEscrowWalrusStatus:(unint64_t)a3
{
  self->_escrowWalrusStatus = a3;
}

@end