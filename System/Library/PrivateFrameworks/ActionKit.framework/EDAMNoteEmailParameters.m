@interface EDAMNoteEmailParameters
+ (id)structFields;
+ (id)structName;
- (EDAMNote)note;
- (NSArray)ccAddresses;
- (NSArray)toAddresses;
- (NSString)guid;
- (NSString)message;
- (NSString)subject;
- (void)setCcAddresses:(id)a3;
- (void)setGuid:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNote:(id)a3;
- (void)setSubject:(id)a3;
- (void)setToAddresses:(id)a3;
@end

@implementation EDAMNoteEmailParameters

+ (id)structFields
{
  v14[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_963;
  if (!structFields_structFields_963)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"guid"];
    v14[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"note" structClass:objc_opt_class()];
    v14[1] = v4;
    v5 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:3 type:15 optional:1 name:@"toAddresses" valueField:v5];
    v14[2] = v6;
    v7 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:4 type:15 optional:1 name:@"ccAddresses" valueField:v7];
    v14[3] = v8;
    v9 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"subject"];
    v14[4] = v9;
    v10 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"message"];
    v14[5] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:6];
    v12 = (void *)structFields_structFields_963;
    structFields_structFields_963 = v11;

    v2 = (void *)structFields_structFields_963;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteEmailParameters";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_ccAddresses, 0);
  objc_storeStrong((id *)&self->_toAddresses, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setCcAddresses:(id)a3
{
}

- (NSArray)ccAddresses
{
  return self->_ccAddresses;
}

- (void)setToAddresses:(id)a3
{
}

- (NSArray)toAddresses
{
  return self->_toAddresses;
}

- (void)setNote:(id)a3
{
}

- (EDAMNote)note
{
  return self->_note;
}

- (void)setGuid:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

@end