@interface INSendRideFeedbackIntent
+ (BOOL)supportsSecureCoding;
+ (id)intentDescription;
- (INCurrencyAmount)tip;
- (INSendRideFeedbackIntent)initWithCoder:(id)a3;
- (INSendRideFeedbackIntent)initWithRideIdentifier:(NSString *)rideIdentifier;
- (NSNumber)rating;
- (NSString)rideIdentifier;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRating:(NSNumber *)rating;
- (void)setTip:(INCurrencyAmount *)tip;
@end

@implementation INSendRideFeedbackIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tip, 0);
  objc_storeStrong((id *)&self->_rating, 0);

  objc_storeStrong((id *)&self->_rideIdentifier, 0);
}

- (void)setTip:(INCurrencyAmount *)tip
{
}

- (INCurrencyAmount)tip
{
  return self->_tip;
}

- (void)setRating:(NSNumber *)rating
{
}

- (NSNumber)rating
{
  return self->_rating;
}

- (NSString)rideIdentifier
{
  return self->_rideIdentifier;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"rideIdentifier";
  rideIdentifier = self->_rideIdentifier;
  v4 = rideIdentifier;
  if (!rideIdentifier)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"rating";
  rating = self->_rating;
  v6 = rating;
  if (!rating)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"tip";
  tip = self->_tip;
  v8 = tip;
  if (!tip)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (tip)
  {
    if (rating) {
      goto LABEL_9;
    }
LABEL_14:

    if (rideIdentifier) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!rating) {
    goto LABEL_14;
  }
LABEL_9:
  if (rideIdentifier) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  rideIdentifier = self->_rideIdentifier;
  id v5 = a3;
  [v5 encodeObject:rideIdentifier forKey:@"rideIdentifier"];
  [v5 encodeObject:self->_rating forKey:@"rating"];
  [v5 encodeObject:self->_tip forKey:@"tip"];
}

- (INSendRideFeedbackIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rideIdentifier"];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1EDA6DB28;
  }
  v8 = [(INSendRideFeedbackIntent *)self initWithRideIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rating"];
    rating = v8->_rating;
    v8->_rating = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip"];
    tip = v8->_tip;
    v8->_tip = (INCurrencyAmount *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRideIdentifier:", self->_rideIdentifier);
  [v4 setRating:self->_rating];
  [v4 setTip:self->_tip];
  return v4;
}

- (INSendRideFeedbackIntent)initWithRideIdentifier:(NSString *)rideIdentifier
{
  id v4 = rideIdentifier;
  v9.receiver = self;
  v9.super_class = (Class)INSendRideFeedbackIntent;
  uint64_t v5 = [(INIntent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)v4 copy];
    v7 = v5->_rideIdentifier;
    v5->_rideIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (id)intentDescription
{
  if (intentDescription_onceToken_68377 != -1) {
    dispatch_once(&intentDescription_onceToken_68377, &__block_literal_global_68378);
  }
  v2 = (void *)intentDescription_intentDescription_68379;

  return v2;
}

uint64_t __45__INSendRideFeedbackIntent_intentDescription__block_invoke()
{
  v0 = [[INIntentDescription alloc] initWithName:@"SendRideFeedbackIntent" responseName:@"SendRideFeedbackIntentResponse" facadeClass:objc_opt_class() dataClass:0 type:0 isPrivate:0 handleSelector:sel_handleSendRideFeedback_completion_ confirmSelector:sel_confirmSendRideFeedback_completion_ slotsByName:0];
  uint64_t v1 = intentDescription_intentDescription_68379;
  intentDescription_intentDescription_68379 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end