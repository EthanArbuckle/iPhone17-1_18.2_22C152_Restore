@interface _GEOGeographicMetadataRequesterDelegateDataBlockAdapter
- (_GEOGeographicMetadataRequesterDelegateDataBlockAdapter)initWithBlock:(id)a3;
- (void)geoGeographicMetadataRequester:(id)a3 failedWithError:(id)a4 forLocation:(id)a5;
- (void)geoGeographicMetadataRequester:(id)a3 resultsDidNotChangeForLocation:(id)a4;
- (void)geoGeographicMetadataRequester:(id)a3 returnedNewResults:(id)a4 forLocation:(id)a5;
- (void)geoGeographicMetadataRequester:(id)a3 skippedLocation:(id)a4;
@end

@implementation _GEOGeographicMetadataRequesterDelegateDataBlockAdapter

- (_GEOGeographicMetadataRequesterDelegateDataBlockAdapter)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOGeographicMetadataRequesterDelegateDataBlockAdapter;
  v5 = [(_GEOGeographicMetadataRequesterDelegateDataBlockAdapter *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)geoGeographicMetadataRequester:(id)a3 resultsDidNotChangeForLocation:(id)a4
{
}

- (void)geoGeographicMetadataRequester:(id)a3 returnedNewResults:(id)a4 forLocation:(id)a5
{
}

- (void)geoGeographicMetadataRequester:(id)a3 failedWithError:(id)a4 forLocation:(id)a5
{
}

- (void)geoGeographicMetadataRequester:(id)a3 skippedLocation:(id)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: How in the world did we skip a location on a single-use requester?", v4, 2u);
  }
}

- (void).cxx_destruct
{
}

@end