@interface WFContentItemPrivacyConfiguration
+ (id)configurationWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4;
+ (id)configurationWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5;
- (NSOrderedSet)disclosureWarnings;
- (WFContentItemPrivacyConfiguration)initWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5;
- (WFContentLocation)origin;
- (unint64_t)disclosureLevel;
- (void)setDisclosureLevel:(unint64_t)a3;
@end

@implementation WFContentItemPrivacyConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureWarnings, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

- (NSOrderedSet)disclosureWarnings
{
  return self->_disclosureWarnings;
}

- (void)setDisclosureLevel:(unint64_t)a3
{
  self->_disclosureLevel = a3;
}

- (unint64_t)disclosureLevel
{
  return self->_disclosureLevel;
}

- (WFContentLocation)origin
{
  return self->_origin;
}

- (WFContentItemPrivacyConfiguration)initWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFContentItemPrivacyConfiguration;
  v11 = [(WFContentItemPrivacyConfiguration *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_origin, a3);
    v12->_disclosureLevel = a4;
    uint64_t v13 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v10];
    disclosureWarnings = v12->_disclosureWarnings;
    v12->_disclosureWarnings = (NSOrderedSet *)v13;

    v15 = v12;
  }

  return v12;
}

+ (id)configurationWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4 disclosureWarnings:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithOrigin:v9 disclosureLevel:a4 disclosureWarnings:v8];

  return v10;
}

+ (id)configurationWithOrigin:(id)a3 disclosureLevel:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  id v8 = (void *)[v7 initWithOrigin:v6 disclosureLevel:a4 disclosureWarnings:MEMORY[0x263EFFA68]];

  return v8;
}

@end