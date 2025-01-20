@interface CHSRelevanceEntry
- (CHSRelevanceEntry)initWithTimelineEntryRelevance:(id)a3;
@end

@implementation CHSRelevanceEntry

- (CHSRelevanceEntry)initWithTimelineEntryRelevance:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CHSRelevanceEntry;
  return [(CHSTimelineEntryRelevance *)&v4 initWithTimelineEntryRelevance:a3];
}

@end