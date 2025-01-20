@interface BRCProblemReport
+ (BOOL)supportsSecureCoding;
- (BOOL)needsSyncUp;
- (BOOL)shouldResetAfterFixingState;
- (BRCProblemReport)init;
- (BRCProblemReport)initWithCoder:(id)a3;
- (BRCProblemReport)initWithProblemReport:(id)a3;
- (NSNumber)pendingRequestID;
- (NSSet)effectedRecordNames;
- (NSString)effectiveProblemMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)_effectiveProblemType;
- (int)_priorityForProblemType:(int)a3;
- (int)_zoneStateForProblemType:(int)a3;
- (int)state;
- (void)_addProblem:(id)a3;
- (void)addProblemWithType:(int)a3 recordName:(id)a4;
- (void)effectiveProblemMessage;
- (void)encodeWithCoder:(id)a3;
- (void)setNeedsSyncUp:(BOOL)a3;
- (void)setPendingRequestID:(id)a3;
@end

@implementation BRCProblemReport

- (BRCProblemReport)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRCProblemReport;
  v2 = [(BRCProblemReport *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    problems = v2->_problems;
    v2->_problems = (NSMutableDictionary *)v3;

    v2->_state = 0;
  }
  return v2;
}

- (BRCProblemReport)initWithProblemReport:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCProblemReport;
  v5 = [(BRCProblemReport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 1) mutableCopy];
    problems = v5->_problems;
    v5->_problems = (NSMutableDictionary *)v6;

    v5->_state = *((_DWORD *)v4 + 5);
    v5->_needsSyncUp = *((unsigned char *)v4 + 16);
    objc_storeStrong((id *)&v5->_pendingRequestID, *((id *)v4 + 3));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithProblemReport:self];
}

- (BRCProblemReport)initWithCoder:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCProblemReport;
  v5 = [(BRCProblemReport *)&v15 init];
  if (v5)
  {
    v5->_state = [v4 decodeInt32ForKey:@"state"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    v8 = [v6 setWithArray:v7];
    objc_super v9 = (void *)[v8 mutableCopy];

    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"problems"];
    problems = v5->_problems;
    v5->_problems = (NSMutableDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingRequestID"];
    pendingRequestID = v5->_pendingRequestID;
    v5->_pendingRequestID = (NSNumber *)v12;

    v5->_needsSyncUp = [v4 decodeBoolForKey:@"needsSync"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInt32:state forKey:@"state"];
  [v5 encodeObject:self->_problems forKey:@"problems"];
  [v5 encodeObject:self->_pendingRequestID forKey:@"pendingRequestID"];
  [v5 encodeBool:self->_needsSyncUp forKey:@"needsSync"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int)_zoneStateForProblemType:(int)a3
{
  if (a3 > 0x13) {
    return 0;
  }
  else {
    return dword_1D3887740[a3];
  }
}

- (int)_priorityForProblemType:(int)a3
{
  if (a3 > 0x13) {
    return -99;
  }
  else {
    return dword_1D3887790[a3];
  }
}

- (int)_effectiveProblemType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_problems allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v15;
    int v8 = -100;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = -[BRCProblemReport _priorityForProblemType:](self, "_priorityForProblemType:", [v10 intValue]);
        if (v11 > v8)
        {
          int v12 = v11;
          int v6 = [v10 intValue];
          int v8 = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (NSString)effectiveProblemMessage
{
  v2 = @"dead parent";
  switch([(BRCProblemReport *)self _effectiveProblemType])
  {
    case 1:
      break;
    case 2:
      v2 = @"missing root";
      break;
    case 3:
      v2 = @"live children";
      break;
    case 4:
      v2 = @"missing content";
      break;
    case 5:
      v2 = @"cant save (missing structure?)";
      break;
    case 6:
      v2 = @"simulated (partial)";
      break;
    case 7:
      v2 = @"simulated (broken)";
      break;
    case 8:
      v2 = @"item parented to a document";
      break;
    case 9:
      v2 = @"package with corrupt indices";
      break;
    case 0xA:
      v2 = @"share without root record";
      break;
    case 0xB:
      v2 = @"cant save (missing parent)";
      break;
    case 0xC:
      v2 = @"pcs decryption";
      break;
    case 0xD:
      v2 = @"root record missing shareID but share exists";
      break;
    case 0xE:
      v2 = @"sync down stuck";
      break;
    case 0xF:
      v2 = @"sync up stuck";
      break;
    case 0x10:
      v2 = @"upload stuck";
      break;
    case 0x11:
      v2 = @"download stuck";
      break;
    case 0x12:
      v2 = @"apply stuck";
      break;
    case 0x13:
      uint64_t v5 = NSString;
      int v6 = +[BRCUserDefaults defaultsForMangledID:0];
      uint64_t v7 = [v6 healthZoneMaxNumberOfResets];
      int v8 = +[BRCUserDefaults defaultsForMangledID:0];
      [v8 healthZoneTimeIntervalForMaxNumberOfResets];
      objc_msgSend(v5, "stringWithFormat:", @"zone resetted more than %lu times in %f seconds", v7, v9);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      uint64_t v3 = brc_bread_crumbs();
      uint64_t v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        [(BRCProblemReport *)(uint64_t)v3 effectiveProblemMessage];
      }

      v2 = @"unknown";
      break;
  }
  return (NSString *)v2;
}

- (NSSet)effectedRecordNames
{
  problems = self->_problems;
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BRCProblemReport _effectiveProblemType](self, "_effectiveProblemType"));
  uint64_t v4 = [(NSMutableDictionary *)problems objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 effectedRecordNames];

  return (NSSet *)v5;
}

- (void)_addProblem:(id)a3
{
  id v10 = a3;
  int v4 = -[BRCProblemReport _zoneStateForProblemType:](self, "_zoneStateForProblemType:", [v10 type]);
  if (v4 > self->_state)
  {
    self->_uint64_t state = v4;
    self->_needsSyncUp = 1;
  }
  problems = self->_problems;
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "type"));
  uint64_t v7 = [(NSMutableDictionary *)problems objectForKeyedSubscript:v6];

  if (v7)
  {
    [v7 mergeWithProblem:v10];
  }
  else
  {
    int v8 = self->_problems;
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "type"));
    [(NSMutableDictionary *)v8 setObject:v10 forKeyedSubscript:v9];
  }
}

- (void)addProblemWithType:(int)a3 recordName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [[BRCProblem alloc] initWithType:v4 recordName:v6];

  [(BRCProblemReport *)self _addProblem:v7];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(BRCProblemReport *)self effectiveProblemMessage];
  BOOL v5 = [(BRCProblemReport *)self needsSyncUp];
  unsigned int v6 = [(BRCProblemReport *)self _zoneStateForProblemType:[(BRCProblemReport *)self _effectiveProblemType]];
  if (v6 > 2) {
    uint64_t v7 = @"unknown";
  }
  else {
    uint64_t v7 = off_1E6999588[v6];
  }
  if (v5) {
    int v8 = @"Yes";
  }
  else {
    int v8 = @"No";
  }
  pendingRequestID = self->_pendingRequestID;
  id v10 = [(BRCProblemReport *)self effectedRecordNames];
  int v11 = [v3 stringWithFormat:@"problem{msg:%@,needs-sync:%@,zone-state:%@,pending-request:%@, records:%@}", v4, v8, v7, pendingRequestID, v10];

  return v11;
}

- (BOOL)shouldResetAfterFixingState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSMutableDictionary *)self->_problems allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = +[BRCUserDefaults defaultsForMangledID:0];
        int v8 = [v7 healthErrorsForReset];
        LOBYTE(v6) = [v8 containsObject:v6];

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (int)state
{
  return self->_state;
}

- (NSNumber)pendingRequestID
{
  return self->_pendingRequestID;
}

- (void)setPendingRequestID:(id)a3
{
}

- (BOOL)needsSyncUp
{
  return self->_needsSyncUp;
}

- (void)setNeedsSyncUp:(BOOL)a3
{
  self->_needsSyncUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestID, 0);
  objc_storeStrong((id *)&self->_problems, 0);
}

- (void)effectiveProblemMessage
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown effective problem type%@", (uint8_t *)&v2, 0xCu);
}

@end