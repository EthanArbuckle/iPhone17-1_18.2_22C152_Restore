@interface _GEOVLFCrowdsourcingDataCollectionEnabledListener
- (_GEOVLFCrowdsourcingDataCollectionEnabledListener)initWithListener:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation _GEOVLFCrowdsourcingDataCollectionEnabledListener

- (_GEOVLFCrowdsourcingDataCollectionEnabledListener)initWithListener:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_GEOVLFCrowdsourcingDataCollectionEnabledListener;
  v8 = [(_GEOVLFCrowdsourcingDataCollectionEnabledListener *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listener, v6);
    _GEOConfigAddDelegateListenerForKey(GeoServicesConfig_VLFCrowdsourcingDataCollectionEnabled, (uint64_t)off_1E91138D8, v7, v9);
  }

  return v9;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForKey(GEOConfigKey_Invalid, unk_1E91186C0, self);
  v3.receiver = self;
  v3.super_class = (Class)_GEOVLFCrowdsourcingDataCollectionEnabledListener;
  [(_GEOVLFCrowdsourcingDataCollectionEnabledListener *)&v3 dealloc];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_msgSend(WeakRetained, "GEOVLFCrowdsourcingDataCollectionEnabledValueChanged:", GEOConfigGetBOOL(GeoServicesConfig_VLFCrowdsourcingDataCollectionEnabled, (uint64_t)off_1E91138D8));
}

- (void).cxx_destruct
{
}

@end