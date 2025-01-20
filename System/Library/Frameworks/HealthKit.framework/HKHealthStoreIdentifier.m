@interface HKHealthStoreIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)identifierFromProfileIdentifier:(id)a3;
+ (id)primaryStoreIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimaryStoreIdentifier;
- (HKHealthStoreIdentifier)initWithCoder:(id)a3;
- (HKHealthStoreIdentifier)initWithIdentifier:(id)a3;
- (HKProfileIdentifier)profileIdentifier;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPrimaryStoreIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHealthStoreIdentifier

- (HKHealthStoreIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHealthStoreIdentifier;
  v5 = [(HKHealthStoreIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;
  }
  return v5;
}

- (id)initPrimaryStoreIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)HKHealthStoreIdentifier;
  v2 = [(HKHealthStoreIdentifier *)&v6 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = 0;
  }
  return v3;
}

+ (id)primaryStoreIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HKHealthStoreIdentifier_primaryStoreIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (primaryStoreIdentifier_onceToken != -1) {
    dispatch_once(&primaryStoreIdentifier_onceToken, block);
  }
  v2 = (void *)primaryStoreIdentifier__primaryIdentifier;

  return v2;
}

uint64_t __49__HKHealthStoreIdentifier_primaryStoreIdentifier__block_invoke(uint64_t a1)
{
  primaryStoreIdentifier__primaryIdentifier = [objc_alloc(*(Class *)(a1 + 32)) initPrimaryStoreIdentifier];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isPrimaryStoreIdentifier
{
  return self->_identifier == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKHealthStoreIdentifier *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    BOOL v7 = [(HKHealthStoreIdentifier *)self isPrimaryStoreIdentifier];
    BOOL v8 = [(HKHealthStoreIdentifier *)v6 isPrimaryStoreIdentifier];
    char v9 = v7 && v8;
    if (!v7 && !v8)
    {
      identifier = self->_identifier;
      v11 = [(HKHealthStoreIdentifier *)v6 identifier];
      char v9 = [(NSUUID *)identifier isEqual:v11];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  identifier = self->_identifier;
  if (identifier) {
    return [(NSUUID *)identifier hash];
  }
  else {
    return 1;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [(HKHealthStoreIdentifier *)self isPrimaryStoreIdentifier];
  objc_super v6 = (objc_class *)objc_opt_class();
  if (v5)
  {
    id v7 = [v6 alloc];
    return (id)[v7 initPrimaryStoreIdentifier];
  }
  else
  {
    char v9 = [(objc_class *)v6 allocWithZone:a3];
    identifier = self->_identifier;
    return [(objc_class *)v9 initWithIdentifier:identifier];
  }
}

- (HKProfileIdentifier)profileIdentifier
{
  if ([(HKHealthStoreIdentifier *)self isPrimaryStoreIdentifier]) {
    +[HKProfileIdentifier primaryProfile];
  }
  else {
  v3 = +[HKProfileIdentifier _profileWithUUID:self->_identifier type:2];
  }

  return (HKProfileIdentifier *)v3;
}

+ (id)identifierFromProfileIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 1)
  {
    id v4 = +[HKHealthStoreIdentifier primaryStoreIdentifier];
  }
  else
  {
    BOOL v5 = [HKHealthStoreIdentifier alloc];
    objc_super v6 = [v3 identifier];
    id v4 = [(HKHealthStoreIdentifier *)v5 initWithIdentifier:v6];
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKHealthStoreIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeBoolForKey:@"is_primary_store_identifier"];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  if (v5)
  {
    id v7 = +[HKHealthStoreIdentifier primaryStoreIdentifier];
LABEL_5:
    BOOL v8 = v7;
    goto LABEL_6;
  }
  if (v6)
  {
    id v7 = [(HKHealthStoreIdentifier *)self initWithIdentifier:v6];
    self = v7;
    goto LABEL_5;
  }
  _HKInitializeLogging();
  v10 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
    -[HKHealthStoreIdentifier initWithCoder:](v10);
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[HKHealthStoreIdentifier isPrimaryStoreIdentifier](self, "isPrimaryStoreIdentifier"), @"is_primary_store_identifier");
  identifier = self->_identifier;
  if (identifier) {
    [v5 encodeObject:identifier forKey:@"identifier"];
  }
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v3 = 138412290;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_19C023000, v1, OS_LOG_TYPE_ERROR, "Asked to decode an %@ with no UUID; returning nil",
    (uint8_t *)&v3,
    0xCu);
}

@end