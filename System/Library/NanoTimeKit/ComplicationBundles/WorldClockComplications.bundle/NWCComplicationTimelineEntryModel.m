@interface NWCComplicationTimelineEntryModel
- (NSDate)entryDate;
- (NWCComplicationTimelineEntryModel)initWithEntryDate:(id)a3;
- (id)templateForComplicationFamily:(int64_t)a3;
- (id)timelineEntryForComplicationFamily:(int64_t)a3;
@end

@implementation NWCComplicationTimelineEntryModel

- (NWCComplicationTimelineEntryModel)initWithEntryDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NWCComplicationTimelineEntryModel;
  v6 = [(NWCComplicationTimelineEntryModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entryDate, a3);
  }

  return v7;
}

- (id)timelineEntryForComplicationFamily:(int64_t)a3
{
  id v5 = objc_opt_new();
  v6 = [(NWCComplicationTimelineEntryModel *)self entryDate];
  [v5 setDate:v6];

  v7 = [(NWCComplicationTimelineEntryModel *)self templateForComplicationFamily:a3];
  [v5 setComplicationTemplate:v7];

  [v5 finalize];

  return v5;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  return 0;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void).cxx_destruct
{
}

@end