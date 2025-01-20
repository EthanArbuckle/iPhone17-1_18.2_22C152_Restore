@interface EDAMNotesMetadataResultSpec
+ (id)structFields;
+ (id)structName;
- (NSNumber)includeAttributes;
- (NSNumber)includeContentLength;
- (NSNumber)includeCreated;
- (NSNumber)includeDeleted;
- (NSNumber)includeLargestResourceMime;
- (NSNumber)includeLargestResourceSize;
- (NSNumber)includeNotebookGuid;
- (NSNumber)includeTagGuids;
- (NSNumber)includeTitle;
- (NSNumber)includeUpdateSequenceNum;
- (NSNumber)includeUpdated;
- (void)setIncludeAttributes:(id)a3;
- (void)setIncludeContentLength:(id)a3;
- (void)setIncludeCreated:(id)a3;
- (void)setIncludeDeleted:(id)a3;
- (void)setIncludeLargestResourceMime:(id)a3;
- (void)setIncludeLargestResourceSize:(id)a3;
- (void)setIncludeNotebookGuid:(id)a3;
- (void)setIncludeTagGuids:(id)a3;
- (void)setIncludeTitle:(id)a3;
- (void)setIncludeUpdateSequenceNum:(id)a3;
- (void)setIncludeUpdated:(id)a3;
@end

@implementation EDAMNotesMetadataResultSpec

+ (id)structFields
{
  v17[11] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_693;
  if (!structFields_structFields_693)
  {
    v16 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"includeTitle"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:5 type:2 optional:1 name:@"includeContentLength"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:6 type:2 optional:1 name:@"includeCreated"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:7 type:2 optional:1 name:@"includeUpdated"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:8 type:2 optional:1 name:@"includeDeleted"];
    v17[4] = v5;
    v6 = +[FATField fieldWithIndex:10 type:2 optional:1 name:@"includeUpdateSequenceNum"];
    v17[5] = v6;
    v7 = +[FATField fieldWithIndex:11 type:2 optional:1 name:@"includeNotebookGuid"];
    v17[6] = v7;
    v8 = +[FATField fieldWithIndex:12 type:2 optional:1 name:@"includeTagGuids"];
    v17[7] = v8;
    v9 = +[FATField fieldWithIndex:14 type:2 optional:1 name:@"includeAttributes"];
    v17[8] = v9;
    v10 = +[FATField fieldWithIndex:20 type:2 optional:1 name:@"includeLargestResourceMime"];
    v17[9] = v10;
    v11 = +[FATField fieldWithIndex:21 type:2 optional:1 name:@"includeLargestResourceSize"];
    v17[10] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:11];
    v13 = (void *)structFields_structFields_693;
    structFields_structFields_693 = v12;

    v2 = (void *)structFields_structFields_693;
  }
  return v2;
}

+ (id)structName
{
  return @"NotesMetadataResultSpec";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includeLargestResourceSize, 0);
  objc_storeStrong((id *)&self->_includeLargestResourceMime, 0);
  objc_storeStrong((id *)&self->_includeAttributes, 0);
  objc_storeStrong((id *)&self->_includeTagGuids, 0);
  objc_storeStrong((id *)&self->_includeNotebookGuid, 0);
  objc_storeStrong((id *)&self->_includeUpdateSequenceNum, 0);
  objc_storeStrong((id *)&self->_includeDeleted, 0);
  objc_storeStrong((id *)&self->_includeUpdated, 0);
  objc_storeStrong((id *)&self->_includeCreated, 0);
  objc_storeStrong((id *)&self->_includeContentLength, 0);
  objc_storeStrong((id *)&self->_includeTitle, 0);
}

- (void)setIncludeLargestResourceSize:(id)a3
{
}

- (NSNumber)includeLargestResourceSize
{
  return self->_includeLargestResourceSize;
}

- (void)setIncludeLargestResourceMime:(id)a3
{
}

- (NSNumber)includeLargestResourceMime
{
  return self->_includeLargestResourceMime;
}

- (void)setIncludeAttributes:(id)a3
{
}

- (NSNumber)includeAttributes
{
  return self->_includeAttributes;
}

- (void)setIncludeTagGuids:(id)a3
{
}

- (NSNumber)includeTagGuids
{
  return self->_includeTagGuids;
}

- (void)setIncludeNotebookGuid:(id)a3
{
}

- (NSNumber)includeNotebookGuid
{
  return self->_includeNotebookGuid;
}

- (void)setIncludeUpdateSequenceNum:(id)a3
{
}

- (NSNumber)includeUpdateSequenceNum
{
  return self->_includeUpdateSequenceNum;
}

- (void)setIncludeDeleted:(id)a3
{
}

- (NSNumber)includeDeleted
{
  return self->_includeDeleted;
}

- (void)setIncludeUpdated:(id)a3
{
}

- (NSNumber)includeUpdated
{
  return self->_includeUpdated;
}

- (void)setIncludeCreated:(id)a3
{
}

- (NSNumber)includeCreated
{
  return self->_includeCreated;
}

- (void)setIncludeContentLength:(id)a3
{
}

- (NSNumber)includeContentLength
{
  return self->_includeContentLength;
}

- (void)setIncludeTitle:(id)a3
{
}

- (NSNumber)includeTitle
{
  return self->_includeTitle;
}

@end