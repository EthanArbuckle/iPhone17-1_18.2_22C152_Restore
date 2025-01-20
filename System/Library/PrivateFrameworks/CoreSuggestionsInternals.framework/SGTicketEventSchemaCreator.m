@interface SGTicketEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGTicketEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  v5 = [v3 objectForKeyedSubscript:@"reservationId"];
  v6 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v7 = [v6 objectForKeyedSubscript:@"name"];

  v8 = [v3 objectForKeyedSubscript:@"reservationFor"];

  v9 = [v8 objectForKeyedSubscript:@"startDate"];

  int v10 = [v4 isEqualToString:@"http://schema.org/ReservationCancelled"];
  if (v7)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
    BOOL v12 = v7 != v11;

    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (v9)
    {
LABEL_3:
      v13 = [MEMORY[0x1E4F1CA98] null];

      BOOL v14 = v9 != v13 && v12;
      goto LABEL_8;
    }
  }
  BOOL v14 = 0;
LABEL_8:
  if (v10) {
    BOOL v15 = v12;
  }
  else {
    BOOL v15 = v14;
  }

  return v15;
}

- (id)processDURawEvent:(id)a3
{
  v101[9] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F818]];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F8]];
  v72 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  v71 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E8]];
  v70 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8E0]];
  v69 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F908]];
  v68 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F938]];
  v67 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F880]];
  v73 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F958]];
  uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];
  v65 = (void *)v4;
  v63 = (void *)v6;
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [NSString alloc];
    [v7 capitalizedString];
    int v10 = v9 = v5;
    v66 = (void *)[v8 initWithFormat:@"http://schema.org/Reservation%@", v10];

    v5 = v9;
  }
  else
  {
    v66 = 0;
  }
  v62 = [v3 objectForKeyedSubscript:@"EventSubType"];
  v64 = v5;
  if ([v62 isEqualToString:@"movie"])
  {
    v100[0] = @"@context";
    v100[1] = @"@type";
    v101[0] = @"http://schema.org";
    v101[1] = @"http://schema.org/EventReservation";
    uint64_t v11 = (uint64_t)v5;
    v100[2] = @"reservationId";
    if (!v5)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    }
    v61 = (void *)v11;
    v101[2] = v11;
    v100[3] = @"reservationStatus";
    uint64_t v12 = (uint64_t)v66;
    if (!v66)
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
    }
    v56 = (void *)v12;
    v101[3] = v12;
    v100[4] = @"underName";
    v99[0] = @"http://schema.org/Person";
    uint64_t v13 = (uint64_t)v72;
    v98[0] = @"@type";
    v98[1] = @"name";
    if (!v72)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
    }
    v55 = (void *)v13;
    v99[1] = v13;
    v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];
    v101[4] = v59;
    v100[5] = @"reservationFor";
    v97[0] = @"http://schema.org/ScreeningEvent";
    v96[0] = @"@type";
    v96[1] = @"name";
    uint64_t v14 = (uint64_t)v71;
    if (!v71)
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
    }
    v53 = (void *)v14;
    v97[1] = v14;
    v96[2] = @"startDate";
    uint64_t v15 = (uint64_t)v68;
    if (!v68)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    }
    v51 = (void *)v15;
    v97[2] = v15;
    v96[3] = @"endDate";
    uint64_t v16 = (uint64_t)v67;
    if (!v67)
    {
      uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
    }
    v49 = (void *)v16;
    v97[3] = v16;
    v96[4] = @"location";
    v95[0] = @"http://schema.org/Place";
    v94[0] = @"@type";
    v94[1] = @"address";
    uint64_t v17 = (uint64_t)v70;
    if (!v70)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    }
    v47 = (void *)v17;
    v95[1] = v17;
    v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
    v97[4] = v57;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:5];
    v100[6] = @"reservedTicket";
    v93[0] = @"http://schema.org/Ticket";
    v92[0] = @"@type";
    v92[1] = @"ticketedSeat";
    v91[0] = @"http://schema.org/Seat";
    v90[0] = @"@type";
    v90[1] = @"seatNumber";
    v19 = v69;
    v101[5] = v18;
    if (!v69)
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
    }
    v91[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
    v93[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
    v101[6] = v21;
    v100[7] = @"totalPrice";
    v22 = v73;
    if (!v73)
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
    }
    v101[7] = v22;
    v100[8] = @"broker";
    v89[0] = @"http://schema.org/Organization";
    v88[0] = @"@type";
    v88[1] = @"name";
    v23 = v65;
    if (!v65)
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
    }
    v89[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
    v101[8] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:9];

    v26 = v65;
    if (!v65) {

    }
    if (!v73) {
    v5 = v64;
    }
    if (!v69) {

    }
    v27 = v63;
    if (!v70) {

    }
    if (!v67) {
    if (!v68)
    }

    if (!v71) {
    if (!v72)
    }
LABEL_40:
  }
  else
  {
    v86[0] = @"@context";
    v86[1] = @"@type";
    v87[0] = @"http://schema.org";
    v87[1] = @"http://schema.org/EventReservation";
    uint64_t v29 = (uint64_t)v5;
    v86[2] = @"reservationId";
    if (!v5)
    {
      uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
    }
    v61 = (void *)v29;
    v87[2] = v29;
    v86[3] = @"reservationStatus";
    uint64_t v30 = (uint64_t)v66;
    if (!v66)
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
    }
    v56 = (void *)v30;
    v87[3] = v30;
    v86[4] = @"totalPrice";
    uint64_t v31 = (uint64_t)v73;
    if (!v73)
    {
      uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
    }
    v55 = (void *)v31;
    v87[4] = v31;
    v86[5] = @"underName";
    v85[0] = @"http://schema.org/Person";
    uint64_t v32 = (uint64_t)v72;
    v84[0] = @"@type";
    v84[1] = @"name";
    if (!v72)
    {
      uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
    }
    v54 = (void *)v32;
    v85[1] = v32;
    v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
    v87[5] = v60;
    v86[6] = @"reservationFor";
    v83[0] = @"http://schema.org/Event";
    v82[0] = @"@type";
    v82[1] = @"name";
    uint64_t v33 = (uint64_t)v71;
    if (!v71)
    {
      uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
    }
    v52 = (void *)v33;
    v83[1] = v33;
    v82[2] = @"startDate";
    uint64_t v34 = (uint64_t)v68;
    if (!v68)
    {
      uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
    }
    v50 = (void *)v34;
    v83[2] = v34;
    v82[3] = @"endDate";
    uint64_t v35 = (uint64_t)v67;
    if (!v67)
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
    }
    v48 = (void *)v35;
    v83[3] = v35;
    v82[4] = @"totalPrice";
    uint64_t v36 = (uint64_t)v73;
    if (!v73)
    {
      uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
    }
    v46 = (void *)v36;
    v83[4] = v36;
    v82[5] = @"location";
    v80[0] = @"@type";
    v80[1] = @"address";
    v81[0] = @"http://schema.org/Place";
    uint64_t v37 = (uint64_t)v70;
    if (!v70)
    {
      uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
    }
    v45 = (void *)v37;
    v81[1] = v37;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
    v83[5] = v58;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:6];
    v86[7] = @"reservedTicket";
    v78[1] = @"ticketedSeat";
    v79[0] = @"http://schema.org/Ticket";
    v78[0] = @"@type";
    v76[0] = @"@type";
    v76[1] = @"seatNumber";
    v77[0] = @"http://schema.org/Seat";
    v39 = v69;
    v87[6] = v38;
    if (!v69)
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
    }
    v77[1] = v39;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
    v79[1] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
    v87[7] = v41;
    v86[8] = @"broker";
    v74[0] = @"@type";
    v74[1] = @"name";
    v75[0] = @"http://schema.org/Organization";
    v42 = v65;
    if (!v65)
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
    }
    v75[1] = v42;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:v74 count:2];
    v87[8] = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:9];

    v26 = v65;
    if (!v65) {

    }
    if (!v69) {
    v25 = (void *)v44;
    }
    if (!v70) {

    }
    v27 = v63;
    if (!v73) {

    }
    if (!v67) {
    if (!v68)
    }

    if (!v71) {
    if (!v72)
    }

    if (!v73) {
      goto LABEL_40;
    }
  }
  if (v66)
  {
    if (v5) {
      goto LABEL_43;
    }
  }
  else
  {

    if (v5) {
      goto LABEL_43;
    }
  }

LABEL_43:
  return v25;
}

@end