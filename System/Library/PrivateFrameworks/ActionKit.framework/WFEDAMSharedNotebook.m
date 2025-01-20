@interface WFEDAMSharedNotebook
+ (BOOL)supportsSecureCoding;
- (NSString)notebookGuid;
- (WFEDAMSharedNotebook)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setNotebookGuid:(id)a3;
@end

@implementation WFEDAMSharedNotebook

- (void).cxx_destruct
{
}

- (void)setNotebookGuid:(id)a3
{
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (WFEDAMSharedNotebook)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFEDAMSharedNotebook;
  v5 = [(WFEDAMSharedNotebook *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notebookGuid"];
    uint64_t v7 = [v6 copy];
    notebookGuid = v5->_notebookGuid;
    v5->_notebookGuid = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEDAMSharedNotebook *)self notebookGuid];
  [v4 encodeObject:v5 forKey:@"notebookGuid"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end