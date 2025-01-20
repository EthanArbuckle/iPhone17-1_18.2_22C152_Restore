@interface ATXFlightStatusDataSource
- (ATXFlightStatusDataSource)initWithDevice:(id)a3;
- (BOOL)_flightIDIsValid:(id)a3;
- (void)flightStatusForFlight:(id)a3 callback:(id)a4;
@end

@implementation ATXFlightStatusDataSource

- (ATXFlightStatusDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFlightStatusDataSource;
  v6 = [(ATXFlightStatusDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (BOOL)_flightIDIsValid:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"airlineCode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_11:
    v17 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXFlightStatusDataSource _flightIDIsValid:]();
    }
    goto LABEL_22;
  }
  id v5 = [v3 objectForKeyedSubscript:@"airlineCode"];
  int v6 = [v5 isEqualToString:&stru_1F2719D20];

  if (v6) {
    goto LABEL_11;
  }
  v7 = [v3 objectForKeyedSubscript:@"arrivalAirportCode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_14:
    v17 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXFlightStatusDataSource _flightIDIsValid:]();
    }
    goto LABEL_22;
  }
  v8 = [v3 objectForKeyedSubscript:@"arrivalAirportCode"];
  int v9 = [v8 isEqualToString:&stru_1F2719D20];

  if (v9) {
    goto LABEL_14;
  }
  v10 = [v3 objectForKeyedSubscript:@"flightNumber"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_17:
    v17 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXFlightStatusDataSource _flightIDIsValid:]();
    }
    goto LABEL_22;
  }
  v11 = [v3 objectForKeyedSubscript:@"flightNumber"];
  int v12 = [v11 isEqual:&unk_1F27274D0];

  if (v12) {
    goto LABEL_17;
  }
  v13 = [v3 objectForKeyedSubscript:@"expectedDepartureTimestamp"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_20:
    v17 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXFlightStatusDataSource _flightIDIsValid:].cold.4();
    }
LABEL_22:

    BOOL v16 = 0;
    goto LABEL_23;
  }
  v14 = [v3 objectForKeyedSubscript:@"expectedDepartureTimestamp"];
  int v15 = [v14 isEqual:&unk_1F27274D0];

  if (v15) {
    goto LABEL_20;
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)flightStatusForFlight:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXFlightStatusDataSource flightStatusForFlight:callback:]((uint64_t)v6, v8);
  }

  if (![(ATXFlightStatusDataSource *)self _flightIDIsValid:v6])
  {
    BOOL v16 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXFlightStatusDataSource flightStatusForFlight:callback:]();
    }

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    uint64_t v19 = 2048;
    goto LABEL_12;
  }
  if (!objc_opt_class())
  {
    v20 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ATXFlightStatusDataSource flightStatusForFlight:callback:]();
    }

    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    uint64_t v19 = 3328;
LABEL_12:
    v11 = [v17 errorWithDomain:v18 code:v19 userInfo:0];
    v7[2](v7, 0, v11);
    goto LABEL_13;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  v10 = [v6 objectForKeyedSubscript:@"expectedDepartureTimestamp"];
  [v10 doubleValue];
  v11 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");

  int v12 = (void *)[MEMORY[0x1E4F62230] flightFactoryClassWithProvider:*MEMORY[0x1E4F62228]];
  v13 = [v6 objectForKeyedSubscript:@"flightNumber"];
  uint64_t v14 = [v13 unsignedIntegerValue];
  int v15 = [v6 objectForKeyedSubscript:@"airlineCode"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke;
  v21[3] = &unk_1E68A5468;
  v23 = v7;
  id v22 = v6;
  [v12 loadFlightsWithNumber:v14 airlineCode:v15 date:v11 dateType:1 completionHandler:v21];

LABEL_13:
}

void __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6 && [v5 count])
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v9 = v5;
    uint64_t v53 = [v9 countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v53)
    {
      uint64_t v10 = *(void *)v65;
      id v57 = v5;
      uint64_t v58 = a1;
      v56 = v9;
      uint64_t v52 = *(void *)v65;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v65 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v54 = v11;
          int v12 = *(void **)(*((void *)&v64 + 1) + 8 * v11);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          objc_msgSend(v12, "legs", v52);
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v13 = [obj countByEnumeratingWithState:&v60 objects:v74 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v61;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v61 != v15) {
                  objc_enumerationMutation(obj);
                }
                v17 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                uint64_t v18 = [v17 arrival];
                uint64_t v19 = [v18 airport];
                v20 = [v19 IATACode];

                if (v20)
                {
                  v21 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"arrivalAirportCode"];
                  int v22 = [v20 isEqualToString:v21];

                  if (v22)
                  {
                    v23 = [v17 departure];
                    v24 = [v23 time];
                    v25 = [v24 date];

                    v26 = [v17 departure];
                    v27 = [v26 delayFromSchedule];

                    v28 = [v17 arrival];
                    v29 = [v28 time];
                    v30 = [v29 date];

                    v31 = [v17 arrival];
                    v32 = [v31 delayFromSchedule];

                    v33 = [v17 arrival];
                    v34 = [v33 airport];
                    [v34 location];
                    double v36 = v35;
                    double v38 = v37;

                    if (v25 && v27 && v30 && v32)
                    {
                      v72[0] = @"estimatedDepartureTimestamp";
                      v42 = NSNumber;
                      v55 = v25;
                      [v25 timeIntervalSinceReferenceDate];
                      v43 = objc_msgSend(v42, "numberWithDouble:");
                      v73[0] = v43;
                      v73[1] = v27;
                      v72[1] = @"departureDelay";
                      v72[2] = @"arrivalAirport";
                      v73[2] = v20;
                      v72[3] = @"estimatedArrivalTimestamp";
                      v44 = NSNumber;
                      v45 = v30;
                      [v30 timeIntervalSinceReferenceDate];
                      v46 = objc_msgSend(v44, "numberWithDouble:");
                      v73[3] = v46;
                      v73[4] = v32;
                      v72[4] = @"arrivalDelay";
                      v72[5] = @"arrivalAirportLocation";
                      v70[0] = @"lat";
                      v47 = [NSNumber numberWithDouble:v36];
                      v70[1] = @"lon";
                      v71[0] = v47;
                      v48 = [NSNumber numberWithDouble:v38];
                      v71[1] = v48;
                      v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];
                      v73[5] = v49;
                      v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:6];

                      v51 = __atxlog_handle_heuristic();
                      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        v69 = v50;
                        _os_log_impl(&dword_1D0F43000, v51, OS_LOG_TYPE_INFO, "Received metadata about the flight from FlightUtilities. Flight card: %@", buf, 0xCu);
                      }

                      (*(void (**)(void))(*(void *)(v58 + 40) + 16))();
                      id v6 = 0;
                      id v5 = v57;
                      goto LABEL_36;
                    }

                    a1 = v58;
                  }
                }
              }
              uint64_t v14 = [obj countByEnumeratingWithState:&v60 objects:v74 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v54 + 1;
          id v6 = 0;
          id v5 = v57;
          id v9 = v56;
          uint64_t v10 = v52;
        }
        while (v54 + 1 != v53);
        uint64_t v53 = [v56 countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v53);
    }

    v39 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_2();
    }

    uint64_t v40 = *(void *)(a1 + 40);
    v41 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v40 + 16))(v40, 0, v41);
    goto LABEL_32;
  }
  v7 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_1((uint64_t)v6, v7);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (!v6)
  {
    v41 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:2048 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v41);
LABEL_32:

    goto LABEL_36;
  }
  (*(void (**)(void, void, id))(v8 + 16))(*(void *)(a1 + 40), 0, v6);
LABEL_36:
}

- (void).cxx_destruct
{
}

- (void)_flightIDIsValid:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Flight ID: airlineCode is not valid.", v2, v3, v4, v5, v6);
}

- (void)_flightIDIsValid:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Flight ID: arrivalAirportCode is not valid.", v2, v3, v4, v5, v6);
}

- (void)_flightIDIsValid:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Flight ID: flightNumber is not valid.", v2, v3, v4, v5, v6);
}

- (void)_flightIDIsValid:.cold.4()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Flight ID: expectedDepartureTimestamp is not a number.", v2, v3, v4, v5, v6);
}

- (void)flightStatusForFlight:callback:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Failed to load the FlightUtilitiesCore Framework.", v2, v3, v4, v5, v6);
}

- (void)flightStatusForFlight:callback:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Requested flight status, but the flightID is not valid.", v2, v3, v4, v5, v6);
}

- (void)flightStatusForFlight:(uint64_t)a1 callback:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "Requested flight status with flightID: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Encountered an error, or got back no flights -- Error: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ATXFlightStatusDataSource_flightStatusForFlight_callback___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_0(&dword_1D0F43000, v0, v1, "Flight ID was found to be invalid or incomplete from the Flight Status Data Source.", v2, v3, v4, v5, v6);
}

@end