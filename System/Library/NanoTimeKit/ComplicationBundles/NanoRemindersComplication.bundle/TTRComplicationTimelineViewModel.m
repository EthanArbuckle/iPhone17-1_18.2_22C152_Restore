@interface TTRComplicationTimelineViewModel
- (CLKComplicationTemplate)lockedTemplate;
- (CLKComplicationTemplate)privacyTemplate;
- (CLKComplicationTimelineEntry)currentEntry;
- (TTRComplicationTemplateGenerating)templateGenerator;
- (TTRComplicationTimelineModel)timelineModel;
- (TTRComplicationTimelineViewModel)initWithTimelineModel:(id)a3 templateGenerator:(id)a4;
- (id)_timelineEntriesForModelEntries:(id)a3;
- (id)_timelineEntryForModelEntry:(id)a3;
- (id)entriesAfterDate:(id)a3 limit:(unint64_t)a4;
- (id)entriesInSameDayAsDate:(id)a3 limit:(unint64_t)a4;
@end

@implementation TTRComplicationTimelineViewModel

- (TTRComplicationTimelineViewModel)initWithTimelineModel:(id)a3 templateGenerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTRComplicationTimelineViewModel;
  v9 = [(TTRComplicationTimelineViewModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timelineModel, a3);
    objc_storeStrong((id *)&v10->_templateGenerator, a4);
  }

  return v10;
}

- (CLKComplicationTemplate)lockedTemplate
{
  v2 = [(TTRComplicationTimelineViewModel *)self templateGenerator];
  v3 = [v2 lockedTemplate];

  return (CLKComplicationTemplate *)v3;
}

- (CLKComplicationTemplate)privacyTemplate
{
  v2 = [(TTRComplicationTimelineViewModel *)self templateGenerator];
  v3 = [v2 privacyTemplate];

  return (CLKComplicationTemplate *)v3;
}

- (CLKComplicationTimelineEntry)currentEntry
{
  v3 = [(TTRComplicationTimelineViewModel *)self timelineModel];
  v4 = [v3 currentEntry];
  v5 = [(TTRComplicationTimelineViewModel *)self _timelineEntryForModelEntry:v4];

  return (CLKComplicationTimelineEntry *)v5;
}

- (id)entriesAfterDate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(TTRComplicationTimelineViewModel *)self timelineModel];
  id v8 = [v7 entriesAfterDate:v6 limit:a4];

  v9 = [(TTRComplicationTimelineViewModel *)self _timelineEntriesForModelEntries:v8];

  return v9;
}

- (id)entriesInSameDayAsDate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(TTRComplicationTimelineViewModel *)self timelineModel];
  id v8 = [v7 entriesInSameDayAsDate:v6 limit:a4];

  v9 = [(TTRComplicationTimelineViewModel *)self _timelineEntriesForModelEntries:v8];

  return v9;
}

- (id)_timelineEntryForModelEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TTRComplicationTimelineViewModel *)self templateGenerator];
  id v6 = [v5 templateForTimelineModelEntry:v4];

  id v7 = [v4 startDate];

  id v8 = +[CLKComplicationTimelineEntry entryWithDate:v7 complicationTemplate:v6];

  return v8;
}

- (id)_timelineEntriesForModelEntries:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[TTRComplicationTimelineViewModel _timelineEntryForModelEntry:](self, "_timelineEntryForModelEntry:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];

  return v12;
}

- (TTRComplicationTimelineModel)timelineModel
{
  return self->_timelineModel;
}

- (TTRComplicationTemplateGenerating)templateGenerator
{
  return self->_templateGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateGenerator, 0);

  objc_storeStrong((id *)&self->_timelineModel, 0);
}

@end