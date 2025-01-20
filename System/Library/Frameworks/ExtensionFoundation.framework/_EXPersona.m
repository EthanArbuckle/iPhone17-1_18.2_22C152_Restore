@interface _EXPersona
+ (BOOL)supportsSecureCoding;
+ (_EXPersona)personaWithPersonaUniqueString:(id)a3;
+ (id)currentPersona;
+ (id)defaultPersona;
- (NSString)personaUniqueString;
- (_EXPersona)initWithCoder:(id)a3;
- (_EXPersona)initWithPersonaUniqueString:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _EXPersona

- (_EXPersona)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXPersona;
  v5 = [(_EXPersona *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

+ (_EXPersona)personaWithPersonaUniqueString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    v5 = [[_EXPersona alloc] initWithPersonaUniqueString:v3];

    return v5;
  }
  else
  {
    v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      +[_EXPersona personaWithPersonaUniqueString:](v7);
    }

    __break(1u);
  }
  return result;
}

- (_EXPersona)initWithPersonaUniqueString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXPersona;
  uint64_t v6 = [(_EXPersona *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personaUniqueString, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)currentPersona
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v3 = [v2 currentPersona];
  id v4 = [v3 userPersonaUniqueString];

  id v5 = +[_EXPersona personaWithPersonaUniqueString:v4];

  return v5;
}

+ (id)defaultPersona
{
  return +[_EXPersona personaWithPersonaUniqueString:&stru_1EE2CDC90];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p %@>", objc_opt_class(), self, self->_personaUniqueString];
}

+ (void)personaWithPersonaUniqueString:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = "personaUniqueString != nil";
  __int16 v3 = 2080;
  int v1 = 136315650;
  id v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSupport/EXPersona.m";
  __int16 v5 = 1024;
  int v6 = 63;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Persona unique string should not be nil", (uint8_t *)&v1, 0x1Cu);
}

@end