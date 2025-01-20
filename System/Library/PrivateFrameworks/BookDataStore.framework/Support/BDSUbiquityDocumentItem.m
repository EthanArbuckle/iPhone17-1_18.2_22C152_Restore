@interface BDSUbiquityDocumentItem
- (BOOL)isDownloading;
- (BOOL)isLocal;
- (BOOL)isNotLocal;
- (BOOL)isUploaded;
- (BOOL)isUploading;
- (NSDate)contentChangedDate;
- (NSDate)contentCreationDate;
- (NSError)uploadingError;
- (NSNumber)contentFileSize;
- (NSNumber)downloadingPercent;
- (NSNumber)unresolvedConflict;
- (NSNumber)uploadingPercent;
- (NSURL)url;
- (id)description;
- (void)setContentChangedDate:(id)a3;
- (void)setContentCreationDate:(id)a3;
- (void)setContentFileSize:(id)a3;
- (void)setDownloadingPercent:(id)a3;
- (void)setIsDownloading:(BOOL)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setIsNotLocal:(BOOL)a3;
- (void)setIsUploaded:(BOOL)a3;
- (void)setIsUploading:(BOOL)a3;
- (void)setUnresolvedConflict:(id)a3;
- (void)setUploadingError:(id)a3;
- (void)setUploadingPercent:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BDSUbiquityDocumentItem

- (id)description
{
  uint64_t v16 = objc_opt_class();
  v15 = [(BDSUbiquityDocumentItem *)self url];
  v18 = +[NSNumber numberWithBool:[(BDSUbiquityDocumentItem *)self isLocal]];
  v14 = +[NSNumber numberWithBool:[(BDSUbiquityDocumentItem *)self isNotLocal]];
  v17 = +[NSNumber numberWithBool:[(BDSUbiquityDocumentItem *)self isUploading]];
  v13 = +[NSNumber numberWithBool:[(BDSUbiquityDocumentItem *)self isUploaded]];
  v3 = +[NSNumber numberWithBool:[(BDSUbiquityDocumentItem *)self isDownloading]];
  v12 = [(BDSUbiquityDocumentItem *)self downloadingPercent];
  v4 = [(BDSUbiquityDocumentItem *)self uploadingPercent];
  v5 = [(BDSUbiquityDocumentItem *)self uploadingError];
  v6 = [(BDSUbiquityDocumentItem *)self unresolvedConflict];
  v7 = [(BDSUbiquityDocumentItem *)self contentChangedDate];
  v8 = [(BDSUbiquityDocumentItem *)self contentCreationDate];
  v9 = [(BDSUbiquityDocumentItem *)self contentFileSize];
  v10 = +[NSString stringWithFormat:@"<%@(%p) \n\t url : %@ \n\t isLocal : %@ \n\t isNotLocal : %@ \n\t isUploading : %@ \n\t isUploaded : %@ \n\t isDownloading : %@ \n\t downloadingPercent : %@ \n\t uploadingPercent : %@ \n\t uploadingError : %@ \n\t unresolvedConflict : %@ \n\t contentChangedDate : %@ \n\t contentCreationDate : %@ \n\t contentFileSize : %@ ", v16, self, v15, v18, v14, v17, v13, v3, v12, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isNotLocal
{
  return self->_isNotLocal;
}

- (void)setIsNotLocal:(BOOL)a3
{
  self->_isNotLocal = a3;
}

- (BOOL)isUploading
{
  return self->_isUploading;
}

- (void)setIsUploading:(BOOL)a3
{
  self->_isUploading = a3;
}

- (BOOL)isUploaded
{
  return self->_isUploaded;
}

- (void)setIsUploaded:(BOOL)a3
{
  self->_isUploaded = a3;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (void)setIsDownloading:(BOOL)a3
{
  self->_isDownloading = a3;
}

- (NSNumber)downloadingPercent
{
  return self->_downloadingPercent;
}

- (void)setDownloadingPercent:(id)a3
{
}

- (NSNumber)uploadingPercent
{
  return self->_uploadingPercent;
}

- (void)setUploadingPercent:(id)a3
{
}

- (NSError)uploadingError
{
  return self->_uploadingError;
}

- (void)setUploadingError:(id)a3
{
}

- (NSNumber)unresolvedConflict
{
  return self->_unresolvedConflict;
}

- (void)setUnresolvedConflict:(id)a3
{
}

- (NSDate)contentChangedDate
{
  return self->_contentChangedDate;
}

- (void)setContentChangedDate:(id)a3
{
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (void)setContentCreationDate:(id)a3
{
}

- (NSNumber)contentFileSize
{
  return self->_contentFileSize;
}

- (void)setContentFileSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFileSize, 0);
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_contentChangedDate, 0);
  objc_storeStrong((id *)&self->_unresolvedConflict, 0);
  objc_storeStrong((id *)&self->_uploadingError, 0);
  objc_storeStrong((id *)&self->_uploadingPercent, 0);
  objc_storeStrong((id *)&self->_downloadingPercent, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end