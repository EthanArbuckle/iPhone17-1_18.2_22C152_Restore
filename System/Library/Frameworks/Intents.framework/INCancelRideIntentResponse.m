@interface INCancelRideIntentResponse
+ (BOOL)supportsSecureCoding;
- (INCancelRideIntentResponse)initWithBackingStore:(id)a3;
- (INCancelRideIntentResponse)initWithCode:(INCancelRideIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INCancelRideIntentResponse)initWithCoder:(id)a3;
- (INCancelRideIntentResponseCode)code;
- (INCurrencyAmount)cancellationFee;
- (NSDateComponents)cancellationFeeThreshold;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setCancellationFee:(INCurrencyAmount *)cancellationFee;
- (void)setCancellationFeeThreshold:(NSDateComponents *)cancellationFeeThreshold;
@end

@implementation INCancelRideIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationFeeThreshold, 0);

  objc_storeStrong((id *)&self->_cancellationFee, 0);
}

- (void)setCancellationFeeThreshold:(NSDateComponents *)cancellationFeeThreshold
{
}

- (NSDateComponents)cancellationFeeThreshold
{
  return self->_cancellationFeeThreshold;
}

- (void)setCancellationFee:(INCurrencyAmount *)cancellationFee
{
}

- (INCurrencyAmount)cancellationFee
{
  return self->_cancellationFee;
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"code";
  INCancelRideIntentResponseCode v3 = [(INCancelRideIntentResponse *)self code];
  unint64_t v4 = v3;
  if ((unint64_t)v3 <= INCancelRideIntentResponseCodeFailure)
  {
    v5 = *(&off_1E55163B8 + v3);
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"userActivity";
  v11[0] = v5;
  v6 = [(INIntentResponse *)self userActivity];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  if (v4 >= 4) {

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INCancelRideIntentResponse;
  id v4 = a3;
  [(INIntentResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cancellationFee, @"cancellationFee", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_cancellationFeeThreshold forKey:@"cancellationFeeThreshold"];
}

- (INCancelRideIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INCancelRideIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INCancelRideIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INCancelRideIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INCancelRideIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INCancelRideIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCancelRideIntentResponse;
  objc_super v5 = [(INIntentResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancellationFee"];
    cancellationFee = v5->_cancellationFee;
    v5->_cancellationFee = (INCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancellationFeeThreshold"];
    cancellationFeeThreshold = v5->_cancellationFeeThreshold;
    v5->_cancellationFeeThreshold = (NSDateComponents *)v8;
  }
  return v5;
}

- (INCancelRideIntentResponse)initWithCode:(INCancelRideIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  v5.receiver = self;
  v5.super_class = (Class)INCancelRideIntentResponse;
  return (INCancelRideIntentResponse *)[(INIntentResponse *)&v5 _initWithCode:code userActivity:userActivity];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end