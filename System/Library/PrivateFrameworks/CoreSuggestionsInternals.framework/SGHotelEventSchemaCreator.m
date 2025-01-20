@interface SGHotelEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGHotelEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  int v33 = [v4 isEqualToString:@"http://schema.org/ReservationCancelled"];
  HIDWORD(v31) = [v4 isEqualToString:@"http://schema.org/ReservationConfirmed"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"reservationId"];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"checkinTime"];
  uint64_t v7 = [v3 objectForKeyedSubscript:@"checkoutTime"];
  v8 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v9 = [v8 objectForKeyedSubscript:@"name"];

  v10 = [v3 objectForKeyedSubscript:@"provider"];
  v11 = [v10 objectForKeyedSubscript:@"name"];

  v12 = [v3 objectForKeyedSubscript:@"reservationFor"];

  v13 = [v12 objectForKeyedSubscript:@"address"];

  if (v5)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
    BOOL v15 = v5 != (void)v14;

    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v17 = 0;
    if (v7) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  BOOL v15 = 0;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_3:
  v16 = [MEMORY[0x1E4F1CA98] null];
  BOOL v17 = v6 != (void)v16;

  if (v7)
  {
LABEL_4:
    v18 = [MEMORY[0x1E4F1CA98] null];
    LODWORD(v31) = v7 != (void)v18;

    goto LABEL_8;
  }
LABEL_7:
  LODWORD(v31) = 0;
LABEL_8:
  v32 = (void *)v7;
  v34 = (void *)v5;
  v19 = (void *)v6;
  if (v9)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
    BOOL v21 = v9 != v20;
  }
  else
  {
    BOOL v21 = 0;
  }
  v22 = v4;
  if (v11)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
    BOOL v24 = v11 != v23;

    if (v13)
    {
LABEL_13:
      v25 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v31, v32);
      BOOL v26 = v13 != v25;

      goto LABEL_16;
    }
  }
  else
  {
    BOOL v24 = 0;
    if (v13) {
      goto LABEL_13;
    }
  }
  BOOL v26 = 0;
LABEL_16:
  BOOL v27 = v24 || v26;
  if ((v15 | v33 | HIDWORD(v31)) == 1) {
    char v28 = v17 & (v31 | v21 | v27);
  }
  else {
    char v28 = 0;
  }
  char v29 = v28 | ((v15 && v17) | v33) & (v21 || v27);

  return v29;
}

- (id)processDURawEvent:(id)a3
{
  v58[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F818];
  id v4 = a3;
  v50 = [v4 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E8]];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F8]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8D0]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E0]];
  v49 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v48 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F880]];
  v47 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F0]];
  v46 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F900]];
  v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F958]];
  v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];

  v41 = v11;
  if (v11)
  {
    id v12 = [NSString alloc];
    v13 = [v11 capitalizedString];
    uint64_t v14 = [v12 initWithFormat:@"http://schema.org/Reservation%@", v13];
  }
  else
  {
    uint64_t v14 = 0;
  }
  v57[0] = @"@context";
  v57[1] = @"@type";
  v58[0] = @"http://schema.org";
  v58[1] = @"http://schema.org/LodgingReservation";
  v57[2] = @"reservationId";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v15;
  v58[2] = v15;
  v57[3] = @"reservationStatus";
  uint64_t v16 = v14;
  if (!v14)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v16;
  v58[3] = v16;
  v57[4] = @"underName";
  v55[0] = @"@type";
  v55[1] = @"name";
  v56[0] = @"http://schema.org/Person";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v17;
  v56[1] = v17;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
  v58[4] = v40;
  v57[5] = @"checkinTime";
  uint64_t v18 = (uint64_t)v49;
  if (!v49)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v18;
  v58[5] = v18;
  v57[6] = @"reservationFor";
  v54[0] = @"http://schema.org/LodgingBusiness";
  v53[0] = @"@type";
  v53[1] = @"name";
  uint64_t v19 = v5;
  if (!v5)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v33 = (void *)v19;
  v54[1] = v19;
  v53[2] = @"address";
  uint64_t v20 = v9;
  v42 = (void *)v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v6;
  v32 = (void *)v20;
  v54[2] = v20;
  v53[3] = @"telephone";
  uint64_t v21 = (uint64_t)v47;
  if (!v47)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v31 = (void *)v21;
  v54[3] = v21;
  v53[4] = @"numberOfRooms";
  v22 = (void *)v8;
  v43 = (void *)v8;
  if (!v8)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v5;
  v54[4] = v22;
  v53[5] = @"allottedRoomNumbers";
  v23 = v46;
  if (!v46)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v7;
  v54[5] = v23;
  BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:6];
  v58[6] = v24;
  v57[7] = @"checkoutTime";
  v25 = v48;
  if (!v48)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v26 = (void *)v14;
  v58[7] = v25;
  v57[8] = @"provider";
  v51[1] = @"name";
  v52[0] = @"http://schema.org/Organization";
  v51[0] = @"@type";
  BOOL v27 = v50;
  if (!v50)
  {
    BOOL v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v52[1] = v27;
  char v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v58[8] = v28;
  v57[9] = @"totalPrice";
  char v29 = v10;
  if (!v10)
  {
    char v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[9] = v29;
  id v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:10];
  if (!v10) {

  }
  if (!v50) {
  if (!v48)
  }

  if (!v46) {
  if (!v43)
  }

  if (!v47) {
  if (v42)
  }
  {
    if (v45) {
      goto LABEL_42;
    }
  }
  else
  {

    if (v45) {
      goto LABEL_42;
    }
  }

LABEL_42:
  if (!v49) {

  }
  if (v39)
  {
    if (v26) {
      goto LABEL_46;
    }
LABEL_53:

    if (v44) {
      goto LABEL_47;
    }
    goto LABEL_54;
  }

  if (!v26) {
    goto LABEL_53;
  }
LABEL_46:
  if (v44) {
    goto LABEL_47;
  }
LABEL_54:

LABEL_47:
  return v38;
}

@end