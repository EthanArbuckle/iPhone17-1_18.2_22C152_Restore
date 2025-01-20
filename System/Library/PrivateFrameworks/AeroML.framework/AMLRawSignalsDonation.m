@interface AMLRawSignalsDonation
+ (BOOL)supportsSecureCoding;
- (AMLRawSignalsConfiguration)rawSignalsConfiguration;
- (AMLRawSignalsDonation)init;
- (AMLRawSignalsDonation)initWithCoder:(id)a3;
- (AMLRawSignalsDonation)initWithRawSignalsConfiguration:(id)a3;
- (NSString)description;
- (id)copyWithZone:(void *)a3;
- (id)donateRawSignals:(id)a3 metadata:(id)a4 completionBlock:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setRawSignalsConfiguration:(id)a3;
@end

@implementation AMLRawSignalsDonation

- (AMLRawSignalsConfiguration)rawSignalsConfiguration
{
  id v2 = sub_2477B8FB8();

  return (AMLRawSignalsConfiguration *)v2;
}

- (void)setRawSignalsConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2477B9020((uint64_t)v4);
}

- (AMLRawSignalsDonation)initWithRawSignalsConfiguration:(id)a3
{
  return (AMLRawSignalsDonation *)AMLRawSignalsDonation.init(rawSignalsConfiguration:)((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_2477B9180(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr))AMLRawSignalsDonation.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  AMLRawSignalsDonation.encode(with:)((NSCoder)v4);
}

- (AMLRawSignalsDonation)initWithCoder:(id)a3
{
  return (AMLRawSignalsDonation *)AMLRawSignalsDonation.init(coder:)(a3);
}

- (id)donateRawSignals:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = sub_24777C1A8;
  }
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_2477B99E4();
  sub_24777C034((uint64_t)v7);
  swift_unknownObjectRelease();

  return v10;
}

- (AMLRawSignalsDonation)init
{
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration);
  uint64_t v4 = *(void *)&self->rawSignalsConfiguration[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration];
  v5 = *(void **)&self->$__lazy_storage_$_indexSignalsConfiguration[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration];

  sub_24777BF3C(v3, v4, v5);
}

- (NSString)description
{
  return (NSString *)sub_2477BB9E8(self, (uint64_t)a2, (void (*)(void))AMLRawSignalsDonation.description.getter);
}

@end