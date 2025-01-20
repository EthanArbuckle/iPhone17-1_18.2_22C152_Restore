@interface EDAMNoteLimits
+ (id)structFields;
+ (id)structName;
- (NSNumber)noteResourceCountMax;
- (NSNumber)noteSizeMax;
- (NSNumber)resourceSizeMax;
- (NSNumber)uploadLimit;
- (NSNumber)uploaded;
- (void)setNoteResourceCountMax:(id)a3;
- (void)setNoteSizeMax:(id)a3;
- (void)setResourceSizeMax:(id)a3;
- (void)setUploadLimit:(id)a3;
- (void)setUploaded:(id)a3;
@end

@implementation EDAMNoteLimits

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1767;
  if (!structFields_structFields_1767)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"noteResourceCountMax"];
    v4 = +[FATField fieldWithIndex:2, 10, 1, @"uploadLimit", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"resourceSizeMax"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"noteSizeMax"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"uploaded"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_1767;
    structFields_structFields_1767 = v8;

    v2 = (void *)structFields_structFields_1767;
  }
  return v2;
}

+ (id)structName
{
  return @"NoteLimits";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploaded, 0);
  objc_storeStrong((id *)&self->_noteSizeMax, 0);
  objc_storeStrong((id *)&self->_resourceSizeMax, 0);
  objc_storeStrong((id *)&self->_uploadLimit, 0);
  objc_storeStrong((id *)&self->_noteResourceCountMax, 0);
}

- (void)setUploaded:(id)a3
{
}

- (NSNumber)uploaded
{
  return self->_uploaded;
}

- (void)setNoteSizeMax:(id)a3
{
}

- (NSNumber)noteSizeMax
{
  return self->_noteSizeMax;
}

- (void)setResourceSizeMax:(id)a3
{
}

- (NSNumber)resourceSizeMax
{
  return self->_resourceSizeMax;
}

- (void)setUploadLimit:(id)a3
{
}

- (NSNumber)uploadLimit
{
  return self->_uploadLimit;
}

- (void)setNoteResourceCountMax:(id)a3
{
}

- (NSNumber)noteResourceCountMax
{
  return self->_noteResourceCountMax;
}

@end