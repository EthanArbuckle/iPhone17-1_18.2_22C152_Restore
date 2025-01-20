@interface EKSerializableAlarm
+ (id)classesForKey;
- (BOOL)isAbsolute;
- (BOOL)isDefaultAlarm;
- (EKSerializableAlarm)initWithAlarm:(id)a3;
- (NSDate)absoluteDate;
- (NSNumber)relativeOffset;
- (id)createAlarm:(id *)a3;
- (void)setAbsoluteDate:(id)a3;
- (void)setIsAbsolute:(BOOL)a3;
- (void)setIsDefaultAlarm:(BOOL)a3;
- (void)setRelativeOffset:(id)a3;
@end

@implementation EKSerializableAlarm

+ (id)classesForKey
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"relativeOffset";
  uint64_t v11 = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v13[0] = v2;
  v12[1] = @"absoluteDate";
  uint64_t v10 = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v13[1] = v3;
  v12[2] = @"isAbsolute";
  uint64_t v9 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v13[2] = v4;
  v12[3] = @"isDefaultAlarm";
  uint64_t v8 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v13[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v6;
}

- (EKSerializableAlarm)initWithAlarm:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKSerializableAlarm;
  v5 = [(EKSerializableAlarm *)&v10 init];
  if (v5)
  {
    v6 = NSNumber;
    [v4 relativeOffset];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    [(EKSerializableAlarm *)v5 setRelativeOffset:v7];

    uint64_t v8 = [v4 absoluteDate];
    [(EKSerializableAlarm *)v5 setAbsoluteDate:v8];

    -[EKSerializableAlarm setIsAbsolute:](v5, "setIsAbsolute:", [v4 isAbsolute]);
    -[EKSerializableAlarm setIsDefaultAlarm:](v5, "setIsDefaultAlarm:", [v4 isDefaultAlarm]);
  }

  return v5;
}

- (id)createAlarm:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(EKSerializableAlarm *)self isDefaultAlarm])
  {
LABEL_5:
    if ([(EKSerializableAlarm *)self isAbsolute])
    {
      v7 = [(EKSerializableAlarm *)self absoluteDate];
      +[EKAlarm alarmWithAbsoluteDate:v7];
    }
    else
    {
      v7 = [(EKSerializableAlarm *)self relativeOffset];
      [v7 doubleValue];
      +[EKAlarm alarmWithRelativeOffset:](EKAlarm, "alarmWithRelativeOffset:");
    }
    a3 = (id *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a3, "setDefaultAlarm:", -[EKSerializableAlarm isDefaultAlarm](self, "isDefaultAlarm"));
    goto LABEL_9;
  }
  v5 = [(EKSerializableAlarm *)self relativeOffset];
  if (v5)
  {

    goto LABEL_5;
  }
  v6 = [(EKSerializableAlarm *)self absoluteDate];

  if (v6) {
    goto LABEL_5;
  }
  if (a3)
  {
    uint64_t v10 = *MEMORY[0x1E4F28578];
    v11[0] = @"Either the relative offset or absolute date must be set.";
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:0 userInfo:v9];

    a3 = 0;
  }
LABEL_9:

  return a3;
}

- (NSNumber)relativeOffset
{
  return self->_relativeOffset;
}

- (void)setRelativeOffset:(id)a3
{
}

- (NSDate)absoluteDate
{
  return self->_absoluteDate;
}

- (void)setAbsoluteDate:(id)a3
{
}

- (BOOL)isAbsolute
{
  return self->_isAbsolute;
}

- (void)setIsAbsolute:(BOOL)a3
{
  self->_isAbsolute = a3;
}

- (BOOL)isDefaultAlarm
{
  return self->_isDefaultAlarm;
}

- (void)setIsDefaultAlarm:(BOOL)a3
{
  self->_isDefaultAlarm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_absoluteDate, 0);

  objc_storeStrong((id *)&self->_relativeOffset, 0);
}

@end