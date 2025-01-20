@interface EDAMNoteRestrictions
+ (id)structFields;
+ (id)structName;
- (NSNumber)noEmail;
- (NSNumber)noShare;
- (NSNumber)noSharePublicly;
- (NSNumber)noUpdateContent;
- (NSNumber)noUpdateTitle;
- (void)setNoEmail:(id)a3;
- (void)setNoShare:(id)a3;
- (void)setNoSharePublicly:(id)a3;
- (void)setNoUpdateContent:(id)a3;
- (void)setNoUpdateTitle:(id)a3;
@end

@implementation EDAMNoteRestrictions

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1718;
  if (!structFields_structFields_1718)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"noUpdateTitle"];
    v4 = +[FATField fieldWithIndex:2, 2, 1, @"noUpdateContent", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"noEmail"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:2 optional:1 name:@"noShare"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"noSharePublicly"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_1718;
    structFields_structFields_1718 = v8;

    v2 = (void *)structFields_structFields_1718;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteRestrictions";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noSharePublicly, 0);
  objc_storeStrong((id *)&self->_noShare, 0);
  objc_storeStrong((id *)&self->_noEmail, 0);
  objc_storeStrong((id *)&self->_noUpdateContent, 0);
  objc_storeStrong((id *)&self->_noUpdateTitle, 0);
}

- (void)setNoSharePublicly:(id)a3
{
}

- (NSNumber)noSharePublicly
{
  return self->_noSharePublicly;
}

- (void)setNoShare:(id)a3
{
}

- (NSNumber)noShare
{
  return self->_noShare;
}

- (void)setNoEmail:(id)a3
{
}

- (NSNumber)noEmail
{
  return self->_noEmail;
}

- (void)setNoUpdateContent:(id)a3
{
}

- (NSNumber)noUpdateContent
{
  return self->_noUpdateContent;
}

- (void)setNoUpdateTitle:(id)a3
{
}

- (NSNumber)noUpdateTitle
{
  return self->_noUpdateTitle;
}

@end