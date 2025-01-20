@interface EDAMUpdateNoteIfUsnMatchesResult
+ (id)structFields;
+ (id)structName;
- (EDAMNote)note;
- (NSNumber)updated;
- (void)setNote:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation EDAMUpdateNoteIfUsnMatchesResult

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1531;
  if (!structFields_structFields_1531)
  {
    v3 = +[FATField fieldWithIndex:1 type:12 optional:1 name:@"note" structClass:objc_opt_class()];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"updated"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_1531;
    structFields_structFields_1531 = v5;

    v2 = (void *)structFields_structFields_1531;
  }
  return v2;
}

+ (id)structName
{
  return @"UpdateNoteIfUsnMatchesResult";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

- (void)setUpdated:(id)a3
{
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setNote:(id)a3
{
}

- (EDAMNote)note
{
  return self->_note;
}

@end