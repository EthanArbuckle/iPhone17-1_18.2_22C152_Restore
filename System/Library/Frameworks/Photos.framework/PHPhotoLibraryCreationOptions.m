@interface PHPhotoLibraryCreationOptions
+ (id)creationOptionsForApplicationLibraryWithContainerIdentifier:(id)a3;
+ (id)creationOptionsForDefaultApplicationLibraryWithContainerIdentifier:(id)a3;
+ (id)creationOptionsForUserLibrary;
- (NSString)containerIdentifier;
- (NSString)userDescription;
- (NSString)uuid;
- (NSURL)libraryURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)domain;
- (unint64_t)internalCreateOptions;
- (void)setContainerIdentifier:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setInternalCreateOptions:(unint64_t)a3;
- (void)setLibraryURL:(id)a3;
- (void)setUserDescription:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PHPhotoLibraryCreationOptions

+ (id)creationOptionsForUserLibrary
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setDomain:2];
  [v2 setInternalCreateOptions:32];

  return v2;
}

+ (id)creationOptionsForApplicationLibraryWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setDomain:3];
  if (v4)
  {
    [v5 setContainerIdentifier:v4];
  }
  else
  {
    v6 = +[PHPhotoLibraryIdentifier defaultApplicationContainerIdentifier];
    [v5 setContainerIdentifier:v6];
  }
  [v5 setInternalCreateOptions:115];

  return v5;
}

+ (id)creationOptionsForDefaultApplicationLibraryWithContainerIdentifier:(id)a3
{
  v3 = [a1 creationOptionsForApplicationLibraryWithContainerIdentifier:a3];
  [v3 setUuid:*MEMORY[0x1E4F8B240]];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

- (void)setInternalCreateOptions:(unint64_t)a3
{
  self->_internalCreateOptions = a3;
}

- (unint64_t)internalCreateOptions
{
  return self->_internalCreateOptions;
}

- (void)setLibraryURL:(id)a3
{
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserDescription:(id)a3
{
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  containerIdentifier = self->_containerIdentifier;
  self->_containerIdentifier = v4;
}

- (NSString)containerIdentifier
{
  v3 = self->_containerIdentifier;
  if (!v3)
  {
    if ([(PHPhotoLibraryCreationOptions *)self domain] == 3)
    {
      v3 = +[PHPhotoLibraryIdentifier defaultApplicationContainerIdentifier];
    }
    else
    {
      v3 = (NSString *)(id)*MEMORY[0x1E4F8B280];
    }
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  id v5 = [(PHPhotoLibraryCreationOptions *)self libraryURL];
  [v4 setLibraryURL:v5];

  objc_msgSend(v4, "setDomain:", -[PHPhotoLibraryCreationOptions domain](self, "domain"));
  v6 = [(PHPhotoLibraryCreationOptions *)self userDescription];
  [v4 setUserDescription:v6];

  v7 = [(PHPhotoLibraryCreationOptions *)self containerIdentifier];
  [v4 setContainerIdentifier:v7];

  objc_msgSend(v4, "setInternalCreateOptions:", -[PHPhotoLibraryCreationOptions internalCreateOptions](self, "internalCreateOptions"));
  v8 = [(PHPhotoLibraryCreationOptions *)self uuid];
  [v4 setUuid:v8];

  return v4;
}

@end