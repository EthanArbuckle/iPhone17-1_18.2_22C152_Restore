@interface HRUITableViewSection
- (HRUITableViewSection)init;
- (HRUITableViewSection)initWithIdentifier:(id)a3;
- (NSArray)rows;
- (NSNumber)estimatedNumRows;
- (NSString)footerString;
- (NSString)headerString;
- (NSString)identifier;
- (void)addRow:(id)a3;
- (void)addRowForReuseIdentifier:(id)a3;
- (void)setEstimatedNumRows:(id)a3;
- (void)setFooterString:(id)a3;
- (void)setHeaderString:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRows:(id)a3;
@end

@implementation HRUITableViewSection

- (NSString)identifier
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITableViewSection_identifier);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)headerString
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITableViewSection_headerString);
}

- (void)setHeaderString:(id)a3
{
}

- (NSString)footerString
{
  return (NSString *)sub_1C2376514((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HRUITableViewSection_footerString);
}

- (void)setFooterString:(id)a3
{
}

- (NSArray)rows
{
  return (NSArray *)sub_1C240BE10((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___HRUITableViewSection_rows, (void (*)(uint64_t))type metadata accessor for TableViewRow);
}

- (void)setRows:(id)a3
{
}

- (NSNumber)estimatedNumRows
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSection_estimatedNumRows);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setEstimatedNumRows:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSection_estimatedNumRows);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (HRUITableViewSection)initWithIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1C254F470();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (HRUITableViewSection *)TableViewSection.init(identifier:)(v3, v4);
}

- (void)addRow:(id)a3
{
}

- (void)addRowForReuseIdentifier:(id)a3
{
  uint64_t v4 = sub_1C254F470();
  uint64_t v6 = v5;
  v7 = (objc_class *)type metadata accessor for TableViewRow();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = (uint64_t *)&v8[OBJC_IVAR___HRUITableViewRow_reuseIdentifier];
  uint64_t *v9 = v4;
  v9[1] = v6;
  v13.receiver = v8;
  v13.super_class = v7;
  v10 = self;
  swift_bridgeObjectRetain();
  [(HRUITableViewSection *)&v13 init];
  v11 = (Class *)((char *)&v10->super.isa + OBJC_IVAR___HRUITableViewSection_rows);
  uint64_t v12 = swift_beginAccess();
  MEMORY[0x1C8757C00](v12);
  if (*(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_1C254F760();
  }
  sub_1C254F790();
  sub_1C254F730();
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (HRUITableViewSection)init
{
  result = (HRUITableViewSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSection_estimatedNumRows);
}

@end