@interface CPSearchTemplate
- (CPSearchTemplate)searchTemplateWithIdentifier:(id)a3 selectedResultWithIdentifier:(id)a4 completionHandler:(id)a5;
- (CPSearchTemplate)searchTemplateWithIdentifier:(id)a3 updateSearchResultsForSearchText:(id)a4 completionResults:(id)a5;
- (NSArray)listItems;
- (id)delegate;
- (id)leadingNavigationBarButtons;
- (id)trailingNavigationBarButtons;
- (void)searchTemplateSearchButtonPressedWithIdentifier:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setLeadingNavigationBarButtons:(id)a3;
- (void)setListItems:(id)a3;
- (void)setTrailingNavigationBarButtons:(id)a3;
@end

@implementation CPSearchTemplate

- (CPSearchTemplate)searchTemplateWithIdentifier:(id)a3 updateSearchResultsForSearchText:(id)a4 completionResults:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke;
  block[3] = &unk_26430AE48;
  block[4] = self;
  id v13 = v7;
  id v9 = v7;
  objc_copyWeak(&v15, &location);
  id v14 = v8;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return result;
}

void __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke_2;
    v7[3] = &unk_26430AE20;
    objc_copyWeak(&v9, (id *)(a1 + 56));
    id v8 = *(id *)(a1 + 48);
    [v4 searchTemplate:v5 updatedSearchText:v6 completionHandler:v7];

    objc_destroyWeak(&v9);
  }
}

void __100__CPSearchTemplate_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setListItems:v4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CPSearchTemplate)searchTemplateWithIdentifier:(id)a3 selectedResultWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_26430AA00;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  return result;
}

void __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "listItems", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v13 + 1) + 8 * v8);
        if ([v9 conformsToProtocol:&unk_26C970E68])
        {
          id v10 = [v9 identifier];
        }
        else
        {
          id v10 = 0;
        }

        if ([*(id *)(a1 + 40) isEqual:v10]) {
          break;
        }

        if (v6 == ++v8)
        {
          uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      v11 = v9;

      if (!v11) {
        goto LABEL_16;
      }
      v12 = [*(id *)(a1 + 32) delegate];
      [v12 searchTemplate:*(void *)(a1 + 32) selectedResult:v11 completionHandler:*(void *)(a1 + 48)];
    }
    else
    {
LABEL_13:

LABEL_16:
      v11 = CarPlayFrameworkGeneralLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke_cold_1(a1, v11);
      }
    }
  }
}

- (void)searchTemplateSearchButtonPressedWithIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = self;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "Search template search button pressed: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke;
  block[3] = &unk_264309D80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = CarPlayFrameworkGeneralLogging();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "Search Template Delegate will handle search button pressed", v6, 2u);
    }

    uint64_t v5 = [*(id *)(a1 + 32) delegate];
    [v5 searchTemplateSearchButtonPressed:*(void *)(a1 + 32)];
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke_cold_1(v5);
  }
}

- (id)leadingNavigationBarButtons
{
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
}

- (id)trailingNavigationBarButtons
{
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void)setListItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItems, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __96__CPSearchTemplate_searchTemplateWithIdentifier_selectedResultWithIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2181A5000, a2, OS_LOG_TYPE_ERROR, "Failed to find a local item for %@", (uint8_t *)&v3, 0xCu);
}

void __68__CPSearchTemplate_searchTemplateSearchButtonPressedWithIdentifier___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2181A5000, log, OS_LOG_TYPE_ERROR, "Search Template Delegate does not handle search button pressed", v1, 2u);
}

@end