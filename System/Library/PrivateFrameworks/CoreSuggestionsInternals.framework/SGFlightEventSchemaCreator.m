@interface SGFlightEventSchemaCreator
- (BOOL)checkCompletenessOfSchema:(id)a3;
- (id)processDURawEvent:(id)a3;
@end

@implementation SGFlightEventSchemaCreator

- (BOOL)checkCompletenessOfSchema:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"reservationStatus"];
  int v30 = [v4 isEqualToString:@"http://schema.org/ReservationCancelled"];
  int v5 = [v4 isEqualToString:@"http://schema.org/ReservationConfirmed"];
  v6 = [v3 objectForKeyedSubscript:@"reservationFor"];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"flightNumber"];

  v8 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v9 = [v8 objectForKeyedSubscript:@"departureTime"];

  v10 = [v3 objectForKeyedSubscript:@"reservationFor"];
  uint64_t v32 = [v10 objectForKeyedSubscript:@"arrivalTime"];

  v11 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v12 = [v11 objectForKeyedSubscript:@"departureAirport"];
  v13 = [v12 objectForKeyedSubscript:@"iataCode"];

  v14 = [v3 objectForKeyedSubscript:@"reservationFor"];
  v15 = [v14 objectForKeyedSubscript:@"arrivalAirport"];
  v16 = [v15 objectForKeyedSubscript:@"iataCode"];

  v17 = [v3 objectForKeyedSubscript:@"reservationId"];

  if (!v5)
  {
    v18 = (void *)v7;
    if (v17) {
      int v26 = v30;
    }
    else {
      int v26 = 0;
    }
    if (v26 == 1)
    {
      v19 = [MEMORY[0x1E4F1CA98] null];
      LOBYTE(v7) = 0;
      if (v17 == v19 || !v18) {
        goto LABEL_25;
      }
      v20 = [MEMORY[0x1E4F1CA98] null];
      LOBYTE(v7) = v18 != v20;
      goto LABEL_24;
    }
    LOBYTE(v7) = 0;
LABEL_27:
    v27 = (void *)v32;
    goto LABEL_28;
  }
  v18 = (void *)v7;
  if (!v7) {
    goto LABEL_27;
  }
  v19 = [MEMORY[0x1E4F1CA98] null];
  LOBYTE(v7) = 0;
  if (v18 == v19 || !v9) {
    goto LABEL_25;
  }
  v20 = [MEMORY[0x1E4F1CA98] null];
  LOBYTE(v7) = 0;
  if (v9 != v20 && v32)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
    LOBYTE(v7) = 0;
    if ((void *)v32 != v21 && v13)
    {
      v22 = v21;
      v23 = [MEMORY[0x1E4F1CA98] null];
      LOBYTE(v7) = 0;
      if (v13 != v23 && v16)
      {
        id v31 = v23;
        v24 = [MEMORY[0x1E4F1CA98] null];
        LOBYTE(v7) = 0;
        if (v16 != v24 && v17)
        {
          id v29 = v24;
          v25 = [MEMORY[0x1E4F1CA98] null];
          LOBYTE(v7) = v17 != v25;

          v24 = v29;
        }

        v23 = v31;
      }

      v21 = v22;
    }
  }
LABEL_24:

LABEL_25:
  v27 = (void *)v32;

LABEL_28:
  return v7;
}

- (id)processDURawEvent:(id)a3
{
  v109[10] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8C0]];
  v89 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F818]];
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8F8]];
  uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8B8]];
  uint64_t v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F968]];
  uint64_t v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F838]];
  v88 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F810]];
  v87 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F7F8]];
  v86 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F830]];
  v85 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F828]];
  v84 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F848]];
  v83 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F840]];
  v82 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F908]];
  v81 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F7F0]];
  v80 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F7E8]];
  v79 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F808]];
  v78 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F800]];
  v77 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F850]];
  v73 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F820]];
  v76 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F958]];
  v75 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8C8]];
  uint64_t v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F5F8A8]];
  v67 = (void *)v9;
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = [NSString alloc];
    v12 = [v10 capitalizedString];
    id v74 = (id)[v11 initWithFormat:@"http://schema.org/Reservation%@", v12];
  }
  else
  {
    id v74 = 0;
  }
  v108[0] = @"@context";
  v108[1] = @"@type";
  v109[0] = @"http://schema.org";
  v109[1] = @"http://schema.org/FlightReservation";
  v108[2] = @"reservationId";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = (void *)v13;
  v109[2] = v13;
  v108[3] = @"reservationStatus";
  uint64_t v14 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v71 = (void *)v5;
  v60 = (void *)v14;
  v109[3] = v14;
  v108[4] = @"totalPrice";
  uint64_t v15 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v15;
  v109[4] = v15;
  v108[5] = @"underName";
  v107[0] = @"http://schema.org/Person";
  v106[0] = @"@type";
  v106[1] = @"name";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v16;
  v107[1] = v16;
  v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:2];
  v109[5] = v66;
  v108[6] = @"reservationFor";
  v105[0] = @"http://schema.org/Flight";
  v104[0] = @"@type";
  v104[1] = @"flightDesignator";
  uint64_t v17 = v4;
  if (!v4)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v17;
  v105[1] = v17;
  v104[2] = @"flightNumber";
  uint64_t v18 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v56 = (void *)v18;
  v105[2] = v18;
  v104[3] = @"airline";
  v103[0] = @"http://schema.org/Airline";
  v102[0] = @"@type";
  v102[1] = @"iataCode";
  uint64_t v19 = v6;
  if (!v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v55 = (void *)v19;
  v103[1] = v19;
  v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:2];
  v105[3] = v65;
  v104[4] = @"departureTime";
  uint64_t v20 = v8;
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v54 = (void *)v20;
  v105[4] = v20;
  v104[5] = @"departureTerminal";
  uint64_t v21 = (uint64_t)v84;
  if (!v84)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v21;
  v105[5] = v21;
  v104[6] = @"departureGate";
  uint64_t v22 = (uint64_t)v83;
  if (!v83)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v22;
  v105[6] = v22;
  v104[7] = @"departureAirport";
  v101[0] = @"http://schema.org/Airport";
  v100[0] = @"@type";
  v100[1] = @"name";
  uint64_t v23 = (uint64_t)v86;
  if (!v86)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v23;
  v101[1] = v23;
  v100[2] = @"iataCode";
  uint64_t v24 = (uint64_t)v85;
  if (!v85)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = (void *)v24;
  v101[2] = v24;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:3];
  v105[7] = v64;
  v104[8] = @"boardingTime";
  uint64_t v25 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v25;
  v105[8] = v25;
  v104[9] = @"arrivalTime";
  uint64_t v26 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v26;
  v105[9] = v26;
  v104[10] = @"arrivalTerminal";
  uint64_t v27 = (uint64_t)v79;
  if (!v79)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v27;
  v105[10] = v27;
  v104[11] = @"arrivalGate";
  uint64_t v28 = (uint64_t)v78;
  if (!v78)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v28;
  v105[11] = v28;
  v104[12] = @"arrivalAirport";
  v99[0] = @"http://schema.org/Airport";
  v98[0] = @"@type";
  v98[1] = @"name";
  uint64_t v29 = (uint64_t)v81;
  if (!v81)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v6;
  v45 = (void *)v29;
  v99[1] = v29;
  v98[2] = @"iataCode";
  uint64_t v30 = (uint64_t)v80;
  if (!v80)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v8;
  v69 = (void *)v7;
  v44 = (void *)v30;
  v99[2] = v30;
  v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:3];
  v105[12] = v63;
  v104[13] = @"duration";
  uint64_t v31 = (uint64_t)v77;
  if (!v77)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v72 = (void *)v4;
  v43 = (void *)v31;
  v105[13] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:v104 count:14];
  v108[7] = @"reservedTicket";
  v96[1] = @"ticketedSeat";
  v97[0] = @"http://schema.org/Ticket";
  v96[0] = @"@type";
  v94[0] = @"@type";
  v94[1] = @"seatNumber";
  v95[0] = @"http://schema.org/Seat";
  v33 = v82;
  v62 = (void *)v32;
  v109[6] = v32;
  if (!v82)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v95[1] = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
  v97[1] = v34;
  v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
  v109[7] = v35;
  v108[8] = @"broker";
  v92[1] = @"name";
  v93[0] = @"http://schema.org/Organization";
  v92[0] = @"@type";
  v36 = v89;
  if (!v89)
  {
    v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v93[1] = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
  v109[8] = v37;
  v108[9] = @"potentialAction";
  v90[0] = @"@type";
  v90[1] = @"@context";
  v91[0] = @"CheckInAction";
  v91[1] = @"http://schema.org";
  v38 = v73;
  v90[2] = @"target";
  if (!v73)
  {
    v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v91[2] = v38;
  v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:3];
  v109[9] = v39;
  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:10];

  if (!v73) {
  if (!v89)
  }

  if (!v82) {
  if (!v77)
  }

  if (!v80) {
  if (!v81)
  }

  if (!v78) {
  if (!v79)
  }

  if (!v87) {
  if (!v88)
  }

  if (!v85) {
  if (!v86)
  }

  if (!v83) {
  if (v84)
  }
  {
    if (v68) {
      goto LABEL_76;
    }
  }
  else
  {

    if (v68) {
      goto LABEL_76;
    }
  }

LABEL_76:
  if (!v70) {

  }
  if (v75)
  {
    if (v72) {
      goto LABEL_80;
    }
  }
  else
  {

    if (v72) {
      goto LABEL_80;
    }
  }

LABEL_80:
  if (!v69) {

  }
  if (!v76) {
  if (!v74)
  }
  {

    if (v71) {
      goto LABEL_86;
    }
LABEL_92:

    goto LABEL_86;
  }
  if (!v71) {
    goto LABEL_92;
  }
LABEL_86:
  id v41 = v40;

  return v41;
}

@end