@interface CKContextCountedString
+ (BOOL)supportsSecureCoding;
+ (id)string:(id)a3 withCount:(unint64_t)a4;
- (CKContextCountedString)initWithCoder:(id)a3;
- (NSString)string;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setString:(id)a3;
@end

@implementation CKContextCountedString

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)string:(id)a3 withCount:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CKContextCountedString);
  [(CKContextCountedString *)v6 setString:v5];

  [(CKContextCountedString *)v6 setCount:a4];
  return v6;
}

- (CKContextCountedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKContextCountedString;
  id v5 = [(CKContextCountedString *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_count = [v4 decodeIntegerForKey:@"count"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  string = self->_string;
  id v5 = a3;
  [v5 encodeObject:string forKey:@"string"];
  [v5 encodeInteger:self->_count forKey:@"count"];
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end