@interface _MPModelLibraryRequestPropertyFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)keys;
- (NSString)value;
- (_MPModelLibraryRequestPropertyFilter)initWithCoder:(id)a3;
- (_MPModelLibraryRequestPropertyFilter)initWithKeys:(id)a3 value:(id)a4 comparisonType:(int64_t)a5;
- (id)description;
- (int64_t)comparisonType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MPModelLibraryRequestPropertyFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (NSString)value
{
  return self->_value;
}

- (NSArray)keys
{
  return self->_keys;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  id v5 = [(_MPModelLibraryRequestPropertyFilter *)self keys];
  id v6 = [v4 keys];
  if (v5 == v6)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [v5 isEqual:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_8;
    }
  }
  id v9 = [(_MPModelLibraryRequestPropertyFilter *)self value];
  id v10 = [v4 value];
  if (v9 == v10)
  {

    goto LABEL_10;
  }
  v11 = v10;
  char v12 = [v9 isEqual:v10];

  if (v12)
  {
LABEL_10:
    int64_t v14 = [(_MPModelLibraryRequestPropertyFilter *)self comparisonType];
    BOOL v13 = v14 == [v4 comparisonType];
    goto LABEL_11;
  }
LABEL_8:
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  keys = self->_keys;
  id v5 = a3;
  [v5 encodeObject:keys forKey:@"MPModelLibraryRequestPropertyFilterCodingKeyKeys"];
  [v5 encodeObject:self->_value forKey:@"MPModelLibraryRequestPropertyFilterCodingKeyValue"];
  [v5 encodeInteger:self->_comparisonType forKey:@"MPModelLibraryRequestPropertyFilterCodingKeyComparisonType"];
}

- (_MPModelLibraryRequestPropertyFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MPModelLibraryRequestPropertyFilter;
  id v5 = [(_MPModelLibraryRequestPropertyFilter *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPModelLibraryRequestPropertyFilterCodingKeyKeys"];
    keys = v5->_keys;
    v5->_keys = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelLibraryRequestPropertyFilterCodingKeyValue"];
    value = v5->_value;
    v5->_value = (NSString *)v11;

    v5->_comparisonType = [v4 decodeIntegerForKey:@"MPModelLibraryRequestPropertyFilterCodingKeyComparisonType"];
  }

  return v5;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)_MPModelLibraryRequestPropertyFilter;
  v3 = [(_MPModelLibraryRequestPropertyFilter *)&v10 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if ([(NSArray *)self->_keys count])
  {
    id v5 = [(NSArray *)self->_keys msv_compactDescription];
    [v4 appendFormat:@" keyPath=[%@]", v5];
  }
  if ([(NSString *)self->_value length]) {
    [v4 appendFormat:@" value=\"%@\"", self->_value];
  }
  int64_t comparisonType = self->_comparisonType;
  if (comparisonType)
  {
    if (comparisonType != 1) {
      goto LABEL_10;
    }
    uint64_t v7 = @" comparisonType=contains >";
  }
  else
  {
    uint64_t v7 = @" comparisonType=equalTo >";
  }
  [v4 appendString:v7];
LABEL_10:
  char v8 = (void *)[v4 copy];

  return v8;
}

- (_MPModelLibraryRequestPropertyFilter)initWithKeys:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPModelLibraryRequestPropertyFilter;
  objc_super v10 = [(_MPModelLibraryRequestPropertyFilter *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    keys = v10->_keys;
    v10->_keys = (NSArray *)v11;

    uint64_t v13 = [v9 copy];
    value = v10->_value;
    v10->_value = (NSString *)v13;

    v10->_int64_t comparisonType = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end