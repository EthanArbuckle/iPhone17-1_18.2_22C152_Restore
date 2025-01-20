@interface FUFlight
+ (BOOL)supportsSecureCoding;
+ (id)timeFormatterForIdentifier;
+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 completionHandler:(id)a7;
- (BOOL)isEqual:(id)a3;
- (FUAirline)airline;
- (FUAirline)displayAirline;
- (FUFlight)initWithCoder:(id)a3;
- (FUFlightStep)arrival;
- (FUFlightStep)departure;
- (NSArray)allLegs;
- (NSArray)codeShares;
- (NSArray)legs;
- (NSDate)expirationDate;
- (NSString)cancellationMessage;
- (NSString)displayFlightCode;
- (NSString)flightCode;
- (NSString)flightIdentifier;
- (NSString)identifier;
- (NSString)queriedAirlineTitle;
- (NSString)rawResponse;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)firstLeg;
- (id)lastLeg;
- (id)legsAsFlights;
- (id)relevantLeg;
- (int64_t)status;
- (unint64_t)arrivalLegIndex;
- (unint64_t)departureLegIndex;
- (unint64_t)displayFlightNumber;
- (unint64_t)flightNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAirline:(id)a3;
- (void)setAllLegs:(id)a3;
- (void)setArrivalLegIndex:(unint64_t)a3;
- (void)setCancellationMessage:(id)a3;
- (void)setCodeShares:(id)a3;
- (void)setDepartureLegIndex:(unint64_t)a3;
- (void)setDepartureLegIndex:(unint64_t)a3 arrivalLegIndex:(unint64_t)a4;
- (void)setDisplayAirline:(id)a3;
- (void)setDisplayFlightNumber:(unint64_t)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFlightIdentifier:(id)a3;
- (void)setFlightNumber:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setLegs:(id)a3;
- (void)setQueriedAirlineTitle:(id)a3;
- (void)setRawResponse:(id)a3;
@end

@implementation FUFlight

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(FUFlight *)self codeShares];
    v7 = [v5 codeShares];
    if (v6 != v7)
    {
      v8 = [(FUFlight *)self codeShares];
      v3 = [v5 codeShares];
      if (![v8 isEqual:v3])
      {
        char v9 = 0;
        goto LABEL_32;
      }
      v71 = v8;
    }
    v10 = [(FUFlight *)self displayAirline];
    v11 = [v5 displayAirline];
    if (v10 != v11)
    {
      v12 = [(FUFlight *)self displayAirline];
      v13 = [v5 displayAirline];
      if (![v12 isEqual:v13])
      {
        char v9 = 0;
LABEL_30:

LABEL_31:
        v8 = v71;
        if (v6 == v7)
        {
LABEL_33:

          goto LABEL_34;
        }
LABEL_32:

        goto LABEL_33;
      }
      v68 = v13;
      v69 = v12;
    }
    v14 = [(FUFlight *)self queriedAirlineTitle];
    v72 = [v5 queriedAirlineTitle];
    if (v14 != v72)
    {
      v15 = [(FUFlight *)self queriedAirlineTitle];
      v67 = [v5 queriedAirlineTitle];
      if (!objc_msgSend(v15, "isEqual:"))
      {
        char v9 = 0;
        goto LABEL_28;
      }
      v70 = v15;
    }
    unint64_t v16 = [(FUFlight *)self displayFlightNumber];
    if (v16 == [v5 displayFlightNumber])
    {
      uint64_t v17 = [(FUFlight *)self airline];
      [v5 airline];
      uint64_t v63 = v64 = (void *)v17;
      v65 = v14;
      v66 = v3;
      if (v17 != v63)
      {
        v18 = [(FUFlight *)self airline];
        v61 = [v5 airline];
        v62 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v9 = 0;
          v19 = (void *)v17;
          v20 = (void *)v63;
          v15 = v70;
          goto LABEL_26;
        }
      }
      unint64_t v21 = [(FUFlight *)self flightNumber];
      if (v21 != [v5 flightNumber])
      {
        char v9 = 0;
        v19 = v64;
        v20 = (void *)v63;
        v15 = v70;
        if (v64 == (void *)v63) {
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      uint64_t v22 = [(FUFlight *)self cancellationMessage];
      uint64_t v59 = [v5 cancellationMessage];
      v60 = (void *)v22;
      BOOL v23 = v22 == v59;
      v15 = v70;
      if (!v23)
      {
        v24 = [(FUFlight *)self cancellationMessage];
        v55 = [v5 cancellationMessage];
        v56 = v24;
        if (![v24 isEqual:v55])
        {
          char v9 = 0;
          v26 = (void *)v59;
          v25 = v60;
LABEL_59:

LABEL_60:
          v19 = v64;
          v20 = (void *)v63;
          if (v64 == (void *)v63)
          {
LABEL_27:

            v14 = v65;
            v3 = v66;
            if (v65 == v72) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }
LABEL_26:

          goto LABEL_27;
        }
      }
      uint64_t v28 = [(FUFlight *)self allLegs];
      uint64_t v57 = [v5 allLegs];
      v58 = (void *)v28;
      if (v28 != v57)
      {
        v29 = [(FUFlight *)self allLegs];
        v51 = [v5 allLegs];
        v52 = v29;
        if (!objc_msgSend(v29, "isEqual:"))
        {
          char v9 = 0;
          v30 = (void *)v57;
LABEL_57:

LABEL_58:
          v26 = (void *)v59;
          v25 = v60;
          if (v60 == (void *)v59) {
            goto LABEL_60;
          }
          goto LABEL_59;
        }
      }
      uint64_t v31 = [(FUFlight *)self legs];
      uint64_t v53 = [v5 legs];
      v54 = (void *)v31;
      if (v31 != v53)
      {
        v32 = [(FUFlight *)self legs];
        v47 = [v5 legs];
        v48 = v32;
        if (!objc_msgSend(v32, "isEqual:"))
        {
          char v9 = 0;
          v33 = (void *)v53;
LABEL_55:

LABEL_56:
          v30 = (void *)v57;
          if (v58 == (void *)v57) {
            goto LABEL_58;
          }
          goto LABEL_57;
        }
      }
      uint64_t v34 = [(FUFlight *)self identifier];
      uint64_t v49 = [v5 identifier];
      v50 = (void *)v34;
      if (v34 != v49)
      {
        v35 = [(FUFlight *)self identifier];
        v45 = [v5 identifier];
        v46 = v35;
        if (!objc_msgSend(v35, "isEqual:"))
        {
          char v9 = 0;
          v42 = (void *)v49;
          goto LABEL_53;
        }
        uint64_t v34 = (uint64_t)v50;
      }
      unint64_t v36 = [(FUFlight *)self departureLegIndex];
      if (v36 == [v5 departureLegIndex]
        && (unint64_t v37 = -[FUFlight arrivalLegIndex](self, "arrivalLegIndex"), v37 == [v5 arrivalLegIndex]))
      {
        v38 = [(FUFlight *)self expirationDate];
        uint64_t v39 = [v5 expirationDate];
        if (v38 == (void *)v39)
        {

          char v9 = 1;
        }
        else
        {
          v44 = (void *)v39;
          v43 = [(FUFlight *)self expirationDate];
          v40 = [v5 expirationDate];
          char v9 = [v43 isEqual:v40];
        }
        v42 = (void *)v49;
        v41 = v50;
      }
      else
      {
        char v9 = 0;
        v41 = (void *)v34;
        v42 = (void *)v49;
      }
      v15 = v70;
      if (v41 == v42)
      {
LABEL_54:

        v33 = (void *)v53;
        if (v54 == (void *)v53) {
          goto LABEL_56;
        }
        goto LABEL_55;
      }
LABEL_53:

      goto LABEL_54;
    }
    char v9 = 0;
    v15 = v70;
    if (v14 == v72)
    {
LABEL_29:

      v13 = v68;
      v12 = v69;
      if (v10 == v11) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
  char v9 = 0;
LABEL_34:

  return v9;
}

- (id)description
{
  v14 = NSString;
  v3 = [(FUFlight *)self flightCode];
  v15 = [(FUFlight *)self airline];
  v4 = [v15 name];
  id v5 = [(FUFlight *)self departure];
  v6 = [v5 airport];
  v7 = [v6 IATACode];
  v8 = [(FUFlight *)self arrival];
  char v9 = [v8 airport];
  v10 = [v9 IATACode];
  v11 = [(FUFlight *)self allLegs];
  v12 = [v14 stringWithFormat:@"Flight: %@ (%@) %@ => %@ Legs: %@", v3, v4, v7, v10, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setFlightNumber:", -[FUFlight flightNumber](self, "flightNumber"));
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(FUFlight *)self allLegs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v16 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [v4 setAllLegs:v5];
  v11 = [(FUFlight *)self airline];
  v12 = (void *)[v11 copy];
  [v4 setAirline:v12];

  v13 = [(FUFlight *)self cancellationMessage];
  v14 = (void *)[v13 copy];
  [v4 setCancellationMessage:v14];

  objc_msgSend(v4, "setDepartureLegIndex:arrivalLegIndex:", -[FUFlight departureLegIndex](self, "departureLegIndex"), -[FUFlight arrivalLegIndex](self, "arrivalLegIndex"));
  return v4;
}

- (id)legsAsFlights
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(FUFlight *)self legs];
  uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = objc_alloc_init(FUFlight);
        uint64_t v10 = [(FUFlight *)self airline];
        [(FUFlight *)v9 setAirline:v10];

        [(FUFlight *)v9 setFlightNumber:[(FUFlight *)self flightNumber]];
        v11 = [(FUFlight *)self cancellationMessage];
        [(FUFlight *)v9 setCancellationMessage:v11];

        v12 = (void *)[v8 copy];
        v20 = v12;
        v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
        [(FUFlight *)v9 setAllLegs:v13];

        [v3 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v5);
  }

  return v3;
}

- (NSString)flightCode
{
  v3 = NSString;
  uint64_t v4 = [(FUFlight *)self airline];
  uint64_t v5 = [v4 IATACode];
  uint64_t v6 = [v3 stringWithFormat:@"%@%ld", v5, -[FUFlight flightNumber](self, "flightNumber")];

  return (NSString *)v6;
}

- (NSString)displayFlightCode
{
  v3 = NSString;
  uint64_t v4 = [(FUFlight *)self queriedAirlineTitle];
  uint64_t v5 = [v3 stringWithFormat:@"%@%ld", v4, -[FUFlight displayFlightNumber](self, "displayFlightNumber")];

  return (NSString *)v5;
}

- (void)setAllLegs:(id)a3
{
  objc_storeStrong((id *)&self->_allLegs, a3);
  id v5 = a3;
  [(FUFlight *)self setDepartureLegIndex:0];
  -[FUFlight setArrivalLegIndex:](self, "setArrivalLegIndex:", [v5 count] - 1);
  [(FUFlight *)self setLegs:v5];
}

- (void)setDepartureLegIndex:(unint64_t)a3 arrivalLegIndex:(unint64_t)a4
{
  -[FUFlight setDepartureLegIndex:](self, "setDepartureLegIndex:");
  [(FUFlight *)self setArrivalLegIndex:a4];
  id v8 = [(FUFlight *)self allLegs];
  uint64_t v7 = objc_msgSend(v8, "subarrayWithRange:", a3, a4 - a3 + 1);
  [(FUFlight *)self setLegs:v7];
}

- (int64_t)status
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(FUFlight *)self legs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) status];
        if (v8 <= 6)
        {
          int64_t v9 = v8;
          if (((1 << v8) & 0x30) != 0)
          {
            uint64_t v5 = v8;
          }
          else if (v8 == 1)
          {
            if (v5 == 4)
            {
              int64_t v9 = 2;
              goto LABEL_20;
            }
            if (v5 == 5)
            {
              int64_t v9 = 3;
              goto LABEL_20;
            }
            uint64_t v5 = 1;
          }
          else if (((1 << v8) & 0x4C) != 0)
          {
            goto LABEL_20;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      int64_t v9 = v5;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v9 = 0;
  }
LABEL_20:

  return v9;
}

- (id)relevantLeg
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(FUFlight *)self legs];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        unint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        unint64_t v9 = [v8 status];
        if (v9 <= 6)
        {
          if (((1 << v9) & 0x30) != 0)
          {
            id v10 = v8;

            id v5 = v10;
          }
          else if (((1 << v9) & 0x4E) != 0)
          {
            id v12 = v8;

            goto LABEL_17;
          }
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v11 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v4 = v11;
    }
    while (v11);
  }
  else
  {
    id v5 = 0;
  }

  id v5 = v5;
  id v12 = v5;
LABEL_17:

  return v12;
}

- (id)firstLeg
{
  uint64_t v3 = [(FUFlight *)self legs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(FUFlight *)self legs];
    uint64_t v6 = [v5 firstObject];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)lastLeg
{
  uint64_t v3 = [(FUFlight *)self legs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(FUFlight *)self legs];
    uint64_t v6 = [v5 lastObject];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (FUFlightStep)departure
{
  v2 = [(FUFlight *)self firstLeg];
  uint64_t v3 = [v2 departure];

  return (FUFlightStep *)v3;
}

- (FUFlightStep)arrival
{
  v2 = [(FUFlight *)self lastLeg];
  uint64_t v3 = [v2 arrival];

  return (FUFlightStep *)v3;
}

- (double)duration
{
  v2 = [(FUFlight *)self legs];
  uint64_t v3 = [v2 firstObject];
  [v3 duration];
  double v5 = v4;

  return v5;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    uint64_t v3 = identifier;
  }
  else
  {
    BOOL v23 = +[FUFlight timeFormatterForIdentifier];
    double v5 = [(FUFlight *)self allLegs];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 departure];
    unint64_t v8 = [v7 airport];
    unint64_t v9 = [v8 timeZone];
    [v23 setTimeZone:v9];

    uint64_t v22 = NSString;
    id v10 = [(FUFlight *)self airline];
    uint64_t v11 = [v10 IATACode];
    unint64_t v12 = [(FUFlight *)self flightNumber];
    long long v13 = [(FUFlight *)self departure];
    long long v14 = [v13 airport];
    long long v15 = [v14 IATACode];
    long long v16 = [(FUFlight *)self arrival];
    long long v17 = [v16 airport];
    long long v18 = [v17 IATACode];
    uint64_t v19 = [v22 stringWithFormat:@"%@-%ld-%@-%@", v11, v12, v15, v18];
    v20 = self->_identifier;
    self->_identifier = v19;

    uint64_t v3 = self->_identifier;
  }
  return v3;
}

+ (id)timeFormatterForIdentifier
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  [v2 setDateFormat:@"ddMMyyyy"];
  uint64_t v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];

  double v4 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  [v2 setCalendar:v4];

  return v2;
}

+ (void)loadFlightsWithNumber:(unint64_t)a3 airlineCode:(id)a4 date:(id)a5 dateType:(int64_t)a6 completionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  [(objc_class *)+[FUFlightFactory flightFactoryClassWithProvider:@"FUFactoryProvider_Default"] loadFlightsWithNumber:a3 airlineCode:v13 date:v12 dateType:a6 completionHandler:v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v24 = a3;
  double v4 = [(FUFlight *)self codeShares];

  if (v4)
  {
    double v5 = [(FUFlight *)self codeShares];
    [v24 encodeObject:v5 forKey:@"codeShares"];
  }
  uint64_t v6 = [(FUFlight *)self displayAirline];

  if (v6)
  {
    uint64_t v7 = [(FUFlight *)self displayAirline];
    [v24 encodeObject:v7 forKey:@"displayAirline"];
  }
  unint64_t v8 = [(FUFlight *)self queriedAirlineTitle];

  if (v8)
  {
    unint64_t v9 = [(FUFlight *)self queriedAirlineTitle];
    [v24 encodeObject:v9 forKey:@"queriedAirlineTitle"];
  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight displayFlightNumber](self, "displayFlightNumber"), @"displayFlightNumber");
  id v10 = [(FUFlight *)self airline];

  if (v10)
  {
    id v11 = [(FUFlight *)self airline];
    [v24 encodeObject:v11 forKey:@"airline"];
  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight flightNumber](self, "flightNumber"), @"flightNumber");
  id v12 = [(FUFlight *)self cancellationMessage];

  if (v12)
  {
    id v13 = [(FUFlight *)self cancellationMessage];
    [v24 encodeObject:v13 forKey:@"cancellationMessage"];
  }
  long long v14 = [(FUFlight *)self allLegs];

  if (v14)
  {
    long long v15 = [(FUFlight *)self allLegs];
    [v24 encodeObject:v15 forKey:@"allLegs"];
  }
  long long v16 = [(FUFlight *)self legs];

  if (v16)
  {
    long long v17 = [(FUFlight *)self legs];
    [v24 encodeObject:v17 forKey:@"legs"];
  }
  long long v18 = [(FUFlight *)self identifier];

  if (v18)
  {
    uint64_t v19 = [(FUFlight *)self identifier];
    [v24 encodeObject:v19 forKey:@"identifier"];
  }
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight departureLegIndex](self, "departureLegIndex"), @"departureLegIndex");
  objc_msgSend(v24, "encodeInteger:forKey:", -[FUFlight arrivalLegIndex](self, "arrivalLegIndex"), @"arrivalLegIndex");
  v20 = [(FUFlight *)self expirationDate];

  if (v20)
  {
    uint64_t v21 = [(FUFlight *)self expirationDate];
    [v24 encodeObject:v21 forKey:@"expirationDate"];
  }
  uint64_t v22 = [(FUFlight *)self rawResponse];

  if (v22)
  {
    BOOL v23 = [(FUFlight *)self rawResponse];
    [v24 encodeObject:v23 forKey:@"rawResponse"];
  }
}

- (FUFlight)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)FUFlight;
  double v5 = [(FUFlight *)&v38 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"codeShares"];
    codeShares = v5->_codeShares;
    v5->_codeShares = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayAirline"];
    displayAirline = v5->_displayAirline;
    v5->_displayAirline = (FUAirline *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queriedAirlineTitle"];
    queriedAirlineTitle = v5->_queriedAirlineTitle;
    v5->_queriedAirlineTitle = (NSString *)v13;

    v5->_displayFlightNumber = [v4 decodeIntegerForKey:@"displayFlightNumber"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"airline"];
    airline = v5->_airline;
    v5->_airline = (FUAirline *)v15;

    v5->_flightNumber = [v4 decodeIntegerForKey:@"flightNumber"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancellationMessage"];
    cancellationMessage = v5->_cancellationMessage;
    v5->_cancellationMessage = (NSString *)v17;

    uint64_t v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"allLegs"];
    allLegs = v5->_allLegs;
    v5->_allLegs = (NSArray *)v22;

    id v24 = (void *)MEMORY[0x263EFFA08];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"legs"];
    legs = v5->_legs;
    v5->_legs = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v29;

    v5->_departureLegIndex = [v4 decodeIntegerForKey:@"departureLegIndex"];
    uint64_t v31 = [v4 decodeIntegerForKey:@"arrivalLegIndex"];
    v5->_arrivalLegIndex = v31;
    [(FUFlight *)v5 setDepartureLegIndex:v5->_departureLegIndex arrivalLegIndex:v31];
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawResponse"];
    rawResponse = v5->_rawResponse;
    v5->_rawResponse = (NSString *)v34;

    unint64_t v36 = v5;
  }

  return v5;
}

- (NSString)queriedAirlineTitle
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueriedAirlineTitle:(id)a3
{
}

- (FUAirline)displayAirline
{
  return (FUAirline *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayAirline:(id)a3
{
}

- (unint64_t)displayFlightNumber
{
  return self->_displayFlightNumber;
}

- (void)setDisplayFlightNumber:(unint64_t)a3
{
  self->_displayFlightNumber = a3;
}

- (FUAirline)airline
{
  return (FUAirline *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAirline:(id)a3
{
}

- (unint64_t)flightNumber
{
  return self->_flightNumber;
}

- (void)setFlightNumber:(unint64_t)a3
{
  self->_flightNumber = a3;
}

- (NSString)flightIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFlightIdentifier:(id)a3
{
}

- (NSString)cancellationMessage
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCancellationMessage:(id)a3
{
}

- (NSArray)legs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLegs:(id)a3
{
}

- (NSArray)codeShares
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCodeShares:(id)a3
{
}

- (NSArray)allLegs
{
  return self->_allLegs;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)departureLegIndex
{
  return self->_departureLegIndex;
}

- (void)setDepartureLegIndex:(unint64_t)a3
{
  self->_departureLegIndex = a3;
}

- (unint64_t)arrivalLegIndex
{
  return self->_arrivalLegIndex;
}

- (void)setArrivalLegIndex:(unint64_t)a3
{
  self->_arrivalLegIndex = a3;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)rawResponse
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRawResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResponse, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_allLegs, 0);
  objc_storeStrong((id *)&self->_codeShares, 0);
  objc_storeStrong((id *)&self->_legs, 0);
  objc_storeStrong((id *)&self->_cancellationMessage, 0);
  objc_storeStrong((id *)&self->_flightIdentifier, 0);
  objc_storeStrong((id *)&self->_airline, 0);
  objc_storeStrong((id *)&self->_displayAirline, 0);
  objc_storeStrong((id *)&self->_queriedAirlineTitle, 0);
}

@end