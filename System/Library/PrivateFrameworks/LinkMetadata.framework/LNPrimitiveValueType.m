@interface LNPrimitiveValueType
+ (BOOL)supportsSecureCoding;
+ (LNPrimitiveValueType)BOOLValueType;
+ (LNPrimitiveValueType)URLValueType;
+ (LNPrimitiveValueType)attributedStringValueType;
+ (LNPrimitiveValueType)dateComponentsValueType;
+ (LNPrimitiveValueType)dateValueType;
+ (LNPrimitiveValueType)doubleValueType;
+ (LNPrimitiveValueType)int16ValueType;
+ (LNPrimitiveValueType)int32ValueType;
+ (LNPrimitiveValueType)int64ValueType;
+ (LNPrimitiveValueType)int8ValueType;
+ (LNPrimitiveValueType)intValueType;
+ (LNPrimitiveValueType)placemarkValueType;
+ (LNPrimitiveValueType)stringValueType;
+ (id)objectClassesForCoding;
+ (id)supportedClassesByTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNPrimitiveValueType)initWithCoder:(id)a3;
- (LNPrimitiveValueType)initWithTypeIdentifier:(int64_t)a3;
- (NSString)typeIdentifierAsString;
- (id)description;
- (int64_t)typeIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPrimitiveValueType

+ (LNPrimitiveValueType)BOOLValueType
{
  if (BOOLValueType_onceToken != -1) {
    dispatch_once(&BOOLValueType_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)BOOLValueType_value;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)doubleValueType
{
  if (doubleValueType_onceToken[0] != -1) {
    dispatch_once(doubleValueType_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)doubleValueType_value;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)stringValueType
{
  if (stringValueType_onceToken_694 != -1) {
    dispatch_once(&stringValueType_onceToken_694, &__block_literal_global_695);
  }
  v2 = (void *)stringValueType_value_696;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)intValueType
{
  if (intValueType_onceToken[0] != -1) {
    dispatch_once(intValueType_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)intValueType_value;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)URLValueType
{
  if (URLValueType_onceToken[0] != -1) {
    dispatch_once(URLValueType_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)URLValueType_value;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)dateValueType
{
  if (dateValueType_onceToken != -1) {
    dispatch_once(&dateValueType_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)dateValueType_value;
  return (LNPrimitiveValueType *)v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier"), @"typeIdentifier");
}

- (Class)objectClass
{
  v3 = [(id)objc_opt_class() supportedClassesByTypeIdentifier];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier"));
  v5 = [v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

+ (id)supportedClassesByTypeIdentifier
{
  v5[13] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EEDCE410;
  v5[0] = objc_opt_class();
  v4[1] = &unk_1EEDCE428;
  v5[1] = objc_opt_class();
  v4[2] = &unk_1EEDCE440;
  v5[2] = objc_opt_class();
  v4[3] = &unk_1EEDCE458;
  v5[3] = objc_opt_class();
  v4[4] = &unk_1EEDCE470;
  v5[4] = objc_opt_class();
  v4[5] = &unk_1EEDCE488;
  v5[5] = objc_opt_class();
  v4[6] = &unk_1EEDCE4A0;
  v5[6] = objc_opt_class();
  v4[7] = &unk_1EEDCE4B8;
  v5[7] = objc_opt_class();
  v4[8] = &unk_1EEDCE4D0;
  v5[8] = objc_opt_class();
  v4[9] = &unk_1EEDCE4E8;
  v5[9] = objc_opt_class();
  v4[10] = &unk_1EEDCE500;
  v5[10] = objc_opt_class();
  v4[11] = &unk_1EEDCE518;
  v5[11] = objc_opt_class();
  v4[12] = &unk_1EEDCE530;
  v5[12] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:13];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNPrimitiveValueType *)a3;
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
      int64_t v7 = [(LNPrimitiveValueType *)self typeIdentifier];
      BOOL v8 = v7 == [(LNPrimitiveValueType *)v6 typeIdentifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (LNPrimitiveValueType)placemarkValueType
{
  if (placemarkValueType_onceToken != -1) {
    dispatch_once(&placemarkValueType_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)placemarkValueType_value;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)dateComponentsValueType
{
  if (dateComponentsValueType_onceToken != -1) {
    dispatch_once(&dateComponentsValueType_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)dateComponentsValueType_value;
  return (LNPrimitiveValueType *)v2;
}

+ (LNPrimitiveValueType)attributedStringValueType
{
  if (attributedStringValueType_onceToken != -1) {
    dispatch_once(&attributedStringValueType_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)attributedStringValueType_value;
  return (LNPrimitiveValueType *)v2;
}

- (LNPrimitiveValueType)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"typeIdentifier"];
  return [(LNPrimitiveValueType *)self initWithTypeIdentifier:v4];
}

uint64_t __37__LNPrimitiveValueType_BOOLValueType__block_invoke()
{
  BOOLValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:1];
  return MEMORY[0x1F41817F8]();
}

- (LNPrimitiveValueType)initWithTypeIdentifier:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNPrimitiveValueType;
  uint64_t v4 = [(LNValueType *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v4->_typeIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

+ (id)objectClassesForCoding
{
  v2 = [a1 supportedClassesByTypeIdentifier];
  v3 = [v2 allValues];

  return v3;
}

- (id)description
{
  int64_t v2 = [(LNPrimitiveValueType *)self typeIdentifier];
  if ((unint64_t)(v2 - 1) > 0xB) {
    return @"String";
  }
  else {
    return off_1E590D7C0[v2 - 1];
  }
}

- (NSString)typeIdentifierAsString
{
  int64_t v2 = [(LNPrimitiveValueType *)self typeIdentifier];
  if ((unint64_t)(v2 - 1) > 0xB) {
    return (NSString *)@"String";
  }
  else {
    return &off_1E590D7C0[v2 - 1]->isa;
  }
}

uint64_t __36__LNPrimitiveValueType_URLValueType__block_invoke()
{
  URLValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:11];
  return MEMORY[0x1F41817F8]();
}

uint64_t __42__LNPrimitiveValueType_placemarkValueType__block_invoke()
{
  placemarkValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:10];
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__LNPrimitiveValueType_dateComponentsValueType__block_invoke()
{
  dateComponentsValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:9];
  return MEMORY[0x1F41817F8]();
}

uint64_t __37__LNPrimitiveValueType_dateValueType__block_invoke()
{
  dateValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:8];
  return MEMORY[0x1F41817F8]();
}

uint64_t __39__LNPrimitiveValueType_doubleValueType__block_invoke()
{
  doubleValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:7];
  return MEMORY[0x1F41817F8]();
}

+ (LNPrimitiveValueType)int64ValueType
{
  if (int64ValueType_onceToken != -1) {
    dispatch_once(&int64ValueType_onceToken, &__block_literal_global_14);
  }
  int64_t v2 = (void *)int64ValueType_value;
  return (LNPrimitiveValueType *)v2;
}

uint64_t __38__LNPrimitiveValueType_int64ValueType__block_invoke()
{
  int64ValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:6];
  return MEMORY[0x1F41817F8]();
}

+ (LNPrimitiveValueType)int32ValueType
{
  if (int32ValueType_onceToken != -1) {
    dispatch_once(&int32ValueType_onceToken, &__block_literal_global_12);
  }
  int64_t v2 = (void *)int32ValueType_value;
  return (LNPrimitiveValueType *)v2;
}

uint64_t __38__LNPrimitiveValueType_int32ValueType__block_invoke()
{
  int32ValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:5];
  return MEMORY[0x1F41817F8]();
}

+ (LNPrimitiveValueType)int16ValueType
{
  if (int16ValueType_onceToken != -1) {
    dispatch_once(&int16ValueType_onceToken, &__block_literal_global_10);
  }
  int64_t v2 = (void *)int16ValueType_value;
  return (LNPrimitiveValueType *)v2;
}

uint64_t __38__LNPrimitiveValueType_int16ValueType__block_invoke()
{
  int16ValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:4];
  return MEMORY[0x1F41817F8]();
}

+ (LNPrimitiveValueType)int8ValueType
{
  if (int8ValueType_onceToken != -1) {
    dispatch_once(&int8ValueType_onceToken, &__block_literal_global_8);
  }
  int64_t v2 = (void *)int8ValueType_value;
  return (LNPrimitiveValueType *)v2;
}

uint64_t __37__LNPrimitiveValueType_int8ValueType__block_invoke()
{
  int8ValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:3];
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__LNPrimitiveValueType_intValueType__block_invoke()
{
  intValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:2];
  return MEMORY[0x1F41817F8]();
}

uint64_t __49__LNPrimitiveValueType_attributedStringValueType__block_invoke()
{
  attributedStringValueType_value = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:12];
  return MEMORY[0x1F41817F8]();
}

uint64_t __39__LNPrimitiveValueType_stringValueType__block_invoke()
{
  stringValueType_value_696 = [[LNPrimitiveValueType alloc] initWithTypeIdentifier:0];
  return MEMORY[0x1F41817F8]();
}

@end