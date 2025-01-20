@interface EDAMInvalidContactsException
+ (id)structFields;
+ (id)structName;
- (NSArray)contacts;
- (NSArray)reasons;
- (NSString)parameter;
- (void)setContacts:(id)a3;
- (void)setParameter:(id)a3;
- (void)setReasons:(id)a3;
@end

@implementation EDAMInvalidContactsException

+ (id)structFields
{
  v11[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_77_35818;
  if (!structFields_structFields_77_35818)
  {
    v3 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v4 = +[FATField fieldWithIndex:1 type:15 optional:0 name:@"contacts" valueField:v3];
    v5 = +[FATField fieldWithIndex:2, 11, 1, @"parameter", v4 type optional name];
    v11[1] = v5;
    v6 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v7 = +[FATField fieldWithIndex:3 type:15 optional:1 name:@"reasons" valueField:v6];
    v11[2] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
    v9 = (void *)structFields_structFields_77_35818;
    structFields_structFields_77_35818 = v8;

    v2 = (void *)structFields_structFields_77_35818;
  }
  return v2;
}

+ (id)structName
{
  return @"EDAMInvalidContactsException";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setReasons:(id)a3
{
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setParameter:(id)a3
{
}

- (NSString)parameter
{
  return self->_parameter;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

@end