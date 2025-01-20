@interface _CDContextValue
+ (BOOL)supportsSecureCoding;
+ (NSSet)supportedContextValueClasses;
- (BOOL)isEqual:(id)a3;
- (NSCopying)value;
- (NSDate)lastModifiedDate;
- (NSMutableDictionary)metadata;
- (_CDContextValue)init;
- (_CDContextValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation _CDContextValue

- (void).cxx_destruct
{
}

- (NSDate)lastModifiedDate
{
  return (NSDate *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"_CDContextMetadataTransitionDateKey"];
}

- (NSCopying)value
{
  return (NSCopying *)[(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"_CDContextMetadataDataKey"];
}

- (_CDContextValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CDContextValue;
  v5 = [(_CDContextValue *)&v12 init];
  if (v5)
  {
    v6 = +[_CDContextValue supportedContextValueClasses];
    v7 = [v4 decodeObjectOfClasses:v6 forKey:@"value"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModified"];
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    metadata = v5->_metadata;
    v5->_metadata = (NSMutableDictionary *)v9;

    [(NSMutableDictionary *)v5->_metadata setObject:v7 forKeyedSubscript:@"_CDContextMetadataDataKey"];
    [(NSMutableDictionary *)v5->_metadata setObject:v8 forKeyedSubscript:@"_CDContextMetadataTransitionDateKey"];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [v4 metadata];
  [v5 addEntriesFromDictionary:self->_metadata];

  return v4;
}

- (_CDContextValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CDContextValue;
  v2 = [(_CDContextValue *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    metadata = v2->_metadata;
    v2->_metadata = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (NSMutableDictionary)metadata
{
  return self->_metadata;
}

+ (NSSet)supportedContextValueClasses
{
  if (supportedContextValueClasses_initialized != -1) {
    dispatch_once(&supportedContextValueClasses_initialized, &__block_literal_global_13);
  }
  v2 = (void *)supportedContextValueClasses_supportedContextValueClasses;
  return (NSSet *)v2;
}

- (void)setValue:(id)a3
{
}

- (void)setLastModifiedDate:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  metadata = self->_metadata;
  id v5 = a3;
  objc_super v6 = [(NSMutableDictionary *)metadata objectForKeyedSubscript:@"_CDContextMetadataDataKey"];
  [v5 encodeObject:v6 forKey:@"value"];

  id v7 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:@"_CDContextMetadataTransitionDateKey"];
  [v5 encodeObject:v7 forKey:@"lastModified"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDContextValue *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      objc_super v6 = [(_CDContextValue *)self value];
      id v7 = [(_CDContextValue *)v5 value];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(_CDContextValue *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = self->_metadata;
  objc_sync_enter(v3);
  id v4 = [(_CDContextValue *)self value];
  id v5 = [v4 description];

  objc_super v6 = [(_CDContextValue *)self lastModifiedDate];
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v8 = [v6 descriptionWithLocale:v7];

  uint64_t v9 = [NSString stringWithFormat:@"%@: Updated at %@", v5, v8];

  objc_sync_exit(v3);
  return v9;
}

- (void)setMetadata:(id)a3
{
}

@end