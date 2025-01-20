@interface BlastDoorSMSCTPartContentWrapper
- (BlastDoorSMSCTPartAttachment)attachment;
- (BlastDoorSMSCTPartContentWrapper)init;
- (BlastDoorSMSCTPartPlain)plain;
- (BlastDoorSMSCTPartSMIL)smil;
- (NSString)description;
- (unint64_t)type;
@end

@implementation BlastDoorSMSCTPartContentWrapper

- (NSString)description
{
  return (NSString *)sub_1B17B0F0C((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content, (void (*)(void))sub_1B11F103C);
}

- (unint64_t)type
{
  return self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24];
}

- (BlastDoorSMSCTPartPlain)plain
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content);
  if (self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24])
  {
    v3 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    uint64_t v4 = v2[1];
    v6 = (objc_class *)type metadata accessor for _ObjCSMSCTPartPlainWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorSMSCTPartPlain_sMSCTPartPlain];
    *(void *)v8 = v5;
    *((void *)v8 + 1) = v4;
    v10.receiver = v7;
    v10.super_class = v6;
    swift_bridgeObjectRetain();
    v3 = [(BlastDoorSMSCTPartContentWrapper *)&v10 init];
  }
  return (BlastDoorSMSCTPartPlain *)v3;
}

- (BlastDoorSMSCTPartSMIL)smil
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content);
  if (self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24] == 1)
  {
    uint64_t v4 = v2[2];
    uint64_t v3 = v2[3];
    uint64_t v6 = *v2;
    uint64_t v5 = v2[1];
    v7 = (objc_class *)type metadata accessor for _ObjCSMSCTPartSMILWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = (uint64_t *)&v8[OBJC_IVAR___BlastDoorSMSCTPartSMIL_sMSCTPartSMIL];
    uint64_t *v9 = v6;
    v9[1] = v5;
    v9[2] = v4;
    v9[3] = v3;
    sub_1B11F10B4(v6);
    v12.receiver = v8;
    v12.super_class = v7;
    swift_bridgeObjectRetain();
    objc_super v10 = [(BlastDoorSMSCTPartContentWrapper *)&v12 init];
  }
  else
  {
    objc_super v10 = 0;
  }
  return (BlastDoorSMSCTPartSMIL *)v10;
}

- (BlastDoorSMSCTPartAttachment)attachment
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content);
  if (self->sMSCTPart_Content[OBJC_IVAR___BlastDoorSMSCTPartContentWrapper_sMSCTPart_Content + 24] == 2)
  {
    uint64_t v4 = *v2;
    unint64_t v3 = v2[1];
    uint64_t v5 = (objc_class *)type metadata accessor for _ObjCSMSCTPartAttachmentWrapper();
    uint64_t v6 = (char *)objc_allocWithZone(v5);
    v7 = (uint64_t *)&v6[OBJC_IVAR___BlastDoorSMSCTPartAttachment_sMSCTPartAttachment];
    uint64_t *v7 = v4;
    v7[1] = v3;
    sub_1B11F10F4(v4, v3);
    v10.receiver = v6;
    v10.super_class = v5;
    v8 = [(BlastDoorSMSCTPartContentWrapper *)&v10 init];
  }
  else
  {
    v8 = 0;
  }
  return (BlastDoorSMSCTPartAttachment *)v8;
}

- (BlastDoorSMSCTPartContentWrapper)init
{
  result = (BlastDoorSMSCTPartContentWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end