@interface GDKnosisResultContextItem
- (GDEntityIdentifier)entityIdentifier;
- (GDKnosisResultContextItem)init;
- (id)answer;
- (id)contextForAnswerParents;
@end

@implementation GDKnosisResultContextItem

- (GDEntityIdentifier)entityIdentifier
{
  id v2 = sub_1B2B71978();

  return (GDEntityIdentifier *)v2;
}

- (id)answer
{
  id v2 = self;
  id v3 = sub_1B2B71984();

  return v3;
}

- (id)contextForAnswerParents
{
  id v2 = self;
  id v3 = sub_1B2B71A34((uint64_t)v2);

  return v3;
}

- (GDKnosisResultContextItem)init
{
}

- (void).cxx_destruct
{
  sub_1B29C5B68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GDKnosisResultContextItem__answer), *(void *)&self->_entityId[OBJC_IVAR___GDKnosisResultContextItem__answer], *(void *)&self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer], *(void *)&self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer + 8], *(unsigned __int16 *)&self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer + 16], self->_answer[OBJC_IVAR___GDKnosisResultContextItem__answer + 18]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end