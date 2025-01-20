@interface SGBusEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGBusEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"reservationId"];
  v5 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v6 = [v5 objectForKeyedSubscript:@"provider"];
  v38 = [v6 objectForKeyedSubscript:@"name"];

  v7 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  int v36 = [v7 isEqualToString:@"http://schema.org/ReservationCancelled"];
  v37 = v7;
  char v35 = [v7 isEqualToString:@"http://schema.org/ReservationConfirmed"];
  v8 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v9 = [v8 objectForKeyedSubscript:@"departureBusStop"];
  v10 = [v9 objectForKeyedSubscript:@"name"];

  v11 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v12 = [v11 objectForKeyedSubscript:@"departureBusStop"];
  v13 = [v12 objectForKeyedSubscript:@"address"];

  v14 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v15 = [v14 objectForKeyedSubscript:@"arrivalBusStop"];
  v16 = [v15 objectForKeyedSubscript:@"name"];

  v17 = [v3 objectForKeyedSubscript:@"reservationFor"];

  v18 = [v17 objectForKeyedSubscript:@"arrivalBusStop"];
  v19 = [v18 objectForKeyedSubscript:@"address"];

  if (v10)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
    HIDWORD(v34) = v10 != v20;

    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    HIDWORD(v34) = 0;
    if (v13)
    {
LABEL_3:
      v21 = [MEMORY[0x1E4F1CA98] null];
      LODWORD(v34) = v13 != v21;

      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  LODWORD(v34) = 0;
  if (v16)
  {
LABEL_4:
    v22 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v34);
    BOOL v23 = v16 != v22;

    if (v19) {
      goto LABEL_5;
    }
LABEL_10:
    BOOL v25 = 0;
    if (v4) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  BOOL v23 = 0;
  if (!v19) {
    goto LABEL_10;
  }
LABEL_5:
  v24 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v34);
  BOOL v25 = v19 != v24;

  if (v4)
  {
LABEL_6:
    v26 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v34);
    v27 = (void *)v4;
    LODWORD(v4) = v4 != (void)v26;

    goto LABEL_12;
  }
LABEL_11:
  v27 = (void *)v4;
LABEL_12:
  if (v38)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
    BOOL v29 = v38 != v28;
  }
  else
  {
    BOOL v29 = 0;
  }
  char v30 = BYTE4(v34) | v34;
  char v31 = v36;
  if (((v36 ^ 1 | v4) & 1) == 0) {
    char v31 = v29 & v30;
  }
  char v32 = (v30 & (v23 || v25) | v31) & (v36 | v35 | v4);

  return v32;
}

- (id)processDURawEvent:(id)a3
{
  v77[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F8F8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  v63 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F818]];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E8]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F948]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F940]];
  v55 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F928]];
  v54 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F910]];
  v53 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F920]];
  v52 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F918]];
  v51 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F930]];
  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v62 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F890]];
  v61 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F888]];
  v49 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F870]];
  v48 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F858]];
  v47 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F868]];
  v46 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F860]];
  v45 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F878]];
  v60 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F880]];
  v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F958]];
  v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];

  v43 = v12;
  if (v12)
  {
    id v13 = [NSString alloc];
    v14 = [v12 capitalizedString];
    v59 = (void *)[v13 initWithFormat:@"http://schema.org/Reservation%@", v14];
  }
  else
  {
    v59 = 0;
  }
  v76[0] = @"@context";
  v76[1] = @"@type";
  v77[0] = @"http://schema.org";
  v77[1] = @"http://schema.org/BusReservation";
  v76[2] = @"reservationId";
  uint64_t v15 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v15;
  v77[2] = v15;
  v76[3] = @"reservationStatus";
  uint64_t v16 = (uint64_t)v59;
  if (!v59)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v16;
  v77[3] = v16;
  v76[4] = @"underName";
  v74[0] = @"@type";
  v74[1] = @"name";
  v75[0] = @"http://schema.org/Person";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v17;
  v75[1] = v17;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
  v77[4] = v42;
  v76[5] = @"reservationFor";
  v73[0] = @"http://schema.org/BusTrip";
  v72[0] = @"@type";
  v72[1] = @"departureBusStop";
  v71[0] = @"http://schema.org/BusStop";
  uint64_t v18 = v8;
  v70[0] = @"@type";
  v70[1] = @"name";
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = (void *)v18;
  v71[1] = v18;
  v70[2] = @"address";
  uint64_t v19 = v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  char v35 = (void *)v19;
  v71[2] = v19;
  v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:3];
  v73[1] = v41;
  v72[2] = @"departureTime";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v34 = (void *)v20;
  v73[2] = v20;
  v72[3] = @"arrivalBusStop";
  v69[0] = @"http://schema.org/BusStop";
  v68[0] = @"@type";
  v68[1] = @"name";
  uint64_t v21 = (uint64_t)v62;
  if (!v62)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v8;
  v33 = (void *)v21;
  v69[1] = v21;
  v68[2] = @"address";
  uint64_t v22 = (uint64_t)v61;
  if (!v61)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v10;
  v56 = (void *)v9;
  v58 = (void *)v7;
  char v32 = (void *)v22;
  v69[2] = v22;
  BOOL v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:3];
  v73[3] = v23;
  v72[4] = @"arrivalTime";
  v24 = v60;
  if (!v60)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v73[4] = v24;
  v72[5] = @"provider";
  v66[1] = @"name";
  v67[0] = @"http://schema.org/Organization";
  v66[0] = @"@type";
  BOOL v25 = (void *)v6;
  v44 = (void *)v6;
  if (!v6)
  {
    BOOL v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v67[1] = v25;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
  v73[5] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:6];
  v77[5] = v27;
  v76[6] = @"broker";
  v64[1] = @"name";
  v65[0] = @"http://schema.org/Organization";
  v64[0] = @"@type";
  v28 = v63;
  if (!v63)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v65[1] = v28;
  BOOL v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v77[6] = v29;
  v76[7] = @"totalPrice";
  char v30 = v11;
  if (!v11)
  {
    char v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v77[7] = v30;
  id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:8];
  if (!v11) {

  }
  if (!v63) {
  if (!v44)
  }

  if (!v60) {
  if (!v61)
  }

  if (v62)
  {
    if (v50) {
      goto LABEL_40;
    }
  }
  else
  {

    if (v50) {
      goto LABEL_40;
    }
  }

LABEL_40:
  if (v56)
  {
    if (v57) {
      goto LABEL_42;
    }
  }
  else
  {

    if (v57) {
      goto LABEL_42;
    }
  }

LABEL_42:
  if (!v58) {

  }
  if (v59)
  {
    if (v5) {
      goto LABEL_46;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_46;
    }
  }

LABEL_46:
  return v40;
}

@end