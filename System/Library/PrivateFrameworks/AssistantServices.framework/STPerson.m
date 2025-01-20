@interface STPerson
+ (BOOL)supportsSecureCoding;
- (NSSet)contactHandles;
- (NSString)description;
- (NSString)fullName;
- (STPerson)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContactHandles:(id)a3;
- (void)setFullName:(id)a3;
@end

@implementation STPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
}

- (void)setFullName:(id)a3
{
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setContactHandles:(id)a3
{
}

- (NSSet)contactHandles
{
  return self->_contactHandles;
}

- (STPerson)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STPerson;
  v5 = [(STSiriModelObject *)&v14 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_contactHandles"];
    contactHandles = v5->_contactHandles;
    v5->_contactHandles = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STPerson;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactHandles, @"_contactHandles", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fullName forKey:@"_fullName"];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(STPerson *)self fullName];
  v6 = [(STPerson *)self contactHandles];
  v7 = [v3 stringWithFormat:@"<%@: %p fullName=%@ contactHandles=%@>", v4, self, v5, v6];;

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end