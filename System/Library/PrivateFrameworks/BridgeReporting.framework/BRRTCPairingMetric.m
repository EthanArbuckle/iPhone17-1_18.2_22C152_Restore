@interface BRRTCPairingMetric
- (BRRTCPairingMetric)initWithPairingBeginsType:(unint64_t)a3;
- (NSMutableDictionary)metricDict;
- (NSNumber)subreasonCode;
- (id)dictionaryRepresentation;
- (unint64_t)pairingBeginsType;
- (unsigned)rtcType;
- (void)addPairingTimeEventToMetricDict:(id)a3 withValue:(id)a4;
- (void)addPairingTimePerformanceEventToMetricDict:(id)a3 withTime:(id)a4;
- (void)setMetricDict:(id)a3;
- (void)setPairingBeginsType:(unint64_t)a3;
- (void)setRtcType:(unsigned __int16)a3;
- (void)setSubreasonCode:(id)a3;
@end

@implementation BRRTCPairingMetric

- (BRRTCPairingMetric)initWithPairingBeginsType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BRRTCPairingMetric;
  v4 = [(BRRTCPairingMetric *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(BRRTCPairingMetric *)v4 setPairingBeginsType:a3];
    v6 = objc_opt_new();
    [(BRRTCPairingMetric *)v5 setMetricDict:v6];
  }
  return v5;
}

- (void)addPairingTimeEventToMetricDict:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BRRTCPairingMetric *)self metricDict];
  [v8 setObject:v6 forKey:v7];
}

- (void)addPairingTimePerformanceEventToMetricDict:(id)a3 withTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BRRTCPairingMetric *)self metricDict];
  [v8 setObject:v6 forKey:v7];
}

- (id)dictionaryRepresentation
{
  v3 = [(BRRTCPairingMetric *)self metricDict];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[BRRTCPairingMetric pairingBeginsType](self, "pairingBeginsType"));
  [v3 setObject:v4 forKey:@"PairingBeginsType"];

  v5 = [(BRRTCPairingMetric *)self subreasonCode];

  if (v5)
  {
    id v6 = [(BRRTCPairingMetric *)self subreasonCode];
    [v3 setObject:v6 forKey:@"NRSubreason"];
  }

  return v3;
}

- (unint64_t)pairingBeginsType
{
  return self->_pairingBeginsType;
}

- (void)setPairingBeginsType:(unint64_t)a3
{
  self->_pairingBeginsType = a3;
}

- (unsigned)rtcType
{
  return self->_rtcType;
}

- (void)setRtcType:(unsigned __int16)a3
{
  self->_rtcType = a3;
}

- (NSNumber)subreasonCode
{
  return self->_subreasonCode;
}

- (void)setSubreasonCode:(id)a3
{
  self->_subreasonCode = (NSNumber *)a3;
}

- (NSMutableDictionary)metricDict
{
  return self->_metricDict;
}

- (void)setMetricDict:(id)a3
{
}

- (void).cxx_destruct
{
}

@end