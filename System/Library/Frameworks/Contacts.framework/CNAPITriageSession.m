@interface CNAPITriageSession
- (CNAPITriageLogger)logger;
- (CNAPITriageSession)init;
- (CNAPITriageSession)initWithRequest:(id)a3;
- (CNAPITriageSession)initWithRequest:(id)a3 triageLogger:(id)a4 timeProvider:(id)a5;
- (CNContactFetchRequest)request;
- (CNTimeProvider)timeProvider;
- (id)normalizeCollectionOfContacts:(id)a3;
- (void)addClientCalloutTime:(double)a3;
- (void)close;
- (void)closeWithContacts:(id)a3;
- (void)closeWithContacts:(id)a3 orError:(id)a4;
- (void)closeWithError:(id)a3;
- (void)closeWithResult:(id)a3;
- (void)open;
@end

@implementation CNAPITriageSession

- (CNAPITriageLogger)logger
{
  return (CNAPITriageLogger *)objc_getProperty(self, a2, 8, 1);
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)closeWithContacts:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v4 = [(CNAPITriageSession *)self normalizeCollectionOfContacts:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CNAPITriageLogger *)self->_logger request:self->_request containsContact:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(CNAPITriageSession *)self close];
}

- (void)close
{
  [(CNTimeProvider *)self->_timeProvider timestamp];
  self->_timeSessionEnded = v3;
  double v4 = v3 - self->_timeSessionBegan;
  if (self->_hasClientCalloutTime)
  {
    double v4 = v4 - self->_clientCalloutTime;
    -[CNAPITriageLogger request:spentTimeInClientCode:](self->_logger, "request:spentTimeInClientCode:", self->_request);
  }
  logger = self->_logger;
  request = self->_request;

  [(CNAPITriageLogger *)logger didExecuteFetchRequest:request duration:v4];
}

- (void)open
{
  [(CNTimeProvider *)self->_timeProvider timestamp];
  self->_timeSessionBegan = v3;
  logger = self->_logger;
  request = self->_request;

  [(CNAPITriageLogger *)logger willExecuteFetchRequest:request];
}

- (id)normalizeCollectionOfContacts:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = v6;
  id v8 = v4;
  if (!v7)
  {
    objc_opt_class();
    id v9 = v4;
    if (objc_opt_isKindOfClass()) {
      long long v10 = v9;
    }
    else {
      long long v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      long long v12 = [v11 allValues];
      objc_msgSend(v12, "_cn_flatten");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v9;
      v13 = &unk_1EE0AC668;
      if ([v8 conformsToProtocol:v13]) {
        uint64_t v14 = v8;
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;

      if (!v15)
      {
        v16 = os_log_create("com.apple.contacts", "api-triage");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[CNAPITriageSession normalizeCollectionOfContacts:]((uint64_t)v8, v16);
        }

        id v8 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
  }

  return v8;
}

- (void)closeWithContacts:(id)a3 orError:(id)a4
{
  if (a3) {
    -[CNAPITriageSession closeWithContacts:](self, "closeWithContacts:", a3, a4);
  }
  else {
    [(CNAPITriageSession *)self closeWithError:a4];
  }
}

- (void)addClientCalloutTime:(double)a3
{
  self->_clientCalloutTime = self->_clientCalloutTime + a3;
  self->_hasClientCalloutTime = 1;
}

- (CNAPITriageSession)initWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNContactsLoggerProvider defaultProvider];
  id v6 = [v5 apiTriageLogger];

  id v7 = [MEMORY[0x1E4F5A538] defaultProvider];
  id v8 = [(CNAPITriageSession *)self initWithRequest:v4 triageLogger:v6 timeProvider:v7];

  return v8;
}

- (CNAPITriageSession)initWithRequest:(id)a3 triageLogger:(id)a4 timeProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNAPITriageSession;
  long long v12 = [(CNAPITriageSession *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_logger, a4);
    objc_storeStrong((id *)&v13->_timeProvider, a5);
    v13->_hasClientCalloutTime = 0;
    uint64_t v14 = v13;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

- (CNAPITriageSession)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)closeWithError:(id)a3
{
  [(CNAPITriageLogger *)self->_logger request:self->_request encounteredError:a3];

  [(CNAPITriageSession *)self close];
}

- (void)closeWithResult:(id)a3
{
  id v4 = a3;
  if ([v4 isSuccess])
  {
    id v5 = [v4 value];

    [(CNAPITriageSession *)self closeWithContacts:v5];
  }
  else
  {
    id v5 = [v4 error];

    [(CNAPITriageSession *)self closeWithError:v5];
  }
}

- (CNContactFetchRequest)request
{
  return (CNContactFetchRequest *)objc_getProperty(self, a2, 56, 1);
}

- (void)normalizeCollectionOfContacts:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1909E3000, a2, OS_LOG_TYPE_FAULT, "Session closed with invalid collection of contacts: %@", (uint8_t *)&v2, 0xCu);
}

@end