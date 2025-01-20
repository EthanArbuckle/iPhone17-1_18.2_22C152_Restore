@interface CTBundle
+ (BOOL)supportsSecureCoding;
- (CTBundle)init;
- (CTBundle)initWithBundleType:(int64_t)a3;
- (CTBundle)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CTBundle

- (CTBundle)initWithBundleType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CTBundle;
  result = [(CTBundle *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (CTBundle)init
{
  return [(CTBundle *)self initWithBundleType:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTBundle *)self type];
  if ((unint64_t)(v4 - 1) > 5) {
    objc_super v5 = "CTBundleTypeUnknown";
  }
  else {
    objc_super v5 = off_1E5265378[v4 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" Bundle Type=%s", v5);
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t v5 = [(CTBundle *)self type];

  return (id)[v4 initWithBundleType:v5];
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTBundle)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CTBundle initWithBundleType:](self, "initWithBundleType:", [v4 decodeIntegerForKey:@"bundletype"]);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end