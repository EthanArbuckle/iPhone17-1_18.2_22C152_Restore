@interface BMHomeKitClientBase
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMHomeKitClientBase)initWithDateInterval:(id)a3 homeUniqueIdentifier:(id)a4 homeOccupancy:(int)a5 source:(id)a6 clientName:(id)a7 eventCorrelationIdentifier:(id)a8;
- (BMHomeKitClientBase)initWithProto:(id)a3;
- (BMHomeKitClientBase)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateInterval;
- (NSString)clientName;
- (NSString)description;
- (NSString)eventCorrelationIdentifier;
- (NSString)homeUniqueIdentifier;
- (NSString)source;
- (double)absoluteTimestamp;
- (double)duration;
- (id)encodeAsProto;
- (id)proto;
- (int)homeOccupancy;
- (unsigned)dataVersion;
@end

@implementation BMHomeKitClientBase

- (BMHomeKitClientBase)initWithDateInterval:(id)a3 homeUniqueIdentifier:(id)a4 homeOccupancy:(int)a5 source:(id)a6 clientName:(id)a7 eventCorrelationIdentifier:(id)a8
{
  id v14 = a3;
  id v24 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMHomeKitClientBase;
  v18 = [(BMHomeKitClientBase *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dateInterval, a3);
    v20 = [v14 startDate];
    v19->_absoluteTimestamp = MEMORY[0x192FB0750]();

    [v14 duration];
    v19->_duration = v21;
    objc_storeStrong((id *)&v19->_homeUniqueIdentifier, a4);
    v19->_homeOccupancy = a5;
    objc_storeStrong((id *)&v19->_source, a6);
    objc_storeStrong((id *)&v19->_clientName, a7);
    objc_storeStrong((id *)&v19->_eventCorrelationIdentifier, a8);
  }

  return v19;
}

- (NSString)description
{
  v3 = NSString;
  homeUniqueIdentifier = self->_homeUniqueIdentifier;
  v5 = [NSNumber numberWithInt:self->_homeOccupancy];
  v6 = [v3 stringWithFormat:@"BMHomeKitClientBase homeUUID:%@, homeOccupancy:%@, source:%@, clientName:%@", homeUniqueIdentifier, v5, self->_source, self->_clientName];

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[BMHomeKitClientBase eventWithData:dataVersion:](v7);
    }

    v8 = 0;
  }
  else
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }

  return v8;
}

- (id)encodeAsProto
{
  v2 = [(BMHomeKitClientBase *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMHomeKitClientBase)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    id v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BMHomeKitClientBase initWithProto:]((uint64_t)self, v17);
    }

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E4F28C18];
  id v6 = v4;
  id v7 = [v5 alloc];
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v6 absoluteTimestamp];
  v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  [v6 duration];
  v10 = objc_msgSend(v7, "initWithStartDate:duration:", v9);

  v11 = [v6 homeUniqueIdentifier];
  uint64_t v12 = [v6 homeOccupancy];
  v13 = [v6 source];
  id v14 = [v6 clientName];
  id v15 = [v6 eventCorrelationIdentifier];

  self = [(BMHomeKitClientBase *)self initWithDateInterval:v10 homeUniqueIdentifier:v11 homeOccupancy:v12 source:v13 clientName:v14 eventCorrelationIdentifier:v15];
  id v16 = self;
LABEL_8:

  return v16;
}

- (BMHomeKitClientBase)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBHomeKitClientBase alloc] initWithData:v4];

    self = [(BMHomeKitClientBase *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  [v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  [v3 setDuration:self->_duration];
  [v3 setHomeUniqueIdentifier:self->_homeUniqueIdentifier];
  [v3 setHomeOccupancy:self->_homeOccupancy];
  [v3 setSource:self->_source];
  [v3 setClientName:self->_clientName];
  [v3 setEventCorrelationIdentifier:self->_eventCorrelationIdentifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v11 = 0;
    goto LABEL_36;
  }
  id v9 = v8;
  v10 = [(BMHomeKitClientBase *)self dateInterval];
  if (!v10)
  {
    id v4 = [v9 dateInterval];
    if (!v4)
    {
      char v30 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  v3 = [(BMHomeKitClientBase *)self dateInterval];
  v5 = [v9 dateInterval];
  char v30 = [v3 isEqual:v5];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_9:

  uint64_t v12 = [(BMHomeKitClientBase *)self homeUniqueIdentifier];
  if (!v12)
  {
    v5 = [v9 homeUniqueIdentifier];
    if (!v5)
    {
      char v29 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  v3 = [(BMHomeKitClientBase *)self homeUniqueIdentifier];
  v13 = [v9 homeUniqueIdentifier];
  char v29 = [v3 isEqual:v13];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_15:

  int v28 = [(BMHomeKitClientBase *)self homeOccupancy];
  int v14 = [v9 homeOccupancy];
  id v15 = [(BMHomeKitClientBase *)self source];
  if (!v15)
  {
    id v6 = [v9 source];
    if (!v6)
    {
      char v17 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  v3 = [(BMHomeKitClientBase *)self source];
  id v16 = [v9 source];
  char v17 = [v3 isEqual:v16];

  if (!v15) {
    goto LABEL_20;
  }
LABEL_21:

  v18 = [(BMHomeKitClientBase *)self clientName];
  if (!v18)
  {
    v3 = [v9 clientName];
    if (!v3)
    {
      char v21 = 1;
LABEL_26:

      goto LABEL_27;
    }
  }
  v19 = [(BMHomeKitClientBase *)self clientName];
  v20 = [v9 clientName];
  char v21 = [v19 isEqual:v20];

  if (!v18) {
    goto LABEL_26;
  }
LABEL_27:

  v22 = [(BMHomeKitClientBase *)self eventCorrelationIdentifier];
  if (!v22)
  {
    v3 = [v9 eventCorrelationIdentifier];
    if (!v3)
    {
      char v25 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  v23 = [(BMHomeKitClientBase *)self eventCorrelationIdentifier];
  id v24 = [v9 eventCorrelationIdentifier];
  char v25 = [v23 isEqual:v24];

  if (!v22) {
    goto LABEL_32;
  }
LABEL_33:

  char v26 = v30 & v29;
  if (v28 != v14) {
    char v26 = 0;
  }
  char v11 = v26 & v17 & v21 & v25;

LABEL_36:
  return v11;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (int)homeOccupancy
{
  return self->_homeOccupancy;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)eventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Mismatched HomeKitClientBase data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_18E67D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBHomeKitClientBase proto", (uint8_t *)&v5, 0xCu);
}

@end