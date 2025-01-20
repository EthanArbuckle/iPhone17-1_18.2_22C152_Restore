@interface CLSInvestigation
+ (id)investigationWithProfiles:(id)a3 clueDates:(id)a4 clueLocations:(id)a5 cluePeoples:(id)a6 helper:(id)a7;
+ (id)investigationWithProfiles:(id)a3 helper:(id)a4;
- (BOOL)enableDebuggingClues;
- (CLSClueCollection)clueCollection;
- (CLSInvestigation)initWithClueCollection:(id)a3 profiles:(id)a4 helper:(id)a5;
- (CLSInvestigation)initWithFeeder:(id)a3 profiles:(id)a4 helper:(id)a5;
- (CLSInvestigation)initWithHelper:(id)a3;
- (CLSInvestigation)initWithProfiles:(id)a3 helper:(id)a4;
- (CLSInvestigationDelegate)delegate;
- (CLSInvestigationFeeder)feeder;
- (CLSInvestigationHelper)helper;
- (CLSInvestigationInterviewDelegate)interviewDelegate;
- (NSArray)profiles;
- (NSString)uuid;
- (id)_traceStringForType:(unint64_t)a3;
- (id)context;
- (id)description;
- (id)description:(BOOL)a3;
- (id)sampleOfItems;
- (id)tracesDescription;
- (unint64_t)numberOfItems;
- (unint64_t)precision;
- (void)_didEndInvestigation:(BOOL)a3;
- (void)_willBeginInvestigation:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableDebuggingClues:(BOOL)a3;
- (void)setInterviewDelegate:(id)a3;
- (void)setPrecision:(unint64_t)a3;
@end

@implementation CLSInvestigation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_tracesLogsURIs, 0);
  objc_storeStrong((id *)&self->_tracesLogsByURIs, 0);
  objc_storeStrong((id *)&self->_informants, 0);
  objc_storeStrong((id *)&self->_clueCollection, 0);
  objc_destroyWeak((id *)&self->_inspector);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_destroyWeak((id *)&self->_interviewDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feeder, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setEnableDebuggingClues:(BOOL)a3
{
  self->_enableDebuggingClues = a3;
}

- (BOOL)enableDebuggingClues
{
  return self->_enableDebuggingClues;
}

- (CLSInvestigationHelper)helper
{
  return (CLSInvestigationHelper *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPrecision:(unint64_t)a3
{
  self->_precision = a3;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (CLSClueCollection)clueCollection
{
  return (CLSClueCollection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (CLSInvestigationInterviewDelegate)interviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate);
  return (CLSInvestigationInterviewDelegate *)WeakRetained;
}

- (CLSInvestigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CLSInvestigationDelegate *)WeakRetained;
}

- (NSArray)profiles
{
  return &self->_profiles->super;
}

- (CLSInvestigationFeeder)feeder
{
  return self->_feeder;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)tracesDescription
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = self;
  objc_sync_enter(v4);
  p_isa = (id *)&v4->super.isa;
  if ([(NSMutableDictionary *)v4->_tracesLogsByURIs count])
  {
    [v3 appendFormat:@"<Traces>"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v4->_tracesLogsURIs;
    uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          [v3 appendFormat:@"\n\t<%@>", v5];
          [v3 appendFormat:@"\n"];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          v6 = [p_isa[11] objectForKey:v5];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v7)
          {
            uint64_t v8 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v7; ++j)
              {
                if (*(void *)v24 != v8) {
                  objc_enumerationMutation(v6);
                }
                v10 = *(void **)(*((void *)&v23 + 1) + 8 * j);
                v11 = NSString;
                v12 = [v10 objectForKey:@"type"];
                v13 = objc_msgSend(p_isa, "_traceStringForType:", objc_msgSend(v12, "unsignedIntegerValue"));
                v14 = [v10 objectForKey:@"description"];
                v15 = [v11 stringWithFormat:@"<%@> %@", v13, v14];
                v16 = objc_msgSend(v15, "cls_indentBy:", 2);
                [v3 appendString:v16];

                [v3 appendFormat:@"\n"];
              }
              uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v7);
          }
        }
        uint64_t v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v20);
    }
  }
  objc_sync_exit(p_isa);

  return v3;
}

- (id)_traceStringForType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return off_1E690F998[a3 - 1];
  }
}

- (id)sampleOfItems
{
  if ((*(unsigned char *)&self->_investigationFlags & 8) != 0
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate)) != 0)
  {
    v4 = WeakRetained;
    uint64_t v5 = [WeakRetained sampleOfItemsInInvestigation:self];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
    unint64_t v6 = [(CLSInvestigation *)self numberOfItems];
    if (v6)
    {
      unint64_t v7 = v6;
      unint64_t precision = self->_precision;
      double v9 = 0.2;
      double v10 = 0.5;
      uint64_t v11 = 25;
      if (precision == 1)
      {
        double v10 = 1.0;
        uint64_t v11 = 1000;
      }
      if (precision == 3)
      {
        unint64_t v12 = 10;
      }
      else
      {
        double v9 = v10;
        unint64_t v12 = v11;
      }
      unint64_t v13 = vcvtmd_u64_f64(1.0 / v9);
      if (v6 / v13 > v12) {
        unint64_t v13 = v6 / v12;
      }
      for (unint64_t i = 0; i < v7; i += v13)
        [v5 addIndex:i];
    }
  }
  return v5;
}

- (unint64_t)numberOfItems
{
  if ((*(unsigned char *)&self->_investigationFlags & 4) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate);
  if (!WeakRetained) {
    return 0;
  }
  v4 = WeakRetained;
  unint64_t v5 = [WeakRetained numberOfItemsInInvestigation:self];

  return v5;
}

- (void)_didEndInvestigation:(BOOL)a3
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  id v3 = obj;
  if ((*(unsigned char *)&obj->_investigationFlags & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&obj->_delegate);
    unint64_t v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained investigationDidEnd:obj];
    }

    id v3 = obj;
  }
  objc_sync_exit(v3);
}

- (void)_willBeginInvestigation:(id)a3
{
  obuint64_t j = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_storeWeak((id *)&v4->_inspector, obj);
  if (*(unsigned char *)&v4->_investigationFlags)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->_delegate);
    unint64_t v6 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained investigationWillBegin:v4];
    }
  }
  objc_sync_exit(v4);
}

- (id)description:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n<Investigation> [%@]", self->_uuid];
  [v5 appendFormat:@"\n\n\tprofiles:"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v6 = self->_profiles;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) description];
        unint64_t v12 = objc_msgSend(v11, "cls_indentBy:", 2);
        [v5 appendFormat:@"\n%@", v12];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  unint64_t v13 = [(CLSClueCollection *)self->_clueCollection description];
  v14 = objc_msgSend(v13, "cls_indentBy:", 1);
  [v5 appendFormat:@"\n\n%@", v14];

  if (v3)
  {
    v15 = [(CLSInvestigation *)self tracesDescription];
    v16 = objc_msgSend(v15, "cls_indentBy:", 1);
    [v5 appendFormat:@"\n\n%@", v16];
  }
  return v5;
}

- (id)description
{
  return [(CLSInvestigation *)self description:1];
}

- (void)setInterviewDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interviewDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_interviewDelegate, obj);
    if (objc_opt_respondsToSelector()) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_investigationFlags = *(unsigned char *)&self->_investigationFlags & 0xFB | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_investigationFlags = *(unsigned char *)&self->_investigationFlags & 0xF7 | v6;
  }
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_investigationFlags = *(unsigned char *)&self->_investigationFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_investigationFlags = *(unsigned char *)&self->_investigationFlags & 0xFD | v5;
  }
}

- (CLSInvestigation)initWithProfiles:(id)a3 helper:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(CLSInvestigation *)self initWithHelper:a4];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v6];
    profiles = v7->_profiles;
    v7->_profiles = (NSMutableArray *)v8;
  }
  return v7;
}

- (CLSInvestigation)initWithHelper:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSInvestigation;
  id v6 = [(CLSInvestigation *)&v22 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(NSString, "cls_generateUUID");
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v7;

    feeder = v6->_feeder;
    v6->_feeder = 0;

    profiles = v6->_profiles;
    v6->_profiles = 0;

    objc_storeWeak((id *)&v6->_delegate, 0);
    objc_storeWeak((id *)&v6->_interviewDelegate, 0);
    id context = v6->_context;
    v6->_id context = 0;

    objc_storeWeak((id *)&v6->_inspector, 0);
    unint64_t v12 = [CLSClueCollection alloc];
    unint64_t v13 = [v5 serviceManager];
    uint64_t v14 = [(CLSClueCollection *)v12 initWithServiceManager:v13];
    clueCollection = v6->_clueCollection;
    v6->_clueCollection = (CLSClueCollection *)v14;

    informants = v6->_informants;
    v6->_unint64_t precision = 2;
    v6->_informants = 0;

    objc_storeStrong((id *)&v6->_helper, a3);
    uint64_t v17 = objc_opt_new();
    tracesLogsByURIs = v6->_tracesLogsByURIs;
    v6->_tracesLogsByURIs = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    tracesLogsURIs = v6->_tracesLogsURIs;
    v6->_tracesLogsURIs = (NSMutableArray *)v19;

    v6->_enableDebuggingClues = 0;
    v6->_investigationFlags = 0;
  }

  return v6;
}

- (CLSInvestigation)initWithFeeder:(id)a3 profiles:(id)a4 helper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(CLSInvestigation *)self initWithHelper:a5];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feeder, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v10];
    profiles = v12->_profiles;
    v12->_profiles = (NSMutableArray *)v13;

    [(CLSInvestigation *)v12 setInterviewDelegate:v9];
  }

  return v12;
}

- (CLSInvestigation)initWithClueCollection:(id)a3 profiles:(id)a4 helper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(CLSInvestigation *)self initWithHelper:a5];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clueCollection, a3);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithArray:v10];
    profiles = v12->_profiles;
    v12->_profiles = (NSMutableArray *)v13;
  }
  return v12;
}

+ (id)investigationWithProfiles:(id)a3 clueDates:(id)a4 clueLocations:(id)a5 cluePeoples:(id)a6 helper:(id)a7
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = [[CLSInvestigation alloc] initWithProfiles:v15 helper:v14];

  uint64_t v17 = objc_opt_new();
  if (v11 && [v11 count])
  {
    long long v18 = [v14 serviceManager];
    uint64_t v19 = +[CLSInputTimeClue clueWithDates:v11 serviceManager:v18];
    v27[0] = v19;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v17 addObjectsFromArray:v20];
  }
  if (v12 && [v12 count])
  {
    long long v21 = [v14 locationCache];
    objc_super v22 = +[CLSInputLocationClue cluesWithLocations:v12 locationCache:v21];
    [v17 addObjectsFromArray:v22];
  }
  if (v13 && [v13 count])
  {
    uint64_t v23 = [v14 serviceManager];
    long long v24 = +[CLSInputPeopleClue cluesWithPeoples:v13 serviceManager:v23];
    [v17 addObjectsFromArray:v24];
  }
  long long v25 = [(CLSInvestigation *)v16 clueCollection];
  [v25 mergeClues:v17];

  return v16;
}

+ (id)investigationWithProfiles:(id)a3 helper:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[CLSInvestigation alloc] initWithProfiles:v6 helper:v5];

  return v7;
}

@end