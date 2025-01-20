@interface DTSysmonRecordEnumerator
- (DTSysmonRecordEnumerator)initWithHeartbeatTime:(unint64_t)a3;
- (DTSysmonTapRecordDecoder)recordDecoder;
- (NSArray)samples;
- (unint64_t)enumerateRecordsWithBlock:(id)a3;
- (void)setRecordDecoder:(id)a3;
- (void)setSamples:(id)a3;
@end

@implementation DTSysmonRecordEnumerator

- (DTSysmonRecordEnumerator)initWithHeartbeatTime:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DTSysmonRecordEnumerator;
  result = [(DTSysmonRecordEnumerator *)&v5 init];
  if (result) {
    result->_heartbeatTime = a3;
  }
  return result;
}

- (unint64_t)enumerateRecordsWithBlock:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = 0;
  samples = self->_samples;
  if (samples)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2308954F0;
    v9[3] = &unk_264B8E028;
    v11 = &v12;
    v9[4] = self;
    id v10 = v4;
    [(NSArray *)samples enumerateObjectsUsingBlock:v9];

    unint64_t heartbeatTime = v13[3];
  }
  else
  {
    unint64_t heartbeatTime = self->_heartbeatTime;
    unint64_t v15 = heartbeatTime;
  }
  _Block_object_dispose(&v12, 8);

  return heartbeatTime;
}

- (DTSysmonTapRecordDecoder)recordDecoder
{
  return self->_recordDecoder;
}

- (void)setRecordDecoder:(id)a3
{
}

- (NSArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_recordDecoder, 0);
}

@end