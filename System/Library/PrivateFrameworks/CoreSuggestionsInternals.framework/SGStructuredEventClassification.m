@interface SGStructuredEventClassification
+ (id)categoryForSchema:(id)a3;
+ (id)describeCategory:(unsigned __int8)a3;
+ (id)describeUseCase:(unsigned __int8)a3;
- (NSString)locale;
- (NSString)providerName;
- (SGStructuredEventClassification)initWithDictionary:(id)a3;
- (id)description;
- (unsigned)category;
- (unsigned)categoryForCategoryString:(id)a3;
- (unsigned)isCancelled;
- (unsigned)isCandidateForExtraction;
- (unsigned)useCase;
- (unsigned)useCaseForUseCaseString:(id)a3;
@end

@implementation SGStructuredEventClassification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (NSString)locale
{
  return self->_locale;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (unsigned)category
{
  return self->_category;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = objc_msgSend((id)objc_opt_class(), "describeCategory:", -[SGStructuredEventClassification category](self, "category"));
  v5 = objc_msgSend((id)objc_opt_class(), "describeUseCase:", -[SGStructuredEventClassification useCase](self, "useCase"));
  v6 = [(SGStructuredEventClassification *)self locale];
  v7 = (void *)[v3 initWithFormat:@"<SGStructuredEventClassification category:%@ useCase:%@ locale:%@>", v4, v5, v6];

  return v7;
}

- (unsigned)isCandidateForExtraction
{
  return (self->_useCase & 0xFE) == 2;
}

- (unsigned)isCancelled
{
  return self->_useCase == 3;
}

- (unsigned)useCaseForUseCaseString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoEvent"])
  {
    unsigned __int8 v4 = 1;
  }
  else if ([v3 isEqualToString:@"Confirmed"])
  {
    unsigned __int8 v4 = 2;
  }
  else if ([v3 isEqualToString:@"Cancelled"])
  {
    unsigned __int8 v4 = 3;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)categoryForCategoryString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"flight"])
  {
    unsigned __int8 v4 = 1;
  }
  else if ([v3 isEqualToString:@"bus"])
  {
    unsigned __int8 v4 = 2;
  }
  else if ([v3 isEqualToString:@"train"])
  {
    unsigned __int8 v4 = 3;
  }
  else if ([v3 isEqualToString:@"hotel"])
  {
    unsigned __int8 v4 = 4;
  }
  else if ([v3 isEqualToString:@"car"])
  {
    unsigned __int8 v4 = 5;
  }
  else if ([v3 isEqualToString:@"tickets"])
  {
    unsigned __int8 v4 = 6;
  }
  else if ([v3 isEqualToString:@"movie"])
  {
    unsigned __int8 v4 = 7;
  }
  else if ([v3 isEqualToString:@"restaurant"])
  {
    unsigned __int8 v4 = 8;
  }
  else if ([v3 isEqualToString:@"social"])
  {
    unsigned __int8 v4 = 9;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (SGStructuredEventClassification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGStructuredEventClassification;
  v5 = [(SGStructuredEventClassification *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"category"];
    v5->_category = [(SGStructuredEventClassification *)v5 categoryForCategoryString:v6];

    v7 = [v4 objectForKeyedSubscript:@"use_case"];
    v5->_useCase = [(SGStructuredEventClassification *)v5 useCaseForUseCaseString:v7];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"provider_name"];
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v10;
  }
  return v5;
}

+ (id)categoryForSchema:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"@type"];
  if ([@"http://schema.org/LodgingReservation" isEqualToString:v5])
  {
    uint64_t v6 = 4;
  }
  else if ([@"http://schema.org/RentalCarReservation" isEqualToString:v5])
  {
    uint64_t v6 = 5;
  }
  else if ([@"http://schema.org/FoodEstablishmentReservation" isEqualToString:v5])
  {
    uint64_t v6 = 8;
  }
  else if ([@"http://schema.org/FlightReservation" isEqualToString:v5])
  {
    uint64_t v6 = 1;
  }
  else if ([@"http://schema.org/EventReservation" isEqualToString:v5])
  {
    v7 = [v4 objectForKeyedSubscript:@"reservationFor"];
    if (v7)
    {
      uint64_t v8 = [v4 objectForKeyedSubscript:@"reservationFor"];
      v9 = [v8 objectForKeyedSubscript:@"@type"];
      char v10 = [@"http://schema.org/MovieShowing" isEqualToString:v9];

      if (v10)
      {
        uint64_t v6 = 7;
      }
      else
      {
        v11 = [v4 objectForKeyedSubscript:@"reservationFor"];
        v12 = [v11 objectForKeyedSubscript:@"@type"];
        char v13 = [@"http://schema.org/Event" isEqualToString:v12];

        uint64_t v6 = 6;
        if ((v13 & 1) == 0)
        {
          v14 = [v4 objectForKeyedSubscript:@"reservationFor"];
          v15 = [v14 objectForKeyedSubscript:@"@type"];
          int v16 = [@"http://schema.org/MusicEvent" isEqualToString:v15];

          if (v16) {
            uint64_t v6 = 6;
          }
          else {
            uint64_t v6 = 0;
          }
        }
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v17 = [a1 describeCategory:v6];

  return v17;
}

+ (id)describeUseCase:(unsigned __int8)a3
{
  if (a3 > 3u) {
    return @"Unknown";
  }
  else {
    return off_1E65BB960[a3];
  }
}

+ (id)describeCategory:(unsigned __int8)a3
{
  if (a3 > 9u) {
    return @"unknown";
  }
  else {
    return off_1E65BB910[a3];
  }
}

@end