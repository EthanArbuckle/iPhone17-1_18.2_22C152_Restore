@interface _CDPSimpleModel
+ (int)maxNumberOfEmailsSupported;
- (BOOL)requireOutgoingInteraction;
- (NSArray)people;
- (_CDPDataHarvester)harvester;
- (_cdp_prediction_result)_newPredictionResultWithSeed:(unsigned int *)a3 seedLength:(unint64_t)a4 realSeedLength:(unint64_t)a5 maxTrainingEmailID:(unsigned int)a6;
- (float)lambda;
- (float)w0;
- (id)_testingIndices;
- (id)peopleWithID:(unsigned int)a3;
- (unint64_t)nEmail;
- (unint64_t)nPeople;
- (unsigned)_newIdsForPeople:(id)a3 length:(unint64_t *)a4;
- (void)_printEmailWithID:(unint64_t)a3;
- (void)_printPrediction:(_cdp_prediction_result *)a3;
- (void)_printUserWithID:(unint64_t)a3;
- (void)_printUsers:(unsigned int *)a3 length:(unint64_t)a4;
- (void)_reallocModel;
- (void)dealloc;
- (void)getEmail:(unsigned int *)a3 emailLength:(unint64_t *)a4 atIndex:(unint64_t)a5;
- (void)loadModel:(id)a3;
- (void)makePredictionForGroup:(id)a3 clientType:(int64_t)a4 limit:(int64_t)a5 completionHandler:(id)a6;
- (void)setHarvester:(id)a3;
- (void)setLambda:(float)a3 w0:(float)a4;
- (void)setRequireOutgoingInteraction:(BOOL)a3;
@end

@implementation _CDPSimpleModel

- (void)_reallocModel
{
  unint64_t size = self->_size;
  self->_unint64_t size = 2 * size;
  self->_timestamp = (double *)malloc_type_realloc(self->_timestamp, 16 * size, 0x100004000313F17uLL);
  self->_userIsSender = (BOOL *)malloc_type_realloc(self->_userIsSender, self->_size, 0x100004077774924uLL);
  self->_userIsThreadInitiator = (BOOL *)malloc_type_realloc(self->_userIsThreadInitiator, self->_size, 0x100004077774924uLL);
}

- (void)dealloc
{
  free(self->_timestamp);
  free(self->_userIsSender);
  free(self->_userIsThreadInitiator);
  if (self->_NEmail)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      free(self->_email[v3]);
      uint64_t v3 = v4;
      BOOL v5 = self->_NEmail > v4++;
    }
    while (v5);
  }
  free(self->_email);
  free(self->_emailLength);
  free(self->_email2LogScore);
  if (self->_NPeople)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      free(self->_people2Email[v6]);
      uint64_t v6 = v7;
      BOOL v5 = self->_NPeople > v7++;
    }
    while (v5);
  }
  free(self->_people2Email);
  free(self->_people2EmailLength);
  v8.receiver = self;
  v8.super_class = (Class)_CDPSimpleModel;
  [(_CDPSimpleModel *)&v8 dealloc];
}

- (void)loadModel:(id)a3
{
  id v4 = a3;
  self->_loaded = 1;
  *(_OWORD *)&self->_NEmail = xmmword_18EEAC390;
  self->_timestamp = (double *)malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
  self->_userIsSender = (BOOL *)malloc_type_calloc(self->_size, 1uLL, 0x100004077774924uLL);
  self->_userIsThreadInitiator = (BOOL *)malloc_type_calloc(self->_size, 1uLL, 0x100004077774924uLL);
  BOOL v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:256];
  uint64_t v6 = [(_CDPSimpleModel *)self harvester];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29___CDPSimpleModel_loadModel___block_invoke;
  v12[3] = &unk_1E560E668;
  v12[4] = self;
  id v13 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29___CDPSimpleModel_loadModel___block_invoke_2;
  v9[3] = &unk_1E560E690;
  id v10 = v13;
  id v11 = v4;
  v9[4] = self;
  id v7 = v13;
  id v8 = v4;
  [v6 loadWithLimit:2500 dataPointReader:v12 completion:v9];
}

- (unsigned)_newIdsForPeople:(id)a3 length:(unint64_t *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (unsigned int *)malloc_type_calloc([v5 count], 4uLL, 0x100004052888210uLL);
  id v7 = self->_people;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v7, "indexOfObject:inSortedRange:options:usingComparator:", *(void *)(*((void *)&v17 + 1) + 8 * i), 0, [(NSArray *)v7 count], 256, &__block_literal_global_26);
        if ([(NSArray *)v7 count] && v14 != 0x7FFFFFFFFFFFFFFFLL) {
          v6[v11++] = v14;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }

  if (a4) {
    *a4 = v11;
  }

  return v6;
}

- (void)setLambda:(float)a3 w0:(float)a4
{
  self->_lambda = a3;
  self->_w0 = a4;
  self->_scoresAreDirty = 1;
}

- (_cdp_prediction_result)_newPredictionResultWithSeed:(unsigned int *)a3 seedLength:(unint64_t)a4 realSeedLength:(unint64_t)a5 maxTrainingEmailID:(unsigned int)a6
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (self->_NEmail - 2501 < 0xFFFFFFFFFFFFF63CLL) {
    return 0;
  }
  unint64_t v75 = a5;
  if (self->_scoresAreDirty)
  {
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      if (self->_userIsSender[v11])
      {
        [(_CDPSimpleModel *)self w0];
        float v14 = log2f(v13);
      }
      else
      {
        float v14 = 0.0;
      }
      double v15 = self->_timestamp[v11];
      [(_CDPSimpleModel *)self lambda];
      float v17 = v15 / (float)(v16 * 86400.0);
      self->_email2LogScore[v11] = v14 + v17;
      uint64_t v11 = v12;
    }
    while (self->_NEmail > v12++);
    self->_scoresAreDirty = 0;
  }
  bzero(v82, 0x2710uLL);
  bzero(v81, 0x2710uLL);
  v78 = &v74;
  long long v19 = (char *)&v74 - ((self->_NPeople * a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v19, self->_NPeople * a4);
  long long v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v21 = [v20 valueForKey:@"com.apple.coreduetd.people.social.min_seed_proportion"];
  id v76 = v21;
  if (v21)
  {
    [v21 floatValue];
    double v23 = v22;
  }
  else
  {
    double v23 = 0.5;
  }
  v24 = [v20 objectForKey:@"com.apple.coreduetd.people.social.improved_scoring"];

  if (v24) {
    int v79 = [v20 BOOLForKey:@"com.apple.coreduetd.people.social.improved_scoring"];
  }
  else {
    int v79 = 1;
  }
  v77 = v20;
  uint64_t v25 = a6;
  unint64_t NEmail = self->_NEmail;
  timestamp = self->_timestamp;
  if (NEmail <= a6) {
    uint64_t v25 = (int)NEmail - 1;
  }
  double v28 = timestamp[v25];
  bzero(v80, 0x2710uLL);
  LOBYTE(v29) = 1;
  if (a4)
  {
    uint64_t v30 = 0;
    unsigned int v31 = 0;
    people2Email = self->_people2Email;
    people2EmailLength = self->_people2EmailLength;
    do
    {
      uint64_t v34 = a3[v30];
      uint64_t v35 = people2EmailLength[v34];
      if (v35 >= 1)
      {
        v36 = people2Email[v34];
        v37 = &v36[v35];
        do
        {
          uint64_t v38 = *v36;
          if (v38 <= a6 && timestamp[v38] >= v28 + (float)((float)(self->_lambda * -13.288) * 86400.0))
          {
            int v39 = v80[v38];
            v80[v38] = v39 + 1;
            if (!v39) {
              v81[v31++] = v38;
            }
            if (self->_userIsSender[v38])
            {
              unint64_t v40 = self->_emailLength[v38];
              if (v40)
              {
                v41 = self->_email[v38];
                do
                {
                  unsigned int v42 = *v41++;
                  v19[v30 + v42 * a4] = 1;
                  --v40;
                }
                while (v40);
              }
            }
          }
          ++v36;
        }
        while (v36 < v37);
      }
      ++v30;
    }
    while (v30 != a4);
    if (v31)
    {
      float v43 = v28 / (float)(self->_lambda * 86400.0);
      email2LogScore = self->_email2LogScore;
      uint64_t v29 = v31;
      v45 = v81;
      do
      {
        unsigned int v47 = *v45++;
        uint64_t v46 = v47;
        float v48 = exp2f(email2LogScore[v47] - v43);
        int v49 = v80[v47];
        if (v79) {
          float v50 = (float)(v48 * (float)(v49 * v49)) / (float)self->_emailLength[v46];
        }
        else {
          float v50 = v48 * (float)v49;
        }
        *(float *)&v82[v46] = v50;
        --v29;
      }
      while (v29);
    }
    else
    {
      LOBYTE(v29) = 1;
    }
  }
  else
  {
    unsigned int v31 = 0;
  }
  v51 = (_cdp_prediction_result *)malloc_type_calloc(self->_NPeople, 0x10uLL, 0x1000040451B5BE8uLL);
  uint64_t v6 = v51;
  unint64_t NPeople = self->_NPeople;
  if (NPeople)
  {
    LODWORD(v53) = 0;
    v54 = v51;
    do
    {
      v54->var0 = v53;
      ++v54;
      unint64_t v53 = (v53 + 1);
    }
    while (NPeople > v53);
  }
  if ((v29 & 1) == 0)
  {
    uint64_t v55 = 0;
    emailLength = self->_emailLength;
    do
    {
      uint64_t v57 = v81[v55];
      unint64_t v58 = emailLength[v57];
      if (v58)
      {
        v59 = self->_email[v57];
        float v60 = *(float *)&v82[v57];
        do
        {
          int v61 = *v59++;
          v51[v61].var1 = v60 + v51[v61].var1;
          --v58;
        }
        while (v58);
      }
      ++v55;
    }
    while (v55 != v31);
  }
  BOOL v62 = [(_CDPSimpleModel *)self requireOutgoingInteraction];
  v63 = v77;
  if (v62)
  {
    unint64_t v64 = self->_NPeople;
    if (v64)
    {
      uint64_t v65 = 0;
      double v66 = v23 * (double)v75;
      do
      {
        int v67 = 0;
        if (a4)
        {
          unint64_t v68 = a4;
          v69 = (unsigned __int8 *)v19;
          do
          {
            int v70 = *v69++;
            v67 += v70;
            --v68;
          }
          while (v68);
        }
        if (v66 >= (double)v67) {
          v6[v65].var1 = -1.0;
        }
        ++v65;
        v19 += a4;
      }
      while (v65 != v64);
    }
  }
  if ((uint64_t)a4 >= 1)
  {
    v71 = &a3[a4];
    do
    {
      int v72 = *a3++;
      v6[v72].var1 = -1.0;
    }
    while (a3 < v71);
  }

  return v6;
}

- (void)makePredictionForGroup:(id)a3 clientType:(int64_t)a4 limit:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = a3;
  uint64_t v10 = (void (**)(id, _CDPPredictionResult *))a6;
  uint64_t v24 = 0;
  float v22 = [(_CDPSimpleModel *)self _newIdsForPeople:v9 length:&v24];
  double v23 = -[_CDPSimpleModel _newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:](self, "_newPredictionResultWithSeed:seedLength:realSeedLength:maxTrainingEmailID:", v22, v24, [v9 count], LODWORD(self->_NEmail));
  if (self->_NPeople >= a5) {
    unint64_t NPeople = a5;
  }
  else {
    unint64_t NPeople = self->_NPeople;
  }
  unsigned int v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:NPeople];
  float v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:NPeople];
  unint64_t v15 = self->_NPeople;
  if (v15 >= a5) {
    unint64_t v15 = a5;
  }
  if (v15)
  {
    unint64_t v16 = 0;
    p_var1 = (_cdp_prediction_result *)&v23->var1;
    do
    {
      LODWORD(v14) = p_var1->var0;
      long long v18 = [NSNumber numberWithFloat:v14];
      [v12 addObject:v18];

      long long v19 = [(NSArray *)self->_people objectAtIndexedSubscript:p_var1[-1].var3];
      [v13 addObject:v19];

      ++v16;
      unint64_t v20 = self->_NPeople;
      if (v20 >= a5) {
        unint64_t v20 = a5;
      }
      ++p_var1;
    }
    while (v20 > v16);
  }
  v21 = [[_CDPPredictionResult alloc] initWithMembers:v13 andScores:v12];
  v10[2](v10, v21);

  free(v22);
  free(v23);
}

- (id)_testingIndices
{
  p_testingIndices = &self->_testingIndices;
  testingIndices = self->_testingIndices;
  if (testingIndices)
  {
    id v4 = testingIndices;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28E60] indexSet];
    unint64_t NEmail = self->_NEmail;
    if (NEmail > (int)NEmail / 3)
    {
      unint64_t v7 = (int)NEmail / 3;
      do
      {
        if (self->_userIsSender[v7] && self->_userIsThreadInitiator[v7] && self->_emailLength[v7] - 3 <= 7)
        {
          [(NSIndexSet *)v4 addIndex:v7];
          unint64_t NEmail = self->_NEmail;
        }
        ++v7;
      }
      while (NEmail > v7);
    }
    objc_storeStrong((id *)p_testingIndices, v4);
  }
  return v4;
}

- (void)getEmail:(unsigned int *)a3 emailLength:(unint64_t *)a4 atIndex:(unint64_t)a5
{
  *a3 = self->_email[a5];
  *a4 = self->_emailLength[a5];
}

- (unint64_t)nPeople
{
  return self->_NPeople;
}

- (unint64_t)nEmail
{
  return self->_NEmail;
}

- (void)_printEmailWithID:(unint64_t)a3
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v7 setDateFormat:@"yyyy-MM-dd"];
  id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_timestamp[a3]];
  id v6 = [v7 stringFromDate:v5];
  printf("%s ", (const char *)[v6 UTF8String]);

  [(_CDPSimpleModel *)self _printUsers:self->_email[a3] length:self->_emailLength[a3]];
}

- (void)_printUsers:(unsigned int *)a3 length:(unint64_t)a4
{
  if ((uint64_t)a4 >= 1)
  {
    id v5 = a3;
    id v7 = &a3[a4];
    do
    {
      unsigned int v8 = *v5++;
      id v9 = [(NSArray *)self->_people objectAtIndexedSubscript:v8];
      printf("%s ", (const char *)[v9 UTF8String]);
    }
    while (v5 < v7);
  }
  putchar(10);
}

- (void)_printUserWithID:(unint64_t)a3
{
  id v3 = [(NSArray *)self->_people objectAtIndexedSubscript:a3];
  puts((const char *)[v3 UTF8String]);
}

- (void)_printPrediction:(_cdp_prediction_result *)a3
{
  id v5 = (char *)malloc_type_calloc(self->_NPeople, 0x10uLL, 0x1000040451B5BE8uLL);
  memcpy(v5, a3, 16 * self->_NPeople);
  qsort_b(v5, self->_NPeople, 0x10uLL, &__block_literal_global_38);
  for (uint64_t i = 0; i != 80; i += 16)
  {
    id v7 = [(NSArray *)self->_people objectAtIndexedSubscript:*(int *)&v5[i]];
    printf("%s %g\n", (const char *)[v7 UTF8String], *(float *)&v5[i + 4]);
  }
  free(v5);
}

- (id)peopleWithID:(unsigned int)a3
{
  return [(NSArray *)self->_people objectAtIndexedSubscript:a3];
}

- (NSArray)people
{
  return self->_people;
}

+ (int)maxNumberOfEmailsSupported
{
  return 2500;
}

- (_CDPDataHarvester)harvester
{
  return self->_harvester;
}

- (void)setHarvester:(id)a3
{
}

- (float)lambda
{
  return self->_lambda;
}

- (float)w0
{
  return self->_w0;
}

- (BOOL)requireOutgoingInteraction
{
  return self->_requireOutgoingInteraction;
}

- (void)setRequireOutgoingInteraction:(BOOL)a3
{
  self->_requireOutgoingInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvester, 0);
  objc_storeStrong((id *)&self->_testingIndices, 0);
  objc_storeStrong((id *)&self->_people, 0);
}

@end