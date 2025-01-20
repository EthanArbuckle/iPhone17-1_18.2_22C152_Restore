@interface _UTUndeclaredTypeRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToTypeIdentifier:(id)a3;
- (BOOL)isInPublicDomain;
- (_UTUndeclaredTypeRecord)initWithCoder:(id)a3;
- (id)_initWithContext:(LSContext *)a3 identifier:(id)a4;
- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)declaration;
- (id)identifier;
- (id)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UTUndeclaredTypeRecord

- (id)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (_UTUndeclaredTypeRecord)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UTUndeclaredTypeRecord;
  v4 = -[LSRecord initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;
  }
  return v4;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_UTUndeclaredTypeRecord;
  v7 = [(LSRecord *)&v12 _persistentIdentifierWithContext:a3 tableID:*(void *)&a4 unitID:*(void *)&a5 unitBytes:a6];
  objc_super v8 = (void *)[v7 mutableCopy];

  v9 = [(NSString *)self->_identifier dataUsingEncoding:4];
  if (v9) {
    [v8 appendData:v9];
  }

  v10 = (void *)[v8 copy];

  return v10;
}

- (id)_initWithContext:(LSContext *)a3 identifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UTUndeclaredTypeRecord;
  uint64_t v5 = -[LSRecord _initWithContext:tableID:unitID:](&v9, sel__initWithContext_tableID_unitID_);
  if (v5)
  {
    uint64_t v6 = [a4 copy];
    v7 = (void *)v5[4];
    v5[4] = v6;
  }
  return v5;
}

- (id)version
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  v2 = [(_UTUndeclaredTypeRecord *)self identifier];
  char v3 = [v2 hasPrefix:@"public."];

  return v3;
}

- (id)declaration
{
  v6[1] = *MEMORY[0x1E4F143B8];
  identifier = self->_identifier;
  uint64_t v5 = @"UTTypeIdentifier";
  v6[0] = identifier;
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  LOBYTE(self) = UTTypeEqual(v4, (CFStringRef)[(_UTUndeclaredTypeRecord *)self identifier]) != 0;

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UTUndeclaredTypeRecord;
  -[LSRecord encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)awakeAfterUsingCoder:(id)a3
{
  char v3 = self;
  v4 = [(_UTUndeclaredTypeRecord *)v3 identifier];
  objc_super v5 = +[UTTypeRecord typeRecordWithIdentifier:v4];

  uint64_t v6 = v3;
  if (v5)
  {
    uint64_t v6 = v5;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UTUndeclaredTypeRecord;
  v4 = [(LSRecord *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 4, self->_identifier);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end