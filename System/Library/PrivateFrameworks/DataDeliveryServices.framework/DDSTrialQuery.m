@interface DDSTrialQuery
+ (BOOL)supportsSecureCoding;
+ (id)defaultQuery;
- (BOOL)isEqual:(id)a3;
- (DDSTrialQuery)initWithCoder:(id)a3;
- (DDSTrialQuery)initWithProjectId:(int)a3 namespaceId:(unsigned int)a4;
- (id)description;
- (int)projectId;
- (unint64_t)hash;
- (unsigned)namespaceId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DDSTrialQuery

+ (id)defaultQuery
{
  v2 = [[DDSTrialQuery alloc] initWithProjectId:104 namespaceId:170];
  return v2;
}

- (DDSTrialQuery)initWithProjectId:(int)a3 namespaceId:(unsigned int)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)DDSTrialQuery;
  v6 = [(DDSTrialQuery *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_projectId = a3;
    v6->_namespaceId = a4;
    v15[0] = @"projectId";
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[DDSTrialQuery projectId](v6, "projectId"));
    v15[1] = @"namespaceId";
    v16[0] = v8;
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DDSTrialQuery namespaceId](v7, "namespaceId"));
    v16[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

    uint64_t v11 = [v10 description];
    description = v7->_description;
    v7->_description = (NSString *)v11;
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unsigned int v7 = -[DDSTrialQuery namespaceId](self, "namespaceId"), v7 == [v6 namespaceId]))
  {
    int v8 = [(DDSTrialQuery *)self projectId];
    BOOL v9 = v8 == [v6 projectId];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(DDSTrialQuery *)self projectId];
  return [(DDSTrialQuery *)self namespaceId] ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[DDSTrialQuery projectId](self, "projectId"), @"projectId");
  objc_msgSend(v4, "encodeInt32:forKey:", -[DDSTrialQuery namespaceId](self, "namespaceId"), @"namespaceId");
}

- (DDSTrialQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"projectId"];
  if (v5 && (uint64_t v6 = v5, v7 = [v4 decodeInt32ForKey:@"namespaceId"], v7))
  {
    self = [(DDSTrialQuery *)self initWithProjectId:v6 namespaceId:v7];
    int v8 = self;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return objc_getProperty(self, a2, 16, 1);
}

- (int)projectId
{
  return self->_projectId;
}

- (unsigned)namespaceId
{
  return self->_namespaceId;
}

- (void).cxx_destruct
{
}

@end