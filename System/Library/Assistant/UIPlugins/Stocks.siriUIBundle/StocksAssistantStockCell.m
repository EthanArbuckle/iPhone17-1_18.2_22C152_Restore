@interface StocksAssistantStockCell
+ (id)infoAttributes;
- (Stock)stock;
- (StocksAssistantStockCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (StocksAssistantStockSnippetController)snippetController;
- (id)valueForAttribute:(unint64_t)a3;
- (unint64_t)requestType;
- (void)setRequestType:(unint64_t)a3;
- (void)setSnippetController:(id)a3;
- (void)setStock:(id)a3;
- (void)setStockObject:(id)a3;
@end

@implementation StocksAssistantStockCell

+ (id)infoAttributes
{
  v2 = +[StocksBundles getBundle:1];
  v3 = +[UIScreen mainScreen];
  [v3 _referenceBounds];
  if (v4 <= 320.0) {
    CFStringRef v5 = @"marketCapTitleLabelAbbreviated";
  }
  else {
    CFStringRef v5 = @"marketCapTitleLabel";
  }
  v27 = [v2 siriUILocalizedStringForKey:v5 table:@"Localizable"];

  id v21 = objc_alloc((Class)NSArray);
  v25 = +[StocksBundles getBundle:1];
  v19 = [v25 siriUILocalizedStringForKey:@"openTitleLabel" table:@"Localizable"];
  v24 = +[StocksBundles getBundle:1];
  v26 = [v24 siriUILocalizedStringForKey:@"highTitleLabel" table:@"Localizable"];
  v23 = +[StocksBundles getBundle:1];
  v17 = [v23 siriUILocalizedStringForKey:@"lowTitleLabel" table:@"Localizable"];
  v20 = +[StocksBundles getBundle:1];
  v15 = [v20 siriUILocalizedStringForKey:@"volumeTitleLabel" table:@"Localizable"];
  v18 = +[StocksBundles getBundle:1];
  v6 = [v18 siriUILocalizedStringForKey:@"priceEarningsTitleLabel" table:@"Localizable"];
  v16 = +[StocksBundles getBundle:1];
  v7 = [v16 siriUILocalizedStringForKey:@"high52WeekTitleLabel" table:@"Localizable"];
  v8 = +[StocksBundles getBundle:1];
  v9 = [v8 siriUILocalizedStringForKey:@"low52WeekTitleLabel" table:@"Localizable"];
  v10 = +[StocksBundles getBundle:1];
  v11 = [v10 siriUILocalizedStringForKey:@"averageVolumeTitleLabel" table:@"Localizable"];
  v12 = +[StocksBundles getBundle:1];
  v13 = [v12 siriUILocalizedStringForKey:@"yieldTitleLabel" table:@"Localizable"];
  id v22 = objc_msgSend(v21, "initWithObjects:", v19, v26, v17, v15, v6, v27, v7, v9, v11, v13, 0);

  return v22;
}

- (StocksAssistantStockCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)StocksAssistantStockCell;
  double v4 = [(StocksAssistantStockCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  CFStringRef v5 = v4;
  if (v4)
  {
    [(StocksAssistantStockCell *)v4 setClipsToBounds:0];
    [(StocksAssistantStockCell *)v5 setSelectionStyle:0];
  }
  return v5;
}

- (id)valueForAttribute:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 open];
      goto LABEL_13;
    case 1uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 high];
      goto LABEL_13;
    case 2uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 low];
      goto LABEL_13;
    case 3uLL:
      double v4 = [(StocksAssistantStockCell *)self stock];
      uint64_t v7 = [v4 volume];
      goto LABEL_11;
    case 4uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 peRatio];
      goto LABEL_13;
    case 5uLL:
      double v4 = [(StocksAssistantStockCell *)self stock];
      uint64_t v7 = [v4 marketcap];
      goto LABEL_11;
    case 6uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 yearHigh];
      goto LABEL_13;
    case 7uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 yearLow];
      goto LABEL_13;
    case 8uLL:
      double v4 = [(StocksAssistantStockCell *)self stock];
      uint64_t v7 = [v4 averageVolume];
LABEL_11:
      CFStringRef v5 = (void *)v7;
      v8 = +[Stock localizedMagnitudeAbbreviatedStringWithString:v7];
      break;
    case 9uLL:
      double v4 = +[StockDataFormatter sharedDataFormatter];
      CFStringRef v5 = [(StocksAssistantStockCell *)self stock];
      v6 = [v5 dividendYield];
LABEL_13:
      v9 = v6;
      [v6 floatValue];
      v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      v8 = [v4 formattedNumber:v10 withPrecision:2 useGroupSeparator:1];

      break;
    default:
      sub_6D04();
  }

  return v8;
}

- (void)setStockObject:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)Stock) initWithSiriStockObject:v4];

  [(StocksAssistantStockCell *)self setStock:v5];
}

- (StocksAssistantStockSnippetController)snippetController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snippetController);

  return (StocksAssistantStockSnippetController *)WeakRetained;
}

- (void)setSnippetController:(id)a3
{
}

- (Stock)stock
{
  return self->_stock;
}

- (void)setStock:(id)a3
{
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
  objc_storeStrong((id *)&self->_stock, 0);

  objc_destroyWeak((id *)&self->_snippetController);
}

@end