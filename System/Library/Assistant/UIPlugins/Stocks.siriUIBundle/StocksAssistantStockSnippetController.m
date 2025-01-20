@interface StocksAssistantStockSnippetController
+ (unint64_t)infoTypeFromRequestType:(id)a3;
- (StocksAssistantStockSnippetController)initWithAceObject:(id)a3;
- (double)desiredHeight;
- (double)rowHeight;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)requestType;
- (void)dealloc;
- (void)loadView;
- (void)openStock:(id)a3;
- (void)openStockWebsite:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
@end

@implementation StocksAssistantStockSnippetController

+ (unint64_t)infoTypeFromRequestType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:SAStockRequestTypeOPENValue])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeHIGHValue])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeLOWValue])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeVOLUMEValue])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:SAStockRequestTypePE_RATIOValue])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeMARKET_CAPValue])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeLOW_52WEEKValue])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeHIGH_52WEEKValue])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeRANGE_52WEEKValue])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeAVG_DAILY_VOLUMEValue])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:SAStockRequestTypeDIVIDEND_YIELDValue])
  {
    unint64_t v4 = 9;
  }
  else
  {
    unint64_t v4 = -1;
  }

  return v4;
}

- (StocksAssistantStockSnippetController)initWithAceObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_6C08();
  }
  v38.receiver = self;
  v38.super_class = (Class)StocksAssistantStockSnippetController;
  v5 = [(StocksAssistantStockSnippetController *)&v38 init];
  if (v5
    && ([v4 stocks],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        stocks = v5->_stocks,
        v5->_stocks = (NSArray *)v6,
        stocks,
        [(NSArray *)v5->_stocks count]))
  {
    v8 = [(NSArray *)v5->_stocks objectAtIndex:0];
    v9 = [v8 displayStyle];
    v5->_isCompare = [v9 isEqualToString:SAStockDisplayStyleCOMPAREValue];

    v10 = [v8 requests];
    id v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = [v8 requests];
      requestTypes = v5->_requestTypes;
      v5->_requestTypes = (NSArray *)v12;
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v15 = v5->_requestTypes;
    id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v16)
    {
      id v17 = v16;
      v33 = v8;
      uint64_t v18 = *(void *)v35;
LABEL_9:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * v19);
        v21 = objc_opt_class();
        v22 = [v20 requestType];
        uint64_t v23 = (uint64_t)[v21 infoTypeFromRequestType:v22];

        if (v23 != -1) {
          break;
        }
        if (v17 == (id)++v19)
        {
          id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v17) {
            goto LABEL_9;
          }
          uint64_t v23 = -1;
          break;
        }
      }
      v8 = v33;
    }
    else
    {
      uint64_t v23 = -1;
    }

    [(StocksAssistantStockSnippetController *)v5 setRequestType:v23];
    if ([(NSArray *)v5->_stocks count] >= 2)
    {
      v24 = +[StocksBundles getBundle:1];
      v25 = v24;
      if (v5->_requestType == -1) {
        CFStringRef v26 = @"MARKETS";
      }
      else {
        CFStringRef v26 = @"STOCKS";
      }
      v27 = [v24 siriUILocalizedStringForKey:v26 table:@"Localizable"];
      [(StocksAssistantStockSnippetController *)v5 setTitle:v27];

      [(StocksAssistantStockSnippetController *)v5 setSubtitle:0];
    }
    double v28 = SiriUIPlatterStyle[32];
    double v29 = SiriUIPlatterStyle[34];
    v30 = +[UIDevice currentDevice];
    v31 = (char *)[v30 userInterfaceIdiom];

    if (v31 == (unsigned char *)&dword_0 + 1) {
      [(StocksAssistantStockSnippetController *)v5 setIsFullPadWidth:1];
    }
    -[StocksAssistantStockSnippetController setDefaultViewInsets:](v5, "setDefaultViewInsets:", 0.0, v28, 0.0, v29);
    v14 = v5;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  +[StockManager clearSharedManager];
  +[NetPreferences clearSharedPreferences];
  +[StocksPreferences clearSharedPreferences];
  v3.receiver = self;
  v3.super_class = (Class)StocksAssistantStockSnippetController;
  [(StocksAssistantStockSnippetController *)&v3 dealloc];
}

- (double)rowHeight
{
  objc_super v3 = +[UIDevice currentDevice];
  id v4 = (char *)[v3 userInterfaceIdiom];

  double result = 60.0;
  if (!self->_isCompare) {
    double result = 316.5;
  }
  double v6 = 50.0;
  if (!self->_isCompare) {
    double v6 = 102.0;
  }
  if (v4 != (unsigned char *)&dword_0 + 1) {
    return v6;
  }
  return result;
}

- (double)desiredHeight
{
  [(StocksAssistantStockSnippetController *)self rowHeight];
  return v3 * (double)[(NSArray *)self->_stocks count];
}

- (void)loadView
{
  double v3 = (UITableView *)objc_alloc_init((Class)UITableView);
  tableView = self->_tableView;
  self->_tableView = v3;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v5 = self->_tableView;
  [(StocksAssistantStockSnippetController *)self rowHeight];
  -[UITableView setRowHeight:](v5, "setRowHeight:");
  if (self->_isCompare)
  {
    double v6 = +[UIColor siriui_keylineColor];
    [(UITableView *)self->_tableView setSeparatorColor:v6];

    [(UITableView *)self->_tableView _setMarginWidth:0.0];
  }
  else
  {
    [(UITableView *)self->_tableView setSeparatorStyle:0];
  }
  v7 = self->_tableView;
  v8 = +[UIColor clearColor];
  [(UITableView *)v7 setBackgroundColor:v8];

  [(StocksAssistantStockSnippetController *)self setView:self->_tableView];
  id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"openStock:"];
  [(UITableView *)self->_tableView addGestureRecognizer:v9];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isCompare)
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"StocksCompare"];
    if (v8) {
      goto LABEL_8;
    }
    id v9 = [[StocksAssistantStockListCell alloc] initWithStyle:0 reuseIdentifier:@"StocksCompare"];
  }
  else
  {
    singleStockCell = self->_singleStockCell;
    if (!singleStockCell)
    {
      id v11 = [[StocksAssistantStockDetailCell alloc] initWithStyle:0 reuseIdentifier:0];
      uint64_t v12 = self->_singleStockCell;
      self->_singleStockCell = v11;

      singleStockCell = self->_singleStockCell;
    }
    id v9 = singleStockCell;
  }
  v8 = v9;
LABEL_8:
  stocks = self->_stocks;
  if (self->_isCompare) {
    id v14 = [v7 row];
  }
  else {
    id v14 = 0;
  }
  v15 = [(NSArray *)stocks objectAtIndex:v14];
  [v8 setStockObject:v15];

  objc_msgSend(v8, "setRequestType:", -[StocksAssistantStockSnippetController requestType](self, "requestType"));
  [v8 setSnippetController:self];

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_isCompare) {
    [a4 _setShouldHaveFullLengthBottomSeparator:1];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4) {
    sub_6C34();
  }
  id v7 = v6;
  if (self->_isCompare) {
    int64_t v8 = [(NSArray *)self->_stocks count];
  }
  else {
    int64_t v8 = 1;
  }

  return v8;
}

- (void)openStockWebsite:(id)a3
{
  id v10 = a3;
  if (!self->_singleStockCell) {
    goto LABEL_4;
  }
  id v4 = +[NetPreferences sharedPreferences];
  v5 = [(StocksAssistantStockCell *)self->_singleStockCell stock];
  id v6 = [v4 fullQuoteURLOverrideForStock:v5];

  if (!v6)
  {
    id v7 = [(StocksAssistantStockCell *)self->_singleStockCell stock];
    id v6 = [v7 infoURL];

    if (!v6)
    {
LABEL_4:
      int64_t v8 = +[NetPreferences sharedPreferences];
      id v6 = [v8 backsideLogoURL];
    }
  }
  id v9 = +[UIApplication sharedApplication];
  [v9 openURL:v6];
}

- (void)openStock:(id)a3
{
  if (self->_singleStockCell)
  {
    id v4 = [(NSArray *)self->_stocks objectAtIndex:0];
  }
  else
  {
    tableView = self->_tableView;
    [a3 locationInView:tableView];
    id v6 = -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");
    -[NSArray objectAtIndex:](self->_stocks, "objectAtIndex:", [v6 row]);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v10;
  }
  id v11 = v4;
  id v7 = [v4 symbol];
  int64_t v8 = +[Stock urlForStockSymbol:v7];

  id v9 = +[LSApplicationWorkspace defaultWorkspace];
  [v9 openSensitiveURL:v8 withOptions:0];
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_singleStockCell, 0);
  objc_storeStrong((id *)&self->_requestTypes, 0);
  objc_storeStrong((id *)&self->_stocks, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end