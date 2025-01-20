@interface TradeInToolInputs
- (BOOL)useAutoAdvance;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (void)setUseAutoAdvance:(BOOL)a3;
@end

@implementation TradeInToolInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TradeInToolInputs;
  id v4 = a3;
  char v8 = ![(DisplayViewInputs *)&v7 validateAndInitializeParameters:v4];
  id v5 = [v4 dk_BOOLFromKey:@"autoAdvanceImages" defaultValue:0 failed:&v8];

  [(TradeInToolInputs *)self setUseAutoAdvance:v5];
  return v8 == 0;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return 1;
}

- (BOOL)useAutoAdvance
{
  return self->_useAutoAdvance;
}

- (void)setUseAutoAdvance:(BOOL)a3
{
  self->_useAutoAdvance = a3;
}

@end