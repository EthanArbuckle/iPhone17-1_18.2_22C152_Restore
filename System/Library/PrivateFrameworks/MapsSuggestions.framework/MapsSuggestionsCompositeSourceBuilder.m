@interface MapsSuggestionsCompositeSourceBuilder
+ (id)buildCompositeSourceFromResourceDepot:(id)a3;
@end

@implementation MapsSuggestionsCompositeSourceBuilder

+ (id)buildCompositeSourceFromResourceDepot:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSourceBuilder.m";
      __int16 v26 = 1024;
      int v27 = 46;
      __int16 v28 = 2082;
      v29 = "+[MapsSuggestionsCompositeSourceBuilder buildCompositeSourceFromResourceDepot:]";
      __int16 v30 = 2082;
      v31 = "nil == (resourceDepot)";
      v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to build from!";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v24, 0x26u);
    }
LABEL_11:
    id v6 = 0;
    goto LABEL_42;
  }
  v5 = [v3 oneSourceDelegate];

  if (!v5)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCompositeSourceBuilder.m";
      __int16 v26 = 1024;
      int v27 = 47;
      __int16 v28 = 2082;
      v29 = "+[MapsSuggestionsCompositeSourceBuilder buildCompositeSourceFromResourceDepot:]";
      __int16 v30 = 2082;
      v31 = "nil == (resourceDepot.oneSourceDelegate)";
      v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires One SourceDelegate";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!+[MapsSuggestionsCompositeSource isEnabled])
  {
    id v6 = 0;
    goto LABEL_43;
  }
  id v6 = [objc_alloc((Class)MapsSuggestionsCompositeSource) initFromResourceDepot:v4];
  [v4 setOneSourceDelegate:v6];
  if (+[MapsSuggestionsCalendarSource isEnabled])
  {
    v7 = [objc_alloc((Class)MapsSuggestionsCalendarSource) initFromResourceDepot:v4];
    [v6 addChildSource:v7];
  }
  else
  {
    v7 = 0;
  }
  if (+[MapsSuggestionsRoutineSource isEnabled])
  {
    v9 = [objc_alloc((Class)MapsSuggestionsRoutineSource) initFromResourceDepot:v4];

    [v6 addChildSource:v9];
    v7 = v9;
  }
  if (+[MapsSuggestionsRatingRequestSource isEnabled]&& (GEOConfigGetBOOL() & 1) == 0)
  {
    v10 = [objc_alloc((Class)MapsSuggestionsRatingRequestSource) initFromResourceDepot:v4];

    [v6 addChildSource:v10];
    v7 = v10;
  }
  if (+[MapsSuggestionsMapsSyncSource isEnabled])
  {
    v11 = [objc_alloc((Class)MapsSuggestionsMapsSyncSource) initFromResourceDepot:v4];

    [v6 addChildSource:v11];
    v7 = v11;
  }
  if (+[MapsSuggestionsPortraitSource isEnabled])
  {
    v12 = [[MapsSuggestionsPortraitSource alloc] initFromResourceDepot:v4];

    [v6 addChildSource:v12];
    v7 = v12;
  }
  if (+[MapsSuggestionsAppConnectionSource isEnabled])
  {
    v13 = [[MapsSuggestionsAppConnectionSource alloc] initFromResourceDepot:v4];

    [v6 addChildSource:v13];
    v7 = v13;
  }
  if (+[MapsSuggestionsContactActivitySource isEnabled])
  {
    v14 = [objc_alloc((Class)MapsSuggestionsContactActivitySource) initFromResourceDepot:v4];

    [v6 addChildSource:v14];
    v7 = v14;
  }
  if (+[MapsSuggestionsWalletSource isEnabled])
  {
    v15 = [[MapsSuggestionsWalletSource alloc] initFromResourceDepot:v4];

    [v6 addChildSource:v15];
    v7 = v15;
  }
  if (isFinanceSourceEnabled())
  {
    uint64_t v16 = financeSourceFromResourceDepot();

    [v6 addChildSource:v16];
    v7 = v16;
  }
  if (+[MapsSuggestionsReservationsSource isEnabled])
  {
    v17 = [[MapsSuggestionsReservationsSource alloc] initFromResourceDepot:v4];

    [v6 addChildSource:v17];
    v7 = v17;
  }
  if (+[MapsSuggestionsVirtualGarageSource isEnabled])
  {
    v18 = [objc_alloc((Class)MapsSuggestionsVirtualGarageSource) initFromResourceDepot:v4];

    [v6 addChildSource:v18];
    v7 = v18;
  }
  if (+[MapsSuggestionsCarPlaySource isEnabled])
  {
    v19 = [[MapsSuggestionsCarPlaySource alloc] initFromResourceDepot:v4];

    [v6 addChildSource:v19];
    v7 = v19;
  }
  if (+[MapsSuggestionsReInjectSource isEnabled])
  {
    v20 = [objc_alloc((Class)MapsSuggestionsReInjectSource) initFromResourceDepot:v4];

    [v6 addChildSource:v20];
    v7 = v20;
  }
  v21 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = [v6 children];
    int v24 = 138412290;
    v25 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Instantiating compositeSource with childSources: %@", (uint8_t *)&v24, 0xCu);
  }
LABEL_42:

LABEL_43:
  return v6;
}

@end