@interface NavdDoomCachedIncidentsFilter
- (BOOL)shouldPresentAlertForDestination:(id)a3;
- (NavdDoomCachedIncidentsFilter)initWithDoomStorage:(id)a3;
@end

@implementation NavdDoomCachedIncidentsFilter

- (NavdDoomCachedIncidentsFilter)initWithDoomStorage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NavdDoomCachedIncidentsFilter;
  v6 = [(NavdDoomCachedIncidentsFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (BOOL)shouldPresentAlertForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(NavdDoomStorage *)self->_storage cachedIncidents];
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = [(NavdDoomStorage *)self->_storage newIncidentsForDestination:v4];
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v7 count];
      v10 = [v4 uniqueIdentifier];
      int v13 = 134218498;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found %lu new incidents=%@ for desinationID=%@", (uint8_t *)&v13, 0x20u);
    }
    BOOL v11 = [v7 count] != 0;
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end