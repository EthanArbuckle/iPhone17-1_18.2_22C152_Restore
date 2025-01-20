@interface EDAMBusinessNotebook
+ (id)structFields;
+ (id)structName;
- (NSNumber)privilege;
- (NSNumber)recommended;
- (NSString)notebookDescription;
- (void)setNotebookDescription:(id)a3;
- (void)setPrivilege:(id)a3;
- (void)setRecommended:(id)a3;
@end

@implementation EDAMBusinessNotebook

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1923;
  if (!structFields_structFields_1923)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"notebookDescription"];
    v4 = +[FATField fieldWithIndex:2, 8, 1, @"privilege", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"recommended"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_1923;
    structFields_structFields_1923 = v6;

    v2 = (void *)structFields_structFields_1923;
  }
  return v2;
}

+ (id)structName
{
  return @"BusinessNotebook";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommended, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_notebookDescription, 0);
}

- (void)setRecommended:(id)a3
{
}

- (NSNumber)recommended
{
  return self->_recommended;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setNotebookDescription:(id)a3
{
}

- (NSString)notebookDescription
{
  return self->_notebookDescription;
}

@end