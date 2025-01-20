@interface INStartCallIntentDonationMetadata
+ (BOOL)supportsSecureCoding;
+ (Class)_intentClass;
- (BOOL)isEqual:(id)a3;
- (INStartCallIntentDonationMetadata)init;
- (INStartCallIntentDonationMetadata)initWithCoder:(id)a3;
- (NSNumber)disconnectedReason;
- (NSNumber)recentCallStatus;
- (double)callDuration;
- (double)timeToEstablish;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallDuration:(double)a3;
- (void)setDisconnectedReason:(id)a3;
- (void)setRecentCallStatus:(id)a3;
- (void)setTimeToEstablish:(double)a3;
@end

@implementation INStartCallIntentDonationMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disconnectedReason, 0);

  objc_storeStrong((id *)&self->_recentCallStatus, 0);
}

- (void)setDisconnectedReason:(id)a3
{
}

- (NSNumber)disconnectedReason
{
  return self->_disconnectedReason;
}

- (void)setRecentCallStatus:(id)a3
{
}

- (NSNumber)recentCallStatus
{
  return self->_recentCallStatus;
}

- (void)setTimeToEstablish:(double)a3
{
  self->_timeToEstablish = a3;
}

- (double)timeToEstablish
{
  return self->_timeToEstablish;
}

- (void)setCallDuration:(double)a3
{
  self->_callDuration = a3;
}

- (double)callDuration
{
  return self->_callDuration;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INStartCallIntentDonationMetadata;
  id v4 = a3;
  [(INIntentDonationMetadata *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeDouble:forKey:", @"callDuration", self->_callDuration, v5.receiver, v5.super_class);
  [v4 encodeDouble:@"timeToEstablish" forKey:self->_timeToEstablish];
  [v4 encodeObject:self->_recentCallStatus forKey:@"recentCallStatus"];
  [v4 encodeObject:self->_disconnectedReason forKey:@"disconnectedReason"];
}

- (INStartCallIntentDonationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INStartCallIntentDonationMetadata;
  objc_super v5 = [(INIntentDonationMetadata *)&v14 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"callDuration"];
    v5->_callDuration = v6;
    [v4 decodeDoubleForKey:@"timeToEstablish"];
    v5->_timeToEstablish = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recentCallStatus"];
    recentCallStatus = v5->_recentCallStatus;
    v5->_recentCallStatus = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"disconnectedReason"];
    disconnectedReason = v5->_disconnectedReason;
    v5->_disconnectedReason = (NSNumber *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)INStartCallIntentDonationMetadata;
  id v4 = [(INIntentDonationMetadata *)&v8 copyWithZone:a3];
  [(INStartCallIntentDonationMetadata *)self callDuration];
  objc_msgSend(v4, "setCallDuration:");
  [(INStartCallIntentDonationMetadata *)self timeToEstablish];
  objc_msgSend(v4, "setTimeToEstablish:");
  objc_super v5 = [(INStartCallIntentDonationMetadata *)self recentCallStatus];
  [v4 setRecentCallStatus:v5];

  double v6 = [(INStartCallIntentDonationMetadata *)self disconnectedReason];
  [v4 setDisconnectedReason:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INStartCallIntentDonationMetadata *)a3;
  objc_super v5 = v4;
  if (self != v4)
  {
    double v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(INStartCallIntentDonationMetadata *)self callDuration];
        double v8 = v7;
        [(INStartCallIntentDonationMetadata *)v6 callDuration];
        if (v8 != v9
          || ([(INStartCallIntentDonationMetadata *)self timeToEstablish],
              double v11 = v10,
              [(INStartCallIntentDonationMetadata *)v6 timeToEstablish],
              v11 != v12))
        {
          BOOL v15 = 0;
LABEL_15:

          goto LABEL_16;
        }
        v13 = [(INStartCallIntentDonationMetadata *)self recentCallStatus];
        objc_super v14 = [(INStartCallIntentDonationMetadata *)v6 recentCallStatus];
        if (v13 == v14)
        {
          v16 = [(INStartCallIntentDonationMetadata *)self disconnectedReason];
          v17 = [(INStartCallIntentDonationMetadata *)v6 disconnectedReason];
          BOOL v15 = v16 == v17;
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
        v13 = v6;
        double v6 = 0;
      }
    }
    else
    {
      v13 = 0;
      BOOL v15 = 0;
    }

    goto LABEL_15;
  }
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)INStartCallIntentDonationMetadata;
  unint64_t v3 = [(INStartCallIntentDonationMetadata *)&v11 hash];
  id v4 = [NSNumber numberWithDouble:self->_callDuration];
  uint64_t v5 = [v4 hash] ^ v3;
  double v6 = [NSNumber numberWithDouble:self->_timeToEstablish];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = v5 ^ v7 ^ [(NSNumber *)self->_recentCallStatus hash];
  unint64_t v9 = v8 ^ [(NSNumber *)self->_disconnectedReason hash];

  return v9;
}

- (INStartCallIntentDonationMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)INStartCallIntentDonationMetadata;
  return (INStartCallIntentDonationMetadata *)[(INIntentDonationMetadata *)&v3 _init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)_intentClass
{
  return (Class)objc_opt_class();
}

@end