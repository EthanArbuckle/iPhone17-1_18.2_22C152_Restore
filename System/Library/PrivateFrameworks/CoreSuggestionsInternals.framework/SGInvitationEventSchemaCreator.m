@interface SGInvitationEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGInvitationEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  v5 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v6 = [v5 objectForKeyedSubscript:@"name"];

  v7 = [v3 objectForKeyedSubscript:@"reservationFor"];

  v8 = [v7 objectForKeyedSubscript:@"startDate"];

  int v9 = [v4 isEqualToString:@"http://schema.org/ReservationCancelled"];
  if (v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
    BOOL v11 = v6 != v10;

    if (v8)
    {
LABEL_3:
      v12 = [MEMORY[0x1E4F1CA98] null];
      BOOL v13 = v8 != v12;

      goto LABEL_6;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  BOOL v13 = 0;
LABEL_6:
  if (v9) {
    BOOL v14 = v11;
  }
  else {
    BOOL v14 = v11 && v13;
  }

  return v14;
}

- (id)processDURawEvent:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F8E8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F948]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E0]];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v35 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F880]];
  int v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A0]];
  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];

  if (v10)
  {
    id v11 = [NSString alloc];
    v12 = [v10 capitalizedString];
    uint64_t v13 = [v11 initWithFormat:@"http://schema.org/Reservation%@", v12];

    v40 = @"@context";
    v41 = @"@type";
    v45 = @"http://schema.org";
    v46 = @"http://schema.org/EventReservation";
    v42 = @"reservationStatus";
    if (v13)
    {
      int v30 = 0;
      v31 = (void *)v13;
      uint64_t v14 = v13;
      goto LABEL_6;
    }
  }
  else
  {
    v40 = @"@context";
    v41 = @"@type";
    v45 = @"http://schema.org";
    v46 = @"http://schema.org/EventReservation";
    v42 = @"reservationStatus";
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  v31 = 0;
  int v30 = 1;
LABEL_6:
  v29 = (void *)v14;
  uint64_t v47 = v14;
  v43 = @"reservationFor";
  v39[0] = @"http://schema.org/SocialEvent";
  v38[0] = @"@type";
  v38[1] = @"name";
  uint64_t v15 = v5;
  v34 = (void *)v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v15;
  v39[1] = v15;
  v38[2] = @"startDate";
  uint64_t v16 = v8;
  v33 = (void *)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v16;
  v39[2] = v16;
  v38[3] = @"endDate";
  v17 = v35;
  if (!v35)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = v10;
  v39[3] = v17;
  v38[4] = @"location";
  v37[0] = @"http://schema.org/Place";
  v36[0] = @"@type";
  v36[1] = @"name";
  v18 = (void *)v6;
  if (!v6)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v6;
  v37[1] = v18;
  v36[2] = @"address";
  v20 = (void *)v7;
  v21 = (void *)v7;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[2] = v20;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
  v39[4] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:5];
  v48 = v23;
  v44 = @"url";
  v24 = v9;
  if (!v9)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v40 count:5];
  if (!v9) {

  }
  if (v21)
  {
    if (v19) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v19) {
      goto LABEL_22;
    }
  }

LABEL_22:
  if (!v35) {

  }
  if (!v33) {
  if (!v34)
  }

  if (v30) {
  return v25;
  }
}

@end