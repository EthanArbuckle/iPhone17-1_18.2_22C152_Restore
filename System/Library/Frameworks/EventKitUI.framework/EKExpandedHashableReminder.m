@interface EKExpandedHashableReminder
- (BOOL)completed;
- (BOOL)editable;
- (BOOL)isEqual:(id)a3;
- (EKEvent)event;
- (EKExpandedHashableReminder)initWithEKEvent:(id)a3;
- (NSDate)date;
- (NSString)buttonImageName;
- (NSString)title;
- (UIColor)color;
- (unint64_t)hash;
- (void)setButtonImageName:(id)a3;
- (void)setColor:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEvent:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation EKExpandedHashableReminder

- (EKExpandedHashableReminder)initWithEKEvent:(id)a3
{
  v4 = (EKEvent *)a3;
  v17.receiver = self;
  v17.super_class = (Class)EKExpandedHashableReminder;
  v5 = [(EKExpandedHashableReminder *)&v17 init];
  v5->_completed = [(EKEvent *)v4 completed];
  uint64_t v6 = [(EKEvent *)v4 startDate];
  date = v5->_date;
  v5->_date = (NSDate *)v6;

  uint64_t v8 = [(EKEvent *)v4 title];
  title = v5->_title;
  v5->_title = (NSString *)v8;

  char v10 = [(EKEvent *)v4 CUIK_reminderShouldBeEditable];
  v5->_editable = v10;
  if (v10) {
    [(EKEvent *)v4 CUIK_symbolColor];
  }
  else {
  uint64_t v11 = [(EKEvent *)v4 CUIK_disabledSymbolColor];
  }
  color = v5->_color;
  v5->_color = (UIColor *)v11;

  uint64_t v13 = [(EKEvent *)v4 CUIK_symbolName:[(EKEvent *)v4 isAllDay]];
  buttonImageName = v5->_buttonImageName;
  v5->_buttonImageName = (NSString *)v13;

  event = v5->_event;
  v5->_event = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EKExpandedHashableReminder *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL completed = self->_completed;
      if (completed == [(EKExpandedHashableReminder *)v5 completed])
      {
        date = self->_date;
        uint64_t v8 = [(EKExpandedHashableReminder *)v5 date];
        if ([(NSDate *)date isEqualToDate:v8])
        {
          color = self->_color;
          char v10 = [(EKExpandedHashableReminder *)v5 color];
          if ([(UIColor *)color isEqual:v10])
          {
            title = self->_title;
            v12 = [(EKExpandedHashableReminder *)v5 title];
            if ([(NSString *)title isEqualToString:v12])
            {
              buttonImageName = self->_buttonImageName;
              v14 = [(EKExpandedHashableReminder *)v5 buttonImageName];
              if ([(NSString *)buttonImageName isEqualToString:v14]
                && (BOOL editable = self->_editable, editable == [(EKExpandedHashableReminder *)v5 editable]))
              {
                char v16 = [(EKEvent *)self->_event isEqual:v5];
              }
              else
              {
                char v16 = 0;
              }
            }
            else
            {
              char v16 = 0;
            }
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3 = [(UIColor *)self->_color hash];
  uint64_t v4 = [(NSDate *)self->_date hash] + 13 * v3;
  NSUInteger v5 = [(NSString *)self->_title hash] + 13 * v4;
  NSUInteger v6 = [(NSString *)self->_buttonImageName hash];
  uint64_t v7 = 1231;
  if (self->_completed) {
    uint64_t v8 = 1231;
  }
  else {
    uint64_t v8 = 1237;
  }
  if (!self->_editable) {
    uint64_t v7 = 1237;
  }
  NSUInteger v9 = v8 + 13 * (v6 + 13 * v5);
  return [(EKEvent *)self->_event hash] + 13 * (v7 + 13 * v9);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_BOOL completed = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_BOOL editable = a3;
}

- (NSString)buttonImageName
{
  return self->_buttonImageName;
}

- (void)setButtonImageName:(id)a3
{
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_buttonImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end