@interface HKFHIRRequestTaskEndState
+ (BOOL)supportsSecureCoding;
+ (id)endStateForCanceledRequestAtURL:(id)a3 resourceType:(id)a4 interactionType:(int64_t)a5;
- (BOOL)hadError;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasCanceled;
- (HKFHIRRequestTaskEndState)init;
- (HKFHIRRequestTaskEndState)initWithCoder:(id)a3;
- (HKFHIRRequestTaskEndState)initWithRequestedURL:(id)a3 resourceType:(id)a4 interactionType:(int64_t)a5 responseStatusCode:(int64_t)a6 requestEndTime:(id)a7 requestDuration:(double)a8 hadError:(BOOL)a9 errorCode:(id)a10;
- (NSDate)requestEndTime;
- (NSString)errorCode;
- (NSString)eventLoggingDescription;
- (NSString)resourceType;
- (NSURL)requestedURL;
- (double)requestDuration;
- (id)asErrorEndStateWithErrorCode:(id)a3;
- (id)description;
- (int64_t)interactionType;
- (int64_t)responseStatusCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRRequestTaskEndState

- (HKFHIRRequestTaskEndState)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRRequestTaskEndState)initWithRequestedURL:(id)a3 resourceType:(id)a4 interactionType:(int64_t)a5 responseStatusCode:(int64_t)a6 requestEndTime:(id)a7 requestDuration:(double)a8 hadError:(BOOL)a9 errorCode:(id)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a10;
  if (v18)
  {
    if (v20) {
      goto LABEL_3;
    }
  }
  else
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HKFHIRRequestTaskEndState.m", 29, @"Invalid parameter not satisfying: %@", @"requestedURL" object file lineNumber description];

    if (v20) {
      goto LABEL_3;
    }
  }
  v33 = [MEMORY[0x263F08690] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"HKFHIRRequestTaskEndState.m", 30, @"Invalid parameter not satisfying: %@", @"requestEndTime" object file lineNumber description];

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)HKFHIRRequestTaskEndState;
  v22 = [(HKFHIRRequestTaskEndState *)&v34 init];
  if (v22)
  {
    uint64_t v23 = [v18 copy];
    requestedURL = v22->_requestedURL;
    v22->_requestedURL = (NSURL *)v23;

    uint64_t v25 = [v19 copy];
    resourceType = v22->_resourceType;
    v22->_resourceType = (NSString *)v25;

    v22->_interactionType = a5;
    v22->_responseStatusCode = a6;
    uint64_t v27 = [v20 copy];
    requestEndTime = v22->_requestEndTime;
    v22->_requestEndTime = (NSDate *)v27;

    v22->_requestDuration = a8;
    v22->_hadError = a9;
    uint64_t v29 = [v21 copy];
    errorCode = v22->_errorCode;
    v22->_errorCode = (NSString *)v29;
  }
  return v22;
}

+ (id)endStateForCanceledRequestAtURL:(id)a3 resourceType:(id)a4 interactionType:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  v11 = [MEMORY[0x263EFF910] now];
  v12 = (void *)[v10 initWithRequestedURL:v9 resourceType:v8 interactionType:a5 responseStatusCode:0 requestEndTime:v11 requestDuration:1 hadError:0.0 errorCode:0];

  return v12;
}

- (BOOL)wasCanceled
{
  return self->_responseStatusCode == 0;
}

- (NSString)eventLoggingDescription
{
  v3 = NSString;
  resourceType = self->_resourceType;
  v5 = NSStringFromClinicalIngestionInteractionType(self->_interactionType);
  requestedURL = self->_requestedURL;
  int64_t responseStatusCode = self->_responseStatusCode;
  id v8 = HKStringFromBool();
  objc_msgSend(v3, "stringWithFormat:", @"End state for resource %@ %@; URL: %@; HTTP status: %lu; had error: %@",
    resourceType,
    v5,
    requestedURL,
    responseStatusCode,
  id v9 = v8);

  return (NSString *)v9;
}

- (id)asErrorEndStateWithErrorCode:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequestedURL:self->_requestedURL resourceType:self->_resourceType interactionType:self->_interactionType responseStatusCode:self->_responseStatusCode requestEndTime:self->_requestEndTime requestDuration:1 hadError:self->_requestDuration errorCode:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  resourceType = self->_resourceType;
  v6 = NSStringFromClinicalIngestionInteractionType(self->_interactionType);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p> resource: %@ %@, URL: %@; HTTP status: %lu",
    v4,
    self,
    resourceType,
    v6,
    self->_requestedURL,
  v7 = self->_responseStatusCode);

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_requestedURL hash];
  NSUInteger v4 = [(NSString *)self->_resourceType hash] ^ v3;
  int64_t v5 = self->_interactionType ^ self->_responseStatusCode;
  uint64_t v6 = v4 ^ v5 ^ [(NSDate *)self->_requestEndTime hash];
  unint64_t requestDuration = (unint64_t)self->_requestDuration;
  return v6 ^ [(NSString *)self->_errorCode hash] ^ self->_hadError ^ requestDuration;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (HKFHIRRequestTaskEndState *)a3;
  v7 = v6;
  if (self != v6)
  {
    id v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v14 = 0;
LABEL_32:

      goto LABEL_33;
    }
    requestedURL = self->_requestedURL;
    id v10 = [(HKFHIRRequestTaskEndState *)v8 requestedURL];
    if (requestedURL != v10)
    {
      uint64_t v11 = [(HKFHIRRequestTaskEndState *)v8 requestedURL];
      if (!v11)
      {
        BOOL v14 = 0;
        goto LABEL_31;
      }
      uint64_t v3 = (void *)v11;
      v12 = self->_requestedURL;
      v13 = [(HKFHIRRequestTaskEndState *)v8 requestedURL];
      if (![(NSURL *)v12 isEqual:v13])
      {
        BOOL v14 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v51 = v13;
    }
    resourceType = self->_resourceType;
    v16 = [(HKFHIRRequestTaskEndState *)v8 resourceType];
    if (resourceType != v16)
    {
      uint64_t v17 = [(HKFHIRRequestTaskEndState *)v8 resourceType];
      if (!v17)
      {
LABEL_28:

        goto LABEL_29;
      }
      NSUInteger v4 = (void *)v17;
      id v18 = self->_resourceType;
      uint64_t v19 = [(HKFHIRRequestTaskEndState *)v8 resourceType];
      id v20 = v18;
      id v21 = (void *)v19;
      if (![(NSString *)v20 isEqualToString:v19])
      {

LABEL_27:
        goto LABEL_28;
      }
      v50 = v21;
    }
    int64_t interactionType = self->_interactionType;
    if (interactionType != [(HKFHIRRequestTaskEndState *)v8 interactionType]
      || (int64_t responseStatusCode = self->_responseStatusCode,
          responseStatusCode != [(HKFHIRRequestTaskEndState *)v8 responseStatusCode]))
    {
      BOOL v14 = 0;
      BOOL v33 = resourceType == v16;
      v32 = v50;
      v13 = v51;
      if (v33) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    requestEndTime = self->_requestEndTime;
    v49 = [(HKFHIRRequestTaskEndState *)v8 requestEndTime];
    if (requestEndTime == v49)
    {
      v48 = requestEndTime;
      double requestDuration = self->_requestDuration;
      [(HKFHIRRequestTaskEndState *)v8 requestDuration];
      if (requestDuration == v36) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v25 = [(HKFHIRRequestTaskEndState *)v8 requestEndTime];
      if (v25)
      {
        v47 = (void *)v25;
        v48 = requestEndTime;
        v26 = self->_requestEndTime;
        uint64_t v27 = [(HKFHIRRequestTaskEndState *)v8 requestEndTime];
        v28 = v26;
        uint64_t v29 = (void *)v27;
        if ([(NSDate *)v28 isEqualToDate:v27])
        {
          v45 = v29;
          double v30 = self->_requestDuration;
          [(HKFHIRRequestTaskEndState *)v8 requestDuration];
          if (v30 != v31)
          {
            BOOL v14 = 0;
            v32 = v50;
            goto LABEL_44;
          }
LABEL_35:
          errorCode = self->_errorCode;
          v46 = [(HKFHIRRequestTaskEndState *)v8 errorCode];
          if (errorCode != v46)
          {
            uint64_t v38 = [(HKFHIRRequestTaskEndState *)v8 errorCode];
            if (!v38)
            {

              BOOL v14 = 0;
              goto LABEL_51;
            }
            v43 = self->_errorCode;
            v44 = (void *)v38;
            uint64_t v39 = [(HKFHIRRequestTaskEndState *)v8 errorCode];
            v40 = v43;
            v42 = (void *)v39;
            if (!-[NSString isEqualToString:](v40, "isEqualToString:"))
            {
              BOOL v14 = 0;
              goto LABEL_43;
            }
          }
          BOOL hadError = self->_hadError;
          BOOL v14 = hadError == [(HKFHIRRequestTaskEndState *)v8 hadError];
          if (errorCode != v46)
          {
LABEL_43:
            v32 = v50;

            if (v48 == v49) {
              goto LABEL_45;
            }
            goto LABEL_44;
          }

LABEL_51:
          v32 = v50;
          if (v48 == v49)
          {
LABEL_45:

            BOOL v33 = resourceType == v16;
            v13 = v51;
            if (v33)
            {
LABEL_23:

              if (requestedURL == v10) {
                goto LABEL_31;
              }
              goto LABEL_30;
            }
LABEL_22:

            goto LABEL_23;
          }
LABEL_44:

          goto LABEL_45;
        }

        if (resourceType == v16)
        {

LABEL_29:
          BOOL v14 = 0;
          v13 = v51;
          if (requestedURL != v10) {
            goto LABEL_30;
          }
LABEL_31:

          goto LABEL_32;
        }

        goto LABEL_27;
      }
    }
    BOOL v14 = 0;
    v32 = v50;
    goto LABEL_45;
  }
  BOOL v14 = 1;
LABEL_33:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  requestedURL = self->_requestedURL;
  id v5 = a3;
  [v5 encodeObject:requestedURL forKey:@"requestedURL"];
  [v5 encodeObject:self->_resourceType forKey:@"resourceType"];
  [v5 encodeInteger:self->_interactionType forKey:@"interactionType"];
  [v5 encodeInteger:self->_responseStatusCode forKey:@"responseStatusCode"];
  [v5 encodeObject:self->_requestEndTime forKey:@"requestEndTime"];
  [v5 encodeDouble:@"requestDuration" forKey:self->_requestDuration];
  [v5 encodeBool:self->_hadError forKey:@"hadError"];
  [v5 encodeObject:self->_errorCode forKey:@"errorCode"];
}

- (HKFHIRRequestTaskEndState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedURL"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestEndTime"];
  if (v5
    && [v4 containsValueForKey:@"interactionType"]
    && [v4 containsValueForKey:@"responseStatusCode"]
    && v6
    && [v4 containsValueForKey:@"requestDuration"]
    && ([v4 containsValueForKey:@"hadError"] & 1) != 0)
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceType"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"interactionType"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"responseStatusCode"];
    [v4 decodeDoubleForKey:@"requestDuration"];
    double v11 = v10;
    uint64_t v12 = [v4 decodeBoolForKey:@"hadError"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorCode"];
    self = [(HKFHIRRequestTaskEndState *)self initWithRequestedURL:v5 resourceType:v7 interactionType:v8 responseStatusCode:v9 requestEndTime:v6 requestDuration:v12 hadError:v11 errorCode:v13];

    BOOL v14 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    BOOL v14 = 0;
  }

  return v14;
}

- (NSURL)requestedURL
{
  return self->_requestedURL;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (int64_t)interactionType
{
  return self->_interactionType;
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (NSDate)requestEndTime
{
  return self->_requestEndTime;
}

- (double)requestDuration
{
  return self->_requestDuration;
}

- (BOOL)hadError
{
  return self->_hadError;
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_requestEndTime, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);

  objc_storeStrong((id *)&self->_requestedURL, 0);
}

@end