@interface NavdDoomAlertFilters
- (BOOL)shouldPresentAlertForDestination:(id)a3;
- (NavdDoomAlertFilters)initWithDoomStorage:(id)a3;
@end

@implementation NavdDoomAlertFilters

- (NavdDoomAlertFilters)initWithDoomStorage:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NavdDoomAlertFilters;
  v5 = [(NavdDoomAlertFilters *)&v11 init];
  if (v5)
  {
    v6 = [[NavdDoomCachedIncidentsFilter alloc] initWithDoomStorage:v4];
    v7 = objc_alloc_init(NavdDoomNavigationStateFilter);
    v12[0] = v6;
    v12[1] = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:v12 count:2];
    filters = v5->_filters;
    v5->_filters = (NSArray *)v8;
  }
  return v5;
}

- (BOOL)shouldPresentAlertForDestination:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_filters;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v10, "shouldPresentAlertForDestination:", v4, (void)v16) & 1) == 0)
        {
          v13 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v14 = [v4 undecoratedTitle];
            *(_DWORD *)buf = 138412546;
            v21 = v10;
            __int16 v22 = 2112;
            v23 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ prevented alert for destination \"%@\" from being presented", buf, 0x16u);
          }
          BOOL v12 = 0;
          goto LABEL_15;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  GEOFindOrCreateLog();
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEBUG))
  {
    objc_super v11 = [v4 undecoratedTitle];
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_DEBUG, "Alert for destination \"%@\" passed all filters", buf, 0xCu);
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (void).cxx_destruct
{
}

@end