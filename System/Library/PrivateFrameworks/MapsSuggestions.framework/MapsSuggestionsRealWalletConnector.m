@interface MapsSuggestionsRealWalletConnector
+ (BOOL)isAvailable;
- (BOOL)expressSupportedByPass:(id)a3;
- (MapsSuggestionsRealWalletConnector)init;
- (MapsSuggestionsWalletConnectorDelegate)delegate;
- (NSString)uniqueName;
- (id)defaultPass;
- (id)fieldReader;
- (id)passesOfType:(unint64_t)a3;
- (id)supportedTransitIdsForPass:(id)a3;
- (int64_t)paymentNetworkIdentiferForPass:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListeningForChanges;
- (void)stopListeningForChanges;
@end

@implementation MapsSuggestionsRealWalletConnector

- (id)defaultPass
{
  v2 = [(PKPassLibrary *)self->_passLibrary defaultPaymentPassesWithRemotePasses:0];
  if ([v2 count])
  {
    v3 = [v2 firstObject];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)expressSupportedByPass:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(v3, "devicePaymentApplications", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) supportsExpress])
        {
          GEOFindOrCreateLog();
          v9 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            v10 = [v3 organizationName];
            *(_DWORD *)buf = 138412290;
            v17 = v10;
            _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "%@ card supports express transit", buf, 0xCu);
          }
          BOOL v8 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Found no paymentApplication on the pass that supports express transit", buf, 2u);
  }
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (id)passesOfType:(unint64_t)a3
{
  return [(PKPassLibrary *)self->_passLibrary passesOfType:a3];
}

+ (BOOL)isAvailable
{
  return [MEMORY[0x1E4F84898] isPassLibraryAvailable];
}

- (MapsSuggestionsRealWalletConnector)init
{
  v10.receiver = self;
  v10.super_class = (Class)MapsSuggestionsRealWalletConnector;
  v2 = [(MapsSuggestionsRealWalletConnector *)&v10 init];
  if (v2)
  {
    id v3 = (PKPassLibrary *)objc_alloc_init(MEMORY[0x1E4F84898]);
    passLibrary = v2->_passLibrary;
    v2->_passLibrary = v3;

    uint64_t v5 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v2->_paymentService;
    v2->_paymentService = v5;

    v7 = objc_alloc_init(_RealPKPassFlightFieldReader);
    fieldReader = v2->_fieldReader;
    v2->_fieldReader = (MapsSuggestionsWalletPassFieldReader *)v7;
  }
  return v2;
}

- (void)startListeningForChanges
{
  objc_initWeak(&location, self);
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F87558];
  passLibrary = self->_passLibrary;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MapsSuggestionsRealWalletConnector_startListeningForChanges__block_invoke;
  v7[3] = &unk_1E5CC35B8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  id v6 = (id)[v3 addObserverForName:v4 object:passLibrary queue:0 usingBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__MapsSuggestionsRealWalletConnector_startListeningForChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      v9 = "MapsSuggestionsRealWalletConnector.mm";
      __int16 v10 = 1026;
      int v11 = 65;
      __int16 v12 = 2082;
      long long v13 = "-[MapsSuggestionsRealWalletConnector startListeningForChanges]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }
    id v6 = v7;
    goto LABEL_10;
  }
  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  id v6 = v5;
  if (!v5)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      v9 = "MapsSuggestionsRealWalletConnector.mm";
      __int16 v10 = 1026;
      int v11 = 66;
      __int16 v12 = 2082;
      long long v13 = "-[MapsSuggestionsRealWalletConnector startListeningForChanges]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

    id v6 = 0;
LABEL_10:

    goto LABEL_11;
  }
  [v5 passKitDidChange:WeakRetained];
LABEL_11:
}

- (void)stopListeningForChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F87558] object:0];
}

- (id)fieldReader
{
  return self->_fieldReader;
}

- (id)supportedTransitIdsForPass:(id)a3
{
  id v3 = [a3 devicePrimaryPaymentApplication];
  uint64_t v4 = [v3 supportedTransitNetworkIdentifiers];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (int64_t)paymentNetworkIdentiferForPass:(id)a3
{
  id v3 = [a3 devicePrimaryPaymentApplication];
  int64_t v4 = [v3 paymentNetworkIdentifier];

  return v4;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsWalletConnectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (MapsSuggestionsWalletConnectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_fieldReader, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
}

@end