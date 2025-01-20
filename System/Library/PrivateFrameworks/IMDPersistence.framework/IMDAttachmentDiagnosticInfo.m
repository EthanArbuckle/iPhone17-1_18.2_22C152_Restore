@interface IMDAttachmentDiagnosticInfo
- (NSString)filePath;
- (NSString)guid;
- (NSString)mime_type;
- (NSString)originalGUID;
- (NSString)plugin_identifier;
- (NSString)uti;
- (id)description;
- (int64_t)ck_sync_state;
- (int64_t)transfer_state;
- (unint64_t)hide_attachment;
- (unint64_t)is_sticker;
- (unint64_t)total_bytes;
- (void)setCk_sync_state:(int64_t)a3;
- (void)setFilePath:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHide_attachment:(unint64_t)a3;
- (void)setIs_sticker:(unint64_t)a3;
- (void)setMime_type:(id)a3;
- (void)setOriginalGUID:(id)a3;
- (void)setPlugin_identifier:(id)a3;
- (void)setTotal_bytes:(unint64_t)a3;
- (void)setTransfer_state:(int64_t)a3;
- (void)setUti:(id)a3;
@end

@implementation IMDAttachmentDiagnosticInfo

- (id)description
{
  v15 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)IMDAttachmentDiagnosticInfo;
  v3 = [(IMDAttachmentDiagnosticInfo *)&v16 description];
  v4 = [(IMDAttachmentDiagnosticInfo *)self guid];
  unint64_t v5 = [(IMDAttachmentDiagnosticInfo *)self total_bytes];
  [(IMDAttachmentDiagnosticInfo *)self ck_sync_state];
  v6 = IMStringFromCKSyncState();
  [(IMDAttachmentDiagnosticInfo *)self transfer_state];
  v7 = IMStringFromTransferState();
  v8 = [(IMDAttachmentDiagnosticInfo *)self uti];
  v9 = [(IMDAttachmentDiagnosticInfo *)self filePath];
  if ([(IMDAttachmentDiagnosticInfo *)self is_sticker]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v11 = [(IMDAttachmentDiagnosticInfo *)self mime_type];
  v12 = [(IMDAttachmentDiagnosticInfo *)self plugin_identifier];
  v13 = [v15 stringWithFormat:@"%@: guid: %@, total_bytes: %lld, ck_sync_state: %@, transfer_state: %@, uti: %@, file path: %@, is_sticker: %@, mime_type: %@, plugin_identifier: %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)originalGUID
{
  return self->_originalGUID;
}

- (void)setOriginalGUID:(id)a3
{
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (unint64_t)total_bytes
{
  return self->_total_bytes;
}

- (void)setTotal_bytes:(unint64_t)a3
{
  self->_total_bytes = a3;
}

- (int64_t)ck_sync_state
{
  return self->_ck_sync_state;
}

- (void)setCk_sync_state:(int64_t)a3
{
  self->_ck_sync_state = a3;
}

- (int64_t)transfer_state
{
  return self->_transfer_state;
}

- (void)setTransfer_state:(int64_t)a3
{
  self->_transfer_state = a3;
}

- (unint64_t)hide_attachment
{
  return self->_hide_attachment;
}

- (void)setHide_attachment:(unint64_t)a3
{
  self->_hide_attachment = a3;
}

- (unint64_t)is_sticker
{
  return self->_is_sticker;
}

- (void)setIs_sticker:(unint64_t)a3
{
  self->_is_sticker = a3;
}

- (NSString)mime_type
{
  return self->_mime_type;
}

- (void)setMime_type:(id)a3
{
}

- (NSString)plugin_identifier
{
  return self->_plugin_identifier;
}

- (void)setPlugin_identifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin_identifier, 0);
  objc_storeStrong((id *)&self->_mime_type, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_originalGUID, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end