@interface EDAMManageNoteSharesResult
+ (id)structFields;
+ (id)structName;
- (NSArray)errors;
- (void)setErrors:(id)a3;
@end

@implementation EDAMManageNoteSharesResult

+ (id)structFields
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1966;
  if (!structFields_structFields_1966)
  {
    v3 = +[FATField fieldWithIndex:0 type:12 optional:1 name:0 structClass:objc_opt_class()];
    v4 = +[FATField fieldWithIndex:1 type:15 optional:1 name:@"errors" valueField:v3];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    v6 = (void *)structFields_structFields_1966;
    structFields_structFields_1966 = v5;

    v2 = (void *)structFields_structFields_1966;
  }
  return v2;
}

+ (id)structName
{
  return @"ManageNoteSharesResult";
}

- (void).cxx_destruct
{
}

- (void)setErrors:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

@end