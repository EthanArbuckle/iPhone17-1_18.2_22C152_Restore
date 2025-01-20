@interface PHImportOptions
- (BOOL)allowDuplicates;
- (BOOL)allowUnsupported;
- (BOOL)deleteAfterImport;
- (BOOL)hideProgress;
- (BOOL)omitImportComplete;
- (BOOL)preserveFolderStructure;
- (BOOL)shouldImportAsReferenced;
- (BOOL)skipAlertWhenFinished;
- (BOOL)skipDiskSpaceCheck;
- (NSMutableDictionary)userIptcMetadata;
- (NSSortDescriptor)sortDescriptor;
- (NSString)personId;
- (PHAssetCollection)destinationAlbum;
- (PHCollectionList)destinationFolder;
- (PHImportOptions)init;
- (PHImportSource)importSource;
- (PHLibraryScope)libraryScope;
- (PHPhotoLibrary)library;
- (id)description;
- (signed)importedBy;
- (unsigned)fileOperation;
- (unsigned)metadataAddMode;
- (void)setAllowDuplicates:(BOOL)a3;
- (void)setAllowUnsupported:(BOOL)a3;
- (void)setDeleteAfterImport:(BOOL)a3;
- (void)setDestinationAlbum:(id)a3;
- (void)setDestinationFolder:(id)a3;
- (void)setFileOperation:(unsigned __int8)a3;
- (void)setHideProgress:(BOOL)a3;
- (void)setImportSource:(id)a3;
- (void)setImportedBy:(signed __int16)a3;
- (void)setLibrary:(id)a3;
- (void)setLibraryScope:(id)a3;
- (void)setMetadataAddMode:(unsigned __int8)a3;
- (void)setOmitImportComplete:(BOOL)a3;
- (void)setPersonId:(id)a3;
- (void)setPreserveFolderStructure:(BOOL)a3;
- (void)setShouldImportAsReferenced:(BOOL)a3;
- (void)setSkipAlertWhenFinished:(BOOL)a3;
- (void)setSkipDiskSpaceCheck:(BOOL)a3;
- (void)setSortDescriptor:(id)a3;
- (void)setUserIptcMetadata:(id)a3;
@end

@implementation PHImportOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
  objc_storeStrong((id *)&self->_personId, 0);
  objc_storeStrong((id *)&self->_userIptcMetadata, 0);
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
  objc_storeStrong((id *)&self->_destinationFolder, 0);

  objc_storeStrong((id *)&self->_destinationAlbum, 0);
}

- (void)setLibraryScope:(id)a3
{
}

- (PHLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (void)setLibrary:(id)a3
{
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setImportSource:(id)a3
{
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (void)setPersonId:(id)a3
{
}

- (NSString)personId
{
  return self->_personId;
}

- (void)setUserIptcMetadata:(id)a3
{
}

- (NSMutableDictionary)userIptcMetadata
{
  return self->_userIptcMetadata;
}

- (void)setSortDescriptor:(id)a3
{
}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (void)setDestinationFolder:(id)a3
{
}

- (PHCollectionList)destinationFolder
{
  return self->_destinationFolder;
}

- (void)setDestinationAlbum:(id)a3
{
}

- (PHAssetCollection)destinationAlbum
{
  return self->_destinationAlbum;
}

- (void)setAllowUnsupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFDFF | v3;
}

- (BOOL)allowUnsupported
{
  return (*(_WORD *)&self->_options_bits >> 9) & 1;
}

- (void)setOmitImportComplete:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFEFF | v3;
}

- (BOOL)omitImportComplete
{
  return HIBYTE(*(_WORD *)&self->_options_bits) & 1;
}

- (void)setMetadataAddMode:(unsigned __int8)a3
{
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFF7F | ((a3 & 1) << 7);
}

- (unsigned)metadataAddMode
{
  return *(unsigned char *)&self->_options_bits >> 7;
}

- (void)setDeleteAfterImport:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFBF | v3;
}

- (BOOL)deleteAfterImport
{
  return (*(_WORD *)&self->_options_bits >> 6) & 1;
}

- (void)setSkipDiskSpaceCheck:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFDF | v3;
}

- (BOOL)skipDiskSpaceCheck
{
  return (*(_WORD *)&self->_options_bits >> 5) & 1;
}

- (void)setAllowDuplicates:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFEF | v3;
}

- (BOOL)allowDuplicates
{
  return (*(_WORD *)&self->_options_bits >> 4) & 1;
}

- (void)setShouldImportAsReferenced:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFF7 | v3;
}

- (BOOL)shouldImportAsReferenced
{
  return (*(_WORD *)&self->_options_bits >> 3) & 1;
}

- (void)setFileOperation:(unsigned __int8)a3
{
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xE3FF | ((a3 & 7) << 10);
}

- (unsigned)fileOperation
{
  return (*(_WORD *)&self->_options_bits >> 10) & 7;
}

- (void)setSkipAlertWhenFinished:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFFB | v3;
}

- (BOOL)skipAlertWhenFinished
{
  return (*(_WORD *)&self->_options_bits >> 2) & 1;
}

- (void)setHideProgress:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFFD | v3;
}

- (BOOL)hideProgress
{
  return (*(_WORD *)&self->_options_bits >> 1) & 1;
}

- (void)setImportedBy:(signed __int16)a3
{
  *((unsigned char *)&self->_options_bits + 2) = a3;
}

- (signed)importedBy
{
  return *((unsigned __int8 *)&self->_options_bits + 2);
}

- (void)setPreserveFolderStructure:(BOOL)a3
{
  *(_WORD *)&self->_options_bits = *(_WORD *)&self->_options_bits & 0xFFFE | a3;
}

- (BOOL)preserveFolderStructure
{
  return *(_WORD *)&self->_options_bits & 1;
}

- (id)description
{
  v23 = NSString;
  if ([(PHImportOptions *)self preserveFolderStructure]) {
    __int16 v3 = @"YES";
  }
  else {
    __int16 v3 = @"NO";
  }
  v22 = v3;
  int v21 = [(PHImportOptions *)self importedBy];
  if ([(PHImportOptions *)self hideProgress]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v20 = v4;
  if ([(PHImportOptions *)self skipAlertWhenFinished]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v19 = v5;
  unsigned int v18 = [(PHImportOptions *)self fileOperation];
  if ([(PHImportOptions *)self shouldImportAsReferenced]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if ([(PHImportOptions *)self allowDuplicates]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if ([(PHImportOptions *)self skipDiskSpaceCheck]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(PHImportOptions *)self deleteAfterImport]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  unsigned int v10 = [(PHImportOptions *)self metadataAddMode];
  if ([(PHImportOptions *)self omitImportComplete]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if ([(PHImportOptions *)self allowUnsupported]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = [(PHImportOptions *)self personId];
  v14 = [(PHImportOptions *)self libraryScope];
  v15 = [(PHImportOptions *)self library];
  v16 = [v23 stringWithFormat:@"\npreserveFolderStructure: %@\nimportedBy: %d\nhideProgress: %@\nskipAlertWhenFinished: %@\nfileOperation: %d\nshouldImportAsReferenced: %@\nallowDuplicates: %@\nskipDiskSpaceCheck: %@\ndeleteAfterImport: %@\nmetadataAddMode: %d\nomitImportComplete: %@\nallowUnsupported: %@\npersonId: %@\nlibraryScope: %@\nlibrary: %@\n", v22, v21, v20, v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15];

  return v16;
}

- (PHImportOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHImportOptions;
  v2 = [(PHImportOptions *)&v7 init];
  __int16 v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_options_bits &= 0xE37Fu;
    uint64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    sortDescriptor = v3->_sortDescriptor;
    v3->_sortDescriptor = (NSSortDescriptor *)v4;

    *((unsigned char *)&v3->_options_bits + 2) = 4;
  }
  return v3;
}

@end