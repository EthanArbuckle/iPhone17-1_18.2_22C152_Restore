@interface CHSTimelineEntryRelevance
+ (BOOL)supportsSecureCoding;
- (BOOL)hasRelevance;
- (BOOL)isEqual:(id)a3;
- (CHSTimelineEntryRelevance)initWithCoder:(id)a3;
- (CHSTimelineEntryRelevance)initWithDate:(id)a3;
- (CHSTimelineEntryRelevance)initWithDate:(id)a3 score:(double)a4 duration:(double)a5;
- (CHSTimelineEntryRelevance)initWithTimelineEntryRelevance:(id)a3;
- (NSDate)date;
- (double)duration;
- (double)score;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSTimelineEntryRelevance

- (CHSTimelineEntryRelevance)initWithDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSTimelineEntryRelevance;
  v6 = [(CHSTimelineEntryRelevance *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    v7->_hasRelevance = 0;
    v7->_score = 0.0;
    v7->_duration = 0.0;
  }

  return v7;
}

- (CHSTimelineEntryRelevance)initWithDate:(id)a3 score:(double)a4 duration:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CHSTimelineEntryRelevance;
  v10 = [(CHSTimelineEntryRelevance *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_date, a3);
    v11->_hasRelevance = 1;
    v11->_score = a4;
    v11->_duration = a5;
  }

  return v11;
}

- (CHSTimelineEntryRelevance)initWithTimelineEntryRelevance:(id)a3
{
  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSTimelineEntryRelevance;
  id v5 = [(CHSTimelineEntryRelevance *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_date, v4[2]);
    v6->_hasRelevance = *((unsigned char *)v4 + 8);
    *(void *)&v6->_score = v4[3];
    *(void *)&v6->_duration = v4[4];
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_date];
  id v5 = (id)[v3 appendBool:self->_hasRelevance];
  id v6 = (id)[v3 appendDouble:self->_score];
  id v7 = (id)[v3 appendDouble:self->_duration];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  date = self->_date;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __37__CHSTimelineEntryRelevance_isEqual___block_invoke;
  v28[3] = &unk_1E56C81C8;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendObject:date counterpart:v28];
  BOOL hasRelevance = self->_hasRelevance;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __37__CHSTimelineEntryRelevance_isEqual___block_invoke_2;
  v26[3] = &unk_1E56C8468;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendBool:hasRelevance counterpart:v26];
  if (self->_hasRelevance)
  {
    double score = self->_score;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__CHSTimelineEntryRelevance_isEqual___block_invoke_3;
    v24[3] = &unk_1E56C8440;
    id v13 = v10;
    id v25 = v13;
    id v14 = (id)[v5 appendDouble:v24 counterpart:score];
    double duration = self->_duration;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __37__CHSTimelineEntryRelevance_isEqual___block_invoke_4;
    v22 = &unk_1E56C8440;
    id v23 = v13;
    id v16 = (id)[v5 appendDouble:&v19 counterpart:duration];
  }
  char v17 = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return v17;
}

id __37__CHSTimelineEntryRelevance_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

uint64_t __37__CHSTimelineEntryRelevance_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

double __37__CHSTimelineEntryRelevance_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 24);
}

double __37__CHSTimelineEntryRelevance_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_date withName:@"date"];
  id v5 = (id)[v3 appendBool:self->_hasRelevance withName:@"hasRelevance"];
  if (self->_hasRelevance)
  {
    id v6 = (id)[v3 appendFloat:@"score" withName:self->_score];
    id v7 = (id)[v3 appendTimeInterval:@"duration" withName:0 decomposeUnits:self->_duration];
  }
  id v8 = [v3 build];

  return v8;
}

- (CHSTimelineEntryRelevance)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSTimelineEntryRelevance;
  id v5 = [(CHSTimelineEntryRelevance *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_BOOL hasRelevance = [v4 decodeBoolForKey:@"hasRelevance"];
    [v4 decodeDoubleForKey:@"score"];
    v5->_double score = v8;
    [v4 decodeDoubleForKey:@"duration"];
    v5->_double duration = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_date forKey:@"date"];
  [v4 encodeBool:self->_hasRelevance forKey:@"hasRelevance"];
  [v4 encodeDouble:@"score" forKey:self->_score];
  [v4 encodeDouble:@"duration" forKey:self->_duration];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)hasRelevance
{
  return self->_hasRelevance;
}

- (double)score
{
  return self->_score;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

@end