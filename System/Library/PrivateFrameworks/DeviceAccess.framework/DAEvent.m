@interface DAEvent
+ (BOOL)supportsSecureCoding;
+ (id)allocInitWithXPCObject:(id)a3 error:(id *)a4;
- (DAEvent)initWithCoder:(id)a3;
- (DAEvent)initWithEventType:(int64_t)a3;
- (DAEvent)initWithEventType:(int64_t)a3 error:(id)a4;
- (DAEvent)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSError)error;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
@end

@implementation DAEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allocInitWithXPCObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (CUXPCDecodeSInt64RangedEx() != 5 && a4)
  {
    DAErrorF(350001, (uint64_t)"DAEvent init bad type: %d", v6, v7, v8, v9, v10, v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (DAEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DAEvent;
  id v5 = [(DAEvent *)&v18 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    if ([v7 containsValueForKey:@"evTy"]) {
      v5->_eventType = [v7 decodeIntegerForKey:@"evTy"];
    }

    uint64_t v8 = v5;
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v17 = DAErrorF(350001, (uint64_t)"%@ init failed", v11, v12, v13, v14, v15, v16, v10);
    [v4 failWithError:v17];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  error = self->_error;
  id v7 = v4;
  if (error)
  {
    [v4 encodeObject:error forKey:@"errr"];
    id v4 = v7;
  }
  int64_t eventType = self->_eventType;
  if (eventType)
  {
    [v7 encodeInteger:eventType forKey:@"evTy"];
    id v4 = v7;
  }
}

- (DAEvent)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DAEvent;
  id v7 = [(DAEvent *)&v18 init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v11 = objc_opt_class();
      DAErrorF(350001, (uint64_t)"%@ super init failed", v12, v13, v14, v15, v16, v17, v11);
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  if (!CUXPCDecodeNSError()) {
    goto LABEL_10;
  }
  int64_t v19 = 0;
  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 != 6)
  {
    if (v8 != 5) {
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  v7->_int64_t eventType = v19;
LABEL_6:
  uint64_t v9 = v7;
LABEL_7:

  return v9;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  CUXPCEncodeNSError();
  int64_t eventType = self->_eventType;
  if (eventType) {
    xpc_dictionary_set_int64(xdict, "evTy", eventType);
  }
}

- (DAEvent)initWithEventType:(int64_t)a3
{
  id v4 = [(DAEvent *)self init];
  id v5 = v4;
  if (v4)
  {
    v4->_int64_t eventType = a3;
    id v6 = v4;
  }

  return v5;
}

- (DAEvent)initWithEventType:(int64_t)a3 error:(id)a4
{
  id v7 = a4;
  int v8 = [(DAEvent *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_error, a4);
    v9->_int64_t eventType = a3;
    uint64_t v10 = v9;
  }

  return v9;
}

- (id)description
{
  return [(DAEvent *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v4 = (__CFString *)0;
  }
  int64_t eventType = self->_eventType;
  if (eventType)
  {
    uint64_t v13 = DAEventTypeToString(eventType);
    CUAppendF();
    id v6 = v4;

    id v4 = v6;
  }
  error = self->_error;
  if (error)
  {
    int v8 = error;
    uint64_t v14 = CUPrintNSError();
    CUAppendF();
    uint64_t v9 = v4;

    id v4 = v9;
  }
  uint64_t v10 = &stru_26D120818;
  if (v4) {
    uint64_t v10 = v4;
  }
  uint64_t v11 = v10;

  return v11;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end