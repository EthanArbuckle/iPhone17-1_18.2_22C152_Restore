@interface HDCloudSyncContext
+ (id)contextForFastPush;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)isFastPushOrPull;
- (HDCloudSyncContext)init;
- (HDXPCActivity)xpcActivity;
- (HKCloudSyncRequest)syncRequest;
- (NSDate)unitTest_syncDateOverride;
- (NSString)shortIdentifier;
- (NSUUID)identifier;
- (id)description;
- (id)initForPurpose:(int64_t)a3 options:(unint64_t)a4 reason:(int64_t)a5 xpcActivity:(id)a6;
- (id)subContextByAddingOptions:(unint64_t)a3;
- (id)subContextByRemovingOptions:(unint64_t)a3;
- (int64_t)purpose;
- (int64_t)reason;
- (unint64_t)options;
- (void)setSyncRequest:(id)a3;
- (void)setUnitTest_syncDateOverride:(id)a3;
@end

@implementation HDCloudSyncContext

- (HDCloudSyncContext)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)initForPurpose:(int64_t)a3 options:(unint64_t)a4 reason:(int64_t)a5 xpcActivity:(id)a6
{
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncContext;
  v12 = [(HDCloudSyncContext *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    v15 = [(NSUUID *)v12->_identifier UUIDString];
    uint64_t v16 = [v15 substringToIndex:4];
    shortIdentifier = v12->_shortIdentifier;
    v12->_shortIdentifier = (NSString *)v16;

    v12->_purpose = a3;
    v12->_options = a4;
    v12->_reason = a5;
    objc_storeStrong((id *)&v12->_xpcActivity, a6);
  }

  return v12;
}

+ (id)contextForFastPush
{
  id v2 = objc_alloc(MEMORY[0x1E4F2AD68]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
  uint64_t v4 = (void *)[v2 initWithChangesSyncRequest:v3];

  id v5 = [[HDCloudSyncContext alloc] initForPurpose:0 options:128 reason:32 xpcActivity:0];
  [v5 setSyncRequest:v4];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = HKCloudSyncOptionsToString();
  id v5 = [(HDCloudSyncContext *)self syncRequest];
  v6 = [v3 stringWithFormat:@"Options: %@,\n Request: %@", v4, v5];

  xpcActivity = self->_xpcActivity;
  v8 = NSString;
  shortIdentifier = self->_shortIdentifier;
  uint64_t v10 = HKCloudSyncReasonToString();
  id v11 = (void *)v10;
  if (xpcActivity)
  {
    v12 = [(HDXPCActivity *)self->_xpcActivity name];
    uint64_t v13 = [v8 stringWithFormat:@"<%@ %@ (%@) %@>", shortIdentifier, v11, v6, v12];
  }
  else
  {
    uint64_t v13 = [v8 stringWithFormat:@"<%@ %@ (%@)>", shortIdentifier, v10, v6];
  }

  return v13;
}

- (id)subContextByAddingOptions:(unint64_t)a3
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initForPurpose:self->_purpose options:self->_options | a3 reason:self->_reason xpcActivity:self->_xpcActivity];
  uint64_t v5 = [(NSUUID *)self->_identifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_shortIdentifier copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSDate *)self->_unitTest_syncDateOverride copy];
  uint64_t v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(HKCloudSyncRequest *)self->_syncRequest copy];
  v12 = (void *)v4[6];
  v4[6] = v11;

  return v4;
}

- (id)subContextByRemovingOptions:(unint64_t)a3
{
  uint64_t v4 = (void *)[objc_alloc((Class)objc_opt_class()) initForPurpose:self->_purpose options:self->_options & ~a3 reason:self->_reason xpcActivity:self->_xpcActivity];
  uint64_t v5 = [(NSUUID *)self->_identifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_shortIdentifier copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSDate *)self->_unitTest_syncDateOverride copy];
  uint64_t v10 = (void *)v4[8];
  v4[8] = v9;

  uint64_t v11 = [(HKCloudSyncRequest *)self->_syncRequest copy];
  v12 = (void *)v4[6];
  v4[6] = v11;

  return v4;
}

- (BOOL)isEquivalent:(id)a3
{
  uint64_t v4 = (char *)a3;
  uint64_t v5 = v4;
  if (*(_OWORD *)&self->_purpose == *(_OWORD *)(v4 + 24)
    && self->_reason == *((void *)v4 + 5)
    && self->_xpcActivity == (HDXPCActivity *)*((void *)v4 + 7))
  {
    syncRequest = self->_syncRequest;
    if (syncRequest) {
      char v6 = [(HKCloudSyncRequest *)syncRequest isEquivalent:v5[6]];
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isFastPushOrPull
{
  return (self->_options & 0x1080) != 0;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)shortIdentifier
{
  return self->_shortIdentifier;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)reason
{
  return self->_reason;
}

- (HKCloudSyncRequest)syncRequest
{
  return self->_syncRequest;
}

- (void)setSyncRequest:(id)a3
{
}

- (HDXPCActivity)xpcActivity
{
  return self->_xpcActivity;
}

- (NSDate)unitTest_syncDateOverride
{
  return self->_unitTest_syncDateOverride;
}

- (void)setUnitTest_syncDateOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_syncDateOverride, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_syncRequest, 0);
  objc_storeStrong((id *)&self->_shortIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end