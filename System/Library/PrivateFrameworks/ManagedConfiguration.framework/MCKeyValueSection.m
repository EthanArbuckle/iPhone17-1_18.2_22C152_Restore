@interface MCKeyValueSection
+ (BOOL)supportsSecureCoding;
+ (id)sectionWithKeyValues:(id)a3;
+ (id)sectionWithLocalizedArray:(id)a3 title:(id)a4 footer:(id)a5;
- (MCKeyValueSection)initWithCoder:(id)a3;
- (MCKeyValueSection)initWithSectionTitle:(id)a3 footer:(id)a4 keyValues:(id)a5;
- (NSArray)sectionKeyValues;
- (NSString)sectionFooter;
- (NSString)sectionTitle;
- (void)encodeWithCoder:(id)a3;
- (void)setSectionFooter:(id)a3;
- (void)setSectionKeyValues:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation MCKeyValueSection

+ (id)sectionWithKeyValues:(id)a3
{
  id v3 = a3;
  v4 = [[MCKeyValueSection alloc] initWithSectionTitle:0 footer:0 keyValues:v3];

  return v4;
}

+ (id)sectionWithLocalizedArray:(id)a3 title:(id)a4 footer:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v17 = [MCKeyValue alloc];
        v18 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", 0, v16, (void)v21);
        [v10 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  v19 = [[MCKeyValueSection alloc] initWithSectionTitle:v8 footer:v9 keyValues:v10];
  return v19;
}

- (MCKeyValueSection)initWithSectionTitle:(id)a3 footer:(id)a4 keyValues:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCKeyValueSection;
  uint64_t v12 = [(MCKeyValueSection *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionTitle, a3);
    objc_storeStrong((id *)&v13->_sectionFooter, a4);
    objc_storeStrong((id *)&v13->_sectionKeyValues, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MCKeyValueSection *)self sectionTitle];
  [v4 encodeObject:v5 forKey:@"sectionTitle"];

  v6 = [(MCKeyValueSection *)self sectionFooter];
  [v4 encodeObject:v6 forKey:@"sectionFooter"];

  id v7 = [(MCKeyValueSection *)self sectionKeyValues];
  [v4 encodeObject:v7 forKey:@"sectionKeyValues"];
}

- (MCKeyValueSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MCKeyValueSection;
  v5 = [(MCKeyValueSection *)&v18 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sectionTitle"];
    sectionTitle = v5->_sectionTitle;
    v5->_sectionTitle = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sectionFooter"];
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"sectionKeyValues"];
    sectionKeyValues = v5->_sectionKeyValues;
    v5->_sectionKeyValues = (NSArray *)v15;
  }
  return v5;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
}

- (NSArray)sectionKeyValues
{
  return self->_sectionKeyValues;
}

- (void)setSectionKeyValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionKeyValues, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end