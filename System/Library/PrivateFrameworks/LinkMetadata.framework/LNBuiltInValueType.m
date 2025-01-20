@interface LNBuiltInValueType
+ (BOOL)supportsSecureCoding;
+ (LNBuiltInValueType)intentToggleOperationValueType;
+ (LNBuiltInValueType)intentToggleStateValueType;
+ (LNBuiltInValueType)photoItemCollectionValueType;
+ (id)objectClassesForCoding;
+ (id)supportedClassesByTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNBuiltInValueType)initWithBuiltInType:(int64_t)a3;
- (LNBuiltInValueType)initWithCoder:(id)a3;
- (id)typeIdentifierAsString;
- (int64_t)builtInType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNBuiltInValueType

- (int64_t)builtInType
{
  return self->_builtInType;
}

+ (LNBuiltInValueType)photoItemCollectionValueType
{
  if (photoItemCollectionValueType_onceToken != -1) {
    dispatch_once(&photoItemCollectionValueType_onceToken, &__block_literal_global_4_3470);
  }
  v2 = (void *)photoItemCollectionValueType_value;
  return (LNBuiltInValueType *)v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNBuiltInValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v7 = [(LNBuiltInValueType *)self builtInType];
      BOOL v8 = v7 == [(LNBuiltInValueType *)v6 builtInType];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (id)objectClassesForCoding
{
  v2 = [a1 supportedClassesByTypeIdentifier];
  v3 = [v2 allValues];

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EEDCE6C8;
  v5[0] = objc_opt_class();
  v4[1] = &unk_1EEDCE6E0;
  v5[1] = objc_opt_class();
  v4[2] = &unk_1EEDCE6F8;
  v5[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNBuiltInValueType builtInType](self, "builtInType"), @"builtInType");
}

- (LNBuiltInValueType)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"builtInType"];
  return [(LNBuiltInValueType *)self initWithBuiltInType:v4];
}

- (id)typeIdentifierAsString
{
  int64_t v2 = [(LNBuiltInValueType *)self builtInType];
  v3 = @"Intent Change Operation";
  if (v2 == 1) {
    v3 = @"Toggle Activation";
  }
  if (v2 == 2) {
    uint64_t v4 = @"Photo Collection";
  }
  else {
    uint64_t v4 = v3;
  }
  return v4;
}

- (Class)objectClass
{
  v3 = [(id)objc_opt_class() supportedClassesByTypeIdentifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[LNBuiltInValueType builtInType](self, "builtInType"));
  v5 = [v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

- (LNBuiltInValueType)initWithBuiltInType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNBuiltInValueType;
  uint64_t v4 = [(LNValueType *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v4->_builtInType = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __50__LNBuiltInValueType_photoItemCollectionValueType__block_invoke()
{
  photoItemCollectionValueType_value = [[LNBuiltInValueType alloc] initWithBuiltInType:2];
  return MEMORY[0x1F41817F8]();
}

+ (LNBuiltInValueType)intentToggleStateValueType
{
  if (intentToggleStateValueType_onceToken != -1) {
    dispatch_once(&intentToggleStateValueType_onceToken, &__block_literal_global_2_3472);
  }
  int64_t v2 = (void *)intentToggleStateValueType_value;
  return (LNBuiltInValueType *)v2;
}

uint64_t __48__LNBuiltInValueType_intentToggleStateValueType__block_invoke()
{
  intentToggleStateValueType_value = [[LNBuiltInValueType alloc] initWithBuiltInType:1];
  return MEMORY[0x1F41817F8]();
}

+ (LNBuiltInValueType)intentToggleOperationValueType
{
  if (intentToggleOperationValueType_onceToken != -1) {
    dispatch_once(&intentToggleOperationValueType_onceToken, &__block_literal_global_3474);
  }
  int64_t v2 = (void *)intentToggleOperationValueType_value;
  return (LNBuiltInValueType *)v2;
}

uint64_t __52__LNBuiltInValueType_intentToggleOperationValueType__block_invoke()
{
  intentToggleOperationValueType_value = [[LNBuiltInValueType alloc] initWithBuiltInType:0];
  return MEMORY[0x1F41817F8]();
}

@end