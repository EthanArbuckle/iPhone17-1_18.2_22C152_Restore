@interface CHSTimelineReloadRequest
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)allowCostOverride;
- (CHSTimelineReloadRequest)init;
- (CHSTimelineReloadRequest)initWithCoder:(id)a3;
- (CHSTimelineReloadRequest)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 reason:(id)a5 allowCostOverride:(BOOL)a6;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (NSString)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSTimelineReloadRequest

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSTimelineReloadRequest.m" lineNumber:13 description:@"use initWithKind:extensionBundleIdentifier:allowCostOverride:"];

  return 0;
}

- (CHSTimelineReloadRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSTimelineReloadRequest.m" lineNumber:18 description:@"use initWithKind:extensionBundleIdentifier:allowCostOverride:"];

  return 0;
}

- (CHSTimelineReloadRequest)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 reason:(id)a5 allowCostOverride:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHSTimelineReloadRequest;
  v13 = [(CHSTimelineReloadRequest *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    kind = v13->_kind;
    v13->_kind = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    extensionBundleIdentifier = v13->_extensionBundleIdentifier;
    v13->_extensionBundleIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v18;

    v13->_allowCostOverride = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_kind forKey:@"_kind"];
  [v4 encodeObject:self->_extensionBundleIdentifier forKey:@"_extensionBundleIdentifier"];
  [v4 encodeObject:self->_reason forKey:@"_reason"];
  [v4 encodeBool:self->_allowCostOverride forKey:@"_allowCostOverride"];
}

- (CHSTimelineReloadRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_kind"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionBundleIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_reason"];
  uint64_t v8 = [v4 decodeBoolForKey:@"_allowCostOverride"];
  v9 = 0;
  if (v5 && v6 && v7)
  {
    self = [(CHSTimelineReloadRequest *)self initWithKind:v5 extensionBundleIdentifier:v6 reason:v7 allowCostOverride:v8];
    v9 = self;
  }

  return v9;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)allowCostOverride
{
  return self->_allowCostOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end