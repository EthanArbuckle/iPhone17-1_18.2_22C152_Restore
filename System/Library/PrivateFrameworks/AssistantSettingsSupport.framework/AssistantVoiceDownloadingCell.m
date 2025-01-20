@interface AssistantVoiceDownloadingCell
- (AssistantVoiceDownloadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDownloading:(BOOL)a3;
@end

@implementation AssistantVoiceDownloadingCell

- (AssistantVoiceDownloadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AssistantVoiceDownloadingCell;
  v5 = [(PSTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = [[AssistantVoiceDownloadingView alloc] initWithActivityIndicatorStyle:100];
    downloadingView = v5->_downloadingView;
    v5->_downloadingView = v6;

    [(AssistantVoiceDownloadingView *)v5->_downloadingView sizeToFit];
  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AssistantVoiceDownloadingCell;
  id v4 = a3;
  [(PSTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"IS_VOICE_DOWNLOADING", v7.receiver, v7.super_class);

  uint64_t v6 = [v5 BOOLValue];
  [(AssistantVoiceDownloadingCell *)self setDownloading:v6];
}

- (void)setDownloading:(BOOL)a3
{
  if (self->_downloading != a3)
  {
    if (a3)
    {
      v5 = [[AssistantVoiceDownloadingView alloc] initWithActivityIndicatorStyle:100];
      downloadingView = self->_downloadingView;
      self->_downloadingView = v5;

      [(AssistantVoiceDownloadingView *)self->_downloadingView sizeToFit];
      [(AssistantVoiceDownloadingCell *)self setAccessoryView:self->_downloadingView];
      [(AssistantVoiceDownloadingCell *)self setNeedsLayout];
    }
    else
    {
      [(AssistantVoiceDownloadingCell *)self setAccessoryView:0];
      objc_super v7 = self->_downloadingView;
      self->_downloadingView = 0;
    }
    self->_downloading = a3;
  }
}

- (void).cxx_destruct
{
}

@end