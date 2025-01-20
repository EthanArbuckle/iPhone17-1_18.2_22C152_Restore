@interface CTPNRRequestType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTPNRRequestType:(id)a3;
- (CTPNRRequestType)init;
- (CTPNRRequestType)initWithCoder:(id)a3;
- (NSArray)pnrReqList;
- (NSData)pushToken;
- (NSNumber)attemptCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttemptCount:(id)a3;
- (void)setPnrReqList:(id)a3;
- (void)setPushToken:(id)a3;
@end

@implementation CTPNRRequestType

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTPNRRequestType *)self pushToken];
  [v3 appendFormat:@", pushToken=%@", v4];

  v5 = [(CTPNRRequestType *)self attemptCount];
  [v3 appendFormat:@", attempt=%@", v5];

  v6 = [(CTPNRRequestType *)self pnrReqList];
  [v3 appendFormat:@", requestList=%@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (CTPNRRequestType)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTPNRRequestType;
  v2 = [(CTPNRRequestType *)&v5 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CTPNRRequestType *)v2 setAttemptCount:v3];
  }
  return v2;
}

- (BOOL)isEqualToCTPNRRequestType:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    char v11 = 0;
    goto LABEL_21;
  }
  v9 = [(CTPNRRequestType *)self pushToken];
  if (v9 || ([v8 pushToken], (objc_super v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTPNRRequestType *)self pushToken];
    v4 = [v8 pushToken];
    if (([v3 isEqualToData:v4] & 1) == 0)
    {

      char v11 = 0;
      goto LABEL_18;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  v12 = [(CTPNRRequestType *)self attemptCount];
  if (!v12)
  {
    v22 = [v8 attemptCount];
    if (!v22)
    {
      v22 = 0;
      int v23 = 0;
      goto LABEL_23;
    }
  }
  v6 = [(CTPNRRequestType *)self attemptCount];
  v13 = [v8 attemptCount];
  if (v6 == v13)
  {
    int v23 = 1;
LABEL_23:
    v15 = [(CTPNRRequestType *)self pnrReqList];
    if (v15 || ([v8 pnrReqList], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v20 = v10;
      v21 = v5;
      v16 = [(CTPNRRequestType *)self pnrReqList];
      v17 = [v8 pnrReqList];
      char v11 = [v16 isEqualToArray:v17];

      if (v15)
      {

        objc_super v5 = v21;
        int v10 = v20;
        if (!v23) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      objc_super v5 = v21;
      int v10 = v20;
      v18 = (void *)v19;
    }
    else
    {
      v18 = 0;
      char v11 = 1;
    }

    if ((v23 & 1) == 0)
    {
LABEL_28:
      if (!v12) {

      }
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_27:

    goto LABEL_28;
  }

  if (v12) {
  else
  }

  char v11 = 0;
  if (v10)
  {
LABEL_17:
  }
LABEL_18:
  if (!v9) {

  }
LABEL_21:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTPNRRequestType *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTPNRRequestType *)self isEqualToCTPNRRequestType:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTPNRRequestType allocWithZone:a3];
  [(CTPNRRequestType *)v4 setAttemptCount:self->_attemptCount];
  [(CTPNRRequestType *)v4 setPushToken:self->_pushToken];
  [(CTPNRRequestType *)v4 setPnrReqList:self->_pnrReqList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  attemptCount = self->_attemptCount;
  id v5 = a3;
  [v5 encodeObject:attemptCount forKey:@"attempt_count"];
  [v5 encodeObject:self->_pushToken forKey:@"push_token"];
  [v5 encodeObject:self->_pnrReqList forKey:@"pnr_req"];
}

- (CTPNRRequestType)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTPNRRequestType;
  id v5 = [(CTPNRRequestType *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attempt_count"];
    attemptCount = v5->_attemptCount;
    v5->_attemptCount = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"push_token"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSData *)v8;

    int v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"pnr_req"];
    pnrReqList = v5->_pnrReqList;
    v5->_pnrReqList = (NSArray *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
{
}

- (NSArray)pnrReqList
{
  return self->_pnrReqList;
}

- (void)setPnrReqList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pnrReqList, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);

  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end