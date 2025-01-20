@interface MapsSuggestionsDestinationLink
- (BOOL)addBreadCrumbIfWithin:(id)a3;
- (BOOL)hasLinkOptions;
- (BOOL)isEqual:(id)a3;
- (MapsSuggestionsDestination)from;
- (MapsSuggestionsDestination)to;
- (NSMutableArray)breadcrumbs;
- (NSMutableArray)destinationLinkOptions;
- (NSString)description;
- (double)confidenceOfHavingBeenOnDestinationLink;
- (double)containsLocation:(id)a3;
- (double)containsTime:(id)a3;
- (id)initFromDestination:(id)a3 toDestination:(id)a4;
- (id)nameForJSON;
- (id)objectForJSON;
- (void)addETA:(id)a3;
- (void)addLinkOption:(id)a3;
- (void)addRoute:(id)a3;
- (void)setBreadcrumbs:(id)a3;
- (void)setDestinationLinkOptions:(id)a3;
- (void)setFrom:(id)a3;
- (void)setTo:(id)a3;
@end

@implementation MapsSuggestionsDestinationLink

- (id)initFromDestination:(id)a3 toDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsDestinationLink;
  v8 = [(MapsSuggestionsDestinationLink *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_from, v6);
    objc_storeWeak((id *)&v9->_to, v7);
    v10 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    destinationLinkOptions = v9->_destinationLinkOptions;
    v9->_destinationLinkOptions = v10;

    v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    breadcrumbs = v9->_breadcrumbs;
    v9->_breadcrumbs = v12;
  }
  return v9;
}

- (void)addLinkOption:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self->_destinationLinkOptions;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_destinationLinkOptions addObject:v4];
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationLink.mm";
      __int16 v9 = 1024;
      int v10 = 39;
      __int16 v11 = 2082;
      v12 = "-[MapsSuggestionsDestinationLink addLinkOption:]";
      __int16 v13 = 2082;
      v14 = "nil == (linkOption)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a linkOption", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)addETA:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self->_destinationLinkOptions;
    objc_sync_enter(v5);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_destinationLinkOptions;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "updateETA:", v4, (void)v10)) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      id v6 = [[MapsSuggestionsDestinationLinkOption alloc] initWithETA:v4];
      [(MapsSuggestionsDestinationLink *)self addLinkOption:v6];
    }

    objc_sync_exit(v5);
  }
  else
  {
    GEOFindOrCreateLog();
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationLink.mm";
      __int16 v17 = 1024;
      int v18 = 47;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsDestinationLink addETA:]";
      __int16 v21 = 2082;
      v22 = "nil == (eta)";
      _os_log_impl((void *)&_mh_execute_header, &v5->super.super, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires ETA", buf, 0x26u);
    }
  }
}

- (void)addRoute:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self->_destinationLinkOptions;
    objc_sync_enter(v5);
    id v6 = [[MapsSuggestionsDestinationLinkOption alloc] initWithRoute:v4];
    [(MapsSuggestionsDestinationLink *)self addLinkOption:v6];

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136446978;
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationLink.mm";
      __int16 v10 = 1024;
      int v11 = 65;
      __int16 v12 = 2082;
      long long v13 = "-[MapsSuggestionsDestinationLink addRoute:]";
      __int16 v14 = 2082;
      objc_super v15 = "nil == (route)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a route", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (BOOL)addBreadCrumbIfWithin:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self->_breadcrumbs;
    objc_sync_enter(v5);
    id v6 = [v4 location];
    [(MapsSuggestionsDestinationLink *)self containsLocation:v6];
    double v8 = v7;
    MapsSuggestionsConfidenceLevelFromPrecent(0.75);
    double v10 = v9;

    if (v8 > v10)
    {
      [(NSMutableArray *)self->_breadcrumbs addObject:v4];
      objc_sync_exit(v5);

      BOOL v12 = 1;
      goto LABEL_9;
    }
    objc_sync_exit(v5);
  }
  else
  {
    int v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136446978;
      objc_super v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationLink.mm";
      __int16 v16 = 1024;
      int v17 = 74;
      __int16 v18 = 2082;
      __int16 v19 = "-[MapsSuggestionsDestinationLink addBreadCrumbIfWithin:]";
      __int16 v20 = 2082;
      __int16 v21 = "nil == (breadcrumb)";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a breadcrumb", (uint8_t *)&v14, 0x26u);
    }
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

- (double)containsLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = MapsSuggestionsConfidenceDontKnow();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v6 = self->_destinationLinkOptions;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v55;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v55 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v54 + 1) + 8 * i) containsLocation:v4];
          double v5 = MapsSuggestionsBestConfidence(v5, v10);
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v7);
    }

    if (v5 == MapsSuggestionsConfidenceDontKnow())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_from);
      id v12 = objc_loadWeakRetained((id *)&self->_to);
      if (WeakRetained)
      {
        long long v13 = [WeakRetained location];
        BOOL v14 = v13 == 0;

        if (v12) {
          char v15 = v14;
        }
        else {
          char v15 = 1;
        }
        if ((v15 & 1) == 0)
        {
          __int16 v16 = [v12 location];
          BOOL v17 = v16 == 0;

          if (!v17)
          {
            [v4 coordinate];
            double v19 = v18;
            __int16 v20 = [WeakRetained location];
            double v53 = v19;
            [v20 coordinate];
            double v52 = v21;

            [v4 coordinate];
            double v23 = v22;
            v24 = [v12 location];
            double v51 = v23;
            [v24 coordinate];
            double v50 = v25;

            v26 = [v12 location];
            [v26 coordinate];
            double v28 = v27;
            v29 = [WeakRetained location];
            [v29 coordinate];
            double v31 = v30;

            [v4 coordinate];
            double v33 = v32;
            v34 = [WeakRetained location];
            [v34 coordinate];
            double v36 = v35;

            [v4 coordinate];
            double v38 = v37;
            v39 = [v12 location];
            [v39 coordinate];
            double v41 = v40;

            v42 = [v12 location];
            [v42 coordinate];
            double v44 = v43;
            v45 = [WeakRetained location];
            [v45 coordinate];
            double v47 = v46;

            double v48 = sqrt((v44 - v47) * (v44 - v47) + (v28 - v31) * (v28 - v31))
                / (sqrt((v33 - v36) * (v33 - v36) + (v53 - v52) * (v53 - v52))
                 + sqrt((v38 - v41) * (v38 - v41) + (v51 - v50) * (v51 - v50)))
                * 2.0
                + -1.0;
            if (v48 <= 0.0) {
              double v5 = MapsSuggestionsConfidenceDefinitelyFalse();
            }
            else {
              double v5 = v48 * MapsSuggestionsConfidenceDefinitelyTrue();
            }
          }
        }
      }
    }
  }
  else
  {
    double v5 = MapsSuggestionsConfidenceDontKnow();
  }

  return v5;
}

- (double)containsTime:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = MapsSuggestionsConfidenceDontKnow();
    id v6 = self->_destinationLinkOptions;
    objc_sync_enter(v6);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = self->_destinationLinkOptions;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "containsTime:", v4, (void)v13);
          double v5 = MapsSuggestionsBestConfidence(v5, v11);
        }
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    objc_sync_exit(v6);
  }
  else
  {
    double v5 = MapsSuggestionsConfidenceDontKnow();
  }

  return v5;
}

- (double)confidenceOfHavingBeenOnDestinationLink
{
  v3 = self->_breadcrumbs;
  objc_sync_enter(v3);
  id v4 = [(NSMutableArray *)self->_breadcrumbs count];
  if (v4)
  {
    if (v4 == (id)1) {
      double v5 = MapsSuggestionsConfidenceDontKnow();
    }
    else {
      double v5 = MapsSuggestionsConfidenceDefinitelyTrue();
    }
  }
  else
  {
    double v5 = MapsSuggestionsConfidenceDefinitelyFalse();
  }
  double v6 = v5;
  objc_sync_exit(v3);

  return v6;
}

- (BOOL)hasLinkOptions
{
  v2 = self;
  v3 = self->_destinationLinkOptions;
  objc_sync_enter(v3);
  LOBYTE(v2) = [(NSMutableArray *)v2->_destinationLinkOptions count] != 0;
  objc_sync_exit(v3);

  return (char)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MapsSuggestionsDestinationLink *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(MapsSuggestionsDestinationLink *)self from];
      if (!v5)
      {
        GEOFindOrCreateLog();
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136446722;
          long long v16 = "MapsSuggestionsDestinationLink.mm";
          __int16 v17 = 1026;
          int v18 = 175;
          __int16 v19 = 2082;
          __int16 v20 = "-[MapsSuggestionsDestinationLink isEqual:]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: lhsFrom went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
        }
        BOOL v12 = 0;
        id v7 = v8;
        goto LABEL_31;
      }
      uint64_t v6 = [(MapsSuggestionsDestinationLink *)v4 from];
      id v7 = (void *)v6;
      if (!v6)
      {
        GEOFindOrCreateLog();
        double v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136446722;
          long long v16 = "MapsSuggestionsDestinationLink.mm";
          __int16 v17 = 1026;
          int v18 = 176;
          __int16 v19 = 2082;
          __int16 v20 = "-[MapsSuggestionsDestinationLink isEqual:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: rhsFrom went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
        }
        BOOL v12 = 0;
        id v8 = v10;
        goto LABEL_30;
      }
      if (v5 != (void *)v6 && ([v5 isEqualToDestination:v6] & 1) == 0)
      {
        BOOL v12 = 0;
LABEL_32:

        goto LABEL_33;
      }
      id v8 = [(MapsSuggestionsDestinationLink *)self to];
      if (v8)
      {
        uint64_t v9 = [(MapsSuggestionsDestinationLink *)v4 to];
        double v10 = v9;
        if (v9)
        {
          if (v8 == v9
            || ([v8 isEqualToDestination:v9] & 1) != 0)
          {
            destinationLinkOptions = self->_destinationLinkOptions;
            if (destinationLinkOptions == v4->_destinationLinkOptions
              || -[NSMutableArray isEqualToArray:](destinationLinkOptions, "isEqualToArray:"))
            {
              BOOL v12 = 1;
LABEL_30:

LABEL_31:
              goto LABEL_32;
            }
          }
        }
        else
        {
          GEOFindOrCreateLog();
          long long v13 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            int v15 = 136446722;
            long long v16 = "MapsSuggestionsDestinationLink.mm";
            __int16 v17 = 1026;
            int v18 = 182;
            __int16 v19 = 2082;
            __int16 v20 = "-[MapsSuggestionsDestinationLink isEqual:]";
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: rhsTo went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
          }

          double v10 = 0;
        }
      }
      else
      {
        GEOFindOrCreateLog();
        double v10 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136446722;
          long long v16 = "MapsSuggestionsDestinationLink.mm";
          __int16 v17 = 1026;
          int v18 = 181;
          __int16 v19 = 2082;
          __int16 v20 = "-[MapsSuggestionsDestinationLink isEqual:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: lhsTo went away in %{public}s", (uint8_t *)&v15, 0x1Cu);
        }

        id v8 = 0;
      }
      BOOL v12 = 0;
      goto LABEL_30;
    }
    BOOL v12 = 0;
  }
LABEL_33:

  return v12;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  v11.receiver = self;
  v11.super_class = (Class)MapsSuggestionsDestinationLink;
  id v4 = [(MapsSuggestionsDestinationLink *)&v11 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_from);
  uint64_t v6 = [WeakRetained label];
  id v7 = objc_loadWeakRetained((id *)&self->_to);
  id v8 = [v7 label];
  id v9 = [v3 initWithFormat:@"%@ from '%@' to '%@'", v4, v6, v8];

  return (NSString *)v9;
}

- (id)nameForJSON
{
  return @"link";
}

- (id)objectForJSON
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_from);
  id v4 = objc_loadWeakRetained((id *)&self->_to);
  double v27 = WeakRetained;
  id v5 = objc_alloc((Class)NSString);
  uint64_t v6 = [WeakRetained label];
  id v7 = [v4 label];
  id v28 = [v5 initWithFormat:@"'%@' to '%@'", v6, v7];

  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_breadcrumbs, "count"));
  id v9 = self->_breadcrumbs;
  objc_sync_enter(v9);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v10 = self->_breadcrumbs;
  objc_super v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = MSg::jsonFor();
        [v8 addObject:v14];
      }
      objc_super v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
  id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_destinationLinkOptions, "count"));
  long long v16 = self->_destinationLinkOptions;
  objc_sync_enter(v16);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  __int16 v17 = self->_destinationLinkOptions;
  int v18 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v30;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v17);
        }
        double v21 = MSg::jsonFor();
        [v15 addObject:v21];
      }
      int v18 = (char *)[(NSMutableArray *)v17 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v18);
  }

  objc_sync_exit(v16);
  v37[0] = @"label";
  double v22 = MSg::jsonFor();
  v38[0] = v22;
  v37[1] = @"from";
  double v23 = MSg::jsonFor();
  v38[1] = v23;
  v37[2] = @"to";
  v24 = MSg::jsonFor();
  v38[2] = v24;
  v38[3] = v8;
  v37[3] = @"breadcrumbs";
  v37[4] = @"options";
  v38[4] = v15;
  double v25 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];

  return v25;
}

- (MapsSuggestionsDestination)from
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_from);
  return (MapsSuggestionsDestination *)WeakRetained;
}

- (void)setFrom:(id)a3
{
}

- (MapsSuggestionsDestination)to
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_to);
  return (MapsSuggestionsDestination *)WeakRetained;
}

- (void)setTo:(id)a3
{
}

- (NSMutableArray)destinationLinkOptions
{
  return self->_destinationLinkOptions;
}

- (void)setDestinationLinkOptions:(id)a3
{
}

- (NSMutableArray)breadcrumbs
{
  return self->_breadcrumbs;
}

- (void)setBreadcrumbs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
  objc_storeStrong((id *)&self->_destinationLinkOptions, 0);
  objc_destroyWeak((id *)&self->_to);
  objc_destroyWeak((id *)&self->_from);
}

@end