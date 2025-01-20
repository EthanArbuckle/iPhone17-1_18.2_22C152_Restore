@interface LNIntentsValueType
+ (BOOL)supportsSecureCoding;
+ (LNIntentsValueType)applicationValueType;
+ (LNIntentsValueType)calendarEventValueType;
+ (LNIntentsValueType)currencyAmountValueType;
+ (LNIntentsValueType)environmentValueType;
+ (LNIntentsValueType)fileValueType;
+ (LNIntentsValueType)mediaItemValueType;
+ (LNIntentsValueType)mediaSearchValueType;
+ (LNIntentsValueType)messageConversationValueType;
+ (LNIntentsValueType)noteValueType;
+ (LNIntentsValueType)notificationValueType;
+ (LNIntentsValueType)paymentMethodValueType;
+ (LNIntentsValueType)personValueType;
+ (LNIntentsValueType)taskListValueType;
+ (LNIntentsValueType)taskValueType;
+ (LNIntentsValueType)timerValueType;
+ (id)objectClassesForCoding;
+ (id)supportedClassesByTypeIdentifier;
- (BOOL)isEqual:(id)a3;
- (Class)objectClass;
- (LNIntentsValueType)initWithCoder:(id)a3;
- (LNIntentsValueType)initWithTypeIdentifier:(int64_t)a3;
- (NSString)typeIdentifierAsString;
- (id)description;
- (int64_t)typeIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNIntentsValueType

- (BOOL)isEqual:(id)a3
{
  v4 = (LNIntentsValueType *)a3;
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
      int64_t v7 = [(LNIntentsValueType *)self typeIdentifier];
      BOOL v8 = v7 == [(LNIntentsValueType *)v6 typeIdentifier];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

+ (LNIntentsValueType)personValueType
{
  if (personValueType_onceToken[0] != -1) {
    dispatch_once(personValueType_onceToken, &__block_literal_global_8_896);
  }
  v2 = (void *)personValueType_value;
  return (LNIntentsValueType *)v2;
}

+ (LNIntentsValueType)paymentMethodValueType
{
  if (paymentMethodValueType_onceToken != -1) {
    dispatch_once(&paymentMethodValueType_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)paymentMethodValueType_value;
  return (LNIntentsValueType *)v2;
}

+ (LNIntentsValueType)fileValueType
{
  if (fileValueType_onceToken != -1) {
    dispatch_once(&fileValueType_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)fileValueType_value;
  return (LNIntentsValueType *)v2;
}

+ (LNIntentsValueType)currencyAmountValueType
{
  if (currencyAmountValueType_onceToken != -1) {
    dispatch_once(&currencyAmountValueType_onceToken, &__block_literal_global_4_900);
  }
  v2 = (void *)currencyAmountValueType_value;
  return (LNIntentsValueType *)v2;
}

+ (LNIntentsValueType)applicationValueType
{
  if (applicationValueType_onceToken != -1) {
    dispatch_once(&applicationValueType_onceToken, &__block_literal_global_904);
  }
  v2 = (void *)applicationValueType_value;
  return (LNIntentsValueType *)v2;
}

+ (id)objectClassesForCoding
{
  v2 = [a1 supportedClassesByTypeIdentifier];
  v3 = [v2 allValues];

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  v5[15] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1EEDCE548;
  v5[0] = objc_opt_class();
  v4[1] = &unk_1EEDCE560;
  v5[1] = objc_opt_class();
  v4[2] = &unk_1EEDCE578;
  v5[2] = objc_opt_class();
  v4[3] = &unk_1EEDCE590;
  v5[3] = objc_opt_class();
  v4[4] = &unk_1EEDCE5A8;
  v5[4] = objc_opt_class();
  v4[5] = &unk_1EEDCE5C0;
  v5[5] = objc_opt_class();
  v4[6] = &unk_1EEDCE5D8;
  v5[6] = objc_opt_class();
  v4[7] = &unk_1EEDCE5F0;
  v5[7] = objc_opt_class();
  v4[8] = &unk_1EEDCE608;
  v5[8] = objc_opt_class();
  v4[9] = &unk_1EEDCE620;
  v5[9] = objc_opt_class();
  v4[10] = &unk_1EEDCE638;
  v5[10] = objc_opt_class();
  v4[11] = &unk_1EEDCE650;
  v5[11] = objc_opt_class();
  v4[12] = &unk_1EEDCE668;
  v5[12] = objc_opt_class();
  v4[13] = &unk_1EEDCE680;
  v5[13] = objc_opt_class();
  v4[14] = &unk_1EEDCE698;
  v5[14] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:15];
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNIntentsValueType typeIdentifier](self, "typeIdentifier"), @"typeIdentifier");
}

- (LNIntentsValueType)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"typeIdentifier"];
  return [(LNIntentsValueType *)self initWithTypeIdentifier:v4];
}

- (id)description
{
  int64_t v2 = [(LNIntentsValueType *)self typeIdentifier];
  if ((unint64_t)(v2 - 1) > 0xD) {
    return @"Application";
  }
  else {
    return off_1E590D820[v2 - 1];
  }
}

- (Class)objectClass
{
  v3 = [(id)objc_opt_class() supportedClassesByTypeIdentifier];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[LNIntentsValueType typeIdentifier](self, "typeIdentifier"));
  v5 = [v3 objectForKeyedSubscript:v4];

  return (Class)v5;
}

- (NSString)typeIdentifierAsString
{
  int64_t v2 = [(LNIntentsValueType *)self typeIdentifier];
  if ((unint64_t)(v2 - 1) > 0xD) {
    return (NSString *)@"Application";
  }
  else {
    return &off_1E590D820[v2 - 1]->isa;
  }
}

- (LNIntentsValueType)initWithTypeIdentifier:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LNIntentsValueType;
  uint64_t v4 = [(LNValueType *)&v8 _init];
  v5 = v4;
  if (v4)
  {
    v4->_typeIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __44__LNIntentsValueType_paymentMethodValueType__block_invoke()
{
  paymentMethodValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:13];
  return MEMORY[0x1F41817F8]();
}

uint64_t __35__LNIntentsValueType_fileValueType__block_invoke()
{
  fileValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:12];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)timerValueType
{
  if (timerValueType_onceToken != -1) {
    dispatch_once(&timerValueType_onceToken, &__block_literal_global_24_880);
  }
  int64_t v2 = (void *)timerValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __36__LNIntentsValueType_timerValueType__block_invoke()
{
  timerValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:6];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)taskListValueType
{
  if (taskListValueType_onceToken != -1) {
    dispatch_once(&taskListValueType_onceToken, &__block_literal_global_22_882);
  }
  int64_t v2 = (void *)taskListValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __39__LNIntentsValueType_taskListValueType__block_invoke()
{
  taskListValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:8];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)taskValueType
{
  if (taskValueType_onceToken != -1) {
    dispatch_once(&taskValueType_onceToken, &__block_literal_global_20_884);
  }
  int64_t v2 = (void *)taskValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __35__LNIntentsValueType_taskValueType__block_invoke()
{
  taskValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:7];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)notificationValueType
{
  if (notificationValueType_onceToken != -1) {
    dispatch_once(&notificationValueType_onceToken, &__block_literal_global_18_886);
  }
  int64_t v2 = (void *)notificationValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __43__LNIntentsValueType_notificationValueType__block_invoke()
{
  notificationValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:5];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)noteValueType
{
  if (noteValueType_onceToken != -1) {
    dispatch_once(&noteValueType_onceToken, &__block_literal_global_16_888);
  }
  int64_t v2 = (void *)noteValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __35__LNIntentsValueType_noteValueType__block_invoke()
{
  noteValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:4];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)messageConversationValueType
{
  if (messageConversationValueType_onceToken != -1) {
    dispatch_once(&messageConversationValueType_onceToken, &__block_literal_global_14_890);
  }
  int64_t v2 = (void *)messageConversationValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __50__LNIntentsValueType_messageConversationValueType__block_invoke()
{
  messageConversationValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:11];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)mediaSearchValueType
{
  if (mediaSearchValueType_onceToken != -1) {
    dispatch_once(&mediaSearchValueType_onceToken, &__block_literal_global_12_892);
  }
  int64_t v2 = (void *)mediaSearchValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __42__LNIntentsValueType_mediaSearchValueType__block_invoke()
{
  mediaSearchValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:10];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)mediaItemValueType
{
  if (mediaItemValueType_onceToken != -1) {
    dispatch_once(&mediaItemValueType_onceToken, &__block_literal_global_10_894);
  }
  int64_t v2 = (void *)mediaItemValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __40__LNIntentsValueType_mediaItemValueType__block_invoke()
{
  mediaItemValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:9];
  return MEMORY[0x1F41817F8]();
}

uint64_t __37__LNIntentsValueType_personValueType__block_invoke()
{
  personValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:3];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)environmentValueType
{
  if (environmentValueType_onceToken != -1) {
    dispatch_once(&environmentValueType_onceToken, &__block_literal_global_6_898);
  }
  int64_t v2 = (void *)environmentValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __42__LNIntentsValueType_environmentValueType__block_invoke()
{
  environmentValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:2];
  return MEMORY[0x1F41817F8]();
}

uint64_t __45__LNIntentsValueType_currencyAmountValueType__block_invoke()
{
  currencyAmountValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:14];
  return MEMORY[0x1F41817F8]();
}

+ (LNIntentsValueType)calendarEventValueType
{
  if (calendarEventValueType_onceToken != -1) {
    dispatch_once(&calendarEventValueType_onceToken, &__block_literal_global_2_902);
  }
  int64_t v2 = (void *)calendarEventValueType_value;
  return (LNIntentsValueType *)v2;
}

uint64_t __44__LNIntentsValueType_calendarEventValueType__block_invoke()
{
  calendarEventValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:1];
  return MEMORY[0x1F41817F8]();
}

uint64_t __42__LNIntentsValueType_applicationValueType__block_invoke()
{
  applicationValueType_value = [[LNIntentsValueType alloc] initWithTypeIdentifier:0];
  return MEMORY[0x1F41817F8]();
}

@end