@interface COInterestTracker
- (BOOL)canDispatchWithPrimary:(BOOL)a3;
- (BOOL)primaryAvailable;
- (BOOL)triggerReset;
- (COClusterMember)secondary;
- (COHomeKitAccessoryMemento)accessory;
- (COInterestTracker)initWithAccessory:(id)a3 delegate:(id)a4 primaryAvailable:(BOOL)a5 secondary:(id)a6;
- (COInterestTrackerDelegate)delegate;
- (NSSet)interests;
- (unint64_t)_nextInterestSerial;
- (unint64_t)interestsSerial;
- (unint64_t)remoteInterests;
- (void)_checkTriggerReset;
- (void)_setInterest:(id)a3;
- (void)setInterests:(id)a3;
- (void)setInterestsSerial:(unint64_t)a3;
- (void)setPrimaryAvailable:(BOOL)a3;
- (void)setRemoteInterests:(unint64_t)a3;
- (void)setSecondary:(id)a3;
- (void)setTriggerReset:(BOOL)a3;
@end

@implementation COInterestTracker

- (void)_checkTriggerReset
{
  if ([(COInterestTracker *)self triggerReset])
  {
    [(COInterestTracker *)self setTriggerReset:0];
    uint64_t v3 = [(COInterestTracker *)self delegate];
    if (v3)
    {
      v4 = (void *)v3;
      if (objc_opt_respondsToSelector()) {
        [v4 interestTrackerTriggerReset:self];
      }
    }
    MEMORY[0x270F9A790]();
  }
}

- (unint64_t)_nextInterestSerial
{
  unint64_t v3 = [(COInterestTracker *)self interestsSerial] + 1;
  [(COInterestTracker *)self setInterestsSerial:v3];
  return v3;
}

- (void)_setInterest:(id)a3
{
  id v4 = a3;
  v5 = [(COInterestTracker *)self _nextInterestSerial];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __34__COInterestTracker__setInterest___block_invoke;
  v13 = &unk_2645CD448;
  objc_copyWeak(v15, &location);
  v15[1] = v5;
  id v6 = v4;
  id v14 = v6;
  v7 = (void *)MEMORY[0x223C8B4A0](&v10);
  v8 = [(COInterestTracker *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = [(COInterestTracker *)self secondary];
    [v8 interestTracker:self setInterests:v6 forMember:v9 callback:v7];
  }
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

uint64_t __34__COInterestTracker__setInterest___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id WeakRetained = (id)[WeakRetained interestsSerial];
    id v5 = v7;
    if (WeakRetained == *(id *)(a1 + 48))
    {
      id WeakRetained = (id)[*(id *)(a1 + 32) count];
      id v5 = v7;
      if (WeakRetained)
      {
        if (a2)
        {
          id WeakRetained = (id)[v7 setTriggerReset:0];
        }
        else
        {
          [v7 setRemoteInterests:*(void *)(a1 + 48)];
          id WeakRetained = (id)[v7 _checkTriggerReset];
        }
        id v5 = v7;
      }
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v5);
}

- (void)setInterests:(id)a3
{
  id v10 = a3;
  id v4 = [(COInterestTracker *)self interests];
  char v5 = [v4 isEqualToSet:v10];

  if ((v5 & 1) == 0)
  {
    id v6 = (NSSet *)[v10 copy];
    interests = self->_interests;
    self->_interests = v6;

    if (![(COInterestTracker *)self primaryAvailable])
    {
      v8 = [(COInterestTracker *)self secondary];

      if (v8)
      {
        v9 = [(COInterestTracker *)self interests];
        [(COInterestTracker *)self _setInterest:v9];
      }
    }
  }
}

- (void)setPrimaryAvailable:(BOOL)a3
{
  if (self->_primaryAvailable != a3)
  {
    BOOL v3 = a3;
    self->_primaryAvailable = a3;
    char v5 = [(COInterestTracker *)self secondary];

    if (v5)
    {
      if (v3)
      {
        id v6 = [MEMORY[0x263EFFA08] set];
        [(COInterestTracker *)self _setInterest:v6];

        [(COInterestTracker *)self _checkTriggerReset];
      }
      else
      {
        [(COInterestTracker *)self setTriggerReset:1];
        id v7 = [(COInterestTracker *)self interests];
        [(COInterestTracker *)self _setInterest:v7];
      }
    }
  }
}

- (void)setSecondary:(id)a3
{
  unint64_t v5 = (unint64_t)a3;
  uint64_t secondary = (uint64_t)self->_secondary;
  unint64_t v8 = v5;
  if (v5 && secondary)
  {
    uint64_t secondary = [(id)secondary isEqual:secondary];
    unint64_t v5 = v8;
    if (secondary) {
      goto LABEL_11;
    }
  }
  else if (!(v5 | secondary))
  {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->_secondary, a3);
  uint64_t secondary = [(COInterestTracker *)self primaryAvailable];
  unint64_t v5 = v8;
  if ((secondary & 1) == 0)
  {
    if (v8)
    {
      id v7 = [(COInterestTracker *)self interests];
      [(COInterestTracker *)self _setInterest:v7];
    }
    else
    {
      [(COInterestTracker *)self _nextInterestSerial];
      uint64_t secondary = [(COInterestTracker *)self setTriggerReset:0];
    }
    unint64_t v5 = v8;
  }
LABEL_11:
  MEMORY[0x270F9A758](secondary, v5);
}

- (COInterestTracker)initWithAccessory:(id)a3 delegate:(id)a4 primaryAvailable:(BOOL)a5 secondary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)COInterestTracker;
  id v14 = [(COInterestTracker *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accessory, a3);
    objc_storeWeak((id *)&v15->_delegate, v12);
    v15->_primaryAvailable = a5;
    objc_storeStrong((id *)&v15->_secondary, a6);
    v16 = (NSSet *)objc_alloc_init(MEMORY[0x263EFFA08]);
    interests = v15->_interests;
    v15->_interests = v16;

    *(_OWORD *)&v15->_remoteInterests = xmmword_22188FF30;
  }

  return v15;
}

- (BOOL)canDispatchWithPrimary:(BOOL)a3
{
  if ([(COInterestTracker *)self primaryAvailable])
  {
    if (!a3)
    {
      unint64_t v5 = [(COInterestTracker *)self secondary];
      BOOL v6 = v5 != 0;

      return v6;
    }
    return 1;
  }
  id v7 = [(COInterestTracker *)self secondary];

  if (!v7) {
    return 0;
  }
  unint64_t v8 = [(COInterestTracker *)self interestsSerial];
  if (v8 == [(COInterestTracker *)self remoteInterests]) {
    return 1;
  }
  return [(COInterestTracker *)self triggerReset];
}

- (COHomeKitAccessoryMemento)accessory
{
  return self->_accessory;
}

- (NSSet)interests
{
  return self->_interests;
}

- (BOOL)primaryAvailable
{
  return self->_primaryAvailable;
}

- (COClusterMember)secondary
{
  return self->_secondary;
}

- (COInterestTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COInterestTrackerDelegate *)WeakRetained;
}

- (BOOL)triggerReset
{
  return self->_triggerReset;
}

- (void)setTriggerReset:(BOOL)a3
{
  self->_triggerReset = a3;
}

- (unint64_t)remoteInterests
{
  return self->_remoteInterests;
}

- (void)setRemoteInterests:(unint64_t)a3
{
  self->_remoteInterests = a3;
}

- (unint64_t)interestsSerial
{
  return self->_interestsSerial;
}

- (void)setInterestsSerial:(unint64_t)a3
{
  self->_interestsSerial = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondary, 0);
  objc_storeStrong((id *)&self->_interests, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end