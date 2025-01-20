@interface HRUITableViewSectionConfiguration
- (HRUITableViewSectionConfiguration)init;
- (NSArray)sections;
- (NSString)description;
- (id)addSectionWithIdentifier:(id)a3 firstRowReuseIdentifier:(id)a4;
- (id)addSectionWithIdentifier:(id)a3 rowReuseIdentifiers:(id)a4;
- (id)rowAtIndexPath:(id)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (void)addSection:(id)a3;
- (void)removeAllSections;
- (void)setSections:(id)a3;
@end

@implementation HRUITableViewSectionConfiguration

- (NSArray)sections
{
  return (NSArray *)sub_1C240BE10((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___HRUITableViewSectionConfiguration_sections, (void (*)(uint64_t))type metadata accessor for TableViewSection);
}

- (void)setSections:(id)a3
{
}

- (HRUITableViewSectionConfiguration)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSectionConfiguration_sections) = (Class)MEMORY[0x1E4FBC860];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TableViewSectionConfiguration();
  return [(HRUITableViewSectionConfiguration *)&v3 init];
}

- (void)addSection:(id)a3
{
}

- (id)addSectionWithIdentifier:(id)a3 firstRowReuseIdentifier:(id)a4
{
  if (a3)
  {
    uint64_t v6 = sub_1C254F470();
    uint64_t v8 = v7;
    if (a4)
    {
LABEL_3:
      uint64_t v9 = sub_1C254F470();
      uint64_t v11 = v10;
      sub_1C2201F2C();
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_1C255CD90;
      *(void *)(v12 + 32) = v9;
      *(void *)(v12 + 40) = v11;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = MEMORY[0x1E4FBC860];
LABEL_6:
  v13 = self;
  swift_bridgeObjectRetain();
  id v14 = sub_1C240B0C8(v6, v8, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)addSectionWithIdentifier:(id)a3 rowReuseIdentifiers:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1C254F470();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = sub_1C254F710();
  uint64_t v9 = self;
  id v10 = sub_1C240B0C8(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (void)removeAllSections
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___HRUITableViewSectionConfiguration_sections);
  swift_beginAccess();
  void *v2 = MEMORY[0x1E4FBC860];
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  v4 = self;
  int64_t v5 = sub_1C240B5AC(a3);

  return v5;
}

- (id)rowAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  uint64_t v6 = (void *)sub_1C240B760(v4);

  return v6;
}

- (NSString)description
{
  v2 = self;
  sub_1C240BA40();

  objc_super v3 = (void *)sub_1C254F430();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end