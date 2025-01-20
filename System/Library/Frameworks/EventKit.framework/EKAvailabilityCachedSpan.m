@interface EKAvailabilityCachedSpan
- (EKAvailabilityCachedSpan)initWithSpan:(id)a3;
- (EKAvailabilitySpan)span;
- (NSDate)creationDate;
- (id)description;
- (void)setCreationDate:(id)a3;
- (void)setSpan:(id)a3;
@end

@implementation EKAvailabilityCachedSpan

- (EKAvailabilityCachedSpan)initWithSpan:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKAvailabilityCachedSpan;
  v5 = [(EKAvailabilityCachedSpan *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(EKAvailabilityCachedSpan *)v5 setSpan:v4];
    v7 = objc_opt_new();
    [(EKAvailabilityCachedSpan *)v6 setCreationDate:v7];
  }
  return v6;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v10.receiver = self;
  v10.super_class = (Class)EKAvailabilityCachedSpan;
  id v4 = [(EKAvailabilityCachedSpan *)&v10 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  v6 = [(EKAvailabilityCachedSpan *)self creationDate];
  [v5 setKey:@"creationDate" withDate:v6];

  v7 = [(EKAvailabilityCachedSpan *)self span];
  [v5 setKey:@"span" withObject:v7];

  v8 = [v5 build];

  return v8;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (EKAvailabilitySpan)span
{
  return self->_span;
}

- (void)setSpan:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_span, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end