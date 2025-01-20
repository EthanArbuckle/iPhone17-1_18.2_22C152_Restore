@interface CNSensitiveContentConfiguration
+ (BOOL)supportsSecureCoding;
+ (CNSensitiveContentConfiguration)configurationWithOverride:(int64_t)a3;
+ (id)log;
- (BOOL)isEqual:(id)a3;
- (CNSensitiveContentConfiguration)initWithCoder:(id)a3;
- (CNSensitiveContentConfiguration)initWithDataRepresentation:(id)a3;
- (CNSensitiveContentConfiguration)initWithSensitiveContentOverride:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentation;
- (id)updatedWithOverride:(int64_t)a3;
- (int64_t)override;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setOverride:(int64_t)a3;
@end

@implementation CNSensitiveContentConfiguration

+ (id)log
{
  if (log_cn_once_token_0_7 != -1) {
    dispatch_once(&log_cn_once_token_0_7, &__block_literal_global_90);
  }
  v2 = (void *)log_cn_once_object_0_7;

  return v2;
}

uint64_t __38__CNSensitiveContentConfiguration_log__block_invoke()
{
  log_cn_once_object_0_7 = (uint64_t)os_log_create("com.apple.contacts", "CNSensitiveContentConfiguration");

  return MEMORY[0x1F41817F8]();
}

+ (CNSensitiveContentConfiguration)configurationWithOverride:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSensitiveContentOverride:a3];

  return (CNSensitiveContentConfiguration *)v3;
}

- (CNSensitiveContentConfiguration)initWithSensitiveContentOverride:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNSensitiveContentConfiguration;
  v4 = [(CNSensitiveContentConfiguration *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_override = a3;
    v6 = v4;
  }

  return v5;
}

- (CNSensitiveContentConfiguration)initWithDataRepresentation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = a3;
    id v11 = 0;
    v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];

    id v7 = v11;
    if (v6)
    {
      objc_super v8 = v6;
    }
    else
    {
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_DEFAULT, "Error unarchiving Core Data value into CNSensitiveContentConfiguration: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dataRepresentation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Error archiving CNSensitiveContentConfiguration: %@", buf, 0xCu);
    }
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSensitiveContentConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"version"];
  if (v5 >= 2)
  {
    int v7 = v5;
    objc_super v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNSensitiveContentConfiguration initWithCoder:](v7, v8);
    }

    v6 = 0;
  }
  else
  {
    self = -[CNSensitiveContentConfiguration initWithSensitiveContentOverride:](self, "initWithSensitiveContentOverride:", [v4 decodeIntegerForKey:@"override"]);
    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CNSensitiveContentConfiguration override](self, "override"), @"override");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNSensitiveContentConfiguration alloc];
  int64_t v5 = [(CNSensitiveContentConfiguration *)self override];

  return [(CNSensitiveContentConfiguration *)v4 initWithSensitiveContentOverride:v5];
}

- (id)updatedWithOverride:(int64_t)a3
{
  id v4 = (void *)[(CNSensitiveContentConfiguration *)self copy];
  [v4 setOverride:a3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNSensitiveContentConfiguration *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = [(CNSensitiveContentConfiguration *)self override];
      BOOL v6 = v5 == [(CNSensitiveContentConfiguration *)v4 override];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = [(CNSensitiveContentConfiguration *)self override];
  if (v2 >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = -v2;
  }
  return v3 + 527;
}

- (int64_t)override
{
  return self->_override;
}

- (void)setOverride:(int64_t)a3
{
  self->_override = a3;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "CNSensitiveContentConfiguration has a higher version number than we know how to handle: %ld", (uint8_t *)&v2, 0xCu);
}

@end