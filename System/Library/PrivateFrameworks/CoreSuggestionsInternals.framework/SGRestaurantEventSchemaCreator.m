@interface SGRestaurantEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGRestaurantEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  v5 = [v3 objectForKeyedSubscript:@"reservationId"];
  v6 = [v3 objectForKeyedSubscript:@"startTime"];
  v7 = [v3 objectForKeyedSubscript:@"reservationFor"];

  v8 = [v7 objectForKeyedSubscript:@"name"];

  int v9 = [v4 isEqualToString:@"http://schema.org/ReservationCancelled"];
  char v10 = [v4 isEqualToString:@"http://schema.org/ReservationConfirmed"];
  if (v5)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
    BOOL v12 = v5 != v11;

    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v14 = 0;
    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  BOOL v12 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_3:
  v13 = [MEMORY[0x1E4F1CA98] null];
  BOOL v14 = v6 != v13;

  if (v8)
  {
LABEL_4:
    v15 = [MEMORY[0x1E4F1CA98] null];
    BOOL v16 = v8 != v15;

    goto LABEL_8;
  }
LABEL_7:
  BOOL v16 = 0;
LABEL_8:
  if ((v9 ^ 1 | v14))
  {
    if (!v14 || !v16 || v12) {
      char v17 = v14 && v16;
    }
    else {
      char v17 = v10 | v9;
    }
  }
  else
  {
    char v17 = v12 && v16;
  }

  return v17;
}

- (id)processDURawEvent:(id)a3
{
  v48[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F818];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E8]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F8]];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8D8]];
  v40 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E0]];
  v39 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v38 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F0]];
  char v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];

  v33 = v10;
  v11 = (void *)v5;
  if (v10)
  {
    id v12 = [NSString alloc];
    v13 = [v10 capitalizedString];
    BOOL v14 = (void *)[v12 initWithFormat:@"http://schema.org/Reservation%@", v13];
  }
  else
  {
    BOOL v14 = 0;
  }
  v47[0] = @"@context";
  v47[1] = @"@type";
  v48[0] = @"http://schema.org";
  v48[1] = @"http://schema.org/FoodEstablishmentReservation";
  v47[2] = @"reservationId";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v15;
  v48[2] = v15;
  v47[3] = @"reservationStatus";
  uint64_t v16 = (uint64_t)v14;
  if (!v14)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v16;
  v48[3] = v16;
  v47[4] = @"underName";
  v45[0] = @"@type";
  v45[1] = @"name";
  v46[0] = @"http://schema.org/Person";
  uint64_t v17 = v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v8;
  v36 = (void *)v7;
  v29 = (void *)v17;
  v46[1] = v17;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v48[4] = v32;
  v47[5] = @"startTime";
  uint64_t v18 = (uint64_t)v39;
  if (!v39)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v18;
  v48[5] = v18;
  v47[6] = @"partySize";
  v19 = (void *)v9;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v48[6] = v19;
  v47[7] = @"reservationFor";
  v44[0] = @"http://schema.org/FoodEstablishment";
  v43[0] = @"@type";
  v43[1] = @"name";
  v20 = (void *)v6;
  v37 = (void *)v6;
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v9;
  v44[1] = v20;
  v43[2] = @"address";
  v21 = v40;
  if (!v40)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[2] = v21;
  v43[3] = @"telephone";
  v22 = v38;
  if (!v38)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[3] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:4];
  v48[7] = v23;
  v47[8] = @"broker";
  v41[1] = @"name";
  v42[0] = @"http://schema.org/Organization";
  v41[0] = @"@type";
  v24 = v11;
  if (!v11)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[1] = v11;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v48[8] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:9];

  if (!v24) {
  if (!v38)
  }

  if (!v40) {
  if (v37)
  }
  {
    if (v34) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v34) {
      goto LABEL_30;
    }
  }

LABEL_30:
  if (!v39) {

  }
  if (v35)
  {
    if (v14) {
      goto LABEL_34;
    }
LABEL_41:

    if (v36) {
      goto LABEL_35;
    }
    goto LABEL_42;
  }

  if (!v14) {
    goto LABEL_41;
  }
LABEL_34:
  if (v36) {
    goto LABEL_35;
  }
LABEL_42:

LABEL_35:
  return v26;
}

@end