@interface BLSHBacklightAggregateState
+ (BOOL)isState:(id)a3 equalToObject:(id)a4;
+ (id)bls_debugLoggingDescriptionForState:(id)a3;
+ (id)bls_loggingStringForState:(id)a3;
+ (id)bls_shortLoggingStringForState:(id)a3;
+ (unint64_t)stateHash:(id)a3;
- (BLSHBacklightAggregateState)initWithDisplayModeSource:(id)a3;
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHBacklightEnvironmentStateMachine)presentationSource;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (int64_t)displayMode;
- (unint64_t)hash;
- (void)setPresentationSource:(id)a3;
@end

@implementation BLSHBacklightAggregateState

- (BLSHBacklightAggregateState)initWithDisplayModeSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHBacklightAggregateState;
  v6 = [(BLSHBacklightAggregateState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_displayModeSource, a3);
  }

  return v7;
}

- (int64_t)displayMode
{
  return [(BLSHBacklightDisplayStateMachine *)self->_displayModeSource displayMode];
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  v2 = [(BLSHBacklightAggregateState *)self presentationSource];
  v3 = [v2 presentation];

  return (BLSHBacklightEnvironmentPresentation *)v3;
}

- (BOOL)isEqual:(id)a3
{
  return +[BLSHBacklightAggregateState isState:self equalToObject:a3];
}

- (unint64_t)hash
{
  return +[BLSHBacklightAggregateState stateHash:self];
}

- (NSString)description
{
  return (NSString *)+[BLSHBacklightAggregateState bls_loggingStringForState:self];
}

- (NSString)debugDescription
{
  return (NSString *)+[BLSHBacklightAggregateState bls_debugLoggingDescriptionForState:self];
}

- (id)bls_loggingString
{
  return +[BLSHBacklightAggregateState bls_loggingStringForState:self];
}

- (id)bls_shortLoggingString
{
  return +[BLSHBacklightAggregateState bls_shortLoggingStringForState:self];
}

+ (BOOL)isState:(id)a3 equalToObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v7 = v6;
    uint64_t v8 = [v5 displayMode];
    if (v8 == [v7 displayMode])
    {
      objc_super v9 = [v5 presentation];
      uint64_t v10 = [v7 presentation];
      v11 = (void *)v10;
      if (v9) {
        char v12 = [v9 isEqual:v10];
      }
      else {
        char v12 = v10 == 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (unint64_t)stateHash:(id)a3
{
  v3 = (void *)MEMORY[0x263F29C60];
  id v4 = a3;
  id v5 = [v3 builder];
  id v6 = (id)objc_msgSend(v5, "appendInteger:", objc_msgSend(v4, "displayMode"));
  id v7 = [v4 presentation];

  id v8 = (id)[v5 appendObject:v7];
  unint64_t v9 = [v5 hash];

  return v9;
}

+ (id)bls_loggingStringForState:(id)a3
{
  v3 = (void *)MEMORY[0x263F29C40];
  id v4 = a3;
  id v5 = [v3 builderWithObject:v4];
  id v6 = NSStringFromBLSBacklightDisplayMode([v4 displayMode]);
  [v5 appendString:v6 withName:@"displayMode"];

  id v7 = [v4 presentation];

  id v8 = (id)[v5 appendObject:v7 withName:@"presentation"];
  unint64_t v9 = [v5 build];

  return v9;
}

+ (id)bls_shortLoggingStringForState:(id)a3
{
  v3 = (void *)MEMORY[0x263F29C40];
  id v4 = a3;
  id v5 = [v3 builderWithObject:v4];
  unint64_t v6 = [v4 displayMode];

  id v7 = NSStringFromBLSBacklightDisplayMode(v6);
  [v5 appendString:v7 withName:@"displayMode"];

  id v8 = [v5 build];

  return v8;
}

+ (id)bls_debugLoggingDescriptionForState:(id)a3
{
  v3 = (void *)MEMORY[0x263F29C40];
  id v4 = a3;
  id v5 = [v3 builderWithObject:v4];
  unint64_t v6 = NSStringFromBLSBacklightDisplayMode([v4 displayMode]);
  [v5 appendString:v6 withName:@"displayMode"];

  id v7 = [v4 presentation];

  id v8 = [v7 debugDescription];
  id v9 = (id)[v5 appendObject:v8 withName:@"presentation"];

  uint64_t v10 = [v5 build];

  return v10;
}

- (BLSHBacklightEnvironmentStateMachine)presentationSource
{
  return (BLSHBacklightEnvironmentStateMachine *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentationSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationSource, 0);

  objc_storeStrong((id *)&self->_displayModeSource, 0);
}

@end