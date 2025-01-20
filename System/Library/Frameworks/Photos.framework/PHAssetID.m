@interface PHAssetID
- (NSString)directory;
- (NSString)filename;
- (NSString)uuid;
- (PLPhotoLibraryPathManagerIdentifier)libraryID;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)bundleScope;
- (void)loadFromAsset:(id)a3;
- (void)prepareForReuse;
- (void)setBundleScope:(unsigned __int16)a3;
- (void)setDirectory:(id)a3;
- (void)setFilename:(id)a3;
- (void)setLibraryID:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PHAssetID

- (void)loadFromAsset:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  v6 = (NSString *)[v5 copy];
  uuid = self->_uuid;
  self->_uuid = v6;

  v8 = [v4 directory];
  v9 = (NSString *)[v8 copy];
  directory = self->_directory;
  self->_directory = v9;

  v11 = [v4 filename];
  v12 = (NSString *)[v11 copy];
  filename = self->_filename;
  self->_filename = v12;

  v14 = [v4 libraryID];
  v15 = (PLPhotoLibraryPathManagerIdentifier *)[v14 copy];
  libraryID = self->_libraryID;
  self->_libraryID = v15;

  LOWORD(v14) = [v4 bundleScope];
  self->_bundleScope = (unsigned __int16)v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryID, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (void)setLibraryID:(id)a3
{
}

- (PLPhotoLibraryPathManagerIdentifier)libraryID
{
  return self->_libraryID;
}

- (void)setFilename:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setDirectory:(id)a3
{
}

- (NSString)directory
{
  return self->_directory;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PHAssetID);
  v5 = [(PHAssetID *)self uuid];
  [(PHAssetID *)v4 setUuid:v5];

  v6 = [(PHAssetID *)self directory];
  [(PHAssetID *)v4 setDirectory:v6];

  v7 = [(PHAssetID *)self filename];
  [(PHAssetID *)v4 setFilename:v7];

  v8 = [(PHAssetID *)self libraryID];
  [(PHAssetID *)v4 setLibraryID:v8];

  [(PHAssetID *)v4 setBundleScope:[(PHAssetID *)self bundleScope]];
  return v4;
}

- (void)prepareForReuse
{
  uuid = self->_uuid;
  self->_uuid = 0;

  directory = self->_directory;
  self->_directory = 0;

  filename = self->_filename;
  self->_filename = 0;

  libraryID = self->_libraryID;
  self->_libraryID = 0;

  self->_bundleScope = 0;
}

@end