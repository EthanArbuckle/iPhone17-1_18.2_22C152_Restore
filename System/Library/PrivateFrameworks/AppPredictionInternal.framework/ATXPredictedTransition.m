@interface ATXPredictedTransition
- (ATXLocationOfInterest)loi;
- (ATXPredictedTransition)initWithDate:(id)a3 loi:(id)a4;
- (NSDate)date;
- (id)description;
- (id)transitionArrayForDate:(id)a3;
@end

@implementation ATXPredictedTransition

- (id)transitionArrayForDate:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATXPredictedTransition *)self date];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  v8 = [MEMORY[0x1E4F5B6B8] locationOfInterestUUIDKey];
  v21[0] = v8;
  v9 = [(ATXPredictedTransition *)self loi];
  v10 = [v9 uuid];
  v22[0] = v10;
  v11 = [MEMORY[0x1E4F5B6B8] locationOfInterestTypeKey];
  v21[1] = v11;
  v12 = NSNumber;
  v13 = [(ATXPredictedTransition *)self loi];
  v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "type"));
  v22[1] = v14;
  v15 = [MEMORY[0x1E4F5B6B8] transitionWithinTimeIntervalKey];
  v21[2] = v15;
  v16 = [NSNumber numberWithDouble:v7];
  v22[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  v20 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

  return v18;
}

- (ATXPredictedTransition)initWithDate:(id)a3 loi:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    if ([v8 type] && objc_msgSend(v9, "type") != 1)
    {
      v10 = 0;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)ATXPredictedTransition;
      v11 = [(ATXPredictedTransition *)&v14 init];
      p_isa = (id *)&v11->super.isa;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_date, a3);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      v10 = self;
    }
  }

  return v10;
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F935D0], "stringForLOIType:", -[ATXLocationOfInterest type](self->_loi, "type"));
  id v4 = [NSString stringWithFormat:@"Transition to %@ at %@", v3, self->_date];

  return v4;
}

- (NSDate)date
{
  return self->_date;
}

- (ATXLocationOfInterest)loi
{
  return self->_loi;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loi, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end