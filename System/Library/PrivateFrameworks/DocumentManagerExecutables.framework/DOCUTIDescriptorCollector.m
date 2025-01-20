@interface DOCUTIDescriptorCollector
- (_TtC26DocumentManagerExecutables25DOCUTIDescriptorCollector)init;
@end

@implementation DOCUTIDescriptorCollector

- (_TtC26DocumentManagerExecutables25DOCUTIDescriptorCollector)init
{
  return (_TtC26DocumentManagerExecutables25DOCUTIDescriptorCollector *)sub_22BE257B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCUTIDescriptorCollector_currentQuery));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCUTIDescriptorCollector_completionQueue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables25DOCUTIDescriptorCollector_gatheringQueue);
}

@end