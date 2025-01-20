@interface ATXSpotlightSuggestions
- (ATXSpotlightSuggestions)init;
- (NSArray)scores;
- (NSArray)sections;
- (NSArray)topics;
- (id)createSectionsFromServerResults:(id)a3;
@end

@implementation ATXSpotlightSuggestions

- (NSArray)scores
{
  return (NSArray *)sub_24A79DBCC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___ATXSpotlightSuggestions_scores, &qword_2697BA378);
}

- (NSArray)topics
{
  return (NSArray *)sub_24A79DBCC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___ATXSpotlightSuggestions_topics, &qword_2697BA370);
}

- (NSArray)sections
{
  return (NSArray *)sub_24A79DBCC((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___ATXSpotlightSuggestions_sections, &qword_2697BA368);
}

- (id)createSectionsFromServerResults:(id)a3
{
  sub_24A787494(0, &qword_2697BA368);
  v3 = (void *)sub_24A7B3408();
  return v3;
}

- (ATXSpotlightSuggestions)init
{
  v2 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXSpotlightSuggestions_scores) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXSpotlightSuggestions_topics) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXSpotlightSuggestions_sections) = v2;
  v4.receiver = self;
  v4.super_class = (Class)ATXSpotlightSuggestions;
  return [(ATXSpotlightSuggestions *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end