@interface EDAMAccountLimits
+ (id)structFields;
+ (id)structName;
- (NSNumber)noteResourceCountMax;
- (NSNumber)noteSizeMax;
- (NSNumber)noteTagCountMax;
- (NSNumber)resourceSizeMax;
- (NSNumber)uploadLimit;
- (NSNumber)userAdvertisedDeviceLimit;
- (NSNumber)userDeviceLimit;
- (NSNumber)userLinkedNotebookMax;
- (NSNumber)userMailLimitDaily;
- (NSNumber)userNoteCountMax;
- (NSNumber)userNotebookCountMax;
- (NSNumber)userSavedSearchesMax;
- (NSNumber)userTagCountMax;
- (void)setNoteResourceCountMax:(id)a3;
- (void)setNoteSizeMax:(id)a3;
- (void)setNoteTagCountMax:(id)a3;
- (void)setResourceSizeMax:(id)a3;
- (void)setUploadLimit:(id)a3;
- (void)setUserAdvertisedDeviceLimit:(id)a3;
- (void)setUserDeviceLimit:(id)a3;
- (void)setUserLinkedNotebookMax:(id)a3;
- (void)setUserMailLimitDaily:(id)a3;
- (void)setUserNoteCountMax:(id)a3;
- (void)setUserNotebookCountMax:(id)a3;
- (void)setUserSavedSearchesMax:(id)a3;
- (void)setUserTagCountMax:(id)a3;
@end

@implementation EDAMAccountLimits

+ (id)structFields
{
  v19[13] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_652;
  if (!structFields_structFields_652)
  {
    v18 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"userMailLimitDaily"];
    v19[0] = v18;
    v17 = +[FATField fieldWithIndex:2 type:10 optional:1 name:@"noteSizeMax"];
    v19[1] = v17;
    v16 = +[FATField fieldWithIndex:3 type:10 optional:1 name:@"resourceSizeMax"];
    v19[2] = v16;
    v3 = +[FATField fieldWithIndex:4 type:8 optional:1 name:@"userLinkedNotebookMax"];
    v19[3] = v3;
    v4 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"uploadLimit"];
    v19[4] = v4;
    v5 = +[FATField fieldWithIndex:6 type:8 optional:1 name:@"userNoteCountMax"];
    v19[5] = v5;
    v6 = +[FATField fieldWithIndex:7 type:8 optional:1 name:@"userNotebookCountMax"];
    v19[6] = v6;
    v7 = +[FATField fieldWithIndex:8 type:8 optional:1 name:@"userTagCountMax"];
    v19[7] = v7;
    v8 = +[FATField fieldWithIndex:9 type:8 optional:1 name:@"noteTagCountMax"];
    v19[8] = v8;
    v9 = +[FATField fieldWithIndex:10 type:8 optional:1 name:@"userSavedSearchesMax"];
    v19[9] = v9;
    v10 = +[FATField fieldWithIndex:11 type:8 optional:1 name:@"noteResourceCountMax"];
    v19[10] = v10;
    v11 = +[FATField fieldWithIndex:12 type:8 optional:1 name:@"userDeviceLimit"];
    v19[11] = v11;
    v12 = +[FATField fieldWithIndex:13 type:8 optional:1 name:@"userAdvertisedDeviceLimit"];
    v19[12] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:13];
    v14 = (void *)structFields_structFields_652;
    structFields_structFields_652 = v13;

    v2 = (void *)structFields_structFields_652;
  }
  return v2;
}

+ (id)structName
{
  return @"AccountLimits";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAdvertisedDeviceLimit, 0);
  objc_storeStrong((id *)&self->_userDeviceLimit, 0);
  objc_storeStrong((id *)&self->_noteResourceCountMax, 0);
  objc_storeStrong((id *)&self->_userSavedSearchesMax, 0);
  objc_storeStrong((id *)&self->_noteTagCountMax, 0);
  objc_storeStrong((id *)&self->_userTagCountMax, 0);
  objc_storeStrong((id *)&self->_userNotebookCountMax, 0);
  objc_storeStrong((id *)&self->_userNoteCountMax, 0);
  objc_storeStrong((id *)&self->_uploadLimit, 0);
  objc_storeStrong((id *)&self->_userLinkedNotebookMax, 0);
  objc_storeStrong((id *)&self->_resourceSizeMax, 0);
  objc_storeStrong((id *)&self->_noteSizeMax, 0);
  objc_storeStrong((id *)&self->_userMailLimitDaily, 0);
}

- (void)setUserAdvertisedDeviceLimit:(id)a3
{
}

- (NSNumber)userAdvertisedDeviceLimit
{
  return self->_userAdvertisedDeviceLimit;
}

- (void)setUserDeviceLimit:(id)a3
{
}

- (NSNumber)userDeviceLimit
{
  return self->_userDeviceLimit;
}

- (void)setNoteResourceCountMax:(id)a3
{
}

- (NSNumber)noteResourceCountMax
{
  return self->_noteResourceCountMax;
}

- (void)setUserSavedSearchesMax:(id)a3
{
}

- (NSNumber)userSavedSearchesMax
{
  return self->_userSavedSearchesMax;
}

- (void)setNoteTagCountMax:(id)a3
{
}

- (NSNumber)noteTagCountMax
{
  return self->_noteTagCountMax;
}

- (void)setUserTagCountMax:(id)a3
{
}

- (NSNumber)userTagCountMax
{
  return self->_userTagCountMax;
}

- (void)setUserNotebookCountMax:(id)a3
{
}

- (NSNumber)userNotebookCountMax
{
  return self->_userNotebookCountMax;
}

- (void)setUserNoteCountMax:(id)a3
{
}

- (NSNumber)userNoteCountMax
{
  return self->_userNoteCountMax;
}

- (void)setUploadLimit:(id)a3
{
}

- (NSNumber)uploadLimit
{
  return self->_uploadLimit;
}

- (void)setUserLinkedNotebookMax:(id)a3
{
}

- (NSNumber)userLinkedNotebookMax
{
  return self->_userLinkedNotebookMax;
}

- (void)setResourceSizeMax:(id)a3
{
}

- (NSNumber)resourceSizeMax
{
  return self->_resourceSizeMax;
}

- (void)setNoteSizeMax:(id)a3
{
}

- (NSNumber)noteSizeMax
{
  return self->_noteSizeMax;
}

- (void)setUserMailLimitDaily:(id)a3
{
}

- (NSNumber)userMailLimitDaily
{
  return self->_userMailLimitDaily;
}

@end