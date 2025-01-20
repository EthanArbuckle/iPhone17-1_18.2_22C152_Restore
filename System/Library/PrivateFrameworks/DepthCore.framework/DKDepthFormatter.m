@interface DKDepthFormatter
- (DKDepthFormatter)init;
@end

@implementation DKDepthFormatter

- (DKDepthFormatter)init
{
  result = (DKDepthFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 72];
  v8[6] = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 56];
  v8[7] = v3;
  long long v4 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 104];
  v8[8] = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 88];
  v8[9] = v4;
  long long v5 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 8];
  v8[2] = *(_OWORD *)&self->depthIntegerMeasurementFormatter[OBJC_IVAR___DKDepthFormatter_configuration];
  v8[3] = v5;
  long long v6 = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 40];
  v8[4] = *(_OWORD *)&self->configuration[OBJC_IVAR___DKDepthFormatter_configuration + 24];
  v8[5] = v6;
  long long v7 = *(_OWORD *)&self->depthMeasurementFormatter[OBJC_IVAR___DKDepthFormatter_configuration];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___DKDepthFormatter_configuration);
  v8[1] = v7;
  sub_24CAA5CD0((uint64_t)v8, (void (*)(void, void, void, void))sub_24CAA5D50, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24CAA5D68);

  sub_24CAA897C((uint64_t)self + OBJC_IVAR___DKDepthFormatter____lazy_storage___decimalDigitsAndPunctuationSet);
}

@end