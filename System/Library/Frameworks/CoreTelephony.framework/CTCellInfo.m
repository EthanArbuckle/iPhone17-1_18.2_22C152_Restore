@interface CTCellInfo
+ (BOOL)supportsSecureCoding;
- (CTCellInfo)initWithCoder:(id)a3;
- (NSArray)legacyInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLegacyInfo:(id)a3;
@end

@implementation CTCellInfo

- (void).cxx_destruct
{
}

- (void)setLegacyInfo:(id)a3
{
}

- (CTCellInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTCellInfo;
  v5 = [(CTCellInfo *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"info"];
    legacyInfo = v5->_legacyInfo;
    v5->_legacyInfo = (NSArray *)v13;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTCellInfo *)self legacyInfo];
  [v3 appendFormat:@", info=%@", v4];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTCellInfo *)self legacyInfo];
  [v4 encodeObject:v5 forKey:@"info"];
}

- (NSArray)legacyInfo
{
  return self->_legacyInfo;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(CTCellInfo *)self legacyInfo];
  v6 = (void *)[v5 copy];
  [v4 setLegacyInfo:v6];

  return v4;
}

@end