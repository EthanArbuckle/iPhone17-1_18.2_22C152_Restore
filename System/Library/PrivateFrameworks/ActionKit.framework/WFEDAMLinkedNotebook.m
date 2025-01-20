@interface WFEDAMLinkedNotebook
+ (BOOL)supportsSecureCoding;
- (NSString)shareName;
- (WFEDAMLinkedNotebook)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShareName:(id)a3;
@end

@implementation WFEDAMLinkedNotebook

- (void).cxx_destruct
{
}

- (void)setShareName:(id)a3
{
}

- (NSString)shareName
{
  return self->_shareName;
}

- (WFEDAMLinkedNotebook)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFEDAMLinkedNotebook;
  v5 = [(WFEDAMLinkedNotebook *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareName"];
    uint64_t v7 = [v6 copy];
    shareName = v5->_shareName;
    v5->_shareName = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEDAMLinkedNotebook *)self shareName];
  [v4 encodeObject:v5 forKey:@"shareName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end