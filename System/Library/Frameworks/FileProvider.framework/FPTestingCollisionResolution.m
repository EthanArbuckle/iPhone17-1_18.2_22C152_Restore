@interface FPTestingCollisionResolution
+ (BOOL)supportsSecureCoding;
- (FPTestingCollisionResolution)initWithCoder:(id)a3;
- (FPTestingCollisionResolution)initWithOperationIdentifier:(id)a3 renamedItem:(id)a4 snapshotVersion:(int64_t)a5;
- (NSFileProviderItem)renamedItem;
- (int64_t)snapshotVersion;
- (int64_t)type;
- (unint64_t)side;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPTestingCollisionResolution

- (FPTestingCollisionResolution)initWithOperationIdentifier:(id)a3 renamedItem:(id)a4 snapshotVersion:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FPTestingCollisionResolution;
  v10 = [(FPTestingOperation *)&v13 initWithOperationIdentifier:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_renamedItem, a4);
    v11->_snapshotVersion = a5;
  }

  return v11;
}

- (int64_t)type
{
  return 7;
}

- (unint64_t)side
{
  v2 = [(NSFileProviderItem *)self->_renamedItem itemIdentifier];
  unint64_t v3 = [v2 hasPrefix:@"__fp/fs/"] ^ 1;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPTestingCollisionResolution;
  id v4 = a3;
  [(FPTestingOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_renamedItem, @"_renamedItem", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_snapshotVersion forKey:@"_snapshotVersion"];
}

- (FPTestingCollisionResolution)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTestingCollisionResolution;
  objc_super v5 = [(FPTestingOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_renamedItem"];
    renamedItem = v5->_renamedItem;
    v5->_renamedItem = (NSFileProviderItem *)v6;

    v5->_snapshotVersion = [v4 decodeIntegerForKey:@"_snapshotVersion"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderItem)renamedItem
{
  return self->_renamedItem;
}

- (int64_t)snapshotVersion
{
  return self->_snapshotVersion;
}

- (void).cxx_destruct
{
}

@end