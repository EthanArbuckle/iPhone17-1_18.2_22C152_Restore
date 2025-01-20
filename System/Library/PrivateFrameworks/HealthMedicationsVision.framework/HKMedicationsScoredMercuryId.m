@interface HKMedicationsScoredMercuryId
- (BOOL)isEqual:(id)a3;
- (HKMedicationsScoredMercuryId)initWithMercuryId:(id)a3 score:(id)a4;
- (NSNumber)mercuryId;
- (NSNumber)score;
- (id)description;
- (unint64_t)hash;
- (void)setMercuryId:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation HKMedicationsScoredMercuryId

- (HKMedicationsScoredMercuryId)initWithMercuryId:(id)a3 score:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicationsScoredMercuryId;
  v8 = [(HKMedicationsScoredMercuryId *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HKMedicationsScoredMercuryId *)v8 setMercuryId:v6];
    [(HKMedicationsScoredMercuryId *)v9 setScore:v7];
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_mercuryId hash];
  return [(NSNumber *)self->_score hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMedicationsScoredMercuryId *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      mercuryId = self->_mercuryId;
      id v7 = [(HKMedicationsScoredMercuryId *)v5 mercuryId];
      if ([(NSNumber *)mercuryId isEqual:v7])
      {
        score = self->_score;
        v9 = [(HKMedicationsScoredMercuryId *)v5 score];
        char v10 = [(NSNumber *)score isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Mercury ID: %@ - Score: %@", self->_mercuryId, self->_score];
}

- (NSNumber)mercuryId
{
  return self->_mercuryId;
}

- (void)setMercuryId:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_mercuryId, 0);
}

@end