@interface CalDAVConcreteServerVersion
+ (id)prototypes;
- (NSRegularExpression)regularExpression;
- (void)setRegularExpression:(id)a3;
@end

@implementation CalDAVConcreteServerVersion

+ (id)prototypes
{
  if (prototypes_onceToken != -1) {
    dispatch_once(&prototypes_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_calDAVServerVersionPrototypes;
  return v2;
}

uint64_t __41__CalDAVConcreteServerVersion_prototypes__block_invoke()
{
  v0 = objc_alloc_init(CalDAVConcreteServerVersion);
  v1 = (void *)_unknownServerVersionPrototype;
  _unknownServerVersionPrototype = (uint64_t)v0;

  v2 = objc_alloc_init(CalendarServerVersion);
  v3 = (void *)_calendarServerVersionPrototype;
  _calendarServerVersionPrototype = (uint64_t)v2;

  v4 = objc_alloc_init(GoogleCalDAVServerVersion);
  v5 = (void *)_googleServerVersionPrototype;
  _googleServerVersionPrototype = (uint64_t)v4;

  v6 = objc_alloc_init(YahooCalDAVServerVersion);
  v7 = (void *)_yahooServerVersionPrototype;
  _yahooServerVersionPrototype = (uint64_t)v6;

  v8 = objc_alloc_init(MobileMeCalDAVServerVersion);
  v9 = (void *)_mmeServerVersionPrototype;
  _mmeServerVersionPrototype = (uint64_t)v8;

  v10 = objc_alloc_init(iCloudCalDAVServerVersion);
  v11 = (void *)_icloudServerVersionPrototype;
  _icloudServerVersionPrototype = (uint64_t)v10;

  v12 = objc_alloc_init(OracleBeehiveCalDAVServerVersion);
  v13 = (void *)_oracleBeehiveServerVersionPrototype;
  _oracleBeehiveServerVersionPrototype = (uint64_t)v12;

  id v14 = objc_alloc(MEMORY[0x263EFF8C0]);
  _calDAVServerVersionPrototypes = objc_msgSend(v14, "initWithObjects:", _calendarServerVersionPrototype, _googleServerVersionPrototype, _yahooServerVersionPrototype, _mmeServerVersionPrototype, _icloudServerVersionPrototype, _oracleBeehiveServerVersionPrototype, _unknownServerVersionPrototype, 0);
  return MEMORY[0x270F9A758]();
}

- (NSRegularExpression)regularExpression
{
  return self->_regularExpression;
}

- (void)setRegularExpression:(id)a3
{
}

- (void).cxx_destruct
{
}

@end