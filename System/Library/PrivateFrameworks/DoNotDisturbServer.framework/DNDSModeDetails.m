@interface DNDSModeDetails
+ (id)detailsForInactiveDoNotDisturb;
- (BOOL)isEqual:(id)a3;
- (DNDSModeDetails)initWithInterruptionSuppression:(unint64_t)a3;
- (id)description;
- (id)restrictedDetailsWithDetails:(id)a3;
- (unint64_t)interruptionSuppression;
@end

@implementation DNDSModeDetails

+ (id)detailsForInactiveDoNotDisturb
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DNDSModeDetails_detailsForInactiveDoNotDisturb__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (detailsForInactiveDoNotDisturb_onceToken != -1) {
    dispatch_once(&detailsForInactiveDoNotDisturb_onceToken, block);
  }
  v2 = (void *)detailsForInactiveDoNotDisturb_inactiveDetails;
  return v2;
}

uint64_t __49__DNDSModeDetails_detailsForInactiveDoNotDisturb__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithInterruptionSuppression:0];
  uint64_t v2 = detailsForInactiveDoNotDisturb_inactiveDetails;
  detailsForInactiveDoNotDisturb_inactiveDetails = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (DNDSModeDetails)initWithInterruptionSuppression:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DNDSModeDetails;
  result = [(DNDSModeDetails *)&v5 init];
  if (result) {
    result->_interruptionSuppression = a3;
  }
  return result;
}

- (id)restrictedDetailsWithDetails:(id)a3
{
  id v4 = a3;
  [(DNDSModeDetails *)self interruptionSuppression];
  [v4 interruptionSuppression];

  objc_super v5 = [[DNDSModeDetails alloc] initWithInterruptionSuppression:DNDMostRestrictiveInterruptionSuppression()];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DNDSModeDetails *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(DNDSModeDetails *)self interruptionSuppression];
      uint64_t v7 = [(DNDSModeDetails *)v5 interruptionSuppression];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(DNDSModeDetails *)self interruptionSuppression];
  objc_super v5 = DNDStringFromInterruptionSuppression();
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p; interruptionSuppression: %@>", v4, self, v5];

  return v6;
}

- (unint64_t)interruptionSuppression
{
  return self->_interruptionSuppression;
}

@end