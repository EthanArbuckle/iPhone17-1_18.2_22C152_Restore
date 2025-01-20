@interface EDAMNoteFilter
+ (id)structFields;
+ (id)structName;
- (NSArray)tagGuids;
- (NSNumber)ascending;
- (NSNumber)inactive;
- (NSNumber)includeAllReadableNotebooks;
- (NSNumber)order;
- (NSString)context;
- (NSString)emphasized;
- (NSString)notebookGuid;
- (NSString)timeZone;
- (NSString)words;
- (void)setAscending:(id)a3;
- (void)setContext:(id)a3;
- (void)setEmphasized:(id)a3;
- (void)setInactive:(id)a3;
- (void)setIncludeAllReadableNotebooks:(id)a3;
- (void)setNotebookGuid:(id)a3;
- (void)setOrder:(id)a3;
- (void)setTagGuids:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setWords:(id)a3;
@end

@implementation EDAMNoteFilter

+ (id)structFields
{
  v17[10] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_470;
  if (!structFields_structFields_470)
  {
    v16 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"order"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"ascending"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"words"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"notebookGuid"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:0 type:11 optional:1 name:0];
    v6 = +[FATField fieldWithIndex:5 type:15 optional:1 name:@"tagGuids" valueField:v5];
    v17[4] = v6;
    v7 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"timeZone"];
    v17[5] = v7;
    v8 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"inactive"];
    v17[6] = v8;
    v9 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"emphasized"];
    v17[7] = v9;
    v10 = +[FATField fieldWithIndex:9 type:2 optional:1 name:@"includeAllReadableNotebooks"];
    v17[8] = v10;
    v11 = +[FATField fieldWithIndex:10 type:11 optional:1 name:@"context"];
    v17[9] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:10];
    v13 = (void *)structFields_structFields_470;
    structFields_structFields_470 = v12;

    v2 = (void *)structFields_structFields_470;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteFilter";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_includeAllReadableNotebooks, 0);
  objc_storeStrong((id *)&self->_emphasized, 0);
  objc_storeStrong((id *)&self->_inactive, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_tagGuids, 0);
  objc_storeStrong((id *)&self->_notebookGuid, 0);
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_ascending, 0);
  objc_storeStrong((id *)&self->_order, 0);
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setIncludeAllReadableNotebooks:(id)a3
{
}

- (NSNumber)includeAllReadableNotebooks
{
  return self->_includeAllReadableNotebooks;
}

- (void)setEmphasized:(id)a3
{
}

- (NSString)emphasized
{
  return self->_emphasized;
}

- (void)setInactive:(id)a3
{
}

- (NSNumber)inactive
{
  return self->_inactive;
}

- (void)setTimeZone:(id)a3
{
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTagGuids:(id)a3
{
}

- (NSArray)tagGuids
{
  return self->_tagGuids;
}

- (void)setNotebookGuid:(id)a3
{
}

- (NSString)notebookGuid
{
  return self->_notebookGuid;
}

- (void)setWords:(id)a3
{
}

- (NSString)words
{
  return self->_words;
}

- (void)setAscending:(id)a3
{
}

- (NSNumber)ascending
{
  return self->_ascending;
}

- (void)setOrder:(id)a3
{
}

- (NSNumber)order
{
  return self->_order;
}

@end