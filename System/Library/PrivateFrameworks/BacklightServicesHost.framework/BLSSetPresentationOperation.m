@interface BLSSetPresentationOperation
- (BLSSetPresentationOperation)initWithBacklightState:(int64_t)a3 additions:(id)a4;
- (NSArray)additions;
- (id)description;
@end

@implementation BLSSetPresentationOperation

- (BLSSetPresentationOperation)initWithBacklightState:(int64_t)a3 additions:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BLSSetPresentationOperation;
  v8 = [(BLSHEnvironmentOperation *)&v11 initWithBacklightState:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_additions, a4);
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [(BLSHEnvironmentOperation *)self backlightState];
  v4 = NSStringFromBLSBacklightState();
  id v5 = (id)[v3 appendObject:v4 withName:@"backlightState"];

  id v6 = (id)[v3 appendObject:self->_additions withName:@"additions"];
  id v7 = [v3 build];

  return v7;
}

- (NSArray)additions
{
  return self->_additions;
}

- (void).cxx_destruct
{
}

@end