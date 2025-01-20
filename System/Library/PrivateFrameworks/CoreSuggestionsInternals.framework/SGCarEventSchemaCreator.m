@interface SGCarEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGCarEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationId"];
  v5 = [v3 objectForKeyedSubscript:@"pickupTime"];
  v6 = [v3 objectForKeyedSubscript:@"dropoffTime"];
  v7 = [v3 objectForKeyedSubscript:@"pickupLocation"];
  v8 = [v7 objectForKeyedSubscript:@"address"];

  v9 = [v3 objectForKeyedSubscript:@"pickupLocation"];

  v10 = [v9 objectForKeyedSubscript:@"name"];

  if (v4)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
    BOOL v12 = v4 == v11;

    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v12 = 1;
    if (v5)
    {
LABEL_3:
      v13 = [MEMORY[0x1E4F1CA98] null];
      BOOL v14 = v5 == v13;

      if (v6) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  BOOL v14 = 1;
  if (v6)
  {
LABEL_4:
    v15 = [MEMORY[0x1E4F1CA98] null];
    BOOL v16 = v6 != v15;

    if (v8) {
      goto LABEL_5;
    }
LABEL_10:
    BOOL v18 = 0;
    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  BOOL v16 = 0;
  if (!v8) {
    goto LABEL_10;
  }
LABEL_5:
  v17 = [MEMORY[0x1E4F1CA98] null];
  BOOL v18 = v8 != v17;

  if (v10)
  {
LABEL_6:
    v19 = [MEMORY[0x1E4F1CA98] null];
    BOOL v20 = v10 != v19;

    goto LABEL_12;
  }
LABEL_11:
  BOOL v20 = 0;
LABEL_12:
  if (v12 || v14 || v16) {
    BOOL v21 = !v12 && !v14;
  }
  else {
    BOOL v21 = v18 || v20;
  }

  return v21;
}

- (id)processDURawEvent:(id)a3
{
  v77[13] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5F818];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E8]];
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F8]];
  uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  uint64_t v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F948]];
  uint64_t v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F940]];
  uint64_t v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F950]];
  v63 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v62 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F890]];
  v61 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F888]];
  v60 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F898]];
  v59 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F880]];
  v58 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F970]];
  v56 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F958]];
  BOOL v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];

  v51 = v12;
  if (v12)
  {
    id v13 = [NSString alloc];
    BOOL v14 = [v12 capitalizedString];
    v57 = (void *)[v13 initWithFormat:@"http://schema.org/Reservation%@", v14];
  }
  else
  {
    v57 = 0;
  }
  v76[0] = @"@context";
  v76[1] = @"@type";
  v77[0] = @"http://schema.org";
  v77[1] = @"http://schema.org/RentalCarReservation";
  v76[2] = @"reservationId";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v15;
  v77[2] = v15;
  v76[3] = @"reservationStatus";
  uint64_t v16 = (uint64_t)v57;
  if (!v57)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v16;
  v77[3] = v16;
  v76[4] = @"underName";
  v74[0] = @"@type";
  v74[1] = @"name";
  v75[0] = @"http://schema.org/Person";
  uint64_t v17 = v8;
  if (!v8)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v17;
  v75[1] = v17;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
  v77[4] = v50;
  v76[5] = @"pickupTime";
  uint64_t v18 = (uint64_t)v63;
  if (!v63)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v18;
  v77[5] = v18;
  v76[6] = @"pickupLocation";
  v73[0] = @"http://schema.org/Place";
  v72[0] = @"@type";
  v72[1] = @"name";
  uint64_t v19 = v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v8;
  v42 = (void *)v19;
  v73[1] = v19;
  v72[2] = @"address";
  uint64_t v20 = v10;
  if (!v10)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v20;
  v73[2] = v20;
  v72[3] = @"telephone";
  uint64_t v21 = v11;
  if (!v11)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v21;
  v73[3] = v21;
  v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:4];
  v77[6] = v49;
  v76[7] = @"dropoffTime";
  uint64_t v22 = (uint64_t)v59;
  if (!v59)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v22;
  v77[7] = v22;
  v76[8] = @"dropoffLocation";
  v71[0] = @"http://schema.org/Place";
  v70[0] = @"@type";
  v70[1] = @"name";
  uint64_t v23 = (uint64_t)v62;
  if (!v62)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v23;
  v71[1] = v23;
  v70[2] = @"address";
  uint64_t v24 = (uint64_t)v61;
  if (!v61)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v10;
  v54 = (void *)v9;
  v37 = (void *)v24;
  v71[2] = v24;
  v70[3] = @"telephone";
  uint64_t v25 = (uint64_t)v60;
  if (!v60)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v25;
  v71[3] = v25;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:4];
  v77[8] = v48;
  v76[9] = @"provider";
  v68[1] = @"name";
  v69[0] = @"http://schema.org/Organization";
  v68[0] = @"@type";
  uint64_t v26 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v11;
  v35 = (void *)v26;
  v69[1] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:2];
  v77[9] = v27;
  v76[10] = @"broker";
  v66[1] = @"name";
  v67[0] = @"http://schema.org/Organization";
  v66[0] = @"@type";
  v28 = (void *)v5;
  if (!v5)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v5;
  v67[1] = v28;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
  v77[10] = v30;
  v76[11] = @"reservationFor";
  v64[0] = @"@type";
  v64[1] = @"model";
  v65[0] = @"http://schema.org/Car";
  v31 = v58;
  if (!v58)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v65[1] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v77[11] = v32;
  v76[12] = @"totalPrice";
  v33 = v56;
  if (!v56)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v77[12] = v33;
  id v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:13];
  if (!v56) {

  }
  if (!v58) {
  if (!v29)
  }

  if (!v6) {
  if (!v60)
  }

  if (!v61) {
  if (!v62)
  }

  if (!v59) {
  if (v52)
  }
  {
    if (v53) {
      goto LABEL_52;
    }
LABEL_63:

    if (v54) {
      goto LABEL_53;
    }
    goto LABEL_64;
  }

  if (!v53) {
    goto LABEL_63;
  }
LABEL_52:
  if (v54) {
    goto LABEL_53;
  }
LABEL_64:

LABEL_53:
  if (!v63) {

  }
  if (!v55) {
  if (v57)
  }
  {
    if (v7) {
      goto LABEL_59;
    }
  }
  else
  {

    if (v7) {
      goto LABEL_59;
    }
  }

LABEL_59:
  return v47;
}

@end