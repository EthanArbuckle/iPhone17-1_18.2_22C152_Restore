@interface SGTicketedTransportationEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGTicketedTransportationEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"@type"];
  if (([v4 isEqualToString:@"http://schema.org/TrainReservation"] & 1) != 0
    || ([v4 isEqualToString:@"http://schema.org/BusReservation"] & 1) != 0
    || ([v4 isEqualToString:@"http://schema.org/BoatReservation"] & 1) != 0)
  {
    v5 = objc_opt_new();
    if (!v5)
    {
      char v7 = 0;
      goto LABEL_8;
    }
    v6 = v5;
    char v7 = [v5 checkCompletenessOfSchema:v3];
  }
  else
  {
    v6 = sgEventsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "unidentified category of ticketed transportation - %@", (uint8_t *)&v9, 0xCu);
    }
    char v7 = 0;
  }

LABEL_8:
  return v7;
}

- (id)processDURawEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F960]];
  if (([v4 isEqualToString:*MEMORY[0x1E4F5F9C8]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F5F9C0]] & 1) == 0
    && ([v4 isEqualToString:*MEMORY[0x1E4F5F9B8]] & 1) == 0)
  {
    v6 = sgEventsLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, "unidentified category of ticketed transportation - %@", (uint8_t *)&v9, 0xCu);
    }
    char v7 = 0;
    goto LABEL_6;
  }
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = v5;
    char v7 = [v5 processDURawEvent:v3];
LABEL_6:

    goto LABEL_8;
  }
  char v7 = 0;
LABEL_8:

  return v7;
}

@end