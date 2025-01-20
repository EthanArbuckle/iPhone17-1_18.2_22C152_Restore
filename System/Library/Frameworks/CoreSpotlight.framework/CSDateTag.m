@interface CSDateTag
- (CSDateTag)initWithDate:(id)a3 confidence:(double)a4;
- (NSDate)date;
- (void)encodeWithCSCoder:(id)a3;
@end

@implementation CSDateTag

- (CSDateTag)initWithDate:(id)a3 confidence:(double)a4
{
  v32[8] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id obj = a3;
  v22 = self;
  if (initWithDate_confidence__onceToken != -1) {
    dispatch_once(&initWithDate_confidence__onceToken, &__block_literal_global_5);
  }
  CFAbsoluteTime v8 = MEMORY[0x192F98B80](v7);
  unsigned int v30 = -1;
  unsigned int v31 = -1;
  unsigned int v28 = -1;
  unsigned int v29 = -1;
  unsigned int v26 = -1;
  unsigned int v27 = -1;
  unsigned int v24 = -1;
  unsigned int v25 = -1;
  CFCalendarDecomposeAbsoluteTime((CFCalendarRef)initWithDate_confidence__sCalendar, v8, "HdMyEFWw", &v31, &v30, &v29, &v28, &v27, &v26, &v25, &v24);
  v9 = [NSNumber numberWithInt:v31];
  v32[0] = v9;
  v10 = [NSNumber numberWithInt:v30];
  v32[1] = v10;
  v11 = [NSNumber numberWithInt:v29];
  v32[2] = v11;
  v12 = [NSNumber numberWithInt:v28];
  v32[3] = v12;
  v13 = [NSNumber numberWithInt:v27];
  v32[4] = v13;
  v14 = [NSNumber numberWithInt:v26];
  v32[5] = v14;
  v15 = [NSNumber numberWithInt:v25];
  v32[6] = v15;
  v16 = [NSNumber numberWithInt:v24];
  v32[7] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:8];

  v18 = [NSNumber numberWithDouble:v8];
  v23.receiver = v22;
  v23.super_class = (Class)CSDateTag;
  v19 = [(CSNumericAnalysisTag *)&v23 initWithPrimaryValue:v18 components:v17 confidence:a4];

  if (v19) {
    objc_storeStrong((id *)&v19->_date, obj);
  }

  return v19;
}

uint64_t __37__CSDateTag_initWithDate_confidence___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  initWithDate_confidence__sCalendar = [v0 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];

  return MEMORY[0x1F41817F8]();
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

- (void)encodeWithCSCoder:(id)a3
{
  id v10 = a3;
  [v10 beginType:"CSDateTag"];
  uint64_t v4 = [(CSNumericAnalysisTag *)self primaryValue];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = &unk_1EDBD69E8;
  }
  [v10 encodeObject:v6];

  uint64_t v7 = [(CSNumericAnalysisTag *)self components];
  CFAbsoluteTime v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  [v10 encodeObject:v9];

  [(CSNumericAnalysisTag *)self confidence];
  objc_msgSend(v10, "encodeDouble:");
  [v10 endType];
}

@end