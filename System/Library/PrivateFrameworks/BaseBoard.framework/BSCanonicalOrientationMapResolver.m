@interface BSCanonicalOrientationMapResolver
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BSCanonicalOrientationMapResolver)initWithBSXPCCoder:(id)a3;
- (BSCanonicalOrientationMapResolver)initWithTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4;
- (BSCanonicalOrientationMapResolver)initWithTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4 fallbackOrientations:(id)a5;
- (NSString)debugDescription;
- (NSString)description;
- (int64_t)interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation BSCanonicalOrientationMapResolver

- (BOOL)isEqual:(id)a3
{
  v4 = (BSCanonicalOrientationMapResolver *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (v5->_targetOrientation == self->_targetOrientation && v5->_currentOrientation == self->_currentOrientation) {
        char v7 = [(NSArray *)v5->_fallbackOrientations isEqualToArray:self->_fallbackOrientations];
      }
      else {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (int64_t)interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  char v7 = [NSNumber numberWithInteger:self->_targetOrientation];
  v17[0] = v7;
  v8 = [NSNumber numberWithInteger:self->_currentOrientation];
  v17[1] = v8;
  v9 = [NSNumber numberWithInteger:a4];
  v17[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];

  v11 = [v10 arrayByAddingObjectsFromArray:self->_fallbackOrientations];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __103__BSCanonicalOrientationMapResolver_interfaceOrientationForSupportedOrientations_preferredOrientation___block_invoke;
  v16[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
  v16[4] = a3;
  v12 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v16);
  uint64_t v13 = [v12 integerValue];
  if ((unint64_t)(v13 - 1) >= 4) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = v13;
  }

  return v14;
}

BOOL __103__BSCanonicalOrientationMapResolver_interfaceOrientationForSupportedOrientations_preferredOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 integerValue];
  BOOL v5 = (unint64_t)(v4 - 1) <= 3 && (*(void *)(a1 + 32) & (1 << v4)) != 0;

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BSCanonicalOrientationMapResolver)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BSCanonicalOrientationMapResolver;
  BOOL v5 = [(BSCanonicalOrientationMapResolver *)&v10 init];
  if (v5)
  {
    v5->_targetOrientation = [v4 decodeUInt64ForKey:@"targetOrientation"];
    v5->_currentOrientation = [v4 decodeUInt64ForKey:@"currentOrientation"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"fallbackOrientations"];
    fallbackOrientations = v5->_fallbackOrientations;
    v5->_fallbackOrientations = (NSArray *)v7;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeUInt64:self->_targetOrientation forKey:@"targetOrientation"];
  [v4 encodeUInt64:self->_currentOrientation forKey:@"currentOrientation"];
  [v4 encodeCollection:self->_fallbackOrientations forKey:@"fallbackOrientations"];
}

- (BSCanonicalOrientationMapResolver)initWithTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4
{
  return [(BSCanonicalOrientationMapResolver *)self initWithTargetOrientation:a3 currentOrientation:a4 fallbackOrientations:&unk_1ED784920];
}

- (void).cxx_destruct
{
}

- (BSCanonicalOrientationMapResolver)initWithTargetOrientation:(int64_t)a3 currentOrientation:(int64_t)a4 fallbackOrientations:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = a5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v10)
  {

LABEL_11:
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"BSCanonicalOrientationMapResolver.m" lineNumber:40 description:@"The fallback orientation order does not contain all interface orientations."];

    goto LABEL_12;
  }
  int v11 = 0;
  uint64_t v12 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(v9);
      }
      v11 |= 1 << [*(id *)(*((void *)&v21 + 1) + 8 * i) unsignedIntegerValue];
    }
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v10);

  if ((~v11 & 0x1ELL) != 0) {
    goto LABEL_11;
  }
LABEL_12:
  v20.receiver = self;
  v20.super_class = (Class)BSCanonicalOrientationMapResolver;
  v15 = [(BSCanonicalOrientationMapResolver *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_targetOrientation = a3;
    v15->_currentOrientation = a4;
    uint64_t v17 = [v9 copy];
    fallbackOrientations = v16->_fallbackOrientations;
    v16->_fallbackOrientations = (NSArray *)v17;
  }
  return v16;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = BSInterfaceOrientationDescription(self->_targetOrientation);
  BOOL v5 = BSInterfaceOrientationDescription(self->_currentOrientation);
  uint64_t v6 = [v3 stringWithFormat:@"target: %@, current: %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = BSInterfaceOrientationDescription(self->_targetOrientation);
  uint64_t v7 = BSInterfaceOrientationDescription(self->_currentOrientation);
  v8 = [v3 stringWithFormat:@"<%@:%p target: %@, current: %@", v5, self, v6, v7];

  return (NSString *)v8;
}

@end