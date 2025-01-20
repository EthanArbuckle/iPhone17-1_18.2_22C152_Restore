@interface DMFInstallManagedBookResultObject
+ (BOOL)supportsSecureCoding;
- (DMFBook)book;
- (DMFInstallManagedBookResultObject)initWithBook:(id)a3;
- (DMFInstallManagedBookResultObject)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFInstallManagedBookResultObject

- (DMFInstallManagedBookResultObject)initWithBook:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFInstallManagedBookResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    book = v5->_book;
    v5->_book = (DMFBook *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInstallManagedBookResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFInstallManagedBookResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"book"];
    book = v5->_book;
    v5->_book = (DMFBook *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFInstallManagedBookResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFInstallManagedBookResultObject *)self book];
  [v4 encodeObject:v5 forKey:@"book"];
}

- (id)description
{
  v2 = [(DMFInstallManagedBookResultObject *)self book];
  v3 = [v2 description];

  return v3;
}

- (DMFBook)book
{
  return self->_book;
}

- (void).cxx_destruct
{
}

@end