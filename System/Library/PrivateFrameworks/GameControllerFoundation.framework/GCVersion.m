@interface GCVersion
+ (BOOL)supportsSecureCoding;
+ (id)currentSourceVersion;
- (BOOL)isEqualTo:(id)a3;
- (BOOL)isEqualToSourceVersion:(id)a3;
- (BOOL)isGreaterThan:(id)a3;
- (BOOL)isGreaterThanOrEqualTo:(id)a3;
- (BOOL)isGreaterThanOrEqualToSourceVersion:(id)a3;
- (BOOL)isGreaterThanSourceVersion:(id)a3;
- (BOOL)isLessThan:(id)a3;
- (BOOL)isLessThanOrEqualTo:(id)a3;
- (BOOL)isLessThanOrEqualToSourceVersion:(id)a3;
- (BOOL)isLessThanSourceVersion:(id)a3;
- (GCVersion)init;
- (GCVersion)initWithCoder:(id)a3;
- (GCVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 patch:(unint64_t)a5;
- (GCVersion)initWithString:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)major;
- (unint64_t)minor;
- (unint64_t)patch;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GCVersion

+ (id)currentSourceVersion
{
  if (currentSourceVersion_onceToken != -1) {
    dispatch_once(&currentSourceVersion_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)currentSourceVersion_currentSourceVersion;

  return v2;
}

uint64_t __33__GCVersion_currentSourceVersion__block_invoke()
{
  v0 = (unsigned int *)dyld_image_header_containing_address();
  uint64_t v1 = *v0;
  if (v1 != -17958193)
  {
    v5 = +[NSString stringWithFormat:@"GameControllerFoundation Mach-O header has incorrect magic: %x", v1];
    NSExceptionName v4 = NSInternalInconsistencyException;
LABEL_7:
    id v6 = +[NSException exceptionWithName:v4 reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  unsigned int v2 = v0[4];
  if (!v2)
  {
LABEL_6:
    NSExceptionName v4 = NSInternalInconsistencyException;
    v5 = @"GameControllerFoundation Mach-O is missing LC_SOURCE_VERSION";
    goto LABEL_7;
  }
  v3 = v0 + 8;
  while (*v3 != 42)
  {
    v3 = (unsigned int *)((char *)v3 + v3[1]);
    if (!--v2) {
      goto LABEL_6;
    }
  }
  unint64_t v7 = *((void *)v3 + 1);
  currentSourceVersion_currentSourceVersion = [[GCVersion alloc] initWithMajor:(v7 >> 40) & 0x7FFFFF minor:(v7 >> 30) & 0x3FF patch:(v7 >> 20) & 0x3FF];

  return MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCVersion)initWithMajor:(unint64_t)a3 minor:(unint64_t)a4 patch:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)GCVersion;
  result = [(GCVersion *)&v9 init];
  result->_major = a3;
  result->_minor = a4;
  result->_patch = a5;
  return result;
}

- (GCVersion)initWithString:(id)a3
{
  id v4 = a3;
  if (initWithString__onceToken != -1) {
    dispatch_once(&initWithString__onceToken, &__block_literal_global_8);
  }
  v5 = [v4 stringByTrimmingCharactersInSet:initWithString__invalidChars];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    unint64_t v7 = [v4 componentsSeparatedByString:@"."];
    if (![v7 count]) {
      goto LABEL_17;
    }
    if ((unint64_t)[v7 count] > 3) {
      goto LABEL_17;
    }
    v8 = [v7 objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 length];

    if (!v9) {
      goto LABEL_17;
    }
    v10 = [v7 objectAtIndexedSubscript:0];
    uint64_t v11 = [v10 integerValue];

    if (v11 < 1) {
      goto LABEL_17;
    }
    if ((unint64_t)[v7 count] < 2)
    {
      uint64_t v15 = 0;
    }
    else
    {
      v12 = [v7 objectAtIndexedSubscript:1];
      uint64_t v13 = [v12 length];

      if (!v13) {
        goto LABEL_17;
      }
      v14 = [v7 objectAtIndexedSubscript:1];
      uint64_t v15 = [v14 integerValue];

      if (v15 < 0) {
        goto LABEL_17;
      }
    }
    if ((unint64_t)[v7 count] < 3)
    {
      uint64_t v20 = 0;
    }
    else
    {
      v17 = [v7 objectAtIndexedSubscript:2];
      uint64_t v18 = [v17 length];

      if (!v18
        || ([v7 objectAtIndexedSubscript:2],
            v19 = objc_claimAutoreleasedReturnValue(),
            uint64_t v20 = [v19 integerValue],
            v19,
            v20 < 0))
      {
LABEL_17:
        v16 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    self = [(GCVersion *)self initWithMajor:v11 minor:v15 patch:v20];
    v16 = self;
    goto LABEL_18;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

void __28__GCVersion_initWithString___block_invoke()
{
  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
  uint64_t v0 = [v2 invertedSet];
  uint64_t v1 = (void *)initWithString__invalidChars;
  initWithString__invalidChars = v0;
}

- (GCVersion)init
{
  return [(GCVersion *)self initWithMajor:0 minor:0 patch:0];
}

- (GCVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"major"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"minor"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"patch"];

  return [(GCVersion *)self initWithMajor:v5 minor:v6 patch:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCVersion major](self, "major"), @"major");
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCVersion minor](self, "minor"), @"minor");
  objc_msgSend(v4, "encodeInteger:forKey:", -[GCVersion patch](self, "patch"), @"patch");
}

- (BOOL)isEqualToSourceVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(GCVersion *)self major];
  if (v5 == [v4 major] && (unint64_t v6 = -[GCVersion minor](self, "minor"), v6 == objc_msgSend(v4, "minor")))
  {
    unint64_t v7 = [(GCVersion *)self patch];
    BOOL v8 = v7 == [v4 patch];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isGreaterThanSourceVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(GCVersion *)self major];
  if (v5 > [v4 major]) {
    goto LABEL_6;
  }
  unint64_t v6 = [(GCVersion *)self major];
  if (v6 != [v4 major]) {
    goto LABEL_8;
  }
  unint64_t v7 = [(GCVersion *)self minor];
  if (v7 <= [v4 minor])
  {
    unint64_t v8 = [(GCVersion *)self minor];
    if (v8 == [v4 minor])
    {
      unint64_t v9 = [(GCVersion *)self patch];
      if (v9 > [v4 patch]) {
        goto LABEL_6;
      }
      [(GCVersion *)self patch];
      [v4 patch];
    }
LABEL_8:
    BOOL v10 = 0;
    goto LABEL_9;
  }
LABEL_6:
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (BOOL)isGreaterThanOrEqualToSourceVersion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(GCVersion *)self isGreaterThanSourceVersion:v4]
    || [(GCVersion *)self isEqualToSourceVersion:v4];

  return v5;
}

- (BOOL)isLessThanSourceVersion:(id)a3
{
  return [a3 isGreaterThanSourceVersion:self];
}

- (BOOL)isLessThanOrEqualToSourceVersion:(id)a3
{
  return [a3 isGreaterThanOrEqualToSourceVersion:self];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if ([(GCVersion *)self isLessThanSourceVersion:v4]) {
    int64_t v5 = -1;
  }
  else {
    int64_t v5 = [(GCVersion *)self isGreaterThanSourceVersion:v4];
  }

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(GCVersion *)self isEqualToSourceVersion:v4];

  return v5;
}

- (BOOL)isGreaterThan:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GCVersion *)self isGreaterThanSourceVersion:v4];

  return v5;
}

- (BOOL)isGreaterThanOrEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GCVersion *)self isGreaterThanOrEqualToSourceVersion:v4];

  return v5;
}

- (BOOL)isLessThan:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GCVersion *)self isLessThanSourceVersion:v4];

  return v5;
}

- (BOOL)isLessThanOrEqualTo:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GCVersion *)self isLessThanOrEqualToSourceVersion:v4];

  return v5;
}

- (unint64_t)hash
{
  return self->_minor ^ self->_major ^ self->_patch;
}

- (id)description
{
  return +[NSString stringWithFormat:@"%lu.%lu.%lu", [(GCVersion *)self major], [(GCVersion *)self minor], [(GCVersion *)self patch]];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"%lu.%lu.%lu", [(GCVersion *)self major], [(GCVersion *)self minor], [(GCVersion *)self patch]];
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BOOL v5 = [(GCVersion *)self description];
  unint64_t v6 = +[NSString stringWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (unint64_t)major
{
  return self->_major;
}

- (unint64_t)minor
{
  return self->_minor;
}

- (unint64_t)patch
{
  return self->_patch;
}

@end