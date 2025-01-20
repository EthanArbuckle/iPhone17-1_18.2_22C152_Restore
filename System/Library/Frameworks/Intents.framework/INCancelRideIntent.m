@interface INCancelRideIntent
+ (BOOL)supportsSecureCoding;
+ (id)intentDescription;
- (INCancelRideIntent)initWithCoder:(id)a3;
- (INCancelRideIntent)initWithRideIdentifier:(NSString *)rideIdentifier;
- (NSString)rideIdentifier;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INCancelRideIntent

- (void).cxx_destruct
{
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"rideIdentifier";
  rideIdentifier = self->_rideIdentifier;
  v3 = rideIdentifier;
  if (!rideIdentifier)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!rideIdentifier) {

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INCancelRideIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rideIdentifier"];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &stru_1EDA6DB28;
  }
  v7 = [(INCancelRideIntent *)self initWithRideIdentifier:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  rideIdentifier = self->_rideIdentifier;

  return (id)[v4 initWithRideIdentifier:rideIdentifier];
}

- (INCancelRideIntent)initWithRideIdentifier:(NSString *)rideIdentifier
{
  v5 = rideIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)INCancelRideIntent;
  v6 = [(INIntent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rideIdentifier, rideIdentifier);
  }

  return v7;
}

+ (id)intentDescription
{
  if (intentDescription_onceToken_31759 != -1) {
    dispatch_once(&intentDescription_onceToken_31759, &__block_literal_global_31760);
  }
  v2 = (void *)intentDescription_intentDescription_31761;

  return v2;
}

uint64_t __39__INCancelRideIntent_intentDescription__block_invoke()
{
  intentDescription_intentDescription_31761 = [[INIntentDescription alloc] initWithName:@"CancelRideIntent" responseName:@"CancelRideIntentResponse" facadeClass:objc_opt_class() dataClass:0 type:0 isPrivate:0 handleSelector:sel_handleCancelRide_completion_ confirmSelector:sel_confirmCancelRide_completion_ slotsByName:0];

  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end