@interface MKTransitIncidentSymbolImageCell
- (BOOL)padBottom;
- (MKTransitIncidentViewModel)viewModel;
- (int64_t)cellPosition;
- (void)_configureWithMessage:(id)a3 referenceDate:(id)a4 lastUpdated:(id)a5 incidentIsBlocking:(BOOL)a6 shouldShowImage:(BOOL)a7 inSiri:(BOOL)a8;
- (void)_updateAppearance;
- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6;
- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6;
- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7;
- (void)setCellPosition:(int64_t)a3;
- (void)setPadBottom:(BOOL)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MKTransitIncidentSymbolImageCell

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if (!-[MKTransitIncidentViewModel isEqual:](self->_viewModel, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(MKTransitIncidentSymbolImageCell *)self _updateAppearance];
  }
}

- (void)configureWithIncident:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v14 = +[MKTransitIncidentStringProvider cellTitleForIncident:v11];
  v12 = [v11 lastUpdated];
  uint64_t v13 = [v11 isBlockingIncident];

  [(MKTransitIncidentSymbolImageCell *)self _configureWithMessage:v14 referenceDate:v10 lastUpdated:v12 incidentIsBlocking:v13 shouldShowImage:v7 inSiri:v6];
}

- (void)configureWithMessage:(id)a3 incident:(id)a4 referenceDate:(id)a5 shouldShowImage:(BOOL)a6 inSiri:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v16 = [v13 lastUpdated];
  uint64_t v15 = [v13 isBlockingIncident];

  [(MKTransitIncidentSymbolImageCell *)self _configureWithMessage:v14 referenceDate:v12 lastUpdated:v16 incidentIsBlocking:v15 shouldShowImage:v8 inSiri:v7];
}

- (void)configureWithIncidentMessage:(id)a3 referenceDate:(id)a4 shouldShowImage:(BOOL)a5 inSiri:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 transitIncidents];
  uint64_t v13 = [v12 count];

  if (v13 == 1)
  {
    id v14 = [v10 transitIncidents];
    uint64_t v15 = [v14 firstObject];
    [(MKTransitIncidentSymbolImageCell *)self configureWithIncident:v15 referenceDate:v11 shouldShowImage:v7 inSiri:v6];
  }
  else
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    id v16 = [v10 transitIncidents];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __102__MKTransitIncidentSymbolImageCell_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke;
    v18[3] = &unk_1E54BBEE8;
    v18[4] = &v19;
    [v16 enumerateObjectsUsingBlock:v18];

    v17 = [v10 routingMessage];
    [(MKTransitIncidentSymbolImageCell *)self _configureWithMessage:v17 referenceDate:0 lastUpdated:0 incidentIsBlocking:*((unsigned __int8 *)v20 + 24) shouldShowImage:v7 inSiri:v6];

    _Block_object_dispose(&v19, 8);
  }
}

uint64_t __102__MKTransitIncidentSymbolImageCell_configureWithIncidentMessage_referenceDate_shouldShowImage_inSiri___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isBlockingIncident];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)_configureWithMessage:(id)a3 referenceDate:(id)a4 lastUpdated:(id)a5 incidentIsBlocking:(BOOL)a6 shouldShowImage:(BOOL)a7 inSiri:(BOOL)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v11 = (__CFString *)a3;
  id v12 = objc_alloc_init(MKTransitIncidentViewModel);
  id v14 = v12;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = &stru_1ED919588;
  }
  [(MKTransitIncidentViewModel *)v12 setMessage:v13];

  [(MKTransitIncidentViewModel *)v14 setBlocking:v9];
  [(MKTransitIncidentViewModel *)v14 setShowImage:v8];
  [(MKTransitIncidentSymbolImageCell *)self setViewModel:v14];
}

- (void)_updateAppearance
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F42B58] cellConfiguration];
  v4 = [(MKTransitIncidentViewModel *)self->_viewModel message];
  [v3 setText:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F42670]);
  LODWORD(v6) = 1058642330;
  [v5 setHyphenationFactor:v6];
  id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
  BOOL v8 = [(MKTransitIncidentViewModel *)self->_viewModel message];
  uint64_t v9 = *MEMORY[0x1E4F42540];
  v24[0] = v5;
  uint64_t v10 = *MEMORY[0x1E4F42508];
  v23[0] = v9;
  v23[1] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F42A30], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E4F438C8]);
  v24[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  uint64_t v13 = (void *)[v7 initWithString:v8 attributes:v12];
  [v3 setAttributedText:v13];

  if ([(MKTransitIncidentViewModel *)self->_viewModel showImage])
  {
    id v14 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v15 = [(MKTransitIncidentViewModel *)self->_viewModel symbolName];
    id v16 = [v14 systemImageNamed:v15];
    v17 = [v16 imageWithRenderingMode:1];
    v18 = [(MKTransitIncidentViewModel *)self->_viewModel symbolColor];
    uint64_t v19 = [v17 imageWithTintColor:v18];
    [v3 setImage:v19];
  }
  [(MKTransitIncidentSymbolImageCell *)self setAccessoryType:1];
  [(MKTransitIncidentSymbolImageCell *)self setContentConfiguration:v3];
  if (!self->_backgroundView)
  {
    v20 = objc_alloc_init(MKTransitIncidentItemCellBackgroundView);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v20;

    [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setPosition:2];
    [(MKTransitIncidentSymbolImageCell *)self setBackgroundView:self->_backgroundView];
  }
  char v22 = [(MKTransitIncidentViewModel *)self->_viewModel backgroundColor];
  [(MKTransitIncidentItemCellBackgroundView *)self->_backgroundView setFillColor:v22];
}

- (BOOL)padBottom
{
  return self->_padBottom;
}

- (void)setPadBottom:(BOOL)a3
{
  self->_padBottom = a3;
}

- (int64_t)cellPosition
{
  return self->_cellPosition;
}

- (void)setCellPosition:(int64_t)a3
{
  self->_cellPosition = a3;
}

- (MKTransitIncidentViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end