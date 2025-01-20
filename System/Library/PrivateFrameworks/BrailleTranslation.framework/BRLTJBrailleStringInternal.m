@interface BRLTJBrailleStringInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)isStageEmpty;
- (NSString)description;
- (NSString)stageSignalledString;
- (NSString)stageString;
- (_NSRange)NSStage;
- (id)copyWithZone:(void *)a3;
@end

@implementation BRLTJBrailleStringInternal

- (BOOL)isStageEmpty
{
  return self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8] & 1 | (*(Class *)((char *)&self->super.super.isa
                                                                                              + OBJC_IVAR___BRLTJBrailleStringInternal_stage) == *(Class *)&self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage]);
}

- (NSString)stageString
{
  return (NSString *)sub_21C566BB0(self, (uint64_t)a2, (void (*)(void))sub_21C5654B8);
}

- (NSString)stageSignalledString
{
  return (NSString *)sub_21C566BB0(self, (uint64_t)a2, (void (*)(void))sub_21C5663DC);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_21C589DD8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_21C5674C4((uint64_t)v11, (uint64_t)v9);
  if (!v10)
  {
    sub_21C567570((uint64_t)v9);
    goto LABEL_8;
  }
  type metadata accessor for BRLTJBrailleString();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = _s18BrailleTranslation18BRLTJBrailleStringC2eeoiySbAC_ACtFZ_0(self, v8);

LABEL_9:
  sub_21C567570((uint64_t)v11);
  return v6 & 1;
}

- (NSString)description
{
  return (NSString *)sub_21C566BB0(self, (uint64_t)a2, (void (*)(void))sub_21C566C20);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_21C566DCC(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_21C589EB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (_NSRange)NSStage
{
  NSUInteger v2 = sub_21C57BDA4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___BRLTJBrailleStringInternal_stage), *(void *)&self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage], self->super.string[OBJC_IVAR___BRLTJBrailleStringInternal_stage + 8]);
  result.length = v3;
  result.location = v2;
  return result;
}

@end