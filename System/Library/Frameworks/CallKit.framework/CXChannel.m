@interface CXChannel
+ (BOOL)supportsSecureCoding;
+ (NSSet)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannel:(id)a3;
- (BOOL)isEquivalentToChannel:(id)a3;
- (CXChannel)initWithChannel:(id)a3;
- (CXChannel)initWithCoder:(id)a3;
- (CXChannel)initWithUUID:(id)a3 transmissionMode:(int64_t)a4;
- (NSString)localizedName;
- (NSUUID)UUID;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)transmissionMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CXChannel

- (CXChannel)initWithUUID:(id)a3 transmissionMode:(int64_t)a4
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CXChannel;
  v8 = [(CXChannel *)&v10 init];
  if (v8)
  {
    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXChannel initWithUUID:transmissionMode:]", @"UUID" format];
    }
    v8->_transmissionMode = a4;
    objc_storeStrong((id *)&v8->_UUID, a3);
  }

  return v8;
}

- (CXChannel)initWithChannel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXChannel;
  v5 = [(CXChannel *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_localizedName, *((id *)v4 + 2));
    v6->_transmissionMode = *((void *)v4 + 3);
    objc_storeStrong((id *)&v6->_UUID, *((id *)v4 + 1));
  }

  return v6;
}

- (BOOL)isEqualToChannel:(id)a3
{
  id v4 = a3;
  v5 = [(CXChannel *)self localizedName];
  v6 = [v4 localizedName];
  if (v6)
  {
    if (([v5 isEqualToString:v6] & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (v5)
  {
LABEL_7:
    char v10 = 0;
    goto LABEL_8;
  }
  int64_t v7 = [(CXChannel *)self transmissionMode];
  if (v7 != [v4 transmissionMode]) {
    goto LABEL_7;
  }
  objc_super v8 = [(CXChannel *)self UUID];
  v9 = [v4 UUID];
  char v10 = [v8 isEqual:v9];

LABEL_8:
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXChannel *)self UUID];
  v6 = [v3 stringWithFormat:@"<%@ %p UUID=%@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(CXChannel *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  [v3 appendFormat:@", "];
  v5 = [(CXChannel *)self localizedName];
  [v3 appendFormat:@" localizedName=%@", v5];

  [v3 appendFormat:@", "];
  v6 = NSStringFromSelector(sel_transmissionMode);
  unint64_t v7 = [(CXChannel *)self transmissionMode];
  self;
  if (v7 > 2) {
    objc_super v8 = 0;
  }
  else {
    objc_super v8 = off_1E5CAE2D0[v7];
  }
  [v3 appendFormat:@" %@=%@", v6, v8];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CXChannel *)self isEqualToChannel:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = [(CXChannel *)self localizedName];
  unint64_t v4 = [v3 hash];
  uint64_t v5 = [(CXChannel *)self transmissionMode];
  v6 = [(CXChannel *)self UUID];
  [v6 hash];
  unint64_t v14 = CXHash(4uLL, v7, v8, v9, v10, v11, v12, v13, v4, v5);

  return v14;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (BOOL)isEquivalentToChannel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXChannel *)self UUID];
  v6 = [v4 UUID];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

+ (NSSet)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  uint64_t v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CXChannel;
  uint64_t v5 = [(CXChannel *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_localizedName);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v8;

    uint64_t v10 = NSStringFromSelector(sel_transmissionMode);
    v5->_transmissionMode = [v4 decodeIntegerForKey:v10];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = NSStringFromSelector(sel_UUID);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXChannel *)self localizedName];
  uint64_t v6 = NSStringFromSelector(sel_localizedName);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(CXChannel *)self transmissionMode];
  uint64_t v8 = NSStringFromSelector(sel_transmissionMode);
  [v4 encodeInteger:v7 forKey:v8];

  id v10 = [(CXChannel *)self UUID];
  uint64_t v9 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v10 forKey:v9];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CXChannel allocWithZone:a3];

  return [(CXChannel *)v4 initWithChannel:self];
}

@end