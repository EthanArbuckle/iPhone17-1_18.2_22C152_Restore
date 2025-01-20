@interface ATXFakeEntityFeatures
- (ATXFakeEntityFeatures)init;
- (NSMutableArray)identifiersAndDates;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (void)setIdentifiersAndDates:(id)a3;
@end

@implementation ATXFakeEntityFeatures

- (ATXFakeEntityFeatures)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXFakeEntityFeatures;
  v2 = [(ATXFakeEntityFeatures *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    identifiersAndDates = v2->_identifiersAndDates;
    v2->_identifiersAndDates = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFakeEntityFeatures;
  v5 = [(ATXFakeEntityFeatures *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"identifiersAndDates"];
    identifiersAndDates = v5->_identifiersAndDates;
    v5->_identifiersAndDates = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)jsonRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  identifiersAndDates = self->_identifiersAndDates;
  v5 = @"identifiersAndDates";
  v6[0] = identifiersAndDates;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (NSMutableArray)identifiersAndDates
{
  return self->_identifiersAndDates;
}

- (void)setIdentifiersAndDates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end