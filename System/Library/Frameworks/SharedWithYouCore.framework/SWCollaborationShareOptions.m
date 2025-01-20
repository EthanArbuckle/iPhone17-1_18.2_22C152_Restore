@interface SWCollaborationShareOptions
+ (BOOL)supportsSecureCoding;
+ (SWCollaborationShareOptions)allocWithZone:(_NSZone *)a3;
+ (SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(NSArray *)optionsGroups;
+ (SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(NSArray *)optionsGroups summary:(NSString *)summary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToShareOptions:(id)a3;
- (NSArray)optionsGroups;
- (NSString)summary;
- (SWCollaborationShareOptions)initWithCoder:(NSCoder *)coder;
- (SWCollaborationShareOptions)initWithOptionsGroups:(NSArray *)optionsGroups;
- (SWCollaborationShareOptions)initWithOptionsGroups:(NSArray *)optionsGroups summary:(NSString *)summary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOptionsGroups:(NSArray *)optionsGroups;
- (void)setSummary:(NSString *)summary;
@end

@implementation SWCollaborationShareOptions

+ (SWCollaborationShareOptions)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (SWCollaborationShareOptions *)+[SWCollaborationShareOptions allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SWCollaborationShareOptions;
    return (SWCollaborationShareOptions *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (SWCollaborationShareOptions)initWithOptionsGroups:(NSArray *)optionsGroups summary:(NSString *)summary
{
  objc_super v6 = optionsGroups;
  v7 = summary;
  v12.receiver = self;
  v12.super_class = (Class)SWCollaborationShareOptions;
  v8 = [(SWCollaborationShareOptions *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [(NSArray *)v6 copy];
    v10 = v8->_optionsGroups;
    v8->_optionsGroups = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_summary, summary);
  }

  return v8;
}

- (SWCollaborationShareOptions)initWithOptionsGroups:(NSArray *)optionsGroups
{
  v4 = optionsGroups;
  v5 = SWCoreFrameworkBundle();
  objc_super v6 = [v5 localizedStringForKey:@"Share Options" value:&stru_1ED99C438 table:@"SharedWithYouCore"];
  v7 = [(SWCollaborationShareOptions *)self initWithOptionsGroups:v4 summary:v6];

  return v7;
}

+ (SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(NSArray *)optionsGroups summary:(NSString *)summary
{
  objc_super v6 = summary;
  v7 = optionsGroups;
  v8 = (void *)[objc_alloc((Class)a1) initWithOptionsGroups:v7 summary:v6];

  return (SWCollaborationShareOptions *)v8;
}

+ (SWCollaborationShareOptions)shareOptionsWithOptionsGroups:(NSArray *)optionsGroups
{
  v4 = optionsGroups;
  v5 = (void *)[objc_alloc((Class)a1) initWithOptionsGroups:v4];

  return (SWCollaborationShareOptions *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  v11.receiver = v4;
  v11.super_class = (Class)SWCollaborationShareOptions;
  v5 = [(SWCollaborationShareOptions *)&v11 init];
  if (v5)
  {
    objc_super v6 = [(SWCollaborationShareOptions *)v4 summary];
    v7 = (void *)[v6 copyWithZone:a3];
    [(SWCollaborationShareOptions *)v5 setSummary:v7];

    v8 = [(SWCollaborationShareOptions *)v4 optionsGroups];
    uint64_t v9 = (void *)[v8 copyWithZone:a3];
    [(SWCollaborationShareOptions *)v5 setOptionsGroups:v9];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SWCollaborationShareOptions *)self isEqualToShareOptions:v4];

  return v5;
}

- (BOOL)isEqualToShareOptions:(id)a3
{
  v7 = (SWCollaborationShareOptions *)a3;
  if (v7 == self)
  {
    char v10 = 1;
    goto LABEL_20;
  }
  v8 = [(SWCollaborationShareOptions *)self summary];
  if (v8
    || ([(SWCollaborationShareOptions *)v7 summary], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(SWCollaborationShareOptions *)self summary];
    id v4 = [(SWCollaborationShareOptions *)v7 summary];
    if (![v3 isEqual:v4])
    {
      char v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    int v9 = 1;
  }
  else
  {
    v15 = 0;
    int v9 = 0;
  }
  objc_super v11 = [(SWCollaborationShareOptions *)self optionsGroups];
  if (v11
    || ([(SWCollaborationShareOptions *)v7 optionsGroups],
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v12 = [(SWCollaborationShareOptions *)self optionsGroups];
    v13 = [(SWCollaborationShareOptions *)v7 optionsGroups];
    char v10 = [v12 isEqual:v13];

    if (v11) {
      goto LABEL_15;
    }
  }
  else
  {
    char v10 = 1;
  }

LABEL_15:
  if (v9) {
    goto LABEL_16;
  }
LABEL_17:
  if (!v8) {

  }
LABEL_20:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWCollaborationShareOptions)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v17.receiver = self;
  v17.super_class = (Class)SWCollaborationShareOptions;
  BOOL v5 = [(SWCollaborationShareOptions *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"summary"];
    summary = v5->_summary;
    v5->_summary = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [(NSCoder *)v4 decodeObjectOfClasses:v13 forKey:@"optionsGroups"];
    optionsGroups = v5->_optionsGroups;
    v5->_optionsGroups = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SWCollaborationShareOptions *)self summary];
  [v4 encodeObject:v5 forKey:@"summary"];

  id v6 = [(SWCollaborationShareOptions *)self optionsGroups];
  [v4 encodeObject:v6 forKey:@"optionsGroups"];
}

- (NSArray)optionsGroups
{
  return self->_optionsGroups;
}

- (void)setOptionsGroups:(NSArray *)optionsGroups
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(NSString *)summary
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);

  objc_storeStrong((id *)&self->_optionsGroups, 0);
}

@end