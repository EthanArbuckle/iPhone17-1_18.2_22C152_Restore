@interface _GEOURLStateCapture
- (_GEOURLStateCapture)init;
- (id)captureStatePlistWithHints:(os_state_hints_s *)a3;
- (void)dealloc;
@end

@implementation _GEOURLStateCapture

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  v38[9] = *MEMORY[0x1E4F143B8];
  id v29 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:66];
  unint64_t v3 = 0;
  v4 = @"<null>";
  unint64_t v5 = 0x1E4F28000uLL;
  do
  {
    if (v3 - 23 < 0x2B || v3 <= 0x15 && ((1 << v3) & 0x3DDE27) != 0)
    {
      unint64_t v33 = 0;
      v6 = @"Network Defaults";
      switch(v3)
      {
        case 0uLL:
          break;
        case 1uLL:
          v6 = @"Resource Manifest";
          break;
        case 2uLL:
          v6 = @"Directions";
          break;
        case 5uLL:
          v6 = @"ETA";
          break;
        case 9uLL:
          v6 = @"Search Manifest";
          break;
        case 0xAuLL:
          v6 = @"RAP Submission";
          break;
        case 0xBuLL:
          v6 = @"RAP Status";
          break;
        case 0xCuLL:
          v6 = @"RAP Categories";
          break;
        case 0xEuLL:
          v6 = @"Country Code";
          break;
        case 0xFuLL:
          v6 = @"Location Shift (polynomial)";
          break;
        case 0x10uLL:
          v6 = @"Batch Reverse Geocoder (Legacy)";
          break;
        case 0x12uLL:
          v6 = @"Simple ETA";
          break;
        case 0x13uLL:
          v6 = @"Address Correction Init";
          break;
        case 0x14uLL:
          v6 = @"Address Correction Update";
          break;
        case 0x15uLL:
          v6 = @"Reverse Geocoder Versions";
          break;
        case 0x17uLL:
          v6 = @"Announcements";
          break;
        case 0x18uLL:
          v6 = @"PlaceData Dispatcher";
          break;
        case 0x19uLL:
          v6 = @"RAP Opt-Ins";
          break;
        case 0x1AuLL:
          v6 = @"Experiments";
          break;
        case 0x1BuLL:
          v6 = @"Business Portal Base URL";
          break;
        case 0x1CuLL:
          v6 = @"LogMessage Usage";
          break;
        case 0x1DuLL:
          v6 = @"Spatial Lookup";
          break;
        case 0x1EuLL:
          v6 = @"Realtime Traffic Probe";
          break;
        case 0x1FuLL:
          v6 = @"Batch Traffic Probe";
          break;
        case 0x20uLL:
          v6 = @"LogMessage Usage v3";
          break;
        case 0x21uLL:
          v6 = @"Proactive Routing";
          break;
        case 0x22uLL:
          v6 = @"Background Dispatcher";
          break;
        case 0x23uLL:
          v6 = @"Blue POI";
          break;
        case 0x24uLL:
          v6 = @"Background Reverse Geocoder";
          break;
        case 0x25uLL:
          v6 = @"Image Service";
          break;
        case 0x26uLL:
          v6 = @"WiFi Connection Quality Probe";
          break;
        case 0x27uLL:
          v6 = @"Maps Auth Service Proxy URL";
          break;
        case 0x28uLL:
          v6 = @"Munin Base";
          break;
        case 0x29uLL:
          v6 = @"WiFi Quality Service";
          break;
        case 0x2AuLL:
          v6 = @"RAP V4 Submission";
          break;
        case 0x2BuLL:
          v6 = @"RAP V4 Lookup";
          break;
        case 0x2CuLL:
          v6 = @"Usage v3 for cohort session messages";
          break;
        case 0x2DuLL:
          v6 = @"Usage v3 for long session messages";
          break;
        case 0x2EuLL:
          v6 = @"Usage v3 for short session messages";
          break;
        case 0x2FuLL:
          v6 = @"Usage v3 for sessionless messages";
          break;
        case 0x30uLL:
          v6 = @"Web Module Base";
          break;
        case 0x31uLL:
          v6 = @"WiFi Tile Service";
          break;
        case 0x32uLL:
          v6 = @"Community Token Authentication";
          break;
        case 0x33uLL:
          v6 = @"Maps Authentication for client feature flags URL";
          break;
        case 0x34uLL:
          v6 = @"Address Correction Tagged Location";
          break;
        case 0x35uLL:
          v6 = @"Ratings and Photos Submission URL";
          break;
        case 0x36uLL:
          v6 = @"UGC Log Discard";
          break;
        case 0x37uLL:
          v6 = @"Batch Reverse Geocoder";
          break;
        case 0x38uLL:
          v6 = @"Pressure Probe Data";
          break;
        case 0x39uLL:
          v6 = @"POI Busyness Data";
          break;
        case 0x3AuLL:
          v6 = @"RAP Web Module";
          break;
        case 0x3BuLL:
          v6 = @"Network Selection Harvest Data";
          break;
        case 0x3CuLL:
          v6 = @"Offline Data Batch List";
          break;
        case 0x3DuLL:
          v6 = @"Offline Data Size";
          break;
        case 0x3EuLL:
          v6 = @"Offline Data Download";
          break;
        case 0x3FuLL:
          v6 = @"BCX Dispatcher";
          break;
        case 0x40uLL:
          v6 = @"Connectivity Check";
          break;
        case 0x41uLL:
          v6 = @"CoreLocation KAC";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"Invalid (%d)", v3);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      _recordForType(v3, (uint64_t)&v34);
      int v7 = DWORD2(v34);
      uint64_t v8 = v35;
      uint64_t v9 = _GEOGetURLWithSource(v3, &v33, 1, 0);
      uint64_t v10 = _getValue(v7, v8, 1, 0, 0, 0);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      _recordForType(v3, (uint64_t)&v34);
      GEODefaultsKeyStringForConfigKey(SDWORD2(v34), v35);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      unint64_t v32 = v3;
      v12 = _GEOURLInfoFromActiveTileGroup(v3);
      v13 = v12;
      v37[0] = @"description";
      v37[1] = @"resolved_url";
      v31 = (void *)v9;
      if (v9) {
        uint64_t v14 = v9;
      }
      else {
        uint64_t v14 = (uint64_t)v4;
      }
      v15 = v6;
      v38[0] = v6;
      v38[1] = v14;
      v37[2] = @"manifest_url";
      uint64_t v16 = [v12 url];
      v17 = (void *)v16;
      if (v16) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = (uint64_t)v4;
      }
      v30 = (void *)v10;
      if (v10) {
        uint64_t v19 = v10;
      }
      else {
        uint64_t v19 = (uint64_t)v4;
      }
      v38[2] = v18;
      v38[3] = v19;
      v37[3] = @"config_url";
      v37[4] = @"source";
      v20 = [*(id *)(v5 + 3792) numberWithInteger:v33];
      v38[4] = v20;
      v37[5] = @"source_description";
      v21 = @"Invalid";
      if (v33 <= 7) {
        v21 = off_1E53EB008[v33];
      }
      if (v11) {
        v22 = v11;
      }
      else {
        v22 = v4;
      }
      v38[5] = v21;
      v38[6] = v22;
      v37[6] = @"config_key";
      v37[7] = @"proxied";
      v23 = objc_msgSend(*(id *)(v5 + 3792), "numberWithBool:", objc_msgSend(v13, "useAuthProxy"));
      v38[7] = v23;
      v37[8] = @"mptcp";
      v24 = v4;
      v25 = objc_msgSend(*(id *)(v5 + 3792), "numberWithBool:", objc_msgSend(v13, "supportsMultipathTCP"));
      v38[8] = v25;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:9];
      v27 = unint64_t v26 = v5;
      [v29 setObject:v27 forKeyedSubscript:v15];

      unint64_t v5 = v26;
      v4 = v24;

      unint64_t v3 = v32;
    }
    ++v3;
  }
  while (v3 != 66);

  return v29;
}

- (_GEOURLStateCapture)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GEOURLStateCapture;
  v2 = [(_GEOURLStateCapture *)&v6 init];
  if (v2)
  {
    global_queue = (void *)geo_get_global_queue();
    GEORegisterPListStateCaptureLegacy();

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)_GEOURLStateCapture;
  [(_GEOURLStateCapture *)&v3 dealloc];
}

@end