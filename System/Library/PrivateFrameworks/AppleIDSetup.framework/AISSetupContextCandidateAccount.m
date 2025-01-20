@interface AISSetupContextCandidateAccount
+ (id)_defaultShortNameFormatter;
+ (id)_stringFromPersonNameComponents:(id)a3 personNameComponentsFormatter:(id)a4;
- (AISSetupContextCandidateAccount)initWithAltDSID:(id)a3 username:(id)a4 nameComponents:(id)a5;
- (NSPersonNameComponents)nameComponents;
- (NSString)altDSID;
- (NSString)formattedShortName;
- (NSString)username;
- (void)setAltDSID:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation AISSetupContextCandidateAccount

- (AISSetupContextCandidateAccount)initWithAltDSID:(id)a3 username:(id)a4 nameComponents:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AISSetupContextCandidateAccount;
  v12 = [(AISSetupContextCandidateAccount *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_altDSID, a3);
    objc_storeStrong((id *)&v13->_username, a4);
    objc_storeStrong((id *)&v13->_nameComponents, a5);
  }

  return v13;
}

- (NSString)formattedShortName
{
  v3 = objc_opt_class();
  v4 = [(AISSetupContextCandidateAccount *)self nameComponents];
  v5 = [(id)objc_opt_class() _defaultShortNameFormatter];
  v6 = [v3 _stringFromPersonNameComponents:v4 personNameComponentsFormatter:v5];

  return (NSString *)v6;
}

+ (id)_defaultShortNameFormatter
{
  if (_defaultShortNameFormatter_token != -1) {
    dispatch_once(&_defaultShortNameFormatter_token, &__block_literal_global);
  }
  v2 = (void *)_defaultShortNameFormatter_formatter;
  return v2;
}

uint64_t __61__AISSetupContextCandidateAccount__defaultShortNameFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A78]);
  v1 = (void *)_defaultShortNameFormatter_formatter;
  _defaultShortNameFormatter_formatter = (uint64_t)v0;

  v2 = (void *)_defaultShortNameFormatter_formatter;
  return [v2 setStyle:1];
}

+ (id)_stringFromPersonNameComponents:(id)a3 personNameComponentsFormatter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = [v6 stringFromPersonNameComponents:v5];
    if ([v8 length]) {
      goto LABEL_5;
    }
  }
  v8 = 0;
LABEL_5:

  return v8;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end