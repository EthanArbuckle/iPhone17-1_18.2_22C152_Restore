@interface SGAppointmentEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGAppointmentEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v5 = [v4 objectForKeyedSubscript:@"name"];

  v6 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v7 = [v6 objectForKeyedSubscript:@"startDate"];

  v8 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  v9 = [v3 objectForKeyedSubscript:@"reservationId"];

  if (v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
    BOOL v11 = v5 != v10;

    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v13 = 0;
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  BOOL v11 = 0;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_3:
  v12 = [MEMORY[0x1E4F1CA98] null];
  BOOL v13 = v7 != v12;

  if (v9)
  {
LABEL_4:
    v14 = [MEMORY[0x1E4F1CA98] null];
    BOOL v15 = v9 != v14;

    goto LABEL_8;
  }
LABEL_7:
  BOOL v15 = 0;
LABEL_8:
  if (([v8 isEqualToString:@"http://schema.org/ReservationCancelled"] ^ 1 | v13)) {
    BOOL v16 = v11 && v13;
  }
  else {
    BOOL v16 = v15 && v11;
  }

  return v16;
}

- (id)processDURawEvent:(id)a3
{
  v59[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F8E8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F8]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F948]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E0]];
  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F0]];
  uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v51 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F880]];
  v50 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F850]];
  v47 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F958]];
  v49 = [v4 objectForKeyedSubscript:@"AppointmentSubType"];
  v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];

  v42 = v12;
  if (v12)
  {
    id v13 = [NSString alloc];
    v14 = [v12 capitalizedString];
    v48 = (void *)[v13 initWithFormat:@"http://schema.org/Reservation%@", v14];
  }
  else
  {
    v48 = 0;
  }
  v58[0] = @"@context";
  v58[1] = @"@type";
  v59[0] = @"http://schema.org";
  v59[1] = @"http://schema.org/EventReservation";
  v58[2] = @"reservationId";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v15;
  v59[2] = v15;
  v58[3] = @"reservationStatus";
  uint64_t v16 = (uint64_t)v48;
  if (!v48)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v16;
  v59[3] = v16;
  v58[4] = @"underName";
  v56[0] = @"@type";
  v56[1] = @"name";
  v57[0] = @"http://schema.org/Person";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v17;
  v57[1] = v17;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  v59[4] = v41;
  v58[5] = @"reservationFor";
  v55[0] = @"http://schema.org/Event";
  v54[0] = @"@type";
  v54[1] = @"name";
  uint64_t v18 = v5;
  if (!v5)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v18;
  v55[1] = v18;
  v54[2] = @"startDate";
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v19;
  v55[2] = v19;
  v54[3] = @"endDate";
  uint64_t v20 = (uint64_t)v51;
  if (!v51)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v6;
  v34 = (void *)v20;
  v55[3] = v20;
  v54[4] = @"duration";
  uint64_t v21 = (uint64_t)v50;
  if (!v50)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v5;
  v33 = (void *)v21;
  v55[4] = v21;
  v54[5] = @"location";
  v53[0] = @"http://schema.org/Place";
  v52[0] = @"@type";
  v52[1] = @"name";
  uint64_t v22 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v11;
  v44 = (void *)v7;
  v32 = (void *)v22;
  v53[1] = v22;
  v52[2] = @"address";
  v23 = (void *)v9;
  if (!v9)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v53[2] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  v55[5] = v24;
  v54[6] = @"telephone";
  v25 = (void *)v10;
  v40 = (void *)v10;
  if (!v10)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v9;
  v55[6] = v25;
  v54[7] = @"eventSubType";
  v27 = v49;
  if (!v49)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v55[7] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:8];
  v59[5] = v28;
  v58[6] = @"totalPrice";
  v29 = v47;
  if (!v47)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[7] = @"reservationType";
  v59[6] = v29;
  v59[7] = @"appointment";
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:8];
  if (!v47) {

  }
  if (!v49) {
  if (!v40)
  }

  if (!v26) {
  if (!v8)
  }

  if (!v50) {
  if (v51)
  }
  {
    if (v43) {
      goto LABEL_42;
    }
LABEL_51:

    if (v46) {
      goto LABEL_43;
    }
    goto LABEL_52;
  }

  if (!v43) {
    goto LABEL_51;
  }
LABEL_42:
  if (v46) {
    goto LABEL_43;
  }
LABEL_52:

LABEL_43:
  if (!v44) {

  }
  if (v48)
  {
    if (v45) {
      goto LABEL_47;
    }
  }
  else
  {

    if (v45) {
      goto LABEL_47;
    }
  }

LABEL_47:
  return v30;
}

@end