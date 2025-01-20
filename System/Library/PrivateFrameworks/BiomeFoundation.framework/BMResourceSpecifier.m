@interface BMResourceSpecifier
+ (BOOL)supportsSecureCoding;
+ (id)resourceFromContainer:(id)a3 withType:(unint64_t)a4 name:(id)a5 descriptors:(id)a6;
- (BMResourceSpecifier)initWithCoder:(id)a3;
- (BMResourceSpecifier)initWithType:(unint64_t)a3 name:(id)a4;
- (BMResourceSpecifier)initWithType:(unint64_t)a3 name:(id)a4 descriptors:(id)a5 options:(unsigned __int8)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)descriptors;
- (NSString)name;
- (NSString)shortDescription;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (unsigned)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMResourceSpecifier

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_descriptors forKey:@"descriptors"];
  [v5 encodeInt32:self->_options forKey:@"options"];
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInteger:self->_type];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_name hash];
  uint64_t v6 = v5 ^ [(NSArray *)self->_descriptors hash] ^ v4;
  v7 = [NSNumber numberWithUnsignedChar:self->_options];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_type == v4[2]
    && [(NSString *)self->_name isEqual:v4[3]]
    && [(NSArray *)self->_descriptors isEqual:v4[5]]
    && self->_options == *((unsigned __int8 *)v4 + 8);

  return v5;
}

- (BMResourceSpecifier)initWithType:(unint64_t)a3 name:(id)a4
{
  return [(BMResourceSpecifier *)self initWithType:a3 name:a4 descriptors:MEMORY[0x1E4F1CBF0] options:0];
}

- (BMResourceSpecifier)initWithType:(unint64_t)a3 name:(id)a4 descriptors:(id)a5 options:(unsigned __int8)a6
{
  id v10 = a4;
  id v11 = a5;
  if (BMIdentifierIsPathSafe(v10))
  {
    v21.receiver = self;
    v21.super_class = (Class)BMResourceSpecifier;
    v12 = [(BMResourceSpecifier *)&v21 init];
    v13 = v12;
    if (v12)
    {
      v12->_unint64_t type = a3;
      uint64_t v14 = [v10 copy];
      name = v13->_name;
      v13->_name = (NSString *)v14;

      uint64_t v16 = [v11 copy];
      descriptors = v13->_descriptors;
      v13->_descriptors = (NSArray *)v16;

      v13->_options = a6;
    }
    self = v13;
    v18 = self;
  }
  else
  {
    v19 = __biome_log_for_category(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[BMResourceSpecifier initWithType:name:descriptors:options:]((uint64_t)v10, v19);
    }

    v18 = 0;
  }

  return v18;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown(%lu):", type);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_1E6022FF0[type];
  }
  if ([(NSArray *)self->_descriptors count])
  {
    BOOL v5 = NSString;
    uint64_t v6 = [(NSArray *)self->_descriptors componentsJoinedByString:@", "];
    v7 = [v5 stringWithFormat:@" [%@]", v6];
  }
  else
  {
    v7 = &stru_1F0B3A038;
  }
  if (self->_options)
  {
    unint64_t v8 = NSString;
    v9 = BMResourceOptionsDescription(self->_options);
    id v10 = [v8 stringWithFormat:@" options: %@", v9];
  }
  else
  {
    id v10 = &stru_1F0B3A038;
  }
  id v11 = [NSString stringWithFormat:@"<BMResource: %@%@%@%@>", v4, self->_name, v7, v10];

  return v11;
}

- (unsigned)options
{
  return self->_options;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMResourceSpecifier)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"descriptors"];
  unint64_t v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  id v11 = -[BMResourceSpecifier initWithType:name:descriptors:options:](self, "initWithType:name:descriptors:options:", v5, v6, v10, [v4 decodeInt32ForKey:@"options"]);
  if (!v11)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Decoding failure";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v14 = [v12 errorWithDomain:@"Biome" code:-1 userInfo:v13];
    [v4 failWithError:v14];
  }
  return v11;
}

+ (id)resourceFromContainer:(id)a3 withType:(unint64_t)a4 name:(id)a5 descriptors:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:name:descriptors:options:", a4, v10, v9, objc_msgSend(a3, "isInUserVault"));

  return v11;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
}

- (void)initWithType:(uint64_t)a1 name:(NSObject *)a2 descriptors:options:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Invalid resource name %@", (uint8_t *)&v2, 0xCu);
}

@end