@interface FPActionOperationLocator
+ (BOOL)supportsSecureCoding;
+ (id)locatorForItem:(id)a3;
+ (id)locatorForURL:(id)a3;
- (BOOL)isDownloaded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExternalURL;
- (BOOL)isFolder;
- (BOOL)isProviderItem;
- (BOOL)requiresCrossDeviceCopy;
- (FPActionOperationLocator)initWithCoder:(id)a3;
- (FPActionOperationLocator)initWithObject:(id)a3;
- (FPItem)asFPItem;
- (NSString)filename;
- (NSURL)asURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)parentIdentifier;
- (id)underlyingObject;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_setObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPActionOperationLocator

+ (id)locatorForURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [[FPURLOperationLocator alloc] initWithObject:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)locatorForItem:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = [(FPActionOperationLocator *)[FPItemOperationLocator alloc] initWithObject:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (FPActionOperationLocator)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPActionOperationLocator;
  v6 = [(FPActionOperationLocator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_object, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  object = self->_object;

  return (id)[v4 initWithObject:object];
}

- (void)_setObject:(id)a3
{
}

- (id)underlyingObject
{
  return self->_object;
}

- (unint64_t)hash
{
  return [self->_object hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FPActionOperationLocator *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [self->_object isEqual:v5->_object];
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FPActionOperationLocator)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"obj"];

  objc_super v9 = [(FPActionOperationLocator *)self initWithObject:v8];
  return v9;
}

- (BOOL)isExternalURL
{
  return 0;
}

- (BOOL)isProviderItem
{
  return 0;
}

- (NSURL)asURL
{
  if (![(FPActionOperationLocator *)self isExternalURL]
    && ![(FPActionOperationLocator *)self isExternalURL])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:112 description:@"not a url"];
  }
  object = self->_object;

  return (NSURL *)object;
}

- (FPItem)asFPItem
{
  if (![(FPActionOperationLocator *)self isProviderItem]
    && ![(FPActionOperationLocator *)self isProviderItem])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:118 description:@"not an item"];
  }
  object = self->_object;

  return (FPItem *)object;
}

- (NSString)filename
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:124 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (unint64_t)size
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:130 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (BOOL)isDownloaded
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:136 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (id)identifier
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:142 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (id)parentIdentifier
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:148 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (BOOL)isFolder
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:154 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (BOOL)requiresCrossDeviceCopy
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPActionOperationLocator.m" lineNumber:165 description:@"UNREACHABLE: needs override"];

  return 0;
}

- (void).cxx_destruct
{
}

@end