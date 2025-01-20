@interface MUNearestStationProvider
- (MKMapItem)nearestStation;
- (NSError)nearestStationError;
- (unint64_t)lastRequestedNearestID;
- (void)cancel;
- (void)fetchStationForLineItemIdentifier:(id)a3 completion:(id)a4;
@end

@implementation MUNearestStationProvider

- (void)fetchStationForLineItemIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (v7)
  {
    if ([v6 muid])
    {
      objc_initWeak(&location, self);
      v8 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke;
      v14 = &unk_1E574F878;
      objc_copyWeak(&v17, &location);
      v16 = v7;
      id v15 = v6;
      v9 = [v8 singleLocationUpdateWithHandler:&v11];
      locationOperation = self->_locationOperation;
      self->_locationOperation = v9;

      [(MKLocationManagerOperation *)self->_locationOperation start];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      v7[2](v7);
    }
  }
}

void __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v6)
    {
      (*((void (**)(void))a1[5] + 2))();
    }
    else
    {
      WeakRetained[3] = [a1[4] muid];
      v8 = [MEMORY[0x1E4F30F28] sharedService];
      id v9 = a1[4];
      [v5 coordinate];
      double v11 = v10;
      double v13 = v12;
      v14 = [v8 defaultTraits];
      uint64_t v15 = objc_msgSend(v8, "ticketForNearestTransitStation:coordinate:traits:", v9, v14, v11, v13);
      v16 = (void *)WeakRetained[2];
      WeakRetained[2] = v15;

      id v17 = (void *)WeakRetained[2];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke_2;
      v18[3] = &unk_1E574F5D8;
      objc_copyWeak(&v20, a1 + 6);
      id v19 = a1[5];
      [v17 submitWithHandler:v18 networkActivity:0];

      objc_destroyWeak(&v20);
    }
  }
}

void __73__MUNearestStationProvider_fetchStationForLineItemIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      WeakRetained[3] = 0;
      id v8 = v5;
      id v9 = (void *)v7[5];
      v7[5] = v8;
    }
    else
    {
      double v10 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;

      uint64_t v11 = [v12 firstObject];
      id v9 = (void *)v7[4];
      v7[4] = v11;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)cancel
{
  self->_lastRequestedNearestID = 0;
}

- (unint64_t)lastRequestedNearestID
{
  return self->_lastRequestedNearestID;
}

- (MKMapItem)nearestStation
{
  return self->_nearestStation;
}

- (NSError)nearestStationError
{
  return self->_nearestStationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearestStationError, 0);
  objc_storeStrong((id *)&self->_nearestStation, 0);
  objc_storeStrong((id *)&self->_nearestStationTicket, 0);
  objc_storeStrong((id *)&self->_locationOperation, 0);
}

@end