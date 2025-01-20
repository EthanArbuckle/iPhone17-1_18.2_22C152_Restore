@interface WFEDAMNotebook
+ (BOOL)supportsSecureCoding;
- (NSString)guid;
- (NSString)name;
- (WFEDAMNotebook)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setGuid:(id)a3;
- (void)setName:(id)a3;
@end

@implementation WFEDAMNotebook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (WFEDAMNotebook)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFEDAMNotebook;
  v5 = [(WFEDAMNotebook *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guid"];
    uint64_t v7 = [v6 copy];
    guid = v5->_guid;
    v5->_guid = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v10 = [v9 copy];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFEDAMNotebook *)self guid];
  [v4 encodeObject:v5 forKey:@"guid"];

  id v6 = [(WFEDAMNotebook *)self name];
  [v4 encodeObject:v6 forKey:@"name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end