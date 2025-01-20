@interface SYDictionaryObject
+ (BOOL)supportsSecureCoding;
- (NSDictionary)properties;
- (SYDictionaryObject)initWithCoder:(id)a3;
- (SYDictionaryObject)initWithProperties:(id)a3;
- (id)syncId;
- (void)encodeWithCoder:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation SYDictionaryObject

- (SYDictionaryObject)initWithProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYDictionaryObject;
  v5 = [(SYDictionaryObject *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SYDictionaryObject *)v5 setProperties:v4];
  }

  return v6;
}

- (void)setProperties:(id)a3
{
  id v4 = (NSDictionary *)a3;
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"kSYDictionaryObjectSyncIDKey"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"Invalid dictionary" format:@"SYDictionaryObject properties dictionaries must contain an NSString for the kSYDictionaryObjectSyncIDKey key"];
  }
  properties = self->_properties;
  self->_properties = v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDictionaryObject *)self properties];
  [v4 encodeObject:v5 forKey:@"SYDictProperties"];
}

- (SYDictionaryObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SYDictionaryObject;
  id v5 = [(SYDictionaryObject *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SYDictProperties"];
    [(SYDictionaryObject *)v5 setProperties:v6];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)syncId
{
  v2 = [(SYDictionaryObject *)self properties];
  v3 = [v2 objectForKeyedSubscript:@"kSYDictionaryObjectSyncIDKey"];

  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end