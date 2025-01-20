@interface EKPreviewSection
+ (id)sectionWithDate:(id)a3;
- (EKPreviewSection)initWithDate:(id)a3;
- (NSArray)events;
- (NSDate)date;
- (void)addEvent:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation EKPreviewSection

+ (id)sectionWithDate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDate:v4];

  return v5;
}

- (EKPreviewSection)initWithDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKPreviewSection;
  v6 = [(EKPreviewSection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_date, a3);
  }

  return v7;
}

- (void)addEvent:(id)a3
{
  events = self->_events;
  if (events)
  {
    id v5 = a3;
    v12 = [(NSArray *)events arrayByAddingObject:v5];

    v6 = (NSArray *)[(NSArray *)v12 copy];
    v7 = self->_events;
    self->_events = v6;

    v8 = v12;
  }
  else
  {
    objc_super v9 = (objc_class *)MEMORY[0x1E4F1C978];
    id v10 = a3;
    v11 = (NSArray *)objc_msgSend([v9 alloc], "initWithObjects:", v10, 0);

    v8 = self->_events;
    self->_events = v11;
  }
}

- (NSArray)events
{
  return self->_events;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

@end