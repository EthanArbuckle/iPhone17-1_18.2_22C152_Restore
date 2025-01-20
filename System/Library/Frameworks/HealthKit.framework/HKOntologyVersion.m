@interface HKOntologyVersion
+ (BOOL)supportsSecureCoding;
+ (id)_stableStringRepresentationOfEntries:(uint64_t)a1;
- (BOOL)isEmptyVersion;
- (BOOL)isEqual:(id)a3;
- (HKOntologyVersion)init;
- (HKOntologyVersion)initWithCoder:(id)a3;
- (HKOntologyVersion)initWithShardEntries:(id)a3;
- (HKOntologyVersion)initWithString:(id)a3;
- (NSString)string;
- (id)description;
- (id)initEmptyVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKOntologyVersion

- (HKOntologyVersion)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKOntologyVersion)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKOntologyVersion;
  v5 = [(HKOntologyVersion *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;
  }
  return v5;
}

- (id)initEmptyVersion
{
  return [(HKOntologyVersion *)self initWithString:&stru_1EEC60288];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_string];
}

- (BOOL)isEmptyVersion
{
  return [(NSString *)self->_string isEqualToString:&stru_1EEC60288];
}

- (HKOntologyVersion)initWithShardEntries:(id)a3
{
  id v4 = +[HKOntologyVersion _stableStringRepresentationOfEntries:]((uint64_t)HKOntologyVersion, a3);
  v5 = [(HKOntologyVersion *)self initWithString:v4];

  return v5;
}

+ (id)_stableStringRepresentationOfEntries:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_msgSend(v2, "hk_mapToSet:", &__block_literal_global_18);

  id v4 = [v3 allObjects];
  v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  uint64_t v6 = [v5 componentsJoinedByString:@"|"];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_string hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKOntologyVersion *)a3;
  if (v4 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_8;
  }
  string = self->_string;
  uint64_t v6 = v4->_string;
  if (string == v6)
  {
LABEL_6:
    char v7 = 1;
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_7;
  }
  char v7 = -[NSString isEqualToString:](string, "isEqualToString:");
LABEL_8:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKOntologyVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];

  uint64_t v6 = [(HKOntologyVersion *)self initWithString:v5];
  return v6;
}

id __58__HKOntologyVersion__stableStringRepresentationOfEntries___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 identifier];
  uint64_t v6 = [v3 currentVersion];

  char v7 = (void *)[v4 initWithFormat:@"%@,%lld", v5, v6];

  return v7;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end