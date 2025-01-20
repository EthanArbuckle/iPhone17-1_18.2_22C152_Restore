@interface LSDefaultApplicationQueryBackend
- (BOOL)_isApp:(id)a3 defaultForCategory:(unint64_t)a4;
- (LSDefaultApplicationQueryBackend)initWithDatastore:(id)a3 defaultAppEvaluator:(id)a4;
- (id)refreshQueryResultForApplication:(id)a3 category:(unint64_t)a4;
@end

@implementation LSDefaultApplicationQueryBackend

- (LSDefaultApplicationQueryBackend)initWithDatastore:(id)a3 defaultAppEvaluator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSDefaultApplicationQueryBackend;
  v9 = [(LSDefaultApplicationQueryBackend *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_datastore, a3);
    objc_storeStrong((id *)&v10->_defaultAppEvaluator, a4);
  }

  return v10;
}

- (BOOL)_isApp:(id)a3 defaultForCategory:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(LSDefaultApplicationQueryDefaultAppEvaluator *)self->_defaultAppEvaluator URLOfDefaultAppForCategory:a4];
  id v8 = [v6 URL];
  char v9 = [v7 isEqual:v8];

  return v9;
}

- (id)refreshQueryResultForApplication:(id)a3 category:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(LSDefaultApplicationQueryDatastore *)self->_datastore entryForApplication:v6 category:a4];
  id v8 = _LSDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 bundleIdentifier];
    v10 = (void *)v9;
    v11 = "";
    *(_DWORD *)v35 = 136315650;
    if (!v7) {
      v11 = "no ";
    }
    *(void *)&v35[4] = v11;
    __int16 v36 = 2112;
    uint64_t v37 = v9;
    __int16 v38 = 2048;
    unint64_t v39 = a4;
    _os_log_impl(&dword_182959000, v8, OS_LOG_TYPE_DEFAULT, "%sentry for app %@ in category %lu", v35, 0x20u);
  }
  if (v7)
  {
    objc_super v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v7 windowOpenDate];
      *(_DWORD *)v35 = 138412290;
      *(void *)&v35[4] = v13;
      _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "window open date %@", v35, 0xCu);
    }
  }
  v14 = objc_msgSend(MEMORY[0x1E4F1C9C8], "now", *(void *)v35);
  if (!v7
    || ([v7 windowOpenDate],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v14 timeIntervalSinceDate:v15],
        BOOL v17 = v16 < 31536000.0,
        v15,
        !v17))
  {
    BOOL v28 = [(LSDefaultApplicationQueryBackend *)self _isApp:v6 defaultForCategory:a4];
    v24 = [[LSDefaultApplicationQueryEntry alloc] initWithWindowOpenDate:v14 refreshDate:v14 defaultForCategory:v28];
    [(LSDefaultApplicationQueryDatastore *)self->_datastore setEntry:v24 forApplication:v6 category:a4];
    v25 = [[LSDefaultApplicationQueryResult alloc] initWithReferenceDate:v14 didRefresh:1 refreshAfter:0 defaultForCategory:v28];
    v26 = _LSDefaultLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)v35 = 138412546;
    *(void *)&v35[4] = v14;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v25;
    v27 = "opened new window at %@, returning %@";
    goto LABEL_16;
  }
  v18 = [v7 windowOpenDate];
  [v14 timeIntervalSinceDate:v18];
  BOOL v20 = v19 < 3600.0;

  if (v20)
  {
    BOOL v21 = [(LSDefaultApplicationQueryBackend *)self _isApp:v6 defaultForCategory:a4];
    v22 = [LSDefaultApplicationQueryEntry alloc];
    v23 = [v7 windowOpenDate];
    v24 = [(LSDefaultApplicationQueryEntry *)v22 initWithWindowOpenDate:v23 refreshDate:v14 defaultForCategory:v21];

    [(LSDefaultApplicationQueryDatastore *)self->_datastore setEntry:v24 forApplication:v6 category:a4];
    v25 = [[LSDefaultApplicationQueryResult alloc] initWithReferenceDate:v14 didRefresh:1 refreshAfter:0 defaultForCategory:v21];
    v26 = _LSDefaultLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_DWORD *)v35 = 138412546;
    *(void *)&v35[4] = v14;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v25;
    v27 = "refreshed open window at %@, returning %@";
LABEL_16:
    v29 = v26;
    uint32_t v30 = 22;
LABEL_17:
    _os_log_impl(&dword_182959000, v29, OS_LOG_TYPE_DEFAULT, v27, v35, v30);
    goto LABEL_18;
  }
  v32 = [v7 windowOpenDate];
  v24 = [v32 dateByAddingTimeInterval:31536000.0];

  v33 = [LSDefaultApplicationQueryResult alloc];
  v34 = [v7 refreshDate];
  v25 = -[LSDefaultApplicationQueryResult initWithReferenceDate:didRefresh:refreshAfter:defaultForCategory:](v33, "initWithReferenceDate:didRefresh:refreshAfter:defaultForCategory:", v34, 0, v24, [v7 isDefaultForCategory]);

  v26 = _LSDefaultLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412290;
    *(void *)&v35[4] = v25;
    v27 = "stale window, returning %@";
    v29 = v26;
    uint32_t v30 = 12;
    goto LABEL_17;
  }
LABEL_18:

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAppEvaluator, 0);

  objc_storeStrong((id *)&self->_datastore, 0);
}

@end