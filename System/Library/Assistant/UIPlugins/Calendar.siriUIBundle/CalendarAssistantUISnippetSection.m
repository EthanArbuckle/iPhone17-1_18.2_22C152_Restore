@interface CalendarAssistantUISnippetSection
+ (id)sectionWithDate:(id)a3;
- (CalendarAssistantUISnippetSection)initWithDate:(id)a3;
- (NSArray)events;
- (NSDate)date;
- (void)addEvent:(id)a3;
- (void)setDate:(id)a3;
- (void)setEvents:(id)a3;
@end

@implementation CalendarAssistantUISnippetSection

+ (id)sectionWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDate:v4];

  return v5;
}

- (CalendarAssistantUISnippetSection)initWithDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CalendarAssistantUISnippetSection;
  id v5 = [(CalendarAssistantUISnippetSection *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CalendarAssistantUISnippetSection *)v5 setDate:v4];
  }

  return v6;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(CalendarAssistantUISnippetSection *)self events];

  if (v5)
  {
    v6 = [(CalendarAssistantUISnippetSection *)self events];
    id v7 = [v6 arrayByAddingObject:v4];

    id v4 = v6;
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, 0);
  }

  [(CalendarAssistantUISnippetSection *)self setEvents:v7];
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
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