@interface EKCalendarChange
+ (int)entityType;
- (BOOL)colorChanged;
- (BOOL)orderChanged;
- (BOOL)titleChanged;
- (EKCalendarChange)initWithChangeProperties:(id)a3;
- (NSString)calendarIdentifier;
@end

@implementation EKCalendarChange

+ (int)entityType
{
  return 1;
}

- (EKCalendarChange)initWithChangeProperties:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKCalendarChange;
  v5 = [(EKObjectChange *)&v12 initWithChangeProperties:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    v5->_titleChanged = [v6 BOOLValue];

    v7 = [v4 objectForKeyedSubscript:@"color"];
    v5->_colorChanged = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"display_order"];
    v5->_orderChanged = [v8 BOOLValue];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"UUID"];
    calendarIdentifier = v5->_calendarIdentifier;
    v5->_calendarIdentifier = (NSString *)v9;
  }
  return v5;
}

- (BOOL)titleChanged
{
  return self->_titleChanged;
}

- (BOOL)colorChanged
{
  return self->_colorChanged;
}

- (BOOL)orderChanged
{
  return self->_orderChanged;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void).cxx_destruct
{
}

@end