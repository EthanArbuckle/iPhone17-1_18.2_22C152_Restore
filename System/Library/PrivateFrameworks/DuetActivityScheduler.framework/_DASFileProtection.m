@interface _DASFileProtection
+ (BOOL)supportsSecureCoding;
+ (_DASFileProtection)protectionWithType:(id)a3;
+ (id)complete;
+ (id)completeUnlessOpen;
+ (id)completeUntilFirstUserAuthentication;
+ (id)none;
- (BOOL)indicatesProtection;
- (BOOL)isEqual:(id)a3;
- (NSString)fileProtection;
- (_DASFileProtection)initWithCoder:(id)a3;
- (_DASFileProtection)initWithProtection:(id)a3;
- (id)description;
- (id)protectionType;
- (void)encodeWithCoder:(id)a3;
- (void)setFileProtection:(id)a3;
@end

@implementation _DASFileProtection

+ (id)completeUnlessOpen
{
  if (completeUnlessOpen_onceToken != -1) {
    dispatch_once(&completeUnlessOpen_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)completeUnlessOpen_fileCompletionCompleteUnlessOpen;

  return v2;
}

- (_DASFileProtection)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"fileProtection"])
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileProtection"];
    v6 = v5;
    if (!v5)
    {
      v8 = 0;
LABEL_14:

      goto LABEL_15;
    }
    if (![v5 isEqualToString:*MEMORY[0x1E4F28378]])
    {
      if ([v6 isEqualToString:*MEMORY[0x1E4F28358]])
      {
        uint64_t v7 = +[_DASFileProtection completeUntilFirstUserAuthentication];
        goto LABEL_13;
      }
      if ([v6 isEqualToString:*MEMORY[0x1E4F28348]])
      {
        uint64_t v7 = +[_DASFileProtection completeUnlessOpen];
        goto LABEL_13;
      }
      if ([v6 isEqualToString:*MEMORY[0x1E4F28340]])
      {
        uint64_t v7 = +[_DASFileProtection complete];
        goto LABEL_13;
      }
    }
    uint64_t v7 = +[_DASFileProtection none];
LABEL_13:
    v8 = (_DASFileProtection *)v7;
    goto LABEL_14;
  }
  v8 = +[_DASFileProtection none];
LABEL_15:

  return v8;
}

+ (id)completeUntilFirstUserAuthentication
{
  if (completeUntilFirstUserAuthentication_onceToken != -1) {
    dispatch_once(&completeUntilFirstUserAuthentication_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)completeUntilFirstUserAuthentication_fileCompletionCompleteUntilFirstUserAuthentication;

  return v2;
}

- (id)description
{
  if ([(NSString *)self->_fileProtection isEqualToString:*MEMORY[0x1E4F28340]]) {
    return @"ClassA";
  }
  if ([(NSString *)self->_fileProtection isEqualToString:*MEMORY[0x1E4F28348]]) {
    return @"ClassB";
  }
  if ([(NSString *)self->_fileProtection isEqualToString:*MEMORY[0x1E4F28358]]) {
    return @"ClassC";
  }
  return @"None";
}

- (BOOL)indicatesProtection
{
  fileProtection = self->_fileProtection;
  if (fileProtection) {
    LOBYTE(fileProtection) = ![(NSString *)fileProtection isEqualToString:*MEMORY[0x1E4F28378]];
  }
  return (char)fileProtection;
}

+ (id)none
{
  if (none_onceToken != -1) {
    dispatch_once(&none_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)none_fileCompletionNone;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASFileProtection *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (!self->_fileProtection)
      {
        v11 = [(_DASFileProtection *)v5 fileProtection];

        if (!v11)
        {
          char v10 = 1;
          goto LABEL_12;
        }
        if (!self->_fileProtection) {
          goto LABEL_10;
        }
      }
      uint64_t v7 = [(_DASFileProtection *)v6 fileProtection];

      if (v7)
      {
        fileProtection = self->_fileProtection;
        v9 = [(_DASFileProtection *)v6 fileProtection];
        char v10 = [(NSString *)fileProtection isEqual:v9];
      }
      else
      {
LABEL_10:
        char v10 = 0;
      }
LABEL_12:

      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_13:

  return v10;
}

- (NSString)fileProtection
{
  return self->_fileProtection;
}

+ (id)complete
{
  if (complete_onceToken != -1) {
    dispatch_once(&complete_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)complete_fileCompletionComplete;

  return v2;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  fileProtection = self->_fileProtection;
  if (fileProtection) {
    [a3 encodeObject:fileProtection forKey:@"fileProtection"];
  }
}

- (_DASFileProtection)initWithProtection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASFileProtection;
  v6 = [(_DASFileProtection *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fileProtection, a3);
  }

  return v7;
}

+ (_DASFileProtection)protectionWithType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProtection:v3];

  return (_DASFileProtection *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)protectionType
{
  return self->_fileProtection;
}

- (void)setFileProtection:(id)a3
{
}

@end