@interface EDAMNoteShareRelationshipRestrictions
+ (id)structFields;
+ (id)structName;
- (NSNumber)noSetFullAccess;
- (NSNumber)noSetModifyNote;
- (NSNumber)noSetReadNote;
- (void)setNoSetFullAccess:(id)a3;
- (void)setNoSetModifyNote:(id)a3;
- (void)setNoSetReadNote:(id)a3;
@end

@implementation EDAMNoteShareRelationshipRestrictions

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1842;
  if (!structFields_structFields_1842)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"noSetReadNote"];
    v4 = +[FATField fieldWithIndex:2, 2, 1, @"noSetModifyNote", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"noSetFullAccess"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_1842;
    structFields_structFields_1842 = v6;

    v2 = (void *)structFields_structFields_1842;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteShareRelationshipRestrictions";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSetFullAccess, 0);
  objc_storeStrong((id *)&self->_noSetModifyNote, 0);
  objc_storeStrong((id *)&self->_noSetReadNote, 0);
}

- (void)setNoSetFullAccess:(id)a3
{
}

- (NSNumber)noSetFullAccess
{
  return self->_noSetFullAccess;
}

- (void)setNoSetModifyNote:(id)a3
{
}

- (NSNumber)noSetModifyNote
{
  return self->_noSetModifyNote;
}

- (void)setNoSetReadNote:(id)a3
{
}

- (NSNumber)noSetReadNote
{
  return self->_noSetReadNote;
}

@end