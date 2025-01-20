@interface CKKSKeychainBackedKeySet
+ (BOOL)supportsSecureCoding;
- (BOOL)newUpload;
- (CKKSKeychainBackedKey)classA;
- (CKKSKeychainBackedKey)classC;
- (CKKSKeychainBackedKey)tlk;
- (CKKSKeychainBackedKeySet)initWithCoder:(id)a3;
- (CKKSKeychainBackedKeySet)initWithTLK:(id)a3 classA:(id)a4 classC:(id)a5 newUpload:(BOOL)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setClassA:(id)a3;
- (void)setClassC:(id)a3;
- (void)setNewUpload:(BOOL)a3;
- (void)setTlk:(id)a3;
@end

@implementation CKKSKeychainBackedKeySet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classC, 0);
  objc_storeStrong((id *)&self->_classA, 0);

  objc_storeStrong((id *)&self->_tlk, 0);
}

- (void)setNewUpload:(BOOL)a3
{
  self->_newUpload = a3;
}

- (BOOL)newUpload
{
  return self->_newUpload;
}

- (void)setClassC:(id)a3
{
}

- (CKKSKeychainBackedKey)classC
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClassA:(id)a3
{
}

- (CKKSKeychainBackedKey)classA
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTlk:(id)a3
{
}

- (CKKSKeychainBackedKey)tlk
{
  return (CKKSKeychainBackedKey *)objc_getProperty(self, a2, 16, 1);
}

- (CKKSKeychainBackedKeySet)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKKSKeychainBackedKeySet;
  v5 = [(CKKSKeychainBackedKeySet *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlk"];
    tlk = v5->_tlk;
    v5->_tlk = (CKKSKeychainBackedKey *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classA"];
    classA = v5->_classA;
    v5->_classA = (CKKSKeychainBackedKey *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classC"];
    classC = v5->_classC;
    v5->_classC = (CKKSKeychainBackedKey *)v10;

    v5->_newUpload = [v4 decodeBoolForKey:@"newUpload"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CKKSKeychainBackedKeySet *)self tlk];
  [v7 encodeObject:v4 forKey:@"tlk"];

  v5 = [(CKKSKeychainBackedKeySet *)self classA];
  [v7 encodeObject:v5 forKey:@"classA"];

  uint64_t v6 = [(CKKSKeychainBackedKeySet *)self classC];
  [v7 encodeObject:v6 forKey:@"classC"];

  objc_msgSend(v7, "encodeBool:forKey:", -[CKKSKeychainBackedKeySet newUpload](self, "newUpload"), @"newUpload");
}

- (id)description
{
  v3 = [(CKKSKeychainBackedKeySet *)self tlk];
  id v4 = [(CKKSKeychainBackedKeySet *)self classA];
  v5 = [(CKKSKeychainBackedKeySet *)self classC];
  uint64_t v6 = +[NSString stringWithFormat:@"<CKKSKeychainBackedKeySet: tlk:%@, classA:%@, classC:%@, newUpload:%d>", v3, v4, v5, [(CKKSKeychainBackedKeySet *)self newUpload]];

  return v6;
}

- (CKKSKeychainBackedKeySet)initWithTLK:(id)a3 classA:(id)a4 classC:(id)a5 newUpload:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKKSKeychainBackedKeySet;
  v14 = [(CKKSKeychainBackedKeySet *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_tlk, a3);
    objc_storeStrong((id *)&v15->_classA, a4);
    objc_storeStrong((id *)&v15->_classC, a5);
    v15->_newUpload = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end