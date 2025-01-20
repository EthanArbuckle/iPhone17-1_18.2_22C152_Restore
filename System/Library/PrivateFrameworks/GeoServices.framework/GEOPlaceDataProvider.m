@interface GEOPlaceDataProvider
- (BOOL)isLoading;
- (id)errorHandler;
- (id)finishedHandler;
- (void)dealloc;
- (void)providerDidCancel;
- (void)providerReceivedErrorCode:(int64_t)a3 userInfo:(id)a4;
- (void)providerReceivedResponse:(id)a3 userInfo:(id)a4;
- (void)requestCompleted;
- (void)setErrorHandler:(id)a3;
- (void)setFinishedHandler:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)startRequest:(id)a3 appIdentifier:(id)a4 finished:(id)a5 error:(id)a6;
@end

@implementation GEOPlaceDataProvider

- (void)dealloc
{
  if ([(GEOPlaceDataProvider *)self isLoading]) {
    [(GEOPlaceDataProvider *)self cancelRequest];
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPlaceDataProvider;
  [(GEOPlaceDataProvider *)&v3 dealloc];
}

- (void)requestCompleted
{
  [(GEOPlaceDataProvider *)self setIsLoading:0];
  [(GEOPlaceDataProvider *)self setFinishedHandler:0];

  [(GEOPlaceDataProvider *)self setErrorHandler:0];
}

- (void)startRequest:(id)a3 appIdentifier:(id)a4 finished:(id)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  if ([(GEOPlaceDataProvider *)self isLoading]) {
    [(GEOPlaceDataProvider *)self cancelRequest];
  }
  [(GEOPlaceDataProvider *)self setIsLoading:1];
  [(GEOPlaceDataProvider *)self setFinishedHandler:v11];

  [(GEOPlaceDataProvider *)self setErrorHandler:v10];
  [(GEOPlaceDataProvider *)self startProviderWithRequest:v13 appIdentifier:v12];
}

- (void)providerReceivedResponse:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  v5 = [(GEOPlaceDataProvider *)self finishedHandler];

  if (v5)
  {
    v6 = [(GEOPlaceDataProvider *)self finishedHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
  [(GEOPlaceDataProvider *)self requestCompleted];
}

- (void)providerReceivedErrorCode:(int64_t)a3 userInfo:(id)a4
{
  id v9 = a4;
  v6 = [(GEOPlaceDataProvider *)self errorHandler];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:a3 userInfo:v9];
    v8 = [(GEOPlaceDataProvider *)self errorHandler];
    ((void (**)(void, void *))v8)[2](v8, v7);
  }
  [(GEOPlaceDataProvider *)self requestCompleted];
}

- (void)providerDidCancel
{
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (id)finishedHandler
{
  return self->_finishedHandler;
}

- (void)setFinishedHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);

  objc_storeStrong(&self->_finishedHandler, 0);
}

@end