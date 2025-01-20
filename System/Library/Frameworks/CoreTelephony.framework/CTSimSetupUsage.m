@interface CTSimSetupUsage
+ (BOOL)supportsSecureCoding;
- (BOOL)inBuddy;
- (BOOL)isEqual:(id)a3;
- (CTSimSetupUsage)initWithCoder:(id)a3;
- (CTSimSetupUsage)initWithInBuddy:(BOOL)a3 transferablePlans:(unint64_t)a4 selectedTransferablePlans:(unint64_t)a5 alsPlans:(unint64_t)a6 selectedAlsPlans:(unint64_t)a7 odaPlans:(unint64_t)a8;
- (id)description;
- (unint64_t)alsPlans;
- (unint64_t)odaPlans;
- (unint64_t)selectedAlsPlans;
- (unint64_t)selectedTransferablePlans;
- (unint64_t)transferablePlans;
- (void)encodeWithCoder:(id)a3;
- (void)setAlsPlans:(unint64_t)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setOdaPlans:(unint64_t)a3;
- (void)setSelectedAlsPlans:(unint64_t)a3;
- (void)setSelectedTransferablePlans:(unint64_t)a3;
- (void)setTransferablePlans:(unint64_t)a3;
@end

@implementation CTSimSetupUsage

- (CTSimSetupUsage)initWithInBuddy:(BOOL)a3 transferablePlans:(unint64_t)a4 selectedTransferablePlans:(unint64_t)a5 alsPlans:(unint64_t)a6 selectedAlsPlans:(unint64_t)a7 odaPlans:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CTSimSetupUsage;
  result = [(CTSimSetupUsage *)&v15 init];
  if (result)
  {
    result->_inBuddy = a3;
    result->_transferablePlans = a4;
    result->_selectedTransferablePlans = a5;
    result->_alsPlans = a6;
    result->_selectedAlsPlans = a7;
    result->_odaPlans = a8;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  BOOL v4 = [(CTSimSetupUsage *)self inBuddy];
  v5 = "NO";
  if (v4) {
    v5 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @" inBuddy=%s", v5);
  objc_msgSend(v3, "appendFormat:", @" transferablePlans=%lu", -[CTSimSetupUsage transferablePlans](self, "transferablePlans"));
  objc_msgSend(v3, "appendFormat:", @" selectedTransferablePlans=%lu", -[CTSimSetupUsage selectedTransferablePlans](self, "selectedTransferablePlans"));
  objc_msgSend(v3, "appendFormat:", @" alsPlans=%lu", -[CTSimSetupUsage alsPlans](self, "alsPlans"));
  objc_msgSend(v3, "appendFormat:", @" selectedAlsPlans=%lu", -[CTSimSetupUsage selectedAlsPlans](self, "selectedAlsPlans"));
  objc_msgSend(v3, "appendFormat:", @" odaPlans=%lu", -[CTSimSetupUsage odaPlans](self, "odaPlans"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (CTSimSetupUsage *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v5 = [(CTSimSetupUsage *)self inBuddy], v5 == [(CTSimSetupUsage *)v4 inBuddy])
      && (unint64_t v6 = [(CTSimSetupUsage *)self transferablePlans],
          v6 == [(CTSimSetupUsage *)v4 transferablePlans])
      && (unint64_t v7 = [(CTSimSetupUsage *)self selectedTransferablePlans],
          v7 == [(CTSimSetupUsage *)v4 selectedTransferablePlans])
      && (unint64_t v8 = [(CTSimSetupUsage *)self alsPlans], v8 == [(CTSimSetupUsage *)v4 alsPlans])
      && (unint64_t v9 = [(CTSimSetupUsage *)self selectedAlsPlans],
          v9 == [(CTSimSetupUsage *)v4 selectedAlsPlans]))
    {
      unint64_t v10 = [(CTSimSetupUsage *)self odaPlans];
      BOOL v11 = v10 == [(CTSimSetupUsage *)v4 odaPlans];
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTSimSetupUsage)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSimSetupUsage;
  BOOL v5 = [(CTSimSetupUsage *)&v7 init];
  if (v5)
  {
    v5->_inBuddy = [v4 decodeBoolForKey:@"inBuddy"];
    v5->_transferablePlans = [v4 decodeIntegerForKey:@"transferablePlans"];
    v5->_selectedTransferablePlans = [v4 decodeIntegerForKey:@"selectedTransferablePlans"];
    v5->_alsPlans = [v4 decodeIntegerForKey:@"alsPlans"];
    v5->_selectedAlsPlans = [v4 decodeIntegerForKey:@"selectedAlsPlans"];
    v5->_odaPlans = [v4 decodeIntegerForKey:@"odaPlans"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTSimSetupUsage inBuddy](self, "inBuddy"), @"inBuddy");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage transferablePlans](self, "transferablePlans"), @"transferablePlans");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage selectedTransferablePlans](self, "selectedTransferablePlans"), @"selectedTransferablePlans");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage alsPlans](self, "alsPlans"), @"alsPlans");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage selectedAlsPlans](self, "selectedAlsPlans"), @"selectedAlsPlans");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage odaPlans](self, "odaPlans"), @"odaPlans");
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (unint64_t)transferablePlans
{
  return self->_transferablePlans;
}

- (void)setTransferablePlans:(unint64_t)a3
{
  self->_transferablePlans = a3;
}

- (unint64_t)selectedTransferablePlans
{
  return self->_selectedTransferablePlans;
}

- (void)setSelectedTransferablePlans:(unint64_t)a3
{
  self->_selectedTransferablePlans = a3;
}

- (unint64_t)alsPlans
{
  return self->_alsPlans;
}

- (void)setAlsPlans:(unint64_t)a3
{
  self->_alsPlans = a3;
}

- (unint64_t)selectedAlsPlans
{
  return self->_selectedAlsPlans;
}

- (void)setSelectedAlsPlans:(unint64_t)a3
{
  self->_selectedAlsPlans = a3;
}

- (unint64_t)odaPlans
{
  return self->_odaPlans;
}

- (void)setOdaPlans:(unint64_t)a3
{
  self->_odaPlans = a3;
}

@end