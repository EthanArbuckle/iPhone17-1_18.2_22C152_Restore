@interface BMEventTimeElapsingImplementor
- (BMEventTimeElapsingImplementor)init;
- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)isValidWithContext:(id)a3 error:(id *)a4;
- (NSDateInterval)dateInterval;
- (double)absoluteTimestamp;
- (double)duration;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setDateInterval:(id)a3;
- (void)setDuration:(double)a3;
@end

@implementation BMEventTimeElapsingImplementor

- (BMEventTimeElapsingImplementor)init
{
  v5.receiver = self;
  v5.super_class = (Class)BMEventTimeElapsingImplementor;
  v2 = [(BMEventBase *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(BMEventTimeElapsingImplementor *)v2 setAbsoluteTimestamp:0.0];
    [(BMEventTimeElapsingImplementor *)v3 setDuration:0.0];
  }
  return v3;
}

- (NSDateInterval)dateInterval
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  [(BMEventTimeElapsingImplementor *)self absoluteTimestamp];
  objc_super v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  [(BMEventTimeElapsingImplementor *)self duration];
  v6 = objc_msgSend(v3, "initWithStartDate:duration:", v5);

  return (NSDateInterval *)v6;
}

- (void)setDateInterval:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 startDate];
  [v5 timeIntervalSinceReferenceDate];
  -[BMEventTimeElapsingImplementor setAbsoluteTimestamp:](self, "setAbsoluteTimestamp:");

  [v4 duration];
  double v7 = v6;

  [(BMEventTimeElapsingImplementor *)self setDuration:v7];
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [(BMEventTimeElapsingImplementor *)self absoluteTimestamp];
  BOOL v7 = v6 > 0.0;
  v8 = [v5 previousEvent];

  [(BMEventTimeElapsingImplementor *)self absoluteTimestamp];
  double v10 = v9;
  v11 = [v8 dateInterval];
  v12 = [v11 endDate];
  [v12 timeIntervalSinceReferenceDate];
  BOOL v14 = v10 >= v13 && v7;

  if (!v14)
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMEventTimeElapsingImplementor isValidWithContext:error:](v15);
    }
  }
  return v14;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  BOOL v5 = [(BMEventTimeElapsingImplementor *)self isValidWithContext:a3 error:a4];
  [(BMEventTimeElapsingImplementor *)self duration];
  return v6 > 0.0 && v5;
}

- (double)absoluteTimestamp
{
  return self->absoluteTimestamp;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  self->absoluteTimestamp = a3;
}

- (double)duration
{
  return self->duration;
}

- (void)setDuration:(double)a3
{
  self->duration = a3;
}

- (void)isValidWithContext:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "TimeElapsing iterator is invalid", v1, 2u);
}

@end