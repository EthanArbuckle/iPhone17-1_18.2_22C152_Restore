@interface BRProgressUpdate
+ (BOOL)supportsSecureCoding;
- (BRFileObjectID)folderID;
- (BRProgressUpdate)initWithCoder:(id)a3;
- (NSArray)parentFileIDs;
- (id)description;
- (unint64_t)downloadCompletedSize;
- (unint64_t)downloadTotalSize;
- (unint64_t)uploadCompletedSize;
- (unint64_t)uploadTotalSize;
- (void)encodeWithCoder:(id)a3;
- (void)parentFileIDs;
- (void)setDownloadCompletedSize:(unint64_t)a3;
- (void)setDownloadTotalSize:(unint64_t)a3;
- (void)setFolderID:(id)a3;
- (void)setParentFileIDs:(id)a3;
- (void)setUploadCompletedSize:(unint64_t)a3;
- (void)setUploadTotalSize:(unint64_t)a3;
@end

@implementation BRProgressUpdate

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<progress %@", self->_folderID];
  v4 = v3;
  unint64_t uploadTotalSize = self->_uploadTotalSize;
  if (uploadTotalSize) {
    objc_msgSend(v3, "appendFormat:", @" ul:%llu/%llu (%.1f%%)", self->_uploadCompletedSize, uploadTotalSize, (double)self->_uploadCompletedSize * 100.0 / (double)uploadTotalSize);
  }
  unint64_t downloadTotalSize = self->_downloadTotalSize;
  if (downloadTotalSize) {
    objc_msgSend(v4, "appendFormat:", @" dl:%llu/%llu (%.1f%%)", self->_downloadCompletedSize, downloadTotalSize, (double)self->_downloadCompletedSize * 100.0 / (double)downloadTotalSize);
  }
  [v4 appendString:@">"];

  return v4;
}

- (NSArray)parentFileIDs
{
  parentFileIDs = self->_parentFileIDs;
  if (!parentFileIDs)
  {
    v4 = brc_bread_crumbs((uint64_t)"-[BRProgressUpdate parentFileIDs]", 44);
    v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      [(BRProgressUpdate *)(uint64_t)v4 parentFileIDs];
    }

    parentFileIDs = self->_parentFileIDs;
  }

  return parentFileIDs;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRProgressUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRProgressUpdate;
  v5 = [(BRProgressUpdate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    folderID = v5->_folderID;
    v5->_folderID = (BRFileObjectID *)v6;

    v5->_uploadCompletedSize = [v4 decodeInt64ForKey:@"ul"];
    v5->_unint64_t uploadTotalSize = [v4 decodeInt64ForKey:@"ulDone"];
    v5->_downloadCompletedSize = [v4 decodeInt64ForKey:@"dl"];
    v5->_unint64_t downloadTotalSize = [v4 decodeInt64ForKey:@"dlDone"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  folderID = self->_folderID;
  id v5 = a3;
  [v5 encodeObject:folderID forKey:@"id"];
  [v5 encodeInt64:self->_uploadCompletedSize forKey:@"ul"];
  [v5 encodeInt64:self->_uploadTotalSize forKey:@"ulDone"];
  [v5 encodeInt64:self->_downloadCompletedSize forKey:@"dl"];
  [v5 encodeInt64:self->_downloadTotalSize forKey:@"dlDone"];
}

- (void)setParentFileIDs:(id)a3
{
}

- (BRFileObjectID)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
}

- (unint64_t)uploadCompletedSize
{
  return self->_uploadCompletedSize;
}

- (void)setUploadCompletedSize:(unint64_t)a3
{
  self->_uploadCompletedSize = a3;
}

- (unint64_t)uploadTotalSize
{
  return self->_uploadTotalSize;
}

- (void)setUploadTotalSize:(unint64_t)a3
{
  self->_unint64_t uploadTotalSize = a3;
}

- (unint64_t)downloadCompletedSize
{
  return self->_downloadCompletedSize;
}

- (void)setDownloadCompletedSize:(unint64_t)a3
{
  self->_downloadCompletedSize = a3;
}

- (unint64_t)downloadTotalSize
{
  return self->_downloadTotalSize;
}

- (void)setDownloadTotalSize:(unint64_t)a3
{
  self->_unint64_t downloadTotalSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFileIDs, 0);

  objc_storeStrong((id *)&self->_folderID, 0);
}

- (void)parentFileIDs
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: this call was not supposed to be made%@", (uint8_t *)&v2, 0xCu);
}

@end