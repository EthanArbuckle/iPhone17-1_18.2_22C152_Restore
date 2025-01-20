@interface _CNFilteringResponsePreparer
- (_CNFilteringResponsePreparer)initWithResponsePreparer:(id)a3 delegate:(id)a4 filter:(id)a5;
- (id)filter;
- (id)prepareResults:(id)a3 forFetch:(id)a4;
@end

@implementation _CNFilteringResponsePreparer

- (_CNFilteringResponsePreparer)initWithResponsePreparer:(id)a3 delegate:(id)a4 filter:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CNFilteringResponsePreparer;
  v9 = [(_CNAutocompleteResponsePreparerDecorator *)&v14 initWithResponsePreparer:a3 delegate:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id filter = v9->_filter;
    v9->_id filter = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (id)prepareResults:(id)a3 forFetch:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CNFilteringResponsePreparer *)self filter];
  v9 = objc_msgSend(v7, "_cn_filter:", v8);

  uint64_t v10 = CNALoggingContextDebug();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = [v9 count];
    if (v11 < 0x1F5) {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu", v11, v17);
    }
    else {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"first %lu of %lu", 500, v11);
    }
    v13 = objc_msgSend(v9, "_cn_take:", 500);
    *(_DWORD *)buf = 138543619;
    v19 = v12;
    __int16 v20 = 2113;
    v21 = v13;
    _os_log_impl(&dword_1BEF57000, v10, OS_LOG_TYPE_DEFAULT, "Filtered results: (%{public}@): %{private}@", buf, 0x16u);
  }
  objc_super v14 = [(_CNAutocompleteResponsePreparerDecorator *)self preparer];
  v15 = [v14 prepareResults:v9 forFetch:v6];

  return v15;
}

- (id)filter
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
}

@end