@interface RTSourceEventKit
+ (BOOL)supportsSecureCoding;
+ (id)sharingStatusToString:(unint64_t)a3;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)suggestionsSchemaOrg;
- (NSString)eventIdentifier;
- (NSString)location;
- (NSString)suggestionInfo_opaqueKey;
- (NSString)title;
- (RTSourceEventKit)init;
- (RTSourceEventKit)initWithCoder:(id)a3;
- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9;
- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9 suggestionInfo_opaqueKey:(id)a10;
- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9 suggestionInfo_opaqueKey:(id)a10 suggestionsSchemaOrg:(id)a11;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sharingStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTSourceEventKit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharingStatusToString:(unint64_t)a3
{
  v3 = @"Not Shared";
  if (a3 == 1) {
    v3 = @"Shared From Me";
  }
  if (a3 == 2) {
    return @"Shared To Me";
  }
  else {
    return v3;
  }
}

- (RTSourceEventKit)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventIdentifier_startDate_endDate_title_location_allDay_sharingStatus_suggestionInfo_opaqueKey_suggestionsSchemaOrg_);
}

- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9
{
  return [(RTSourceEventKit *)self initWithEventIdentifier:a3 startDate:a4 endDate:a5 title:a6 location:a7 allDay:a8 sharingStatus:a9 suggestionInfo_opaqueKey:0 suggestionsSchemaOrg:0];
}

- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9 suggestionInfo_opaqueKey:(id)a10
{
  return [(RTSourceEventKit *)self initWithEventIdentifier:a3 startDate:a4 endDate:a5 title:a6 location:a7 allDay:a8 sharingStatus:a9 suggestionInfo_opaqueKey:a10 suggestionsSchemaOrg:0];
}

- (RTSourceEventKit)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 title:(id)a6 location:(id)a7 allDay:(BOOL)a8 sharingStatus:(unint64_t)a9 suggestionInfo_opaqueKey:(id)a10 suggestionsSchemaOrg:(id)a11
{
  id v17 = a3;
  id v39 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = a11;
  v40.receiver = self;
  v40.super_class = (Class)RTSourceEventKit;
  v23 = [(RTSourceEventKit *)&v40 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    eventIdentifier = v23->_eventIdentifier;
    v23->_eventIdentifier = (NSString *)v24;

    uint64_t v26 = [v39 copy];
    startDate = v23->_startDate;
    v23->_startDate = (NSDate *)v26;

    uint64_t v28 = [v18 copy];
    endDate = v23->_endDate;
    v23->_endDate = (NSDate *)v28;

    uint64_t v30 = [v19 copy];
    title = v23->_title;
    v23->_title = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    location = v23->_location;
    v23->_location = (NSString *)v32;

    v23->_allDay = a8;
    v23->_sharingStatus = a9;
    uint64_t v34 = [v21 copy];
    suggestionInfo_opaqueKey = v23->_suggestionInfo_opaqueKey;
    v23->_suggestionInfo_opaqueKey = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    suggestionsSchemaOrg = v23->_suggestionsSchemaOrg;
    v23->_suggestionsSchemaOrg = (NSDictionary *)v36;
  }
  return v23;
}

- (RTSourceEventKit)initWithCoder:(id)a3
{
  id v3 = a3;
  id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"eventIdentifier"];
  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  uint64_t v6 = [v3 decodeBoolForKey:@"allDay"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sharingStatus"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"suggestionInfo_opaqueKey"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v14 = [v3 decodeObjectOfClasses:v13 forKey:@"suggestionsSchemaOrg"];

  v15 = [(RTSourceEventKit *)self initWithEventIdentifier:v19 startDate:v18 endDate:v17 title:v4 location:v5 allDay:v6 sharingStatus:v8 suggestionInfo_opaqueKey:v9 suggestionsSchemaOrg:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RTSourceEventKit;
  id v4 = a3;
  [(RTSource *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventIdentifier, @"eventIdentifier", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_startDate forKey:@"startDate"];
  [v4 encodeObject:self->_endDate forKey:@"endDate"];
  [v4 encodeObject:self->_title forKey:@"title"];
  [v4 encodeObject:self->_location forKey:@"location"];
  [v4 encodeBool:self->_allDay forKey:@"allDay"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_sharingStatus];
  [v4 encodeObject:v5 forKey:@"sharingStatus"];

  [v4 encodeObject:self->_suggestionInfo_opaqueKey forKey:@"suggestionInfo_opaqueKey"];
  [v4 encodeObject:self->_suggestionsSchemaOrg forKey:@"suggestionsSchemaOrg"];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(RTSourceEventKit *)self eventIdentifier];
  v7 = [(RTSourceEventKit *)self startDate];
  uint64_t v8 = [(RTSourceEventKit *)self endDate];
  v9 = [(RTSourceEventKit *)self title];
  v10 = [(RTSourceEventKit *)self location];
  uint64_t v11 = objc_msgSend((id)objc_opt_class(), "sharingStatusToString:", -[RTSourceEventKit sharingStatus](self, "sharingStatus"));
  uint64_t v12 = [(RTSourceEventKit *)self suggestionsSchemaOrg];
  v13 = @"YES";
  if (!v12) {
    v13 = @"NO";
  }
  v14 = [v3 stringWithFormat:@"%@, eventIdentifier, %@, startDate, %@, endDate, %@, title, %@, location %@, sharingStatus, %@, suggestionsSchemaOrg, %@", v5, v6, v7, v8, v9, v10, v11, v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceEventKit;
  if ([(RTSource *)&v12 isEqual:v5])
  {
    id v6 = v5;
    v7 = [(RTSourceEventKit *)self eventIdentifier];
    if (v7 || ([v6 eventIdentifier], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [(RTSourceEventKit *)self eventIdentifier];
      v9 = [v6 eventIdentifier];
      char v10 = [v8 isEqualToString:v9];

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v10 = 1;
    }

    goto LABEL_9;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)RTSourceEventKit;
  unint64_t v3 = [(RTSource *)&v7 hash];
  id v4 = [(RTSourceEventKit *)self eventIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSString)suggestionInfo_opaqueKey
{
  return self->_suggestionInfo_opaqueKey;
}

- (NSDictionary)suggestionsSchemaOrg
{
  return self->_suggestionsSchemaOrg;
}

- (unint64_t)sharingStatus
{
  return self->_sharingStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsSchemaOrg, 0);
  objc_storeStrong((id *)&self->_suggestionInfo_opaqueKey, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end