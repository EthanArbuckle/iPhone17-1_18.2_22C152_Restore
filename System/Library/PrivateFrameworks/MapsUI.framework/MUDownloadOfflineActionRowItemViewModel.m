@interface MUDownloadOfflineActionRowItemViewModel
- (BOOL)isEnabled;
- (BOOL)titleUsesMonospacedNumbersFont;
- (MUDownloadOfflineActionRowItemViewModel)initWithOfflineMapProvider:(id)a3;
- (MUOfflineMapProvider)offlineMapProvider;
- (id)accessibilityIdentifier;
- (id)accessoryView;
- (id)byteCountFormatter;
- (id)progressView;
- (id)symbolName;
- (id)titleText;
- (unint64_t)actionItemType;
- (void)dealloc;
- (void)setOfflineMapProvider:(id)a3;
@end

@implementation MUDownloadOfflineActionRowItemViewModel

- (MUDownloadOfflineActionRowItemViewModel)initWithOfflineMapProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUDownloadOfflineActionRowItemViewModel;
  v5 = [(MUActionRowItemViewModel *)&v9 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_offlineMapProvider, v4);
    [v4 addObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(MUDownloadOfflineActionRowItemViewModel *)self offlineMapProvider];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MUDownloadOfflineActionRowItemViewModel;
  [(MUDownloadOfflineActionRowItemViewModel *)&v4 dealloc];
}

- (BOOL)isEnabled
{
  return 1;
}

- (id)symbolName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  unint64_t v3 = [WeakRetained downloadState];

  if (v3 > 5) {
    return 0;
  }
  else {
    return off_1E5750370[v3];
  }
}

- (id)accessoryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  uint64_t v4 = [WeakRetained downloadState];

  if (v4 == 4)
  {
    v5 = [(MUDownloadOfflineActionRowItemViewModel *)self progressView];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)titleText
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  uint64_t v4 = [WeakRetained downloadState];

  switch(v4)
  {
    case 0:
      v5 = @"Download Map [Placecard]";
      goto LABEL_8;
    case 1:
      v5 = @"Download Map - Waiting [Placecard]";
      goto LABEL_8;
    case 2:
      v5 = @"Download Map - Paused [Placecard]";
      goto LABEL_8;
    case 3:
      v5 = @"Download Map - Failed [Placecard]";
      goto LABEL_8;
    case 4:
      v6 = [v2 byteCountFormatter];
      id v7 = [v2 offlineMapProvider];
      v8 = [v7 downloadProgress];
      objc_super v9 = [v8 byteCompletedCount];
      v2 = objc_msgSend(v6, "stringFromByteCount:", objc_msgSend(v9, "longLongValue"));

      break;
    case 5:
      v5 = @"Offline [Placecard]";
LABEL_8:
      v2 = _MULocalizedStringFromThisBundle(v5);
      break;
    default:
      break;
  }
  return v2;
}

- (BOOL)titleUsesMonospacedNumbersFont
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  BOOL v3 = [WeakRetained downloadState] == 4;

  return v3;
}

- (id)accessibilityIdentifier
{
  return (id)[@"ActionRowItemType" stringByAppendingString:@"DownloadOffline"];
}

- (id)byteCountFormatter
{
  byteCountFormatter = self->_byteCountFormatter;
  if (!byteCountFormatter)
  {
    uint64_t v4 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E4F28B68]);
    v5 = self->_byteCountFormatter;
    self->_byteCountFormatter = v4;

    [(NSByteCountFormatter *)self->_byteCountFormatter setZeroPadsFractionDigits:1];
    byteCountFormatter = self->_byteCountFormatter;
  }
  return byteCountFormatter;
}

- (id)progressView
{
  if (!self->_progressView)
  {
    BOOL v3 = objc_alloc_init(MUCircleProgressObservingView);
    progressView = self->_progressView;
    self->_progressView = v3;

    v5 = (void *)MEMORY[0x1E4FB1818];
    v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:10.0];
    id v7 = [v5 systemImageNamed:@"stop.fill" withConfiguration:v6];
    [(MUCircleProgressObservingView *)self->_progressView setImage:v7];
  }
  v8 = [(MUDownloadOfflineActionRowItemViewModel *)self offlineMapProvider];
  objc_super v9 = [v8 downloadProgress];
  [(MUCircleProgressObservingView *)self->_progressView setProgress:v9];

  v10 = self->_progressView;
  return v10;
}

- (unint64_t)actionItemType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  uint64_t v3 = [WeakRetained downloadState];

  if ((unint64_t)(v3 - 1) > 4) {
    return 34;
  }
  else {
    return qword_19335B890[v3 - 1];
  }
}

- (MUOfflineMapProvider)offlineMapProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  return (MUOfflineMapProvider *)WeakRetained;
}

- (void)setOfflineMapProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_offlineMapProvider);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
}

@end