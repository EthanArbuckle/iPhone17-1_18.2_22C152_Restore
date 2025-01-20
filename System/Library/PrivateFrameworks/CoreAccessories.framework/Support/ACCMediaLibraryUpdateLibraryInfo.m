@interface ACCMediaLibraryUpdateLibraryInfo
- (ACCMediaLibraryUpdateLibraryInfo)initWithDict:(id)a3;
- (ACCMediaLibraryUpdateLibraryInfo)initWithMediaLibrary:(id)a3 dict:(id)a4;
- (ACCMediaLibraryUpdateLibraryInfo)initWithMediaLibrary:(id)a3 name:(id)a4 type:(int)a5;
- (BOOL)supportsSecureCoding;
- (NSString)mediaLibraryUID;
- (NSString)name;
- (id)copyDict;
- (id)description;
- (int)type;
- (void)fillStruct:(id *)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int)a3;
@end

@implementation ACCMediaLibraryUpdateLibraryInfo

- (ACCMediaLibraryUpdateLibraryInfo)initWithMediaLibrary:(id)a3 name:(id)a4 type:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACCMediaLibraryUpdateLibraryInfo;
  v11 = [(ACCMediaLibraryUpdateLibraryInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_type = a5;
  }

  return v12;
}

- (ACCMediaLibraryUpdateLibraryInfo)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  id v5 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ACCMediaLibraryUpdateLibraryInfo;
  v6 = [(ACCMediaLibraryUpdateLibraryInfo *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 objectForKey:@"ACCMediaLibraryUIDKey"];
    mediaLibraryUID = v6->_mediaLibraryUID;
    v6->_mediaLibraryUID = (NSString *)v7;

    uint64_t v9 = [v5 objectForKey:@"ACCMediaLibraryNameKey"];
    name = v6->_name;
    v6->_name = (NSString *)v9;

    v11 = [v5 objectForKey:@"ACCMediaLibraryTypeKey"];
    v6->_type = [v11 unsignedCharValue];
  }
  return v6;
}

- (ACCMediaLibraryUpdateLibraryInfo)initWithDict:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACCMediaLibraryUpdateLibraryInfo;
  id v5 = [(ACCMediaLibraryUpdateLibraryInfo *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"ACCMediaLibraryUIDKey"];
    mediaLibraryUID = v5->_mediaLibraryUID;
    v5->_mediaLibraryUID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"ACCMediaLibraryNameKey"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    id v10 = [v4 objectForKey:@"ACCMediaLibraryTypeKey"];
    v5->_type = [v10 unsignedCharValue];
  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<ACCMediaLibraryUpdateLibraryInfo>[%@ '%@' type=%d]", self->_mediaLibraryUID, self->_name, self->_type];
}

- (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [v3 setObject:self->_mediaLibraryUID forKey:@"ACCMediaLibraryUIDKey"];
  [v3 setObject:self->_name forKey:@"ACCMediaLibraryNameKey"];
  id v4 = +[NSNumber numberWithUnsignedChar:LOBYTE(self->_type)];
  [v3 setObject:v4 forKey:@"ACCMediaLibraryTypeKey"];

  return v3;
}

- (void)fillStruct:(id *)a3
{
  a3->var0 = 0;
  a3->var1 = 0;
  *(void *)&a3->var2 = 0;
  a3->var1 = (char *)[(NSString *)self->_mediaLibraryUID UTF8String];
  a3->var0 = (char *)[(NSString *)self->_name UTF8String];
  a3->var2 = self->_type;
}

- (void)setMediaLibraryUID:(id)a3
{
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

@end