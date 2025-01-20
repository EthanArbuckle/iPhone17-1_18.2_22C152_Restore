@interface CATTaskProgress
+ (BOOL)supportsSecureCoding;
+ (Class)classForResultObjectWithRequestClassName:(id)a3;
+ (id)progressForOperation:(id)a3;
+ (void)assertResultObject:(id)a3 isValidForRequestClassName:(id)a4;
- (BOOL)isCancelable;
- (BOOL)isCanceled;
- (CATTaskProgress)init;
- (CATTaskProgress)initWithCoder:(id)a3;
- (CATTaskProgress)initWithOperation:(id)a3;
- (CATTaskProgress)initWithOperationUUID:(id)a3;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSString)requestClassName;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)progressStateDescription;
- (id)resultObject;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (unint64_t)phase;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setIsCancelable:(BOOL)a3;
- (void)setIsCanceled:(BOOL)a3;
- (void)setPhase:(unint64_t)a3;
- (void)setProgress:(id)a3;
- (void)setRequestClassName:(id)a3;
- (void)setResultObject:(id)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation CATTaskProgress

+ (id)progressForOperation:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithOperation:v4];

  return v5;
}

- (CATTaskProgress)initWithOperationUUID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CATTaskProgress.m", 53, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)CATTaskProgress;
  v6 = [(CATTaskProgress *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

    v6->_completedUnitCount = -1;
    v6->_totalUnitCount = -1;
  }

  return v6;
}

- (CATTaskProgress)initWithOperation:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CATTaskProgress.m", 69, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  v6 = [v5 UUID];
  uint64_t v7 = [(CATTaskProgress *)self initWithOperationUUID:v6];

  if (v7)
  {
    v8 = [v5 request];
    v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    requestClassName = v7->_requestClassName;
    v7->_requestClassName = (NSString *)v10;

    uint64_t v12 = [v5 resultObject];
    id resultObject = v7->_resultObject;
    v7->_id resultObject = (id)v12;

    v7->_phase = [v5 phase];
    uint64_t v14 = [v5 error];
    error = v7->_error;
    v7->_error = (NSError *)v14;

    uint64_t v16 = [v5 userInfo];
    userInfo = v7->_userInfo;
    v7->_userInfo = (NSDictionary *)v16;

    v7->_isCancelable = [(id)objc_opt_class() isCancelable];
    v7->_isCanceled = [v5 isCanceled];
    v7->_completedUnitCount = [v5 completedUnitCount];
    v7->_totalUnitCount = [v5 totalUnitCount];
    [(id)objc_opt_class() assertResultObject:v7->_resultObject isValidForRequestClassName:v7->_requestClassName];
  }

  return v7;
}

- (CATTaskProgress)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATTaskProgress.m", 93, @"%@ cannot call %@ because it is not allowed", v5, v6 object file lineNumber description];

  return 0;
}

- (unint64_t)state
{
  if ([(CATTaskProgress *)self phase] != 3) {
    return 0;
  }
  v3 = [(CATTaskProgress *)self error];
  if (v3) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 1;
  }

  return v4;
}

+ (void)assertResultObject:(id)a3 isValidForRequestClassName:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    uint64_t v8 = [(id)objc_opt_class() classForResultObjectWithRequestClassName:v7];
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2, a1, @"CATTaskProgress.m", 118, @"%@: resultObject (%@) is not accepted class %@", a1, v10, v8 object file lineNumber description];
    }
  }
}

+ (Class)classForResultObjectWithRequestClassName:(id)a3
{
  Class v3 = NSClassFromString((NSString *)a3);
  unint64_t v4 = (void *)[(objc_class *)v3 allowlistedClassForResultObject];
  if (!v4) {
    unint64_t v4 = (void *)[(objc_class *)v3 whitelistedClassForResultObject];
  }

  return (Class)v4;
}

- (id)progressStateDescription
{
  unint64_t v3 = [(CATTaskProgress *)self state];
  if (v3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[CATTaskProgress state](self, "state"));
    unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v4 = off_2641DC620[v3];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CATTaskProgress;
  uint64_t v5 = [(CATTaskProgress *)&v38 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phase"];
    v5->_phase = [v9 unsignedIntegerValue];

    id v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v11;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v36 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v37, "setWithObjects:", v36, v35, v13, v14, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCancelable"];
    v5->_isCancelable = [v24 BOOLValue];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isCanceled"];
    v5->_isCanceled = [v25 BOOLValue];

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalUnitCount"];
    v5->_totalUnitCount = [v26 integerValue];

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completedUnitCount"];
    v5->_completedUnitCount = [v27 integerValue];

    v28 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"requestClassName"];
    requestClassName = v5->_requestClassName;
    v5->_requestClassName = (NSString *)v29;

    v31 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_msgSend((id)objc_opt_class(), "classForResultObjectWithRequestClassName:", v5->_requestClassName), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"resultObject"];
    id resultObject = v5->_resultObject;
    v5->_id resultObject = (id)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CATTaskProgress *)self UUID];
  [v4 encodeObject:v5 forKey:@"UUID"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATTaskProgress phase](self, "phase"));
  [v4 encodeObject:v6 forKey:@"phase"];

  uint64_t v7 = [(CATTaskProgress *)self requestClassName];
  [v4 encodeObject:v7 forKey:@"requestClassName"];

  uint64_t v8 = [(CATTaskProgress *)self resultObject];
  [v4 encodeObject:v8 forKey:@"resultObject"];

  v9 = [(CATTaskProgress *)self error];
  [v4 encodeObject:v9 forKey:@"error"];

  id v10 = [(CATTaskProgress *)self userInfo];
  [v4 encodeObject:v10 forKey:@"userInfo"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[CATTaskProgress isCancelable](self, "isCancelable"));
  [v4 encodeObject:v11 forKey:@"isCancelable"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[CATTaskProgress isCanceled](self, "isCanceled"));
  [v4 encodeObject:v12 forKey:@"isCanceled"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[CATTaskProgress totalUnitCount](self, "totalUnitCount"));
  [v4 encodeObject:v13 forKey:@"totalUnitCount"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[CATTaskProgress completedUnitCount](self, "completedUnitCount"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v14 forKey:@"completedUnitCount"];
}

- (id)description
{
  unint64_t v3 = [(CATTaskProgress *)self state];
  if (v3 == 2)
  {
    uint64_t v5 = NSString;
    v6 = [(CATTaskProgress *)self error];
    [v5 stringWithFormat:@"finished, error = %@", v6];
  }
  else
  {
    if (v3 == 1)
    {
      id v4 = [NSString stringWithFormat:@"finished"];
      goto LABEL_7;
    }
    uint64_t v7 = NSString;
    v6 = [(CATTaskProgress *)self progressStateDescription];
    [v7 stringWithFormat:@"state = %@", v6];
  id v4 = };

LABEL_7:
  uint64_t v8 = NSString;
  v9 = [(CATTaskProgress *)self UUID];
  id v10 = [v8 stringWithFormat:@"{ UUID = %@, %@ }", v9, v4];

  return v10;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CATTaskProgress *)self UUID];
  v6 = [v5 UUIDString];
  uint64_t v7 = [(CATTaskProgress *)self progressStateDescription];
  uint64_t v8 = [(CATTaskProgress *)self error];
  v9 = [v3 stringWithFormat:@"<%@: %p { UUID = %@, state = %@, error = %@ }>", v4, self, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    v6 = +[CATTaskProgress allocWithZone:a3];
    uint64_t v7 = [(CATTaskProgress *)self UUID];
    uint64_t v8 = [(CATTaskProgress *)v6 initWithOperationUUID:v7];

    [(CATTaskProgress *)v8 setProgress:self];
    return v8;
  }
  else
  {
    return self;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[CATMutableTaskProgress allocWithZone:a3];
  uint64_t v5 = [(CATTaskProgress *)self UUID];
  v6 = [(CATMutableTaskProgress *)v4 initWithOperationUUID:v5];

  [(CATMutableTaskProgress *)v6 setProgress:self];
  return v6;
}

- (void)setProgress:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [v21 error];
  uint64_t v5 = (void *)[v4 copy];
  [(CATTaskProgress *)self setError:v5];

  -[CATTaskProgress setPhase:](self, "setPhase:", [v21 phase]);
  -[CATTaskProgress setIsCancelable:](self, "setIsCancelable:", [v21 isCancelable]);
  -[CATTaskProgress setIsCanceled:](self, "setIsCanceled:", [v21 isCanceled]);
  -[CATTaskProgress setTotalUnitCount:](self, "setTotalUnitCount:", [v21 totalUnitCount]);
  -[CATTaskProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", [v21 completedUnitCount]);
  v6 = [v21 requestClassName];
  [(CATTaskProgress *)self setRequestClassName:v6];

  uint64_t v7 = [v21 resultObject];
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);

  id v10 = [v21 resultObject];
  if (![v10 conformsToProtocol:&unk_26C4BF148]) {
    goto LABEL_6;
  }
  uint64_t v11 = [v21 resultObject];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  if ([v9 hasPrefix:@"NSMutable"])
  {

LABEL_13:
    uint64_t v15 = [v21 resultObject];
    uint64_t v16 = [v15 mutableCopy];
    goto LABEL_14;
  }
  int v17 = [v9 hasPrefix:@"CATMutable"];

  if (v17) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v12 = [v21 resultObject];
  if (([v12 conformsToProtocol:&unk_26C4B8D68] & 1) == 0)
  {

    goto LABEL_11;
  }
  uint64_t v13 = [v21 resultObject];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
LABEL_11:
    uint64_t v15 = [v21 resultObject];
    [(CATTaskProgress *)self setResultObject:v15];
    goto LABEL_15;
  }
  uint64_t v15 = [v21 resultObject];
  uint64_t v16 = [v15 copy];
LABEL_14:
  uint64_t v18 = (void *)v16;
  [(CATTaskProgress *)self setResultObject:v16];

LABEL_15:
  uint64_t v19 = [v21 userInfo];
  uint64_t v20 = (void *)[v19 copy];
  [(CATTaskProgress *)self setUserInfo:v20];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(unint64_t)a3
{
  self->_phase = a3;
}

- (id)resultObject
{
  return self->_resultObject;
}

- (void)setResultObject:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)isCancelable
{
  return self->_isCancelable;
}

- (void)setIsCancelable:(BOOL)a3
{
  self->_isCancelable = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (NSString)requestClassName
{
  return self->_requestClassName;
}

- (void)setRequestClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestClassName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_resultObject, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end