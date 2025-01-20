@interface SCNProgramSemanticInfo
+ (BOOL)supportsSecureCoding;
+ (id)infoWithSemantic:(id)a3 options:(id)a4;
- (NSDictionary)options;
- (NSString)semantic;
- (SCNProgramSemanticInfo)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSemantic:(id)a3;
@end

@implementation SCNProgramSemanticInfo

+ (id)infoWithSemantic:(id)a3 options:(id)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setSemantic:a3];
  [v6 setOptions:a4];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[SCNProgramSemanticInfo semantic](self, "semantic"), @"semantic");
  v5 = [(SCNProgramSemanticInfo *)self options];

  [a3 encodeObject:v5 forKey:@"options"];
}

- (SCNProgramSemanticInfo)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNProgramSemanticInfo;
  v4 = [(SCNProgramSemanticInfo *)&v6 init];
  if (v4)
  {
    -[SCNProgramSemanticInfo setSemantic:](v4, "setSemantic:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"semantic"]);
    -[SCNProgramSemanticInfo setOptions:](v4, "setOptions:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"options"]);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNProgramSemanticInfo;
  [(SCNProgramSemanticInfo *)&v3 dealloc];
}

- (NSString)semantic
{
  return self->_semantic;
}

- (void)setSemantic:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

@end