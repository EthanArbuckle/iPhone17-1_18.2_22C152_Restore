@interface BMRemindersContentEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMRemindersContentEvent)initWithCoder:(id)a3;
- (BMRemindersContentEvent)initWithProto:(id)a3;
- (BMRemindersContentEvent)initWithProtoData:(id)a3;
- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 notes:(id)a7 isAllDay:(BOOL)a8 completionDateTimestamp:(double)a9 dueDateTimestamp:(double)a10 priority:(int)a11;
- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 notes:(id)a7 isAllDay:(BOOL)a8 completionDateTimestamp:(double)a9 dueDateTimestamp:(double)a10 priority:(int)a11 contentProtection:(id)a12;
- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 notes:(id)a8 isAllDay:(BOOL)a9 completionDateTimestamp:(double)a10 dueDateTimestamp:(double)a11 priority:(int)a12 contentProtection:(id)a13;
- (BOOL)isAllDay;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)contentProtection;
- (NSString)domainId;
- (NSString)notes;
- (NSString)personaId;
- (NSString)title;
- (NSString)uniqueId;
- (double)absoluteTimestamp;
- (double)completionDateTimestamp;
- (double)dueDateTimestamp;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (int)priority;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)json;
@end

@implementation BMRemindersContentEvent

- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 personaId:(id)a5 absoluteTimestamp:(double)a6 title:(id)a7 notes:(id)a8 isAllDay:(BOOL)a9 completionDateTimestamp:(double)a10 dueDateTimestamp:(double)a11 priority:(int)a12 contentProtection:(id)a13
{
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id obj = a7;
  id v34 = a7;
  id v25 = a8;
  id v33 = a13;
  if (!v22)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"BMRemindersContentEvent.m", 37, @"Invalid parameter not satisfying: %@", @"uniqueId" object file lineNumber description];
  }
  v35.receiver = self;
  v35.super_class = (Class)BMRemindersContentEvent;
  v26 = [(BMRemindersContentEvent *)&v35 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_uniqueId, a3);
    objc_storeStrong((id *)&v27->_domainId, a4);
    objc_storeStrong((id *)&v27->_personaId, a5);
    v27->_absoluteTimestamp = a6;
    objc_storeStrong((id *)&v27->_title, obj);
    objc_storeStrong((id *)&v27->_notes, a8);
    v27->_isAllDay = a9;
    v27->_completionDateTimestamp = a10;
    v27->_dueDateTimestamp = a11;
    v27->_priority = a12;
    objc_storeStrong((id *)&v27->_contentProtection, a13);
  }

  return v27;
}

- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 notes:(id)a7 isAllDay:(BOOL)a8 completionDateTimestamp:(double)a9 dueDateTimestamp:(double)a10 priority:(int)a11 contentProtection:(id)a12
{
  LODWORD(v13) = a11;
  return [(BMRemindersContentEvent *)self initWithUniqueId:a3 domainId:a4 personaId:0 absoluteTimestamp:a6 title:a7 notes:a8 isAllDay:a5 completionDateTimestamp:a9 dueDateTimestamp:a10 priority:v13 contentProtection:a12];
}

- (BMRemindersContentEvent)initWithUniqueId:(id)a3 domainId:(id)a4 absoluteTimestamp:(double)a5 title:(id)a6 notes:(id)a7 isAllDay:(BOOL)a8 completionDateTimestamp:(double)a9 dueDateTimestamp:(double)a10 priority:(int)a11
{
  return [(BMRemindersContentEvent *)self initWithUniqueId:a3 domainId:a4 absoluteTimestamp:a6 title:a7 notes:a8 isAllDay:*(void *)&a11 completionDateTimestamp:a5 dueDateTimestamp:a9 priority:a10 contentProtection:0];
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMRemindersContentEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  v2 = [(BMRemindersContentEvent *)self proto];
  v3 = [v2 dictionaryRepresentation];

  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(BMRemindersContentEvent *)self jsonDict];
  id v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (!v4)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BMRemindersContentEvent *)(uint64_t)v5 json];
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMRemindersContentEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"dat"];
}

- (BMRemindersContentEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"dat" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMRemindersContentEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMRemindersContentEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMRemindersContentEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v5 hasUniqueId]
        && [v5 hasAbsoluteTimestamp]
        && [v5 hasIsAllDay]
        && [v5 hasCompletionDateTimestamp]
        && [v5 hasDueDateTimestamp]
        && ([v5 hasPriority] & 1) != 0)
      {
        id v23 = [v5 uniqueId];
        id v6 = [v5 domainId];
        v7 = [v5 personaId];
        [v5 absoluteTimestamp];
        double v9 = v8;
        v10 = [v5 title];
        v11 = [v5 notes];
        uint64_t v12 = [v5 isAllDay];
        [v5 completionDateTimestamp];
        double v14 = v13;
        [v5 dueDateTimestamp];
        double v16 = v15;
        int v17 = [v5 priority];
        v18 = [v5 contentProtection];
        LODWORD(v22) = v17;
        self = [(BMRemindersContentEvent *)self initWithUniqueId:v23 domainId:v6 personaId:v7 absoluteTimestamp:v10 title:v11 notes:v12 isAllDay:v9 completionDateTimestamp:v14 dueDateTimestamp:v16 priority:v22 contentProtection:v18];

        v19 = self;
LABEL_17:

        goto LABEL_18;
      }
      v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[BMRemindersContentEvent initWithProto:](v20);
      }
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMRemindersContentEvent initWithProto:](v5);
      }
    }
    v19 = 0;
    goto LABEL_17;
  }
  v19 = 0;
LABEL_18:

  return v19;
}

- (BMRemindersContentEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBRemindersContentEvent alloc] initWithData:v4];

    self = [(BMRemindersContentEvent *)self initWithProto:v5];
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
  id v4 = [(BMRemindersContentEvent *)self uniqueId];
  [v3 setUniqueId:v4];

  id v5 = [(BMRemindersContentEvent *)self domainId];
  [v3 setDomainId:v5];

  id v6 = [(BMRemindersContentEvent *)self personaId];
  [v3 setPersonaId:v6];

  [(BMRemindersContentEvent *)self absoluteTimestamp];
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  v7 = [(BMRemindersContentEvent *)self title];
  [v3 setTitle:v7];

  double v8 = [(BMRemindersContentEvent *)self notes];
  [v3 setNotes:v8];

  objc_msgSend(v3, "setIsAllDay:", -[BMRemindersContentEvent isAllDay](self, "isAllDay"));
  [(BMRemindersContentEvent *)self completionDateTimestamp];
  objc_msgSend(v3, "setCompletionDateTimestamp:");
  [(BMRemindersContentEvent *)self dueDateTimestamp];
  objc_msgSend(v3, "setDueDateTimestamp:");
  objc_msgSend(v3, "setPriority:", -[BMRemindersContentEvent priority](self, "priority"));
  double v9 = [(BMRemindersContentEvent *)self contentProtection];
  [v3 setContentProtection:v9];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  id v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BMRemindersContentEvent *)self proto];
    v7 = [v5 proto];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  uniqueId = self->_uniqueId;
  if (a4 && !uniqueId)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"BMStreamErrorDomain" code:3 userInfo:0];
  }
  return uniqueId != 0;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)domainId
{
  return self->_domainId;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)notes
{
  return self->_notes;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (double)completionDateTimestamp
{
  return self->_completionDateTimestamp;
}

- (double)dueDateTimestamp
{
  return self->_dueDateTimestamp;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_domainId, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMRemindersContentEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)json
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMRemindersContentEvent: Unable to create json from object: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMRemindersContentEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMRemindersContentEvent: tried to initialize with a non-BMRemindersContentEvent proto", v1, 2u);
}

@end