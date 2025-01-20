@interface CNMetricsReporterSpiedEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLogged;
- (CNMetricsReporterSpiedEntry)initWithCoder:(id)a3;
- (CNMetricsReporterSpiedEntry)initWithDictionary:(id)a3 event:(id)a4 logged:(BOOL)a5;
- (NSMutableDictionary)dictionary;
- (NSString)event;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNMetricsReporterSpiedEntry

- (CNMetricsReporterSpiedEntry)initWithDictionary:(id)a3 event:(id)a4 logged:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNMetricsReporterSpiedEntry;
  v10 = [(CNMetricsReporterSpiedEntry *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    dictionary = v10->_dictionary;
    v10->_dictionary = (NSMutableDictionary *)v11;

    uint64_t v13 = [v9 copy];
    event = v10->_event;
    v10->_event = (NSString *)v13;

    v10->_logged = a5;
    v15 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"event" object:self->_event];
  id v5 = (id)[v3 appendName:@"logged" BOOLValue:self->_logged];
  id v6 = (id)[v3 appendName:@"dictionary" object:self->_dictionary];
  v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNMetricsReporterSpiedEntry *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || !self->_logged == v4->_logged
      || (event = self->_event, (unint64_t)event | (unint64_t)v4->_event)
      && !-[NSString isEqual:](event, "isEqual:")
      || (dictionary = self->_dictionary, (unint64_t)dictionary | (unint64_t)v4->_dictionary)
      && !-[NSMutableDictionary isEqual:](dictionary, "isEqual:"))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  BOOL logged = self->_logged;
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_event] - logged + 32 * logged;
  return [MEMORY[0x1E4F5A418] objectHash:self->_dictionary] - v4 + 32 * v4 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMetricsReporterSpiedEntry)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  BOOL v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionary"];

  id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
  uint64_t v10 = [v5 decodeBoolForKey:@"logged"];

  uint64_t v11 = [(CNMetricsReporterSpiedEntry *)self initWithDictionary:v8 event:v9 logged:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  dictionary = self->_dictionary;
  id v5 = a3;
  [v5 encodeObject:dictionary forKey:@"dictionary"];
  [v5 encodeObject:self->_event forKey:@"event"];
  [v5 encodeBool:self->_logged forKey:@"logged"];
}

- (NSMutableDictionary)dictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isLogged
{
  return self->_logged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end