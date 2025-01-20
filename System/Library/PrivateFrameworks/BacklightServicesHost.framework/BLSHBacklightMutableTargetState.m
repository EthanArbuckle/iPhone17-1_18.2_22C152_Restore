@interface BLSHBacklightMutableTargetState
- (BLSHBacklightEnvironmentPresentation)presentation;
- (BLSHBacklightMutableTargetState)initWithState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (id)bls_loggingString;
- (id)bls_shortLoggingString;
- (int64_t)displayMode;
- (unint64_t)hash;
- (void)setDisplayMode:(int64_t)a3;
- (void)setPresentation:(id)a3;
- (void)setToState:(id)a3;
@end

@implementation BLSHBacklightMutableTargetState

- (BLSHBacklightMutableTargetState)initWithState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLSHBacklightMutableTargetState;
  v5 = [(BLSHBacklightMutableTargetState *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BLSHBacklightMutableTargetState *)v5 setToState:v4];
  }

  return v6;
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

- (void)setToState:(id)a3
{
  id v4 = a3;
  -[BLSHBacklightMutableTargetState setDisplayMode:](self, "setDisplayMode:", [v4 displayMode]);
  id v5 = [v4 presentation];

  [(BLSHBacklightMutableTargetState *)self setPresentation:v5];
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int64_t)a3
{
  self->_displayMode = a3;
}

- (BLSHBacklightEnvironmentPresentation)presentation
{
  return (BLSHBacklightEnvironmentPresentation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end