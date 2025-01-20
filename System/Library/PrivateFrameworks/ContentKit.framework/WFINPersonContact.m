@interface WFINPersonContact
+ (BOOL)supportsSecureCoding;
+ (id)contactWithPerson:(id)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (INPerson)person;
- (WFINPersonContact)initWithCoder:(id)a3;
- (WFINPersonContact)initWithINPerson:(id)a3;
- (id)wfName;
- (id)wfSerializedRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setPerson:(id)a3;
@end

@implementation WFINPersonContact

- (void).cxx_destruct
{
}

- (void)setPerson:(id)a3
{
}

- (INPerson)person
{
  return self->_person;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(WFINPersonContact *)self person];
  v5 = NSStringFromSelector(sel_person);
  [v4 encodeObject:v6 forKey:v5];
}

- (WFINPersonContact)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_person);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v8 = [(WFINPersonContact *)self initWithINPerson:v7];
  return v8;
}

- (id)wfSerializedRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F0FBE8]);
  id v4 = [(WFINPersonContact *)self person];
  uint64_t v5 = [v3 encodeObject:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (v6)
  {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WFIsINPerson"];
    v11 = @"link.contentkit.contact";
    v12 = v6;
    v7 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    v8 = getWFWFContactLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(WFINPersonContact *)self person];
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFINPersonContact wfSerializedRepresentation]";
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_ERROR, "%s Failed to JSON encode INPerson: %@", buf, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)wfName
{
  v2 = [(WFINPersonContact *)self person];
  id v3 = [v2 displayName];

  return v3;
}

- (WFINPersonContact)initWithINPerson:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFINPersonContact.m", 41, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFINPersonContact;
  v7 = [(WFINPersonContact *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_person, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F0FBE0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [v5 objectForKeyedSubscript:@"link.contentkit.contact"];

  v8 = [v6 decodeObjectOfClass:objc_opt_class() from:v7];
  if (v8)
  {
    v9 = [a1 contactWithPerson:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)contactWithPerson:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithINPerson:v4];

  return v5;
}

@end