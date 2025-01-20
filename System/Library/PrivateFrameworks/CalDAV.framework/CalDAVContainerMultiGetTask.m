@interface CalDAVContainerMultiGetTask
- (BOOL)getScheduleChanges;
- (BOOL)getScheduleTags;
- (CalDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 getScheduleTags:(BOOL)a5 getScheduleChanges:(BOOL)a6;
- (CalDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 getScheduleTags:(BOOL)a5 getScheduleChanges:(BOOL)a6 appSpecificCalendarItemClass:(Class)a7;
- (id)copyAdditionalPropElements;
- (void)setAdditionalProperties:(id)a3 onDataItem:(id)a4;
- (void)setGetScheduleChanges:(BOOL)a3;
- (void)setGetScheduleTags:(BOOL)a3;
@end

@implementation CalDAVContainerMultiGetTask

- (CalDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 getScheduleTags:(BOOL)a5 getScheduleChanges:(BOOL)a6 appSpecificCalendarItemClass:(Class)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if (!a7) {
    a7 = (Class)objc_opt_class();
  }
  v17.receiver = self;
  v17.super_class = (Class)CalDAVContainerMultiGetTask;
  v14 = [(CoreDAVContainerMultiGetTask *)&v17 initWithURLs:v12 atContainerURL:v13 appSpecificDataItemClass:a7];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)((char *)&v14->super.super.super.isa + (int)*MEMORY[0x263F34BF0]), (id)*MEMORY[0x263F34CD8]);
    objc_storeStrong((id *)((char *)&v15->super.super.super.isa + (int)*MEMORY[0x263F34BE8]), (id)*MEMORY[0x263F34C98]);
    objc_storeStrong((id *)((char *)&v15->super.super.super.isa + (int)*MEMORY[0x263F34BE0]), @"calendar-data");
    [(CalDAVContainerMultiGetTask *)v15 setGetScheduleTags:v9];
    [(CalDAVContainerMultiGetTask *)v15 setGetScheduleChanges:v8];
    [(CoreDAVContainerMultiGetTask *)v15 setShouldIgnoreResponseErrors:1];
  }

  return v15;
}

- (CalDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 getScheduleTags:(BOOL)a5 getScheduleChanges:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(CalDAVContainerMultiGetTask *)self initWithURLs:v11 atContainerURL:v10 getScheduleTags:v7 getScheduleChanges:v6 appSpecificCalendarItemClass:objc_opt_class()];

  return v12;
}

- (id)copyAdditionalPropElements
{
  v3 = objc_opt_new();
  if ([(CalDAVContainerMultiGetTask *)self getScheduleTags]) {
    [v3 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34CD8] name:@"schedule-tag" parseClass:objc_opt_class()];
  }
  BOOL v4 = [(CalDAVContainerMultiGetTask *)self getScheduleChanges];
  uint64_t v5 = *MEMORY[0x263F34DA8];
  if (v4) {
    [v3 CDVAddItemParserMappingWithNameSpace:v5 name:@"schedule-changes" parseClass:objc_opt_class()];
  }
  [v3 CDVAddItemParserMappingWithNameSpace:v5 name:@"created-by" parseClass:objc_opt_class()];
  [v3 CDVAddItemParserMappingWithNameSpace:v5 name:@"updated-by" parseClass:objc_opt_class()];
  return v3;
}

- (void)setAdditionalProperties:(id)a3 onDataItem:(id)a4
{
  id v13 = a4;
  uint64_t v5 = *MEMORY[0x263F34CD8];
  id v6 = a3;
  BOOL v7 = [v6 CDVObjectForKeyWithNameSpace:v5 andName:@"schedule-tag"];
  BOOL v8 = [v7 payloadAsString];

  [v13 setScheduleTag:v8];
  uint64_t v9 = *MEMORY[0x263F34DA8];
  id v10 = [v6 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34DA8] andName:@"schedule-changes"];
  [v13 setScheduleChanges:v10];
  id v11 = [v6 CDVObjectForKeyWithNameSpace:v9 andName:@"created-by"];
  [v13 setCreatedBy:v11];

  id v12 = [v6 CDVObjectForKeyWithNameSpace:v9 andName:@"updated-by"];

  [v13 setUpdatedBy:v12];
}

- (BOOL)getScheduleTags
{
  return self->_getScheduleTags;
}

- (void)setGetScheduleTags:(BOOL)a3
{
  self->_getScheduleTags = a3;
}

- (BOOL)getScheduleChanges
{
  return self->_getScheduleChanges;
}

- (void)setGetScheduleChanges:(BOOL)a3
{
  self->_getScheduleChanges = a3;
}

@end