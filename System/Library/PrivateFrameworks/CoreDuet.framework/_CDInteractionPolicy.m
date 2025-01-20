@interface _CDInteractionPolicy
+ (id)defaultPolicy;
+ (id)defaultPolicyForCalls;
+ (id)defaultPolicyForEmail;
+ (id)defaultPolicyForMeetings;
+ (id)defaultPolicyForMessages;
+ (id)policyFromDictionary:(id)a3;
+ (id)policyWithRateLimiter:(id)a3 lifespanInSeconds:(unint64_t)a4 maxNumberStored:(unint64_t)a5 timeResolutionInSeconds:(unint64_t)a6 maxNumberOfRecipients:(unint64_t)a7 maxNumberOfKeywords:(unint64_t)a8 maxNumberOfAttachments:(unint64_t)a9;
+ (id)specialPolicyForFirstPartyApps;
+ (unint64_t)defaultLifespan;
+ (unint64_t)defaultMaxNumberOfAttachments;
+ (unint64_t)defaultMaxNumberOfKeywords;
+ (unint64_t)defaultMaxNumberOfRecipients;
+ (unint64_t)defaultMaxNumberStored;
+ (unint64_t)defaultTimeResolutionInSeconds;
- (_CDInteractionPolicy)initWithRateLimiter:(id)a3 lifespanInSeconds:(unint64_t)a4 maxNumberStored:(unint64_t)a5 timeResolutionInSeconds:(unint64_t)a6 maxNumberOfRecipients:(unint64_t)a7 maxNumberOfKeywords:(unint64_t)a8 maxNumberOfAttachments:(unint64_t)a9;
- (_CDRateLimiter)rateLimiter;
- (id)description;
- (unint64_t)lifespanInSeconds;
- (unint64_t)maxNumberOfAttachments;
- (unint64_t)maxNumberOfKeywords;
- (unint64_t)maxNumberOfRecipients;
- (unint64_t)maxNumberStored;
- (unint64_t)timeResolutionInSeconds;
- (void)setLifespanInSeconds:(unint64_t)a3;
- (void)setMaxNumberOfAttachments:(unint64_t)a3;
- (void)setMaxNumberOfKeywords:(unint64_t)a3;
- (void)setMaxNumberOfRecipients:(unint64_t)a3;
- (void)setMaxNumberStored:(unint64_t)a3;
- (void)setRateLimiter:(id)a3;
- (void)setTimeResolutionInSeconds:(unint64_t)a3;
@end

@implementation _CDInteractionPolicy

+ (id)policyWithRateLimiter:(id)a3 lifespanInSeconds:(unint64_t)a4 maxNumberStored:(unint64_t)a5 timeResolutionInSeconds:(unint64_t)a6 maxNumberOfRecipients:(unint64_t)a7 maxNumberOfKeywords:(unint64_t)a8 maxNumberOfAttachments:(unint64_t)a9
{
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithRateLimiter:v15 lifespanInSeconds:a4 maxNumberStored:a5 timeResolutionInSeconds:a6 maxNumberOfRecipients:a7 maxNumberOfKeywords:a8 maxNumberOfAttachments:a9];

  return v16;
}

- (_CDInteractionPolicy)initWithRateLimiter:(id)a3 lifespanInSeconds:(unint64_t)a4 maxNumberStored:(unint64_t)a5 timeResolutionInSeconds:(unint64_t)a6 maxNumberOfRecipients:(unint64_t)a7 maxNumberOfKeywords:(unint64_t)a8 maxNumberOfAttachments:(unint64_t)a9
{
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_CDInteractionPolicy;
  v17 = [(_CDInteractionPolicy *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rateLimiter, a3);
    v18->_lifespanInSeconds = a4;
    v18->_maxNumberStored = a5;
    v18->_timeResolutionInSeconds = a6;
    v18->_maxNumberOfRecipients = a7;
    v18->_maxNumberOfKeywords = a8;
    v18->_maxNumberOfAttachments = a9;
  }

  return v18;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@ { \n", v5];

  v6 = NSNumber;
  v7 = [(_CDInteractionPolicy *)self rateLimiter];
  v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "count"));
  [v3 appendFormat:@"     rateLimitCount: %@\n", v8];

  v9 = NSNumber;
  v10 = [(_CDInteractionPolicy *)self rateLimiter];
  [v10 period];
  v11 = objc_msgSend(v9, "numberWithDouble:");
  [v3 appendFormat:@"    rateLimitPeriod: %@\n", v11];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionPolicy lifespanInSeconds](self, "lifespanInSeconds"));
  [v3 appendFormat:@"           lifespan: %@\n", v12];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberStored](self, "maxNumberStored"));
  [v3 appendFormat:@"    maxNumberStored: %@\n", v13];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionPolicy timeResolutionInSeconds](self, "timeResolutionInSeconds"));
  [v3 appendFormat:@"     timeResolution: %@s\n", v14];

  id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberOfRecipients](self, "maxNumberOfRecipients"));
  [v3 appendFormat:@"      maxRecipients: %@\n", v15];

  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberOfKeywords](self, "maxNumberOfKeywords"));
  [v3 appendFormat:@"        maxKeywords: %@\n", v16];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_CDInteractionPolicy maxNumberOfAttachments](self, "maxNumberOfAttachments"));
  [v3 appendFormat:@"     maxAttachments: %@\n", v17];

  [v3 appendString:@"}\n"];
  return v3;
}

+ (id)policyFromDictionary:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 objectForKeyedSubscript:@"RateLimitCount"];
    v6 = [v4 objectForKeyedSubscript:@"RateLimitPeriodInSecounds"];
    v27 = [v4 objectForKeyedSubscript:@"LifespanInSeconds"];
    v7 = [v4 objectForKeyedSubscript:@"MaxNumberStored"];
    v8 = [v4 objectForKeyedSubscript:@"TimeResolutionInSeconds"];
    v9 = [v4 objectForKeyedSubscript:@"MaxNumberOfRecipients"];
    v10 = [v4 objectForKeyedSubscript:@"MaxNumberOfKeywords"];
    uint64_t v11 = [v4 objectForKeyedSubscript:@"MaxNumberOfAttachments"];
    v12 = (void *)v11;
    v13 = 0;
    if (v5 && v6 && v27 && v7 && v8 && v9 && v10 && v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0
        && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = [_CDRateLimiter alloc];
        uint64_t v14 = [v5 unsignedIntegerValue];
        [v6 doubleValue];
        uint64_t v15 = -[_CDRateLimiter initWithCount:perPeriod:](v25, "initWithCount:perPeriod:", v14);
        if (v15)
        {
          v26 = (void *)v15;
          uint64_t v24 = [v27 unsignedIntegerValue];
          uint64_t v23 = [v7 unsignedIntegerValue];
          uint64_t v22 = [v8 unsignedIntegerValue];
          uint64_t v21 = [v9 unsignedIntegerValue];
          uint64_t v16 = [v10 unsignedIntegerValue];
          uint64_t v20 = [v12 unsignedIntegerValue];
          id v17 = a1;
          v18 = v26;
          v13 = [v17 policyWithRateLimiter:v26 lifespanInSeconds:v24 maxNumberStored:v23 timeResolutionInSeconds:v22 maxNumberOfRecipients:v21 maxNumberOfKeywords:v16 maxNumberOfAttachments:v20];
        }
        else
        {
          v13 = 0;
          v18 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)defaultLifespan
{
  return 14515200;
}

+ (unint64_t)defaultTimeResolutionInSeconds
{
  return 0;
}

+ (unint64_t)defaultMaxNumberStored
{
  return 10000;
}

+ (unint64_t)defaultMaxNumberOfRecipients
{
  return 20;
}

+ (unint64_t)defaultMaxNumberOfKeywords
{
  return 20;
}

+ (unint64_t)defaultMaxNumberOfAttachments
{
  return 20;
}

+ (id)defaultPolicy
{
  id v3 = [[_CDRateLimiter alloc] initWithCount:500 perPeriod:60.0];
  id v4 = objc_msgSend(a1, "policyWithRateLimiter:lifespanInSeconds:maxNumberStored:timeResolutionInSeconds:maxNumberOfRecipients:maxNumberOfKeywords:maxNumberOfAttachments:", v3, objc_msgSend(a1, "defaultLifespan"), objc_msgSend(a1, "defaultMaxNumberStored"), objc_msgSend(a1, "defaultTimeResolutionInSeconds"), objc_msgSend(a1, "defaultMaxNumberOfRecipients"), objc_msgSend(a1, "defaultMaxNumberOfKeywords"), objc_msgSend(a1, "defaultMaxNumberOfAttachments"));

  return v4;
}

+ (id)defaultPolicyForEmail
{
  v2 = [a1 defaultPolicy];
  id v3 = [[_CDRateLimiter alloc] initWithCount:5000 perPeriod:60.0];
  [v2 setRateLimiter:v3];

  [v2 setTimeResolutionInSeconds:3600];
  [v2 setMaxNumberOfKeywords:0];
  return v2;
}

+ (id)defaultPolicyForMeetings
{
  v2 = [a1 defaultPolicy];
  id v3 = [[_CDRateLimiter alloc] initWithCount:1000 perPeriod:60.0];
  [v2 setRateLimiter:v3];

  return v2;
}

+ (id)defaultPolicyForMessages
{
  v2 = [a1 defaultPolicy];
  id v3 = [[_CDRateLimiter alloc] initWithCount:2000 perPeriod:60.0];
  [v2 setRateLimiter:v3];

  [v2 setMaxNumberOfKeywords:0];
  return v2;
}

+ (id)defaultPolicyForCalls
{
  v2 = [a1 defaultPolicy];
  [v2 setMaxNumberOfKeywords:0];
  return v2;
}

+ (id)specialPolicyForFirstPartyApps
{
  v2 = [a1 defaultPolicy];
  id v3 = [[_CDRateLimiter alloc] initWithCount:2000 perPeriod:60.0];
  [v2 setRateLimiter:v3];

  [v2 setLifespanInSeconds:14515200];
  [v2 setMaxNumberStored:50000];
  return v2;
}

- (_CDRateLimiter)rateLimiter
{
  return (_CDRateLimiter *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRateLimiter:(id)a3
{
}

- (unint64_t)lifespanInSeconds
{
  return self->_lifespanInSeconds;
}

- (void)setLifespanInSeconds:(unint64_t)a3
{
  self->_lifespanInSeconds = a3;
}

- (unint64_t)maxNumberStored
{
  return self->_maxNumberStored;
}

- (void)setMaxNumberStored:(unint64_t)a3
{
  self->_maxNumberStored = a3;
}

- (unint64_t)timeResolutionInSeconds
{
  return self->_timeResolutionInSeconds;
}

- (void)setTimeResolutionInSeconds:(unint64_t)a3
{
  self->_timeResolutionInSeconds = a3;
}

- (unint64_t)maxNumberOfRecipients
{
  return self->_maxNumberOfRecipients;
}

- (void)setMaxNumberOfRecipients:(unint64_t)a3
{
  self->_maxNumberOfRecipients = a3;
}

- (unint64_t)maxNumberOfKeywords
{
  return self->_maxNumberOfKeywords;
}

- (void)setMaxNumberOfKeywords:(unint64_t)a3
{
  self->_maxNumberOfKeywords = a3;
}

- (unint64_t)maxNumberOfAttachments
{
  return self->_maxNumberOfAttachments;
}

- (void)setMaxNumberOfAttachments:(unint64_t)a3
{
  self->_maxNumberOfAttachments = a3;
}

- (void).cxx_destruct
{
}

@end