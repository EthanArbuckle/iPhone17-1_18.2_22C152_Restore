@interface IXSPromisedAppReference
+ (BOOL)supportsSecureCoding;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)validateStagedPathWithError:(id *)a3;
- (IXSPromisedAppReference)initWithCoder:(id)a3;
- (IXSPromisedAppReference)initWithSeed:(id)a3 ifMatchingPredicate:(id)a4 error:(id *)a5;
- (MIAppReference)appReference;
- (void)encodeWithCoder:(id)a3;
- (void)markAppReferenceAsConsumed;
- (void)setAppReference:(id)a3;
@end

@implementation IXSPromisedAppReference

- (IXSPromisedAppReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IXSPromisedAppReference;
  v5 = [(IXSOwnedDataPromise *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appReference"];
    appReference = v5->_appReference;
    v5->_appReference = (MIAppReference *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v7.receiver = self;
  v7.super_class = (Class)IXSPromisedAppReference;
  [(IXSOwnedDataPromise *)&v7 encodeWithCoder:v4];
  uint64_t v6 = [(IXSPromisedAppReference *)self appReference];
  [v4 encodeObject:v6 forKey:@"appReference"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXSPromisedAppReference)initWithSeed:(id)a3 ifMatchingPredicate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)IXSPromisedAppReference;
  v10 = [(IXSOwnedDataPromise *)&v32 initWithSeed:v8 error:a5];
  if (!v10)
  {
    id v17 = 0;
    goto LABEL_7;
  }
  v11 = [v8 identity];
  id v31 = 0;
  v12 = sub_100015380(v11, (uint64_t)[v8 installationDomain], &v31);
  id v13 = v31;
  if (!v12)
  {
    v22 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10008CB08();
    }

    sub_10003DAE4((uint64_t)"-[IXSPromisedAppReference initWithSeed:ifMatchingPredicate:error:]", 68, @"IXErrorDomain", 0x32uLL, v13, 0, @"Could not get LSApplicationRecord for app with identity %@", v23, (uint64_t)v11);
    goto LABEL_14;
  }
  [v9 allowEvaluation];
  if (([v9 evaluateWithObject:v12] & 1) == 0)
  {
    v24 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10008CB8C();
    }

    sub_10003DAE4((uint64_t)"-[IXSPromisedAppReference initWithSeed:ifMatchingPredicate:error:]", 75, @"IXErrorDomain", 0x31uLL, 0, 0, @"Predicate %@ did not match for LSApplicationRecord %@", v25, (uint64_t)v9);
LABEL_14:
    id v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v14 = [v11 miAppIdentity];
  [v12 installSessionIdentifier];
  v15 = v27 = v11;
  id v30 = v13;
  MIAcquireReferenceForInstalledAppWithError();
  v16 = (MIAppReference *)objc_claimAutoreleasedReturnValue();
  id v17 = v13;

  if (v16)
  {
    appReference = v10->_appReference;
    v10->_appReference = v16;
    v19 = v16;

    v20 = [(IXSDataPromise *)v10 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014A0C;
    block[3] = &unk_1000E8FA8;
    v29 = v10;
    dispatch_sync(v20, block);

LABEL_7:
    v21 = v10;
    goto LABEL_18;
  }
  v11 = v27;
LABEL_15:

  if (a5)
  {
    id v17 = v17;
    v21 = 0;
    *a5 = v17;
  }
  else
  {
    v21 = 0;
  }
LABEL_18:

  return v21;
}

- (MIAppReference)appReference
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  appReference = self->_appReference;

  return appReference;
}

- (void)setAppReference:(id)a3
{
  uint64_t v6 = (MIAppReference *)a3;
  v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_appReference != v6) {
    objc_storeStrong((id *)&self->_appReference, a3);
  }
}

- (void)markAppReferenceAsConsumed
{
  v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  [(IXSPromisedAppReference *)self setAppReference:0];
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10008CC18();
    }

    v15 = @"Reason passed to -[IXSPromisedAppReference cancelForReason:client:error:] was nil";
    uint64_t v16 = 135;
    goto LABEL_12;
  }
  if (!a4)
  {
    id v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10008CC9C();
    }

    v15 = @"Client passed to -[IXSPromisedAppReference cancelForReason:client:error:] was IXClientNone (0)";
    uint64_t v16 = 140;
LABEL_12:
    sub_10003DAE4((uint64_t)"-[IXSPromisedAppReference cancelForReason:client:error:]", v16, @"IXErrorDomain", 0x35uLL, 0, 0, v15, v14, (uint64_t)v22.receiver);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    goto LABEL_13;
  }
  v10 = [(IXSPromisedAppReference *)self appReference];
  if (!v10)
  {
    id v12 = 0;
LABEL_16:
    v22.receiver = self;
    v22.super_class = (Class)IXSPromisedAppReference;
    v23[0] = v12;
    BOOL v18 = [(IXSOwnedDataPromise *)&v22 cancelForReason:v8 client:a4 error:v23];
    id v19 = v23[0];

    id v12 = v19;
    if (!a5) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  v23[1] = 0;
  char v11 = MIInvalidateReferenceForInstalledAppWithError();
  id v12 = 0;
  if (v11)
  {
    [(IXSPromisedAppReference *)self setAppReference:0];
    goto LABEL_16;
  }
  v21 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    sub_10008CD20();
  }

LABEL_13:
  BOOL v18 = 0;
  if (!a5) {
    goto LABEL_19;
  }
LABEL_17:
  if (!v18) {
    *a5 = v12;
  }
LABEL_19:

  return v18;
}

- (BOOL)validateStagedPathWithError:(id *)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end