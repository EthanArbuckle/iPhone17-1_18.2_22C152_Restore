@interface HTAudiometry
- (_TtC11HearingTest12HTAudiometry)init;
@end

@implementation HTAudiometry

- (_TtC11HearingTest12HTAudiometry)init
{
  result = (_TtC11HearingTest12HTAudiometry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2512EF6A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HearingTest12HTAudiometry_statusProvider));
  sub_2512EF6A8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11HearingTest12HTAudiometry_statusProviderV2));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  long long v3 = *(_OWORD *)&self->statusProviderV2[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 4];
  v10[12] = *(_OWORD *)&self->statusProvider[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 4];
  v10[13] = v3;
  v10[14] = *(_OWORD *)&self->stimulus[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 4];
  uint64_t v11 = *(void *)&self->stimulus[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 20];
  long long v4 = *(_OWORD *)&self->deleted[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 22];
  v10[8] = *(_OWORD *)&self->deleted[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 6];
  v10[9] = v4;
  long long v5 = *(_OWORD *)&self->results[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 5];
  v10[10] = *(_OWORD *)&self->maxSampleCount[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 6];
  v10[11] = v5;
  long long v6 = *(_OWORD *)&self->ySample[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 6];
  v10[4] = *(_OWORD *)&self->xSample[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 14];
  v10[5] = v6;
  long long v7 = *(_OWORD *)&self->maskedSample[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 14];
  v10[6] = *(_OWORD *)&self->ySample[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 22];
  v10[7] = v7;
  long long v8 = *(_OWORD *)&self->previousAudiogram[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 6];
  v10[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2);
  v10[1] = v8;
  long long v9 = *(_OWORD *)&self->theta[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 6];
  v10[2] = *(_OWORD *)&self->maskingMatrix[OBJC_IVAR____TtC11HearingTest12HTAudiometry_metricsV2 + 6];
  v10[3] = v9;
  sub_2512F4AD4((uint64_t)v10);
}

@end