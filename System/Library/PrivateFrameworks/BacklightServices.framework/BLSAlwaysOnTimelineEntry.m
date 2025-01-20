@interface BLSAlwaysOnTimelineEntry
+ (id)loggingStringForPresentationTime:(id)a3;
+ (id)shortLoggingStringForPresentationTime:(id)a3;
- (BLSAlwaysOnTimelineEntry)initWithPresentationTime:(id)a3 requestedFidelity:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timelineIdentifier:(id)a7 userObject:(id)a8;
- (BOOL)isAnimated;
- (BOOL)isEqual:(id)a3;
- (NSDate)presentationTime;
- (NSObject)timelineIdentifier;
- (NSObject)userObject;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (int64_t)requestedFidelity;
- (unint64_t)hash;
- (void)setAnimated:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setRequestedFidelity:(int64_t)a3;
- (void)setTimelineIdentifier:(id)a3;
- (void)setUserObject:(id)a3;
@end

@implementation BLSAlwaysOnTimelineEntry

- (BLSAlwaysOnTimelineEntry)initWithPresentationTime:(id)a3 requestedFidelity:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 timelineIdentifier:(id)a7 userObject:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BLSAlwaysOnTimelineEntry;
  v18 = [(BLSAlwaysOnTimelineEntry *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_presentationTime, a3);
    v19->_requestedFidelity = a4;
    v19->_animated = a5;
    v19->_duration = a6;
    objc_storeStrong((id *)&v19->_timelineIdentifier, a7);
    objc_storeStrong((id *)&v19->_userObject, a8);
  }

  return v19;
}

- (int64_t)compare:(id)a3
{
  presentationTime = self->_presentationTime;
  v4 = [a3 presentationTime];
  int64_t v5 = [(NSDate *)presentationTime compare:v4];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(NSDate *)self->_presentationTime bls_shortLoggingString];
  [v3 appendString:v4 withName:@"time"];

  id v5 = (id)[v3 appendBool:self->_animated withName:@"animated" ifEqualTo:1];
  if (self->_animated) {
    id v6 = (id)[v3 appendDouble:@"duration" withName:3 decimalPrecision:self->_duration];
  }
  id v7 = (id)[v3 appendObject:self->_timelineIdentifier withName:@"timeline" skipIfNil:0];
  v8 = NSStringFromBLSUpdateFidelity(self->_requestedFidelity);
  id v9 = (id)[v3 appendObject:v8 withName:@"fidelity"];

  id v10 = (id)[v3 appendObject:self->_userObject withName:@"userObject" skipIfNil:1];
  v11 = [v3 build];

  return v11;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(NSDate *)self->_presentationTime bls_loggingString];
  [v3 appendString:v4 withName:@"time"];

  id v5 = (id)[v3 appendBool:self->_animated withName:@"animated"];
  if (self->_animated) {
    id v6 = (id)[v3 appendDouble:@"duration" withName:3 decimalPrecision:self->_duration];
  }
  id v7 = (id)[v3 appendObject:self->_timelineIdentifier withName:@"timeline" skipIfNil:0];
  v8 = NSStringFromBLSUpdateFidelity(self->_requestedFidelity);
  id v9 = (id)[v3 appendObject:v8 withName:@"fidelity"];

  id v10 = [self->_userObject debugDescription];
  id v11 = (id)[v3 appendObject:v10 withName:@"userObject" skipIfNil:1];

  v12 = [v3 build];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 userObject];
    presentationTime = self->_presentationTime;
    id v7 = [v4 presentationTime];
    if ([(NSDate *)presentationTime isEqual:v7])
    {
      timelineIdentifier = self->_timelineIdentifier;
      id v9 = [v4 timelineIdentifier];
      if ([timelineIdentifier isEqual:v9])
      {
        userObject = self->_userObject;
        if (v5 | (unint64_t)userObject) {
          char v11 = [userObject isEqual:v5];
        }
        else {
          char v11 = 1;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_presentationTime hash];
  uint64_t v4 = [self->_timelineIdentifier hash] ^ v3;
  return v4 ^ [self->_userObject hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [BLSAlwaysOnTimelineEntry alloc];
  presentationTime = self->_presentationTime;
  int64_t requestedFidelity = self->_requestedFidelity;
  BOOL animated = self->_animated;
  double duration = self->_duration;
  timelineIdentifier = self->_timelineIdentifier;
  userObject = self->_userObject;

  return [(BLSAlwaysOnTimelineEntry *)v4 initWithPresentationTime:presentationTime requestedFidelity:requestedFidelity animated:animated duration:timelineIdentifier timelineIdentifier:userObject userObject:duration];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [BLSAlwaysOnTimelineUnconfiguredEntry alloc];
  presentationTime = self->_presentationTime;
  int64_t requestedFidelity = self->_requestedFidelity;
  BOOL animated = self->_animated;
  double duration = self->_duration;
  timelineIdentifier = self->_timelineIdentifier;
  userObject = self->_userObject;

  return [(BLSAlwaysOnTimelineUnconfiguredEntry *)v4 initWithPresentationTime:presentationTime requestedFidelity:requestedFidelity animated:animated duration:timelineIdentifier timelineIdentifier:userObject userObject:duration];
}

+ (id)loggingStringForPresentationTime:(id)a3
{
  return (id)objc_msgSend(a3, "bls_loggingString");
}

+ (id)shortLoggingStringForPresentationTime:(id)a3
{
  return (id)objc_msgSend(a3, "bls_shortLoggingString");
}

- (NSDate)presentationTime
{
  return self->_presentationTime;
}

- (int64_t)requestedFidelity
{
  return self->_requestedFidelity;
}

- (void)setRequestedFidelity:(int64_t)a3
{
  self->_int64_t requestedFidelity = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_BOOL animated = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (NSObject)timelineIdentifier
{
  return self->_timelineIdentifier;
}

- (void)setTimelineIdentifier:(id)a3
{
}

- (NSObject)userObject
{
  return self->_userObject;
}

- (void)setUserObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userObject, 0);
  objc_storeStrong((id *)&self->_timelineIdentifier, 0);

  objc_storeStrong((id *)&self->_presentationTime, 0);
}

@end