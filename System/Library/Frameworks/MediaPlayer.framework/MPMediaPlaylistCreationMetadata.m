@interface MPMediaPlaylistCreationMetadata
- (MPMediaPlaylistCreationMetadata)init;
- (MPMediaPlaylistCreationMetadata)initWithName:(NSString *)name;
- (NSString)authorDisplayName;
- (NSString)descriptionText;
- (NSString)name;
- (void)setAuthorDisplayName:(NSString *)authorDisplayName;
- (void)setDescriptionText:(NSString *)descriptionText;
@end

@implementation MPMediaPlaylistCreationMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_authorDisplayName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_defaultAuthorDisplayName, 0);
}

- (void)setDescriptionText:(NSString *)descriptionText
{
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setAuthorDisplayName:(NSString *)authorDisplayName
{
}

- (NSString)name
{
  return self->_name;
}

- (NSString)authorDisplayName
{
  v3 = (void *)[(NSString *)self->_authorDisplayName copy];
  if (![v3 length])
  {
    uint64_t v4 = [(NSString *)self->_defaultAuthorDisplayName copy];

    v3 = (void *)v4;
  }

  return (NSString *)v3;
}

- (MPMediaPlaylistCreationMetadata)initWithName:(NSString *)name
{
  uint64_t v4 = name;
  if ([(NSString *)v4 length])
  {
    v28.receiver = self;
    v28.super_class = (Class)MPMediaPlaylistCreationMetadata;
    v5 = [(MPMediaPlaylistCreationMetadata *)&v28 init];
    if (v5)
    {
      uint64_t v6 = [(NSString *)v4 copy];
      v7 = v5->_name;
      v5->_name = (NSString *)v6;

      v8 = [MEMORY[0x1E4F28B50] mainBundle];
      v9 = [v8 localizedInfoDictionary];
      uint64_t v10 = [v9 objectForKey:@"CFBundleDisplayName"];
      defaultAuthorDisplayName = v5->_defaultAuthorDisplayName;
      v5->_defaultAuthorDisplayName = (NSString *)v10;

      if (![(NSString *)v5->_defaultAuthorDisplayName length])
      {
        v12 = [v8 localizedInfoDictionary];
        uint64_t v13 = [v12 objectForKey:@"CFBundleExecutable"];
        v14 = v5->_defaultAuthorDisplayName;
        v5->_defaultAuthorDisplayName = (NSString *)v13;
      }
      if (![(NSString *)v5->_defaultAuthorDisplayName length])
      {
        v15 = [v8 infoDictionary];
        uint64_t v16 = [v15 objectForKey:@"CFBundleDisplayName"];
        v17 = v5->_defaultAuthorDisplayName;
        v5->_defaultAuthorDisplayName = (NSString *)v16;
      }
      v18 = [MEMORY[0x1E4F28B50] mainBundle];
      v19 = [v18 infoDictionary];
      uint64_t v20 = [v19 objectForKey:@"CFBundleExecutable"];
      v21 = v5->_defaultAuthorDisplayName;
      v5->_defaultAuthorDisplayName = (NSString *)v20;

      if (![(NSString *)v5->_defaultAuthorDisplayName length])
      {
        v22 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_ERROR, "Could not resolve default author display name", buf, 2u);
        }

        v23 = v5->_defaultAuthorDisplayName;
        v5->_defaultAuthorDisplayName = (NSString *)&stru_1EE680640;
      }
      descriptionText = v5->_descriptionText;
      v5->_descriptionText = (NSString *)&stru_1EE680640;
    }
    self = v5;
    v25 = self;
  }
  else
  {
    v26 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_ERROR, "Cannot create playlist with an empty name", buf, 2u);
    }

    v25 = 0;
  }

  return v25;
}

- (MPMediaPlaylistCreationMetadata)init
{
  return 0;
}

@end