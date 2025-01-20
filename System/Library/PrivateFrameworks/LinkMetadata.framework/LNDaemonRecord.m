@interface LNDaemonRecord
+ (id)daemonRecordWithBundleIdentifier:(id)a3;
+ (id)enumerated;
- (LNDaemonRecord)initWithBundleIdentifier:(id)a3;
- (LNDaemonRecord)initWithDaemonRecord:(id)a3;
- (NSString)bundleIdentifier;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation LNDaemonRecord

+ (id)daemonRecordWithBundleIdentifier:(id)a3
{
  v3 = +[swift_DaemonRecord fromBundleIdentifier:a3];
  if (v3) {
    v4 = [[LNDaemonRecord alloc] initWithDaemonRecord:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (LNDaemonRecord)initWithDaemonRecord:(id)a3
{
  v4 = [a3 bundleIdentifier];
  v5 = [(LNDaemonRecord *)self initWithBundleIdentifier:v4];

  return v5;
}

- (LNDaemonRecord)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNDaemonRecord.m", 20, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNDaemonRecord;
  v6 = [(LNDaemonRecord *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (id)enumerated
{
  v2 = +[swift_DaemonRecord enumerated];
  v3 = objc_msgSend(v2, "if_map:", &__block_literal_global_5964);

  return v3;
}

LNDaemonRecord *__28__LNDaemonRecord_enumerated__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[LNDaemonRecord alloc] initWithDaemonRecord:v2];

  return v3;
}

@end